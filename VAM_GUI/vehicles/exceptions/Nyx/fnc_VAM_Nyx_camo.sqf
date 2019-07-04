//VAM Nyx Vehicle Camo Apply
disableSerialization;
private _VAM_display = findDisplay 4900;
private _list_camo = _VAM_display displayCtrl 4910;

private _targetvehicle = vehicle player;
private _list_selection = lbCurSel _list_camo;
private _selected_camo_class_name = camo_class_names select _list_selection;
[_targetvehicle,[_selected_camo_class_name,1],nil,nil] call BIS_fnc_initVehicle;
if (_selected_camo_class_name isEqualTo "Indep_Olive") then {
	_targetvehicle setObjectTextureGlobal [2, "A3\Armor_F\Data\camonet_NATO_Green_CO.paa"];
};