//OUTPUT
RFSCAN_devide = 360; 
RFSCAN_xgrid = 12; 
RFSCAN_ygrid = 8; 

//VARIABLES
RFSCAN_infantry = 10; 	//[W] 
RFSCAN_car = 15; 		//[W] 
RFSCAN_tanks = 25; 		//[W] 
RFSCAN_tower = 1500;  //[W]  
RFSCAN_gain = 35;   //[dBi] 

//GLOBAL VARs
RFSCAN_TOGGLE = false;
RFSCAN_lastScan = []; 
RFSCAN_gain_adjusted = nil;
RFSCAN_acoef = nil; 
RFSCAN_noise = nil;

RFSCAN_CONDITION = { 
	RFSCAN_TOGGLE && (vectorMagnitude velocity player < 1) && (typeOf vehicle player == Respawn_truck_typename || backpack player find "RadioBag" > 0)  
}; 

RFSCAN_TOGGLE_CONDITION = { 
	(typeOf vehicle player == Respawn_truck_typename || backpack player find "RadioBag" > 0)  
}; 

RFSCAN_REVIEW_CONDITION = { 
	RFSCAN_TOGGLE && (count RFSCAN_lastScan > 0) && (typeOf vehicle player == Respawn_truck_typename || backpack player find "RadioBag" > 0)  
}; 

