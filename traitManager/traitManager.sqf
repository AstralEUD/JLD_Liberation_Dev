disableSerialization;

TM = true;
TM_Lock = false;
TM_MEM = false;
TM_Action = -1;

player setVariable["Trait", 0, true]; 

TM_LandVehicles = [];
TM_HeavyVehicles = [];
TM_AirVehicles = [];
TM_ServiceVehicles = [
"SUV_01_base_grey_F",
"B_GEN_Offroad_01_gen_F",
"C_Offroad_02_unarmed_green_F",
"B_G_Van_01_transport_F",
"B_G_Van_02_transport_F",
"C_Heli_Light_01_civil_F",
"C_IDAP_Heli_Transport_02_F",
"B_Parachute"
];

{
	{
		TM_LandVehicles pushBack _x#0;
	}forEach _x;
}forEach [light_vehicles, support_vehicles];

{
	{
		TM_HeavyVehicles pushBack _x#0;
	}forEach _x;
}forEach [heavy_vehicles];

{
	{
		TM_AirVehicles pushBack _x#0;
	}forEach _x;
}forEach [air_vehicles];
TM_RoledVehicles = TM_LandVehicles+TM_HeavyVehicles+TM_AirVehicles-TM_ServiceVehicles;

TM_Traits = [
//["TraitName", "Cost", "Description", [ENG,EXP,MED,UAV,DRV,PLT,MIS,SNP]]
["소총수", 			 0, 	"소총수<br/><t size='0.8'>일반 소총수 겸 차량 운전이 가능한 보직입니다. 경장갑차량과 지원탭의 차량을 이용할 수 있습니다. <br/><br/>스테미나 제한<br/>경장갑차량 운용 가능", 
[false, false, false, false, false, false, false, false]], //0 o
["전투의무병", 		 0, 	"전투의무병<br/><t size='0.8'>응급처치도구(구급상자X)를 사용해 자신 혹은 아군의 체력을 100%까지 치료할 수 있습니다.<br/><br/>스테미나 제한<br/>응급처치도구 사용가능", 
[false, false, true, false, false, false, false, false]], //1
["중화기병", 		 0, 	"중화기병<br/><t size='0.8'>각종 발사관을 휴대하고 사용할 수 있습니다.<br/><br/>스테미나 제한<br/>발사관 사용가능", 
[false, false, false, false, false, false, true, false]], //2
["지정사수", 		 0, 	"지정사수<br/><t size='0.8'>최대 사거리가 1600m를 넘는 장거리 무장을 사용할 수 있습니다. <br/><br/>스테미나 제한<br/>저격소총 사용가능", 
[false, true, false, false, false, false, false, true]], //3
["공병/UAV운용병", 	 10, 	"공병/UAV운용병<br/><t size='0.8'>도구모음을 사용해 장비를 수리하거나 폭발물을 해체할 수 있습니다. 또한 무인기를 조작할 수 있습니다.<br/><br/>스테미나 제한<br/>장비수리 가능<br/>폭발물 해체 가능<br/>UAV 사용 가능", 
[true, true, false, true, false, false, false, false]], //4
["지상장비 운용병", 	 15, 	"지상장비 운용병<br/><t size='0.8'>중장갑 장비를 사용할 수 있습니다. 지상장비 운용병 외에는 지상장비의 운전석에 탑승은 가능하나 시동이 걸리지 않습니다. <br/><br/>스테미나 제한<br/>장비수리 가능<br/>중장갑차량 운용 가능", 
[true, false, false, false, true, false, false, false]], //5
["항공장비 운용병", 	 30, 	"항공장비 운용병<br/><t size='0.8'>모든 항공장비를 운용할 수 있습니다. 항공장비 운용병 외에는 항공장비의 조종석에 탑승은 가능하나 시동이 걸리지 않습니다. <br/><br/>스테미나 제한<br/>장비수리 가능<br/>항공장비 운용 가능", 
[true, false, false, false, false, true, false, false]] //6
]; 

