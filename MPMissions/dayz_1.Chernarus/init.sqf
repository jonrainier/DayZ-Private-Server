startLoadingScreen ["","DayZ_loadingScreen"];
/*	
	INITILIZATION
*/
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_hivePipe1 = 	"\\.\pipe\dayz";	//The named pipe
dayZ_instance =	222;					//The instance
hiveInUse	=	true;
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if ((!isServer) && (isNull player) ) then
{
waitUntil {!isNull player};
waitUntil {time > 3};
};

if ((!isServer) && (player != player)) then
{
  waitUntil {player == player};
  waitUntil {time > 3};
};

object_setHitServer = compile preprocessFileLineNumbers "fix\object_setHitServer.sqf";
fnc_vehicleEventHandler = compile preprocessFileLineNumbers "fix\vehicle_init.sqf";

if (isServer) then {
	//Run the server monitor
	//_id = ["Volha_1_TK_CIV_EP1",getMarkerPos "carloc",0] spawn object_spawnDamVehicle;
	hiveInUse	=	true;
	_serverMonitor = 	[] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	0 cutText [(localize "STR_AUTHENTICATING"), "BLACK FADED",60];
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	
	//EXTRAS
	
	 _deadbody = allMissionObjects "Body1" + allMissionObjects "Body2";
    {
        dayzFire = [_x,2,0,false,false];
        nul=dayzFire spawn BIS_Effects_Burn;
    } forEach _heliCrash;
	
	[] spawn {
        while { true } do 
          {
                _deadbody = allMissionObjects "Body1" + allMissionObjects "Body2";
                if ( (count _deadbody) > 0 ) then
                { 
                        { deleteVehicle _x } foreach (_deadbody);
                };
                sleep 15;
          };
        };
        {
//      set EH for every player
         _x call fnc_vehicleEventHandler;

// remove logging after testing!!!
         diag_log format["DEBUG: set EH for vehicle: %1",typeof _x];
        } forEach vehicles;
};