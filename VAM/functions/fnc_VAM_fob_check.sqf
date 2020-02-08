//Vehicle Appearance Manager KP Liberation FOB distance check
VAM_conditioncheck1 = 1;
if (VAM_check_fob_on isEqualTo 1) then {
	while {true} do {
		private _nearfob = [] call F_getNearestFob;
		private _fobdistance = 9999;
		if (count _nearfob isEqualTo 3) then {
			_fobdistance = player distance _nearfob;
		};
		if ((_fobdistance < VAM_fob_radius) && (alive player)) then {
			VAM_conditioncheck1 = 1;
		} else {
			VAM_conditioncheck1 = 0;
		};
	sleep 1;
	};
};