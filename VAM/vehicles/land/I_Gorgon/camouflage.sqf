//I_APC_Wheeled_03_cannon_F Camouflage
//[["Indep",1],["showCamonetHull",0,"showBags",0,"showBags2",0,"showTools",0,"showSLATHull",0]]
//0~3 = Vehicle texture, 4 = Camoufluge net texture, 5 = Slat armor texture
selectcamo = 0;
_subname = localize "STR_VAM_SUB_CAMOUFLAGE";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_AAF_CAMO";
_subsel2 = localize "STR_VAM_AAF_JUNGLE_CAMONET_CAMO";
_subsel3 = localize "STR_VAM_AAF_DESERT_CAMONET_CAMO";
_subsel4 = localize "STR_VAM_GUERILLA_OLIVE_WHITE_CAMO";
_subsel5 = localize "STR_VAM_GUERILLA_GREEN_BLACK_CAMO";
_subsel6 = localize "STR_VAM_GUERILLA_DESERT_CAMO";
_subsel7 = localize "STR_VAM_BLUFOR_CAMO";
_VAM_camo =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcamo = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcamo = 1;"]], "1", "1"],
	[_subsel2, [4], "", -5, [["expression", "selectcamo = 2;"]], "1", "1"],
	[_subsel3, [5], "", -5, [["expression", "selectcamo = 3;"]], "1", "1"],
	[_subsel4, [6], "", -5, [["expression", "selectcamo = 4;"]], "1", "1"],
	[_subsel5, [7], "", -5, [["expression", "selectcamo = 5;"]], "1", "1"],
	[_subsel6, [8], "", -5, [["expression", "selectcamo = 6;"]], "1", "1"],
	[_subsel7, [9], "", -5, [["expression", "selectcamo = 7;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcamo = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_camo";

waitUntil {sleep 0.1; selectcamo != 0};

if (selectcamo isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;

if (selectcamo > 0) then {hint localize "STR_VAM_SUB_CAMOUFLAGE_APPLIED";};

if (selectcamo isEqualTo 1) exitWith {
	[_targetvehicle,["Indep",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 2) exitWith {
	[_targetvehicle,["Indep_02",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 3) exitWith {
	[_targetvehicle,["Indep_03",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 4) exitWith {
	[_targetvehicle,["Guerilla_01",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 5) exitWith {
	[_targetvehicle,["Guerilla_03",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 6) exitWith {
	[_targetvehicle,["Guerilla_02",1],nil,nil] call BIS_fnc_initVehicle; [] spawn fnc_Gorgon_camo; sleep 2; hint "";
};
	
if (selectcamo isEqualTo 7) exitWith {
	_targetvehicle setObjectTextureGlobal [0, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [1, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext2_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [2, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\rcws30_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [3, "A3\Armor_F_Gamma\APC_Wheeled_03\Data\apc_wheeled_03_ext_alpha_co.paa"];
	_targetvehicle setObjectTextureGlobal [4, "A3\Armor_F\Data\camonet_NATO_Desert_CO.paa"];
	_targetvehicle setObjectTextureGlobal [5, "A3\Armor_F\Data\cage_sand_CO.paa"];
	[] spawn fnc_Gorgon_camo; sleep 2; hint "";
};