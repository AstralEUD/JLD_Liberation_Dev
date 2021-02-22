

// !! IF YOU WANT TO EDIT THIS FOR MODDING PURPOSES, PLEASE USE CLASSNAMES_EXTENSIONS.SQF INSTEAD !!
// If you know what you're doing then sure, proceed :)


if (isNil "FOB_typename")
then {
	FOB_typename = "Land_Cargo_HQ_V1_F";
};
if (isNil "FOB_box_typename")
then {
	FOB_box_typename = "B_Slingload_01_Cargo_F";
};
if (isNil "FOB_truck_typename")
then {
	FOB_truck_typename = "B_Truck_01_box_F";
};
if (isNil "Arsenal_typename")
then {
	Arsenal_typename = "B_CargoNet_01_ammo_F";
};
if (isNil "Respawn_truck_typename")
then {
	Respawn_truck_typename = "I_E_Offroad_01_comms_F";
};
if (isNil "huron_typename")
then {
	huron_typename = "C_IDAP_Heli_Transport_02_F";
};
if (isNil "ammobox_b_typename")
then {
	ammobox_b_typename = "Box_NATO_AmmoVeh_F";
};
if (isNil "ammobox_o_typename")
then {
	ammobox_o_typename = "Box_East_AmmoVeh_F";
};
if (isNil "opfor_ammobox_transport")
then {
	opfor_ammobox_transport = "O_Truck_03_transport_F";
};
if (isNil "commander_classname")
then {
	commander_classname = "B_officer_F";
};
if (isNil "crewman_classname")
then {
	crewman_classname = "B_crew_F"
};
if (isNil "pilot_classname")
then {
	pilot_classname = "B_Helipilot_F"
};
if (isNil "INF_Helicopter")
then {
	INF_Helicopter = "C_Heli_Light_01_civil_F"
};

infantry_units = [
["B_Soldier_F", 0, 0, 0],
["B_soldier_LAT_F", 0, 0, 0],
["B_soldier_AA_F", 0, 0, 0]
];
if (isNil "infantry_units_extension")
then {
	infantry_units_extension = []
};
if (isNil "infantry_units_overwrite")
then {
	infantry_units_overwrite = false
};
if (infantry_units_overwrite)
then {
	infantry_units = infantry_units_extension;
}
else {
	infantry_units = infantry_units + infantry_units_extension;
};

light_vehicles = [
["SUV_01_base_grey_F", 15, 10, 0],
["B_GEN_Offroad_01_gen_F", 15, 10, 0],
["C_Offroad_02_unarmed_green_F", 15, 10, 0],
["B_G_Van_01_transport_F", 20, 10, 0],
["B_G_Van_02_transport_F", 20, 10, 0],
["B_LSV_01_unarmed_F", 20, 10, 0],
["B_LSV_01_armed_F", 20, 20, 0],
["B_LSV_01_AT_F", 20, 30, 0],
["B_MRAP_01_F", 30, 10, 0],
["B_MRAP_01_hmg_F", 30, 20, 0],
["B_MRAP_01_gmg_F", 30, 30, 0],
["I_MRAP_03_F", 30, 10, 0],
["I_MRAP_03_hmg_F", 30, 20, 0],
["I_MRAP_03_gmg_F", 30, 30, 0],
["B_Truck_01_transport_F", 50, 10, 0],
["B_Truck_01_flatbed_F", 50, 10, 0],
["B_Truck_01_cargo_F", 50, 10, 0],
["I_Truck_02_transport_F", 40, 10, 0],
["B_UGV_01_F", 300, 50, 300],
["B_UGV_01_rcws_F", 300, 100, 300],
["B_SDV_01_F", 50, 10, 0],
["B_Boat_Transport_01_F", 30, 10, 0],
["B_G_Boat_Transport_02_F", 70, 10, 0],
["B_Boat_Armed_01_minigun_F", 100, 100, 0]
];
if (isNil "light_vehicles_extension")
then {
	light_vehicles_extension = []
};
if (isNil "light_vehicles_overwrite")
then {
	light_vehicles_overwrite = false
};
if (light_vehicles_overwrite)
then {
	light_vehicles = light_vehicles_extension;
}
else {
	light_vehicles = light_vehicles + light_vehicles_extension;
};

heavy_vehicles = [
["B_APC_Wheeled_03_cannon_F", 50, 100, 0],
["B_APC_Wheeled_01_cannon_F", 70, 140, 0],
["B_AFV_Wheeled_01_cannon_F", 100, 150, 0],
["B_AFV_Wheeled_01_up_cannon_F", 100, 180, 0],
["I_LT_01_scout_F", 50, 30, 0],
["I_LT_01_cannon_F", 60, 50, 0],
["I_LT_01_AT_F", 60, 70, 0],
["I_LT_01_AA_F", 60, 70, 0],
["I_APC_tracked_03_cannon_F", 100, 120, 0],
["B_APC_Tracked_01_AA_F", 100, 160, 0],
["I_MBT_03_cannon_F", 150, 180, 0],
["B_MBT_01_cannon_F", 150, 180, 0],
["B_MBT_01_TUSK_F", 150, 200, 0],
["O_MBT_04_cannon_F", 180, 400, 0],
["I_Truck_02_MRL_F", 300, 10000, 300],
["B_MBT_01_arty_F", 300, 10000, 300]
];
if (isNil "heavy_vehicles_extension")
then {
	heavy_vehicles_extension = []
};
if (isNil "heavy_vehicles_overwrite")
then {
	heavy_vehicles_overwrite = false
};
if (heavy_vehicles_overwrite)
then {
	heavy_vehicles = heavy_vehicles_extension;
}
else {
	heavy_vehicles = heavy_vehicles + heavy_vehicles_extension;
};

