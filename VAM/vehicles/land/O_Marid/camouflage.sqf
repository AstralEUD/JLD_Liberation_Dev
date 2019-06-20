//O_Marid Camouflage
//["a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_01_opfor_co.paa","a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_02_opfor_co.paa","a3\data_f\vehicles\turret_opfor_co.paa","a3\armor_f\data\camonet_csat_hex_desert_co.paa","a3\armor_f\data\cage_csat_co.paa"]
//["a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_01_ghex_co.paa","a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_02_ghex_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa","a3\armor_f\data\camonet_csat_hex_green_co.paa","a3\armor_f\data\cage_csat_green_co.paa"]
//0~2 = Vehicle texture, 3 = Camoufluge net texture, 4 = Slat armor texture
selectcamo = 0;
_subname = localize "STR_VAM_SUB_CAMOUFLAGE";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_HEX_ARID_CAMO";
_subsel2 = localize "STR_VAM_GREEN_HEX_CAMO";
_VAM_camo =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcamo = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcamo = 1;"]], "1", "1"],
	[_subsel2, [4], "", -5, [["expression", "selectcamo = 2;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcamo = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_camo";

waitUntil {sleep 0.1; selectcamo != 0};
private _targetvehicle = vehicle player;

if (selectcamo isEqualTo -1) exitWith {};

if (selectcamo > 0) then {hint localize "STR_VAM_SUB_CAMOUFLAGE_APPLIED";};
	
if (selectcamo isEqualTo 1) exitWith {
	_targetvehicle setObjectTextureGlobal [0, "a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_01_opfor_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [1, "a3\armor_f_beta\apc_wheeled_02\data\apc_wheeled_02_ext_02_opfor_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [2, "a3\data_f\vehicles\turret_opfor_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [3, "a3\armor_f\data\camonet_csat_hex_desert_co.paa"];
	_targetvehicle setObjectTextureGlobal [4, "a3\armor_f\data\cage_csat_co.paa"];
	[] spawn fnc_Marid_camo; sleep 2; hint "";
};

if (selectcamo isEqualTo 2) exitWith {
	_targetvehicle setObjectTextureGlobal [0, "a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_01_ghex_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [1, "a3\armor_f_exp\apc_wheeled_02\data\apc_wheeled_02_ext_02_ghex_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [2, "a3\data_f_exp\vehicles\turret_ghex_co.paa"]; 
	_targetvehicle setObjectTextureGlobal [3, "a3\armor_f\data\camonet_csat_hex_green_co.paa"];
	_targetvehicle setObjectTextureGlobal [4, "a3\armor_f\data\cage_csat_green_co.paa"];
	[] spawn fnc_Marid_camo; sleep 2; hint "";
};