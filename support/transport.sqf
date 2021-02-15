//Transport helicopter support for GREUH Liberation. Author: lululala

params ["_caller", "_cursorPos"];

if (Time < GRLIB_support_transport_timer) exitWith {[str (GRLIB_support_transport_timer - Time) + " 초 후에 요청할 수 있습니다."] remoteExec ["hint", _caller];};
_supportHelis = vehicles select {(_x isKindOf "Helicopters") && ((getNumber (configFile >> "CfgVehicles" >> (typeOf _x) >> "transportSoldier")) > 1)};
_supportPlayers = allPlayers select {(_x getUnitTrait "pilot") && ((vehicle _x) in _supportHelis)};
if ((count _supportPlayers) > 0) exitWith {["수송 분대에 수송을 요청하세요"] remoteExec ["hint", _caller];};

GRLIB_support_transport_timer = Time + 300;
resources_ammo = resources_ammo - 4;
_transportgrp = createGroup GRLIB_side_friendly;

_spawnPoint = ( [ sectors_airspawn , [_cursorPos] , { (getMarkerPos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
_dir = (getMarkerPos _spawnPoint) getdir _cursorPos;

//transport helicopter
_air_array = [getMarkerPos _spawnPoint, _dir, selectRandom GRLIB_support_type_transport, _transportgrp] call BIS_fnc_spawnVehicle;
_air = _air_array select 0;
_air_crew = _air_array select 1;
_air setpos [getpos _air select 0, getpos _air select 1, 800];
//_air setVelocity [55 * (sin _dir), 55 * (cos _dir), 0];
_air lockDriver true;
{_air lockTurret [_x, true];} foreach allTurrets _air;

_wp = _transportgrp addWaypoint [_cursorPos, 0];
_wp setWaypointType "LAND";
_wp setWaypointCompletionRadius 200;
_transportgrp setCurrentWaypoint _wp;
_air flyInHeight 600;

[_air , (name _caller) + ", transport inbound to your location"] remoteExec ["sideChat", _caller];
[gamelogic , (name _caller) + " 님이" + (str _cursorPos) + " 에 수송 헬기를 요청했습니다."] remoteExec ["globalChat"];

_lzpad = "Land_HelipadEmpty_F" createVehicle _cursorPos;
_lzpad_mark = createMarker ["lzpad", _cursorPos];
_lzpad_mark setMarkerType "mil_pickup";
_lzpad_mark setMarkerText "수송 헬기 요청";

waitUntil {sleep 5; ((_air distance2D _cursorPos) < 200) || !(alive _air) || !(alive (driver _air))};

if (!(alive _air) || !(alive (driver _air))) exitWith {
	_msg = format ["We lost %1 transport helicopter.", (name _caller)];
	[[WEST,"AirBase"], _msg] remoteExec ["sideChat"];
	deletevehicle _lzpad;
	deletemarker _lzpad_mark;
};
_air land "LAND";
_air flyInHeight 0;
waitUntil {sleep 5; (((getPosATL _air) select 2) < 2) || !(alive _air) || !(alive (driver _air))};
_fnc_mapPos = {
	params ["_action", "_air"];
	
	openMap true;
	hint "Left click on the map where you want to go";
	
	mapclick = false;
	onMapSingleClick "clickPos = _pos; mapclick = true; onMapSingleClick """";true;";

	waituntil {mapclick or !(visiblemap)};

	if !(visibleMap) exitwith {
		hint "New destination request cancelled";
	};
	[_air, _action] remoteExec ["removeAction"];
	_air sideChat "목적지가 설정되었습니다.";
	sleep 1;
	openMap false;
	[_air, clickPos] remoteExec ["GRLIB_support_transport_dest", 2];
};
if (((getPosATL _air) select 2) < 2) then {
	_air action ["WheelsBrakeOn", 1];
	[_air , "수송 헬기가 도착했습니다. 모두 탑승한 후 목적지를 설정하세요."] remoteExec ["sideChat", _caller];
	[_air,["<t size='1.5' shadow='2' color='#00FF00'>도착지 설정</t>", "[_this select 2, _this select 3 select 0] call (_this select 3 select 1)", [_air, _fnc_mapPos], 5, false, false, "","alive _target"]] remoteExec ["addAction"];
};

deletevehicle _lzpad;
deletemarker _lzpad_mark;

if (!(alive _air) || !(alive (driver _air))) then {
	[[WEST,"AirBase"], "We lost the transport helicopter."] remoteExec ["sideChat"];
};

sleep 300;
if (((crew _air) isEqualTo _air_crew) && (count (waypoints _transportgrp) == 0)) then {
	{_air deleteVehicleCrew _x} forEach (crew _air);
	deleteVehicle _air;
};