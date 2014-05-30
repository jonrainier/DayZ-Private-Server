private ["_WaterHoleArray","_ShuffleArray"];

_WaterHoleArray = [
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\BlackLake.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Gvozdno.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Gvozdno.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Kabanino.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Kopyto.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Mogilevka.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Nadezdinho.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\NorthNadezdinho.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\NorthPusta.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\NorthTopolka.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Novy.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\PobedaDam.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Pogorevka.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Polana.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Prud.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Sosnovy.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Stary.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Topolka.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\Vysota.sqf",
	"\z\addons\dayz_code\system\mission\infectiousWaterholes\WillowLake.sqf"
];

_ShuffleArray = {
	private ["_ar","_rand_array","_rand"];
	_ar = _this;
	_rand_array = [];
	while {count _ar > 0} do {
		_rand = (count _ar);
		_rand = floor (random _rand);
		_rand_array set [count _rand_array, _ar select _rand];
		_ar set [_rand, "randarray_del"];
		_ar = _ar - ["randarray_del"];
		sleep 0.001;
	};
	_rand_array;
};

_infectedWaterHoles = _WaterHoleArray call _ShuffleArray;

_i = 0;
_t = 0;
_activeArray = [];

{
	if ((random 1) < 0.5) then {
		[] execVM _x;
		_activeArray set [count _activeArray, _x]; // set  
		_i = _i + 1;
	};
	_t = _t + 1;
	sleep 0.01;
}count _infectedWaterHoles;

diag_log format["Max: %1, Spawned: %2, Active: %3",_t,_i,_activeArray];

/*
_rnd = round (random 3);

switch (_rnd) do
{
	case 0:
	{
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\BlackLake.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Gvozdno.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Kopyto.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Nadezdinho.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthPusta.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Novy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Pogorevka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Prud.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Stary.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Vysota.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\WillowLake.sqf";
	};
	case 1:
	{
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Dobryy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Kabanino.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\BlackLake.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Mogilevka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthNadezdinho.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthTopolka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\PobedaDam.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Polana.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Sosnovy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Topolka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\WillowLake.sqf";
	};
	case 2:
	{
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\BlackLake.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Dobryy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Gvozdno.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Kabanino.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Kopyto.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Mogilevka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Nadezdinho.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthNadezdinho.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthPusta.sqf";
	};
	case 3:
	{
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\NorthTopolka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Novy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\PobedaDam.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Pogorevka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Polana.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Prud.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Sosnovy.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Stary.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Topolka.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\Vysota.sqf";
		[] execVM "\z\addons\dayz_code\system\mission\poi\InfectedWaterholes\WillowLake.sqf";
	};
};
*/