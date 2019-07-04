SeatSwitching = false;

groupTags = ["[보병]", "[차량화]", "[기계화]", "[특수]", "[기갑]", "[포병]", "[해상]", "[전투]", "[기동]"];

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
[], //6해상
[], //7전투
[]//8기동
];

isAllowedGetIn = {
	params ["_groupType", "_vehicle"];
	_isAllowedGetIn = false;

	if ((leader group player == player) && (count units player > 2)) then {	_isAllowedGetIn = true;
	} else {
		switch (_groupType)
		do {
		case 0: {
				if (_vehicle isKindOf "StaticWeapon" || _vehicle isKindOf "Car" && !(_vehicle isKindOf "Wheeled_APC_F"))
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
			}; //2기계화
		case 3: {
				if (_vehicle isKindOf "StaticWeapon")
				then {
					_isAllowedGetIn = true;
				};
			}; //3특수
		case 4: {
				if (_vehicle isKindOf "Tank" || _vehicle isKindOf "Truck_02_MRL_base_F")
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
			}; //6해상
		case 7: {
				if (_vehicle isKindOf "Air" || _vehicle isKindOf "Truck_F" || ( typeOf _vehicle == "B_APC_Tracked_01_CRV_F"))
				then {
					if(typeOf player == "B_Pilot_F")then{_isAllowedGetIn = true}else{systemChat "항공장비를 조작하기 위해서는 조종사 슬롯으로 접속해야 합니다."};
				};
			}; //7전투
		case 8: {
				if (_vehicle isKindOf "Air" || _vehicle isKindOf "Truck_F" || ( typeOf _vehicle == "B_APC_Tracked_01_CRV_F"))
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
	if(!SeatSwitching)then{
		if (!(_vehicle isKindOf "ParachuteBase"))
		then {
			_cargos = [];
			{_cargos pushback _x#0}forEach fullCrew [vehicle player, "cargo"];
			if (!(player in _cargos))
			then {
				if (_unit call groupType == -1)
				then {
					moveOut _unit;
					unassignVehicle player;
					hintSilent "장비를 조작하기 위해서는 적절한 분대태그를 가진 그룹에 가입해야 합니다. U키를 눌러 적절한 분대에 가입하시기 바랍니다.";
				}
				else {
					if (!([_unit call groupType, _vehicle] call isAllowedGetIn))
					then {
						moveOut _unit;
						unassignVehicle player;
						hintSilent "가입하신 분대에서 사용할 수 없는 장비입니다. 서버 규정을 확인하시기 바랍니다.";
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
		if(call isSwitchAllowed)then{
			inGameUISetEventHandler ["Action", ""];	
		}else{	
			inGameUISetEventHandler ["Action", "
	if (_this select 3 in ['MoveToCommander','MoveToDriver','MoveToGunner','MoveToPilot','MoveToTurret']) then {
		hintSilent '적절한 분대태그를 사용하지 않아 해당 좌석을 이용할 수 없습니다.'; 
		true
	}"];
		};
		sleep 0.1;
	};
};




/*
player addEventHandler["SeatSwitchedMan", {
	params["_unit1", "_unit2", "_vehicle"];
	if (!(_vehicle isKindOf "ParachuteBase"))
	then {	
		_cargos = [];
		{_cargos pushback _x#0}forEach fullCrew [vehicle player, "cargo"];
		if (!(player in _cargos))
		then {
			SeatSwitching = true;
			if ((_unit1 call groupType == -1))
			then {
				moveOut _unit1;
				_unit1 assignAsCargo _vehicle;
				//_unit1 moveInCargo _vehicle;				
				[[_unit1, _vehicle],{params ["_unit1", "_vehicle"];_unit1 moveInCargo _vehicle;}] remoteExec ["call", _vehicle];				
				hintSilent "장비를 조작하기 위해서는 적절한 분대태그를 가진 그룹에 가입해야 합니다. U키를 눌러 적절한 분대에 가입하시기 바랍니다.";
			}
			else {
				if (!([_unit1 call groupType, _vehicle] call isAllowedGetIn))
				then {
					moveOut _unit1;
					_unit1 assignAsCargo _vehicle;
					[[_unit1, _vehicle],{params ["_unit1", "_vehicle"];_unit1 moveInCargo _vehicle;}] remoteExec ["call", _vehicle];
					hintSilent "가입하신 분대에서 사용할 수 없는 장비입니다. 서버 규정을 확인하시기 바랍니다.";
				};
			};
			SeatSwitching = false;
		};
	};
}
];
*/


PilotRestriction = { 	
	params ["_minSquads"];
	while{true}do{
		sleep 1; 
		if(call groundSquads < _minSquads)then{
			if(vehicle player == player) then {
				//hint formatText ["현재 지상분대수가 부족하여 하차후에 자동으로 로비로 나갑니다. 지상군으로 플레이 해주시기 바랍니다. 이 슬롯으로 플레이하기 위해선 최소 %1개의 지상분대가 있어야 합니다. 현재 지상분대 수는 %2분대입니다.",_minSquads,call groundSquads];
				endMission "End3";
			}else{
				hint formatText ["이 슬롯으로 플레이하기 위해선 최소 %1분대의 지상분대가 있어야 합니다.현재 지상분대 수는 %2분대입니다.하차후에 자동으로 로비로 돌아갑니다.",_minSquads,call groundSquads];
			};
		};
	};
};


if(typeOf player == "B_Pilot_F") then {_null = [{typeOf _x == "B_Pilot_F"} count allPlayers] spawn pilotRestriction;};

systemChat "분대별 장비잠금 스크립트 활성화";