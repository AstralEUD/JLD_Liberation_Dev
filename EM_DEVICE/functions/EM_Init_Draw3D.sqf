//INFANTRY
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_O_Inf = 0;
		_EM_Signal_O_Inf = 0;
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{			
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(AGLToASL unitAimPosition _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalInc = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower);
			_EM_Signal_O_Inf = _EM_Signal_O_Inf + _signalInc;
			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, unitAimPositionVisual _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], unitAimPositionVisual _x, 0, 0, 0, str round(_signalInc call EM_Log), 1, 0.05, "PuristaMedium"];
			};			
		}forEach((player nearEntities["CAManBase", 1000]) - [player]);
		EM_Signal_O_Inf = _EM_Signal_O_Inf call EM_Log;
	};
}];

//VEHICLES
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_O_Veh = 0;
		_EM_Signal_O_Veh = 0;
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{			
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(AGLToASL unitAimPosition _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalInc = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower);
			_EM_Signal_O_Veh = _EM_Signal_O_Veh + _signalInc;
			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, unitAimPositionVisual _x, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], unitAimPositionVisual _x, 0, 0, 0, str round(_signalInc call EM_Log), 1, 0.05, "PuristaMedium"];
			};			
		}forEach((player nearEntities["LandVehicle", 3000]));
		EM_Signal_O_Veh = _EM_Signal_O_Veh call EM_Log;
	};
}];

//MINES
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")	then{
		_EM_Signal_Mine = 0;
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo(getPosASL _x));
			_distance = player distance _x;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalInc = ([ _distance, EM_Power_Inf, _cosine ] call EM_CalcPower);
			_EM_Signal_Mine = _EM_Signal_Mine + _signalInc;
			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLtoAGL _gunPosASL, ASLToAGL getPosASLVisual _x, [ _cosine, 0, 1 - _cosine, 1 ]];
				drawIcon3D["", [ _cosine, 0, 1 - _cosine, 1 ], ASLToAGL getPosASLVisual _x, 0, 0, 0, str round(_signalInc call EM_Log), 1, 0.05, "PuristaMedium"];
			};
		}forEach allMines;
		EM_Signal_Mine = _EM_Signal_Mine call EM_Log;
	};
}];

//Radio Towers
addMissionEventHandler ["Draw3D", {
	if (currentWeapon player == "hgun_esd_01_F")then{
		_EM_Signal_Radio = [];
		_gunPosASL = player modelToWorldVisualWorld (player selectionPosition "proxy:\a3\characters_f\proxies\pistol.001");
		_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
		{
			_towerLoc = _x#0;
			_towerHealth = 1-(getDammage (_x#1));
			_targetDir = vectorNormalized(_gunPosASL vectorFromTo getPos _towerLoc);
			_distance = player distance getPos _towerLoc;
			_cosine = (_weaponDir vectorDotProduct _targetDir);
			_signalPowerLog = (_towerHealth * ([ _distance, (_towerLoc getVariable "EM_Values")#1, _cosine ] call EM_CalcPower)) call EM_Log;
			
			_EM_Signal_Radio append [(_towerLoc getVariable "EM_Values")#0, _signalPowerLog];
			
			if(EM_Debug)then{
				_cosine = (_cosine call EM_Gain) / EM_Gain_Max;
				drawLine3D[ASLToAGL _gunPosASL, ASLToAGL getPos _towerLoc, [ _cosine, 1 - _cosine, 0, 1 ]];
				drawIcon3D["", [ _cosine, 1 - _cosine, 0, 1 ], ASLToAGL getPos _towerLoc, 0, 0, 0, str round(_signalPowerLog), 1, 0.05, "PuristaMedium"];
			};
		}forEach EM_Radios;
		EM_Signal_Radio = _EM_Signal_Radio;
	};
}];