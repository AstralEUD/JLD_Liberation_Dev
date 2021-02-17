//V1.1 By: Ghost
//spawns object in a random location to bring back to base
//if (!isserver) exitwith {};
private ["_position_mark","_obj","_locselname","_rnum","_tsk","_pos","_marker1","_tasktopic","_taskdesc","_trig1stat","_trig1act","_trg1","_trig1cond"];

_position_marker = [2000,999999,false] call F_findOpforSpawnPoint;
_position_mark = getMarkerPos _position_marker;
_obj = "O_supplyCrate_F";//object to place somewhere randomly e.g. "Land_Cargo20_military_green_F"

//create random number and add to task
_rnum = str(round (random 999));

//Unit list to randomly select and spawn - Edit as needed
//#include "unit_list.sqf"
_dist = random 100;
_radius = random 360;
_pos = [(_position_mark select 0) + (_dist * cos _radius), (_position_mark select 1) + (_dist * sin _radius)];
_marker = createMarker ["marker", _position_mark];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [100, 100];
_marker setMarkerColor GRLIB_color_enemy_bright;
_marker setMarkerBrush "FDiagonal";

_spawned = [];
//create Object
_veh = createVehicle [_obj,_pos, [], 0, "NONE"];
_veh_name = (configFile >> "cfgVehicles" >> (_obj) >> "displayName") call bis_fnc_getcfgdata;
//_veh_pic =  (configFile >> "cfgvehicles" >> (_obj) >> "picture") call bis_fnc_getcfgdata;
_vehpos = (getposatl _veh);
_veh setdir (random 360);
_veh setposatl _vehpos;
_spawned pushBack _veh;

_patrolRadius = random 360;
_patrolDist = random 80;
_patrolPos = [((_pos select 0) + (_patrolDist * cos _patrolRadius)), ((_pos select 1) + (_patrolDist * sin _patrolRadius))];
_patrolGroup = createGroup GRLIB_side_enemy;
_patrolUnits = ([] call F_getAdaptiveSquadComp);
{
	_men =  _patrolGroup createUnit [_x, _patrolPos, [], 0, "NONE"];
	_spawned pushBack _men;
} forEach _patrolUnits;

_patrolcorners = [
	[ (_pos select 0) - 50, (_pos select 1) - 50, 0 ],
	[ (_pos select 0) + 50, (_pos select 1) - 50, 0 ],
	[ (_pos select 0) + 50, (_pos select 1) + 50, 0 ],
	[ (_pos select 0) - 50, (_pos select 1) + 50, 0 ]
];

{
	_waypoint = _patrolGroup addWaypoint [_x,0];
	_waypoint setWaypointType "MOVE";
	_waypoint setWaypointSpeed "LIMITED";
	_waypoint setWaypointBehaviour "SAFE";
} foreach _patrolcorners;
_waypoint = _patrolGroup addWaypoint [(_patrolcorners select 0), 0];
_waypoint setWaypointType "CYCLE";

_minesCount = random 10;
for [{_i = 0}, {_i < _minesCount}, {_i = _i + 1}] do {
    _mine = createMine ["APERSBoundingMine", _pos, [], 30];
     GRLIB_side_enemy revealMine _mine;
    _spawned pushBack _mine;
};
_patrolVeh = [] call F_getAdaptiveVehicle;
_vehRadius = random 360;
_vehDist = 30 + random 30;
_patrolVehPos = [((_pos select 0) + (_vehDist * cos _vehRadius)), ((_pos select 1) + (_vehDist * sin _vehRadius))];
[_patrolVehPos, random 360, _patrolVeh, GRLIB_side_enemy] call BIS_fnc_spawnVehicle;