air_vehicles = [
["B_Heli_Light_01_F", 0, 20, 30],
["I_Heli_light_03_unarmed_F", 0, 30, 40],
["B_Heli_Transport_01_F", 0, 50, 50],
["I_Heli_Transport_02_F", 0, 70, 50],
["O_Heli_Light_02_unarmed_F", 0, 50, 50],
["B_Heli_Transport_03_unarmed_F", 0, 80, 100],
["O_Heli_Transport_04_black_F", 0, 50, 100],
["O_Heli_Transport_04_covered_black_F", 0, 80, 100],
["O_Heli_Transport_04_medevac_black_F", 0, 50, 100],
["B_Heli_Light_01_dynamicLoadout_F", 0, 100, 50],
["I_Heli_light_03_dynamicLoadout_F", 0, 150, 50],
["O_Heli_Light_02_dynamicLoadout_F", 0, 150, 100],
["B_Heli_Attack_01_dynamicLoadout_F", 0, 200, 100],
["O_Heli_Attack_02_dynamicLoadout_black_F", 0, 350, 250],
["C_Plane_Civil_01_racing_F", 0, 30, 100],
["I_Plane_Fighter_03_dynamicLoadout_F", 0, 150, 150],
["I_Plane_Fighter_04_F", 0, 250, 200],
["B_Plane_CAS_01_dynamicLoadout_F", 0, 400, 350],
["B_Plane_Fighter_01_Stealth_F", 0, 300, 400],
["B_Plane_Fighter_01_F", 0, 450, 500],
["O_Plane_Fighter_02_Stealth_F", 0, 500, 550],
["B_T_VTOL_01_infantry_F", 0, 100, 300],
["B_T_VTOL_01_vehicle_F", 0, 100, 300],
["B_T_VTOL_01_armed_F", 0, 500, 300],
["O_T_VTOL_02_vehicle_F", 0, 550, 450],
["B_UAV_02_dynamicLoadout_F", 300, 250, 300],
["B_UAV_05_F", 500, 300, 500],
["B_T_UAV_03_dynamicLoadout_F", 400, 300, 400]
];
if (isNil "air_vehicles_extension")
then {
	air_vehicles_extension = []
};
if (isNil "air_vehicles_overwrite")
then {
	air_vehicles_overwrite = false
};
if (air_vehicles_overwrite)
then {
	air_vehicles = air_vehicles_extension;
}
else {
	air_vehicles = air_vehicles + air_vehicles_extension;
};

static_vehicles = [
["B_HMG_02_F", 20, 20, 0],
["B_HMG_02_high_F", 20, 20, 0],
["B_HMG_01_F", 20, 20, 0],
["B_HMG_01_high_F", 20, 20, 0],
["B_GMG_01_F", 20, 20, 0],
["B_GMG_01_high_F", 20, 20, 0],
["B_static_AA_F", 20, 20, 0],
["B_static_AT_F", 20, 20, 0],
["B_Mortar_01_F", 20, 50, 0],
["B_AAA_System_01_F", 100, 200, 0],
["B_SAM_System_01_F", 100, 250, 0],
["B_SAM_System_02_F", 100, 300, 0],
["B_SAM_System_03_F", 100, 300, 0],
["B_Radar_System_01_F", 50, 300, 0]
];
if (isNil "static_vehicles_extension")
then {
	static_vehicles_extension = []
};
if (isNil "static_vehicles_overwrite")
then {
	static_vehicles_overwrite = false
};
if (static_vehicles_overwrite)
then {
	static_vehicles = static_vehicles_extension;
}
else {
	static_vehicles = static_vehicles + static_vehicles_extension;
};

