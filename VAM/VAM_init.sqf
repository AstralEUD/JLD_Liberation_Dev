//Vehicle Appearance Manager init
//Options
VAM_check_fob_on = 1; //Set to 1 if you want Liberation FOB check feature.
VAM_fob_radius = 150; //FOB radius

//Function preload
fnc_VAM_cancel = compileFinal preprocessFileLineNumbers "VAM\functions\fnc_VAM_cancel.sqf";
fnc_VAM_check1 = compileFinal preprocessFileLineNumbers "VAM\functions\fnc_VAM_check1.sqf";
fnc_VAM_check2 = compileFinal preprocessFileLineNumbers "VAM\functions\fnc_VAM_check2.sqf";
fnc_VAM_check3 = compileFinal preprocessFileLineNumbers "VAM\functions\fnc_VAM_check3.sqf";
fnc_VAM_fob_check = compileFinal preprocessFileLineNumbers "VAM\functions\fnc_VAM_fob_check.sqf";

//Camouflage files preload
//NATO Land
fnc_Prowler_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Prowler\camouflage.sqf";
fnc_Rhino_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Rhino\camouflage.sqf";
fnc_NATO_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\NATO_camouflage\camouflage.sqf";
//NATO Air
fnc_Black_Wasp_II_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_Black_Wasp_II\camouflage.sqf";
fnc_Blackfish_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_Blackfish\camouflage.sqf";
fnc_Blackfoot_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_Blackfoot\camouflage.sqf";
fnc_Ghost_Hawk_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_Ghost_Hawk\camouflage.sqf";
fnc_HummingbirdPawnee_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_HummingbirdPawnee\camouflage.sqf";
fnc_Huron_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\B_Huron\camouflage.sqf";
//AAF (Erase if you don't want to allow to custom these vehicles. Also check VAMcheck1.sqf if you erase.)
fnc_AAF_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\AAF_camouflage\camouflage.sqf";
fnc_Gorgon_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Gorgon\camouflage.sqf";
fnc_Nyx_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Nyx\camouflage.sqf";
fnc_Strider_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Strider\camouflage.sqf";
fnc_Mohawk_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\I_Mohawk\camouflage.sqf";
fnc_Hellcat_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\I_Hellcat\camouflage.sqf";
fnc_Gryphon_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\I_Gryphon\camouflage.sqf";
fnc_Buzzard_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\I_Buzzard\camouflage.sqf";
//CSAT (Erase if you don't want to allow to custom these vehicles. Also check VAMcheck1.sqf if you erase.)
fnc_CSAT_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\CSAT_camouflage\camouflage.sqf";
fnc_Angara_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Angara\camouflage.sqf";
fnc_Marid_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Marid\camouflage.sqf";
fnc_Quilin_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Quilin\camouflage.sqf";
fnc_Kajman_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\O_Kajman\camouflage.sqf";
fnc_Orca_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\O_Orca\camouflage.sqf";
fnc_Shikra_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\O_Shikra\camouflage.sqf";
fnc_Taru_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\O_Taru\camouflage.sqf";
fnc_Xian_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\air\O_Xi'an\camouflage.sqf";
//Zamack Trucks (Military Only) (Erase if you don't want to allow to custom these vehicles. Also check VAMcheck1.sqf if you erase.)
fnc_Zamak_mil_camo = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\Zamak_mil_camouflage\camouflage.sqf";

//Component files preload
//NATO
fnc_Bobcat_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Bobcat\component.sqf";
fnc_Cheetah_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Cheetah\component.sqf";
fnc_Marshall_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Marshall\component.sqf";
fnc_Panther_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Panther\component.sqf";
fnc_Prowler_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Prowler\component.sqf";
fnc_Rhino_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Rhino\component.sqf";
fnc_Sandstorm_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Sandstorm\component.sqf";
fnc_Scorcher_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Scorcher\component.sqf";
fnc_Slammer_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\B_Slammer\component.sqf";
//AAF (Erase if you don't want to allow to custom these vehicles. Also check VAMcheck2.sqf if you erase.)
fnc_Gorgon_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Gorgon\component.sqf";
fnc_Kuma_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Kuma\component.sqf";
fnc_Mora_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Mora\component.sqf";
fnc_Nyx_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\I_Nyx\component.sqf";
//CSAT (Erase if you don't want to allow to custom these vehicles. Also check VAMcheck2.sqf if you erase.)
fnc_Angara_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Angara\component.sqf";
fnc_Kamysh_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Kamysh\component.sqf";
fnc_Marid_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Marid\component.sqf";
fnc_Marid_v1_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Marid\component_v1.sqf";
fnc_Quilin_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Quilin\component.sqf";
fnc_Sochor_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Sochor\component.sqf";
fnc_Tigris_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Tigris\component.sqf";
fnc_Varsuk_comp = compileFinal preprocessFileLineNumbers "VAM\vehicles\land\O_Varsuk\component.sqf";

//Submenu
_subname = localize "STR_VAM_SUB_OPTIONS";
_subsel1 = localize "STR_VAM_SUB_CHANGE_CAMOUFLAGE";
_subsel2 = localize "STR_VAM_SUB_CHANGE_COMPONENT";
_subsel3 = localize "STR_VAM_SUB_RESET_VEHICLE";
_subclose = localize "STR_VAM_CLOSE_MENU";
VAMsub =
[
	[_subname,false],
	[_subsel1, [2], "", -5, [["expression", "[] spawn fnc_VAM_check1;"]], "1", "1"],
	[_subsel2, [3], "", -5, [["expression", "[] spawn fnc_VAM_check2;"]], "1", "1"],
	[_subsel3, [4], "", -5, [["expression", "[] spawn fnc_VAM_check3;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "showCommandingMenu '';"]], "1", "1"]
];
[] spawn fnc_VAM_cancel;
[] spawn fnc_VAM_fob_check;
[player,"VAM_main_menu",nil,nil,""] call BIS_fnc_addCommMenuItem;
systemchat localize "STR_VAM_INITIALIZED";