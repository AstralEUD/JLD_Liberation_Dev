// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Bobcat Crater Cleaner
// Version 1.2
// Date: 2014.11.04
// Author: Lala14
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

// init line:
// null = [] execVM "cratercleaner.sqf";
/*Definable Start*/
CCAbleToRepair = 0; 			//Allow the bobcat to repair destroyed vehicles, 1 = Yes, 0 = No
CCTimeToFixMultiplier = 0.5;	//Requires CCAbleToRepair = 1, Sleep Each second during repairs, default = 1
CCRepairMultipler = 0.01;		//Requires CCAbleToRepair = 1, CCTimeToFixMulitplier Second repair level, default = 0.1
CCRepairLimit = 0;			//Requires CCAbleToRepair = 1, Limit the Repair level to this, default = 0
/*Definable End*/

/*Script Start*/

if (isDedicated) exitWith {};

waitUntil {!isNull player};

LALA_fnc_Crater_Check = {
	_unit = _this select 0;
	_veh = vehicle _unit;

	if !(_veh isKindOf "B_APC_Tracked_01_CRV_F") exitWith {false;};

	_crater = nearestObjects [_veh,["CraterLong"],20];

	_return = (count _crater > 0);
	_return;
};

Lala_fnc_Dead_Vehicle_Check = {
	_unit = _this select 0;
	_veh = vehicle _unit;

	if !(_veh isKindOf "B_APC_Tracked_01_CRV_F") exitWith {false;};

	_nearvehicles = nearestObjects [_veh,["LandVehicle","Air","ReammoBox_F","Man"],20];
	_nearvehicles = _nearvehicles - [_veh];
	_nearestvehicle = _nearvehicles select 0;

	_deletevehactionname = "Test";

	if (CCAbleToRepair == 0) then {
		_deletevehactionname = format ["<t color ='#FF0000'>잔해 없에기 %1</t>", getText (configFile >> 'cfgVehicles' >> typeOf _nearestvehicle >> 'displayName')];
	} else {
		_deletevehactionname = format ["<t color ='#FF0000'>파괴된 차량 복구하기 %1</t>", getText (configFile >> 'cfgVehicles' >> typeOf _nearestvehicle >> 'displayName')];
	};
	_unit setUserActionText [DeadVehAddAction,_deletevehactionname];

	_return = ((!alive _nearestvehicle OR damage _nearestvehicle >= 1));
	_return;
};

Lala_fnc_Crater_Remover = {
	_unit = _this select 0;
	_veh = vehicle _unit;

	if (_veh == _unit) exitWith {hint "Get into a Bobcat!";};

	_crater = nearestObjects [_veh,["CraterLong"],20];

	{
		deleteVehicle _x;
		_veh vehicleChat format ["Removing %1",getText (configFile >> 'cfgVehicles' >> typeOf _x >> 'displayName')];
		sleep 0.1;
	}forEach _crater;
};

Lala_fnc_Dead_Vehicle_Remover = {
	_unit = _this select 0;
	_veh = vehicle _unit;

	if (_veh == _unit) exitWith {hint "Get into a Bobcat!";};

	_nearvehicles = nearestObjects [_veh,["LandVehicle","Air","ReammoBox_F","Man"],20];
	_nearvehicles = _nearvehicles - [_veh];
	_nearestvehicle = _nearvehicles select 0;

	if (damage _nearestvehicle >= 1 || !alive _nearestvehicle ) then {
		deleteVehicle _nearestvehicle;
		_veh vehicleChat format ["Removing Destroyed %1",getText (configFile >> 'cfgVehicles' >> typeOf _nearestvehicle >> 'displayName')];
	};
};

Lala_fnc_Fix_Dead_Vehicle = {
	_unit = _this select 0;
	_veh = vehicle _unit;

	if (_veh == _unit) exitWith {hint "Get into a Bobcat!";};

	_nearvehicles = nearestObjects [_veh,["LandVehicle","Air"],20];
	_nearvehicles = _nearvehicles - [_veh];
	_nearestvehicle = _nearvehicles select 0;
	_oldname = name _nearestvehicle;
	_oldvarname = vehicleVarName _nearestvehicle;
	_oldpos = getPosVisual _nearestvehicle;
	_oldtype = typeof _nearestvehicle;
	_olddir = getDir _nearestvehicle;
	if (_oldname isEqualTo "Error: No vehicle") then {_oldname = _oldveh};
	deleteVehicle _nearestvehicle;
	sleep 0.5;
	_oldname =	_oldtype createVehicle _oldpos;
	_oldname setPos _oldpos;
	_oldname setDir _olddir;
	if (!isNil {_oldvarname}) then { _oldname setVehicleVarName _oldvarname; };
	_oldname setDamage 0.9;

	for [{_x=0.95},{_x>=CCRepairLimit},{_x=_x-CCRepairMultipler}] do {
		_oldname setDamage _x;
		_veh vehicleChat format ["Repairing %1 - %2%3",getText (configFile >> 'cfgVehicles' >> typeOf _oldname >> 'displayName'),damage _oldname * 100,'%'];
		sleep CCTimeToFixMultiplier;
	};
	if (CCRepairLimit == 0) then {_oldname setDamage 0;};
	_oldname setFuel 1;
	_veh vehicleChat format ["Repairing %1 - %2%3",getText (configFile >> 'cfgVehicles' >> typeOf _oldname >> 'displayName'),damage _oldname * 100,'%'];
	_veh vehicleChat format ["Repairs complete on %1",getText (configFile >> 'cfgVehicles' >> typeOf _oldname >> 'displayName')];
};

LALA_fnc_AddAction_Crater_Cleaner = {
	_player = player;
	if (isNil {_player getVariable "CraterActionAdded"}) then {
		_player addAction ["<t color ='#FF0000'>Remove Crater/s</t>",{[(_this select 0)] spawn LALA_fnc_Crater_Remover},"",7,false,true,"",'[_this] call LALA_fnc_Crater_Check'];
		DeadVehAddAction = _player addAction ["<t color ='#FF0000'>Remove Dead Vehicle</t>",{if (CCAbleToRepair == 0) then {[(_this select 0)] spawn Lala_fnc_Dead_Vehicle_Remover} else {[(_this select 0)] spawn Lala_fnc_Fix_Dead_Vehicle};},"",7,false,true,"",'[_this] call Lala_fnc_Dead_Vehicle_Check'];
		_player setVariable ["CraterActionAdded",true,true];
		_player addEventHandler ["Respawn",{(_this select 0) setVariable ["CraterActionAdded",nil,true]; [] spawn LALA_fnc_AddAction_Crater_Cleaner;}];
	};
};

systemChat "잔해삭제 스크립트 활성화";

[] spawn LALA_fnc_AddAction_Crater_Cleaner;