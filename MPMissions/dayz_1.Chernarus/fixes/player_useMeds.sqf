/*
hook for player_useMeds
item spawn player_useMeds;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_useMeds_orig };
