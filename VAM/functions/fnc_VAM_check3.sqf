//Vehicle Appearance Manager check3
//This checks player situation when player selects option 3 : Reset vehicle
if (VAM_conditioncheck1 isEqualTo 0) exitWith {
	hint format [localize "STR_VAM_FOB_CONDITION_CHECK_FAILED", VAM_fob_radius];
	sleep 3;
	hint "";
};
if (player isEqualTo vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_RESET";
	sleep 3;
	hint "";
};
if !(player isEqualTo driver vehicle player) exitWith {
	hint localize "STR_VAM_NOT_DRIVER_RESET";
	sleep 3;
	hint "";
};
if (player isEqualTo driver vehicle player) exitWith {
	[vehicle player, true, [true]] call bis_fnc_initVehicle;
	hint localize "STR_VAM_COMPLETE_RESET";
	sleep 2;
	hint "";
};