/***********************************************************
ASSIGN DAMAGE TO A UNIT
- Function
- [unit, selectionName, damage, source, projectile]
************************************************************/
private["_unit","_selection","_strH","_dam","_total"];
_unit = _this select 0;
_selection = _this select 1;
_damage = _this select 2;
_total = _damage;

 if ( (_selection != "" && _selection != "?") ) then {
        _strH = "hit_" + (_selection);
        _dam = _unit getVariable [_strH,0];
 } else {
        _strH = "totalDmg";
        _dam = damage _unit;
   };
        _total = _dam + _damage;
        if (_total > 1) then {
                _total = 1;
        };
if ( _damage>0 ) then {
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
_damage