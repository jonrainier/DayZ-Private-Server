//=================================================================================
// GCam 2.0
//
// Battle observation / Unit action pursuit camera script by Gigan
//
// Execute GCam
// handle = [ Unit ] execVM "gcam\gcam.sqf";
//
// This camera script needs "gcam_component.hpp" for mission editing.
// Include "gcam_component.hpp" to "description.ext".
//
// GCam Kill Command
// When GCamKill = true, GCam quits immediately.
//
//=================================================================================
// KEYBINDS
//
// - Common Operation -
// W,A,S,D,Q,Z,2,X                 : Camera Move
// Mouse Move                      : Camera Turn
// Mouse Drag (list opend)         : Camera Turn
// Mouse Wheel                     : Camera Zoom
// Mouse L Click                   : Switch Screen Centered Unit
// Mouse R Click                   : Zoom Default
// Cursor Up/Down (list closed)    : Switch Unit in Group
// Cursor Left/Right (list closed) : Switch Group
// L                               : Unit List and Search Map
// N                               : Night / Thermal Vision
// B                               : Toggle Behind Mode
// F                               : Toggle Follow Mode
// C                               : Toggle Focus Mode
// T                               : Toggle Firing and Ejection Trigger
// V                               : Change Camera View Mode
// Space                           : Quit
//
// - Search Map Operation -
// Mouse L Click                : Scan and Show Nearby Groups
// Mouse L Click (on marker)      : Switch Unit
//
//=================================================================================

#include "gcam_config.hpp"
#include "config.hpp"

