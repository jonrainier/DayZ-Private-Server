/***********************************************************
ASSIGN DAMAGE TO A UNIT
- Function set_obj_dmg
- [unit, selectionName, damage, source, projectile] call set_obj_dmg;
************************************************************/
private["_unit","_selection","_strH","_dam","_total","_damage"];
_unit = _this select 0;
_selection = _this select 1;
_total = _this select 2;
_dam = damage _unit;

if ( (_selection != "") ) then {
        _strH = "hit_" + (_selection);
} else {
        _strH = "totalDmg";
   };
if (_total > 0.98) then {
        _total = 1;
};
if ( _total>0 ) then {
        _unit setVariable [_strH,_total,true];
        dayzUpdateVehicle = [_unit,"damage"];
        if (isServer) then {
                if (allowConnection) then {
                        dayzUpdateVehicle call server_updateObject;
                };
        } else {
                publicVariable "dayzUpdateVehicle";
        };
};
_total