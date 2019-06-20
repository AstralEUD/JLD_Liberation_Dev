//O_Angara Components
//[["Hex",1],["showCamonetHull",0,"showCamonetTurret",0]]
selectcomp = 0;
_subname = localize "STR_VAM_SUB_COMPONENT";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subnone = localize "STR_VAM_NONE_COMP";
_subevery = localize "STR_VAM_EVERYTHING_COMP";
_subsel1 = localize "STR_VAM_CAMONET_HULL_COMP";
_subsel2 = localize "STR_VAM_CAMONET_TURRET_COMP";
_VAM_Comp =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcomp = -1;"]], "1", "1"],
	[_subnone, [3], "", -5, [["expression", "selectcomp = 1;"]], "1", "1"],
	[_subsel1, [4], "", -5, [["expression", "selectcomp = 2;"]], "1", "1"],
	[_subsel2, [5], "", -5, [["expression", "selectcomp = 3;"]], "1", "1"],
	[_subevery, [6], "", -5, [["expression", "selectcomp = 4;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcomp = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_comp";

waitUntil {sleep 0.1; selectcomp != 0};

if (selectcomp isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;
private _getvc = [_targetvehicle] call BIS_fnc_getVehicleCustomization;
private _check = _getvc select 1;
private _op1 = _check select 1;
private _op2 = _check select 3;

if (selectcomp > 0) then {hint localize "STR_VAM_SUB_COMPONENT_APPLIED";};

if (selectcomp isEqualTo 1) exitWith {[_targetvehicle,nil,[true],nil] call BIS_fnc_initVehicle; [] spawn fnc_Angara_comp; sleep 2; hint "";};

if (selectcomp isEqualTo 4) exitWith {
	[_targetvehicle,nil,["showCamonetHull",1,"showCamonetTurret",1],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Angara_comp; sleep 2; hint "";
};

if (selectcomp isEqualTo 2) then {
	if (_check select 1 isEqualTo 0) then {_op1 = 1;};
	if (_check select 1 isEqualTo 1) then {_op1 = 0;};
};

if (selectcomp isEqualTo 3) then {
	if (_check select 3 isEqualTo 0) then {_op2 = 1;};
	if (_check select 3 isEqualTo 1) then {_op2 = 0;};
};

if (true) then {
	[_targetvehicle,nil,["showCamonetHull",_op1,"showCamonetTurret",_op2],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Angara_comp; sleep 2; hint "";
};