/*	
	INITILIZATION
*/
startLoadingScreen ["","DayZ_loadingScreen"];
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

// reassign functions
// call compile preprocessFileLineNumbers "fixes\_fixes.sqf";
// damage eventhanling
set_obj_dmg = compile preprocessFileLineNumbers "fixes\set_obj_dmg.sqf";
fnc_vehicleEventHandler = compile preprocessFileLineNumbers "fixes\vehicle_init.sqf";
// action hooks
player_build = compile preprocessFileLineNumbers "fixes\player_build.sqf";
player_drink = compile preprocessFileLineNumbers "fixes\player_drink.sqf";
player_eat = compile preprocessFileLineNumbers "fixes\player_eat.sqf";
player_useMeds = compile preprocessFileLineNumbers "fixes\player_useMeds.sqf";
player_wearClothes = compile preprocessFileLineNumbers "fixes\player_wearClothes.sqf";
player_tentPitch = compile preprocessFileLineNumbers "fixes\tent_pitch.sqf";
player_fillWater = compile preprocessFileLineNumbers "fixes\water_fill.sqf";
player_switchModel = compile preprocessFileLineNumbers "fixes\player_switchModel.sqf";
// other hooks
player_gearSync = compile preprocessFileLineNumbers "fixes\player_gearSync.sqf";
player_humanityMorph = compile preprocessFileLineNumbers "fixes\player_humanityMorph.sqf";
player_updateGui = compile preprocessFileLineNumbers "fixes\player_updateGui.sqf";
// count player magazines
player_countmagazines = compile preprocessFileLineNumbers "fixes\player_countmagazines.sqf";
// original function
player_build_orig 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_build.sqf";
player_drink_orig 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_drink.sqf";
player_eat_orig		= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_eat.sqf";
player_useMeds_orig	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_useMeds.sqf";
player_wearClothes_orig	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_wearClothes.sqf";
player_tentPitch_orig	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\tent_pitch.sqf";
player_fillWater_orig 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\water_fill.sqf";
player_gearSync_orig 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_gearSync.sqf";
// player_reloadMag 	= compile preprocessFileLineNumbers "\z\addons\dayz_code\actions\player_reloadMags.sqf";

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

// 	need wait for creation all vehicles, when first player join.
	waituntil{_cnt=count allMissionObjects "UH1Wreck_DZ";_cnt==5};
	_heliCrash = allmissionobjects "UH1Wreck_DZ";
	{
	  dayzFire = [_x,2,0,false,false];
	  nul=dayzFire spawn BIS_Effects_Burn;
//	  diag_log format["DEBUG: %1 [%2]",typeOf _x,mapGridPosition (position _x)];
	} forEach _heliCrash;

	{
//	set EH for every player
	 _x call fnc_vehicleEventHandler;;
	} forEach vehicles;

};

