SeatSwitching = false;

groupTags = ["[보병]", "[미사용1]", "[미사용2]", "[특수]", "[기갑]", "[미사용3]", "[미사용4]", "[전투]", "[기동]"];

groupType = {
	params ["_player"];
	_type = -1; 
	{
		if(typeName _player == "GROUP")then{
			if(groupId _player find _x != -1)then{_type = _forEachIndex};
		} else {
			if(groupId group _player find _x != -1)then{_type = _forEachIndex};
		};
	}foreach groupTags;
	_type
};

groundSquads = {
	_groundSquads = 0;
	{
		if(!(_x call groupType in [-1,7,8]))then{_groundSquads=_groundSquads+1};
	}foreach allGroups;
	_groundSquads
};

allowedVehicles = [
[], //0보병
[], //1차량화 - 사라짐
[], //2기계화
[], //3특수
[], //4기갑
["MBT_01_mlrs_base_F", "MBT_01_arty_base_F", "Truck_02_MRL_base_F", "MBT_02_arty_base_F"], //5포병 - 사라짐
[], //6해상 X
[], //7전투 
[]//8기동
];

isAllowedGetIn = {
	params ["_groupType", "_vehicle"];
	_isAllowedGetIn = false;

	if ((leader group player == player) && (count units player > 4)) then {	_isAllowedGetIn = true;
	} else {
		switch (_groupType)
		do {
		case 0: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "C_Heli_Light_01_civil_F" || _vehicle isKindOf "Car" && !(_vehicle isKindOf "Wheeled_APC_F") || _vehicle isKindOf "Ship" && !(_vehicle isKindOf "MBT_01_mlrs_base_F" || _vehicle isKindOf "MBT_01_arty_base_F" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "MBT_02_arty_base_F"))
				then {
					_isAllowedGetIn = true;
				};
			}; //0보병
		case 1: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "Car" && !(_vehicle isKindOf "Wheeled_APC_F"))
				then {
					_isAllowedGetIn = false;
				};
			}; //1차량화 사라짐
		case 2: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "Wheeled_APC_F")
				then {
					_isAllowedGetIn = true;
				};
			}; //2기계화 사라짐
		case 3: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "C_Heli_Light_01_civil_F" || _vehicle isKindOf "Car" && !(_vehicle isKindOf "MBT_01_mlrs_base_F" || _vehicle isKindOf "MBT_01_arty_base_F" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "MBT_02_arty_base_F"))
				then {
					_isAllowedGetIn = true;
				};
			}; //3특수
		case 4: {
				if (_vehicle isKindOf "Tank" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "Wheeled_APC_F")
				then {
					_isAllowedGetIn = true;
				};
			}; //4기갑
		case 5: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "Truck_F" || _vehicle isKindOf "MBT_01_mlrs_base_F" || _vehicle isKindOf "MBT_01_arty_base_F" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "MBT_02_arty_base_F")
				then {
					_isAllowedGetIn = false;
				};
			}; //5포병 사라짐
		case 6: {
				if (_vehicle isKindOf "Ship")
				then {
					_isAllowedGetIn = true;
				};
			}; //6해상 사라짐
		case 7: {
				if (_vehicle isKindOf "Air" || _vehicle isKindOf "Truck_F" || ( typeOf _vehicle == "B_APC_Tracked_01_CRV_F") && !(_vehicle isKindOf "MBT_01_mlrs_base_F" || _vehicle isKindOf "MBT_01_arty_base_F" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "MBT_02_arty_base_F"))
				then {
					if(typeOf player == "B_Pilot_F")then{_isAllowedGetIn = true}else{systemChat "항공장비를 조작하기 위해서는 조종사 슬롯으로 접속해야 합니다."};
				};
			}; //7전투
		case 8: {
				if (_vehicle isKindOf "Air" || _vehicle isKindOf "Truck_F" || ( typeOf _vehicle == "B_APC_Tracked_01_CRV_F") && !(_vehicle isKindOf "MBT_01_mlrs_base_F" || _vehicle isKindOf "MBT_01_arty_base_F" || _vehicle isKindOf "Truck_02_MRL_base_F" || _vehicle isKindOf "MBT_02_arty_base_F"))
				then {
					if(typeOf player == "B_Pilot_F")then{_isAllowedGetIn = true}else{systemChat "항공장비를 조작하기 위해서는 조종사 슬롯으로 접속해야 합니다."};
				};
			}; //8기동
			default {
				_isAllowedGetIn = false;
			};
		};
	};
	_isAllowedGetIn
};