buildings = [
["Land_HBarrier_Big_F",0,5,0],
["Land_HBarrier_5_F",0,5,0],
["Land_HBarrier_3_F",0,5,0],
["Land_HBarrier_1_F",0,5,0],
["Land_HBarrierWall6_F",0,5,0],
["Land_HBarrierWall4_F",0,5,0],
["Land_HBarrierWall_corner_F",0,5,0],
["Land_RampConcreteHigh_F",0,100,0],
["Land_CncWall4_F",0,5,0],
["Land_CncBarrierMedium4_F",0,5,0],
["Land_CncBarrier_stripes_F",0,5,0],
["Land_New_WiredFence_5m_F",0,5,0],
["Land_Razorwire_F",0,5,0],
["Land_BagFence_Long_F",0,5,0],
["Land_BagFence_Short_F",0,5,0],
["Land_BagFence_Round_F",0,5,0],
["Land_Shoot_House_Corner_Stand_F",0,5,0],
["Land_Shoot_House_Corner_Crouch_F",0,5,0],
["Land_Shoot_House_Corner_Prone_F",0,5,0],
["Land_Shoot_House_Wall_Stand_F",0,5,0],
["Land_Shoot_House_Wall_Crouch_F",0,5,0],
["Land_BarGate_F",0,5,0],
["Land_HelipadCivil_F",0,50,0],
["Land_HelipadCircle_F",0,50,0],
["Land_HelipadSquare_F",0,50,0],
["Land_PortableDesk_01_sand_F",0,20,0],
["Land_SolarPanel_04_sand_F",0,20,0],
["Land_PortableGenerator_01_F",0,20,0],
["OmniDirectionalAntenna_01_sand_F",0,20,0],
["Land_PortableWeatherStation_01_sand_F",0,20,0],
["Land_TripodScreen_01_large_F",0,20,0],
["Land_SatelliteAntenna_01_F",0,20,0],
["Land_Missle_Trolley_02_F",0,20,0],
["Land_Bomb_Trolley_01_F",0,20,0],
["Land_PowerGenerator_F",0,20,0],
["WaterPump_01_sand_F",0,20,0],
["Land_DieselGroundPowerUnit_01_F",0,20,0],
["Land_PressureWasher_01_F",0,20,0],
["Land_EngineCrane_01_F",0,20,0],
["Land_SolarPanel_1_F",0,20,0],
["Windsock_01_F",0,20,0],
["Land_FoodSacks_01_cargo_brown_F",0,20,0],
["Land_WaterBottle_01_stack_F",0,20,0],
["Land_WoodenCrate_01_F",0,20,0],
["Land_Pallets_stack_F",0,20,0],
["Land_Pallet_MilBoxes_F",0,20,0],
["Box_FIA_Ammo_F",0,20,0],
["Land_CinderBlocks_01_F",0,20,0],
["CargoNet_01_barrels_F",0,20,0],
["Land_TentDome_F",0,20,0],
["Land_Sink_F",0,20,0],
["Land_FieldToilet_F",0,20,0],
["MapBoard_altis_F",0,20,0],
["Target_F",0,20,0],
["Land_SignM_WarningMilitaryArea_english_F",0,20,0],
["Land_SignM_WarningMilitaryVehicles_english_F",0,20,0],
["Flag_NATO_F",0,20,0],
["Flag_UNO_F",0,20,0],
["Flag_US_F",0,20,0],
["Flag_UK_F",0,20,0],
["Flag_UK_F",0,20,0],
["Land_Loudspeakers_F",0,20,0],
["Land_Sawmill_01_illuminati_tower_F",0,3000,0],
["Land_DeerStand_01_F",0,500,0],
["Land_HBarrierTower_F",0,800,0],
["Land_BagBunker_Small_F",0,200,0],
["Land_GarageOffice_01_F",0,10000,0],
["Land_MedicalTent_01_wdl_generic_open_F",0,1000,0],
["Land_Cargo_House_V1_F",0,500,0],
["Land_Cargo_Patrol_V1_F",0,700,0],
["Land_RepairDepot_01_green_F",0,150,0],
["Land_ConnectorTent_01_wdl_open_F",0,200,0],
["Land_WaterTower_01_F",0,200,0],
["Land_WaterTank_02_F",0,100,0],
["CamoNet_BLUFOR_open_F",0,200,0],
["CamoNet_BLUFOR_F",0,200,0],
["Land_CanvasCover_01_F",0,300,0],
["Land_CanvasCover_02_F",0,200,0],
["PortableHelipadLight_01_red_F",0,50,0],
["Land_PortableLight_02_double_yellow_F",0,50,0],
["Land_PortableLight_02_quad_yellow_F",0,100,0],
["Land_TentLamp_01_standing_F",0,50,0],
["Land_TentLamp_01_standing_red_F",0,50,0],
["Land_PortableLight_double_F",0,80,0],
["Land_LampStreet_small_F",0,300,0],
["Land_LampHalogen_F",0,1000,0],
["Land_MobilePhone_smart_F",0,3000,0],
["Land_Camera_01_F",0,2000,0],
["Land_Money_F",0,1000,0]
];

