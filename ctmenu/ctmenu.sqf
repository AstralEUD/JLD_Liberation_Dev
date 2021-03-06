disableSerialization;

Gesture_ctrl = 1;
[] execVM "ctmenu\irstrobelite.sqf";

TM_Icons = [
	"\A3\ui_f\data\map\markers\nato\o_inf.paa",
	"\A3\ui_f\data\map\markers\nato\o_med.paa",
	"\a3\UI_F_Orange\Data\CfgMarkers\o_Ordnance_ca.paa",
	"\A3\ui_f\data\map\markers\nato\o_recon.paa",
	"\A3\ui_f\data\map\markers\nato\o_maint.paa",
	"\A3\ui_f\data\map\markers\nato\o_armor.paa",
	"\A3\ui_f\data\map\markers\nato\o_plane.paa"
];
TM_Roles = ["소총수","전투의무병","중화기병","지정사수","공병/UAV운용병","지상장비 운용병","항공장비 운용병"];

Test_Menu_Add = {   
	_keyInputEH = findDisplay 46 displayaddEventHandler ["KeyDown", {   
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];   
		if(_key==0xDB) then {   
			if(isNull(findDisplay 100))then{   
				if(!visibleMap)then{setMousePosition [0.5,0.5]};   
				createDialog "Ctme";      
				hp = round(100*(1-getDammage player));
				
				bar = findDisplay 100 ctrlCreate ["RscProgress", -1];    
				bar ctrlSetPosition [0.009 * safezoneW + safezoneX,0.979 * safezoneH + safezoneY,0.092 * safezoneW,0.0075 * safezoneH];    
				bar ctrlSetTextColor [0, 0, 0, 0.8];   
				bar ctrlSetTooltip str formatText["%1%%",hp];
				bar ctrlCommit 0;   
				bar progressSetPosition 1;    

				bar = findDisplay 100 ctrlCreate ["RscProgress", -1];    
				bar ctrlSetPosition [0.01 * safezoneW + safezoneX,0.98 * safezoneH + safezoneY,0.09 * safezoneW,0.0055 * safezoneH];    
				bar ctrlSetTextColor [1, 0, 0, 0.6];   
				bar ctrlSetTooltip str formatText["%1%%",hp];
				bar ctrlCommit 0;   
				bar progressSetPosition 1;         

				bar = findDisplay 100 ctrlCreate ["RscProgress", -1];    
				bar ctrlSetPosition [0.01 * safezoneW + safezoneX,0.98 * safezoneH + safezoneY,0.09 * safezoneW,0.0055 * safezoneH];    
				bar ctrlSetTextColor [0.65 min 20*(getDammage player)^3, 0.6, 0, 1];   
				bar ctrlSetTooltip str formatText["%1%%",hp];
				bar ctrlCommit 0;   
				bar progressSetPosition (1 - getDammage player);  					
				
				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.93 * safezoneH + safezoneY,0.1 * safezoneW,0.015 * safezoneH];
				if(SAKY_Reward>0)then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "점령보너스 획득";
				bar ctrlSetTooltip "적 지역을 점령하면 점령보너스를 획득합니다. 사망이나 재배치 없이 FOB로 복귀하면 획득한 점령보너스를 받을 수 있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  
				
				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.945 * safezoneH + safezoneY,0.1 * safezoneW,0.015 * safezoneH];
				if(soundVolume==( desired_vehvolume / 100.0 ))then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "이어플러그 착용";
				bar ctrlSetTooltip "휠을 굴려 =추가설정메뉴=에 들어가 맨 아래의 슬라이더를 조절해 이어플러그 볼륨을 조절할 수 있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  
				
				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.96 * safezoneH + safezoneY,0.1 * safezoneW,0.015 * safezoneH];
				if(Radio_Joined)then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "전술통신망 연결";
				bar ctrlSetTooltip "전술통신망을 연결하여 다른 분대와 통신할 수 있습니다. 조종사는 필수로 연결되어있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  

				bar = findDisplay 100 ctrlCreate ["RscPictureKeepAspect", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.883 * safezoneH + safezoneY,0.0257812 * safezoneW,0.044 * safezoneH];
				bar ctrlSetText TM_Icons#(player getVariable ["Trait", 0 ]);	
				bar ctrlCommit 0;  

				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.03 * safezoneW + safezoneX,0.86 * safezoneH + safezoneY,0.149531 * safezoneW,0.044 * safezoneH];
				bar ctrlSetText TM_Roles#(player getVariable ["Trait", 0 ]);
				bar ctrlSetScale 2;
				bar ctrlCommit 0;  
			};   
			
		};   
	}   
	];   
}; 

