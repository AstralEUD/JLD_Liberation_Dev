//Vehicle Appearance Manager KP Liberation FOB distance check
while {true} do {
	private _nearfob = [] call F_getNearestFob;
	private _fobdistance = 9999;
	if (count _nearfob isEqualTo 3) then {
		_fobdistance = player distance _nearfob;
	};
	if ((_fobdistance < VAM_fob_radius) && (alive player)) then {
		VAM_conditioncheck1 = true;
	} else {
		VAM_conditioncheck1 = false;
	};
	uisleep 0.5;
};