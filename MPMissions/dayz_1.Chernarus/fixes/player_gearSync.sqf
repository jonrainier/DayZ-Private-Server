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
dayz_myBackpack = unitBackpack player;
_backpackWpn = getWeaponCargo dayz_myBackpack;
_backpackMag = getMagazineCargo dayz_myBackpack;

playerBackPack = [player,_backpackWpn,_backpackMag];
publicVariableServer "playerBackPack";

_this call player_gearSync_orig;
