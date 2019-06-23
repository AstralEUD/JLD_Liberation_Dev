groupTags = ["[보병]", "[차량화]", "[기계화]", "[특수]", "[기갑]", "[포병]", "[해상]", "[전투]", "[기동]"];

groupType = {
	params ["_player"];
	_type = -1; {
		if (groupId group _player find _x != -1)
		then {
			_type = groupTags find _x;
		};
	}
	foreach groupTags;
	_type
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

	if ((leader group player == player) && (count units player > 2))
	then {
		_isAllowedGetIn = true;
	}
	else {
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
					_isAllowedGetIn = true;
				};
			}; //7전투
		case 8: {
				if (_vehicle isKindOf "Air" || _vehicle isKindOf "Truck_F" || ( typeOf _vehicle == "B_APC_Tracked_01_CRV_F"))
				then {
					_isAllowedGetIn = true;
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
	if (!(_vehicle isKindOf "ParachuteBase"))
	then {
		if (_role in ["driver", "gunner"])
		then {
			if (_unit call groupType == -1)
			then {
				moveOut _unit;
				hintSilent "장비를 조작하기 위해서는 적절한 분대태그를 가진 그룹에 가입해야 합니다. U키를 눌러 적절한 분대에 가입하시기 바랍니다.";
			}
			else {
				if (!([_unit call groupType, _vehicle] call isAllowedGetIn))
				then {
					moveOut _unit;
					hintSilent "가입하신 분대에서 사용할 수 없는 장비입니다. 서버 규정을 확인하시기 바랍니다.";
				};
			};
		};
	};
}
];

player addEventHandler["SeatSwitchedMan", {
	params["_unit1", "_unit2", "_vehicle"];
	_role = assignedVehicleRole player select 0;
	if (!(_vehicle isKindOf "ParachuteBase"))
	then {
		if (_role in ["Driver", "driver", "Turret", "turret"])
		then {
			if ((_unit1 call groupType == -1))
			then {
				moveOut _unit1;
				hintSilent "장비를 조작하기 위해서는 적절한 분대태그를 가진 그룹에 가입해야 합니다. U키를 눌러 적절한 분대에 가입하시기 바랍니다.";
			}
			else {
				if (!([_unit1 call groupType, _vehicle] call isAllowedGetIn))
				then {
					moveOut _unit1;
					hintSilent "가입하신 분대에서 사용할 수 없는 장비입니다. 서버 규정을 확인하시기 바랍니다.";
				};
			};
		};
	};
}
];

PilotRestriction = { 
	params ["_rnum"];
	private ["_player","_grps"]; 
	_grps=0; 
	while{true}do{
		sleep 5;
		{ 
			_type = -1;  
			_group = _x; 
			{if (groupId _group find _x != -1) then {_type = groupTags find _x};}foreach groupTags; 
			if (_type in [0,1,2,3,4,5,6]) then {_grps=_grps+1}; 
		}foreach allGroups; 
		if(_grps<=_rnum)then{
			if(vehicle player == player) then {
				endMission "End3";
			}else{
				hint "현재 지상분대수가 부족하여 하차후에 자동으로 로비로 나갑니다. 지상군으로 플레이 해주시기 바랍니다.";
			};
		};
	};
	_grps 
};

{
	if(player == _x) then {[_forEachIndex+1] spawn pilotRestriction;};
	}forEach [pilot1,pilot2,pilot3,pilot4,pilot5,pilot6,pilot7,pilot8]

systemChat "분대별 장비잠금 스크립트 활성화";