player addEventHandler["GetInMan", {
	params["_unit", "_role", "_vehicle", "_turret"];	

	if ( !((_vehicle isKindOf "ParachuteBase") || ((fullCrew vehicle player)#((fullCrew vehicle player) findIf {_x#0==player})#4)) )
	then {
		_cargos = [];
		{_cargos pushback _x#0}forEach fullCrew [vehicle player, "cargo"];
		if (!(player in _cargos))
		then {
			if (_unit call groupType == -1)	then {
				moveOut _unit;
				unassignVehicle player;
				hintSilent "장비를 조작하기 위해서는 적절한 분대태그를 가진 그룹에 가입해야 합니다. U키를 눌러 적절한 분대에 가입하기 바랍니다.";
			} else {
				if ((leader group _unit == _unit) && (count units _unit > 3)) then {	
					[_unit] spawn {								
						params["_unit"];
						_result = [format["4인이상 분대장은 분대태그를 수정하지 않고 장비탑승이 가능합니다. 이 기능은 불가피한 상황에서 임시로 장비를 운용해야 하는 경우에만 사용하시기 바랍니다.<br/><br/>분대원은 여전히 현재 장비의 객석 외에는 탑승이 불가능할 수 있습니다.<br/><br/>지속적으로 분대유형을 무시한 장비 운용시 킥, 밴될 수 있습니다."]
						,"임시 장비사용 권한"
						,"동의합니다."
						,"동의하지 않습니다."] call BIS_fnc_guiMessage;
						if(!_result)then{
							moveOut _unit;
							unassignVehicle player;
							hintSilent "현재 분대태그로는 사용할 수 없는 좌석입니다. 객석에 탑승하시기 바랍니다."; 
							["<t color='#ff0000' size = '.55' >현재 분대태그로는 사용할 수 없는 좌석입니다. 객석에 탑승하시기 바랍니다.</t>"] spawn BIS_fnc_dynamicText;
						};
					};		
				}else{						
					if (!([_unit call groupType, _vehicle] call isAllowedGetIn)) then {										
						moveOut _unit;
						unassignVehicle player;
						hintSilent "현재 분대태그로는 사용할 수 없는 좌석입니다. 객석에 탑승하시기 바랍니다."; 
						["<t color='#ff0000' size = '.55' >현재 분대태그로는 사용할 수 없는 좌석입니다. 객석에 탑승하시기 바랍니다.</t>"] spawn BIS_fnc_dynamicText;
					};
				};	
			};
		};
	};
}
];


isSwitchAllowed = {				
	_isSwitchAllowed = true;	
	if(vehicle player != player)then{
		if (player call groupType == -1)
		then {
			_isSwitchAllowed = false;
		}
		else {
			if (([player call groupType, vehicle player] call isAllowedGetIn))
			then {
				_isSwitchAllowed = true;
			}else{_isSwitchAllowed = false;};
		};	
	};
	_isSwitchAllowed
};	

[] spawn {
	while{true}do{
	_groupType = (player call groupType);
		if( (_groupType != 3) && (!isNull getConnectedUAV player) ) then {
			player connectTerminalToUAV objNull;		
			["<t color='#ff0000' size = '0.55' >무인기는 [특수]분대만 사용 가능합니다. 연결이 해제되었습니다.</t>"] spawn BIS_fnc_dynamicText;
			systemChat "무인기는 [특수]분대만 사용 가능합니다. 연결이 해제되었습니다.";
		};		
		if( (_groupType in [7,8]) && (typeOf player != "B_Pilot_F") ) then {
			["RemoveGroupMember", [group player, player]] call BIS_fnc_dynamicGroups;
			[player] join grpNull;
			["<t color='#ff0000' size = '0.55' >[전투], [기동]분대에 가입하기 위해서는 조종사로 접속해야 합니다.</t>"] spawn BIS_fnc_dynamicText;			
			systemChat "[전투], [기동]분대에 가입하기 위해서는 조종사로 접속해야 합니다.";
		};		
		if( (_groupType in [0,1,2,3,4,5,6]) && (typeOf player == "B_Pilot_F") ) then {
			["RemoveGroupMember", [group player, player]] call BIS_fnc_dynamicGroups;
			[player] join grpNull;
			["<t color='#ff0000' size = '0.55' >조종사는 [전투], [기동]분대에만 가입가능합니다.</t>"] spawn BIS_fnc_dynamicText;
			systemChat "조종사는 [전투], [기동]분대에만 가입가능합니다.";
		};		
		if(call isSwitchAllowed)then{
			inGameUISetEventHandler ["Action", ""];	
		}else{	
			inGameUISetEventHandler ["Action", "
	if (_this select 3 in ['MoveToCommander','MoveToDriver','MoveToGunner','MoveToPilot','MoveToTurret']) then {
		systemChat '분대태그가 일치하지 않는 장비 내에서의 이동은 불가능합니다.'; 
		[""<t color='#ff0000' size = '0.55' >분대태그가 일치하지 않는 장비내애서의 이동은 불가능합니다.</t>""] spawn BIS_fnc_dynamicText;
		true
	}"];
		};
		sleep 0.1;
	};
};

[] spawn {
	while{true}do{
		sleep 10;
		if(player call groupType == -1) then {
			["<t color='#ff0000' size = '0.55' >적절한 분대태그를 사용하지 않아 모든 기능이 제한됩니다.<br/>U키를 눌러 적절한 분대태그를 가진 분대에 가입하거나 생성하십시오.<br/>자세한 정보는 M키를 눌러 화면 좌측상단의 서버 규정을 참조하시기 바랍니다.</t>",-1,-1,6] spawn BIS_fnc_dynamicText;
		};
	};
};

PilotRestriction = { 	
	params ["_minSquads"];	
	
	waitUntil{!isNull findDisplay 46};
	waitUntil{!isNil "welcomeFinished"};	
	waitUntil{welcomeFinished};	
	
	[_minSquads] spawn {	
		params ["_minSquads"];	
		_result = [format["
	조종사 슬롯으로 접속하였습니다. <br/>
	[전투], [기동]분대에 가입하여 항공기를 사용할 수 있습니다.<br/><br/>	
	현재 지상분대 수는 %2분대로, 지상분대 수가 %1분대 아래로 떨어지는 경우 자동으로 로비로 돌아갑니다.<br/><br/>	
	-지나친 자원 낭비나 무단 CAS등은 서버룰에 의거하여 킥, 밴 조치될 수 있으니 책임감있는 플레이 부탁드립니다.<br/>
	-조종사 보직으로 플레이 하는 동안 다른 사유가 없을경우 수송 업무를 최우선으로 수행해야 합니다. <br/>(예:제공권확보가 우선되어야 하는 경우 제외)<br/>
	-조종사는 지상분대 없이 점령임무를 단독으로 수행할 수 없습니다. '방어임무'나 '초계비행'은 단독으로 수행할 수 있습니다.<br/>
	-아울러 조종사 보직을 유지한 상태에서 지상분대 플레이를 엄격하게 금지합니다. 반드시 소총수, 공병, 전투의무병 보직으로 전환 후 플레이 하시기 바랍니다.<br/><br/>	
	-조종사는 관련된 규정을 모두 숙지하고, 서버룰을 위반한 것이 적발되는 경우 처벌될 수 있다는 것에 동의한 것으로 간주됩니다. 이에 동의하지 않는 경우 다른 보직으로 플레이 해주시기 바랍니다.<br/><br/>
	<t align='center'>플레이어 STEAM ID : <a href=""http://steamcommunity.com/profiles/%4"">%3</a><br/>
	플레이어 UID : %4</t>
	",_minSquads,call groundSquads,profileNameSteam, getPlayerUID player]
		,"조종사 플레이 규정"
		,"동의합니다."
		,"동의하지 않습니다."] call BIS_fnc_guiMessage;
		if(!_result)then{endMission "End4"};
	};
	
	/*
	"=PILOT RULES=" hintC [
	str formatText ["조종사 슬롯으로 접속하였습니다. [전투], [기동]분대에 가입하여 항공기를 사용할 수 있습니다."],	
	str formatText ["이 슬롯으로 플레이하기 위해선 최소 %1개의 지상분대가 있어야 합니다.",_minSquads,call groundSquads],
	str formatText ["현재 지상분대 수는 %2분대로, 지상분대 수가 %1분대 아래로 떨어지는 경우 자동으로 로비로 돌아갑니다.",_minSquads,call groundSquads],
	str formatText ["지나친 자원 낭비나 무단 CAS등은 서버룰에 의거하여 킥, 밴 조치될 수 있으니 책임감있는 플레이 부탁드립니다."],	
	str formatText ["조종사 보직으로 플레이 하는 동안 다른 사유가 없을경우 수송 업무를 최우선으로 수행해야 합니다. (제공권확보가 우선되어야 하는 경우 제외)"],	
	str formatText ["아울러 조종사 보직을 유지한 상태에서 지상분대 플레이를 엄격하게 금지합니다. 반드시 소총수, 공병, 전투의무병 보직으로 전환 후 플레이 하시기 바랍니다."],
	str formatText ["조종사는 관련된 규정을 모두 숙지하고, 서버룰을 위반한 것이 적발되는 경우 처벌될 수 있다는 것에 동의한 것으로 간주됩니다. 이에 동의하지 않는 경우 다른 보직으로 플레이 해주시기 바랍니다."]
	];
	*/
	
	while{true}do{
		sleep 1; 
		if(call groundSquads < _minSquads)then{
			if(vehicle player == player) then {
				"No more pilots!" hintC [
				str formatText ["이 슬롯으로 플레이하기 위해선 최소 %1개의 지상분대가 있어야 합니다.",_minSquads,call groundSquads],
				str formatText ["현재 지상분대 수는 %2분대로, 최소 필요 분대수를 충족하지 못해 대기실로 돌아갑니다.",_minSquads,call groundSquads],
				"지상분대로 플레이해주시면 감사드리겠습니다.",
				"ESC를 눌러 이 창을 닫고 대기실로 돌아갑니다."
				];
				endMission "End3";
			}else{
				hint formatText ["이 슬롯으로 플레이하기 위해선 최소 %1분대의 지상분대가 있어야 합니다.현재 지상분대 수는 %2분대입니다.하차후에 자동으로 로비로 돌아갑니다.",_minSquads,call groundSquads];
			};
		};
	};
};

if(typeOf player == "B_Pilot_F") then {
	waitUntil{!isNull findDisplay 46};
	sleep 3;
	systemChat str formatText ["지상분대가 %1분대 미만이 되면 자동으로 대기실로 이동합니다. 현재 지상분대 수는 %2분대입니다.",({typeOf _x == "B_Pilot_F"} count allPlayers),call groundSquads];
	_null = [({typeOf _x == "B_Pilot_F"} count allPlayers)] spawn pilotRestriction;	
};

systemChat "분대태그 시스템 활성화";