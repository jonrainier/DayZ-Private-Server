/***********************************************************
ASSIGN DAMAGE HANDLER TO A UNIT
- Function
- [unit] call fnc_usec_damageHandle;
************************************************************/
private["_unit","_eh1","_eh2","_dir","_location"];
_unit = _this;
_dir = getdir _this;
_location = getPosATL _this;

//Assign event handlers
// no need to check locality, it always local
_eh1 = _unit addEventHandler ["HandleDamage",{ _this call fnc_usec_damageVehicle }];
// remove killed Handler, otherwise killed vehicle just dissapears
if (isServer) then {
        // when player getout - save vehicle.
        _eh3 = _unit addEventHandler ["GetOut", {[(_this select 0),"all"] call server_updateObject;}];
};