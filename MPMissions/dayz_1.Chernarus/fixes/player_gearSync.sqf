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
call player_gearSync_orig;
