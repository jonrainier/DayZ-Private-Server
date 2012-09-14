/***********************************************************
ASSIGN DAMAGE HANDLER TO A UNIT
- Function set_EH
- unit call set_EH;
************************************************************/
private["_unit","_eh1","_eh2","_dir","_location"];
_unit = _this;
_dir = getdir _this;
_location = getPosATL _this;

//Assign event handlers
_eh1 = _unit addEventHandler ["HandleDamage",{ _this call set_obj_dmg }];
// diag_log format ["set EH %1 for vehicle:%2", _eh1, typeOf _unit ];

if (isServer) then {
        // when player getout - save vehicle.
        _eh2 = _unit addEventHandler ["GetOut", {[(_this select 0),"all"] call server_updateObject;}];
};
