/*
hook for player_build
item spawn player_build; 
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_build_orig };
