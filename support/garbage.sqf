//Function From Antistasi 2.3.2

if (ASTGarbageCooldown == 1) then {
ASTGarbageCooldown = 0;
private _fnc_distCheck = {
	params["_object", "_dist"];
	private _inRange = { if (_x distance _object <= _dist) exitWith {1}; false } count _rebelSpawners;
	if (_inRange == 0) then { deleteVehicle _object };
};


{ deleteVehicle _x } forEach allDead;
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolder");
{ deleteVehicle _x } forEach (allMissionObjects "WeaponHolderSimulated");
{ deleteVehicle _x } forEach (allMissionObjects "Box_IND_Wps_F");				// Surrender boxes
{ deleteVehicle _x } forEach (allMissionObjects "Leaflet_05_F");				// Drone drop leaflets
{ deleteVehicle _x } forEach (allMissionObjects "Ejection_Seat_Base_F");		// All vanilla ejection seats

hint format ["쓰레기 제거 완료."];
diag_log format ["%1 requested Garbage Cleaner", player];

sleep 600;
ASTGarbageCooldown = 1;
} else {
hint "Garbage Cleaner Cooldown is not ended yet";
};




