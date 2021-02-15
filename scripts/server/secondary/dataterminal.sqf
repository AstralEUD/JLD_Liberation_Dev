//1 By: Ghost - spawns data terminal to interact with
//if (!isserver) exitwith {};
private ["_position_mark","_terminal","_terminalobj","_veh_name","_terminalobj","_tsk","_tasktopic","_taskdesc", "_pos"];

_position_marker = [2000,999999,false] call F_findOpforSpawnPoint;
_position_mark = getMarkerPos _position_marker;

_marker = createMarker ["marker", _position_mark];
_marker setMarkerShape "ELLIPSE";
_marker setMarkerSize [300, 300];
_marker setMarkerColor GRLIB_color_enemy_bright;
_marker setMarkerBrush "FDiagonal";

//create random number
_rnum = str(round (random 999));

//select random terminal
_terminal = "Land_DataTerminal_01_F";

_spawned = [];
//create terminal
_terminalobj = createVehicle [_terminal,[_position_mark select 0, _position_mark select 1, 0], [], 0, "NONE"];
_spawned pushBack _terminalobj;
_veh_name = getText (configFile >> "cfgVehicles" >> (_terminal) >> "displayName");

//create task
_tsk = "tsk_terminal" + _rnum + str(_position_mark);
//Ghst_Current_tasks = Ghst_Current_tasks + [_tsk];
_taskmark = format ["%1", _veh_name];
_tasktopic = format ["Find %1", _veh_name];
_taskdesc = format ["Search the buildings for %1. Once you have found %1 download the data.", _veh_name];

[true,[_tsk],[_taskdesc,_tasktopic,_taskmark],_position_mark,0,2,true,"interact"] call BIS_fnc_taskCreate;
//[_tsk,true,[_taskdesc,_tasktopic,_taskmark],_position_mark,"AUTOASSIGNED",2,true,true,"Search"] call BIS_fnc_setTask;

_terminalobj setVariable ["notdisabled", true, true];
//attaches addaction to object
//[[_terminalobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Disable Terminal Link</t>", "call ghst_fnc_disableterminal", _tsk, 6, true, true, "",""]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
//[_terminalobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Disable Terminal Link</t>", "call ghst_fnc_disableterminal", _tsk, 6, true, true, "","(_target getVariable 'notdisabled')"]] remoteExec ["ghst_fnc_addaction",0,true];
//Animate terminal
[_terminalobj,3] call BIS_fnc_dataTerminalAnimate;

_allBuildings = nearestObjects [_position_mark, ["House"], 300];
_enterable = _allBuildings select {nearestBuilding (getPos _x) == _x};
if (((count _enterable) > 0) && (random 3 > 2)) then {
	_building = selectRandom _enterable;
	_pos = getPos _building;
	_positions = [_building] call BIS_fnc_buildingPositions;
	_terminalobj setPos (selectRandom _positions);
    _eGrp= createGroup GRLIB_side_enemy;
	_spawned pushBack (_eGrp createUnit [opfor_sentry, selectRandom _positions, [], 1, "NONE"]);
	_spawned pushBack (_eGrp createUnit [opfor_sentry, selectRandom _positions, [], 1, "NONE"]);
	_spawned pushBack (_eGrp createUnit [opfor_squad_leader, selectRandom _positions, [], 1, "NONE"]);
    _spawned pushBack (_eGrp createUnit [opfor_engineer, selectRandom _positions, [], 1, "NONE"]);
    {doStop _x} forEach (units _eGrp);
} else {
	_dist = random 300;
	_radius = random 360;
	_pos = [(_position_mark select 0) + (_dist * cos _radius), (_position_mark select 1) + (_dist * sin _radius)];
    _building = "Land_Cargo_House_V1_F" createVehicle _pos;
    _building setDir (random 360);
    _positions = [_building] call BIS_fnc_buildingPositions;
	_terminalobj setPos (selectRandom _positions);

    _patrolRadius = random 360;
    _patrolDist = 30 + random 50;
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

    _minesCount = 5 + (random 10);
    for [{_i = 0}, {_i < _minesCount}, {_i = _i + 1}] do {
        //_minePos = _pos findEmptyPosition [5, 20];
        _mine = createMine ["APERSBoundingMine", _pos, [], 30];
        GRLIB_side_enemy revealMine _mine;
        _spawned pushBack _mine;
    };
};
_isReinforced = false;

[
    _terminalobj,                                                                        
    "<t size='1.5' shadow='2' color='#2EFEF7'>Download Data</t>",                                                                      
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",                   
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",                   
    "(_target getVariable 'notdisabled')",                                                      
    "true",                                                   
    {
        _this select 1 sidechat "Downloading Data";
        if (!((_this select 3) select 1) && ((random 3) >2)) then {
            [(_this select 3) select 2] spawn send_paratroopers;
            _isReinforced = true;
        };
    },                                                                                
    {},                                                                                
    {   
        params [_target, _caller, _actionID];
        [_target, _caller, _actionID, (_this select 3) select 0]call secondary_fnc_disableterminal;
    },                                              
    {_this select 1 sidechat "Wait one moment";},                                                                               
    [_tsk, _isReinforced, _position_marker],                                                                                
    15,                                                                                
    6,                                                                                 
    true,                                                                              
    false                                                                          
] remoteExec ["BIS_fnc_holdActionAdd",0,_terminalobj];

GRLIB_secondary_in_progress = 0;
publicVariable "GRLIB_secondary_in_progress";

//send terminal to random building
//null0 = [_position_mark,_rad,[_terminalobj],[false,"ColorGreen",false],[3,6,EAST],((paramsArray select 3)/10),false] execvm "scripts\objectives\ghst_PutinBuild.sqf";
//ghst_Build_objs = ghst_Build_objs + [_terminalobj,_tsk];
	
while {true} do {
	//if (_tsk call SHK_Taskmaster_isCompleted) exitwith {};
	if (_tsk call BIS_fnc_taskCompleted) exitwith {stats_secondary_objectives = stats_secondary_objectives + 1; trigger_server_save = true; GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress"; deleteMarker _marker; resources_ammo = resources_ammo + 300; resources_intel = resources_intel + 20;};
	if (!(_tsk call BIS_fnc_taskCompleted) and ((isnull _terminalobj) || !(alive _terminalobj))) exitwith {[_tsk,"failed"] call BIS_fnc_taskSetState; GRLIB_secondary_in_progress = -1; publicVariable "GRLIB_secondary_in_progress"; deleteMarker _marker;};
	sleep 5;
};