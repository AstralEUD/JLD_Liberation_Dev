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

player GlobalChat format ["%1님의 요청으로 작전지 내 불탄 차량, 기타 쓰레기가 제거되었습니다.", name player];
diag_log format ["%1 requested Garbage Cleaner", player];

sleep 600;
ASTGarbageCooldown = 1;
hint "아직 쓰레기 청소기 쿨타임이 지나지 않았습니다. 시간 후에 시도해 주세요.";




