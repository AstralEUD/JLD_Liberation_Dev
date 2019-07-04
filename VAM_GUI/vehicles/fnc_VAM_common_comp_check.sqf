//VAM Common Vehicle Component Check
disableSerialization;
waitUntil {!(VAM_check_fnc_delay)};
private _VAM_display = findDisplay 4900;
private _list_comp = _VAM_display displayCtrl 4920;

private _targetvehicle = vehicle player;
private _getvc = [_targetvehicle] call BIS_fnc_getVehicleCustomization;

private _check_comp = _getvc select 1;
current_comp = [];
{
	if (_x isEqualTo 0 or _x isEqualTo 1) then {
	current_comp pushBack (_check_comp select _forEachIndex);
	};
} forEach _check_comp;

//Reset list selection
{
	_list_comp lbSetSelected [_forEachIndex, false];
} forEach current_comp;

//Check current applied components
{
	if (_x isEqualTo 1) then {
		_list_comp lbSetSelected [_forEachIndex, true];
	};
} forEach current_comp;

VAM_comp_check_complete = true;