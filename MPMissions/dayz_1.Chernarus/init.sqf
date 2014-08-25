//Server Settings

//Add the insttance id  of this server 
dayZ_instance = 1; // The instance
//Tag info this is shown to all players in the bottom left hand side of the screen 
dayZ_serverName = "@Pwnoz0r"; // Servername (country code + server number)


//Gamesettings
dayz_antihack = 0; // DayZ Antihack / 1 = enabled // 0 = disabled
dayz_REsec = 1; // DayZ RE Security / 1 = enabled // 0 = disabled
dayz_enableGhosting = true; //Enable disable the ghosting system.
dayz_ghostTimer = 120; //Sets how long in seconds a player must be dissconnected before being able to login again.
dayz_spawnselection = 1; //Turn on spawn selection 0 = random only spawns, 1 = Spawn choice based on limits
dayz_spawncarepkgs_clutterCutter = 0; //0 =  loot hidden in grass, 1 = loot lifted and 2 = no grass
dayz_spawnCrashSite_clutterCutter = 0;	// heli crash options 0 =  loot hidden in grass, 1 = loot lifted and 2 = no grass
dayz_spawnInfectedSite_clutterCutter = 0; // infected base spawn... 0: loot hidden in grass, 1: loot lifted, 2: no grass 
dayz_enableRules = true; //Enables a nice little news/rules feed on player login (make sure to keep the lists quick).
dayz_quickSwitch = false; //Turns on forced animation for weapon switch. (hotkeys 1,2,3) False = enable animations, True = disable animations
dayz_bleedingeffect = 3; //1= blood on the ground, 2= partical effect, 3 = both.
dayz_ForcefullmoonNights = false; // Forces night time to be full moon.

dayz_serversideloot = false;
dayz_previousID = 0;

// DO NOT EDIT BELOW HERE //

if (!isDedicated) then {
	if (dayz_enableRules) then {
		_void = [] execVM "rules.sqf";
	};
};

startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

initialized = false;
dayzHiveRequest = [];
dayz_previousID = 0;
0 fadeSound 0;
//disable greeting menu
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen


//Load in compiled functions
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";				//Initilize the Variables (IMPORTANT: Must happen very early)
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";					//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";					//Compile regular functions
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

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

if (isServer) then {
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
	
	if (dayz_POIs) then {	
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\DevilsFarm.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\NEA.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\C130Crash.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\ChernoBuildings.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\DeadForest.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\KomyshovoRoadblock.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\MilitaryAirpoort.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\ZelenogorskBuildings.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\poi\Twains.sqf";
	};
	
	if (dayz_infectiousWaterholes) then {
		[] execVM "\z\addons\dayz_code\system\mission\chernarus\infectiousWaterholes\init.sqf";
	};
	
	
	"PVDZ_sec_atp" addPublicVariableEventHandler { 
		_x = _this select 1;
		if (typeName _x == "STRING") then {
			diag_log _x;
		}
		else {
			_unit = _x select 0;
			_source = _x select 1;
			if (((!(isNil {_source})) AND {(!(isNull _source))}) AND {((_source isKindOf "CAManBase") AND {(owner _unit != owner _source)})}) then {
				diag_log format ["P1ayer %1 hit by %2 %3 from %4 meters",
					_unit call fa_plr2Str,  _source call fa_plr2Str, _x select 2, _x select 3];
				if (_unit getVariable["processedDeath", 0] == 0) then {
					_unit setVariable [ "attacker", name _source ];
					_unit setVariable [ "noatlf4", diag_ticktime ]; // server-side "not in combat" test, if player is not already dead
				};
			};
		};
	};
};

if (!isDedicated) then {
	//Conduct map operations
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");

	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = [] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	if (dayz_antihack == 1) then {
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";
	};
};

// Logo watermark: adding a logo in the bottom left corner of the screen with the server name in it
if (!isNil "dayZ_serverName") then {
	[] spawn {
		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		waituntil {!(isNull (findDisplay 46))};
		5 cutRsc ["wm_disp","PLAIN"];
		((uiNamespace getVariable "wm_disp") displayCtrl 1) ctrlSetText dayZ_serverName;
	};
};

if (dayz_REsec == 1) then {
#include "\z\addons\dayz_code\system\REsec.sqf"
};