//TMLOOP
TM_Loop = compileFinal "
	_isSNP = player getUnitTrait ""sniper"";
	_isMIS = player getUnitTrait ""missile"";
	_role = player getVariable [""Trait"", 0];

	_gun = primaryWeapon player;
	_gunNmae = getText (configfile >> ""CfgWeapons"" >> _gun >> ""displayName"");
	_range = getNumber (configfile >> ""CfgWeapons"" >> _gun >> ""maxZeroing"");
	_launcher = secondaryWeapon player;
	_launcherName = getText (configfile >> ""CfgWeapons"" >> _launcher >> ""displayName"");
	
	if (_range >= 1600 && !_isSNP) then {
		player removeWeapon _gun;
		systemChat format[""%2의 최대 사정거리는 %1m로 지정사수용 총입니다."",_range, _gunNmae];
		[format[""<t color='#ff0000' size = '0.8' >%2의 최대 사정거리는 %1m로 지정사수용 총입니다."",_range, _gunNmae]] spawn BIS_fnc_dynamicText;
	};		
	
	if (_launcher != """" && !_isMIS) then {
		player removeWeapon _launcher;
		systemChat format[""%1는 중화기병 전용 장비입니다."",_launcherName];
		[format[""<t color='#ff0000' size = '0.8' >%1는 중화기병 전용 장비입니다."",_launcherName]] spawn BIS_fnc_dynamicText;
	};
	
	player enableStamina true;
	
	_veh = typeOf vehicle player;
	_drv = currentPilot vehicle player;
	_drvRole = -1;
	_tmLock = false;
	if (!isNull _drv) then {_drvRole = _drv getVariable [""Trait"", 0];};
	if (_veh in TM_RoledVehicles && _drv == player) then {
		
		_tmLock = true;
		if (_drvRole == 0 && _veh in TM_LandVehicles) then {_tmLock = false;};
		if (_drvRole == 5 && _veh in TM_HeavyVehicles) then {_tmLock = false;};
		if (_drvRole == 6 && _veh in TM_AirVehicles) then {_tmLock = false;};
	}else{
		
		_tmLock = false;
	};
	TM_Lock = _tmLock;
	
	if( (_role!=4) && (!isNull getConnectedUAV player) ) then {
		player connectTerminalToUAV objNull;		
		[""<t color='#ff0000' size = '0.8' >무인기는 공병만 사용 가능합니다. 연결이 해제되었습니다.</t>""] spawn BIS_fnc_dynamicText;
		systemChat ""무인기는 공병만 사용 가능합니다. 연결이 해제되었습니다."";
	};
";

TM_addAction = compileFinal "
	_isUnconscious = player getVariable [""FAR_isUnconscious"",1];
	_nearfob = []call F_getNearestFob;
	_fobdistance = 9999;
	_distredeploy = 20;
	if (count _nearfob == 3)
	then {
		_fobdistance = player distance _nearfob;
	};
	if ((_isUnconscious == 0) && (_fobdistance < _distredeploy || ((player distance lhd) < 200) || (player distance huronspawn) < 200) && alive player && vehicle player == player) then {
		if (TM_Action == -1) then {
			TM_Action = player addAction[""<t color='#ffff00'>-- 보직 변경"", ""[] spawn TM_initGUI"", """", -700, false, true, """", """"];
		};
	}else{
		if (TM_Action != -1) then {
			player removeAction TM_Action;
			TM_Action = -1;
		};
	};
";

[] spawn { 
	while{TM}do{ 
		call TM_addAction;	//액션추가
		call TM_Loop;	//TM동작루프
		sleep 0.1;
	}; 
};

