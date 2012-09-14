/*
fix for debug monitor
*/
private["_display","_ctrlBlood","_bloodVal","_ctrlFood","_ctrlThirst","_foodVal","_ctrlTemp","_tempVal","_array"];
disableSerialization;

_foodVal = 		1 - (dayz_hunger / SleepFood);
_thirstVal = 	1 - (dayz_thirst / SleepWater);
_tempVal 	= 	(dayz_temperatur / dayz_temperaturnormal);	//TeeChange

if (uiNamespace getVariable ['DZ_displayUI', 0] == 2) exitWith {
	_array = [_foodVal,_thirstVal];
	_array
};

_display = uiNamespace getVariable 'DAYZ_GUI_display';

_ctrlBlood = 	_display displayCtrl 1300;
_ctrlBleed = 	_display displayCtrl 1303;
_bloodVal =		r_player_blood / r_player_bloodTotal;
_ctrlFood = 	_display displayCtrl 1301;
_ctrlThirst = 	_display displayCtrl 1302;
_ctrlTemp 	= 	_display displayCtrl 1306;					//TeeChange
_ctrlEar = 		_display displayCtrl 1304;
_ctrlEye = 		_display displayCtrl 1305;
_ctrlHumanity = _display displayCtrl 1207;
_ctrlFracture = 	_display displayCtrl 1203;

//Food/Water/Blood
_ctrlBlood ctrlSetTextColor 	[(Dayz_GUI_R + (0.3 * (1-_bloodVal))),(Dayz_GUI_G * _bloodVal),(Dayz_GUI_B * _bloodVal), 0.5];
_ctrlFood ctrlSetTextColor 		[(Dayz_GUI_R + (0.3 * (1-_foodVal))),(Dayz_GUI_G * _foodVal),(Dayz_GUI_B * _foodVal), 0.5];
_ctrlThirst ctrlSetTextColor 	[(Dayz_GUI_R + (0.3 * (1-_thirstVal))),(Dayz_GUI_G * _thirstVal),(Dayz_GUI_B * _thirstVal), 0.5];
_ctrlTemp ctrlSetTextColor 		[(Dayz_GUI_R + (0.3 * _tempVal)),(Dayz_GUI_G * _tempVal),(Dayz_GUI_B + (0.25 * (1/_tempVal))), 0.5];	//TeeChange Coulor should change into red if value is higher as normale temp and into blue if coulor is lower as normal temp
/*
// temp color correction added by Antithasys
_tempColorR = 0;
_tempColorG = 0;
_tempColorB = 0;
if(_tempVal > 1.0) then {
	_tempColorR = Dayz_GUI_R + (0.3 * (dayz_temperatur - dayz_temperaturnormal)/6);
	_tempColorG = Dayz_GUI_G - (Dayz_GUI_G * (dayz_temperatur - dayz_temperaturnormal)/6);
	_tempColorB = Dayz_GUI_B - (Dayz_GUI_B * (dayz_temperatur - dayz_temperaturnormal)/6);
} else {
	if (_tempVal == 1) then {
		_tempColorR = Dayz_GUI_R;
		_tempColorG = Dayz_GUI_G;
		_tempColorB = Dayz_GUI_B;
	} else {
		_tempColorR = Dayz_GUI_R - (Dayz_GUI_R * (dayz_temperaturnormal - dayz_temperatur)/9);
		_tempColorG = Dayz_GUI_G - (Dayz_GUI_G * (dayz_temperaturnormal - dayz_temperatur)/9);
		_tempColorB = Dayz_GUI_B + (0.42 * (dayz_temperaturnormal - dayz_temperatur)/9);
	};
};
_ctrlTemp ctrlSetTextColor		[_tempColorR, _tempColorG, _tempColorB, 0.5];
*/
_visualtext = "";
_visual = round((dayz_disVisual / 100) * 4) min 5;
if (_visual > 0) then {_visualtext = "\z\addons\dayz_code\gui\val_" + str(_visual) + "_ca.paa"};

_audibletext = "";
_audible = round((dayz_disAudial / 50) * 4) min 5;
if (_audible > 0) then {_audibletext = "\z\addons\dayz_code\gui\val_" + str(_audible) + "_ca.paa"};

_ctrlEye ctrlSetText _visualtext;
_ctrlEar ctrlSetText _audibletext;

if (_bloodVal < 0.2) then {
	_ctrlBlood call player_guiControlFlash;
};

if (_thirstVal < 0.2) then {
	_ctrlThirst call player_guiControlFlash;
	/*
	if (_thirstVal <= 0) then {
		r_player_dead = true;
		player setVariable["USEC_isDead",true,true];
	};
	*/
};

if (_foodVal < 0.2) then {
	_ctrlFood call player_guiControlFlash;
	/*
	if (_foodVal <= 0) then {
		r_player_dead = true;
		player setVariable["USEC_isDead",true,true];
	};
	*/
};

//if (_tempVal < 0.833 || _tempVal > 1.083) then {	//TeeChange
if (_tempVal < 0.833) then {	//TeeChange
	_ctrlTemp call player_guiControlFlash;
};

if (r_player_injured) then {
	_ctrlBleed call player_guiControlFlash;
};

if (!canStand player) then {
	if (!(ctrlShown _ctrlFracture)) then {
		r_fracture_legs = true;
		_ctrlFracture ctrlShow true;
		//_id = true spawn dayz_disableRespawn;
	};
};

_array = [_foodVal,_thirstVal];
_array