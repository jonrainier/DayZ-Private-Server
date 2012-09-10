/*
hook for player_tentPitch
item spawn player_tentPitch;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_tentPitch_orig };
