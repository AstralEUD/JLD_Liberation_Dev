//Transport helicopter support for GREUH Liberation. Author: lululala
params ["_air", "_dest"];
_group = group (driver _air);

_lzpad = "Land_HelipadEmpty_F" createVehicle _dest;
_lzpad_mark = createMarker ["lzpad", _dest];
_lzpad_mark setMarkerType "mil_pickup";
_lzpad_mark setMarkerText "수송 헬기 목적지";

_wp = _group addWaypoint [_dest, 0];
_wp setWaypointType "MOVE";
_wp setWaypointCompletionRadius 200;
_group setCurrentWaypoint _wp;
_air flyInHeight 600;

waitUntil {sleep 5; ((_air distance2D _dest) < 200) || !(alive _air) || !(alive (driver _air))};

if (!(alive _air) || !(alive (driver _air))) exitWith {
	deletevehicle _lzpad;
	deletemarker _lzpad_mark;
};
_air land "LAND";
_air flyInHeight 0;
waitUntil {sleep 5; (((getPosATL _air) select 2) < 2) || !(alive _air) || !(alive (driver _air))};
if (((getPosATL _air) select 2) < 2) then {
	_air action ["WheelsBrakeOn", 1];
	sleep 30;
	_wp1 = _group addWaypoint [getMarkerPos (selectRandom sectors_airspawn), 200];
	_wp1 setWaypointCompletionRadius 200;
	_wp1 setWaypointType "MOVE";
	//_wp1 setWaypointStatements ["true", "{deleteVehicleCrew _x} forEach (crew _air); deleteVehicle _air"];
	_air flyInHeight 800;
	[_air] spawn LULULALA_fnc_clean;
};
deletevehicle _lzpad;
deletemarker _lzpad_mark;