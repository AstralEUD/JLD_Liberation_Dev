//B_Bobcat Components
//[["Sand",1],["showAmmobox",0,"showWheels",0,"showCamonetHull",0,"showBags",0]]
selectcomp = 0;
_subname = localize "STR_VAM_SUB_COMPONENT";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subnone = localize "STR_VAM_NONE_COMP";
_subevery = localize "STR_VAM_EVERYTHING_COMP";
_subsel1 = localize "STR_VAM_CAMONET_HULL_COMP";
_subsel2 = localize "STR_VAM_EXTERNAL_BAG_1_COMP";
_subsel3 = localize "STR_VAM_AMMO_BOXES_COMP";
_subsel4 = localize "STR_VAM_EXTRA_WHEELS_COMP";
_VAM_comp =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcomp = -1;"]], "1", "1"],
	[_subnone, [3], "", -5, [["expression", "selectcomp = 1;"]], "1", "1"],
	[_subsel1, [4], "", -5, [["expression", "selectcomp = 2;"]], "1", "1"],
	[_subsel2, [5], "", -5, [["expression", "selectcomp = 3;"]], "1", "1"],
	[_subsel3, [6], "", -5, [["expression", "selectcomp = 4;"]], "1", "1"],
	[_subsel4, [7], "", -5, [["expression", "selectcomp = 5;"]], "1", "1"],
	[_subevery, [8], "", -5, [["expression", "selectcomp = 6;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcomp = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_comp";

waitUntil {sleep 0.1; selectcomp != 0};

if (selectcomp isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;
private _getvc = [_targetvehicle] call BIS_fnc_getVehicleCustomization;
private _check = _getvc select 1;
private _op1 = _check select 5;
private _op2 = _check select 7;
private _op3 = _check select 1;
private _op4 = _check select 3;

if (selectcomp > 0) then {hint localize "STR_VAM_SUB_COMPONENT_APPLIED";};

if (selectcomp isEqualTo 1) exitWith {[_targetvehicle,nil,[true],nil] call BIS_fnc_initVehicle; [] spawn fnc_Bobcat_comp; sleep 2; hint "";};

if (selectcomp isEqualTo 6) exitWith {
	[_targetvehicle,nil,["showAmmobox",1,"showWheels",1,"showCamonetHull",1,"showBags",1],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Bobcat_comp; sleep 2; hint "";
};

if (selectcomp isEqualTo 2) then {
	if (_check select 5 isEqualTo 0) then {_op1 = 1;};
	if (_check select 5 isEqualTo 1) then {_op1 = 0;};
};

if (selectcomp isEqualTo 3) then {
	if (_check select 7 isEqualTo 0) then {_op2 = 1;};
	if (_check select 7 isEqualTo 1) then {_op2 = 0;};
};

if (selectcomp isEqualTo 4) then {
	if (_check select 1 isEqualTo 0) then {_op3 = 1;};
	if (_check select 1 isEqualTo 1) then {_op3 = 0;};
};

if (selectcomp isEqualTo 5) then {
	if (_check select 3 isEqualTo 0) then {_op4 = 1;};
	if (_check select 3 isEqualTo 1) then {_op4 = 0;};
};

if (true) then {
	[_targetvehicle,nil,["showAmmobox",_op3,"showWheels",_op4,"showCamonetHull",_op1,"showBags",_op2],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Bobcat_comp; sleep 2; hint "";
};