//O_Orca Camouflage
selectcamo = 0;
_subname = localize "STR_VAM_SUB_CAMOUFLAGE";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_OPFOR_CAMO";
_subsel2 = localize "STR_VAM_AAF_CAMO";
_subsel3 = localize "STR_VAM_BLACK_CAMO";
_subsel4 = localize "STR_VAM_BLACK_CUSTOM_CAMO";
_subsel5 = localize "STR_VAM_BLUE_CAMO";
_VAM_camo =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcamo = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcamo = 1;"]], "1", "1"],
	[_subsel2, [4], "", -5, [["expression", "selectcamo = 2;"]], "1", "1"],
	[_subsel3, [5], "", -5, [["expression", "selectcamo = 3;"]], "1", "1"],
	[_subsel4, [6], "", -5, [["expression", "selectcamo = 4;"]], "1", "1"],
	[_subsel5, [7], "", -5, [["expression", "selectcamo = 5;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcamo = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_camo";

waitUntil {sleep 0.1; selectcamo != 0};

if (selectcamo isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;

if (selectcamo > 0) then {hint localize "STR_VAM_SUB_CAMOUFLAGE_APPLIED";};

if (selectcamo isEqualTo 1) exitWith {
	[_targetvehicle,["Opfor",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Orca_camo; sleep 2; hint "";
};

if (selectcamo isEqualTo 2) exitWith {
	_targetvehicle setObjectTextureGlobal [0, "a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"];
	[] spawn fnc_Orca_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 3) exitWith {
	[_targetvehicle,["Black",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Orca_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 4) exitWith {
	[_targetvehicle,["Blackcustom",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Orca_camo; sleep 2; hint "";
};

if (selectcamo isEqualTo 5) exitWith {
	[_targetvehicle,["Blue",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Orca_camo; sleep 2; hint "";
};