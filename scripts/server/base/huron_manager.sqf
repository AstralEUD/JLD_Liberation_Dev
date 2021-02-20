waitUntil { !isNil "GRLIB_all_fobs" };
waitUntil { !isNil "save_is_loaded" };

firstloop = true;
huron = objNull;
_savedhuron = objNull;

while { true } do {

	{
		if ( typeof _x == huron_typename ) then {
			_savedhuron = _x;
		};
	} foreach vehicles;

	if ( firstloop && !isNull _savedhuron ) then {
		huron = _savedhuron;
	} else {
		//huron setposasl [13389.3,5336.64,29.8325]; - for Tanoa
		//huron setposasl [890.039,16213,24]; - for Altis
		huron = huron_typename createVehicle [0,0,50];
		huron enableSimulationGlobal false;
		huron allowDamage false;
		huron setPosASL [(getPosASL huronspawn) select 0, (getPosASL huronspawn) select 1, (getPosASL huronspawn) select 2];
		clearItemCargoGlobal huron;
		sleep 1;
		huron enableSimulationGlobal true;
		huron allowDamage true;
	};

	firstloop = false;

	huron AnimateDoor ["Door_rear_source", 1, true];
	[huron,["AAF",1],nil,nil] call BIS_fnc_initVehicle;
	publicVariable "huron";
	clearWeaponCargoGlobal huron;
	clearMagazineCargoGlobal huron;
	clearItemCargoGlobal huron;
	clearBackpackCargoGlobal huron;
	huron setDamage 0;
	sleep 0.5;
	huron enableSimulationGlobal true;
	huron setDamage 0;
	sleep 1.5;

	huron setDamage 0;
	huron allowdamage true;

	if ( alive huron ) then {

		waitUntil {
			sleep 1;
			!alive huron;
		};
		stats_spartan_respawns = stats_spartan_respawns + 1;
		
		resources_ammo = resources_ammo - 50;
		[ ["", GRLIB_civ_killing_penalty, "" ] , "remote_call_civ_penalty" ] call BIS_fnc_MP;
		//jld editted
		sleep 30;

	};
	sleep 0.25;

};