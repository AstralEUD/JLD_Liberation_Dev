//I_LT_01_F Camouflage
//[["Indep_01",1],["showTools",0,"showCamonetHull",1,"showBags",0,"showSLATHull",0]]
//["a3\armor_f_tank\lt_01\data\lt_01_main_olive_co.paa","a3\armor_f_tank\lt_01\data\lt_01_cannon_olive_co.paa","a3\armor_f\data\camonet_aaf_digi_green_co.paa","a3\armor_f\data\cage_olive_co.paa"]
selectcamo = 0;
_subname = localize "STR_VAM_SUB_CAMOUFLAGE";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_AAF_CAMO";
_subsel2 = localize "STR_VAM_AAF_JUNGLE_CAMONET_CAMO";
_subsel3 = localize "STR_VAM_AAF_DESERT_CAMONET_CAMO";
_subsel4 = localize "STR_VAM_OLIVE_CAMO";
_VAM_camo =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcamo = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcamo = 1;"]], "1", "1"],
	[_subsel2, [4], "", -5, [["expression", "selectcamo = 2;"]], "1", "1"],
	[_subsel3, [5], "", -5, [["expression", "selectcamo = 3;"]], "1", "1"],
	[_subsel4, [6], "", -5, [["expression", "selectcamo = 4;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcamo = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_camo";

waitUntil {sleep 0.1; selectcamo != 0};

if (selectcamo isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;

if (selectcamo > 0) then {hint localize "STR_VAM_SUB_CAMOUFLAGE_APPLIED";};

if (selectcamo isEqualTo 1) exitWith {
	[_targetvehicle,["Indep_01",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Nyx_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 2) exitWith {
	[_targetvehicle,["Indep_02",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Nyx_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 3) exitWith {
	[_targetvehicle,["Indep_03",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Nyx_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 4) exitWith {
	[_targetvehicle,["Indep_Olive",1],nil,nil] call BIS_fnc_initVehicle;
	_targetvehicle setObjectTextureGlobal [2, "A3\Armor_F\Data\camonet_NATO_Green_CO.paa"];
	[] spawn fnc_Nyx_camo; sleep 2; hint "";
};