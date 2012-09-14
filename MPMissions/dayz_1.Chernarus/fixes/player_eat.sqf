/*
hook for player_eat
item spawn player_eat;
*/
private ["_item","_isInVehicle"];
_item = _this;
_isInVehicle = 	vehicle player != player;
if ( (_item in (magazines player)) && !_isInVehicle ) then { _item spawn player_eat_orig };