[] spawn {
	while{TM}do{
		_drv = currentPilot vehicle player;
		if (TM_Lock && (_drv == player)) then {
			if (fuel vehicle player == 0) then {
				sleep 0.1;
			}else{				
				private "_gas";
				_veh = vehicle player; 		
				_gas = fuel _veh; 
				_veh setFuel 0; 
				sleep 0.01;  
				_veh setFuel _gas; 
			};
			hintSilent "장비 운용병 보직이 아닌경우 장비 운용이 불가능합니다. 민수용 장비를 사용하거나 보직을 변경하십시오.";
		}else{
			sleep 0.1;
		};
	};
};

TM_SetTraits =  {
	params ["_traits"]; 
	_allTraits = ["engineer", "explosiveSpecialist", "medic", "UAVHacker", "driver", "pilot", "missile", "sniper"];  {
		_isCustom = _forEachIndex > 3; 
		player setUnitTrait [_x, _traits#_forEachIndex, _isCustom]; 
	}forEach _allTraits; 	
	_trait = player getVariable["Trait", 0]; 
	hint format["보직이 변경되었습니다.\n[ %1 ]",TM_Traits#_trait#0]; 

	if(!Radio_Joined && _trait>4)then{
		call Radio_Request_Join;
	}
}; 

TM_Refresh =  {
	while { ! isNull TM_Display }	do {
		TM_GUI_SCORE ctrlSetText format["경험치 : %1", score player];  

		{
			TM_GUI_LIST lbSetColor[_forEachIndex, [1, 1, 1, 0.8]]; 
		} forEach TM_Traits; 

		_trait = player getVariable["Trait", 0]; 
		_traitSelected = lbCurSel TM_GUI_LIST; 
		TM_GUI_LIST lbSetColor[_trait, [0, 1, 0, 0.8]]; 

		TM_GUI_TITLE ctrlSetText format["보직 선택 (현재:%1)", TM_Traits# _trait #0]; 		
		TM_GUI_COST ctrlSetText format["비용 : %1 ( - %2 )", TM_Traits# _traitSelected #1, TM_Traits#(player getVariable["Trait", 0])#1]; 
		
		_cost = (TM_Traits# _traitSelected #1) - (TM_Traits# _trait #1); 

		if (_trait != _traitSelected) then {
			if (score player - _cost >= 0) then {
				TM_GUI_OK ctrlEnable true;
			}else{				
				TM_GUI_OK ctrlEnable false;
			};
		}else{
			TM_GUI_OK ctrlEnable false;
		};

		Sleep 0.1; 
	}; 
}; 

TM_Reset =  {
	player addEventHandler["Respawn",  {
		_trait = player getVariable["Trait", 0]; 
		_score = score player;
		_cost = TM_Traits#_trait#1;
		if(TM_MEM)then{
			if(_score - _cost > 0)then{
				[player, -1 * _cost] remoteExec ["addScore", 2]; 		
				player setVariable ["Trait", _trait, true]; 
				[TM_Traits#_trait#3] call TM_SetTraits; 						
			}else{
				player setVariable["Trait", 0, true]; 
				[[false, false, false, false, false, false, false, false]] call TM_SetTraits;
				systemChat "점수가 부족하여 리스폰보직이 적용되지 않았습니다.";
			};
		}else{
			player setVariable["Trait", 0, true]; 
			[[false, false, false, false, false, false, false, false]] call TM_SetTraits;
		};
	}]; 
}; 
call TM_Reset; 

TM_initGUI =  {
	TM_Display = findDisplay 46 createDisplay "RscDisplayEmpty"; 

	TM_GUI_BG = TM_Display ctrlCreate["RscText", -1]; 
	TM_GUI_BG ctrlSetPosition[0.345312 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.352 * safezoneH]; 
	TM_GUI_BG ctrlSetBackgroundColor[0.1, 0.1, 0.1, 0.8]; 

	TM_GUI_TITLE = TM_Display ctrlCreate["RscText", -1]; 
	TM_GUI_TITLE ctrlSetPosition[0.345312 * safezoneW + safezoneX, 0.335 * safezoneH + safezoneY, 0.309375 * safezoneW, 0.022 * safezoneH]; 
	TM_GUI_TITLE ctrlSetBackgroundColor[0.3, 0.3, 0.3, 0.8]; 
	TM_GUI_TITLE ctrlSetText "ROLE SELECT"; 

	TM_GUI_LIST = TM_Display ctrlCreate["RscListBox", 8600]; 
	TM_GUI_LIST ctrlSetPosition[0.355625 * safezoneW + safezoneX, 0.379 * safezoneH + safezoneY, 0.12375 * safezoneW, 0.286 * safezoneH]; 

	TM_GUI_DESCRIPTION = TM_Display ctrlCreate["RscStructuredText", 8601]; 
	TM_GUI_DESCRIPTION ctrlSetPosition[0.489687 * safezoneW + safezoneX, 0.379 * safezoneH + safezoneY, 0.154687 * safezoneW, 0.209 * safezoneH]; 
	TM_GUI_DESCRIPTION ctrlSetBackgroundColor[0.3, 0.3, 0.3, 0.8]; 

	TM_GUI_COST = TM_Display ctrlCreate["RscText", 8602]; 
	TM_GUI_COST ctrlSetPosition[0.489687 * safezoneW + safezoneX, 0.599 * safezoneH + safezoneY, 0.12375 * safezoneW, 0.033 * safezoneH]; 
	TM_GUI_COST ctrlSetText "비용:Loading"; 

	TM_GUI_SCORE = TM_Display ctrlCreate["RscText", 8603]; 
	TM_GUI_SCORE ctrlSetPosition[0.489687 * safezoneW + safezoneX, 0.632 * safezoneH + safezoneY, 0.12375 * safezoneW, 0.033 * safezoneH]; 
	TM_GUI_SCORE ctrlSetText "자원:Loading"; 

	TM_GUI_OK = TM_Display ctrlCreate["RscButton", 8604]; 
	TM_GUI_OK ctrlSetPosition[0.572187 * safezoneW + safezoneX,0.599 * safezoneH + safezoneY,0.0721875 * safezoneW,0.044 * safezoneH]; 
	TM_GUI_OK ctrlSetText "보직변경"; 
	TM_GUI_OK ctrlEnable false; 

	TM_GUI_MEM = TM_Display ctrlCreate["RscCheckBox", 8605]; 
	TM_GUI_MEM ctrlSetPosition[0.572187 * safezoneW + safezoneX,0.643 * safezoneH + safezoneY,0.011 * safezoneW,0.022 * safezoneH]; 
	TM_GUI_MEM cbSetChecked TM_MEM;
	
	TM_GUI_MEMText = TM_Display ctrlCreate["RscStructuredText", 8606]; 
	TM_GUI_MEMText ctrlSetPosition[0.5825 * safezoneW + safezoneX,0.643 * safezoneH + safezoneY,0.07 * safezoneW,0.022 * safezoneH]; 
	TM_GUI_MEMText ctrlSetStructuredText parseText "<t size='0.8' valign='middle'>리스폰 보직 저장</t>"; 
	
	TM_GUI_CLS = TM_Display ctrlCreate["RscButton", 8607]; 
	TM_GUI_CLS ctrlSetPosition[0.613437 * safezoneW + safezoneX,0.335 * safezoneH + safezoneY,0.04125 * safezoneW,0.022 * safezoneH]; 
	TM_GUI_CLS ctrlSetText "CLOSE"; 

	TM_GUI_BG ctrlCommit 0; 
	TM_GUI_TITLE ctrlCommit 0; 
	TM_GUI_LIST ctrlCommit 0; 
	TM_GUI_DESCRIPTION ctrlCommit 0; 
	TM_GUI_COST ctrlCommit 0; 
	TM_GUI_SCORE ctrlCommit 0; 
	TM_GUI_OK ctrlCommit 0; 
	TM_GUI_MEM ctrlCommit 0; 
	TM_GUI_MEMText ctrlCommit 0; 
	TM_GUI_CLS ctrlCommit 0; 

	lbClear TM_GUI_LIST;  {
		_i = TM_GUI_LIST lbAdd _x #0; 
	}forEach TM_Traits; 	

	TM_GUI_MEM ctrlAddEventHandler ["CheckedChanged",  {
		params ["_control", "_checked"];
		if (_checked == 0) then {TM_MEM = false} else {TM_MEM = true};
	}]; 

	TM_GUI_CLS ctrlAddEventHandler ["ButtonClick",  {
		params ["_control", "_selectedIndex"]; 
		TM_Display closeDisplay 2;
	}]; 

	TM_GUI_LIST ctrlAddEventHandler ["LBSelChanged",  {
		params ["_control", "_selectedIndex"]; 
		_traitSelected = lbCurSel TM_GUI_LIST; 
		TM_GUI_DESCRIPTION ctrlSetStructuredText parseText(TM_Traits# _traitSelected #2); 
	}]; 

	TM_GUI_OK ctrlAddEventHandler ["ButtonClick",  {		
		_trait = player getVariable["Trait", 0]; 
		_traitSelected = lbCurSel TM_GUI_LIST; 
		_cost = (TM_Traits# _traitSelected #1) - (TM_Traits# _trait #1); 
		[player, -1 * _cost] remoteExec ["addScore", 2]; 		
		player setVariable ["Trait", _traitSelected, true]; 
		[TM_Traits#_traitSelected#3] call TM_SetTraits; 		
	}]; 
	TM_GUI_LIST lbSetCurSel 0; 
	call TM_Refresh; 
}; 

player addEventHandler ["Fired", { 
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	if((_this#1)=="Put")then{
		[player, str formatText["폭발물 설치 완료!",name (_this#6)]] remoteExec ["sideChat"];
	};
}];

//[] spawn TM_initGUI; 
//this addAction["<t color='#ffff00'>보직 변경", {[] spawn TM_initGUI;}];

systemChat "보직 변경 스크립트 초기화";

/* #Nasiro
$[
	1.063,
	["TM",[[0,0,1,1],0.025,0.04,"GUI_GRID"],0,0,0],
	[1600,"",[2,"",["5 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","16 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1601,"",[2,"",["5 * GUI_GRID_W + GUI_GRID_X","5 * GUI_GRID_H + GUI_GRID_Y","30 * GUI_GRID_W","1 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1602,"",[2,"",["6 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","12 * GUI_GRID_W","13 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1603,"",[2,"",["19 * GUI_GRID_W + GUI_GRID_X","7 * GUI_GRID_H + GUI_GRID_Y","15 * GUI_GRID_W","9.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1604,"",[1,"",["0.572187 * safezoneW + safezoneX","0.599 * safezoneH + safezoneY","0.0721875 * safezoneW","0.044 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1000,"",[2,"asfasfasfsaf",["19 * GUI_GRID_W + GUI_GRID_X","18.5 * GUI_GRID_H + GUI_GRID_Y","12 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1001,"",[2,"asfasfasfasf",["19 * GUI_GRID_W + GUI_GRID_X","17 * GUI_GRID_H + GUI_GRID_Y","12 * GUI_GRID_W","1.5 * GUI_GRID_H"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1605,"",[1,"CLOSE",["0.613437 * safezoneW + safezoneX","0.335 * safezoneH + safezoneY","0.04125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[2800,"",[1,"",["0.572187 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.0103125 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","-1"],[]],
	[1002,"",[1,"由ъ뒪?곗떆 蹂댁쭅 ?먮룞?곸슜",["0.5825 * safezoneW + safezoneX","0.643 * safezoneH + safezoneY","0.061875 * safezoneW","0.022 * safezoneH"],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"","0.8"],[]]
]
*/
