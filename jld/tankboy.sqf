player addAction 
[
localize "str_action_take_control", 
{
	params ["_target", "_caller", "_actionId", "_arguments", "_agent"];
	_agent = createAgent ["B_crew_F", [0,0,0], [], 0, "FORM"];
	_agent moveInDriver vehicle player;
	_agent assignAsDriver vehicle player;
	_agent allowDamage false;
	_agent addEventHandler ["SeatSwitchedMan",{deleteVehicle _agent;}];
	vehicle player vehicleChat "조종 개시";
},
[],
15, 
true, 
true, 
"",
"(commander vehicle player == player) && ((vehicle player isKindOf ""Tank"") || (vehicle player isKindOf ""Wheeled_APC_F"")) && (isNull driver vehicle player)" // _target, _this, _originalTarget
];

player addEventHandler ["SeatSwitchedMan",{
	params ["_unit1", "_unit2", "_vehicle"];
	if(isNull commander _vehicle)then{deleteVehicle driver _vehicle};
	deleteVehicle _unit2;
}];	

player addEventHandler ["GetOutMan",{
	params ["_unit", "_role", "_vehicle", "_turret"];
	if(_role == "commander")then{deleteVehicle driver _vehicle};
}];	