GRLIB_save_key = "GREUH_LIBERATION_SAVEGAME";	// change this value if you want different savegames on different map

GRLIB_side_friendly = WEST;
GRLIB_side_enemy = EAST;
GRLIB_side_resistance = RESISTANCE;
GRLIB_side_civilian = CIVILIAN;
GRLIB_respawn_marker = "respawn_west";
GRLIB_color_friendly = "ColorBLUFOR";
GRLIB_color_enemy = "ColorOPFOR";
GRLIB_color_enemy_bright = "ColorRED";

GRLIB_sector_size = 1000;
GRLIB_capture_size = 180;
GRLIB_radiotower_size = 2000;
GRLIB_recycling_percentage = 0.9;
GRLIB_endgame = 0;
GRLIB_vulnerability_timer = 600;	//900
GRLIB_defended_buildingpos_part = 0.75;
GRLIB_sector_military_value = 3;
GRLIB_secondary_objective_impact = 0.6;
GRLIB_blufor_cap = 100								* GRLIB_unitcap;
GRLIB_sector_cap = 250								* GRLIB_unitcap;
GRLIB_battlegroup_cap = 150							* GRLIB_unitcap;
GRLIB_patrol_cap = 150								* GRLIB_unitcap;
GRLIB_battlegroup_size = 5							* (sqrt GRLIB_unitcap) * (sqrt GRLIB_csat_aggressivity);
GRLIB_civilians_amount = 10 						* GRLIB_civilian_activity;
GRLIB_fob_range = 125;
GRLIB_cleanup_delay = 100;
GRLIB_surrender_chance = 20;
GRLIB_secondary_missions_costs = [ 20, 10, 5, 0, 0, 0 ];
GRLIB_halo_altitude = 1000;
GRLIB_civ_killing_penalty = 20;

if ( GRLIB_blufor_cap > 100 ) then { GRLIB_blufor_cap = 100 }; // Don't forget that the human commander manages those, not the server

GRLIB_offload_diag = false;