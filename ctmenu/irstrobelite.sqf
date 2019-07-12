// Edited by SAKY
// Player IR script v5.5 2014.05.22 By: Lala14 & Tajin Edit By csk222 (IRstrobeLite)
// init line: nul = [] execVM "irstrobelite.sqf";

if (isDedicated) exitWith {};
waitUntil {!isNull player};
/*
LALA_fnc_StrobeChem_addActions =
{
	player setVariable ["strobeplayer","none",true];
	IRstrobeOn = player addAction ["피아식별장치 <img size='1' image='a3\weapons_f_epb\Ammo\Data\UI\gear_B_IRstrobe_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRStrobeOn;},"",-98,false,true,"",'typeName (_target getVariable "strobeplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
	
	IRstrobeOff = player addAction ["피아식별장치 <img size='1' image='a3\weapons_f_epb\Ammo\Data\UI\gear_B_IRstrobe_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRStrobeOff;},"",-98,false,true,"",'typeName (_target getVariable "strobeplayer") == "OBJECT" && ( _target == _this)'];
	
	player setVariable ["chemplayer","none",true];
	IRchemOn = player addAction ["야광봉 녹색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_green_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOn1;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
	
	IRchemOff = player addAction ["야광봉 녹색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_green_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOff1;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") == "OBJECT" && ( _target == _this)'];

	player setVariable ["chemplayer","none",true];
	IRchemOn = player addAction ["야광봉 황색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_yellow_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOn2;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
	
	IRchemOff = player addAction ["야광봉 황색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_yellow_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOff2;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") == "OBJECT" && ( _target == _this)'];

	player setVariable ["chemplayer","none",true];
	IRchemOn = player addAction ["야광봉 청색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_blue_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOn3;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") != "OBJECT" && (_target == _this) && (daytime > 18.7 OR daytime < 5.3)'];
	
	IRchemOff = player addAction ["야광봉 청색 <img size='1' image='a3\weapons_f\Data\UI\M_chemlight_blue_CA.paa'/>",
	{(_this select 0) spawn LALA_fnc_IRchemOff3;},"",-99,false,true,"",'typeName (_target getVariable "chemplayer") == "OBJECT" && ( _target == _this)'];
};*/

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
	_strobe attachTo [player,[0,0.01,0.04],"RightShoulder"];	
	_strobe setVectorDirAndUp [[0.2,0,1],[-0.5,0.5,1]];	
	strobes pushBack _strobe;
};

LALA_fnc_IRchemOn1 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Green" createVehicle getPos player; 
	_chem attachTo [player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn2 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Yellow" createVehicle getPos player; 
	_chem attachTo [player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn3 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Blue" createVehicle getPos player; 
	_chem attachTo [player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

LALA_fnc_IRchemOn4 =
{ [] call LALA_fnc_IRchemOff1; 
	_chem = "Chemlight_Red" createVehicle getPos player; 
	_chem attachTo [player,[0,-0.025,0.045], "LeftShoulder"]; 
	_chem setVectorDirAndUp [[1,-0.8,0.3],[-0.5,0.5,0]]; 
	chems pushBack _chem;
};

//[] spawn LALA_fnc_StrobeChem_addActions;