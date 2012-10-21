/*
count player magazines with ammo count
value = call player_countmagazines;
return all player magazines with ammo count
(code from dayz_forceSave)
*/
private ["_dialog","_control","_magazineArray","_item","_val","_max"];
disableSerialization;
disableUserInput true;
_dialog = findDisplay 106;
if ( isNull _dialog ) then { 
	createGearDialog [player, "RscDisplayGear"]; 
	_dialog = findDisplay 106;
};

_magazineArray = 	[];
for "_i" from 109 to 120 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,_item];
		};
	};
};

for "_i" from 122 to 129 do 
{
	_control = 	_dialog displayCtrl _i;
	_item = 	gearSlotData _control;
	_val =		gearSlotAmmoCount _control;
	_max = 		getNumber (configFile >> "CfgMagazines" >> _item >> "count");
	if (_item != "") then {
		if (_val != _max) then {
			_magazineArray set [count _magazineArray,[_item,_val]];
		} else {
			_magazineArray set [count _magazineArray,_item];
		};
	};
};
disableUserInput false;
dayz_Magazines=_magazineArray;
_magazineArray
