// Edited by SAKY
// Player IR script v5.5 2014.05.22 By: Lala14 & Tajin Edit By csk222 (IRstrobeLite)
// init line: nul = [] execVM "irstrobelite.sqf";

if (isDedicated) exitWith {};
waitUntil {!isNull player};
strobes = [];
chems = [];

LALA_fnc_IRStrobeOff =
{
	{deleteVehicle _x;}forEach strobes;
};

LALA_fnc_IRchemOff1 =
{
	{deleteVehicle _x;}forEach chems;
};

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	[] call LALA_fnc_IRStrobeOff;
	[] call LALA_fnc_IRchemOff1;	
}];

LALA_fnc_IRStrobeOn =
{
	[] call LALA_fnc_IRStrobeOff;
	_strobe = "NVG_TargetE" createVehicle getPos player;
	_strobe attachTo [vehicle player,[0,0.01,0.04],"RightShoulder"];	
	_strobe setVectorDirAndUp [[0.2,0,1],[-0.5,0.5,1]];	
	strobes pushBack _strobe;
};

LALA_fnc_IRchemOn1 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Green" createVehicle getPos player; 
	_chem attachTo [vehicle player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn2 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Yellow" createVehicle getPos player; 
	_chem attachTo [vehicle player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn3 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Blue" createVehicle getPos player; 
	_chem attachTo [vehicle player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn4 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Red" createVehicle getPos player; 
	_chem attachTo [vehicle player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

//[] spawn LALA_fnc_StrobeChem_addActions;