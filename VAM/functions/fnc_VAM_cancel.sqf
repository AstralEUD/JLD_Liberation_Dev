//Vehicle Appearance Manager Cancel
selectcamo = -1;
selectcomp = -1;
while {true} do {
	if (selectcamo isEqualTo 0) then {
		if !(commandingMenu isEqualTo "#USER:_VAM_camo") then	{
			selectcamo = -1;
		};
	};
	if (selectcomp isEqualTo 0) then {
		if !(commandingMenu isEqualTo "#USER:_VAM_comp") then	{
			selectcomp = -1;
		};
	};
	if (commandingMenu isEqualTo "#USER:_VAM_camo") then {
		if (player isEqualTo vehicle player) then {
			selectcamo = -1;
			showCommandingMenu '';
			hint localize "STR_VAM_NOT_DRIVER_CAMOUFLAGE";
			sleep 3;
			hint "";
		};
	};
	if (commandingMenu isEqualTo "#USER:_VAM_comp") then {
		if (player isEqualTo vehicle player) then {
			selectcomp = -1;
			showCommandingMenu '';
			hint localize "STR_VAM_NOT_DRIVER_COMPONENT";
			sleep 3;
			hint "";
		};
	};
sleep 0.2;
};