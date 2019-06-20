//Vehicle Appearance Manager check2
//This checks player situation when player selects option 2 : Change component
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
if (VAM_conditioncheck1 isEqualTo 0) exitWith {
	hint format [localize "STR_VAM_FOB_CONDITION_CHECK_FAILED", VAM_fob_radius];
	sleep 3;
	hint "";
};
if (player isEqualTo vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_COMPONENT";
	sleep 3;
	hint "";
};
if !(player isEqualTo driver vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_COMPONENT";
	sleep 3;
	hint "";
};
if (player isEqualTo driver vehicle player) then {
	private _vehicleclass = typeof vehicle player;
	//NATO
	if (_vehicleclass in ["B_APC_Wheeled_01_cannon_F","B_T_APC_Wheeled_01_cannon_F"]) exitwith {[] spawn fnc_Marshall_comp;};
	if (_vehicleclass in ["B_MBT_01_cannon_F","B_T_MBT_01_cannon_F","B_MBT_01_TUSK_F","B_T_MBT_01_TUSK_F"]) exitwith {[] spawn fnc_Slammer_comp;};
	if (_vehicleclass in ["B_APC_Tracked_01_CRV_F","B_T_APC_Tracked_01_CRV_F"]) exitwith {[] spawn fnc_Bobcat_comp;};
	if (_vehicleclass in ["B_APC_Tracked_01_AA_F","B_T_APC_Tracked_01_AA_F"]) exitwith {[] spawn fnc_Cheetah_comp;};
	if (_vehicleclass in ["B_AFV_Wheeled_01_cannon_F","B_T_AFV_Wheeled_01_cannon_F","B_AFV_Wheeled_01_up_cannon_F","B_T_AFV_Wheeled_01_up_cannon_F"]) exitwith {[] spawn fnc_Rhino_comp;};
	if (_vehicleclass in _Prowler) exitwith {[] spawn fnc_Prowler_comp;};
	if (_vehicleclass in ["B_APC_Tracked_01_rcws_F","B_T_APC_Tracked_01_rcws_F"]) exitwith {[] spawn fnc_Panther_comp;};
	if (_vehicleclass in ["B_MBT_01_arty_F","B_T_MBT_01_arty_F"]) exitwith {[] spawn fnc_Scorcher_comp;};
	if (_vehicleclass in ["B_MBT_01_mlrs_F","B_T_MBT_01_mlrs_F"]) exitwith {[] spawn fnc_Sandstorm_comp;};
	//AAF (Erase if you don't want to allow to custom these vehicles.)
	if (_vehicleclass in ["I_APC_Wheeled_03_cannon_F","B_APC_Wheeled_03_cannon_F"]) exitwith {[] spawn fnc_Gorgon_comp;};
	if (_vehicleclass in ["I_MBT_03_cannon_F"]) exitwith {[] spawn fnc_Kuma_comp;};
	if (_vehicleclass in ["I_LT_01_AT_F","I_LT_01_scout_F","I_LT_01_AA_F","I_LT_01_cannon_F"]) exitwith {[] spawn fnc_Nyx_comp;};
	if (_vehicleclass in ["I_APC_tracked_03_cannon_F"]) exitwith {[] spawn fnc_Mora_comp;};
	//CSAT (Erase if you don't want to allow to custom these vehicles.)
	if (_vehicleclass in ["O_MBT_04_cannon_F","O_T_MBT_04_cannon_F","O_MBT_04_command_F","O_T_MBT_04_command_F"]) exitwith {[] spawn fnc_Angara_comp;};
	if (_vehicleclass in ["O_APC_Tracked_02_cannon_F","O_T_APC_Tracked_02_cannon_ghex_F"]) exitwith {[] spawn fnc_Kamysh_comp;};
	if (_vehicleclass in ["O_APC_Wheeled_02_rcws_v2_F","O_T_APC_Wheeled_02_rcws_v2_ghex_F"]) exitwith {[] spawn fnc_Marid_comp;};
	if (_vehicleclass in ["O_APC_Wheeled_02_rcws_F","O_T_APC_Wheeled_02_rcws_ghex_F"]) exitwith {[] spawn fnc_Marid_v1_comp;};
	if (_vehicleclass in _Quilin) exitwith {[] spawn fnc_Quilin_comp;};
	if (_vehicleclass in ["O_MBT_02_arty_F","O_T_MBT_02_arty_ghex_F"]) exitwith {[] spawn fnc_Sochor_comp;};
	if (_vehicleclass in ["O_APC_Tracked_02_AA_F","O_T_APC_Tracked_02_AA_ghex_F"]) exitwith {[] spawn fnc_Tigris_comp;};
	if (_vehicleclass in ["O_MBT_02_cannon_F","O_T_MBT_02_cannon_ghex_F"]) exitwith {[] spawn fnc_Varsuk_comp;};
	//If there is no vehicle on list, then excute next.
	hint localize "STR_VAM_NOT_SUPPPORT_OR_NO_OPTION_COMPONENT";
	sleep 3;
	hint "";
};