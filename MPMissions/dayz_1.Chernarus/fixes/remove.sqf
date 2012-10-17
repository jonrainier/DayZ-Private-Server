private["_obj","_dir","_pos"];
_obj 		= _this select 3;
_dir 		= direction _obj;
_pos 		= getposATL _obj;
_objectID 	= _obj getVariable ["ObjectID","0"];
_objectUID	= _obj getVariable ["ObjectUID","0"];

diag_log format["DEBUG: _this=%1",_this];

player playActionNow "Medic";
sleep 1;
[player,"repair",0,false] call dayz_zombieSpeak;
_id = [player,50,true,(getPosATL player)] spawn player_alertZombies;
sleep 5;
	
dayzDeleteObj = [_dir,_pos,_objectID,_objectUID];
publicVariable "dayzDeleteObj";
if (isServer) then {
	dayzDeleteObj call local_deleteObj;
};

deleteVehicle _obj;