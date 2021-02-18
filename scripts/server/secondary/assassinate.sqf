//V1.4.1 By: Ghost - spawns Commander to be killed
//if (!isserver) exitwith {};
private ["_pos", "_side","_locselname","_rnum","_eGrp","_leader","_veh_name","_tsk","_tasktopic","_taskdesc","_trig1stat","_trig1act","_trg1" ,"_building", "_pos"];

_position_marker = [2000,999999,false] call F_findOpforSpawnPoint;//position to search buildings around
_position_mark = getMarkerPos _position_marker;
_side = GRLIB_side_enemy;//side of enemy

_marker = createMarker ["marker", _position_mark];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [200, 200];
_marker setMarkerColor GRLIB_color_enemy_bright;
_marker setMarkerBrush "FDiagonal";
//create random number
_rnum = str(round (random 999));

//create Commander
_spawned = [];
_eGrp = createGroup _side;
_leader = _eGrp createUnit [opfor_officer, _position_mark, [], 0, "NONE"];
_spawned pushBack _leader;
_leader setunitpos "UP";
_leader allowFleeing 0;
_veh_name = name _leader;

_allBuildings = nearestObjects [_position_mark, ["House"], 200];
_enterable = _allBuildings select {nearestBuilding (getPos _x) == _x};
if ((count _enterable) > 0) then {
	_building = selectRandom _enterable;
	_pos = getPos _building;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_leader setPos (selectRandom _positions);
	_spawned pushBack (_eGrp createUnit [opfor_sentry, selectRandom _positions, [], 1, "NONE"]);
	_spawned pushBack (_eGrp createUnit [opfor_sentry, selectRandom _positions, [], 1, "NONE"]);
	_spawned pushBack (_eGrp createUnit [opfor_team_leader, selectRandom _positions, [], 1, "NONE"]);
	{doStop _x} forEach (units _eGrp);
} else {
	_dist = random 200;
	_radius = random 360;
	_pos = [(_position_mark select 0) + (_dist * cos _radius), (_position_mark select 1) + (_dist * sin _radius)];
	_leader setPos _pos;
};

_patrolRadius = random 360;
_patrolDist = random 80;
_patrolPos = [((_pos select 0) + (_patrolDist * cos _patrolRadius)), ((_pos select 1) + (_patrolDist * sin _patrolRadius))];
_patrolGroup = createGroup _side;
_patrolUnits = ([] call F_getAdaptiveSquadComp);
{
	_men =  _patrolGroup createUnit [_x, _patrolPos, [], 4, "NONE"];
	_spawned pushBack _men;
} forEach _patrolUnits;

if (random 2 > 0) then {
	_carPos = [_patrolPos, 10, 100, 20] call BIS_fnc_findSafePos;
	_spawned pushBack (([_carPos, random 360, (selectRandom opfor_vehicles_low_intensity), _patrolGroup] call BIS_fnc_spawnVehicle) select 0);
};

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
/*
	//Add custom gear
	if (isnil (primaryWeapon _leader)) then {
		removeallweapons _leader;
		_leader addMagazine "150Rnd_762x51_Box_Tracer";
		_leader addMagazine "150Rnd_762x51_Box_Tracer";
		_leader addMagazine "150Rnd_762x51_Box_Tracer";
		_leader addMagazine "150Rnd_762x51_Box_Tracer";
		_leader addWeapon "LMG_Zafir_F";
		_leader selectWeapon "LMG_Zafir_F";
	};

_fnc_foundIntel = {
	params ["_caller"];
	if (random 3 < 3) then {
		[_caller, "인텔을 발견했습니다."] remoteExec ["sideChat", 0, false];
		resources_intel = resources_intel + 20; 
	} else {
		[_caller, "인텔을 발견하지 못했습니다."] remoteExec ["sideChat", 0, false];
	};
		
};
*/

[
	_leader,
	"인텔 찾아보기",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_search_ca.paa",
	"_this distance _target < 3",
	"_caller distance _target < 3",
	{},
	{},
	{
		params ["_target", "_caller", "_actionId"];
		[_target, _actionId] remoteExec ["BIS_fnc_holdActionRemove", 0];
		if (random 3 < 3) then {
			[_caller, "인텔을 발견했습니다."] remoteExec ["sideChat", 0, false];
			resources_intel = resources_intel + 20;
			publicVariableServer "resources_intel";
		} else {
			[_caller, "인텔을 발견하지 못했습니다."] remoteExec ["sideChat", 0, false];
		};
	},
	{},
	[],
	4,
	0,
	true,
	false
] remoteExec ["BIS_fnc_holdActionAdd", 0, false];

if (count ((sectors_bigtown + sectors_capture) select {(getMarkerPos _x) distance _pos < 1000}) > 0) then {
	_civCount = 2 + random 10;
	for [{_i = 0}, {_i < _civCount}, {_i = _i + 1}] do {
		_civPos = [_pos, random 200, random 360] call BIS_fnc_relPos;
		_civGroup = createGroup civilian;
		_man = _civGroup createUnit [selectRandom civilians, _civPos, [], 5, "NONE"];
		_man addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
		_spawned pushBack _man;
	};
};
//create task
_tsk = "tsk_Commander" + _rnum + str round(_position_mark select 0);
//Ghst_Current_tasks = Ghst_Current_tasks + [_tsk];
//Ghst_Current_tasks pushback _tsk;
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Kill %1", _veh_name];
_locselname = markerText ([1000, _pos] call F_getNearestSector);
_taskdesc = format ["Enemy Commander %1 is in %2 and he must be eliminated.", _veh_name,_locselname];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"kill"] call BIS_fnc_taskCreate;

GRLIB_secondary_in_progress = 0;
publicVariable "GRLIB_secondary_in_progress";

//send unit to random building
//null0 = [_pos,_radarray,[_leader],[false,"ColorGreen",false],[3,6,EAST],((paramsArray select 3)/10),false] execvm "scripts\objectives\ghst_PutinBuild.sqf";
//ghst_Build_objs = ghst_Build_objs + [_leader,_tsk];
//ghst_Build_objs pushback [_leader,_tsk];

//create trigger for man dying

waitUntil {
	sleep 5;
	(!(alive _leader) || isNull _leader)
};
if (isNull _leader) then {
	[_tsk,"FAILED"] call BIS_fnc_taskSetState;
} else {
	[_tsk,"succeeded"] call BIS_fnc_taskSetState;
	stats_secondary_objectives = stats_secondary_objectives + 1;
	trigger_server_save = true;
	resources_ammo = resources_ammo + 300;
};

deleteMarker _marker;
GRLIB_secondary_in_progress = -1;
publicVariable "GRLIB_secondary_in_progress";

_spawned;