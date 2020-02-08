//O_Marid Components - Old
//[["Hex",1],["showBags",0,"showCanisters",0,"showTools",0,"showCamonetHull",0,"showSLATHull",0]]
selectcomp = 0;
_subname = localize "STR_VAM_SUB_COMPONENT";
_subback = localize "STR_VAM_SUB_BACK";
_subclose = localize "STR_VAM_CLOSE_MENU";
_subnone = localize "STR_VAM_NONE_COMP";
_subevery = localize "STR_VAM_EVERYTHING_COMP";
_VAM_Comp =
[
	[_subname,false],
	[_subback, [2], "#USER:VAMsub", -5, [["expression", "selectcomp = -1;"]], "1", "1"],
	[_subnone, [3], "", -5, [["expression", "selectcomp = 1;"]], "1", "1"],
	[_subevery, [9], "", -5, [["expression", "selectcomp = 7;"]], "1", "1"],
	[_subclose, [41], "", -5, [["expression", "selectcomp = -1; showCommandingMenu '';"]], "1", "1"]
];
showCommandingMenu "#USER:_VAM_comp";

waitUntil {sleep 0.1; selectcomp != 0};

if (selectcomp isEqualTo -1) exitWith {};

private _targetvehicle = vehicle player;

if (selectcomp > 0) then {hint localize "STR_VAM_SUB_COMPONENT_APPLIED_WARNING";};

if (selectcomp isEqualTo 1) exitWith {
	[_targetvehicle,nil,["showBags",0,"showCanisters",0,"showTools",0,"showCamonetHull",0,"showSLATHull",0],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Marid_v1_comp; sleep 2; hint "";
};

if (selectcomp isEqualTo 7) exitWith {
	[_targetvehicle,nil,["showBags",1,"showCanisters",1,"showTools",1,"showCamonetHull",1,"showSLATHull",1],nil] call BIS_fnc_initVehicle;
	[] spawn fnc_Marid_v1_comp; sleep 2; hint "";
};