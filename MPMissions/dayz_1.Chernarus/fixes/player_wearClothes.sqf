/*
hook for player_wearClothes
item spawn player_wearClothes;
*/
private "_item";
_item = _this;
if (_item in (magazines player) ) then { _item spawn player_wearClothes_orig };