RFSCAN_SCANENEMY = { 
	if(typeOf vehicle player == Respawn_truck_typename)then{
		RFSCAN_gain_adjusted = RFSCAN_gain;
	}else{
		if (backpack player find "RadioBag" > 0) then {RFSCAN_gain_adjusted = RFSCAN_gain*0.85;}; 
	};
	
	RFSCAN_acoef = ((2.56 - 1.56*count (player nearObjects ["House_Small_F", 50])/10) max 1); 
	RFSCAN_noise = (2.56-RFSCAN_acoef)*5+0.5 ;

	_signal = []; 
	//for "_j" from 0 to RFSCAN_devide do {_signal pushBack (((getPos player)#0) random [_j/RFSCAN_devide, _j/RFSCAN_devide])*RFSCAN_noise}; 
	for "_j" from 0 to RFSCAN_devide do {_signal pushBack random RFSCAN_noise}; 
	
	{  
		if(!(_x in blufor_sectors))then{ 
			_dir = floor(player getDir (getMarkerPos _x));  
			_range = player distance (getMarkerPos _x); 
			_signal set [floor(_dir*RFSCAN_devide/360),100 min ((_signal#_dir) + sqrt(RFSCAN_acoef * RFSCAN_tower * 377 * 10^(RFSCAN_gain_adjusted/10) / (4*PI*_range^2)))]; 
		};   
	}forEach sectors_tower; 
	
	{  
		if(!isagent teamMember _x && alive _x)then{ 
			_dir = floor(player getDir _x);  
			_range = player distance _x; 
			
			if(_x != vehicle player)then{ 
				_signal set [floor(_dir*RFSCAN_devide/360),100 min ((_signal#_dir) + sqrt(RFSCAN_acoef * RFSCAN_infantry * 377 * 10^(RFSCAN_gain_adjusted/10) / (4*PI*_range^2)))]; 
			}; 
		};   
	}forEach (player nearObjects ["Man", 1000]); 

	{  
		if(alive _x)then{ 
			_dir = floor(player getDir _x);  
			_range = player distance _x; 
			
			if(_x != vehicle player)then{ 
				_signal set [floor(_dir*RFSCAN_devide/360),100 min ((_signal#_dir) + sqrt(RFSCAN_acoef * RFSCAN_car * 377 * 10^(RFSCAN_gain_adjusted/10) / (4*PI*_range^2)))]; 
			}; 
		};   
	}forEach (player nearObjects ["Car", 2000]); 

	{ 
		if(alive _x)then{ 
			_dir = floor(player getDir _x);  
			_range = player distance _x; 
			
			if(_x != vehicle player)then{ 
				_signal set [floor(_dir*RFSCAN_devide/360),100 min ((_signal#_dir) + sqrt(RFSCAN_acoef * RFSCAN_tanks * 377 * 10^(RFSCAN_gain_adjusted/10) / (4*PI*_range^2)))]; 
			}; 
		};   
	}forEach ((player nearObjects ["Wheeled_APC_F", 2000]) + (player nearObjects ["Tank_F", 2000]) + (player nearObjects ["Air", 2000]));  
	
	RFSCAN_lastScan = _signal; 
	_signal 
}; 

RFSCAN_SHOWRESULT = {  
	params ["_signal"]; 
	[_signal] spawn 
	{ 
		params ["_signal"]; 
		private ["_display_close_EH"];
		disableSerialization; 

		_display = findDisplay 46 createDisplay "RscDisplayEmpty"; 
		
		showHUD false;
		_display_close_EH = _display displayAddEventHandler ["Unload", {
			showHUD true;
			_display displayRemoveEventHandler ["Unload", _display_close_EH];
			playsound "zoomout";
		}];		
		

		_bg = _display ctrlCreate ["RscBackground", -1];  
		_bg ctrlSetPosition [0,-0.01,1,0.71]; 
		_bg ctrlSetBackgroundColor [0.1,0.1,0.1,0.8];  
		_bg ctrlCommit 0; 

		_bg2 = _display ctrlCreate ["RscBackground", -1];  
		_bg2 ctrlSetPosition [0.05,0.05,0.9,0.51]; 
		_bg2 ctrlSetBackgroundColor [0.1,0.1,0.1,0.9];  
		_bg2 ctrlCommit 0;  
		
		_label3 = _display ctrlCreate ["RscText", -1];  
		_label3 ctrlSetPosition [0.45, 0.56-0.41,1,1]; 
		_label3 ctrlSettextColor [0.7,0.7,0,0.8];  
		_label3 ctrlSetText "Heading(Deg)"; 
		_label3 ctrlCommit 0;  
		
		//xgrid 
		for "_i" from 0 to RFSCAN_xgrid do {   
			_linex = _display ctrlCreate ["RscLine", -1];  
			_linex ctrlSetPosition [0.05+(0.9/RFSCAN_xgrid)*_i,0.56,0,-0.51]; 
			_linex ctrlSettextColor [.7,.7,0,.8];  
			_linex ctrlCommit 0;  
			
			_labelx = _display ctrlCreate ["RscText", -1];  
			_labelx ctrlSetPosition [0.05+(0.9/RFSCAN_xgrid)*_i-0.02, 0.56-0.45,1,1]; 
			_labelx ctrlSettextColor [0.7,0.7,0,0.8];  
			_labelx ctrlSetText str (_i/RFSCAN_xgrid*360); 
			_labelx ctrlCommit 0;   
		}; 
		
		//ygrid 
		for "_i" from 0 to RFSCAN_ygrid do {   
			_liney = _display ctrlCreate ["RscLine", -1];  
			_liney ctrlSetPosition [0.05,0.56-(0.51/RFSCAN_ygrid)*_i,0.9,0]; 
			_liney ctrlSettextColor [.7,.7,0,.8];  
			_liney ctrlCommit 0;     
			
			_labely = _display ctrlCreate ["RscText", -1];  
			_labely ctrlSetPosition [0.05-0.05,0.56-(0.51/RFSCAN_ygrid)*_i-0.5,1,1]; 
			_labely ctrlSettextColor [0.7,0.7,0,0.8];  
			_labely ctrlSetText str (_i/RFSCAN_ygrid*100); 
			_labely ctrlCommit 0;   
		};  
		
		_label1 = _display ctrlCreate ["RscText", -1];  
		_label1 ctrlSetPosition [0.8, -0.43,1,1]; 
		_label1 ctrlSettextColor [0.7,0.7,0,0.8];  
		_label1 ctrlSetText str formatText ["Gain : %1 dBi",RFSCAN_gain_adjusted]; 
		_label1 ctrlCommit 0;  

		_label2 = _display ctrlCreate ["RscText", -1];  
		_label2 ctrlSetPosition [0.8, -0.40,1,1]; 
		_label2 ctrlSettextColor [0.7,0.7,0,0.8];  
		_label2 ctrlSetText str formatText ["Noise : %1 dB",(2.81-RFSCAN_acoef)*5]; 
		_label2 ctrlCommit 0;      
		
		playsound "zoomin";
		
		for "_i" from 0 to RFSCAN_devide-1 do {   
			_lines = _display ctrlCreate ["RscLine", -1];  
			_lines ctrlSetPosition [0.05+(0.9/RFSCAN_devide)*_i,0.56-(_signal#_i)/100*0.51,0.9/RFSCAN_devide,-((_signal#(_i+1))-(_signal#_i))/100*0.51]; 
			_lines ctrlSettextColor [1,1,0,1];  
			_lines ctrlSetTooltip str _i+"º";
			_lines ctrlCommit 0; 
		};  
		
		
	}; 
}; 

RFSCAN_ADDACTION = {
	
	[ 
	player,          //target 
	"<t color='#00FFFF'>신호 수집장비 토글</t>",          //title 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa",           //idleIcon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_reviveMedic_ca.paa",           //progressIcon 
	"call RFSCAN_TOGGLE_CONDITION",          //conditionShow 
	"call RFSCAN_TOGGLE_CONDITION",          //conditionProgress 
	{if(RFSCAN_TOGGLE)then{hint "신호수집장비의 전원을 끄는중입니다."}else{hint "신호수집장비의 전원을 켜는중입니다."};},      //codeStart 
	{  },  //codeProgress 
	{
		RFSCAN_TOGGLE = !RFSCAN_TOGGLE;
		if(RFSCAN_TOGGLE)then{
			hint "신호수집장비의 전원이 켜졌습니다.";playsound "zoomin";
		}else{
			hint "신호수집장비의 전원이 꺼졌습니다.";playsound "zoomout";
		};
	},      //codeCompleted 
	{  },    //codeInterrupted 
	[],           //arguments 
	1.5,           //duration 
	-1.1,          //priority 
	false,          //removeCompleted 
	false          //showUnconscious 
	] call BIS_fnc_holdActionAdd; 
	
	[ 
	player,          //target 
	"<t color='#03adfc'>무선 신호 수집</t>",          //title 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",           //idleIcon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",           //progressIcon 
	"call RFSCAN_CONDITION",          //conditionShow 
	"call RFSCAN_CONDITION",          //conditionProgress 
	{ hint "무선신호를 수집하는중... 움직이지 마세요." },      //codeStart 
	{  },  //codeProgress 
	{_signal = call RFSCAN_SCANENEMY; [_signal] call RFSCAN_SHOWRESULT;},      //codeCompleted 
	{ hint "잡음으로 인해 무선신호를 수집하는데 실패하였습니다."; playsound "zoomout";},    //codeInterrupted 
	[],           //arguments 
	1,           //duration 
	-1,          //priority 
	false,          //removeCompleted 
	false          //showUnconscious 
	] call BIS_fnc_holdActionAdd; 

	[ 
	player,          //target 
	"<t color='#03adfc'>저장된 결과 확인</t>",          //title 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",           //idleIcon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",           //progressIcon 
	"call RFSCAN_REVIEW_CONDITION",          //conditionShow 
	"call RFSCAN_REVIEW_CONDITION",          //conditionProgress 
	{ hint "마지막으로 수집한 신호정보를 불러옵니다..." },      //codeStart 
	{  },  //codeProgress 
	{[RFSCAN_lastScan] call RFSCAN_SHOWRESULT;},      //codeCompleted 
	{ hint "불러오기가 취소되었습니다." },    //codeInterrupted 
	[],           //arguments 
	0.5,           //duration 
	-1,          //priority 
	false,          //removeCompleted 
	false          //showUnconscious 
	] call BIS_fnc_holdActionAdd; 		
	
	[ 
	player,          //target 
	"<t color='#03adfc'>저장된 결과 지우기</t>",          //title 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",           //idleIcon 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_revive_ca.paa",           //progressIcon 
	"call RFSCAN_REVIEW_CONDITION",          //conditionShow 
	"call RFSCAN_REVIEW_CONDITION",          //conditionProgress 
	{ hint "수집한 신호정보를 삭제합니다..." },      //codeStart 
	{  },  //codeProgress 
	{RFSCAN_lastScan = [];playsound "zoomout";},      //codeCompleted 
	{ hint "삭제가 취소되었습니다." },    //codeInterrupted 
	[],           //arguments 
	0.5,           //duration 
	-1,          //priority 
	false,          //removeCompleted 
	false          //showUnconscious 
	] call BIS_fnc_holdActionAdd; 	
}; 

[] call RFSCAN_ADDACTION; 
player addEventHandler ["Respawn", { 
	[] call RFSCAN_ADDACTION; 
}];

player createDiaryRecord ["Diary", ["RF SCAN SCRIPT", format ["<font size='15'>
RF SCAN SCRIPT made by SAKY<br/><br/>

기능<br/>
-주변의 모든 전파를 추적하여 가까운곳에 있는 사람, 차량을 추적할 수 있습니다.<br/><br/>

사용방법<br/>
-무전기가방을 착용하거나, 이동식 리스폰차량에 탑승한 상태에서 정지해있으면 신호수집 메뉴가 나타납니다.<br/>
-토글 액션을 눌러 신호수집 관련 메뉴가 뜨거나, 뜨지 않도록 설정할 수 있습니다.<br/>
-신호수집을 누르고 있으면 수집된 신호정보를 화면에 나타냅니다.<br/>
-그래프가 치솟는 지역은 사람이나 장비가 존재하는 곳입니다. 신호세기는 사람이 제일 약합니다.<br/>
-실질적으로 탐색가능한 범위는 100m 이내이나 잡음이 적은 경우 더 먼곳의 물체도 탐지될 수 있습니다.<br/>
-잡음수치는 주변에 건물이 많을수록 높아지고, 건물이 없으면 잡음이 감소합니다.<br/>
-전파탐지 감도는 이동식 리스폰 차량을 이용하는 경우가 무전기 가방을 이용하는 경우보다 좋습니다.<br/>
-적군의 라디오타워는 강력한 전파를 송출하기 때문에 해석할때 염두에 두어야 합니다.<br/>
</font>
"]]];