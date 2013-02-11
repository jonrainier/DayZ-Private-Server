#include "gcam\config.hpp"

#ifdef GCAM
	#ifdef ADMINS
		fnc_keyDown = 
		{
			private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrlKey", "_alt"];
			_ctrl = _this select 0;
			_dikCode = _this select 1;
			_shift = _this select 2;
			_ctrlKey = _this select 3;
			_alt = _this select 4;

			_handled = false;

			if (!_shift && !_ctrlKey && !_alt) then
			{
				if (_dikCode == 24 ) then
				{
					#ifdef DEBUG
						diag_log format ["GCAM Starting"];
					#endif

					GCamKill = false;
					handle = [] execVM "gcam\gcam.sqf";
					_handled = true;
				};

				if (_dikCode == 25 ) then
				{
					#ifdef DEBUG
						diag_log format ["GCAM Stopping"];
					#endif

					GCamKill = true;
					_handled = true;
				};
			};

			_handled;
		};

		waitUntil {(!isNull Player) and (alive Player) and (player == player)};
		_uid = (getPlayerUID vehicle player);
	
		#ifdef DEBUG
			diag_log format ["GCAM Checking if player %1 is admin", _uid];
		#endif

		_isAdmin=(serverCommandAvailable"#kick");

		if ((_isAdmin) && ((_uid) in ADMINS)) then
		{
			waituntil {!(IsNull (findDisplay 46))};
			(findDisplay 46) displayAddEventHandler ["keyDown", "_this call fnc_keyDown"];

			#ifdef DEBUG
				diag_log format ["GCAM keyevent loaded for admin: %1", _uid];
			#endif
		};
	#endif
#endif