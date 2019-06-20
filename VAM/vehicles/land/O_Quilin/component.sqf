//O_Quilin Components
//[["Arid",1],["Unarmed_Doors_Hide",0]]
selectcomp = 0;
_subname = localize "STR_VAM_SUB_COMPONENT";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subsel1 = localize "STR_VAM_DOOR_COMP";
_VAM_Comp =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcomp = -1;"]], "1", "1"],
	[_subsel1, [3], "", -5, [["expression", "selectcomp = 1;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcomp = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_comp";

waitUntil {sleep 0.1; selectcomp != 0};

if (selectcomp isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;
private _getvc = [_targetvehicle] call BIS_fnc_getVehicleCustomization;
private _check = _getvc select 1;

if (selectcomp > 0) then {hint localize "STR_VAM_SUB_COMPONENT_APPLIED";};

if (selectcomp isEqualTo 1) exitWith {
	if (_check select 1 isEqualTo 0) then {[_targetvehicle,nil,["Unarmed_Doors_Hide",1],nil] call BIS_fnc_initVehicle; [] spawn fnc_Quilin_comp; sleep 2; hint "";};
	if (_check select 1 isEqualTo 1) then {[_targetvehicle,nil,["Unarmed_Doors_Hide",0],nil] call BIS_fnc_initVehicle; [] spawn fnc_Quilin_comp; sleep 2; hint "";};
};