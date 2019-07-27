private [ "_dialog", "_backpack", "_backpackcontents" ];

if ( isNil "GRLIB_last_halo_jump" ) then { GRLIB_last_halo_jump = -6000; };

if ( GRLIB_halo_param > 1 && ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) >= time ) exitWith {
	hint format [ localize "STR_HALO_DENIED_COOLDOWN", ceil ( ( ( GRLIB_last_halo_jump + ( GRLIB_halo_param * 60 ) ) - time ) / 60 ) ];
};

_dialog = createDialog "liberation_halo";
dojump = 0;
halo_position = getpos player;

_backpackcontents = [];

[ "halo_map_event", "onMapSingleClick", { halo_position = _pos } ] call BIS_fnc_addStackedEventHandler;

"spawn_marker" setMarkerTextLocal (localize "STR_HALO_PARAM");

waitUntil { dialog };
while { dialog && alive player && dojump == 0 } do {
	"spawn_marker" setMarkerPosLocal halo_position;

	if ( (resources_ammo >= 50) && (player call groupType != -1) ) then {
		if(isNil "GRLIB_secondary_in_progress")then{
			ctrlEnable [ 202, true ];
		} else {
			if(GRLIB_secondary_in_progress >= 0)then{				
				hintSilent "특수임무가 진행중인 경우 공수강하가 제한됩니다.";
				ctrlEnable [ 202, false ];
			}else{
				ctrlEnable [ 202, true ];
			};
		};
	} else {
		hintSilent "자원이 50미만이거나 혹은 분대태그를 사용하지 않은 경우 공수강하가 제한됩니다.";
		ctrlEnable [ 202, false ];
	};

	sleep 0.1;
};

if ( dialog ) then {
	closeDialog 0;
	sleep 0.1;
};

"spawn_marker" setMarkerPosLocal markers_reset;
"spawn_marker" setMarkerTextLocal "";

[ "halo_map_event", "onMapSingleClick" ] call BIS_fnc_removeStackedEventHandler;

if ( dojump > 0 ) then {
	GRLIB_last_halo_jump = time;
	halo_position = [ halo_position, random 250, random 360 ] call BIS_fnc_relPos;
	halo_position = [ halo_position select 0, halo_position select 1, GRLIB_halo_altitude + (random 200) ];
	halojumping = true;
	[[],"jumpcost_remote_call"] call BIS_fnc_MP;
	hint "자원 10을 소모하여 공수강하합니다.!";
	sleep 0.1;
	cutRsc ["fasttravel", "PLAIN", 1];
	playSound "parasound";
	sleep 2;
	_backpack = backpack player;
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		_backpackcontents = backpackItems player;
		removeBackpack player;
		sleep 0.1;
	};
	player addBackpack "B_Parachute";

	player setpos halo_position;

	sleep 4;
	halojumping = false;
	
	waitUntil { (ASLToAGL getPosASL player#2) < 250 };
	player action ["OpenParachute", player];
	
	waitUntil { !alive player || isTouchingGround player };
	if ( _backpack != "" && _backpack != "B_Parachute" ) then {
		sleep 2;
		player addBackpack _backpack;
		clearAllItemsFromBackpack player;
		{ player addItemToBackpack _x } foreach _backpackcontents;
	};
};
