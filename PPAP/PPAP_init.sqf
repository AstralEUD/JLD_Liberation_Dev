//Pylon Preset Allocator for Plane init
if (!hasInterface) exitWith {};

//Set vehicle availiability. You can apply multiple options at same time. PPAP_blacklist and PPAP_whitelist takes vehicle class name.
//1 = Available except blacklisted vehicles, 2 = Available for whitelisted vehicles, 3 = Available for Blufor vehicles, 4 = Available for Opfor vehicles, 5 = Available for Indep vehicles
PPAP_available_vehicles = [1];
PPAP_blacklist = [];
PPAP_whitelist = [];
//Condition check. You can apply 3 options at same time. (Default + Marker area + KP Liberation FOB area)
//Empty = Default option. Can use around vehicles those are in PPAP_ammo_vehicle_list, 1 = Can use in certain marker area. (Marker name should be like PPAP_service_area_1), 2 = Can use in KP Liberation FOB area
PPAP_condition_check_options = [];
PPAP_ammo_vehicle_list = [
	"B_Truck_01_ammo_F",
	"O_Truck_03_ammo_F","O_Truck_02_Ammo_F",
	"O_Heli_Transport_04_ammo_F",
	"O_T_Truck_03_ammo_ghex_F",
	"O_T_Truck_02_Ammo_F",
	"B_T_Truck_01_ammo_F",
	"I_Truck_02_ammo_F",
	"I_E_Truck_02_Ammo_F",
	"B_Slingload_01_Ammo_F",
	"Land_Pod_Heli_Transport_04_ammo_F",
	"Box_NATO_AmmoVeh_F",
	"Box_IND_AmmoVeh_F",
	"Box_East_AmmoVeh_F",
	"Box_EAF_AmmoVeh_F",
	"Box_EAF_AmmoVeh_F"
];
/*
Custom preset
Make your own preset on Eden editor and run these code on debug console.
copyToClipboard str [typeof vehicle player, ["<Preset Name>", getPylonMagazines vehicle player]];
*/
PPAP_custom_presets = [
["B_Heli_Light_01_dynamicLoadout_F",["Rocket",["PylonRack_7Rnd_Rocket_04_HE_F","PylonRack_7Rnd_Rocket_04_AP_F"]]],
["I_Heli_light_03_dynamicLoadout_F",["기관포",["PylonWeapon_300Rnd_20mm_shells","PylonWeapon_300Rnd_20mm_shells"]]],
["I_Heli_light_03_dynamicLoadout_F",["Scalpel x8",["PylonRack_4Rnd_LG_scalpel","PylonRack_4Rnd_LG_scalpel"]]],
["B_Plane_Fighter_01_F",["SEAD",["PylonRack_Missile_AGM_02_x1","PylonRack_Missile_AGM_02_x1","PylonRack_Missile_HARM_x1","PylonRack_Missile_HARM_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_BIM9X_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4","PylonMissile_Missile_AMRAAM_D_INT_x1","PylonMissile_Missile_AMRAAM_D_INT_x1"]]],
["O_Plane_Fighter_02_F",["SEAD",["PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_AGM_KH25_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_KH58_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R73_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_AA_R77_INT_x1","PylonMissile_Missile_KH58_INT_x1"]]],
["B_UAV_05_F",["SDB x8",["PylonRack_Bomb_SDB_x4","PylonRack_Bomb_SDB_x4"]]],
["B_UAV_05_F",["SEAD",["PylonMissile_Missile_HARM_INT_x1","PylonMissile_Missile_HARM_INT_x1"]]]
];

//Function preload
fnc_PPAP_setup= compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_setup.sqf";
fnc_PPAP_check_preset_contents = compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_check_preset_contents.sqf";
fnc_PPAP_apply= compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_apply.sqf";
fnc_PPAP_action = compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_action.sqf";
fnc_PPAP_check_condition = compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_check_condition.sqf";
fnc_PPAP_variable_cleaner = compileFinal preprocessFileLineNumbers "PPAP\functions\fnc_PPAP_variable_cleaner.sqf";

if !(count PPAP_condition_check_options isEqualTo 0) then {[] spawn fnc_PPAP_check_condition;};
[] spawn fnc_PPAP_action;

systemchat localize "STR_PPAP_INITIALIZED";