/*
hook for player_drink
item spawn player_drink;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_drink_orig };
