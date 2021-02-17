params ["_object", "_time", "_dist"];

_timer = 0;
while {true} do {
	sleep 60;
	if (isNull _object) exitWith {};
	if (count (allPlayers select {_object distance _x > _dist}) == 0) then {
		_timer = _timer + 1;
		if (_timer > _time) exitWith {
			{_object deleteVehicleCrew _x} forEach crew _object;
			deleteVehicle _object;
		};
	} else {
		_timer = _timer - 1;
	};
};