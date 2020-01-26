[] execVM "jld\Auto_running.sqf";
[] execVM "VAM_GUI\VAM_GUI_init.sqf";//VAM	
[] execVM "jld\tankboy.sqf";

call SAKY_MANUAL_HALO;	

if ( isNil "GRLIB_respawn_loadout" ) then {
	removeAllWeapons player;
	player linkItem "NVGoggles";
} else {
	sleep 4;
	[ player, GRLIB_respawn_loadout ] call F_setLoadout;
};