building_classnames=[];
{
	building_classnames pushBack (_x#0);
	}foreach buildings;

simulated_buildings = [
"Land_Sawmill_01_illuminati_tower_F",
"Land_DeerStand_01_F",
"Land_GarageOffice_01_F",
"Land_Cargo_House_V1_F",
"Land_Cargo_Patrol_V1_F",
"Land_WaterTower_01_F",
"CamoNet_BLUFOR_open_F",
"CamoNet_BLUFOR_F",
"Windsock_01_F",
"Land_BarGate_F",
"Flag_NATO_F",
"Flag_UNO_F",
"Flag_US_F",
"Flag_UK_F",
"PortableHelipadLight_01_red_F",
"Land_PortableLight_02_double_yellow_F",
"Land_PortableLight_02_quad_yellow_F",
"Land_TentLamp_01_standing_F",
"Land_TentLamp_01_standing_red_F",
"Land_PortableLight_double_F",
"Land_LampStreet_small_F",
"Land_LampHalogen_F"
];

if (isNil "buildings_extension")
then {
	buildings_extension = []
};
if (isNil "buildings_overwrite")
then {
	buildings_overwrite = false
};
if (buildings_overwrite)
then {
	buildings = buildings_extension;
}
else {
	buildings = buildings + buildings_extension;
};

support_vehicles = [
[Arsenal_typename, 80, 300, 0],
["C_IDAP_supplyCrate_F", 50, 50, 0],
[FOB_box_typename, 0, 3000, 0],
[FOB_truck_typename, 50, 3000, 0],
[Respawn_truck_typename, 100, 300, 50],
["B_APC_Tracked_01_CRV_F", 150, 500, 0],
["B_Slingload_01_Medevac_F", 50, 100, 50],
["B_Slingload_01_Repair_F", 50, 100, 50],
["B_Slingload_01_Ammo_F", 50, 100, 50],
["B_Slingload_01_Fuel_F", 50, 100, 50],
["B_Truck_01_medical_F", 50, 150, 0],
["B_Truck_01_Repair_F", 50, 150, 0],
["B_Truck_01_ammo_F", 50, 150, 0],
["B_Truck_01_fuel_F", 50, 150, 0],
["I_Truck_02_medical_F", 40, 130, 0],
["I_Truck_02_box_F", 40, 130, 0],
["I_Truck_02_ammo_F", 40, 130, 0],
["I_Truck_02_fuel_F", 40, 130, 0],
["Box_East_AmmoVeh_F", 0, 115, 0],
["Box_NATO_AmmoVeh_F", 0, 154, 0]
];
if (isNil "support_vehicles_extension")
then {
	support_vehicles_extension = []
};
if (isNil "support_vehicles_overwrite")
then {
	support_vehicles_overwrite = false
};
if (support_vehicles_overwrite)
then {
	support_vehicles = support_vehicles_extension;
}
else {
	support_vehicles = support_vehicles + support_vehicles_extension;
};

if (isNil "blufor_squad_inf_light")
then {
	blufor_squad_inf_light = []
};
if (count blufor_squad_inf_light == 0)
then {
	blufor_squad_inf_light = ["B_Soldier_SL_F", "B_Soldier_TL_F", "B_Soldier_GL_F", "B_soldier_AR_F", "B_Soldier_GL_F", "B_medic_F", "B_Soldier_LAT_F", "B_Soldier_F", "B_Soldier_F"];
};
if (isNil "blufor_squad_inf")
then {
	blufor_squad_inf = []
};
if (count blufor_squad_inf == 0)
then {
	blufor_squad_inf = ["B_Soldier_SL_F", "B_Soldier_TL_F", "B_Soldier_AR_F", "B_HeavyGunner_F", "B_medic_F", "B_Soldier_GL_F", "B_Soldier_LAT_F", "B_Soldier_LAT_F", "B_soldier_M_F", "B_Sharpshooter_F"];
};
if (isNil "blufor_squad_at")
then {
	blufor_squad_at = []
};
if (count blufor_squad_at == 0)
then {
	blufor_squad_at = ["B_Soldier_SL_F", "B_soldier_AT_F", "B_soldier_AT_F", "B_soldier_AT_F", "B_medic_F", "B_soldier_F"];
};
if (isNil "blufor_squad_aa")
then {
	blufor_squad_aa = []
};
if (count blufor_squad_aa == 0)
then {
	blufor_squad_aa = ["B_Soldier_SL_F", "B_soldier_AA_F", "B_soldier_AA_F", "B_soldier_AA_F", "B_medic_F", "B_soldier_F"];
};
if (isNil "blufor_squad_recon")
then {
	blufor_squad_recon = []
};
if (count blufor_squad_recon == 0)
then {
	blufor_squad_recon = ["B_recon_TL_F", "B_recon_F", "B_recon_exp_F", "B_recon_medic_F", "B_recon_LAT_F", "B_recon_LAT_F", "B_recon_M_F", "B_Recon_Sharpshooter_F", "B_recon_F"];
};
if (isNil "blufor_squad_para")
then {
	blufor_squad_para = []
};
if (count blufor_squad_para == 0)
then {
	blufor_squad_para = ["B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F", "B_soldier_PG_F"];
};
if (isNil "blufor_squad_inf_light")
then {
	blufor_squad_inf_light = []
};
if (count blufor_squad_inf_light == 0)
then {
	blufor_squad_inf_light = ["B_Soldier_SL_F", "B_Soldier_TL_F", "B_Soldier_GL_F", "B_soldier_AR_F", "B_Soldier_GL_F", "B_medic_F", "B_Soldier_LAT_F", "B_Soldier_F", "B_Soldier_F"];
};
if (isNil "uavs")
then {
	uavs = []
};
uavs = [] + uavs + ["B_UGV_02_Demining_F", "B_UGV_02_Science_F", "B_UAV_01_F", "B_UAV_02_dynamicLoadout_F", "B_UGV_01_F", "B_UGV_01_rcws_F", "B_T_UAV_03_dynamicLoadout_F", "B_AAA_System_01_F", "B_SAM_System_01_F", "B_SAM_System_02_F", "B_UAV_05_F","B_UAV_06_F", "O_T_UAV_04_CAS_F", "O_UAV_02_CAS_F", "O_UAV_02_F", "B_Radar_System_01_F", "B_SAM_System_03_F", "B_Ship_Gun_01_F", "B_Ship_MRLS_01_F"];
if (isNil "elite_vehicles_extension")
then {
	elite_vehicles_extension = []
};
elite_vehicles = [] + elite_vehicles_extension + [
"B_AFV_Wheeled_01_cannon_F",
"B_AFV_Wheeled_01_up_cannon_F",
"B_MBT_01_TUSK_F",
"O_MBT_04_cannon_F",
"I_Truck_02_MRL_F",
"B_MBT_01_arty_F",
"B_Heli_Attack_01_F",
"O_Heli_Attack_02_black_F",
"I_Plane_Fighter_03_CAS_F",
"I_Plane_Fighter_04_F",
"B_Plane_CAS_01_F",
"B_Plane_CAS_01_Cluster_F",
"B_Plane_Fighter_01_F",
"O_T_VTOL_02_vehicle_F",
"B_Radar_System_01_F",
"O_Plane_Fighter_02_Stealth_F",
"B_APC_Tracked_01_CRV_F"
];
if (isNil "ai_resupply_sources_extension")
then {
	ai_resupply_sources_extension = []
};
ai_resupply_sources = [] + ai_resupply_sources_extension + [Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black"];
if (isNil "vehicle_repair_sources_extension")
then {
	vehicle_repair_sources_extension = []
};
vehicle_repair_sources = [] + vehicle_repair_sources_extension + [

"B_APC_Tracked_01_CRV_F", "C_Offroad_01_repair_F", "B_Truck_01_Repair_F", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Black", "I_Truck_02_box_F"

];
if (isNil "vehicle_rearm_sources_extension")
then {
	vehicle_rearm_sources_extension = []
};
vehicle_rearm_sources = [] + vehicle_rearm_sources_extension + [

"B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Slingload_01_Ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black", "I_Truck_02_ammo_F"

];
if (isNil "vehicle_refuel_sources_extension")
then {
	vehicle_refuel_sources_extension = []
};
vehicle_refuel_sources = [] + vehicle_refuel_sources_extension + [

"B_APC_Tracked_01_CRV_F", "B_Truck_01_fuel_F", "B_Slingload_01_Fuel_F", "I_Truck_02_fuel_F"

];
squads = [
//[blufor_squad_inf_light, 20, 0, 0],
//[blufor_squad_inf, 30, 0, 0],
//[blufor_squad_at, 20, 25, 0],
//[blufor_squad_aa, 20, 25, 0],
//[blufor_squad_recon, 25, 0, 0],
//[blufor_squad_para, 20, 0, 0]
];

if (isNil "opfor_sentry")
then {
	opfor_sentry = "O_Soldier_lite_F";
};
if (isNil "opfor_rifleman")
then {
	opfor_rifleman = "O_Soldier_F";
};
if (isNil "opfor_grenadier")
then {
	opfor_grenadier = "O_Soldier_GL_F";
};
if (isNil "opfor_squad_leader")
then {
	opfor_squad_leader = "O_Soldier_SL_F";
};
if (isNil "opfor_team_leader")
then {
	opfor_team_leader = "O_Soldier_TL_F";
};
if (isNil "opfor_marksman")
then {
	opfor_marksman = "O_soldier_M_F";
};
if (isNil "opfor_machinegunner")
then {
	opfor_machinegunner = "O_Soldier_AR_F";
};
if (isNil "opfor_heavygunner")
then {
	opfor_heavygunner = "O_HeavyGunner_F";
};
if (isNil "opfor_medic")
then {
	opfor_medic = "O_medic_F";
};
if (isNil "opfor_rpg")
then {
	opfor_rpg = "O_Soldier_LAT_F";
};
if (isNil "opfor_at")
then {
	opfor_at = "O_Soldier_AT_F";
};
if (isNil "opfor_aa")
then {
	opfor_aa = "O_Soldier_AA_F";
};
if (isNil "opfor_officer")
then {
	opfor_officer = "O_officer_F";
};
if (isNil "opfor_sharpshooter")
then {
	opfor_sharpshooter = "O_Sharpshooter_F";
};
if (isNil "opfor_sniper")
then {
	opfor_sniper = "O_sniper_F";
};
if (isNil "opfor_engineer")
then {
	opfor_engineer = "O_engineer_F";
};
if (isNil "opfor_paratrooper")
then {
	opfor_paratrooper = "O_soldier_PG_F";
};
if (isNil "opfor_mrap")
then {
	opfor_mrap = "O_MRAP_02_F";
};
if (isNil "opfor_mrap_armed")
then {
	opfor_mrap_armed = "O_MRAP_02_gmg_F";
};
if (isNil "opfor_transport_helo")
then {
	opfor_transport_helo = "O_Heli_Transport_04_bench_F";
};
if (isNil "opfor_transport_truck")
then {
	opfor_transport_truck = "O_Truck_03_covered_F";
};
if (isNil "opfor_fuel_truck")
then {
	opfor_fuel_truck = "O_Truck_03_fuel_F";
};
if (isNil "opfor_ammo_truck")
then {
	opfor_ammo_truck = "O_Truck_03_ammo_F";
};
if (isNil "opfor_fuel_container")
then {
	opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
};
if (isNil "opfor_ammo_container")
then {
	opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
};
if (isNil "opfor_flag")
then {
	opfor_flag = "Flag_CSAT_F";
};

militia_squad = [
"O_G_Soldier_SL_F",
"O_G_Soldier_A_F",
"O_G_Soldier_AR_F",
"O_G_medic_F",
"O_G_engineer_F",
"O_Soldier_AA_F",
"O_Soldier_AA_F",
"O_Soldier_AA_F",
"O_Soldier_AAR_F",
"O_Soldier_AAT_F",
"O_Soldier_AAA_F",
"O_soldierU_AAR_F",
"O_soldierU_AAT_F",
"O_soldierU_AA_F",
"O_soldierU_AAA_F",
"O_G_Soldier_exp_F",
"O_G_Soldier_GL_F",
"O_G_Soldier_M_F",
"O_G_Soldier_F",
"O_G_Soldier_LAT_F",
"O_G_Soldier_lite_F",
"O_G_Sharpshooter_F",
"O_G_Sharpshooter_F",
"O_G_Sharpshooter_F",
"O_V_Soldier_LAT_hex_F",
"O_V_Soldier_TL_hex_F",
"O_V_Soldier_M_hex_F",
"O_G_Soldier_TL_F",
"O_Soldier_AHAT_F",
"O_Soldier_HAT_F",
"O_G_Soldier_LAT2_F"
];
if (isNil "militia_squad_extension")
then {
	militia_squad_extension = []
};
if (isNil "militia_squad_overwrite")
then {
	militia_squad_overwrite = false
};
if (militia_squad_overwrite)
then {
	militia_squad = militia_squad_extension;
}
else {
	militia_squad = militia_squad + militia_squad_extension;
};

militia_vehicles = [
"O_HMG_02_high_F",
"O_HMG_02_high_F",
"O_HMG_02_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_G_Offroad_01_armed_F",
"O_G_Offroad_01_AT_F",
"O_static_AA_F",
"O_LSV_02_armed_F"
];
if (isNil "militia_vehicles_extension")
then {
	militia_vehicles_extension = []
};
if (isNil "militia_vehicles_overwrite")
then {
	militia_vehicles_overwrite = false
};
if (militia_vehicles_overwrite)
then {
	militia_vehicles = militia_vehicles_extension;
}
else {
	militia_vehicles = militia_vehicles + militia_vehicles_extension;
};

opfor_vehicles = [
"O_HMG_02_high_F",
"O_HMG_02_high_F",
"O_APC_Tracked_02_cannon_F",
"O_APC_Tracked_02_AA_F",
"O_MBT_02_cannon_F",
"O_MRAP_02_hmg_F",
"O_MRAP_02_gmg_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_MBT_02_arty_F",
"O_static_AA_F",
"O_APC_Wheeled_02_rcws_F",
"O_T_LSV_02_armed_F",
"O_T_LSV_02_unarmed_F",
"O_T_LSV_02_AT_F",
"O_MBT_04_command_F",
"O_Radar_System_02_F",
"O_SAM_System_04_F",
"O_SAM_System_04_F"
];
if (isNil "opfor_vehicles_extension")
then {
	opfor_vehicles_extension = []
};
if (isNil "opfor_vehicles_overwrite")
then {
	opfor_vehicles_overwrite = false
};
if (opfor_vehicles_overwrite)
then {
	opfor_vehicles = opfor_vehicles_extension;
}
else {
	opfor_vehicles = opfor_vehicles + opfor_vehicles_extension;
};

opfor_vehicles_low_intensity = [
"O_APC_Tracked_02_cannon_F",
"O_MBT_02_cannon_F",
"O_MRAP_02_F",
"O_MRAP_02_hmg_F",
"O_MRAP_02_gmg_F",
"O_HMG_02_high_F",
"O_HMG_02_high_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_Mortar_01_F",
"O_G_Offroad_01_armed_F",
"O_static_AA_F",
"O_APC_Wheeled_02_rcws_F",
"O_T_LSV_02_armed_F",
"O_T_LSV_02_AT_F"
];
if (isNil "opfor_vehicles_low_intensity_extension")
then {
	opfor_vehicles_low_intensity_extension = []
};
if (isNil "opfor_vehicles_low_intensity_overwrite")
then {
	opfor_vehicles_low_intensity_overwrite = false
};
if (opfor_vehicles_low_intensity_overwrite)
then {
	opfor_vehicles_low_intensity = opfor_vehicles_low_intensity_extension;
}
else {
	opfor_vehicles_low_intensity = opfor_vehicles_low_intensity + opfor_vehicles_low_intensity_extension;
};

opfor_battlegroup_vehicles = [
"O_T_VTOL_02_infantry_F",
"O_APC_Tracked_02_cannon_F",
"O_APC_Tracked_02_AA_F",
"O_MBT_02_cannon_F",
"O_MBT_02_arty_F",
"O_MBT_02_arty_F",
"O_APC_Wheeled_02_rcws_F",
"O_Heli_Transport_04_covered_F",
"O_T_MRAP_02_hmg_ghex_F",
"O_T_MRAP_02_gmg_ghex_F",
"O_MBT_04_command_F",
"O_MBT_04_command_F",
"O_Radar_System_02_F",
"O_SAM_System_04_F"
];
if (isNil "opfor_battlegroup_vehicles_extension")
then {
	opfor_battlegroup_vehicles_extension = []
};
if (isNil "opfor_battlegroup_vehicles_overwrite")
then {
	opfor_battlegroup_vehicles_overwrite = false
};
if (opfor_battlegroup_vehicles_overwrite)
then {
	opfor_battlegroup_vehicles = opfor_battlegroup_vehicles_extension;
}
else {
	opfor_battlegroup_vehicles = opfor_battlegroup_vehicles + opfor_battlegroup_vehicles_extension;
};

opfor_battlegroup_vehicles_low_intensity = [
"O_APC_Tracked_02_cannon_F",
"O_MBT_02_cannon_F",
"O_MRAP_02_hmg_F",
"O_MRAP_02_gmg_F",
"O_G_Offroad_01_armed_F",
"O_G_Offroad_01_AT_F",
"O_static_AA_F",
"O_Mortar_01_F",
"O_APC_Wheeled_02_rcws_F",
"O_APC_Wheeled_02_rcws_F",
"O_T_LSV_02_armed_F",
"O_T_LSV_02_AT_F"
];
if (isNil "opfor_battlegroup_vehicles_low_intensity_extension")
then {
	opfor_battlegroup_vehicles_low_intensity_extension = []
};
if (isNil "opfor_battlegroup_vehicles_low_intensity_overwrite")
then {
	opfor_battlegroup_vehicles_low_intensity_overwrite = false
};
if (opfor_battlegroup_vehicles_low_intensity_overwrite)
then {
	opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity_extension;
}
else {
	opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity + opfor_battlegroup_vehicles_low_intensity_extension;
};

opfor_troup_transports = [
"O_Truck_02_transport_F",
"O_Truck_03_transport_F",
"O_Truck_02_transport_F",
"O_Truck_03_transport_F",
"O_G_Van_02_transport_F",
"O_Heli_Light_02_F",
"O_Heli_Attack_02_F",
"O_Heli_Attack_02_F",
"O_Heli_Transport_04_covered_F",
"O_T_VTOL_02_infantry_F"
];
if (isNil "opfor_troup_transports_extension")
then {
	opfor_troup_transports_extension = []
};
if (isNil "opfor_troup_transports_overwrite")
then {
	opfor_troup_transports_overwrite = false
};
if (opfor_troup_transports_overwrite)
then {
	opfor_troup_transports = opfor_troup_transports_extension;
}
else {
	opfor_troup_transports = opfor_troup_transports + opfor_troup_transports_extension;
};

opfor_choppers = [
"O_Heli_Light_02_F",
"O_Heli_Light_02_F",
"O_Heli_Attack_02_F",
"O_Heli_Attack_02_F",
"O_Heli_Attack_02_F",
"O_T_VTOL_02_infantry_F",
"O_T_VTOL_02_infantry_F"
];
if (isNil "opfor_choppers_extension")
then {
	opfor_choppers_extension = []
};
if (isNil "opfor_choppers_overwrite")
then {
	opfor_choppers_overwrite = false
};
if (opfor_choppers_overwrite)
then {
	opfor_choppers = opfor_choppers_extension;
}
else {
	opfor_choppers = opfor_choppers + opfor_choppers_extension;
};

opfor_air = [
"O_Plane_CAS_02_F",
"O_Plane_CAS_02_F",
"O_Plane_CAS_02_F",
"O_Plane_Fighter_02_F",
"O_Plane_Fighter_02_F",
"O_Plane_Fighter_02_F",
"O_T_VTOL_02_infantry_F",
"O_UAV_02_F"
];
if (isNil "opfor_air_extension")
then {
	opfor_air_extension = []
};
if (isNil "opfor_air_overwrite")
then {
	opfor_air_overwrite = false
};
if (opfor_air_overwrite)
then {
	opfor_air = opfor_air_extension;
}
else {
	opfor_air = opfor_air + opfor_air_extension;
};

civilians = [
"C_man_1",
"C_man_polo_6_F",
"C_man_polo_3_F",
"C_man_polo_2_F",
"C_man_polo_4_F",
"C_man_polo_5_F",
"C_man_polo_1_F",
"C_man_p_beggar_F",
"C_man_1_2_F",
"C_man_p_fugitive_F",
"C_man_hunter_1_F",
"C_journalist_F",
"C_man_shorts_2_F",
"C_man_w_worker_F"
];
if (isNil "civilians_extension")
then {
	civilians_extension = []
};
if (isNil "civilians_overwrite")
then {
	civilians_overwrite = false
};
if (civilians_overwrite)
then {
	civilians = civilians_extension;
}
else {
	civilians = civilians + civilians_extension;
};

civilian_vehicles = [
"C_Hatchback_01_F",
"C_Hatchback_01_sport_F",
"C_Offroad_01_F",
"C_SUV_01_F",
"C_Van_01_transport_F",
"C_Van_01_box_F",
"C_Van_01_fuel_F",
"C_Quadbike_01_F"
];
if (isNil "civilian_vehicles_extension")
then {
	civilian_vehicles_extension = []
};
if (isNil "civilian_vehicles_overwrite")
then {
	civilian_vehicles_overwrite = false
};
if (civilian_vehicles_overwrite)
then {
	civilian_vehicles = civilian_vehicles_extension;
}
else {
	civilian_vehicles = civilian_vehicles + civilian_vehicles_extension;
};

GRLIB_blacklisted_from_arsenal = [
"APERSMineDispenser_Mag",
"B_AA_01_weapon_F",
"B_AT_01_weapon_F",
"B_GMG_01_A_weapon_F",
"B_GMG_01_high_weapon_F",
"B_GMG_01_weapon_F",
"B_HMG_01_A_weapon_F",
"B_HMG_01_high_weapon_F",
"B_HMG_01_support_F",
"B_HMG_01_support_high_F",
"B_HMG_01_weapon_F",
"B_Mortar_01_support_F",
"B_Mortar_01_weapon_F",
"B_Patrol_Respawn_bag_F",
"B_Respawn_Sleeping_bag_blue_F",
"B_Respawn_Sleeping_bag_brown_F",
"B_Respawn_Sleeping_bag_F",
"B_Respawn_TentA_F",
"B_Respawn_TentDome_F",
// "B_UAV_01_backpack_F",
// "B_UAV_06_backpack_F",
// "B_UAV_06_medical_backpack_F",
"C_IDAP_UAV_01_backpack_F",
"C_IDAP_UAV_06_antimine_backpack_F",
"C_IDAP_UAV_06_backpack_F",
"C_IDAP_UAV_06_medical_backpack_F",
"C_UAV_06_backpack_F",
"C_UAV_06_medical_backpack_F",
"C_UavTerminal",
"I_AA_01_weapon_F",
"I_AT_01_weapon_F",
"I_GMG_01_A_weapon_F",
"I_GMG_01_high_weapon_F",
"I_GMG_01_weapon_F",
"I_HMG_01_A_weapon_F",
"I_HMG_01_high_weapon_F",
"I_HMG_01_support_F",
"I_HMG_01_support_high_F",
"I_HMG_01_weapon_F",
"I_Mortar_01_support_F",
"I_Mortar_01_weapon_F",
"I_UAV_01_backpack_F",
"I_UAV_06_backpack_F",
"I_UAV_06_medical_backpack_F",
"I_E_AA_01_weapon_F",
"I_E_AT_01_weapon_F",
"I_E_GMG_01_A_Weapon_F",
"I_E_GMG_01_high_Weapon_F",
"I_E_GMG_01_Weapon_F",
"I_E_HMG_01_A_Weapon_F",
"I_E_HMG_01_high_Weapon_F",
"I_E_HMG_01_support_F",
"I_E_HMG_01_support_high_F",
"I_E_HMG_01_Weapon_F",
"I_E_Mortar_01_support_F",
"I_E_Mortar_01_Weapon_F",
"I_E_UAV_01_backpack_F",
"I_E_UAV_06_backpack_F",
"I_E_UAV_06_medical_backpack_F",
"I_E_UavTerminal",
"I_UavTerminal",
"O_AA_01_weapon_F",
"O_AT_01_weapon_F",
"O_GMG_01_A_weapon_F",
"O_GMG_01_high_weapon_F",
"O_GMG_01_weapon_F",
"O_HMG_01_A_weapon_F",
"O_HMG_01_high_weapon_F",
"O_HMG_01_support_F",
"O_HMG_01_support_high_F",
"O_HMG_01_weapon_F",
"O_Mortar_01_support_F",
"O_Mortar_01_weapon_F",
"O_Static_Designator_02_weapon_F",
"O_UAV_01_backpack_F",
"O_UAV_06_backpack_F",
"O_UAV_06_medical_backpack_F",
"O_UavTerminal",
//"TrainingMine_Mag",
"U_B_Soldier_VR",
"U_C_Soldier_VR",
"U_I_Soldier_VR",
"U_O_Soldier_VR",
"C_IDAP_UGV_02_Demining_backpack_F",
// "B_UGV_02_Demining_backpack_F",
// "B_UGV_02_Science_backpack_F",
"I_UGV_02_Demining_backpack_F",
"I_UGV_02_Science_backpack_F",
"I_E_UGV_02_Demining_backpack_F",
"I_E_UGV_02_Science_backpack_F",
"O_UGV_02_Demining_backpack_F",
"O_UGV_02_Science_backpack_F",
"B_Static_Designator_01_weapon_F",
"B_W_Static_Designator_01_weapon_F",
"UAV_06_backpack_F",
"UAV_06_medical_backpack_F",

"I_HMG_02_high_weapon_F",
"I_G_HMG_02_high_weapon_F",
"I_E_HMG_02_high_weapon_F",
"I_C_HMG_02_high_weapon_F",
"I_HMG_02_weapon_F",
"I_G_HMG_02_weapon_F",
"I_E_HMG_02_weapon_F",
"I_C_HMG_02_weapon_F",
"I_HMG_02_support_F",
"I_G_HMG_02_support_F",
"I_E_HMG_02_support_F",
"I_C_HMG_02_support_F",
"I_HMG_02_support_high_F",
"I_G_HMG_02_support_high_F",
"I_E_HMG_02_support_high_F",
"I_C_HMG_02_support_high_F"

];
if (isNil "blacklisted_from_arsenal_extension")
then {
	blacklisted_from_arsenal_extension = [
	]
};
GRLIB_blacklisted_from_arsenal = [] + GRLIB_blacklisted_from_arsenal;

box_transport_config = [
["B_Truck_01_transport_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4]],
["B_Truck_01_covered_F", -6.5, [0, -0.4, 0.4], [0, -2.1, 0.4], [0, -3.8, 0.4]],
["O_Truck_03_transport_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4]],
["O_Truck_03_covered_F", -6.5, [0, -0.8, 0.4], [0, -2.4, 0.4], [0, -4.0, 0.4]],
["B_Heli_Transport_03_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1]],
["B_Heli_Transport_03_unarmed_F", -7.5, [0, 2.2, -1], [0, 0.8, -1], [0, -1.0, -1]],
["I_Heli_Transport_02_F", -6.5, [0, 4.2, -1.45], [0, 2.5, -1.45], [0, 0.8, -1.45], [0, -0.9, -1.45]]
];
if (isNil "box_transport_config_extension")
then {
	box_transport_config_extension = []
};
box_transport_config = [] + box_transport_config + box_transport_config_extension;

infantry_units = [infantry_units]call F_filterMods;
light_vehicles = [light_vehicles]call F_filterMods;
heavy_vehicles = [heavy_vehicles]call F_filterMods;
air_vehicles = [air_vehicles]call F_filterMods;
support_vehicles = [support_vehicles]call F_filterMods;
static_vehicles = [static_vehicles]call F_filterMods;
buildings = [buildings]call F_filterMods;
build_lists = [[], infantry_units, light_vehicles, heavy_vehicles, air_vehicles, static_vehicles, buildings, support_vehicles, squads];
militia_squad = [militia_squad, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
militia_vehicles = [militia_vehicles, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_vehicles = [opfor_vehicles, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [opfor_vehicles_low_intensity, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [opfor_battlegroup_vehicles, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [opfor_battlegroup_vehicles_low_intensity, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_troup_transports = [opfor_troup_transports, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_choppers = [opfor_choppers, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
opfor_air = [opfor_air, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
civilians = [civilians, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
civilian_vehicles = [civilian_vehicles, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha", "Bravo", "Charlie", "Delta", "Echo", "Foxtrot", "Golf", "Hotel", "India", "Juliet", "Kilo", "Lima", "Mike", "November", "Oscar", "Papa", "Quebec", "Romeo", "Sierra", "Tango", "Uniform", "Victor", "Whiskey", "X-Ray", "Yankee", "Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [opfor_team_leader, opfor_machinegunner, opfor_medic, opfor_rpg, opfor_sentry, opfor_sentry, opfor_sentry, opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader, opfor_team_leader, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_marksman, opfor_grenadier, opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader, opfor_machinegunner, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_marksman, opfor_sharpshooter, opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader, opfor_medic, opfor_machinegunner, opfor_rpg, opfor_rpg, opfor_at, opfor_at, opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader, opfor_medic, opfor_machinegunner, opfor_rpg, opfor_rpg, opfor_aa, opfor_aa, opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity); {
	land_vehicles_classnames pushback(_x select 0);
}
foreach(heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers; {
	air_vehicles_classnames pushback(_x select 0);
}
foreach air_vehicles;
markers_reset = [99999, 99999, 0];
zeropos = [0, 0, 0];
squads_names = [localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD", localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD"];
boats_names = ["B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F"];
ammobox_transports_typenames = []; {
	ammobox_transports_typenames pushback(_x select 0)
}
foreach box_transport_config;
ammobox_transports_typenames = [ammobox_transports_typenames, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
elite_vehicles = [elite_vehicles, {
	[_x]call F_checkClass
}
]call BIS_fnc_conditionalSelect;
original_resistance = ["O_G_Soldier_SL_F", "O_G_Soldier_A_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_F", "O_G_Soldier_LAT_F", "O_G_Soldier_lite_F", "O_G_Sharpshooter_F", "O_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry, opfor_rifleman, opfor_grenadier, opfor_squad_leader, opfor_team_leader, opfor_marksman, opfor_machinegunner, opfor_heavygunner, opfor_medic, opfor_rpg, opfor_at, opfor_aa, opfor_officer, opfor_sharpshooter, opfor_sniper, opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
"Land_Flush_Light_red_F",
"Land_Flush_Light_green_F",
"Land_Flush_Light_yellow_F",
"Land_runway_edgelight",
"Land_runway_edgelight_blue_F",
"Land_HelipadSquare_F",
"Sign_Sphere100cm_F",
"TMR_Autorest_Georef",
"Land_ClutterCutter_large_F",
"Land_TentLamp_01_standing_F",
"Land_TentLamp_01_standing_red_F"
];
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";

GRLIB_support_type_transport = "B_Heli_Light_01_F";