//Vehicle Appearance Manager check1
//This checks player situation when player selects option 1 : Change camoufluge
//This contains vehicles that has Sand and Olive camo only.
private _NATOcamovehicles = [
	"B_APC_Tracked_01_rcws_F",
	"B_T_APC_Tracked_01_rcws_F",
	"B_APC_Tracked_01_CRV_F",
	"B_T_APC_Tracked_01_CRV_F",
	"B_APC_Tracked_01_AA_F",
	"B_T_APC_Tracked_01_AA_F",
	"B_MBT_01_cannon_F",
	"B_T_MBT_01_cannon_F",
	"B_MBT_01_TUSK_F",
	"B_T_MBT_01_TUSK_F",
	"B_MBT_01_arty_F",
	"B_T_MBT_01_arty_F",
	"B_MBT_01_mlrs_F",
	"B_T_MBT_01_mlrs_F",
	"B_APC_Wheeled_01_cannon_F",
	"B_T_APC_Wheeled_01_cannon_F"
];
private _CSATcamovehicles = [
	"O_MBT_02_cannon_F",
	"O_APC_Tracked_02_cannon_F",
	"O_APC_Tracked_02_AA_F",
	"O_MBT_02_arty_F",
	"O_MRAP_02_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_T_MBT_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_cannon_ghex_F",
	"O_T_APC_Tracked_02_AA_ghex_F",
	"O_T_MBT_02_arty_ghex_F",
	"O_T_MRAP_02_ghex_F",
	"O_T_MRAP_02_hmg_ghex_F",
	"O_T_MRAP_02_gmg_ghex_F",
	"O_MRAP_02_F",
	"O_MRAP_gmg_02_F",
	"O_MRAP_hmg_02_F",
	"O_T_MRAP_02_ghex_F",
	"O_T_MRAP_gmg_02_ghex_F",
	"O_T_MRAP_hmg_02_ghex_F"
];
private _Prowler = [
	"B_LSV_01_AT_F",
	"B_LSV_01_armed_F",
	"B_LSV_01_unarmed_F",
	"B_T_LSV_01_AT_F",
	"B_T_LSV_01_armed_F",
	"B_T_LSV_01_unarmed_F",
	"B_CTRG_LSV_01_light_F",
	"B_T_LSV_01_armed_CTRG_F",
	"B_T_LSV_01_unarmed_CTRG_F",
	"B_LSV_01_armed_black_F",
	"B_LSV_01_armed_olive_F",
	"B_LSV_01_armed_sand_F",
	"B_LSV_01_unarmed_black_F",
	"B_LSV_01_unarmed_olive_F",
	"B_LSV_01_unarmed_sand_F",
	"B_T_LSV_01_armed_black_F",
	"B_T_LSV_01_armed_olive_F",
	"B_T_LSV_01_armed_sand_F",
	"B_T_LSV_01_unarmed_black_F",
	"B_T_LSV_01_unarmed_olive_F",
	"B_T_LSV_01_unarmed_sand_F"
];
private _Quilin = [
	"O_LSV_02_AT_F",
	"O_LSV_02_armed_F",
	"O_LSV_02_unarmed_F",
	"O_T_LSV_02_AT_F",
	"O_T_LSV_02_armed_F",
	"O_T_LSV_02_unarmed_F",
	"O_T_LSV_02_armed_viper_F",
	"O_T_LSV_02_unarmed_viper_F",
	"O_LSV_02_armed_viper_F",
	"O_LSV_02_unarmed_viper_F",
	"O_T_LSV_02_armed_black_F",
	"O_T_LSV_02_armed_ghex_F",
	"O_T_LSV_02_armed_arid_F",
	"O_T_LSV_02_unarmed_black_F",
	"O_T_LSV_02_unarmed_ghex_F",
	"O_T_LSV_02_unarmed_arid_F",
	"O_LSV_02_armed_black_F",
	"O_LSV_02_armed_ghex_F",
	"O_LSV_02_armed_arid_F",
	"O_LSV_02_unarmed_black_F",
	"O_LSV_02_unarmed_ghex_F",
	"O_LSV_02_unarmed_arid_F"
];
private _Taru = [
	"O_Heli_Transport_04_F",
	"O_Heli_Transport_04_bench_F",
	"O_Heli_Transport_04_ammo_F",
	"O_Heli_Transport_04_box_F",
	"O_Heli_Transport_04_medevac_F",
	"O_Heli_Transport_04_fuel_F",
	"O_Heli_Transport_04_repair_F",
	"O_Heli_Transport_04_covered_F",
	"O_Heli_Transport_04_black_F",
	"O_Heli_Transport_04_ammo_black_F",
	"O_Heli_Transport_04_bench_black_F",
	"O_Heli_Transport_04_box_black_F",
	"O_Heli_Transport_04_covered_black_F",
	"O_Heli_Transport_04_fuel_black_F",
	"O_Heli_Transport_04_medevac_black_F",
	"O_Heli_Transport_04_repair_black_F"
];
private _Xian = [
	"O_T_VTOL_02_infantry_dynamicLoadout_F",
	"O_T_VTOL_02_vehicle_dynamicLoadout_F",
	"O_T_VTOL_02_infantry_F",
	"O_T_VTOL_02_vehicle_F",
	"O_T_VTOL_02_infantry_hex_F",
	"O_T_VTOL_02_infantry_ghex_F",
	"O_T_VTOL_02_infantry_grey_F",
	"O_T_VTOL_02_vehicle_hex_F",
	"O_T_VTOL_02_vehicle_ghex_F",
	"O_T_VTOL_02_vehicle_grey_F"
];
private _Blackfish = [
	"B_T_VTOL_01_armed_F",
	"B_T_VTOL_01_infantry_F",
	"B_T_VTOL_01_vehicle_F",
	"B_T_VTOL_01_infantry_blue_F",
	"B_T_VTOL_01_infantry_olive_F",
	"B_T_VTOL_01_vehicle_blue_F",
	"B_T_VTOL_01_vehicle_olive_F",
	"B_T_VTOL_01_armed_blue_F",
	"B_T_VTOL_01_armed_olive_F"
];
if (VAM_conditioncheck1 isEqualTo 0) exitWith {
	hint format [localize "STR_VAM_FOB_CONDITION_CHECK_FAILED", VAM_fob_radius];
	sleep 3;
	hint "";
};
if (player isEqualTo vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_CAMOUFLAGE";
	sleep 3;
	hint "";
};
if !(player isEqualTo driver vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_CAMOUFLAGE";
	sleep 3;
	hint "";
};
if (player isEqualTo driver vehicle player) then {
	private _vehicleclass = typeof vehicle player;
	private _truckfinder = _vehicleclass splitString "_";
	//NATO Land
	if (_vehicleclass in _NATOcamovehicles) exitwith {[] spawn fnc_NATO_camo;};
	if (_vehicleclass in _Prowler) exitwith {[] spawn fnc_Prowler_camo;};
	if (_vehicleclass in ["B_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"]) exitwith {[] spawn fnc_Rhino_camo;};
	//NATO Air
	if (_vehicleclass in ["B_Plane_Fighter_01_F","B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_Cluster_F"]) exitwith {[] spawn fnc_Black_Wasp_II_camo;};
	if (_vehicleclass in _Blackfish) exitwith {[] spawn fnc_Blackfish_camo;};
	if (_vehicleclass in ["B_Heli_Attack_01_dynamicLoadout_F","B_Heli_Attack_01_F"]) exitwith {[] spawn fnc_Blackfoot_camo;};
	if (_vehicleclass in ["B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F"]) exitwith {[] spawn fnc_Ghost_Hawk_camo;};
	if (_vehicleclass in ["B_Heli_Light_01_dynamicLoadout_F","B_Heli_Light_01_armed_F","B_Heli_Light_01_F"]) exitwith {[] spawn fnc_HummingbirdPawnee_camo;}; //Hummingbrid and Pawnee
	if (_vehicleclass in ["B_Heli_Transport_03_F","B_Heli_Transport_03_black_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_03_unarmed_green_F"]) exitwith {[] spawn fnc_Huron_camo;};
	//AAF Land (Erase if you don't want to allow to custom these vehicles.)
	if (_vehicleclass in ["I_APC_Wheeled_03_cannon_F","B_APC_Wheeled_03_cannon_F"]) exitwith {[] spawn fnc_Gorgon_camo;};
	if (_vehicleclass in ["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"]) exitwith {[] spawn fnc_AAF_camo;};
	if (_vehicleclass in ["I_LT_01_AT_F","I_LT_01_scout_F","I_LT_01_AA_F","I_LT_01_cannon_F"]) exitwith {[] spawn fnc_Nyx_camo;};
	if (_vehicleclass in ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"]) exitwith {[] spawn fnc_Strider_camo;};
	//AAF Air
	if (_vehicleclass in ["I_Heli_Transport_02_F","C_IDAP_Heli_Transport_02_F"]) exitwith {[] spawn fnc_Mohawk_camo;};
	if (_vehicleclass in ["I_Heli_light_03_dynamicLoadout_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F"]) exitwith {[] spawn fnc_Hellcat_camo;};
	if (_vehicleclass in ["I_Plane_Fighter_04_F","I_Plane_Fighter_04_Cluster_F"]) exitwith {[] spawn fnc_Gryphon_camo;};
	if (_vehicleclass in ["I_Plane_Fighter_03_dynamicLoadout_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F","I_Plane_Fighter_03_Cluster_F"]) exitwith {[] spawn fnc_Buzzard_camo;};
	//CSAT Land (Erase if you don't want to allow to custom these vehicles.)
	if (_vehicleclass in _CSATcamovehicles) exitwith {[] spawn fnc_CSAT_camo;};
	if (_vehicleclass in ["O_MBT_04_cannon_F","O_T_MBT_04_cannon_F","O_MBT_04_command_F","O_T_MBT_04_command_F"]) exitwith {[] spawn fnc_Angara_camo;};
	if (_vehicleclass in ["O_APC_Wheeled_02_rcws_v2_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F","O_APC_Wheeled_02_rcws_F","O_T_APC_Wheeled_02_rcws_ghex_F"]) exitwith {[] spawn fnc_Marid_camo;};
	if (_vehicleclass in _Quilin) exitwith {[] spawn fnc_Quilin_camo;};
	if (("Truck" in _truckfinder) && ("03" in _truckfinder)) exitwith {[] spawn fnc_CSAT_camo;};
	//CSAT Air
	if (_vehicleclass in ["O_Heli_Attack_02_dynamicLoadout_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Attack_02_dynamicLoadout_black_F"]) exitwith {[] spawn fnc_Kajman_camo;};
	if (_vehicleclass in ["O_Heli_Light_02_dynamicLoadout_F","O_Heli_Light_02_F","O_Heli_Light_02_unarmed_F","O_Heli_Light_02_v2_F"]) exitwith {[] spawn fnc_Orca_camo;};
	if (_vehicleclass in ["O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","O_Plane_Fighter_02_Cluster_F"]) exitwith {[] spawn fnc_Shikra_camo;};
	if (_vehicleclass in _Taru) exitwith {[] spawn fnc_Taru_camo;};
	if (_vehicleclass in _Xian) exitwith {[] spawn fnc_Xian_camo;};
	//Zamak Trucks (Military Only) (Erase if you don't want to allow to custom these vehicles.)
	if (!("C" in _truckfinder) && ("Truck" in _truckfinder) && ("02" in _truckfinder)) exitwith {[] spawn fnc_Zamak_mil_camo;};
	//If there is no vehicle on list, then excute next.
	hint localize "STR_VAM_NOT_SUPPPORT_OR_NO_OPTION_CAMOUFLAGE";
	sleep 3;
	hint "";
};