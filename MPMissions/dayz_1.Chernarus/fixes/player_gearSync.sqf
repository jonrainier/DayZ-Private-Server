/*
hook for player_gearSync
call player_gearSync;
save all vehicles given type when gear dialog close. (idea by bliss)
*/
private ["_objects"];
_objects = nearestObjects [getPosATL player, ["Car", "Helicopter", "Motorcycle", "Ship", "TentStorage"], 10];
{
	dayzUpdateVehicle = [_x,"all"];
	publicVariable "dayzUpdateVehicle";
} foreach _objects;

private ["_backpackWpnQtys","_backpackWpnTypes","_backpackWpn","_backpackMag","_countr"];
_backpackWpn = getWeaponCargo unitBackpack player;
_backpackMag = getMagazineCargo unitBackpack player;

clearWeaponCargoGlobal unitBackpack player;
clearMagazineCargoGlobal unitBackpack player;

//Fill backpack contents
//Weapons
_backpackWpnTypes = [];
_backpackWpnQtys = [];
if (count _backpackWpn > 0) then {
	_backpackWpnTypes = _backpackWpn select 0;
	_backpackWpnQtys = 	_backpackWpn select 1;
};
_countr = 0;
{
	dayz_myBackpack addWeaponCargoGlobal [_x,(_backpackWpnQtys select _countr)];
	_countr = _countr + 1;
} forEach _backpackWpnTypes;
//magazines
_backpackmagTypes = [];
_backpackmagQtys = [];
if (count _backpackmag > 0) then {
	_backpackmagTypes = _backpackMag select 0;
	_backpackmagQtys = 	_backpackMag select 1;
};
_countr = 0;
{
	dayz_myBackpack addmagazineCargoGlobal [_x,(_backpackmagQtys select _countr)];
	_countr = _countr + 1;
} forEach _backpackmagTypes;

call player_gearSync_orig;
