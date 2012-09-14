/*
hook for player_fillWater
item spawn player_fillWater;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_fillWater_orig };
