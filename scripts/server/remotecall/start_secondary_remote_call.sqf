if ( !isServer ) exitWith {};
if ( isNil "GRLIB_secondary_starting" ) then { GRLIB_secondary_starting = false; };
if ( GRLIB_secondary_starting ) exitWith { diag_log "Multiple calls to start secondary mission : shouldn't be possible, isn't allowed"; };
if ( isNil "used_positions" ) then { used_positions = []; };

GRLIB_secondary_starting = true; publicVariable "GRLIB_secondary_starting";
params [ "_mission_index" ];

resources_intel = resources_intel - ( GRLIB_secondary_missions_costs select _mission_index );

_spawned = [];
switch (_mission_index) do {
	case 0: {[] call secondary_fob_hunting;};
	case 1: {[] call secondary_convoy_hijack;};
	case 2: {[] call secondary_search_and_rescue;};
	case 3: {_spawned = [] call secondary_assasinate;};
	case 4: {_spawned = [] call secondary_dataterminal;};
	case 5: {_spawned = [] call secondary_randomacquire;};
};

GRLIB_secondary_starting = false; publicVariable "GRLIB_secondary_starting";

{
	[_x, 5, 500] spawn LULULALA_fnc_clean;
} forEach _spawned;