/*
private [ "_weathers", "_weathertime", "_rains", "_fog","_fogind","_fogalt"];

_weathers = [0.4];
_rains = [0];

if ( GRLIB_weather_param == 2 ) then {
	_weathers = [0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55];	
	_rains = [0,0.01,0.02,0.03,0.05,0.07,0.1,0.15,0.2,0.25,0.3];
};

if ( GRLIB_weather_param == 3 ) then {
	_weathers = [0,0.02,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.5,0.6,0.75,0.85,0.9,1.0];
	_rains = [0,0,0,0.01,0.02,0.03,0.04,0.05,0.07,0.1,0.12,0.15,0.2,0.25,0.3,0.4,0.5,0.7];
};

_weathertime = 1000;

while { GRLIB_endgame == 0 } do {
	chosen_weather = _weathers call BIS_fnc_selectRandom;
	chosen_rain = _rains call BIS_fnc_selectRandom;	
	chosen_fog = [(random 0.3)^2,random [-0.01,0,0.04],random [0,90,150]]; 

	publicVariable "chosen_weather";
	publicVariable "chosen_rain";
	publicVariable "chosen_fog";
	sleep _weathertime+random(1000);
};
*/

private [ "_weathers", "_weathertime" ];

_weathers = [0.4];
if ( GRLIB_weather_param == 2 ) then {
	_weathers = [0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55];
};

if ( GRLIB_weather_param == 3 ) then {
	_weathers = [0,0.01,0.02,0.03,0.05,0.07,0.1,0.15,0.2,0.25,0.3,0.4,0.45,0.5,0.55,0.6,0.7,0.8,0.9,1.0];
};
_weathertime = 1800;

while { GRLIB_endgame == 0 } do {
	chosen_weather = _weathers call BIS_fnc_selectRandom;;
	publicVariable "chosen_weather";
	sleep _weathertime;
};