//create task
_locselname = markerText ([1000, _pos] call F_getNearestSector);
_tsk = "tsk_randacquire" + _rnum + str(_position_mark);
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Acquire %1", _veh_name];
_taskdesc = format ["Locate the enemy %1 in %2 and bring it back to base using large helicopter or HEMTT. Drop %1 off at FOB.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"search"] call BIS_fnc_taskCreate;

_fnc_chase = {
	params ["_veh"];
	_mark1 = createMarker ["mark1", getPos _veh];
	_mark1 setMarkerType "hd_pickup";
	if (combat_readiness > 50) then {
		_air_spawnpoint = ( [ sectors_airspawn , [_veh] , { (getMarkerPos _x) distance (getPos _input0) }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
		_air_grp = createGroup GRLIB_side_enemy;
		[_air_spawnpoint, 0, selectRandom opfor_air, _air_grp] call BIS_fnc_spawnVehicle;
		_waypoint = _air_grp addWaypoint [getPos _veh,0];
		_waypoint setWaypointType "MOVE";
		_waypoint waypointAttachObject _veh;
	};
};

/*
_trg1 = createTrigger["EmptyDetector", getPos _veh, true];
_trg1 setTriggerArea[30,30,0,false];
_trg1 setTriggerActivation[GRLIB_side_friendly,"PRESENT",false];
_trg1 setTriggerStatements ["this", "deleteVehicle thisTrigger; [_veh] spawn _fnc_chase;",""];
_trg1 setTriggerTimeout [5, 5, 5, true];
*/

waitUntil {sleep 10; (count (allUnits select {(side _x == GRLIB_side_friendly) && ((_x distance _veh) < 30)}) > 0) || !(alive _veh) || (isNull _veh)};

if (!(alive _veh) || (isNull _veh)) then {
	[_tsk,"FAILED"] call BIS_fnc_taskSetState;
};

if (count (allUnits select {(side _x == GRLIB_side_friendly) && ((_x distance _veh) < 30)}) > 0) then {
	_marker1 = createMarker ["mark1", getPos _veh];
	_marker1 setMarkerType "hd_pickup";
	_marker1 setMarkerText "CSAT Supply Crate";

	_defenderPos1 = _pos findEmptyPosition [750, 800];
	_defenderPos2 =	[_defenderPos1, 20, random 360] call BIS_fnc_relPos;
	_defenderGroup = createGroup GRLIB_side_enemy;
	_spawned pushBack ([_defenderPos1, random 360, selectRandom opfor_battlegroup_vehicles_low_intensity, _defenderGroup] call BIS_fnc_spawnVehicle);
	_spawned pushBack ([_defenderPos2, random 360, selectRandom opfor_battlegroup_vehicles_low_intensity, _defenderGroup] call BIS_fnc_spawnVehicle);

	_wp1 = _defenderGroup addWaypoint [getPos _veh,0];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointSpeed "FULL";
	_wp1 waypointAttachObject _veh;

	if (combat_readiness > 50) then {
		_air_spawnpoint = ( [ sectors_airspawn , [_veh] , { (getMarkerPos _x) distance _input0 }, "ASCEND"] call BIS_fnc_sortBy ) select 0;
		_air = createVehicle [selectRandom opfor_air, getMarkerPos _air_spawnpoint, [], 0, "FLY"];
		_air_grp = createVehicleCrew _air;
		_wp2 = _air_grp addWaypoint [getPos _veh,0];
		_wp2 setWaypointType "MOVE";
		_wp2 waypointAttachObject _veh;
	};
};

waitUntil {sleep 10; (_veh distance ([getPos _veh] call F_getNearestFob) < 100) || !(alive _veh) || (isNull _veh)};
if (!(alive _veh) || (isNull _veh)) then {
	[_tsk,"FAILED"] call BIS_fnc_taskSetState;
};
if (_veh distance ([getPos _veh] call F_getNearestFob) < 100) then {
	stats_secondary_objectives = stats_secondary_objectives + 1;
	resources_ammo = resources_ammo + 800;
	trigger_server_save = true;
	[_tsk,"SUCCEEDED"] call BIS_fnc_taskSetState;
};
deleteVehicle _veh;
deleteMarker _marker;
deleteMarker _marker1;
GRLIB_secondary_in_progress = -1;
publicVariable "GRLIB_secondary_in_progress";

_spawned;