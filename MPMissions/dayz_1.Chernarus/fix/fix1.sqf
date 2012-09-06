/***********************************************************
ASSIGN DAMAGE TO A UNIT
- Function object_damage
- [unit, selectionName, damage, source, projectile] call object_damage;
************************************************************/
private["_unit","_selection","_strH","_dam","_total"];
_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;

if ( (_selection != "") ) then {
        _strH = "hit_" + (_selection);
} else {
        _strH = "totalDmg";
   };
if (_damage > 0.98) then {
        _damage = 1;
};
if ( _damage>0 ) then {
        _unit setVariable [_strH,_damage,true];
        dayzUpdateVehicle = [_unit,"damage"];
        if (isServer) then {
                if (allowConnection) then {
                        dayzUpdateVehicle call server_updateObject;
                };
        } else {
                publicVariable "dayzUpdateVehicle";
        };
};
_damage