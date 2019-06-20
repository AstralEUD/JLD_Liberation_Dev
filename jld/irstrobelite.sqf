// Player IR script v5.5 2014.05.22 By: Lala14 & Tajin Edit By csk222 (IRstrobeLite)
// init line: nul = [] execVM "irstrobelite.sqf";

if (isDedicated) exitWith {};
waitUntil {!isNull player};

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
};

LALA_fnc_IRStrobeOn =
{
	_strobe = "NVG_TargetE" createVehicle getPos _this;
	_strobe attachTo [_this,[0,0,0],"spine3"];		
	_this setVariable ["strobeplayer",_strobe,true];
};

LALA_fnc_IRStrobeOff =
{
	deleteVehicle (_this getVariable "strobeplayer"); 
	_this setVariable ["strobeplayer","none",true];
};

LALA_fnc_IRchemOn1 =
{
	_chem = "Chemlight_Green" createVehicle getPos _this;
	_chem attachTo [_this,[0,-0.03,0.07], "LeftShoulder"];			
	_this setVariable ["chemplayer",_chem,true];
};

LALA_fnc_IRchemOff1 =
{
	deleteVehicle (_this getVariable "chemplayer"); 
	_this setVariable ["chemplayer","none",true];
};

LALA_fnc_IRchemOn2 =
{
	_chem = "Chemlight_Yellow" createVehicle getPos _this;
	_chem attachTo [_this,[0,-0.03,0.07], "LeftShoulder"];			
	_this setVariable ["chemplayer",_chem,true];
};

LALA_fnc_IRchemOff2 =
{
	deleteVehicle (_this getVariable "chemplayer"); 
	_this setVariable ["chemplayer","none",true];
};

LALA_fnc_IRchemOn3 =
{
	_chem = "Chemlight_Blue" createVehicle getPos _this;
	_chem attachTo [_this,[0,-0.03,0.07], "LeftShoulder"];			
	_this setVariable ["chemplayer",_chem,true];
};

LALA_fnc_IRchemOff3 =
{
	deleteVehicle (_this getVariable "chemplayer"); 
	_this setVariable ["chemplayer","none",true];
};

[] spawn LALA_fnc_StrobeChem_addActions;
player addEventHandler ["Respawn", {[] spawn LALA_fnc_StrobeChem_addActions;}];