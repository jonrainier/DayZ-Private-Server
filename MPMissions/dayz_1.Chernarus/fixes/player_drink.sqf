/*
hook for player_drink
item spawn player_drink;
*/
private ["_item","_isInVehicle"];
_item = _this;
_isInVehicle = 	vehicle player != player;
if ( (_item in (magazines player)) && !_isInVehicle ) then { _item spawn player_drink_orig };