_isAdmin=(serverCommandAvailable"#kick");
_uid = (getPlayerUID vehicle player);
if ((_isAdmin) && ((_uid) in ADMINS)) then
{

_helptext =
"- GCam Controls -

W, A, S, D, Q, Z, 2, X : Camera Move
Mouse Move, Drag (list opend) : Camera Turn
Mouse Wheel : Camera Zoom
Mouse L Click : Switch Screen Centered Unit
Mouse R Click : Zoom Default
Cursor Up/Down (list closed) : Switch Unit in Group
Cursor Left/Right (list closed) : Switch Group
L : Unit List and Search Map
N : Night / Thermal Vision
B : Toggle Behind Mode
F : Toggle Follow Mode
C : Toggle Focus Mode
T : Toggle Firing and Ejection Trigger
V : Change Camera View Mode
Space : Quit

- Search Map -
Mouse L Click : Scan and Show Nearby Groups
Mouse L Click (on marker) : Switch Unit";

if (isNil "GCamKill") then { GCamKill = false };

GCam_KD = [controlNull,-1,false,false,false];
GCam_KU = [controlNull,-1,false,false,false];
GCam_MD = [controlNull,-1,0.5,0.5,false,false,false];
GCam_MU = [controlNull,-1,0.5,0.5,false,false,false];
GCam_MM = [controlNull,0.0,0.0];
GCam_MW = [controlNull,0];

GCam_MC = false;
GCam_MCP = [0.0,0.0,0.0];

GCam_LSC = [0,-1];

GCam_B = false;
GCam_BId = "";

GCam_T = false;
GCam_Trigger_Fire = false;
GCam_Trigger_Eject = false;
GCam_O = objnull;

GCam_S = false;
GCam_X = 0.0;
GCam_Y = 0.0;

GCam_F = false;

#ifdef PARAMTRACK
	GCam_Com1 = PARAMTRACKINITCODE1;
	GCam_Com2 = PARAMTRACKINITCODE2;
	GCam_Com3 = PARAMTRACKINITCODE3;
	GCam_Com4 = PARAMTRACKINITCODE4;
#endif

_l = true;
_quit = false;
_quitchk = true;
_w = accTime / (diag_fps * 2);

_o = objnull;
_o_l = objnull;
_c = objnull;
_dr = 0.0;
_dv = 0.0;
_zm = INITCAMZOOM;
_acdr = 0.0;
_acdv = 0.0;
_aczm = 0.0;
_acx = 0.0;
_acy = 0.0;
_acz = 0.0;
_op = getPosATL player;
_cp = [0.0,0.0,0.0];
_cp_r = [0.0,0.0,0.0];
_cfzm = sin((_zm / 1.8) * 90);
camUseNVG false;
_nvg = 0;
_cfalt = 1.0;

_initobject = objnull;
_initcamview = cameraView;
_initacctime = accTime;
_initteamswitch = teamSwitchEnabled;
enableTeamSwitch false;
_help = false;
_mapsize = [INITMAPSIZE,INITMAPSIZE];

_cgk = -1;

_be = INITBEHINDMODE;
_fo = INITFOLLOWMODE;
_fc = INITFOCUSMODE;
_trg = false;

_ehid_keydown = -1;
_ehid_keyup = -1;
_ehid_mousemove = -1;
_ehid_mousezchange = -1;
_ehid_mousebd = -1;
_ehid_mousebu = -1;

_k = [];
_kt = diag_ticktime;
_kte = 0.0;
_kd = -1;
_ku = 0;
_md = -1;
_mu = -1;
_wl = 0.0;
_oc = false;
_ocl = false;
_ocm = false;
_cs_m = false;
_mm = [0.0,0.0];
_acm = accTime^1.5 + 0.007;
_lsc = -1;

_ma_gu = [];
_ma_op = [0.0,0.0,0.0];
_ma_mn = "";
_ma_cf = 1.0;
_ma_mnl = [];
_ma_gmnl = [];
_ma_m = false;
_ma_t = 0.0;
_ma_ol = [];
_ma_st = 0.0;
_ma_sc = false;
_ma_crp =[0.0,0.0];
_ma_c = 0;

_ma_dr = false;
_ma_md = [controlNull,-1,0.0,0.0,false,false,false];
_ma_mu = -1;
_ma_pm = 0.0;
_ma_pb = [0.0,0.0,0.0,0.0];
_ma_pd = [0.0,0.0,0.0,0.0];
_ma_p = [0.0,0.0,0.0,0.0];

_tx_addspace = "";
_tx_crewname = "";

_ol = [];
_og = grpNull;
_so_g = grpNull;
_so_gc = false;
_so_matchobj = objnull;
_so_o = objnull;
_so_firstunit_chkd = false;
_y = [];
_z = [];

_cy_ol_g = [];
_cy_ol = [];
_cy_vl = [];
_cy_n = 0;
_cy_i = 0;
_cy_sn = 0;

_li = false;
_listopening = false;
_li_ol = [];
_li_cnt = 0;
_li_sg = grpNull;

_ma_op = [0.0,0.0,0.0];

_sm_l = false;
_sm_n = 0;
_sm_d = 0.0;
_sm_cp = [0.0,0.0,0.0];
_sm_op = [0.0,0.0,0.0];
_sm_cods = [0.0,0.0,0.0];
_sm_cods_h = 0.0;
_sm_crt = 0.0;
_sm_codv = 0.0;
_sm_dv_d = 0.0;
_sm_cp_t = [0.0,0.0,0.0];
_sm_cp_t_l = [0.0,0.0,0.0];

_re_camobjdir = 0.0;
_re_cp_r_l = [0.0,0.0,0.0];

_fo_objdir = 0.0;
_fo_cods = 0.0;
_fo_cods_z = 0.0;
_fo_camobjdis_last = sqrt(INITCAMDISY^2 + INITCAMDISZ^2);
_fo_camobjdive_last = 0.0;
_fo_camdir_add = 0.0;
_fo_camobjdir_rel_last = 0.0;
_fo_dir_last = 0.0;
_fo_dive_last = 0.0;

_be_crt = 0.0;
_be_odr = 0.0;
_be_odv = 0.0;
_be_odv_mx = 0.0;
_be_cdr_a = 0.0;
_be_cdr_t = 0.0;
_be_cdr_d = 0.0;
_be_codr = 0.0;
_be_codr_t = 0.0;
_be_codr_d = 0.0;
_be_codr_a = 0.0;
_be_cdv_a = 0.0;
_be_codv = 0.0;
_be_codv_t = 0.0;
_be_codv_d = 0.0;
_be_codv_c = 0.0;
_be_codv_r = 0.0;
_be_cods_t = sqrt(INITCAMDISY^2 + INITCAMDISZ^2);
_be_cods = _be_cods_t;
_be_cftn = 0.0;
_be_ofz = 0.0;

_fc_op = [0.0,0.0,0.0];
_fc_cods = 0.0;
_fc_odr = 0.0;
_fc_codr = 0.0;
_fc_codr_d = 0.0;
_fc_codv_d = 0.0;
_fc_cdr_a = 0.0;
_fc_cdv_a = 0.0;
_fc_crt = 0.0;

_cs_ol = [];
_cs_op = [0.0,0.0,0.0];
_cs_sp = [0.0,0.0];
_cs_sds = 0.0;
_cs_change = false;
_cs_ha = 0.0;
_cs_cfha = 0.0;
_cs_hit = false;
_cs_crz = 0.0;
_cs_crt = 0.0;
_cs_bdtime = 0.0;
_cs_ct = 0.0;
_cs_c = 0;
_cs_l = true;

_tr_ehidx = -1;
_tr_ehidx2 = -1;
_tr_chase = false;

_cm_o = objnull;
_cm_op = [0.0,0.0,0.0];
_cm_cp = [0.0,0.0,0.0];
_cm_cp_r = [0.0,0.0,0.0];
_cm_l = false;
_cm_rcvacctime = 0.0;
_cm_return = false;
_cm_listshow = false;
_cm_odv = 0.0;
_cm_odr = 0.0;
_cm_codv = 0.0;
_cm_codv_t = 0.0;
_cm_cods = 0.0;
_cm_codr = 0.0;
_cm_codr_a = 0.0;
_cm_codr_d = 0.0;
_cm_codr_t = 0.0;
_cm_cdr_a = 0.0;
_cm_cdr_d = 0.0;
_cm_cdr_t = 0.0;
_cm_cdv_a = 0.0;
_cm_cftn = 0.0;

_vm = 0;

_i = 0;

_lostchk = objNull;


_OpenList =
{
	_li = true;
	_listopening = true;
	
	_acx = 0.0;
	_acy = 0.0;
	_acz = 0.0;
	_acdr = 0.0;
	_acdv = 0.0;
	_aczm = 0.0;
	
	setMousePosition [0.75,0.50];
	
	createDialog "GCam_Dialog";
	waitUntil{ctrlShown(findDisplay 5100 displayCtrl 0)};
	
	lbAdd [ 2, "GCam View" ];
	lbAdd [ 2, "1st Person View" ];
	lbAdd [ 2, "3rd Person View" ];
	lbAdd [ 2, "Variable View" ];
	lbSetCurSel [2, _vm];
	
	if (_fo) then
	{ (findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTON }
	else
	{ (findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF };
	
	if (_be) then
	{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTON }
	else
	{ (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF };
	
	if (_fc) then
	{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTON }
	else
	{ (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF };
	
	if (SHOWTRIGGER) then
	{
		if (_trg) then
		{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTON }
		else
		{ (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF };
	}
	else
	{
		(findDisplay 5100 displayCtrl 3) ctrlShow false;
	};
	
	if (SHOWTIMEACC) then
	{
		(findDisplay 5100 displayCtrl 10) ctrlSetText format["%1",accTime];
	}
	else
	{
		(findDisplay 5100 displayCtrl 8) ctrlShow false;
		(findDisplay 5100 displayCtrl 9) ctrlShow false;
		(findDisplay 5100 displayCtrl 10) ctrlShow false;
	};
	
	if ( !(SHOWTRIGGER) and !(SHOWTIMEACC) ) then
	{
		(findDisplay 5100 displayCtrl 79) ctrlSetPosition
		[
			1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH,
			0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME,
			LISTWIDTH,
			SafeZoneH - (OUTFRAME*2 + LISTHEIGHT + (BUTTONHEIGHT+SPACE)*1 + SPACE)
		];
		
		(findDisplay 5100 displayCtrl 80) ctrlSetPosition
		[
			1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - LISTWIDTH,
			0.0 - ((SafeZoneH-1.0)/2) + OUTFRAME,
			LISTWIDTH,
			SafeZoneH - (OUTFRAME*2 + LISTHEIGHT + (BUTTONHEIGHT+SPACE)*1 + SPACE)
		];
		
		(findDisplay 5100 displayCtrl 21) ctrlSetPosition
		[
			1.0 + ((SafeZoneW-1.0)/2) - OUTFRAME - 0.0283,
			1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - LISTHEIGHT - SPACE - BUTTONHEIGHT - SPACE - BUTTONHEIGHT
		];
		
		(findDisplay 5100 displayCtrl 79) ctrlCommit 0;
		(findDisplay 5100 displayCtrl 80) ctrlCommit 0;
		(findDisplay 5100 displayCtrl 21) ctrlCommit 0;
	};
	
	if (_help) then
	{
		(findDisplay 5100 displayCtrl 79) ctrlShow true;
		(findDisplay 5100 displayCtrl 80) ctrlShow true;
		(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTON;
	}
	else
	{
		(findDisplay 5100 displayCtrl 79) ctrlShow false;
		(findDisplay 5100 displayCtrl 80) ctrlShow false;
		(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTOFF;
	};
	(findDisplay 5100 displayCtrl 79) ctrlSetBackgroundColor [0.0,0.0,0.0,0.4];
	(findDisplay 5100 displayCtrl 80) ctrlSetTextColor [0.8784,0.8471,0.651,1.0];
	(findDisplay 5100 displayCtrl 80) ctrlSetText format["%1",_helptext];
	
	
	(findDisplay 5100 displayCtrl 100) ctrlSetPosition
	[
		0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME,
		1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - (_mapsize select 0),
		(_mapsize select 0),
		(_mapsize select 1)
	];
	(findDisplay 5100 displayCtrl 100) ctrlCommit 0.0;
	
	(findDisplay 5100 displayCtrl 22) ctrlSetPosition
	[
		0.0 - ((SafeZoneW-1.0)/2) + OUTFRAME + (_mapsize select 0),
		1.0 + ((SafeZoneH-1.0)/2) - OUTFRAME - BUTTONHEIGHT
	];
	(findDisplay 5100 displayCtrl 22) ctrlCommit 0.0;
	
	_ma_p = ctrlPosition (findDisplay 5100 displayCtrl 100);
	_mapsize = [_ma_p select 2, _ma_p select 3];
	
	call _CreateCameraMarker;
	call _CreateGroupMarker;
	
	(findDisplay 5100 displayCtrl 100) ctrlMapAnimAdd [0, ctrlMapScale (findDisplay 5100 displayCtrl 100), [_cp select 0,_cp select 1]];
	ctrlMapAnimCommit (findDisplay 5100 displayCtrl 100);
	
	onMapSingleClick "GCam_MCP = _pos; GCam_MC = true";
	
	#ifdef PARAMTRACK
		ctrlSetText[55,GCam_Com1];
		ctrlSetText[56,GCam_Com2];
		ctrlSetText[57,GCam_Com3];
		ctrlSetText[58,GCam_Com4];
	#endif
	
	ctrlSetFocus (findDisplay 5100 displayCtrl 100);
};



_CloseList =
{
	_li = false;
	
	onMapSingleClick "";
	
	closeDialog 5100;
	waitUntil{!(ctrlShown(findDisplay 5100 displayCtrl 0))};
	
	deleteMarkerLocal "gcam_c";
	{ deleteMarkerLocal _x } forEach _ma_mnl;
	{ deleteMarkerLocal _x } forEach _ma_gmnl;
	
	GCam_LSC set [1,-1];
	GCam_KD set [1,-1];
	GCam_KU set [1,-1];
	GCam_OC = [controlNull,0.0,0.0,false];
};



_ChangeModeFollow =
{
	_fo = !(_fo);
	
	if (_fo) then
	{
		if (SHOWNOTICETEXT) then { titleText[ "Follow Mode Enabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTON };
		
		_cfalt = 1.0;
		
		if (_be) then
		{
			_be_odr = ((getdir _o) -90.0) * -1;
			if (_be_odr >= 360.0) then { _be_odr = _be_odr - 360.0 };
			if (_be_odr < 0.0) then { _be_odr = _be_odr + 360.0 };
			
			_be_cods_t = _fo_camobjdis_last;
			_be_codv_t = _fo_camobjdive_last;
			_cp_r = [ _be_cods_t * cos(_be_odr+180.0-_fo_camobjdir_rel_last) * (cos _be_codv_t), _be_cods_t * sin(_be_odr+180.0-_fo_camobjdir_rel_last) * (cos _be_codv_t), -_be_cods_t * (sin _be_codv_t) + _be_ofz];
			
			_dr = _fo_dir_last;
			_dv = _fo_dive_last;
		}
		else
		{
			_cp_r = [ cos(_dr+180) * _fo_cods, sin(_dr+180) * _fo_cods, _fo_cods_z ];
			
			_dv = _fo_dive_last;
		};
	}
	else
	{
		if (SHOWNOTICETEXT) then { titleText[ "Follow Mode Disabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 4) ctrlSetTextColor COLORBUTTONTEXTOFF };
		
		_fo_camobjdis_last = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2);
		_fo_camobjdive_last = ( ((_cp_r select 2) - _be_ofz) atan2 ((sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2))) ) * -1;
		
		_fo_objdir = ((getdir _o) -90.0) * -1;
		if (_fo_objdir >= 360.0) then { _fo_objdir = _fo_objdir - 360.0 };
		if (_fo_objdir < 0.0) then { _fo_objdir = _fo_objdir + 360.0 };
		
		_fo_camobjdir_rel_last = _fo_objdir - (( ((_cp_r select 0) atan2 (_cp_r select 1)) + 90.0 ) * -1);
		if (_fo_camobjdir_rel_last >= 360.0) then { _fo_camobjdir_rel_last = _fo_camobjdir_rel_last - 360.0 };
		if (_fo_camobjdir_rel_last < 0.0) then { _fo_camobjdir_rel_last = _fo_camobjdir_rel_last + 360.0 };
		
		_fo_dive_last = _dv;
		_fo_dir_last = _dr;
		
		if (_be) then
		{
			if (_fc) then
			{
				_fc_cdr_a = _be_cdr_a;
			}
			else
			{
				
			};
		}
		else
		{
			if (_fc) then
			{
				_fc_cdr_a = ( ( ((getPosASL _o select 0) - (getPosASL _c select 0)) atan2 ((getPosASL _o select 1) - (getPosASL _c select 1)) ) -90.0 ) * -1;
				if ( _fc_cdr_a >= 360.0 ) then { _fc_cdr_a = _fc_cdr_a - 360.0 };
				if ( _fc_cdr_a < 0.0 ) then { _fc_cdr_a = _fc_cdr_a + 360.0 };
				_fc_cdr_a = _dr - _fc_cdr_a;
				if ( _fc_cdr_a >= 360.0 ) then { _fc_cdr_a = _fc_cdr_a - 360.0 };
				if ( _fc_cdr_a < 0.0 ) then { _fc_cdr_a = _fc_cdr_a + 360.0 };
			}
			else
			{
				
			};
		};
	};
};


_ChangeModeBehind =
{
	_be = !(_be);
	
	if (_be) then
	{
		if (SHOWNOTICETEXT) then { titleText[ "Behind Mode Enabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTON };
		
		if (_fo) then
		{
			_be_cods_t = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2);
			_be_cods = _be_cods_t;
			
			_be_codv_t = ( ((_cp_r select 2) - _be_ofz) atan2 ((sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2))) ) * -1;
			_be_codv = _be_codv_t;
			
			_be_odr = ((getdir _o) -90.0) * -1;
			if (_be_odr >= 360.0) then { _be_odr = _be_odr - 360.0 };
			if (_be_odr < 0.0) then { _be_odr = _be_odr + 360.0 };
			
			_dr = _be_odr;
			
			_be_cdr_a = 0.0;
			_be_codr_a = 0.0;
			
			_cp_r = [ _be_cods_t * cos(_be_odr+180.0), _be_cods_t * sin(_be_odr+180.0), _cp_r select 2 ];
		}
		else
		{
			_be_cdr_a = 0.0;
			_be_codr_a = 0.0;
			
			_fo_camobjdir_rel_last = 0.0;
			
			_fo_dir_last = ((getdir _o) -90.0) * -1;
		};
	}
	else
	{
		if (SHOWNOTICETEXT) then { titleText[ "Behind Mode Disabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 5) ctrlSetTextColor COLORBUTTONTEXTOFF };
	};
};


_ChangeModeFocus =
{
	_fc = !(_fc);
	
	if (_fc) then
	{
		if (SHOWNOTICETEXT) then { titleText[ "Focus Mode Enabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTON };
		
		if (_fo) then
		{
			
		}
		else
		{
			_fc_sw_codr = ( ( ((getPosASL _o select 0) - (getPosASL _c select 0)) atan2 ((getPosASL _o select 1) - (getPosASL _c select 1)) ) +90 ) * -1;
			_cp_r = [ cos(_fc_sw_codr) * _fo_cods, sin(_fc_sw_codr) * _fo_cods, _fo_cods_z ];
			_op = getPosASL _o;
			
			_fc_cdr_a = 0.0;
			_fc_cdv_a = 0.0;
			
			if (_be) then
			{
				_cp_r = [ cos(((getdir _o)+90)*-1) * _fo_cods, sin(((getdir _o)+90)*-1) * _fo_cods, _fo_cods_z ];
				
				_dr = ((getdir _o) -90) * -1;
				if (_dr >= 360.0) then { _dr = _dr - 360.0 };
				if (_dr < 0.0) then { _dr = _dr + 360.0 };
			};
		};
	}
	else
	{
		if (SHOWNOTICETEXT) then { titleText[ "Focus Mode Disabled", "plain down", _w*15 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 6) ctrlSetTextColor COLORBUTTONTEXTOFF };
	};
};


_ChangeModeTrigger =
{
	_trg = !(_trg);
	
	if (_trg) then
	{
		if (SHOWNOTICETEXT) then { titleText[ "Firing and Ejection Trigger ON",  "plain down", _w*10 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTON };
		
		if ( !(_sm_l) ) then { call _SetFiredHandler };
	}
	else
	{
		if (SHOWNOTICETEXT) then { titleText[ "Firing and Ejection Trigger OFF",  "plain down", _w*10 ] };
		
		if (_li) then { (findDisplay 5100 displayCtrl 3) ctrlSetTextColor COLORBUTTONTEXTOFF };
		
		_o removeEventHandler ["fired", _tr_ehidx];
		_o removeEventHandler ["GetOut", _tr_ehidx2];
	};
};


_SetFiredHandler =
{
	_tr_ehidx = _o addEventHandler
	[
		"Fired",
		{
			_obj = _this select 0;
			_a = _this select 4;
			
			if ( (_a isKindOf "MissileBase") or (_a isKindOf "LaserBombCore") or (_a isKindOf "Arty_Sh_Base") or (_a isKindOf "ShellBase") ) then
			{
				GCam_O = nearestObject[_obj,_a];
				if (!(isNull GCam_O)) then
				{
					GCam_Trigger_Fire = true;
					GCam_T = true;
				};
			};
		}
	];
	
	_tr_ehidx2 = _o addEventHandler
	[
		"GetOut",
		{
			GCam_O = _this select 2;
			
			GCam_Trigger_Eject = true;
			GCam_T = true;
		}
	];
};


_SelectObjects =
{
	_ol = _this select 0;
	
	_y = [];
	
	_z = [];
	{
		if ( !(alive _x) or ((count(crew _x)) == 0) ) then { _z = _z + [_x] };
	} forEach _ol;
	_ol = _ol - _z;
	
	if (LISTCIVILIAN) then
	{
		_z = [];
		_y = [];
		{
			if ( (typeOf _x) == "BIS_alice_emptydoor" ) then
			{
				if ( format["%1",leader(group _x)] == format["%1",_x] ) then { _y = _y + [group _x] };
				_z = _z + [_x];
			};
		} forEach _ol;
		_ol = _ol - _z;
		
		{
			_z = [];
			_so_g = _x;
			_so_gc = false;
			{
				if ( (group _o) != _so_g ) then
				{
					if ( _so_gc and (_so_g == (group _x)) ) then { _z = _z + [_x] };
					if ( !(_so_gc) and (_so_g == (group _x)) ) then { _so_gc = true };
				};
			} forEach _ol;
			_ol = _ol - _z;
		} forEach _y;
	};
	
	if ( !(LISTFRIENDLY) ) then
	{
		_z = [];
		{
			if ( ((side player) getFriend (side _x)) >= 0.6 and !(((crew _x) select 0) isKindOf "Civilian") and !(_x isKindOf "Animal") ) then { _z = _z + [_x] };
		} forEach _ol;
		_ol = _ol - _z;
	};
	
	if ( !(LISTENEMY) ) then
	{
		_z = [];
		{
			if ( ((side player) getFriend (side _x)) < 0.6 and !(((crew _x) select 0) isKindOf "Civilian") and !(_x isKindOf "Animal") ) then { _z = _z + [_x] };
		} forEach _ol;
		_ol = _ol - _z;
	};
	
	if ( !(LISTCIVILIAN) ) then
	{
		_z = [];
		{
			if ( ((crew _x) select 0) isKindOf "Civilian" ) then { _z = _z + [_x] };
		} forEach _ol;
		_ol = _ol - _z;
	};
	
	if ( !(_cs_change) ) then
	{
		if ( _lsc == -1 ) then
		{
			_so_gc = false;
			_so_matchobj = objnull;
			{
				if ( _og == (group _x) ) then
				{
					_so_matchobj = _x;
					_so_gc = true;
					_og = grpNull;
				};
			} forEach _ol;
			
			if (_so_gc) then
			{
				_ol = _ol - [_so_matchobj];
				_ol = [_so_matchobj] + _ol;
			};
		};
		
		_z = [];
		{
			if ( ((group _o) != (group _x)) and !(alive(leader(group _x))) ) then
			{
				_so_o = _x;
				_so_firstunit_chkd = false;
				{
					if ( !(_so_firstunit_chkd) ) then
					{
						if ( (alive _x) and (_so_o == _x) ) then
						{
							_z = _z + [_so_o];
							_so_firstunit_chkd = true;
						};
						if ( (alive _x) and (_so_o != _x) ) then
						{
							_so_firstunit_chkd = true;
						};
					};
				} forEach units(group _x);
			};
			if ( ((group _o) == (group _x)) or (vehicle(leader(group _x)) == (vehicle _x)) or ((_x isKindOf "Animal") and LISTANIMAL) or ((group _x) in _y) ) then { _z = _z + [_x] };
		} forEach _ol;
		_ol = _z;
		
		if ( !(alive _o) and (_o != _o_l) ) then { _ol = [_o] + _ol };
	};
	
	_ol;
};


_SelectCycleUnits =
{
	_cy_ol_g = [];
	_cy_vl = [];
	_cy_n = 0;
	_cy_i = 0;
	{
		if ( alive _x and !(_x isKindOf "BIS_alice_emptydoor") ) then
		{
			if ( vehicle _x == _x ) then
			{
				_cy_ol_g = _cy_ol_g + [_x];
				if (_o == vehicle _x) then { _cy_n = _cy_i };
				_cy_i = _cy_i + 1;
			}
			else
			{
				if ( !((vehicle _x) in _cy_vl) ) then
				{
					_cy_ol_g = _cy_ol_g + [vehicle _x];
					_cy_vl = _cy_vl + [vehicle _x];
					if (_o == vehicle _x) then { _cy_n = _cy_i };
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach units(group _o);
};


_SelectCycleLeaders =
{
	_cy_ol = [];
	_cy_n = 0;
	_cy_i = 0;
	{
		if ( leader(group _x) == _x ) then
		{
			if ( LISTCIVILIAN ) then
			{
				if ( ((typeOf _x) != "BIS_alice_emptydoor") and (_x isKindOf "Civilian") ) then
				{
					_cy_ol = _cy_ol + [vehicle _x];
					if (vehicle(leader(group _o)) == vehicle _x) then { _cy_n = _cy_i };
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTFRIENDLY ) then
			{
				if ( (((side player) getFriend (side _x)) >= 0.6) and !(_x isKindOf "Civilian") and !(_x isKindOf "Animal") ) then
				{
					_cy_ol = _cy_ol + [vehicle _x];
					if (vehicle(leader(group _o)) == vehicle _x) then { _cy_n = _cy_i };
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTENEMY ) then
			{
				if ( (((side player) getFriend (side _x)) < 0.6) and !(_x isKindOf "Civilian") and !(_x isKindOf "Animal") ) then
				{
					_cy_ol = _cy_ol + [vehicle _x];
					if (vehicle(leader(group _o)) == vehicle _x) then { _cy_n = _cy_i };
					_cy_i = _cy_i + 1;
				};
			};
			if ( LISTANIMAL ) then
			{
				if ( _x isKindOf "Animal" ) then
				{
					_cy_ol = _cy_ol + [vehicle _x];
					if (vehicle(leader(group _o)) == vehicle _x) then { _cy_n = _cy_i };
					_cy_i = _cy_i + 1;
				};
			};
		};
	} foreach allUnits;
};

_tx_gn = "";
_ListObjects =
{
	_ol = _this select 0;
	
	_li_cnt = 0;
	_li_sg = group _o;
	
	lbClear 50;
	
	{
		if ( (vehicle(leader(group _x)) != (vehicle _x)) and !(_x isKindOf "Animal") ) then
		{
			_tx_addspace = " ";
			_tx_gn = "";
		}
		else
		{
			_tx_addspace = "";
			_tx_gn = format[ " : %1", count units group _x];
			if (_x isKindOf "Animal") then { _tx_gn = " : 1" }
		};
		
		_tx_crewname = "";
		if ((_ol select 0) == _x) then
		{
			{
				if (((crew(_ol select 0)) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
				_tx_crewname = _tx_crewname + format["%1", name _x];
			} forEach (crew _x);
		}
		else
		{
			_tx_crewname = name _x;
		};
		
		lbAdd[ 50, format[ "%3%1 : %2%4", getText( configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName" ), _tx_crewname, _tx_addspace, _tx_gn ] ];
		
		switch (true) do
		{
			case ( (_li_sg == (group _x)) or ((_x isKindOf "Animal") and (_x == (_ol select 0)) and _o == _x) ):
			{ lbSetColor[ 50, _li_cnt, COLORLISTFOLLOWGROUP ] };
			case ( ((crew _x) select 0) isKindOf "Civilian" ):
			{ lbSetColor[ 50, _li_cnt, COLORLISTCIVILIAN ] };
			case ( _x isKindOf "Animal" ):
			{ lbSetColor[ 50, _li_cnt, COLORLISTANIMAL ] };
			case ( ((side player) getFriend (side _x) ) < 0.6):
			{ lbSetColor[ 50, _li_cnt, COLORLISTENEMY ] };
			case ( ((side player) getFriend (side _x) ) >= 0.6):
			{ lbSetColor[ 50, _li_cnt, COLORLISTFRIENDLY ] };
		};
		
		_li_cnt = _li_cnt + 1;
	} forEach _ol;
};


_CreateCameraMarker =
{
	createMarkerLocal["gcam_c", [_cp select 0, _cp select 1]];
	"gcam_c" setMarkerShapeLocal "ICON";
	"gcam_c" setMarkerTypeLocal "mil_Arrow2";
	"gcam_c" setMarkerColorLocal COLORICONCAMERA;
	"gcam_c" setMarkerSizeLocal [0.27, 0.27];
	"gcam_c" setMarkerDirLocal (-(_dr) + 90.0);
};


_CreateGroupMarker =
{
	{ deleteMarkerLocal _x } forEach _ma_mnl;
	
	if (_o iskindof "Animal") then
	{ _ma_gu = [_o] }
	else
	{ _ma_gu = units group _o };
	
	_ma_mnl = [];
	{
		if (alive _x) then
		{
			_ma_mn = format["%1%2%3",typeOf _x, rankId _x, name _x];
			
			createMarkerLocal[ _ma_mn, [ getPosASL _x select 0, getPosASL _x select 1 ] ];
			_ma_mn setMarkerShapeLocal "ICON";
			_ma_mn setMarkerTypeLocal "dot";
			_ma_mn setMarkerSizeLocal [0.0, 0.0];
			
			switch (true) do
			{
				case ( _x iskindof "Animal" ) : { _ma_mn setMarkerColorLocal COLORICONANIMAL };
				case ( (((crew _x) select 0) iskindof "Civilian") ) : { _ma_mn setMarkerColorLocal COLORICONCIVILIAN };
				case ( ((side player) getFriend (side _x)) < 0.6 ) : { _ma_mn setMarkerColorLocal COLORICONENEMY };
				case ( ((side player) getFriend (side _x)) >= 0.6 ) : { _ma_mn setMarkerColorLocal COLORICONFRIENDLY };
			};
			
			_ma_mnl = _ma_mnl + [_ma_mn];
		}
		else
		{
			deleteMarkerLocal format["%1",_x];
		};
	} forEach _ma_gu;
};


_CreateGroupMarker2 =
{
	{ deleteMarkerLocal _x } forEach _ma_gmnl;
	
	{
		_ma_gmn = format["%1g",_x];
		createMarkerLocal[ _ma_gmn, [ getposASL _x select 0, getposASL _x select 1 ] ];
		_ma_gmn setMarkerShapeLocal "ICON";
		_ma_gmn setMarkerSizeLocal [0.0,0.0];
		
		if ((speed vehicle _x) > 4) then
		{
			_ma_gmn setMarkerTypeLocal "mil_Arrow2";
			_ma_gmn setMarkerDirLocal (getDir vehicle _x);
			_ma_gmn setMarkerSizeLocal [0.41,0.41];
		}
		else
		{
			_ma_gmn setMarkerTypeLocal "dot";
			_ma_gmn setMarkerSizeLocal [0.98,0.98];
		};
		
		 _ma_gmn setMarkerColorLocal "ColorBlack";
		switch (true) do
		{
			case ( _x iskindof "Animal" ) : { _ma_gmn setMarkerColorLocal COLORICONANIMAL };
			case ( (((crew _x) select 0) iskindof "Civilian") ) : { _ma_gmn setMarkerColorLocal COLORICONCIVILIAN };
			case ( ((side player) getFriend (side _x)) < 0.6 ) : { _ma_gmn setMarkerColorLocal COLORICONENEMY };
			case ( ((side player) getFriend (side _x)) >= 0.6 ) : { _ma_gmn setMarkerColorLocal COLORICONFRIENDLY };
		};
		
		if (_x iskindof "Animal") then
		{ _ma_gmn setMarkerTextLocal format["%1 : 1", getText( configFile >> "CfgVehicles" >> (typeOf(vehicle _x)) >> "displayName" )] }
		else
		{ _ma_gmn setMarkerTextLocal format["%1 : %2 : %3", getText( configFile >> "CfgVehicles" >> (typeOf(vehicle _x)) >> "displayName" ), name _x, count units group _x] };
		
		_ma_gmnl = _ma_gmnl + [_ma_gmn];
	} forEach _ma_ol;
};


_CreateMapScanArea =
{
	[GCam_MCP, _w] spawn
	{
		deleteMarkerLocal "gcam_e";
		
		createMarkerLocal[ "gcam_e", [ (_this select 0) select 0, (_this select 0) select 1 ] ];
		"gcam_e" setMarkerShapeLocal "ELLIPSE";
		"gcam_e" setMarkerBrushLocal "SOLID";
		"gcam_e" setMarkerColorLocal COLORSCANAREA;
		"gcam_e" setMarkerAlphaLocal 0.3;
		"gcam_e" setMarkerSizeLocal [DETECTOBJECTDISTANCE, DETECTOBJECTDISTANCE];
		
		sleep ((_this select 1)*50);
		
		deleteMarkerLocal "gcam_e";
	};
};


_ClickSwitch =
{
	_cs_ct = diag_tickTime - _cs_bdtime;
	if ( _mu == 0 and _cs_ct < 0.2 ) then
	{
		_cs_change = true;
		
		_cs_ol = [ nearestObjects [_c, ["AllVehicles"], 500+1100*(1.0-sqrt(_zm/2.0))] ] call _SelectObjects;
		
		if (_fo) then { _cs_ol = _cs_ol - [_cs_ol select 0] };
		
		_cs_l = true;
		_cs_c = 0;
		_cs_hit = false;
		{
			_cs_crt = 0.0;
			_cs_crz = 0.0;
			if (_x isKindOf "Man") then
			{
				_cs_c = _cs_c + 1;
				if (_cs_c < 30) then
				{
					_cs_l = true;
					
					_cs_crt = ((_x selectionPosition "head_axis") select 2) - 1.57;
				}
				else
				{
					_cs_l = false;
				};
			}
			else
			{
				_cs_l = true;
				
				if (typeOf _x == "2S6M_TUNGUSKA") then { _cs_crz = 2.0 };
			};
			
			if (_cs_l) then
			{
				_cs_op = getPosATL _x;
				_cs_sp = worldToScreen [ _cs_op select 0, _cs_op select 1, (_cs_op select 2) + 1.2 + _cs_crz + _cs_crt ];
				if (count _cs_sp == 0) then { _cs_sp = [100.0,100.0] };
				
				_cs_sds = [0.5,0.5] distance _cs_sp;
				
				switch (true) do
				{
					case (_x isKindOf "Car"): { _cs_cfha = 2.5 };
					case (_x isKindOf "Tank"): { _cs_cfha = 4.5 };
					case (_x isKindOf "Helicopter"): { _cs_cfha = 7.5 };
					case (_x isKindOf "Air"): { _cs_cfha = 11.0 };
					case (_x isKindOf "Ship"): { _cs_cfha = 3.0 };
					default { _cs_cfha = 1.2 };
				};
				_cs_ha = (1.30 / (0.1 + (_cp distance (getPosASL _x)) )) * _cs_cfha * (0.5 / _cfzm);
				
				if ( !(_cs_hit) and (_cs_sds < _cs_ha) ) then
				{
					_o = _x;
					_cs_hit = true;
				};
			};
		} foreach _cs_ol;
		
		if ( _cs_hit and ((_o != _o_l) or !(_fo)) ) then
		{
			lbClear 50;
			lbSetCurSel [50, 0];
			
			call _ResetCamera;
			_o_l = _o;
			
			_cs_change = false;
			_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			[_li_ol] call _ListObjects;
		};
		
		_cs_change = false;
	};
	
	GCam_MD set [1, -1];
	GCam_MU set [1, -1];
};



_SmoothMove =
{
	GCam_KD set [1,-1];
	GCam_KU set [1,-1];
	GCam_MD set [1,-1];
	GCam_MU set [1,-1];
	
	_sm_l = true;
	_sm_n = 0;
	_sm_cp = getPosASL _c;
	_sm_op = getPosASL _o;
	_sm_cp_t_l = [ (_sm_op select 0) + (_cp_r select 0), (_sm_op select 1) + (_cp_r select 1), (_sm_op select 2) + (_cp_r select 2) ];
	
	switch (true) do
	{
		case (_o isKindOf "Car"): { _sm_d = 0.06 };
		case (_o isKindOf "Tank"): { _sm_d = 0.08 };
		case (_o isKindOf "Helicopter"): { _sm_d = 0.1 };
		case (_o isKindOf "Air"): { _sm_d = 0.12 };
		case (_o isKindOf "Ship"): { _sm_d = 0.06 };
		default { _sm_d = 0.04 };
	};
	
	while { ( [_sm_cp select 0, _sm_cp select 1] distance [_sm_cp_t_l select 0, _sm_cp_t_l select 1] ) > (_sm_d + (sqrt((velocity _o select 0)^2 + (velocity _o select 1)^2)*0.01)) and (_sm_n < 100) and _sm_l } do
	{
		_aczm = _aczm * ZOOMATTEN;
		
		if (!(isNil "GCam_KD")) then { _kd = GCam_KD select 1 };
		if (!(isNil "GCam_KU")) then { _ku = GCam_KU select 1 };
		GCam_KD set [1,-1];
		GCam_KU set [1,-1];
		
		if (_kd == KEYUNITNEXT or _kd == KEYGROUPPREVIOUS or _kd == KEYGROUPNEXT or _kd == KEYUNITPREVIOUS) then
		{
			if ( _cgk == KEYUNITNEXT and (_kd == KEYUNITPREVIOUS or _kd == KEYGROUPPREVIOUS or _kd == KEYGROUPNEXT) ) then
			{
				_o = _o_l;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _cgk == KEYUNITPREVIOUS and (_kd == KEYUNITNEXT or _kd == KEYGROUPPREVIOUS or _kd == KEYGROUPNEXT) ) then
			{
				_o = _o_l;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _cgk == KEYGROUPPREVIOUS and (_kd == KEYUNITNEXT or _kd == KEYUNITPREVIOUS or _kd == KEYGROUPNEXT) ) then
			{
				_o = _o_l;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			if ( _cgk == KEYGROUPNEXT and (_kd == KEYUNITNEXT or _kd == KEYUNITPREVIOUS or _kd == KEYGROUPPREVIOUS) ) then
			{
				_o = _o_l;
				if ( SWITCHADJDIS ) then { call _SwitchAdjustDistance };
			};
			_cgk = -1;
			
			_sm_l = false;
		};
		
		if (!(isNil "GCam_OC")) then { _oc = GCam_OC select 3 };
		
		if (!(isNil "GCam_MD")) then { _md = GCam_MD select 1 };
		if (!(isNil "GCam_MU")) then { _mu = GCam_MU select 1 };
		if (_md == 0 and _mu == 0 and !(_oc)) then
		{
			_sm_l = false;
		};
		if ( (_mu == 0) or (_mu == 1 and _md == 1) ) then
		{
			GCam_MD set [1, -1];
			GCam_MU set [1, -1];
		};
		if (_mu == 1) then
		{
			_aczm = 0.0;
			_zm = 0.7;
			_c camSetFov _zm;
			_cfzm = sin ((_zm / 1.8) * 90.0);
		};
		
		_wl = GCam_MW select 1;
		if (_wl > 0.00001 or _wl < -0.00001) then
		{
			_aczm = _aczm - _wl * 0.12 * CFWHEEL * sin((_zm / 2.0) * 90.0);
			GCam_MW set [1, 0];
		};
		if ((abs _aczm) > 0.00001) then
		{
			_zm = _zm + _aczm;
			if (_zm < 0.01) then
			{
				_zm = 0.01;
				_aczm = 0.0;
			};
			if (_zm > 2.0) then
			{
				_zm = 2.0;
				_aczm = 0.0;
			};
			_c camSetFov _zm;
			_cfzm = sin ((_zm / 1.8) * 90);
		};
		
		if (_ku == KEYMODEFOLLOW) then
		{
			call _ChangeModeFollow;
		};
		if (_ku == KEYMODEBEHIND) then
		{
			call _ChangeModeBehind;
		};
		if (_ku == KEYMODEFOCUS) then
		{
			call _ChangeModeFocus;
		};
		if (SHOWTRIGGER and _ku == KEYMODETRIGGER) then
		{
			call _ChangeModeTrigger;
		};
		
		if (_ku == KEYFLIR) then
		{
			_nvg = (_nvg + 1) mod 5;
			
			switch (_nvg) do
			{
				case (0):
				{
					false setCamUseTi 0;
				};
				case (1):
				{
					camUseNVG true;
				};
				case (2):
				{
					camUseNVG false;
					true setCamUseTi 0;
				};
				case (3):
				{
					true setCamUseTi 1;
				};
				case (4):
				{
					true setCamUseTi 2;
				};
			};
		};
		
		if (_ku == KEYMODEVIEW) then
		{
			_vm = (_vm + 1) mod 4;
			
			switch (_vm) do
			{
				case (0):
				{
					if (SHOWNOTICETEXT) then { titleText[ "GCam View", "plain down", _w*15 ] };
					
					lbSetCurSel [2, 0];
				};
				case (1):
				{
					if (SHOWNOTICETEXT) then { titleText[ "1st Person View", "plain down", _w*15 ] };
					
					lbSetCurSel [2, 1];
				};
				case (2):
				{
					if (SHOWNOTICETEXT) then { titleText[ "3rd Person View", "plain down", _w*15 ] };
					
					lbSetCurSel [2, 2];
				};
				case (3):
				{
					if (SHOWNOTICETEXT) then { titleText[ "Variable View", "plain down", _w*15 ] };
					
					lbSetCurSel [2, 3];
				};
			};
		};
		
		if (_ku == KEYLIST) then
		{
			_li = !(_li);
			
			if (_li) then
			{ call _OpenList }
			else
			{ call _CloseList };
		};
		if (_li) then
		{
			if (GCam_B) then
			{
				switch (GCam_BId) do
				{
					case ("fo"):
					{
						call _ChangeModeFollow;
					};
					case ("be"):
					{
						call _ChangeModeBehind;
					};
					case ("fc"):
					{
						call _ChangeModeFocus;
					};
					case ("trg"):
					{
						call _ChangeModeTrigger;
					};
					case ("ti"):
					{
						if ( (accTime + 0.1) <= 4.0 ) then { setAccTime ((round((accTime + 0.1)*10))*0.1) };
						(findDisplay 5100 displayCtrl 10) ctrlSetText format["%1",accTime];
					};
					case ("td"):
					{
						if ( (accTime - 0.1) >= 0.0 ) then { setAccTime ((round((accTime - 0.1)*10))*0.1) };
						(findDisplay 5100 displayCtrl 10) ctrlSetText format["%1",accTime];
					};
					case ("hp"):
					{
						_help = !(_help);
						
						if (_help) then
						{
							(findDisplay 5100 displayCtrl 79) ctrlShow true;
							(findDisplay 5100 displayCtrl 80) ctrlShow true;
							(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTON;
						}
						else
						{
							(findDisplay 5100 displayCtrl 79) ctrlShow false;
							(findDisplay 5100 displayCtrl 80) ctrlShow false;
							(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTOFF;
						};
					};
					case ("vc"):
					{
						_vm = lbCurSel 2;
						
						switch (_vm) do
						{
							case (0):
							{
								if (SHOWNOTICETEXT) then { titleText[ "GCam View", "plain down", _w*15 ] };
							};
							case (1):
							{
								if (SHOWNOTICETEXT) then { titleText[ "1st Person View", "plain down", _w*15 ] };
							};
							case (2):
							{
								if (SHOWNOTICETEXT) then { titleText[ "3rd Person View", "plain down", _w*15 ] };
							};
							case (3):
							{
								if (SHOWNOTICETEXT) then { titleText[ "Variable View", "plain down", _w*15 ] };
							};
						};
					};
				};
				GCam_BId = "";
				GCam_B = false;
			};
			
			
			if (!(isNil "GCam_MD2")) then { _ma_md = GCam_MD2 };
			if (_ma_md select 1 == 0) then
			{
				_ma_pm = _ma_md select 2;
				_ma_pb = ctrlPosition (findDisplay 5100 displayCtrl 22);
				_ma_pd = ctrlPosition (findDisplay 5100 displayCtrl 100);
				
				GCam_MD2 = [controlNull,-1,0.0,0.0,false,false,false];
				GCam_MU2 = [controlNull,-1,0.0,0.0,false,false,false];
				
				_ma_dr = true;
			};
			if (_ma_dr) then
			{
				(findDisplay 5100 displayCtrl 22) ctrlSetPosition
				[
					(_ma_pb select 0) + (GCam_OC select 1) - _ma_pm,
					_ma_pb select 1
				];
				(findDisplay 5100 displayCtrl 22) ctrlCommit 0.0;
				
				(findDisplay 5100 displayCtrl 100) ctrlSetPosition
				[
					_ma_pd select 0,
					(_ma_pd select 1) - ((GCam_OC select 1) - _ma_pm),
					(_ma_pd select 2) + (GCam_OC select 1) - _ma_pm,
					(_ma_pd select 3) + (GCam_OC select 1) - _ma_pm
				];
				(findDisplay 5100 displayCtrl 100) ctrlCommit 0.0;
				
				_ma_p = ctrlPosition (findDisplay 5100 displayCtrl 100);
				_mapsize = [_ma_p select 2, _ma_p select 3];
				
				if (!(isNil "GCam_MU2")) then { _ma_mu = GCam_MU2 select 1 };
				if ( _ma_mu == 0 or !(GCam_OC select 3) ) then { _ma_dr = false };
			};
			
			
			"gcam_c" setMarkerPosLocal [_sm_cp select 0, _sm_cp select 1];
			"gcam_c" setMarkerDirLocal (-(_dr) + 90.0);
			
			if (!(_ma_sc) or !(_ma_m)) then
			{
				_ma_crp = (findDisplay 5100 displayCtrl 100) posWorldToScreen [ _sm_cp select 0, _sm_cp select 1 ];
				_ma_crp = [ (_ma_crp select 0) - ((_ma_p select 2)/2), (_ma_crp select 1) - ((_ma_p select 3)/2) ];
				(findDisplay 5100 displayCtrl 100) ctrlMapAnimAdd [ 0, ctrlMapScale(findDisplay 5100 displayCtrl 100), (findDisplay 5100 displayCtrl 100) posScreenToWorld _ma_crp ];
				ctrlMapAnimCommit (findDisplay 5100 displayCtrl 100);
			};
			
			if ( alive _o ) then
			{
				"gcam_o" setMarkerPosLocal [_ma_op select 0, _ma_op select 1];
				if ((speed vehicle _o) > 4.0) then
				{
					"gcam_o" setMarkerTypeLocal "mil_Arrow2";
					"gcam_o" setMarkerSizeLocal [0.27, 0.27];
					"gcam_o" setMarkerDirLocal (getdir vehicle _o);
				}
				else
				{
					"gcam_o" setMarkerTypeLocal "dot";
					"gcam_o" setMarkerSizeLocal [0.65, 0.65];
				};
			}
			else
			{
				"gcam_o" setMarkerSizeLocal [0.0, 0.0];
				"gcam_o" setMarkerTextLocal "";
			};
			
			_ma_mnl = [];
			{
				if (alive _x) then
				{
					_ma_mn = format["%1%2%3",typeOf _x, rankId _x, name _x];
					_ma_op = getPosASL _x;
					_ma_mn setMarkerPosLocal [_ma_op select 0, _ma_op select 1];
					
					if ((speed vehicle _x) > 4) then
					{
						_ma_mn setMarkerTypeLocal "mil_Arrow2";
						_ma_mn setMarkerDirLocal (getdir vehicle _x);
						_ma_mn setMarkerSizeLocal [0.27,0.27];
					}
					else
					{
						_ma_mn setMarkerTypeLocal "dot";
						_ma_mn setMarkerSizeLocal [0.65,0.65];
					};
					
					_ma_mnl = _ma_mnl + [_ma_mn];
				}
				else
				{
					deleteMarkerLocal format["%1%2%3",typeOf _x, rankId _x, name _x];
				};
			} forEach _ma_gu;
		};
		
		_sm_op = getPosASL _o;
		
		if ( _fo and _be ) then
		{
			_be_odr = ((getdir _o) -90) * -1;
			if (_be_odr >= 360.0) then { _be_odr = _be_odr - 360.0 };
			if (_be_odr < 0.0) then { _be_odr = _be_odr + 360.0 };
			
			_be_cdr_t = _dr - _be_cdr_a;
			if ( _be_cdr_t >= 360.0 ) then { _be_cdr_t = _be_cdr_t - 360.0 };
			if ( _be_cdr_t < 0.0 ) then { _be_cdr_t = _be_cdr_t + 360.0 };
			
			_be_cdr_d = _be_odr - _be_cdr_t;
			if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
			if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
			
			_be_cdr_d = _be_cdr_d + _be_codr_a;
			if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
			if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
			
			switch (true) do
			{
				case (_be_cdr_d >= 0.0 and _be_cdr_d < 180.0) : { _dr = _dr + (abs(sin(_be_cdr_d/2.0))) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
				case (_be_cdr_d >= 180.0 and _be_cdr_d < 360.0) : { _dr = _dr - (abs(sin(_be_cdr_d/2.0))) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
			};
			if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
			if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
			
			_cp_r = [ _be_cods_t * cos(_be_odr+180.0+_be_codr_a) * (cos _be_codv_t), _be_cods_t * sin(_be_odr+180.0+_be_codr_a) * (cos _be_codv_t), -_be_cods_t * (sin _be_codv_t) + _be_ofz];
		};
		
		
		if ( !(_fo) and _fc ) then
		{
			if ( _be ) then
			{
				_fc_odr = ((getdir _o) -90.0) * -1;
				if (_fc_odr >= 360.0) then { _fc_odr = _fc_odr - 360.0 };
				if (_fc_odr < 0.0) then { _fc_odr = _fc_odr + 360.0 };
				
				_be_cdr_t = _dr - _fc_cdr_a;
				if ( _be_cdr_t >= 360.0 ) then { _be_cdr_t = _be_cdr_t - 360.0 };
				if ( _be_cdr_t < 0.0 ) then { _be_cdr_t = _be_cdr_t + 360.0 };
				
				_be_cdr_d = _fc_odr - _be_cdr_t;
				if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
				if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
				
				_be_cdr_d = _be_cdr_d + _be_codr_a;
				if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
				if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
				
				switch (true) do
				{
					case (_be_cdr_d >= 0.0 and _be_cdr_d < 180.0) : { _dr = _dr + (abs(sin(_be_cdr_d/2.0))) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
					case (_be_cdr_d >= 180.0 and _be_cdr_d < 360.0) : { _dr = _dr - (abs(sin(_be_cdr_d/2.0))) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
				};
				if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
				if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
				
				_cp_r = [ cos(_fc_odr+180.0+_be_codr_a) * _fo_cods, sin(_fc_odr+180.0+_be_codr_a) * _fo_cods, _fo_cods_z ];
			}
			else
			{
				_fc_op = _sm_op;
				_fc_cp = _sm_cp;
				
				_fc_codr = ( ( ((_fc_op select 0) - (_fc_cp select 0)) atan2 ((_fc_op select 1) - (_fc_cp select 1)) ) -90.0 ) * -1;
				if (_fc_codr >= 360.0) then { _fc_codr = _fc_codr - 360.0 };
				if (_fc_codr < 0.0) then { _fc_codr = _fc_codr + 360.0 };
				
				_fc_codr_d = _dr - _fc_codr;
				if (_fc_codr_d >= 360.0) then { _fc_codr_d = _fc_codr_d - 360.0 };
				if (_fc_codr_d < 0.0) then { _fc_codr_d = _fc_codr_d + 360.0 };
				
				_fc_codr_d = _fc_codr_d - _fc_cdr_a;
				if (_fc_codr_d >= 360.0) then { _fc_codr_d = _fc_codr_d - 360.0 };
				if (_fc_codr_d < 0.0) then { _fc_codr_d = _fc_codr_d + 360.0 };
				
				switch (true) do
				{
					case (_fc_codr_d > 0.0 and _fc_codr_d < 180.0) : { _dr = _dr - (abs(sin(_fc_codr_d/2.0))) * 20.0 };
					case (_fc_codr_d > 180.0 and _fc_codr_d < 360.0) : { _dr = _dr + (abs(sin(_fc_codr_d/2.0))) * 20.0 };
				};
				if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
				if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
				
				_fc_sw_codr = ( ( (_re_cp_r_l select 0) atan2 (_re_cp_r_l select 1) ) -90.0 ) * -1;
				_cp_r = [ cos(_fc_sw_codr) * _fo_cods, sin(_fc_sw_codr) * _fo_cods, _fo_cods_z ];
			};
			
			_sm_cods_h = [_sm_cp select 0, _sm_cp select 1] distance [_sm_op select 0, _sm_op select 1];
			if ( _o isKindOf "Man" ) then { _sm_crt = (((_o selectionPosition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_sm_cods_h+0.1))) };
			
			_sm_codv = (sqrt(((_sm_op select 0) - (_sm_cp select 0))^2 + ((_sm_op select 1) - (_sm_cp select 1))^2) atan2 (((_sm_op select 2) - (_sm_cp select 2)) + _be_ofz + _sm_crt) - 90.0) * -1;
			_sm_dv_t = _sm_codv + _fc_cdv_a;
			_sm_dv_d = _sm_dv_t - _dv;
			
			switch (true) do
			{
				case (_sm_dv_d > 0.0) : { _dv = _dv + abs sin(_sm_dv_d/2.0) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
				case (_sm_dv_d <= 0.0) : { _dv = _dv - abs sin(_sm_dv_d/2.0) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
			};
			_dv = (_dv min 89.0) max -89.0;
		};
		
		if ( (_cs_change and !(_be)) or (!(_fo) and !(_fc)) ) then
		{
			_cp_r = [ cos(_dr+180.0) * _fo_cods, sin(_dr+180.0) * _fo_cods, _fo_cods_z ];
		};
		
		
		if ( SWITCHCENTER or _cs_change ) then
		{
			if ( _fo or ( !(_fc) and !(_fo) ) ) then
			{
				_sm_cods_h = sqrt(((_sm_cp select 0) - (_sm_op select 0))^2 + ((_sm_cp select 1) - (_sm_op select 1))^2.0);
				if ( _o isKindOf "Man" ) then { _sm_crt = (((_o selectionPosition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_sm_cods_h+0.1))) };
				
				_sm_codv = (sqrt(((_sm_op select 0) - (_sm_cp select 0))^2 + ((_sm_op select 1) - (_sm_cp select 1))^2.0) atan2 (((_sm_op select 2) - (_sm_cp select 2)) + _be_ofz + _sm_crt) - 90.0) * -1;
				_sm_dv_d = _sm_codv - _dv;
				
				switch (true) do
				{
					case (_sm_dv_d > 0.0) : { _dv = _dv + abs sin(_sm_dv_d/2.0) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
					case (_sm_dv_d <= 0.0) : { _dv = _dv - abs sin(_sm_dv_d/2.0) * 15.0 * ((_sm_n atan2 15.0)/90.0) };
				};
				_dv = (_dv min 89.0) max -89.0;
				
				_be_cdv_a = _sm_dv_d;
			};
		};
		
		
		if (_be) then
		{
			if (_o isKindOf "Man") then { _be_crt = (((_o selectionPosition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_be_cods+0.1))) };
		};
		
		_sm_cp_t = [ (_sm_op select 0) + (_cp_r select 0), (_sm_op select 1) + (_cp_r select 1), (_sm_op select 2) + (_cp_r select 2) ];
		_sm_cods = [ (_sm_cp_t select 0) - (_sm_cp select 0), (_sm_cp_t select 1) - (_sm_cp select 1), (_sm_cp_t select 2) - (_sm_cp select 2) ];
		_sm_cp = [ (_sm_cp select 0) + ((((_sm_cods select 0)/3)) * ((_sm_n atan2 110.0)/90.0)) + ((_sm_cp_t select 0) - (_sm_cp_t_l select 0)) * ((_sm_n atan2 5)/90.0), (_sm_cp select 1) + ((((_sm_cods select 1)/3.0)) * ((_sm_n atan2 110.0)/90.0)) + ((_sm_cp_t select 1) - (_sm_cp_t_l select 1)) * ((_sm_n atan2 5.0)/90.0), (_sm_cp select 2) + ((((_sm_cods select 2)/3.0)) * ((_sm_n atan2 110.0)/90.0)) + (((_sm_cp_t select 2) - (_sm_cp_t_l select 2)) * ((_sm_n atan2 5.0)/90.0)) ];
		_c setPosASL [_sm_cp select 0, _sm_cp select 1, (_sm_cp select 2) + _be_crt];
		_c camSetTarget [ (_sm_cp select 0) + (cos _dr) * (cos _dv) * 100000.0, (_sm_cp select 1) + (sin _dr) * (cos _dv) * 100000.0, (_sm_cp select 2) + (sin _dv) * 100000.0];
		_c camCommit 0;
		
		_sm_cp_t_l = _sm_cp_t;
		
		if ( (getPosATL _c select 2) < 0.5 ) then { _c setPosATL [ getPosASL _c select 0, getPosASL _c select 1, 0.501 - _be_crt ] };
		
		_sm_n = _sm_n + 1;
		_w = accTime / (diag_fps * 2);
		sleep _w;
	};
	
	_sm_l = false;
	
	GCam_KD set [1,-1];
	GCam_KU set [1,-1];
	_kd = -1;
	_ku = -1;
};


_ChaseMissile =
{
	GCam_KD set [1,-1];
	GCam_KU set [1,-1];
	GCam_MD set [1,-1];
	GCam_MU set [1,-1];
	
	_cm_rcvacctime = accTime;
	setAccTime CHASEACCTIME;
	
	_fo_camobjdis_last = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2);
	_fo_camobjdive_last = ( ((_cp_r select 2) - _be_ofz) atan2 ((sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2))) ) * -1;
	
	_fo_objdir = ((getdir _o) -90.0) * -1;
	if (_fo_objdir >= 360.0) then { _fo_objdir = _fo_objdir - 360.0 };
	if (_fo_objdir < 0.0) then { _fo_objdir = _fo_objdir + 360.0 };
	
	_fo_camobjdir_rel_last = _fo_objdir - (( ((_cp_r select 0) atan2 (_cp_r select 1)) + 90.0 ) * -1);
	if (_fo_camobjdir_rel_last >= 360.0) then { _fo_camobjdir_rel_last = _fo_camobjdir_rel_last - 360.0 };
	if (_fo_camobjdir_rel_last < 0.0) then { _fo_camobjdir_rel_last = _fo_camobjdir_rel_last + 360.0 };
	
	_fo_dive_last = _dv;
	_fo_dir_last = _dr;
	
	_cm_o = GCam_O;
	_cm_op = getPosASL _cm_o;
	_cm_cp = _cp;
	_cm_cp_r = [(_cm_cp select 0)-(_cm_op select 0),(_cm_cp select 1)-(_cm_op select 1),(_cm_cp select 2)-(_cm_op select 2)];
	_cm_l = true;
	
	_cm_codr_a = _be_codr_a;
	_cm_cdr_a = _be_cdr_a;
	_cm_cods_t = _be_cods_t;
	_cm_codv_t = (sqrt(((_cm_op select 0) - (_cm_cp select 0))^2.0 + ((_cm_op select 1) - (_cm_cp select 1))^2.0) atan2 (((_cm_op select 2) - (_cm_cp select 2))) - 90.0) * -1;
	
	if (_li) then
	{
		call _CloseList;
		_cm_listshow = true;
	};
	
	while {(alive _cm_o) and _cm_l} do
	{
		_acx = _acx * MOVEATTEN;
		_acy = _acy * MOVEATTEN;
		_acz = _acz * MOVEATTEN;
		_acdr = _acdr * TURNATTEN;
		_acdv = _acdv * TURNATTEN;
		_aczm = _aczm * ZOOMATTEN;
		
		_mm = [ GCam_MM select 1, GCam_MM select 2 ];
		_acm = accTime^1.5 + 0.007;
		_acdr = _acdr + (_mm select 0) * -MOUSEMOVEACCX * CFTRK * _cfzm / (cos abs(_dv / (1.0 + _cfzm))) * _acm;
		_acdv = _acdv + (_mm select 1) * -MOUSEMOVEACCY * CFTRK * _cfzm * _acm;
		
		_dr = _dr + _acdr;
		if (_dr >= 360.0) then { _dr = _dr - 360.0 };
		if (_dr < 0.0) then { _dr = _dr + 360.0 };
		
		_dv = _dv + _acdv;
		if (_dv > 89.9) then
		{
			_dv = 89.9;
			_acdv = 0.0;
		};
		if (_dv < -89.9) then
		{
			_dv = -89.9;
			_acdv = 0.0;
		};
		
		if (!(isNil "GCam_MD")) then { _md = GCam_MD select 1 };
		if (!(isNil "GCam_MU")) then { _mu = GCam_MU select 1 };
		if (_md == 0 and _mu == 0) then
		{
			_cm_l = false;
		};
		if ( (_mu == 0) or (_mu == 1 and _md == 1) ) then
		{
			GCam_MD set [1, -1];
			GCam_MU set [1, -1];
		};
		if (_mu == 1) then
		{
			_aczm = 0.0;
			_zm = 0.7;
			_c camSetFov _zm;
			_cfzm = sin ((_zm / 1.8) * 90.0);
		};
		
		
		_wl = GCam_MW select 1;
		if (_wl > 0.00001 or _wl < -0.00001) then
		{
			_aczm = _aczm - 0.12 * _wl * CFWHEEL * sin((_zm / 2.0) * 90.0);
			GCam_MW set [1, 0];
		};
		if ((abs _aczm) > 0.00001) then
		{
			_zm = _zm + _aczm;
			if (_zm < 0.01) then
			{
				_zm = 0.01;
				_aczm = 0.0;
			};
			if (_zm > 2.0) then
			{
				_zm = 2.0;
				_aczm = 0.0;
			};
			_c camSetFov _zm;
			_cfzm = sin ((_zm / 1.8) * 90);
		};
		
		
		if (!(isNil "GCam_KD")) then { _kd = GCam_KD select 1 };
		if (!(isNil "GCam_KU")) then { _ku = GCam_KU select 1 };
		GCam_KD set [1,-1];
		GCam_KU set [1,-1];
		if (_kd != -1 or _ku != -1) then {_kt = diag_tickTime};
		if (count _k == 0 and _kd != -1) then { _k = _k + [_kd] };
		if (count _k == 1 and _kd != _k select 0) then { _k = _k + [_kd] };
		if (_ku in _k) then { _k = _k - [_ku] };
		if (_oc) then {_k = _k - [KEYMOVEUP,KEYMOVEFRONT,KEYMOVELEFT,KEYMOVEBACK,KEYMOVERIGHT,KEYMOVEDOWN,KEYMOVESTRBACK]};
		
		if (diag_tickTime - _kt > 1.0) then { _k = [] };
		
		if (count _k == 1) then
		{
			switch (_k select 0) do
			{
				case (KEYMOVEFRONT):
				{
					if  (_be) then
					{
						_acx = _acx + 0.035 * CFMOVE * (cos _cm_codr) * (cos _cm_codv) * _cfzm;
						_acy = _acy + 0.035 * CFMOVE * (sin _cm_codr) * (cos _cm_codv) * _cfzm;
						_acz = _acz + 0.035 * CFMOVE * (sin _cm_codv) * _cfzm;
						_cm_cods_t = sqrt((_cm_cp_r select 0)^2 + (_cm_cp_r select 1)^2 + (_cm_cp_r select 2)^2) - 0.5;
					}
					else
					{
						_acx = _acx + 0.05 * (cos _dr) * CFMOVE * _cfzm;
						_acy = _acy + 0.05 * (sin _dr) * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVEBACK):
				{
					if  (_be) then
					{
						_acx = _acx - 0.035 * CFMOVE * (cos _cm_codr) * (cos _cm_codv) * _cfzm;
						_acy = _acy - 0.035 * CFMOVE * (sin _cm_codr) * (cos _cm_codv) * _cfzm;
						_acz = _acz - 0.035 * CFMOVE * (sin _cm_codv) * _cfzm;
						_cm_cods_t = sqrt((_cm_cp_r select 0)^2 + (_cm_cp_r select 1)^2 + (_cm_cp_r select 2)^2) + 0.5;
					}
					else
					{
						_acx = _acx - 0.05 * (cos _dr) * CFMOVE * _cfzm;
						_acy = _acy - 0.05 * (sin _dr) * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVELEFT):
				{
					if  (_be) then
					{
						if ( (180 - abs(180 - _cm_codr_d)) < 170 ) then { _cm_codr_a = _cm_codr_a - CFMOVE * 2.6 * _cfzm };
						if ( _cm_codr_a >= 360.0 ) then { _cm_codr_a = _cm_codr_a - 360.0 };
						if ( _cm_codr_a < 0.0 ) then { _cm_codr_a = _cm_codr_a + 360.0 };
					}
					else
					{
						_acx = _acx - 0.05 * (sin _dr) * CFMOVE * _cfzm;
						_acy = _acy + 0.05 * (cos _dr) * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVERIGHT):
				{
					if (_be) then
					{
						if ( (180 - abs(180 - _cm_codr_d)) < 170 ) then { _cm_codr_a = _cm_codr_a + CFMOVE * 2.6 * _cfzm };
						if ( _cm_codr_a >= 360.0 ) then { _cm_codr_a = _cm_codr_a - 360.0 };
						if ( _cm_codr_a < 0.0 ) then { _cm_codr_a = _cm_codr_a + 360.0 };
					}
					else
					{
						_acx = _acx + 0.05 * (sin _dr) * CFMOVE * _cfzm;
						_acy = _acy - 0.05 * (cos _dr) * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVEUP):
				{
					if ( _be ) then
					{
						_cm_codv_t = _cm_codv_t - 1.0;
						if (_cm_codv_t < -89.0) then
						{
							_cm_codv_t = -89.0;
							_acdv = 0.0;
						};
					}
					else
					{
						_acz = _acz + 0.05 * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVEDOWN):
				{
					if ( _be ) then
					{
						_cm_codv_t = _cm_codv_t + 1.0;
						if (_cm_codv_t > 89.0) then
						{
							_cm_codv_t = 89.0;
							_acdv = 0.0;
						};
					}
					else
					{
						_acz = _acz - 0.05 * CFMOVE * _cfzm;
					};
				};
				case (KEYMOVESTRFRONT):
				{
					if (_be and _fo) then
					{
						_acx = _acx + 0.075 * CFMOVE * (cos _cm_codr) * (cos _cm_codv) * _cfzm * _cfalt;
						_acy = _acy + 0.075 * CFMOVE * (sin _cm_codr) * (cos _cm_codv) * _cfzm * _cfalt;
						_acz = _acz + 0.075 * CFMOVE * (sin _cm_codv) * _cfzm * _cfalt;
						_cm_codv = (sqrt(((_cm_op select 0) - (_cm_cp select 0))^2.0 + ((_cm_op select 1) - (_cm_cp select 1))^2.0) atan2 ((_cm_op select 2) - (_cm_cp select 2)) - 90.0) * -1;
					}
					else
					{
						_acx = _acx + 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm * _cfalt;
						_acy = _acy + 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm * _cfalt;
						_acz = _acz + 0.075 * CFMOVE * (sin _dv) * _cfzm * _cfalt;
					};
				};
				case (KEYMOVESTRBACK):
				{
					if (_be and _fo) then
					{
						_acx = _acx - 0.075 * CFMOVE * (cos _cm_codr) * (cos _cm_codv) * _cfzm;
						_acy = _acy - 0.075 * CFMOVE * (sin _cm_codr) * (cos _cm_codv) * _cfzm;
						_acz = _acz - 0.075 * CFMOVE * (sin _cm_codv) * _cfzm;
						_cm_codv = (sqrt(((_cm_op select 0) - (_cm_cp select 0))^2.0 + ((_cm_op select 1) - (_cm_cp select 1))^2.0) atan2 ((_cm_op select 2) - (_cm_cp select 2)) - 90.0) * -1;
					}
					else
					{
						_acx = _acx - 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm * _cfalt;
						_acy = _acy - 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm * _cfalt;
						_acz = _acz - 0.075 * CFMOVE * (sin _dv) * _cfzm * _cfalt;
					};
				};
			};
		};
		
		if (_ku == KEYMODEFOLLOW) then
		{
			_cm_return = true;
			_cm_l = false;
		};
		
		
		if ( _be ) then
		{
			_cm_cods = sqrt((_cm_cp_r select 0)^2 + (_cm_cp_r select 1)^2 + (_cm_cp_r select 2)^2);
			if ( _cm_cods > 2.0 ) then { _cm_cftn = 1.0 + (9.0/(_c distance _cm_o)) };
			
			_cm_odr = ((getdir _cm_o) -90.0) * -1;
			if (_cm_odr >= 360.0) then { _cm_odr = _cm_odr - 360.0 };
			if (_cm_odr < 0.0) then { _cm_odr = _cm_odr + 360.0 };
			
			_cm_codr_t = _cm_odr + _cm_codr_a;
			if (_cm_codr_t >= 360.0) then { _cm_codr_t = _cm_codr_t - 360.0 };
			if (_cm_codr_t < 0.0) then { _cm_codr_t = _cm_codr_t + 360.0 };
			
			_cm_codr = ( ((_cm_cp_r select 0) atan2 (_cm_cp_r select 1)) + 90.0 ) * -1;
			if (_cm_codr >= 360.0) then { _cm_codr = _cm_codr - 360.0 };
			if (_cm_codr < 0.0) then { _cm_codr = _cm_codr + 360.0 };
			
			_cm_codr_d = _cm_codr_t - _cm_codr;
			if (_cm_codr_d >= 360.0) then { _cm_codr_d = _cm_codr_d - 360.0 };
			if (_cm_codr_d < 0.0) then { _cm_codr_d = _cm_codr_d + 360.0 };
			
			switch (true) do
			{
				case (_cm_codr_d > 180.0 and _cm_codr_d < 360.0):
				{
					_acx = _acx - (sin _cm_codr) * (abs(sin((_cm_codr_d)/2.0))) * _cm_cftn * BEHINDSPDAROUND;
					_acy = _acy + (cos _cm_codr) * (abs(sin((_cm_codr_d)/2.0))) * _cm_cftn * BEHINDSPDAROUND;
				};
				case (_cm_codr_d >= 0.0 and _cm_codr_d <= 180.0):
				{
					_acx = _acx + (sin _cm_codr) * (abs(sin((_cm_codr_d)/2.0))) * _cm_cftn * BEHINDSPDAROUND;
					_acy = _acy - (cos _cm_codr) * (abs(sin((_cm_codr_d)/2.0))) * _cm_cftn * BEHINDSPDAROUND;
				};
			};
			
			
			_cm_codv = ( (([_cm_cp select 0, _cm_cp select 1] distance [_cm_op select 0, _cm_op select 1]) atan2 ((_cm_op select 2) - (_cm_cp select 2))) - 90.0) * -1;
			_cm_codv_d = _cm_codv_t - _cm_codv;
			
			_cm_odv = asin((vectorDir _cm_o) select 2) * (cos _cm_codr_a);
			_cm_codv_d = _cm_codv_d + _cm_odv;
			
			_acx = _acx - (sin _cm_codv_d) * (cos _cm_codr) * (sin(_cm_codv - 180.0)) * _cm_cftn * BEHINDSPDAROUND * 0.5;
			_acy = _acy - (sin _cm_codv_d) * (sin _cm_codr) * (sin(_cm_codv - 180.0)) * _cm_cftn * BEHINDSPDAROUND * 0.5;
			_acz = _acz - (sin _cm_codv_d) * (cos _cm_codv) * _cm_cftn * BEHINDSPDAROUND * 0.5;
			
			_acx = _acx - (sin(_cm_cods_t - _cm_cods)) * (cos _cm_codr) * (cos _cm_codv);
			_acy = _acy - (sin(_cm_cods_t - _cm_cods)) * (sin _cm_codr) * (cos _cm_codv);
			_acz = _acz - (sin(_cm_cods_t - _cm_cods)) * (sin _cm_codv);
			
			if ( [_cm_cp select 0, _cm_cp select 1] distance [_cm_op select 0, _cm_op select 1] < 0.4 ) then
			{
				_cm_cp_r = [ -0.41 * (cos _cm_codr), -0.41 * (sin _cm_codr), -_cm_cods * (sin _cm_codv)];
				_cm_cods_t = sqrt((_cm_cp_r select 0)^2 + (_cm_cp_r select 1)^2 + (_cm_cp_r select 2)^2);
				if (_be) then
				{
					if (_cm_codv_t > 0.0) then
					{ _cm_codv_t = _cm_codv_t - 1.0 }
					else
					{ _cm_codv_t = _cm_codv_t + 1.0 };
				}
				else
				{
					_cm_codv_t = ( (_cm_cp_r select 2) atan2 ((sqrt((_cm_cp_r select 0)^2 + (_cm_cp_r select 1)^2))) ) * (-1);
				};
				
				_acx = 0.0;
				_acy = 0.0;
				_acz = 0.0;
			};
			
			
			_cm_cdr_a = _cm_cdr_a + _acdr;
			if ( _cm_cdr_a >= 360.0 ) then { _cm_cdr_a = _cm_cdr_a - 360.0 };
			if ( _cm_cdr_a < 0.0 ) then { _cm_cdr_a = _cm_cdr_a + 360.0 };
			
			_cm_cdr_t = _dr - _cm_cdr_a;
			if ( _cm_cdr_t >= 360.0 ) then { _cm_cdr_t = _cm_cdr_t - 360.0 };
			if ( _cm_cdr_t < 0.0 ) then { _cm_cdr_t = _cm_cdr_t + 360.0 };
			
			_cm_cdr_d = _cm_odr - _cm_cdr_t;
			if ( _cm_cdr_d >= 360.0 ) then { _cm_cdr_d = _cm_cdr_d - 360.0 };
			if ( _cm_cdr_d < 0.0 ) then { _cm_cdr_d = _cm_cdr_d + 360.0 };
			
			_cm_cdr_d = _cm_cdr_d + _cm_codr_a;
			if ( _cm_cdr_d >= 360.0 ) then { _cm_cdr_d = _cm_cdr_d - 360.0 };
			if ( _cm_cdr_d < 0.0 ) then { _cm_cdr_d = _cm_cdr_d + 360.0 };
			
			switch (true) do
			{
				case (_cm_cdr_d >= 0.0 and _cm_cdr_d < 180.0) : { _dr = _dr + (abs(sin(_cm_cdr_d/2.0))) * _cfzm * (_be_cftn^BEHINDSPDROTATE) };
				case (_cm_cdr_d >= 180.0 and _cm_cdr_d < 360.0) : { _dr = _dr - (abs(sin(_cm_cdr_d/2.0))) * _cfzm * (_be_cftn^BEHINDSPDROTATE) };
			};
			if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
			if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
			
			
			_cm_codv_d = _cm_codv - _dv;
			_cm_cdv_a = _cm_cdv_a + _acdv;
			_cm_codv_d = _cm_codv_d + _cm_cdv_a;
			switch (true) do
			{
				case (_cm_codv_d > 0.0) : { _dv = _dv + abs(sin(_cm_codv_d/2.0)) * _cm_cftn * 5.0 };
				case (_cm_codv_d <= 0.0) : { _dv = _dv - abs(sin(_cm_codv_d/2.0)) * _cm_cftn * 5.0 };
			};
			_dv = (_dv min 89.0) max -89.0;
		};
		
		_cm_cp_r = [ (_cm_cp_r select 0) + _acx, (_cm_cp_r select 1) + _acy, (_cm_cp_r select 2) + _acz ];
		_cm_op = getPosASL _cm_o;
		_cm_cp = [ (_cm_op select 0) + (_cm_cp_r select 0), (_cm_op select 1) + (_cm_cp_r select 1), (_cm_op select 2) + (_cm_cp_r select 2) ];
		_c setPosASL [ _cm_cp select 0, _cm_cp select 1, _cm_cp select 2 ];
		_c camSetTarget [ (_cm_cp select 0) + (cos(_dr+GCam_X)) * (cos(_dv+GCam_Y)) * 100000.0, (_cm_cp select 1) + (sin(_dr+GCam_X)) * (cos(_dv+GCam_Y)) * 100000.0, (_cm_cp select 2) + (sin(_dv+GCam_Y)) * 100000.0];
		_c camCommit 0;
		
		_w = accTime / (diag_fps * 2);
		sleep _w;
	};
	
	if (!(_cm_return)) then { _cp_r = [(_cm_cp select 0)-(_op select 0),(_cm_cp select 1)-(_op select 1),(_cm_cp select 2)-(_op select 2)] };
	
	setAccTime _cm_rcvacctime;
	
	if (_cm_return) then
	{
		_cm_return = false;
	}
	else
	{
		_fo = false;
		_fc = false;
	};
	
	if (_cm_listshow) then
	{
		call _OpenList;
		_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
		[_li_ol] call _ListObjects;
		
		_cm_listshow = false;
	};
	
	GCam_S = false;
	
	_kd = -1;
	_ku = -1;
	GCam_KD set [1, -1];
	GCam_KU set [1, -1];
};



_SwitchAdjustDistance =
{
	switch (true) do
	{
		case (_o isKindOf "Car"):
		{
			_cp_r set [ 2, 1.2 + 1.2 ];
			_fo_cods = 6.6;
			_fo_cods_z = 2.4;
			_be_ofz = 2.4;
		};
		case (_o isKindOf "Tank"):
	    {
			_cp_r set [ 2, 1.2 + 1.75 ];
			_fo_cods = 7.5;
			_fo_cods_z = 2.95;
			_be_ofz = 2.95;
		};
		case (_o isKindOf "Helicopter"):
	    {
			_cp_r set [ 2, 1.2 + 2.3 ];
			_fo_cods = 10.0;
			_fo_cods_z = 3.5;
			_be_ofz = 3.5;
		};
		case (_o isKindOf "Air"):
	    {
			_cp_r set [ 2, 1.2 + 2.7 ];
			_fo_cods = 15.0;
			_fo_cods_z = 2.9;
			_be_ofz = 2.8;
		};
		case (_o isKindOf "Ship"):
	    {
			_cp_r set [ 2, 1.2 + 1.5 ];
			_fo_cods = 7.5;
			_fo_cods_z = 2.7;
			_be_ofz = 2.7;
		};
		default
		{
			_cp_r set [ 2, 1.2 + 0.5 ];
			_fo_cods = 2.6;
			_fo_cods_z = 1.7;
			_be_ofz = 1.57;
		};
	};
	
	if ( _be ) then
	{
		_be_cods_t = sqrt((_fo_cods * (cos _be_codr) * (-1))^2 + (_fo_cods * (sin _be_codr) * (-1))^2 + (_cp_r select 2)^2);
		_be_cods = _be_cods_t;
	};
	
	if ( _fo and !(_be) ) then
	{
		_re_camobjdir = ( ( (_re_cp_r_l select 0) atan2 (_re_cp_r_l select 1) ) -90.0 ) * -1;
		_cp_r = [ cos(_re_camobjdir) * _fo_cods, sin(_re_camobjdir) * _fo_cods, _fo_cods_z ];
	};
};


_ResetCamera =
{
	_acx = 0;
	_acy = 0;
	_acz = 0;
	_acdr = 0;
	_acdv = 0;
	_aczm = 0;
	
	titleText[ "", "plain down", 0.0 ];
	
	if (_li) then { lbClear 0 };
	
	if (_vm > 0) then
	{
		_c cameraEffect ["Internal", "Back"];
	};
	
	_re_cp_r_l = _cp_r;
	
	if ( SWITCHADJDIS ) then
	{
		call _SwitchAdjustDistance;
	};
	
	
	if (!(_o isKindOf "Man")) then
	{
		_be_crt = 0.0;
		_fc_crt = 0.0;
	};
	
	if ( SWITCHCENTER or _cs_change ) then
	{
		if ( _be ) then
		{
			_be_cdr_a = 0.0;
		};
		if ( !(_fo) and _fc ) then
		{
			_fc_cdr_a = 0.0;
			_fc_cdv_a = 0.0;
		};
	};
	
	
	if (_trg) then
	{
		_o_l removeEventHandler ["fired", _tr_ehidx];
		_o_l removeEventHandler ["GetOut", _tr_ehidx2];
	};
	
	if ( SWITCHSMOOTH ) then { call _SmoothMove };
	
	if (_trg) then { call _SetFiredHandler };
	
	
	if ( _fo and _be ) then
	{
		_be_odr = ((getdir _o) -90.0) * -1;
		if (_be_odr >= 360.0) then { _be_odr = _be_odr - 360.0 };
		if (_be_odr < 0.0) then { _be_odr = _be_odr + 360.0 };
		
		_dr = _be_odr + _be_cdr_a;
		if (_dr >= 360.0) then { _dr = _dr - 360.0 };
		if (_dr < 0.0) then { _dr = _dr + 360.0 };
		
		_dr = _dr + _be_codr_a;
		if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
		if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
		
		_cp_r = [ _be_cods_t * cos(_be_odr+180.0+_be_codr_a) * (cos _be_codv_t), _be_cods_t * sin(_be_odr+180.0+_be_codr_a) * (cos _be_codv_t), -_be_cods_t * (sin _be_codv_t) + _be_ofz];
	};
	
	if ( _cs_change and _fo and !(_be) ) then
	{
		_cp_r = [ cos(_dr+180.0) * _fo_cods, sin(_dr+180.0) * _fo_cods, _fo_cods_z ];
	};
	
	if ( !(_fo) and _fc ) then
	{
		if ( _be ) then
		{
			_fc_odr = ((getdir _o) -90.0) * -1;
			if (_fc_odr >= 360.0) then { _fc_odr = _fc_odr - 360.0 };
			if (_fc_odr < 0.0) then { _fc_odr = _fc_odr + 360.0 };
			
			_dr = _fc_odr + _fc_cdr_a;
			if (_dr >= 360.0) then { _dr = _dr - 360.0 };
			if (_dr < 0.0) then { _dr = _dr + 360.0 };
			
			_dr = _dr + _be_codr_a;
			if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
			if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
			
			_cp_r = [ cos(_fc_odr+180.0+_be_codr_a) * _fo_cods, sin(_fc_odr+180.0+_be_codr_a) * _fo_cods, _fo_cods_z ];
		}
		else
		{
			
		};
	};
	
	if ( !(_fo) and !(_fc) ) then
	{
		_cp_r = [ cos(_dr+180.0) * _fo_cods, sin(_dr+180.0) * _fo_cods, _fo_cods_z ];
	};
	
	
	_op = getPosASL _o;
	_cp = [ (_op select 0) + (_cp_r select 0) , (_op select 1) + (_cp_r select 1), (_op select 2) + (_cp_r select 2) ];
	_c setPosASL [ _cp select 0, _cp select 1, (_cp select 2) + _be_crt ];
	_c camSetTarget [ (_cp select 0) + (cos _dr) * (cos _dv) * 100000.0, (_cp select 1) + (sin _dr) * (cos _dv) * 100000.0, (_cp select 2) + (sin _dv) * 100000.0];
	_c camCommit 0;
	
	if (_li) then
	{
		call _CreateGroupMarker;
	};
	
	
	switch (_vm) do
	{
		case (0):
		{
			_initobject switchCamera _initcamview;
			if (RADIOMESSAGE) then { _o switchCamera "INTERNAL" };
		};
		case (1):
		{
			_c cameraEffect ["Terminate", "Back"];
			_o switchCamera "INTERNAL";
		};
		case (2):
		{
			_c cameraEffect ["Terminate", "Back"];
			_o switchCamera "EXTERNAL";
		};
		case (3):
		{
			_c cameraEffect ["Terminate", "Back"];
			_o switchCamera "GUNNER";
		};
	};
	
	
	_tx_crewname = "";
	if ( count(crew _o) > 1 ) then
	{
		{
			if (((crew _o) select 0) != _x) then { _tx_crewname = _tx_crewname + ", " };
			_tx_crewname = _tx_crewname + format["%1", name _x];
		} forEach (crew _o);
	}
	else
	{
		_tx_crewname = name _o;
	};
	
	if (SHOWUNITNAME) then { titleText[ format[ "%1 : %2\n%3", getText( configFile >> "CfgVehicles" >> (typeOf _o) >> "displayName" ), _tx_crewname, group _o], "plain down", _w*40 ] };
	
	ctrlSetFocus (findDisplay 5100 displayCtrl 100);
};


sleep _w;

_ehid_keydown = (findDisplay 46) displayAddEventHandler ["KeyDown", "GCam_KD = _this"];
_ehid_keyup = (findDisplay 46) displayAddEventHandler ["KeyUp", "GCam_KU = _this"];
_ehid_mousemove = (findDisplay 46) displayAddEventHandler ["MouseMoving", "GCam_MM = _this"];
_ehid_mousezchange = (findDisplay 46) displayAddEventHandler ["MouseZChanged", "GCam_MW = _this"];
_ehid_mousebd = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", "GCam_MD = _this"];
_ehid_mousebu = (findDisplay 46) displayAddEventHandler ["MouseButtonUp", "GCam_MU = _this"];

if (isNil "_this") then
{ _o = player }
else
{ _o = vehicle (_this select 0) };
if (isNil"_o") then { _o = player };
_o_l = _o;
_initobject = _o;

_dr = ((getdir _o)-90)*-1;
_dv = INITCAMAGL;
_cp_r = [ cos(_dr+180) * INITCAMDISY, sin(_dr+180) * INITCAMDISY, INITCAMDISZ ];
_op = getPosASL _o;
_cp = [ (_op select 0) + (_cp_r select 0), (_op select 1) + (_cp_r select 1), (_op select 2) + (_cp_r select 2)];


_c = "camera" camCreate [0.0,0.0,0.0];
_c setPosASL [_cp select 0, _cp select 1, _cp select 2];
_c camSetTarget [ (_cp select 0) + (cos _dr) * (cos _dv) * 100000.0, (_cp select 1) + (sin _dr) * (cos _dv) * 100000.0, (_cp select 2) + (sin _dv) * 100000.0];
_c cameraEffect ["Internal", "Back"];
_c camSetFov _zm;
_c camCommit 0;

sleep _w;
showCinemaBorder false;

call _ResetCamera;




while {_l} do
{
	_acx = _acx * MOVEATTEN;
	_acy = _acy * MOVEATTEN;
	_acz = _acz * MOVEATTEN;
	_acdr = _acdr * TURNATTEN;
	_acdv = _acdv * TURNATTEN;
	_aczm = _aczm * ZOOMATTEN;
	
	if (GCam_T) then
	{
		GCam_T = false;
		
		if (_fo and _vm == 0) then
		{
			if (GCam_Trigger_Fire) then
			{
				if (CHASECAMERASHAKE) then
				{
					[ 15, 73, 112, 0.2, 13, 71, 118, 0.2, 0.04 ] spawn
					{
						GCam_X = 0.0;
						GCam_Y = 0.0;
						
						_t = _this select 8;
						
						_w1 = (_this select 0) * (_t / 0.05);
						_w2 = (_this select 1) * (_t / 0.05);
						_w3 = (_this select 2) * (_t / 0.05);
						_s1 = (_this select 3) * (_t / 0.05);
						_w4 = (_this select 4) * (_t / 0.05);
						_w5 = (_this select 5) * (_t / 0.05);
						_w6 = (_this select 6) * (_t / 0.05);
						_s2 = (_this select 7) * (_t / 0.05);
						
						_a1 = 90.0;
						_a2 = 90.0;
						_a3 = 90.0;
						_a4 = 90.0;
						_a5 = 90.0;
						_a6 = 90.0;
						if (_w1 != 0.0) then { _a1 = random 360.0 };
						if (_w2 != 0.0) then { _a2 = random 360.0 };
						if (_w3 != 0.0) then { _a3 = random 360.0 };
						if (_w4 != 0.0) then { _a4 = random 360.0 };
						if (_w5 != 0.0) then { _a5 = random 360.0 };
						if (_w6 != 0.0) then { _a6 = random 360.0 };
						
						GCam_S = true;
						while { GCam_S } do
						{
							GCam_X = GCam_X + ((cos _a1) + (cos _a2)/1.5 + (cos _a3)/2) * _s1;
							GCam_Y = GCam_Y + ((cos _a4) + (cos _a5)/1.5 + (cos _a6)/2) * _s2;
							
							_a1 = _a1 + _w1;
							_a2 = _a2 + _w2;
							_a3 = _a3 + _w3;
							_a4 = _a4 + _w4;
							_a5 = _a5 + _w5;
							_a6 = _a6 + _w6;
							
							sleep _t;
						};
						
						GCam_X = 0.0;
						GCam_Y = 0.0;
					};
				};
				
				call _ChaseMissile;
				
				GCam_Trigger_Fire = false;
			};
			
			if (GCam_Trigger_Eject) then
			{
				GCam_Trigger_Eject = false;
				
				_o = vehicle GCam_O;
				
				lbClear 50;
				lbSetCurSel [50, 0];
				
				call _ResetCamera;
				_o_l = _o;
				
				_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
				[_li_ol] call _ListObjects;
			};
		};
	};
	
	
	if (!(isNil "GCam_OC")) then { _oc = GCam_OC select 3 };
	
	if (!(isNil "GCam_MD")) then { _md = GCam_MD select 1 };
	if (!(isNil "GCam_MU")) then { _mu = GCam_MU select 1 };
	if (_md == 0 and _mu != 0 and !(_cs_m)) then
	{
		_cs_bdtime = diag_tickTime;
		
		_cs_m = true;
		GCam_MM = [controlNull,0.0,0.0];
		
		if (!(GCam_F)) then { ctrlSetFocus (findDisplay 5100 displayCtrl 100) };
	};
	if ( (_mu == 0) or (_mu == 1 and _md == 1) ) then
	{
		_cs_m = false;
		_mbld = false;
		
		if (!(isNil "GCam_OCL")) then { _ocl = GCam_OCL select 3 };
		if (!(_oc) and !(_ocl)) then { call _ClickSwitch };
		
		GCam_MD set [1, -1];
		GCam_MU set [1, -1];
	};
	if (_mu == 1) then
	{
		_aczm = 0.0;
		_zm = 0.7;
		_c camSetFov _zm;
		_cfzm = sin ((_zm / 1.8) * 90.0);
	};
	
	if (!(_li) and _vm == 0) then
	{
		_mm = [ GCam_MM select 1, GCam_MM select 2 ];
		_acm = accTime^1.5 + 0.007;
		_acdr = _acdr + (_mm select 0) * -MOUSEMOVEACCX * CFTRK * _cfzm / (cos abs(_dv / (1.0 + _cfzm))) * _acm;
		_acdv = _acdv + (_mm select 1) * -MOUSEMOVEACCY * CFTRK * _cfzm * _acm;
		
		_dr = _dr + _acdr;
		if (_dr >= 360.0) then { _dr = _dr - 360.0 };
		if (_dr < 0.0) then { _dr = _dr + 360.0 };
		
		_dv = _dv + _acdv;
		if (_dv > 89.9) then
		{
			_dv = 89.9;
			_acdv = 0.0;
		};
		if (_dv < -89.9) then
		{
			_dv = -89.9;
			_acdv = 0.0;
		};
		
		GCam_MM set [ 1, 0.0 ];
		GCam_MM set [ 2, 0.0 ];
	};
	
	_wl = GCam_MW select 1;
	if ((_wl > 0.00001 or _wl < -0.00001)) then
	{
		_aczm = _aczm - _wl * 0.12 * CFWHEEL * sin((_zm / 2.0) * 90.0);
		GCam_MW set [1, 0];
	};
	if ((abs _aczm) > 0.00001) then
	{
		_zm = _zm + _aczm;
		if (_zm < 0.01) then
		{
			_zm = 0.01;
			_aczm = 0.0;
		};
		if (_zm > 2.0) then
		{
			_zm = 2.0;
			_aczm = 0.0;
		};
		_c camSetFov _zm;
		_cfzm = sin ((_zm / 1.8) * 90);
	};
	
	
	if (!(isNil "GCam_KD")) then { _kd = GCam_KD select 1 };
	if (!(isNil "GCam_KU")) then { _ku = GCam_KU select 1 };
	GCam_KD set [1,-1];
	GCam_KU set [1,-1];
	if (_kd != -1 or _ku != -1) then {_kt = diag_tickTime};
	if (count _k == 0 and _kd != -1) then { _k = _k + [_kd] };
	if (count _k == 1 and _kd != _k select 0) then { _k = _k + [_kd] };
	if (_ku in _k) then { _k = _k - [_ku] };
	if (_oc) then {_k = _k - [KEYMOVEUP,KEYMOVEFRONT,KEYMOVELEFT,KEYMOVEBACK,KEYMOVERIGHT,KEYMOVEDOWN,KEYMOVESTRBACK]};
	
	if (diag_tickTime - _kt > 1.0) then { _k = [] };
	
	if (count _k == 1) then
	{
		switch (_k select 0) do
		{
			case (KEYMOVEFRONT):
			{
				if (_be and _fo) then
				{
					_acx = _acx + 0.035 * CFMOVE * (cos _be_codr) * (cos _be_codv) * _cfzm;
					_acy = _acy + 0.035 * CFMOVE * (sin _be_codr) * (cos _be_codv) * _cfzm;
					_acz = _acz + 0.035 * CFMOVE * (sin _be_codv) * _cfzm;
					_be_cods_t = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2) - 0.5;
				}
				else
				{
					_acx = _acx + 0.05 * (cos _dr) * CFMOVE * _cfzm * _cfalt;
					_acy = _acy + 0.05 * (sin _dr) * CFMOVE * _cfzm * _cfalt;
					
				};
			};
			case (KEYMOVEBACK):
			{
				if (_be and _fo) then
				{
					_acx = _acx - 0.035 * CFMOVE * (cos _be_codr) * (cos _be_codv) * _cfzm;
					_acy = _acy - 0.035 * CFMOVE * (sin _be_codr) * (cos _be_codv) * _cfzm;
					_acz = _acz - 0.035 * CFMOVE * (sin _be_codv) * _cfzm;
					_be_cods_t = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2) + 0.5;
				}
				else
				{
					_acx = _acx - 0.05 * (cos _dr) * CFMOVE * _cfzm * _cfalt;
					_acy = _acy - 0.05 * (sin _dr) * CFMOVE * _cfzm * _cfalt;
				};
			};
			case (KEYMOVELEFT):
			{
				if (_be and _fo) then
				{
					if ( (180 - abs(180 - _be_codr_d)) < 170 ) then { _be_codr_a = _be_codr_a - CFMOVE * 2.6 * _cfzm };
					if ( _be_codr_a >= 360.0 ) then { _be_codr_a = _be_codr_a - 360.0 };
					if ( _be_codr_a < 0.0 ) then { _be_codr_a = _be_codr_a + 360.0 };
				}
				else
				{
					_acx = _acx - 0.05 * (sin _dr) * CFMOVE * _cfzm * _cfalt;
					_acy = _acy + 0.05 * (cos _dr) * CFMOVE * _cfzm * _cfalt;
				};
			};
			case (KEYMOVERIGHT):
			{
				if (_be and _fo) then
				{
					if ( (180 - abs(180 - _be_codr_d)) < 170 ) then { _be_codr_a = _be_codr_a + CFMOVE * 2.6 * _cfzm };
					if ( _be_codr_a >= 360.0 ) then { _be_codr_a = _be_codr_a - 360.0 };
					if ( _be_codr_a < 0.0 ) then { _be_codr_a = _be_codr_a + 360.0 };
				}
				else
				{
					_acx = _acx + 0.05 * (sin _dr) * CFMOVE * _cfzm * _cfalt;
					_acy = _acy - 0.05 * (cos _dr) * CFMOVE * _cfzm * _cfalt;
				};
			};
			case (KEYMOVEUP):
			{
				if ( _fo ) then
				{
					if ( _be ) then
					{
						_be_codv_t = _be_codv_t - 1.0;
						if (_be_codv_t < -89.0) then
						{
							_be_codv_t = -89.0;
							_acdv = 0.0;
						};
					}
					else
					{
						_acz = _acz + 0.05 * CFMOVE * _cfzm;
					};
				}
				else
				{
					_acz = _acz + 0.05 * CFMOVE * _cfzm * _cfalt;
				};
			};
			case (KEYMOVEDOWN):
			{
				if ( _fo ) then
				{
					if ( _be ) then
					{
						_be_codv_t = _be_codv_t + 1.0;
						if (_be_codv_t > 89.0) then
						{
							_be_codv_t = 89.0;
							_acdv = 0.0;
						};
					}
					else
					{
						_acz = _acz - 0.05 * CFMOVE * _cfzm;
					};
				}
				else
				{
					_acz = _acz - 0.05 * CFMOVE * _cfzm * _cfalt;
				};
			};
			case (KEYMOVESTRFRONT):
			{
				if (_be and _fo) then
				{
					_acx = _acx + 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm;
					_acy = _acy + 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm;
					_acz = _acz + 0.075 * CFMOVE * (sin _dv) * _cfzm;
					_be_cods_t = sqrt(((_cp_r select 0)+_acx)^2 + ((_cp_r select 1)+_acy)^2 + (((_cp_r select 2)+_acz)-_be_ofz)^2);
					_be_codr_a = (( (((_cp_r select 0)+_acx) atan2 ((_cp_r select 1)+_acy)) + 90.0 ) * -1) - _be_odr;
					_be_codv_t = ( (((_cp_r select 2)+_acz) - _be_ofz) atan2 ((sqrt(((_cp_r select 0)+_acx)^2 + ((_cp_r select 1)+_acy)^2))) ) * (-1);
					_be_cdr_d = _be_cdr_d - _be_codr_a;
				}
				else
				{
					_acx = _acx + 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm * _cfalt;
					_acy = _acy + 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm * _cfalt;
					_acz = _acz + 0.075 * CFMOVE * (sin _dv) * _cfzm * _cfalt;
				};
			};
			case (KEYMOVESTRBACK):
			{
				if (_be and _fo) then
				{
					_acx = _acx - 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm;
					_acy = _acy - 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm;
					_acz = _acz - 0.075 * CFMOVE * (sin _dv) * _cfzm;
					_be_cods_t = sqrt(((_cp_r select 0)+_acx)^2 + ((_cp_r select 1)+_acy)^2 + (((_cp_r select 2)+_acz)-_be_ofz)^2);
					_be_codr_a = (( (((_cp_r select 0)+_acx) atan2 ((_cp_r select 1)+_acy)) + 90.0 ) * -1) - _be_odr;
					_be_codv_t = ( (((_cp_r select 2)+_acz) - _be_ofz) atan2 ((sqrt(((_cp_r select 0)+_acx)^2 + ((_cp_r select 1)+_acy)^2))) ) * (-1);
					_be_cdr_d = _be_cdr_d - _be_codr_a;
				}
				else
				{
					_acx = _acx - 0.075 * CFMOVE * (cos _dr) * (cos _dv) * _cfzm * _cfalt;
					_acy = _acy - 0.075 * CFMOVE * (sin _dr) * (cos _dv) * _cfzm * _cfalt;
					_acz = _acz - 0.075 * CFMOVE * (sin _dv) * _cfzm * _cfalt;
				};
			};
		};
	};
	
	
	#ifdef PARAMTRACK
		if (_ku == KEYPTMCOM1) then
		{
			call compile ctrlText 55;
		};
		if (_ku == KEYPTMCOM2) then
		{
			call compile ctrlText 56;
		};
		if (_ku == KEYPTMCOM3) then
		{
			call compile ctrlText 57;
		};
		if (_ku == KEYPTMCOM4) then
		{
			call compile ctrlText 58;
		};
	#endif
	
	
	if (_ku == KEYMODEFOLLOW) then
	{
		call _ChangeModeFollow;
	};
	if (_ku == KEYMODEBEHIND) then
	{
		call _ChangeModeBehind;
	};
	if (_ku == KEYMODEFOCUS) then
	{
		call _ChangeModeFocus;
	};
	if (SHOWTRIGGER and _ku == KEYMODETRIGGER) then
	{
		call _ChangeModeTrigger;
	};
	
	if (_kd == KEYUNITNEXT) then
	{
		call _SelectCycleUnits;
		
		if (count _cy_ol_g > 0) then
		{
			_cy_n = _cy_n + 1;
			if ((count _cy_ol_g) == _cy_n) then { _cy_n = 0 };
			_o = _cy_ol_g select _cy_n;
			
			while {_o isKindOf "BIS_alice_emptydoor"} do
			{
				_cy_n = _cy_n + 1;
				if ((count _cy_ol_g) == _cy_n) then { _cy_n = 0 };
				_o = _cy_ol_g select _cy_n;
			};
			
			_cgk = _kd;
			call _ResetCamera;
			_o_l = _o;
			
			_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			[_li_ol] call _ListObjects;
		};
	};
	if (_kd == KEYUNITPREVIOUS) then
	{
		call _SelectCycleUnits;
		
		if (count _cy_ol_g > 0) then
		{
			_cy_n = _cy_n - 1;
			if (_cy_n < 0) then { _cy_n = (count _cy_ol_g) - 1 };
			_o = _cy_ol_g select _cy_n;
			
			while {_o isKindOf "BIS_alice_emptydoor"} do
			{
				_cy_n = _cy_n - 1;
				if (_cy_n < 0) then { _cy_n = (count _cy_ol_g) - 1 };
				_o = _cy_ol_g select _cy_n;
			};
			
			_cgk = _kd;
			call _ResetCamera;
			_o_l = _o;
			
			_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			[_li_ol] call _ListObjects;
		};
	};
	if (_kd == KEYGROUPNEXT) then
	{
		call _SelectCycleLeaders;
		
		_cy_n = _cy_n + 1;
		if ((count _cy_ol) == _cy_n) then { _cy_n = 0 };
		_o = _cy_ol select _cy_n;
		
		_cy_sn = 1;
		while {_o isKindOf "BIS_alice_emptydoor" and count(units(group _o)) > _cy_sn} do
		{
			_o = units(group _o) select _cy_sn;
			_cy_sn = _cy_sn + 1;
		};
		
		_cgk = _kd;
		call _ResetCamera;
		_o_l = _o;
		
		_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
		[_li_ol] call _ListObjects;
	};
	if (_kd == KEYGROUPPREVIOUS) then
	{
		call _SelectCycleLeaders;
		
		_cy_n = _cy_n - 1;
		if (_cy_n < 0) then { _cy_n = (count _cy_ol) - 1 };
		_o = _cy_ol select _cy_n;
		
		_cy_sn = 1;
		while {_o isKindOf "BIS_alice_emptydoor" and count(units(group _o)) > _cy_sn} do
		{
			_o = units(group _o) select _cy_sn;
			_cy_sn = _cy_sn + 1;
		};
		
		_cgk = _kd;
		call _ResetCamera;
		_o_l = _o;
		
		_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
		[_li_ol] call _ListObjects;
	};
	
	if (_ku == KEYFLIR) then
	{
		_nvg = (_nvg + 1) mod 5;
		
		switch (_nvg) do
		{
			case (0):
			{
				false setCamUseTi 0;
			};
			case (1):
			{
				camUseNVG true;
			};
			case (2):
			{
				camUseNVG false;
				true setCamUseTi 0;
			};
			case (3):
			{
				true setCamUseTi 1;
			};
			case (4):
			{
				true setCamUseTi 2;
			};
		};
	};
	
	if (_ku == KEYMODEVIEW) then
	{
		_vm = (_vm + 1) mod 4;
		
		switch (_vm) do
		{
			case (0):
			{
				_c cameraEffect ["Internal", "Back"];
				
				_initobject switchCamera _initcamview;
				if (RADIOMESSAGE) then { _o switchCamera "INTERNAL" };
				
				lbSetCurSel [2, 0];
				if (SHOWNOTICETEXT) then { titleText[ "GCam View", "plain down", _w*15 ] };
			};
			case (1):
			{
				_c cameraEffect ["Terminate", "Back"];
				
				_o switchCamera "INTERNAL";
				
				lbSetCurSel [2, 1];
				if (SHOWNOTICETEXT) then { titleText[ "1st Person View", "plain down", _w*15 ] };
			};
			case (2):
			{
				_o switchCamera "EXTERNAL";
				
				lbSetCurSel [2, 2];
				if (SHOWNOTICETEXT) then { titleText[ "3rd Person View", "plain down", _w*15 ] };
			};
			case (3):
			{
				_o switchCamera "GUNNER";
				
				lbSetCurSel [2, 3];
				if (SHOWNOTICETEXT) then { titleText[ "Variable View", "plain down", _w*15 ] };
			};
		};
	};
	
	
	if (_ku == KEYLIST) then
	{
		_li = !(_li);
		
		if (_li) then
		{
			call _OpenList;
			_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			[_li_ol] call _ListObjects;
		}
		else
		{
			call _CloseList;
		};
	};
	if (_li) then
	{
		if (_md == 0 and _mu != 0 and !(_oc) and _vm == 0) then
		{
			_mm = [ GCam_MM select 1, GCam_MM select 2 ];
			_acm = accTime^1.5 + 0.007;
			_acdr = _acdr + (_mm select 0) * -MOUSEDRAGACCX * CFTRK * _cfzm / (cos abs(_dv / (1.0 + _cfzm))) * _acm;
			_acdv = _acdv + (_mm select 1) * -MOUSEDRAGACCY * CFTRK * _cfzm * _acm;
			
			_dr = _dr + _acdr;
			if (_dr >= 360.0) then { _dr = _dr - 360.0 };
			if (_dr < 0.0) then { _dr = _dr + 360.0 };
			
			_dv = _dv + _acdv;
			if (_dv > 89.9) then
			{
				_dv = 89.9;
				_acdv = 0.0;
			};
			if (_dv < -89.9) then
			{
				_dv = -89.9;
				_acdv = 0.0;
			};
			
			GCam_MM set [ 1, 0.0 ];
			GCam_MM set [ 2, 0.0 ];
		};
		
		
		if (!(isNil "_lsc")) then { _lsc = GCam_LSC select 1 };
		if ( _lsc != -1 ) then
		{
			sleep (_w*15);
			
			GCam_LSC set [1,-1];
			GCam_MD set [1, -1];
			GCam_MU set [1, -1];
			
			if ( alive(_li_ol select _lsc) ) then
			{
				_o = _li_ol select _lsc;
			};
			
			_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			if ((count _li_ol) == 0) then
			{
				_o = _o_l;
				_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			};
			
			lbClear 50;
			lbSetCurSel [50, 0];
			
			if ((_o != _o_l) or !(_fo)) then
			{
				call _ResetCamera;
				_o_l = _o;
			};
			
			[_li_ol] call _ListObjects;
			
			_og = grpNull;
		};
		
		if (GCam_B) then
		{
			switch (GCam_BId) do
			{
				case ("fo"):
				{
					call _ChangeModeFollow;
				};
				case ("be"):
				{
					call _ChangeModeBehind;
				};
				case ("fc"):
				{
					call _ChangeModeFocus;
				};
				case ("trg"):
				{
					call _ChangeModeTrigger;
				};
				case ("ti"):
				{
					if ( (accTime + 0.1) <= 4.0 ) then { setAccTime ((round((accTime + 0.1)*10))*0.1) };
					(findDisplay 5100 displayCtrl 10) ctrlSetText format["%1",accTime];
				};
				case ("td"):
				{
					if ( (accTime - 0.1) >= 0.0 ) then { setAccTime ((round((accTime - 0.1)*10))*0.1) };
					(findDisplay 5100 displayCtrl 10) ctrlSetText format["%1",accTime];
				};
				case ("hp"):
				{
					_help = !(_help);
					
					if (_help) then
					{
						(findDisplay 5100 displayCtrl 79) ctrlShow true;
						(findDisplay 5100 displayCtrl 80) ctrlShow true;
						(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTON;
					}
					else
					{
						(findDisplay 5100 displayCtrl 79) ctrlShow false;
						(findDisplay 5100 displayCtrl 80) ctrlShow false;
						(findDisplay 5100 displayCtrl 21) ctrlSetTextColor COLORBUTTONTEXTOFF;
					};
				};
				case ("vc"):
				{
					if (!(_listopening)) then
					{
						_vm = lbCurSel 2;
						switch (_vm) do
						{
							case (0):
							{
								_c cameraEffect ["Internal", "Back"];
								
								_initobject switchCamera _initcamview;
								if (RADIOMESSAGE) then { _o switchCamera "INTERNAL" };
								
								lbSetCurSel [2, 0];
								if (SHOWNOTICETEXT) then { titleText[ "GCam View", "plain down", _w*15 ] };
							};
							case (1):
							{
								_c cameraEffect ["Terminate", "Back"];
								
								_o switchCamera "INTERNAL";
								
								lbSetCurSel [2, 1];
								if (SHOWNOTICETEXT) then { titleText[ "1st Person View", "plain down", _w*15 ] };
							};
							case (2):
							{
								_c cameraEffect ["Terminate", "Back"];
								
								_o switchCamera "EXTERNAL";
								
								lbSetCurSel [2, 2];
								if (SHOWNOTICETEXT) then { titleText[ "3rd Person View", "plain down", _w*15 ] };
							};
							case (3):
							{
								_c cameraEffect ["Terminate", "Back"];
								
								_o switchCamera "GUNNER";
								
								lbSetCurSel [2, 3];
								if (SHOWNOTICETEXT) then { titleText[ "Variable View", "plain down", _w*15 ] };
							};
						};
					};
					_listopening = false;
				};
			};
			GCam_BId = "";
			GCam_B = false;
		};
		
		
		if (!(isNil "GCam_MD2")) then { _ma_md = GCam_MD2 };
		if (_ma_md select 1 == 0) then
		{
			_ma_pm = _ma_md select 2;
			_ma_pb = ctrlPosition (findDisplay 5100 displayCtrl 22);
			_ma_pd = ctrlPosition (findDisplay 5100 displayCtrl 100);
			
			GCam_MD2 = [controlNull,-1,0.0,0.0,false,false,false];
			GCam_MU2 = [controlNull,-1,0.0,0.0,false,false,false];
			
			_ma_dr = true;
		};
		if (_ma_dr) then
		{
			(findDisplay 5100 displayCtrl 22) ctrlSetPosition
			[
				(_ma_pb select 0) + (GCam_OC select 1) - _ma_pm,
				_ma_pb select 1
			];
			(findDisplay 5100 displayCtrl 22) ctrlCommit 0.0;
			
			(findDisplay 5100 displayCtrl 100) ctrlSetPosition
			[
				_ma_pd select 0,
				(_ma_pd select 1) - ((GCam_OC select 1) - _ma_pm),
				(_ma_pd select 2) + (GCam_OC select 1) - _ma_pm,
				(_ma_pd select 3) + (GCam_OC select 1) - _ma_pm
			];
			(findDisplay 5100 displayCtrl 100) ctrlCommit 0.0;
			
			_ma_p = ctrlPosition (findDisplay 5100 displayCtrl 100);
			_mapsize = [_ma_p select 2, _ma_p select 3];
			
			if (!(isNil "GCam_MU2")) then { _ma_mu = GCam_MU2 select 1 };
			if ( _ma_mu == 0 or !(GCam_OC select 3) ) then { _ma_dr = false };
		};
		
		
		if (GCam_MC) then
		{
			_ma_st = diag_tickTime;
			
			_ma_ol = [ nearestObjects [[GCam_MCP select 0, GCam_MCP select 1, (getPosATL _c select 2)+50], ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
			
			if (_ma_sc) then
			{
				{ _ma_ol = _ma_ol - [vehicle _x] } forEach units group _o;
				_ma_ol = _ma_ol + [vehicle leader group _o];
				
				if
				(
					(count _ma_ol) > 0
					and
					((findDisplay 5100 displayCtrl 100) posWorldToScreen GCam_MCP) distance ((findDisplay 5100 displayCtrl 100) posWorldToScreen (getMarkerPos format["%1g",(_ma_ol select 0)])) < 0.02
				)
				then
				{
					lbClear 50;
					lbSetCurSel [50, 0];
					
					_o = _ma_ol select 0;
					call _ResetCamera;
					_o_l = _o;
					
					call _CreateGroupMarker2;
					deleteMarkerLocal format["%1g",(_ma_ol select 0)];
					_ma_st = diag_tickTime;
					
					_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
					[_li_ol] call _ListObjects;
				}
				else
				{
					{ deleteMarkerLocal _x } forEach _ma_mnl;
					call _CreateMapScanArea;
					call _CreateGroupMarker2;
				};
			}
			else
			{
				if
				(
					(count _ma_ol) > 0
					and
					group(_ma_ol select 0) == (group _o)
					and
					((findDisplay 5100 displayCtrl 100) posWorldToScreen GCam_MCP) distance ((findDisplay 5100 displayCtrl 100) posWorldToScreen (getMarkerPos format["%1%2%3",typeOf(driver vehicle(_ma_ol select 0)), rankId(driver vehicle(_ma_ol select 0)), name(driver vehicle(_ma_ol select 0))])) < 0.04
				)
				then
				{
					_ma_sc = true;
					
					lbClear 50;
					lbSetCurSel [50, 0];
					
					_o = _ma_ol select 0;
					call _ResetCamera;
					_o_l = _o;
					
					_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
					[_li_ol] call _ListObjects;
					
					_ma_sc = false;
				}
				else
				{
					_ma_sc = true;
					
					{ _ma_ol = _ma_ol - [vehicle _x] } forEach units group _o;
					_ma_ol = _ma_ol + [vehicle leader group _o];
					
					{ deleteMarkerLocal _x } forEach _ma_mnl;
					call _CreateMapScanArea;
					call _CreateGroupMarker2;
					
					_li_ol = [ nearestObjects [_o, ["AllVehicles"], DETECTOBJECTDISTANCE] ] call _SelectObjects;
					[_li_ol] call _ListObjects;
				};
			};
			
			GCam_MC = false;
		};
		
		if (_ma_sc) then
		{
			if (diag_tickTime - _ma_st > 7.0) then
			{
				{ deleteMarkerLocal _x } forEach _ma_gmnl;
				call _CreateGroupMarker;
				
				_ma_sc = false;
			};
		};
		
		
		if (!(isNil "GCam_OCM")) then { _ocm = GCam_OCM select 3 };
		if ( _ocm and _md == 1 ) then
		{
			_ma_m = true;
			_ma_t = diag_tickTime;
		}
		else
		{
			
			if (!(_ocm) and (diag_tickTime - _ma_t > 3.0)) then { _ma_m = false };
		};
		
		_ma_c = (_ma_c + 1) mod (MAPUPDATEINTERVAL+1);
		if (_ma_c == MAPUPDATEINTERVAL) then
		{
			"gcam_c" setMarkerPosLocal [_cp select 0, _cp select 1];
			"gcam_c" setMarkerDirLocal (-(_dr) + 90.0);
			
			if (!(_ma_m)) then
			{
				_ma_crp = (findDisplay 5100 displayCtrl 100) posWorldToScreen [ _cp select 0, _cp select 1 ];
				_ma_crp = [ (_ma_crp select 0) - ((_ma_p select 2)/2), (_ma_crp select 1) - ((_ma_p select 3)/2) ];
				(findDisplay 5100 displayCtrl 100) ctrlMapAnimAdd [ 0, ctrlMapScale(findDisplay 5100 displayCtrl 100), (findDisplay 5100 displayCtrl 100) posScreenToWorld _ma_crp ];
				ctrlMapAnimCommit (findDisplay 5100 displayCtrl 100);
			};
			
			_ma_mnl = [];
			{
				if (alive _x) then
				{
					_ma_mn = format["%1%2%3",typeOf _x, rankId _x, name _x];
					_ma_op = getPosASL _x;
					_ma_mn setMarkerPosLocal [_ma_op select 0, _ma_op select 1];
					
					if ((speed vehicle _x) > 4) then
					{
						_ma_mn setMarkerTypeLocal "mil_Arrow2";
						_ma_mn setMarkerDirLocal (getDir vehicle _x);
						_ma_mn setMarkerSizeLocal [0.27,0.27];
					}
					else
					{
						_ma_mn setMarkerTypeLocal "dot";
						_ma_mn setMarkerSizeLocal [0.65,0.65];
					};
					
					_ma_mnl = _ma_mnl + [_ma_mn];
				}
				else
				{
					deleteMarkerLocal format["%1%2%3",typeOf _x, rankId _x, name _x];
				};
			} forEach _ma_gu;
		};
		
		
		#ifdef PARAMTRACK
			_i = (_i+1) mod (PARAMTRACKINTERVAL+1);
			if (_i==PARAMTRACKINTERVAL) then
			{
				_s = "";
				_s = _s + format
				[
"<t color='#ffffff'>UNIT INFO</t><br/>
<t color='#8a8aff'>name</t>: %1 <t color='#8a8aff'>displayName</t>: %2 <t color='#8a8aff'>typeOf</t>: %3 <t color='#8a8aff'>side</t>: %4 <t color='#8a8aff'>faction</t>: %5 <t color='#8a8aff'>score</t>: %6<br/>
<t color='#8a8aff'>rankId</t>: %7 <t color='#8a8aff'>rank</t>: %8 <t color='#8a8aff'>skill</t>: %9 <t color='#8a8aff'>morale</t>: %10 <t color='#8a8aff'>rating</t>: %11 <t color='#8a8aff'>simulationEnabled</t>: %12 <t color='#8a8aff'>isFormationLeader</t>: %13<br/>
<t color='#8a8aff'>alive</t>: %14 <t color='#8a8aff'>lifeState</t>: %15 <t color='#8a8aff'>damage</t>: %16 <t color='#8a8aff'>handsHit</t>: %17 <t color='#8a8aff'>canStand</t>: %18<br/>
<t color='#8a8aff'>unitPos</t>: %19 <t color='#8a8aff'>isWalking</t>: %20 <t color='#8a8aff'>isForcedWalk</t>: %21 <t color='#8a8aff'>isHidden</t>: %22 <t color='#8a8aff'>fleeing</t>: %23 <t color='#8a8aff'>captive</t>: %24 <t color='#8a8aff'>captiveNum</t>: %25<br/>
<t color='#8a8aff'>behaviour</t>: %26 <t color='#8a8aff'>attackEnabled</t>: %27 <t color='#8a8aff'>stopped</t>: %28<br/>
<t color='#8a8aff'>unitReady</t>: %29 <t color='#8a8aff'>moveToCompleted</t>: %30 <t color='#8a8aff'>moveToFailed</t>: %31<br/>
<t color='#8a8aff'>currentCommand</t>: %32 <t color='#8a8aff'>expectedDestination</t>: %33 <t color='#8a8aff'>synchronizedObjects</t>: %34<br/>
<t color='#8a8aff'>weaponDirection</t>: %35<br/>
<t color='#8a8aff'>currentWeapon</t>: %36 <t color='#8a8aff'>currentMuzzle</t>: %37 <t color='#8a8aff'>currentWeaponMode</t>: %38 <t color='#8a8aff'>currentVisionMode</t>: %39<br/>
<t color='#8a8aff'>ammo</t>: %40 <t color='#8a8aff'>someAmmo</t>: %41 <t color='#8a8aff'>reloadEnabled</t>: %42 <t color='#8a8aff'>needReload</t>: %43<br/>",
					name _o, getText( configFile >> "CfgVehicles" >> (typeOf _o) >> "displayName" ), typeOf _o, side _o, faction _o, score _o,
					rankId _o, rank _o, skill _o, morale _o, rating _o, simulationEnabled _o, isFormationLeader _o,
					alive _o, lifeState _o, damage _o, handsHit _o, canStand _o,
					unitPos _o, isWalking _o, isForcedWalk _o, isHidden _o, fleeing _o, captive _o, captiveNum _o,
					behaviour _o, attackEnabled _o, stopped _o,
					unitReady _o, moveToCompleted _o, moveToFailed _o,
					currentCommand _o, expectedDestination _o, synchronizedObjects _o,
					_o weaponDirection currentWeapon _o,
					currentWeapon _o, currentMuzzle _o, currentWeaponMode _o, currentVisionMode _o,
					_o ammo currentWeapon _o, someAmmo _o, reloadEnabled _o, needReload _o
				];
				
				_s = _s + format
				[
"<t color='#8a8aff'>primaryWeapon</t> : %1 <t color='#8a8aff'>secondaryWeapon</t>: %2<br/>
<t color='#8a8aff'>weapons</t>: %3<br/>
<t color='#8a8aff'>magazines</t>: %4<br/>
<t color='#8a8aff'>items</t>: %5<br/>
<t color='#8a8aff'>getWeaponCargo</t>: %6 <t color='#8a8aff'>getMagazineCargo</t>: %7<br/>
<t color='#8a8aff'>speed</t>: %8<br/>
<t color='#8a8aff'>getPos</t>: %9<br/>
<t color='#8a8aff'>getPosATL</t>: %10<br/>
<t color='#8a8aff'>getPosASL</t>: %11<br/>
<t color='#8a8aff'>getDir</t>: %12<br/>
<t color='#8a8aff'>velocity</t>: %13<br/>
<t color='#8a8aff'>vectorDir</t>: %14 <t color='#8a8aff'>vectorUp</t>: %15<br/>
<t color='#8a8aff'>animationState</t>: %16 <t color='#8a8aff'>moveTime</t>: %17<br/>
<t color='#8a8aff'>sizeOf</t>: %18 <t color='#8a8aff'>boundingBox</t>: %19<br/><br/>",
					primaryWeapon _o, secondaryWeapon _o,
					weapons _o,
					magazines _o,
					items _o,
					getWeaponCargo unitBackpack _o, getMagazineCargo unitBackpack _o,
					speed _o,
					getPos _o,
					getPosATL _o,
					getPosASL _o,
					getDir _o,
					velocity _o,
					vectorDir _o, vectorUp _o,
					animationState _o, moveTime _o,
					sizeOf typeOf _o, boundingBox _o
				];
				
				_s = _s + format
				[
"<t color='#ffffff'>VEHICLE INFO</t><br/>
<t color='#8aff8a'>driver</t>: %1 <t color='#8aff8a'>gunner</t>: %2 <t color='#8aff8a'>commander</t>: %3 <t color='#8aff8a'>crew</t>: %4<br/>
<t color='#8aff8a'>effectiveCommander</t>: %5<br/>
<t color='#8aff8a'>assignedDriver</t>: %6 <t color='#8aff8a'>assignedGunner</t>: %7 <t color='#8aff8a'>assignedCommander</t>: %8 <t color='#8aff8a'>assignedCargo</t>: %9<br/>
<t color='#8aff8a'>isEngineOn</t>: %10 <t color='#8aff8a'>canMove</t>: %11 <t color='#8aff8a'>canFire</t>: %12 <t color='#8aff8a'>isManualFire</t>: %13 <t color='#8aff8a'>isAutoHoverOn</t>: %14 <t color='#8aff8a'>canUnloadInCombat</t>: %15 <t color='#8aff8a'>fuel</t>: %16<br/>
<t color='#8aff8a'>getWeaponCargo</t>: %17 <t color='#8aff8a'>getMagazineCargo</t>: %18 <t color='#8aff8a'>getBackpackCargo</t>: %19<br/>
<br/>
<t color='#ffffff'>GROUP / WAYPOINTS INFO</t><br/>
<t color='#ff8a8a'>group</t>: %20 <t color='#ff8a8a'>leader</t>: %21 <t color='#ff8a8a'>units</t>: %22<br/>
<t color='#ff8a8a'>formationLeader</t>: %23 <t color='#ff8a8a'>formationMembers</t>: %24 
<t color='#ff8a8a'><br/>formationPosition</t>: %25 
<t color='#ff8a8a'><br/>formationDirection</t>: %26<br/>
<t color='#ff8a8a'>currentWaypoint</t>: %27 <t color='#ff8a8a'>waypoints</t>: %28<br/>
<t color='#ff8a8a'>combatMode</t>: %29 <t color='#ff8a8a'>formation</t>: %30 <t color='#ff8a8a'>speedMode</t>: %31",
					driver _o, gunner _o, commander _o, crew _o,
					effectiveCommander _o,
					assignedDriver _o, assignedGunner _o, assignedCommander _o, assignedCargo _o,
					isEngineOn _o, canMove _o, canFire _o, isManualFire _o, isAutoHoverOn _o, canUnloadInCombat _o, fuel _o,
					getWeaponCargo _o, getMagazineCargo _o, getBackpackCargo _o,
					group _o, leader group _o, units group _o,
					formationLeader _o, formationMembers _o,
					formationPosition _o,
					formationDirection _o,
					currentWaypoint group _o, waypoints group _o,
					combatMode group _o, formation group _o, speedMode group _o
				];
				
				(findDisplay 5100 displayCtrl 25) ctrlSetStructuredText parseText _s;
			};
		#endif
		
		
		if ( !(ctrlShown(findDisplay 5100 displayCtrl 0)) ) then { call _CloseList };
	};
	
	
	if ( (!(LIMITQUIT) and _ku == KEYQUIT) or !(alive player) or GCamKill) then
	{
		if ( !(alive player) or GCamKill ) then { _quit = true };
		
		if ( _ku == KEYQUIT ) then
		{
			setMousePosition [0.500,0.575];
			
			createDialog "GCam_Dialog_Quit";
			waitUntil{ctrlShown(findDisplay 5102 displayCtrl 0)};
			
			ctrlSetFocus (findDisplay 5102 displayCtrl 4);
			
			_quitchk = true;
			_quit = false;
			while {_quitchk} do
			{
				if (GCam_B) then
				{
					switch (GCam_BId) do
					{
						case ("quit"):
						{
							_quit = true;
							_quitchk = false;
						};
						case ("cancel"):
						{
							_quitchk = false;
						};
					};
					GCam_BId = "";
					GCam_B = false;
				};
				
				if ( !(ctrlShown(findDisplay 5102 displayCtrl 0)) ) then { _quitchk = false };
				
				sleep _w;
			};
			
			closeDialog 5102;
			waitUntil{ !(ctrlShown(findDisplay 5102 displayCtrl 0)) };
			
			GCam_KD set [1, -1];
			GCam_KU set [1, -1];
		};
		
		if (_quit) then
		{
			call _CloseList;
			
			if (_trg) then
			{
				_o removeEventHandler ["fired", _tr_ehidx];
				_o removeEventHandler ["GetOut", _tr_ehidx2];
			};
			
			setAccTime _initacctime;
			
			titleText["","plain down",0.0];
			camUseNVG false;
			false setCamUseTi 0;
			enableTeamSwitch _initteamswitch;
			
			(findDisplay 46) displayRemoveEventHandler ["KeyDown", _ehid_keydown];
			(findDisplay 46) displayRemoveEventHandler ["KeyUp", _ehid_keyup];
			(findDisplay 46) displayRemoveEventHandler ["MouseMoving", _ehid_mousemove];
			(findDisplay 46) displayRemoveEventHandler ["MouseZChanged", _ehid_mousezchange];
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", _ehid_mousebd];
			(findDisplay 46) displayRemoveEventHandler ["MouseButtonUp", _ehid_mousebu];
			
			_initobject switchCamera _initcamview;
			_c cameraEffect ["Terminate", "BACK"];
			camDestroy _c;
			
			_l = false;
		};
	};
	
	
	if (!(_fo)) then
	{
		_cfalt = 1.0 + 100.0 * (getPosATL _c select 2) / 1000.0;
		if (_cfalt > 100.0) then { _cfalt = 100.0 };
	};
	
	
	if ( _og != (group _o) and !(alive(leader(group _o))) ) then { _og = group _o };
	
	if ( (isNull _o) or (count(crew _o)) == 0 ) then
	{
		sleep (_w*200);
		
		_li_ol = nearestObjects [ [_op select 0, _op select 1, (getPosATL _c select 2)-(_cp_r select 2)], ["AllVehicles"], 50 ];
		_lostchk = _li_ol select 0;
		
		if ( count _li_ol != 0 and !(isNil"_lostchk") ) then
		{
			if ( LISTCIVILIAN and (_o isKindOf "Civilian") ) then
			{
				_o = _li_ol select 0;
			}
			else
			{
				if ( LISTFRIENDLY and (((side player) getFriend (side _o)) >= 0.6) ) then
				{
					_o = _li_ol select 0;
				}
				else
				{
					if ( LISTENEMY and (((side player) getFriend (side _o)) < 0.6) ) then
					{
						_o = _li_ol select 0;
					}
					else
					{
						if ( LISTANIMAL and (_o isKindOf "Animal") ) then
						{
							_o = _li_ol select 0;
						};
					};
				};
			};
		}
		else
		{
			_li_ol = [ nearestObjects [ [ _op select 0, _op select 1, (getPosATL _c select 2)-(_cp_r select 2) ], ["AllVehicles"], DETECTOBJECTDISTANCE ] ] call _SelectObjects;
			_lostchk = _li_ol select 0;
			
			if (count _li_ol != 0 and !(isNull _lostchk)) then
			{
				_o = vehicle(_li_ol select 0);
			}
			else
			{
				_o = vehicle player;
			};
		};
		
		lbClear 50;
		lbSetCurSel [50, 0];
		
		call _ResetCamera;
		_o_l = _o;
		
		[_li_ol] call _ListObjects;
	};
	
	
	if ( _be and _fo ) then
	{
		_be_cods = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2);
		if ( _be_cods > 2.0 ) then { _be_cftn = 1.0 + (9.0/(_c distance _o)) };
		
		_be_odr = ((getdir _o) -90.0) * -1;
		if (_be_odr >= 360.0) then { _be_odr = _be_odr - 360.0 };
		if (_be_odr < 0.0) then { _be_odr = _be_odr + 360.0 };
		
		_be_codr_t = _be_odr + _be_codr_a;
		if (_be_codr_t >= 360.0) then { _be_codr_t = _be_codr_t - 360.0 };
		if (_be_codr_t < 0.0) then { _be_codr_t = _be_codr_t + 360.0 };
		
		_be_codr = ( ((_cp_r select 0) atan2 (_cp_r select 1)) + 90.0 ) * -1;
		if (_be_codr >= 360.0) then { _be_codr = _be_codr - 360.0 };
		if (_be_codr < 0.0) then { _be_codr = _be_codr + 360.0 };
		
		_be_codr_d = _be_codr_t - _be_codr;
		if (_be_codr_d >= 360.0) then { _be_codr_d = _be_codr_d - 360.0 };
		if (_be_codr_d < 0.0) then { _be_codr_d = _be_codr_d + 360.0 };
		
		switch (true) do
		{
			case (_be_codr_d > 180.0 and _be_codr_d < 360.0):
			{
				_acx = _acx - (sin _be_codr) * (abs(sin(_be_codr_d/2))) * _be_cftn * BEHINDSPDAROUND;
				_acy = _acy + (cos _be_codr) * (abs(sin(_be_codr_d/2))) * _be_cftn * BEHINDSPDAROUND;
			};
			case (_be_codr_d >= 0.0 and _be_codr_d <= 180.0):
			{
				_acx = _acx + (sin _be_codr) * (abs(sin(_be_codr_d/2))) * _be_cftn * BEHINDSPDAROUND;
				_acy = _acy - (cos _be_codr) * (abs(sin(_be_codr_d/2))) * _be_cftn * BEHINDSPDAROUND;
			};
		};
		
		
		_be_codv = ( ((_cp_r select 2) - _be_ofz) atan2 ((sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2))) ) * (-1);
		_be_codv_d = _be_codv_t - _be_codv;
		
		_be_odv = asin((vectorDir _o) select 2) * (cos _be_codr_a);
		_be_codv_r = _be_codv_t + _be_odv;
		if ((abs _be_odv_mx) > (abs _be_odv)) then
		{
			_be_codv_c = _be_codv_c - (_be_odv_mx - _be_odv);
			_be_codv_t = _be_codv_t - (_be_odv_mx - _be_odv);
			_be_odv_mx = _be_odv;
		}
		else
		{
			if ( (_be_codv_r - _be_codv_c) < -89.0) then
			{
				_be_codv_c = _be_codv_t + _be_odv + 89.0;
				_be_odv_mx = _be_odv;
			};
			if ( (_be_codv_r - _be_codv_c) > 89.0) then
			{
				_be_codv_c = _be_codv_t + _be_odv - 89.0;
				_be_odv_mx = _be_odv;
			};
		};
		_be_codv_d = _be_codv_d - _be_codv_c + _be_odv;
		
		_acx = _acx - (sin _be_codv_d) * (cos _be_codr) * (sin(_be_codv - 180.0)) * _be_cftn * BEHINDSPDAROUND * 0.5;
		_acy = _acy - (sin _be_codv_d) * (sin _be_codr) * (sin(_be_codv - 180.0)) * _be_cftn * BEHINDSPDAROUND * 0.5;
		_acz = _acz - (sin _be_codv_d) * (cos _be_codv) * _be_cftn * BEHINDSPDAROUND * 0.5;
		
		_acx = _acx - (sin(_be_cods_t - _be_cods)) * (cos _be_codr) * (cos _be_codv) * 0.5;
		_acy = _acy - (sin(_be_cods_t - _be_cods)) * (sin _be_codr) * (cos _be_codv) * 0.5;
		_acz = _acz - (sin(_be_cods_t - _be_cods)) * (sin _be_codv) * 0.5;
		
		
		if ( [_cp select 0, _cp select 1] distance [_op select 0, _op select 1] < 0.4 ) then
		{
			_cp_r = [ -0.41 * (cos _be_codr), -0.41 * (sin _be_codr), -_be_cods * (sin _be_codv) + _be_ofz];
			_be_cods_t = sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2)-_be_ofz)^2);
			if (_be_codv_t > 0.0) then
			{ _be_codv_t = _be_codv_t - 1.0 }
			else
			{ _be_codv_t = _be_codv_t + 1.0 };
			_acx = 0.0;
			_acy = 0.0;
			_acz = 0.0;
			
		};
		
		
		_be_cdr_a = _be_cdr_a + _acdr;
		if ( _be_cdr_a >= 360.0 ) then { _be_cdr_a = _be_cdr_a - 360.0 };
		if ( _be_cdr_a < 0.0 ) then { _be_cdr_a = _be_cdr_a + 360.0 };
		
		_be_cdr_t = _dr - _be_cdr_a;
		if ( _be_cdr_t >= 360.0 ) then { _be_cdr_t = _be_cdr_t - 360.0 };
		if ( _be_cdr_t < 0.0 ) then { _be_cdr_t = _be_cdr_t + 360.0 };
		
		_be_cdr_d = _be_odr - _be_cdr_t;
		if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
		if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
		
		_be_cdr_d = _be_cdr_d + _be_codr_a;
		if ( _be_cdr_d >= 360.0 ) then { _be_cdr_d = _be_cdr_d - 360.0 };
		if ( _be_cdr_d < 0.0 ) then { _be_cdr_d = _be_cdr_d + 360.0 };
		
		switch (true) do
		{
			case (_be_cdr_d >= 0.0 and _be_cdr_d < 180.0) : { _dr = _dr + (abs(sin(_be_cdr_d/2))) * _cfzm * (_be_cftn^BEHINDSPDROTATE) };
			case (_be_cdr_d >= 180.0 and _be_cdr_d < 360.0) : { _dr = _dr - (abs(sin(_be_cdr_d/2))) * _cfzm * (_be_cftn^BEHINDSPDROTATE) };
		};
		if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
		if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
		
		if ( _o isKindOf "Man" ) then { _be_crt = (((_o selectionPosition "head_axis") select 2) - 1.57) * (abs sin(30.0/(_be_cods+0.1))) };
		
		
		_be_codv_d = _be_codv - _dv;
		_be_cdv_a = _be_cdv_a + _acdv;
		_be_codv_d = _be_codv_d + _be_cdv_a;
		switch (true) do
		{
			case (_be_codv_d > 0.0) : { _dv = _dv + abs(sin(_be_codv_d/2)) * _be_cftn * 5.0 };
			case (_be_codv_d <= 0.0) : { _dv = _dv - abs(sin(_be_codv_d/2)) * _be_cftn * 5.0 };
		};
		_dv = (_dv min 89.0) max -89.0;
	};
	
	if ( _fc and !(_fo) ) then
	{
		_fc_op = getPosASL _o;
		_fc_cp = getPosASL _c;
		
		_fc_codr = ( ( ((_fc_op select 0) - (_fc_cp select 0)) atan2 ((_fc_op select 1) - (_fc_cp select 1)) ) -90.0 ) * (-1);
		if (_fc_codr >= 360.0) then { _fc_codr = _fc_codr - 360.0 };
		if (_fc_codr < 0.0) then { _fc_codr = _fc_codr + 360.0 };
		
		_fc_codr_d = _dr - _fc_codr;
		if (_fc_codr_d >= 360.0) then { _fc_codr_d = _fc_codr_d - 360.0 };
		if (_fc_codr_d < 0.0) then { _fc_codr_d = _fc_codr_d + 360.0 };
		
		_fc_cdr_a = _fc_cdr_a + _acdr;
		if (_fc_cdr_a >= 360.0) then { _fc_cdr_a = _fc_cdr_a - 360.0 };
		if (_fc_cdr_a < 0.0) then { _fc_cdr_a = _fc_cdr_a + 360.0 };
		
		_fc_codr_d = _fc_codr_d - _fc_cdr_a;
		if (_fc_codr_d >= 360.0) then { _fc_codr_d = _fc_codr_d - 360.0 };
		if (_fc_codr_d < 0.0) then { _fc_codr_d = _fc_codr_d + 360.0 };
		
		switch (true) do
		{
			case (_fc_codr_d > 0.0 and _fc_codr_d < 180.0) : { _dr = _dr - (abs(sin(_fc_codr_d/2))) * 20.0 };
			case (_fc_codr_d > 180.0 and _fc_codr_d < 360.0) : { _dr = _dr + (abs(sin(_fc_codr_d/2))) * 20.0 };
		};
		if ( _dr >= 360.0 ) then { _dr = _dr - 360.0 };
		if ( _dr < 0.0 ) then { _dr = _dr + 360.0 };
		
		
		_fc_cods = [_fc_cp select 0, _fc_cp select 1] distance [_fc_op select 0, _fc_op select 1];
		if ( _o isKindOf "Man" ) then { _fc_crt = (((_o selectionPosition "head_axis") select 2) - 1.57) * (abs sin(30/(_fc_cods+0.1))) };
		
		_fc_codv = (sqrt(((_fc_op select 0) - (_fc_cp select 0))^2.0 + ((_fc_op select 1) - (_fc_cp select 1))^2.0) atan2 (((_fc_op select 2) - (_fc_cp select 2)) + _be_ofz + _fc_crt) - 90.0) * -1;
		_fc_codv_d = _fc_codv - _dv;
		
		_fc_cdv_a = _fc_cdv_a + _acdv;
		_fc_codv_d = _fc_codv_d + _fc_cdv_a;
		
		switch (true) do
		{
			case (_fc_codv_d > 0.0) : { _dv = _dv + abs(sin(_fc_codv_d/2)) * 20.0 };
			case (_fc_codv_d <= 0.0) : { _dv = _dv - abs(sin(_fc_codv_d/2)) * 20.0 };
		};
		_dv = (_dv min 89.0) max -89.0;
	};
	
	
	_cp_r = [ (_cp_r select 0) + _acx, (_cp_r select 1) + _acy, (_cp_r select 2) + _acz ];
	if (_fo) then { _op = getPosASL _o };
	_cp = [ (_op select 0) + (_cp_r select 0) , (_op select 1) + (_cp_r select 1), (_op select 2) + (_cp_r select 2) ];
	_c setPosASL [ _cp select 0, _cp select 1, (_cp select 2) + _be_crt ];
	_c camSetTarget [ (_cp select 0) + (cos _dr) * (cos _dv) * 100000.0, (_cp select 1) + (sin _dr) * (cos _dv) * 100000.0, (_cp select 2) + (sin _dv) * 100000.0];
	_c camCommit 0.0;
	
	if ( (getPosATL _c select 2) < 0.5 ) then
	{
		_c setPosATL [ _cp select 0, _cp select 1, 0.501 ];
		if (_fo) then
		{
			_cp_r set [ 2, (getPosASL _c select 2) - _be_crt - (getPosASL _o select 2) ];
			
			if (_be) then
			{
				_be_codv_t = _be_codv_t - 1.0;
				_be_codv = _be_codv_t;
			}
			else
			{
				_be_codv_t = ( ((_cp_r select 2) - _be_ofz) atan2 ((sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2))) ) * (-1);
				_be_codv = _be_codv_t;
				_be_cods_t =  sqrt((_cp_r select 0)^2 + (_cp_r select 1)^2 + ((_cp_r select 2) - _be_ofz)^2);
				_be_cods = _be_cods_t;
			};
		}
		else
		{
			_op set [ 2 , getPosASL _o select 2];
			_cp_r set [ 2, (getPosASL _c select 2) - _be_crt - (_op select 2) ];
		};
		_acz = _acz max 0.0;
	};
	
	_w = accTime / (diag_fps * 2);
	sleep _w;
};
}
