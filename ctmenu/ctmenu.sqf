
[] execVM "ctmenu\irstrobelite.sqf";

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
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.93 * safezoneH + safezoneY,0.06 * safezoneW,0.012 * safezoneH];
				if(SAKY_Reward>0)then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "점령보너스 획득";
				bar ctrlSetTooltip "적 지역을 점령하면 점령보너스를 획득합니다. 사망이나 재배치 없이 FOB로 복귀하면 획득한 점령보너스를 받을 수 있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  
				
				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.945 * safezoneH + safezoneY,0.06 * safezoneW,0.012 * safezoneH];
				if(soundVolume==( desired_vehvolume / 100.0 ))then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "이어플러그 착용";
				bar ctrlSetTooltip "휠을 굴려 =추가설정메뉴=에 들어가 맨 아래의 슬라이더를 조절해 이어플러그 볼륨을 조절할 수 있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  
				
				bar = findDisplay 100 ctrlCreate ["RscText", -1];
				bar ctrlSetPosition [0.006 * safezoneW + safezoneX,0.96 * safezoneH + safezoneY,0.06 * safezoneW,0.012 * safezoneH];
				if(Radio_Joined)then{bar ctrlSettextColor [0.5,0.8,0,0.9];}else{bar ctrlSettextColor [0.9,0.2,0,0.9];};					 
				bar ctrlSetText "전술통신망 연결";
				bar ctrlSetTooltip "전술통신망을 연결하여 다른 분대와 통신할 수 있습니다. 조종사는 필수로 연결되어있습니다.";
				bar ctrlSetScale 0.8;
				bar ctrlCommit 0;  
			};   
			
		};   
	}   
	];   
}; 

SAKY_Gesture_Text={
	params ["_unit","_string"];
	[format ["<t size = '.5'>%1<br/>""%2""</t>",name _unit,_string],-1,1,2,0.3,0,700+round(random 100)] spawn BIS_fnc_dynamicText;
};

SAKY_Gesture_Send={
	params ["_string"];
	_arounds = [];
	_arounds = player nearEntities ["Man", 20];
	[player,_string] remoteExec ["SAKY_Gesture_Text", _arounds];
};

Test_Menu_RClose = {_keyInputEH = findDisplay 46 displayaddEventHandler ["KeyUp",{
		params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"];
		if(_key==0xDB) then {closeDialog 100;};	
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
	if(vehicle player == player)then {
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

SAKY_MANUAL_HALO_Condition = {
	_cargos = [];
	{_cargos pushback _x#0}forEach fullCrew [vehicle player, "cargo"];
	_isFFV = false;
	if(vehicle player != player)then{_isFFV=((fullCrew vehicle player)#((fullCrew vehicle player) findIf {_x#0==player})#4)};
	((ASLToAGL getPosASL vehicle player#2) > 150) && ((player in _cargos) || _isFFV)
};

SAKY_MANUAL_HALO = {  

	player addAction   
	[  
	"<t color='#00FF00'>공수 강하</t>",   
	{    
		_backpackcontents = [];
		moveOut player; 
		sleep 2; 
		_backpack = backpack player; 
		if ( _backpack != "" && _backpack != "B_Parachute" ) then { 
			_backpackcontents = backpackItems player; 
			removeBackpack player; 
			sleep 0.1; 
		}; 
		player addBackpack "B_Parachute"; 
		sleep 4;   
		waitUntil { (ASLToAGL getPosASL player#2) < 90 }; 
		player action ["OpenParachute", player];   
		waitUntil { !alive player || isTouchingGround player }; 
		if ( _backpack != "" && _backpack != "B_Parachute" ) then { 
			sleep 2; 
			player addBackpack _backpack; 
			clearAllItemsFromBackpack player; 
			{ player addItemToBackpack _x } foreach _backpackcontents; 
		};   
	},  
	[],  
	15,   
	true,   
	true,   
	"",  
	"call SAKY_MANUAL_HALO_Condition" 
	]; 
}; 
call SAKY_MANUAL_HALO;

waitUntil{!isNull findDisplay 46};

uiSleep 3;

call Test_Menu_Add;
call Test_Menu_RClose;

systemChat "윈도우키 메뉴 스크립트 활성화!";

