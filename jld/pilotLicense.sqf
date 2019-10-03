license_keys=[
"BIS_Showcase_Gunships.altis_done",	
"BIS_Showcase_Drones.altis_done",	
"BIS_showcase_helicopters.stratis_done",	
"BIS_showcase_fixedwings.altis_done"
];

pilot_license={
	_done=[];
	{
		_done pushBack (isKeyActive _x);
	}forEach license_keys;
	_done
};

if(typeOf player == "B_Pilot_F") then {	
	if( ((call pilot_license) find false) != -1 )then{		
		waitUntil{!isNull findDisplay 46};
		sleep 3;		
		[call pilot_license] spawn {	
			params ["_done"];	
			_result = [parseText format["<t align='center'>본 서버에서 조종사로 플레이하기 위해서는<br/> 아래의 쇼케이스를 모두 완수해야 합니다.<br/><br/>			
			<t color='%1'>공격헬기 쇼케이스</t><br/>
			<t color='%2'>UAV 쇼케이스</t><br/>
			<t color='%3'>회전익 쇼케이스</t><br/>
			<t color='%4'>고정익 쇼케이스</t></t><br/>",
			if((call pilot_license)#0)then{"#00ff00"}else{"#ff0000"},
			if((call pilot_license)#1)then{"#00ff00"}else{"#ff0000"},
			if((call pilot_license)#2)then{"#00ff00"}else{"#ff0000"},
			if((call pilot_license)#3)then{"#00ff00"}else{"#ff0000"}
			],"조종자격 증명 필요"] call BIS_fnc_guiMessage;
			endMission "End5";
		};
	};
};

while{true}do{
	if((UAVControl (getConnectedUAV player)#1)!="")then{		
		objNull remoteControl driver (getConnectedUAV player);		// removes the remoteControlling
		player switchCamera "internal";			// returns to the player		
		["<t color='#ff0000' size = '0.6' >무인기 직접조종은 금지되어있습니다.</t>"] spawn BIS_fnc_dynamicText;
		systemChat "무인기 직접조종은 금지되어있습니다.";
	}; 
	if( (!isNull getConnectedUAV player) && (((call pilot_license) find false) != -1) ) then {
		_result = [parseText format["<t align='center'>본 서버에서 무인기를 사용하기 위해서는<br/> 아래의 쇼케이스를 모두 완수해야 합니다.<br/><br/>			
			<t color='%1'>공격헬기 쇼케이스</t><br/>
			<t color='%2'>UAV 쇼케이스</t><br/>
			<t color='%3'>회전익 쇼케이스</t><br/>
			<t color='%4'>고정익 쇼케이스</t></t><br/>",
		if((call pilot_license)#0)then{"#00ff00"}else{"#ff0000"},
		if((call pilot_license)#1)then{"#00ff00"}else{"#ff0000"},
		if((call pilot_license)#2)then{"#00ff00"}else{"#ff0000"},
		if((call pilot_license)#3)then{"#00ff00"}else{"#ff0000"}
		],"조종자격 증명 필요"] call BIS_fnc_guiMessage;
		player connectTerminalToUAV objNull;
		["<t color='#ff0000' size = '0.55' >무인기 연결이 해제되었습니다.</t>"] spawn BIS_fnc_dynamicText;
		systemChat "무인기 연결이 해제되었습니다.";						
	};
	sleep 0.1;
};