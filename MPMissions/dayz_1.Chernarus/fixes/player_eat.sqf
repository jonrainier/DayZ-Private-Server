/*
hook for player_eat
item spawn player_eat;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_eat_orig };
