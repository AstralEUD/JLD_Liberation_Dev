#define G 9.81

BTCS_Shells=[
["MK6 Mortar",
"70		[근거리]",
"140	[중거리]",
"200	[원거리]"],

["2S9 Sochor/M4 Scorcher",
"153.9	[근거리]",
"243	[중거리]",
"388.8	[장거리]",
"648	[초장거리]",
"810	[최대]"],

["M5 Sandstorm/Zamak MRL",
"114.8	[1000m-1300m]",
"130.1	[1300m-1700m]",
"148.8	[1700m-2200m]",
"170	[2200m-2900m]",
"193.9	[2900m-3800m]",
"221.9	[3800m-5000m]",
"255.1	[5000m-6600m]",
"289.9	[6600m-8500m]",
"329.9	[8500m-11000m]",
"374	[11000m-14000m]",
"420.7	[14000m-18000m]",
"476	[18000m-23000m]",
"543.2	[23000m-30000m]",
"629	[30000m-40000m]",
"715.7	[40000m-52000m]",
"816	[52000m-67000m]"]
];

BTCS_init={
	lbClear 1500;
	{lbAdd [1500,_x#0];}forEach BTCS_Shells;
};

BTCS_initRange={
	lbClear 1501;
	{lbAdd [1501,_x];}forEach BTCS_Shells#(lbCurSel 1500);
	lbDelete [1501,0];
	with uiNamespace do {lbSetCurSel [1501,BTCS_saveitem#1]};
};

BTCS_calculate = {
	if(ctrlText 1400 != "" && ctrlText 1401 != "" && ctrlText 1402 != "" && ctrlText 1403 != "" && ctrlText 1404 != "" && ctrlText 1405 != "" && lbCurSel 1501 != -1)then{
		_batteryPos=[parseNumber ctrlText 1400,parseNumber ctrlText 1401,parseNumber ctrlText 1402];
		_targetPos=[parseNumber ctrlText 1403,parseNumber ctrlText 1404,parseNumber ctrlText 1405];
		_range = sqrt(((_batteryPos distance2d _targetPos) * 10)^2+(_targetPos#2-_batteryPos#2)^2);
		_alt = _targetPos#2 - _batteryPos#2;
		_velocity = parseNumber lbtext [1501, lbcurSel 1501];
		_lbsel = lbAdd [1007, format["Range:%1m / Alt Diff:%2 / Shell Velocity:%3",_range,_alt,_velocity]];
		lbSetCurSel [1007, _lbsel];
		if(_range!=0)then{
			ctrlSetText[1406,str(atan((_velocity*_velocity+sqrt(_velocity*_velocity*_velocity*_velocity-G*(G*_range*_range+2*_alt*_velocity*_velocity)))/(G*_range)))];
			ctrlSetText[1407,str(_range/(_velocity*cos((parseNumber ctrlText 1406))))];				
			ctrlSetText[1408,str(atan((_velocity*_velocity-sqrt(_velocity*_velocity*_velocity*_velocity-G*(G*_range*_range+2*_alt*_velocity*_velocity)))/(G*_range)))];	
			ctrlSetText[1409,str(_range/(_velocity*cos((parseNumber ctrlText 1408))))];			
		}else{			
			_lbsel =lbAdd [1007, "Unable to Calculate!"];
			lbSetCurSel [1007, _lbsel];
		};
	}else{		
		_lbsel =lbAdd [1007, "Unable to get grid!"];
		lbSetCurSel [1007, _lbsel];
	};
	[] spawn BTCS_save;
};

BTCS_save = {
	uiNamespace setVariable ["BTCS_saveitem",[lbCurSel 1500, lbCurSel 1501, ctrlText 1400, ctrlText 1401, ctrlText 1402, ctrlText 1403, ctrlText 1404, ctrlText 1405, ctrlText 1406, ctrlText 1407, ctrlText 1408, ctrlText 1409]];
};

BTCS_load={
	with uiNamespace do{
		if(!isNil "BTCS_saveitem")then{
			lbSetCurSel [1500,BTCS_saveitem#0];
			lbSetCurSel [1501,BTCS_saveitem#1];
			ctrlSetText [1400,BTCS_saveitem#2];
			ctrlSetText [1401,BTCS_saveitem#3];
			ctrlSetText [1402,BTCS_saveitem#4];
			ctrlSetText [1403,BTCS_saveitem#5];
			ctrlSetText [1404,BTCS_saveitem#6];
			ctrlSetText [1405,BTCS_saveitem#7];
			ctrlSetText [1406,BTCS_saveitem#8];
			ctrlSetText [1407,BTCS_saveitem#9];
			ctrlSetText [1408,BTCS_saveitem#10];
			ctrlSetText [1409,BTCS_saveitem#11];
		};
	};
};

player addAction ["<t color='#00FF00'>BTCS실행</t>", {0 = createDialog "BTCS_Control";},[],1.5,true,true,"","getNumber(configfile >> 'CfgVehicles' >> typeOf vehicle player >> 'artilleryScanner')==1"];

systemChat "반자동 포병컴퓨터 활성화";