SAKY_Gesture_Text={
	params ["_unit","_string"];
	[format ["<t size = '.5'>%1<br/>""%2""</t>",name _unit,_string],-1,1,1.5,0.3,0,700+(Gesture_ctrl%5)] spawn BIS_fnc_dynamicText;
	Gesture_ctrl=Gesture_ctrl+1;
};

SAKY_Gesture_Send={
	params ["_string"];
	_targets = [];
	{
		{
			_targets pushBackUnique _x;
		}foreach crew _x;
	}foreach (player nearEntities 30);
	[player,_string] remoteExec ["SAKY_Gesture_Text", _targets];
};

GRLIB_ExtMenu = {
	(findDisplay 100) closeDisplay 1; 	
	waitUntil{ sleep 0.3; alive player };
	execVM "GREUH\scripts\GREUH_dialog.sqf";
	waitUntil{ sleep 0.3; alive player };
};

Test_Menu_RClose = {_keyInputEH = findDisplay 46 displayaddEventHandler ["KeyUp",{
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
		if(_key==0xDB) then {(findDisplay 100) closeDisplay 1;};	
	}]
};

Test_Earplug = {
	if(soundVolume!=( desired_vehvolume / 100.0 ))then{1 fadeSound ( desired_vehvolume / 100.0 );hint "귀마개를 착용하였습니다!";}else{1 fadeSound 1;hint "귀마개를 해제하였습니다!";};
	if(desired_vehvolume>90)then{
		hint "귀마개 볼륨이 90%이상입니다. 추가설정메뉴 최하단에서 귀마개 볼륨을 설정할 수 있습니다!";
		systemChat "귀마개 볼륨이 90%이상입니다. 추가설정메뉴 최하단에서 귀마개 볼륨을 설정할 수 있습니다!";
	};
};

Test_PlayAnim = {
	params ["_animeMain"];
	AnimdoLoop = false;
	_delay = 1/(getNumber (configfile >> "CfgMovesMaleSdr" >> "States" >> _animeMain >> "speed"));
	_isUnconscious = player getVariable "FAR_isUnconscious";
	if(vehicle player == player && (_isUnconscious==0))then {
		player action ["SwitchWeapon", player, player, -1];	
		uiSleep 1;	
		_animEH = (findDisplay 46) displayaddEventHandler [ "KeyDown", {
			AnimdoLoop = true;
		}];
		waitUntil{
			[player, _animeMain] remoteExec ["switchMove", 0];
			uisleep _delay;
			AnimdoLoop
		};		
		(findDisplay 46) displayremoveEventHandler ["KeyDown", _animEH];
		[player, ""] remoteExec ["switchMove", 0];
	};
};

/*
SAKY_WEATHERCHECK_ADDACTION = {
	player addAction  
	[ 
	"기상정보 확인",  
	{   
		"Weathers Information System" hintC [   
		str formatText ["현재 구름량:%1%%",overcast*100],   
		str formatText ["현재 강우량:시간당 %1mm",rain*100],   
		str formatText ["현재 안개량:%1%%",fog*100],  
		str formatText ["현재 풍속:%1m/s",vectorMagnitude wind],  
		str formatText ["현재 파도:%1m",waves*10],   
		str formatText ["예상 구름량:%1%%",overcastForecast*100],    
		str formatText ["예상 안개량:%1%%",fogForecast*100] 
		];   
		hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {  
			0 = _this spawn {  
				_this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];  
				hintSilent "";  
			};  
		}]; 
	}, 
	[], 
	1.5,  
	true,  
	true,  
	"", 
	"(getPos player nearObjects 3) findIf {typeOf _x find 'PortableWeatherStation' > -1}>-1"
	];
};
call SAKY_WEATHERCHECK_ADDACTION;
*/

waitUntil{!isNull findDisplay 46};

uiSleep 3;

call Test_Menu_Add;
call Test_Menu_RClose;

systemChat "윈도우키 메뉴 스크립트 활성화!";
