player addEventHandler ["InventoryOpened", {
	[] spawn {
		waitUntil{!isNull (findDisplay 602)};
		call init_Repack_GUI;	
		
		mags_toRepack = [];
		
		gui_listFrom ctrlAddEventHandler ["LBDblClick", {
			params ["_control", "_selectedIndex"];		
			call calculate_Mags;		
		}];
		
		gui_BtnReset ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			call init_listFrom;
		}];	
		
		gui_BtnOK ctrlAddEventHandler ["ButtonClick", {
			params ["_control"];
			{
				player removeMagazines _x#0;
			}forEach mags_toReAdd;			
			{
				switch (_x#2) do {
				case "Uniform"	: {(uniformContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
				case "Vest" 	: {(vestContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
				case "Backpack"	: {(backpackContainer player) addMagazineAmmoCargo [_x#0, 1, _x#1];};
					default {systemChat str _x;};
				};
			}forEach mags_toReAdd;			
			mags_toReAdd = [];
			call init_listFrom;
		}];
		
		mags_previousList = magazinesAmmoFull player;
		(findDisplay 602) displayAddEventHandler ["MouseMoving",{
			{
				if(_x#0 != (mags_previousList#_forEachIndex)#0) exitWith {
					call init_listFrom; 
				};
			}forEach (magazinesAmmoFull player);		
			mags_previousList = magazinesAmmoFull player;
		}];
		
		call init_listFrom;
	};
}];

init_listFrom={	
	lbClear gui_listFrom;	
	lbClear gui_listTo;		
	gui_BtnOK ctrlEnable false;
	mags_toRepack = [];
	
	_ammos = [];	
	{
		if(_x#4 in ["Uniform","Vest","Backpack"])then{
			_ammos pushBack [getText (configfile >> "CfgMagazines" >> _x#0 >> "displayName"),_x];
		};
	}forEach (magazinesAmmoFull player);
	
	{			
		_magInfo = _x#1;
		_magInfo pushBack getText (configfile >> "CfgMagazines" >> (_x#1)#0 >> "ammo");
		_magInfo pushBack getNumber (configfile >> "CfgMagazines" >> (_x#1)#0 >> "count");
		_magInfo pushBack str formatText ["%1 [%2/%3]",_x#0,_magInfo#1,_magInfo#6];
		
		if(_magInfo#1 < _magInfo#6) then {
			gui_listFrom lbAdd _magInfo#7;
			gui_listFrom lbSetData [(lbSize gui_listFrom)-1, str _magInfo];
		};
	}forEach _ammos;	
};

init_Repack_GUI = {
	gui_back = findDisplay 602 ctrlCreate["RscText", -1];
	gui_back ctrlSetPosition [0.267969 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.464062 * safezoneW,0.176 * safezoneH];
	gui_back ctrlSetBackgroundColor [0.05,0.05,0.05,0.7];
	gui_back ctrlCommit 0;
	
	gui_tilte0 = findDisplay 602 ctrlCreate["RscText", -1];
	gui_tilte0 ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
	gui_tilte0 ctrlSetText "재포장할 탄약 선택";
	gui_tilte0 ctrlCommit 0;
	
	gui_tilte1 = findDisplay 602 ctrlCreate["RscText", -1];
	gui_tilte1 ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.764 * safezoneH + safezoneY,0.103125 * safezoneW,0.033 * safezoneH];	
	gui_tilte1 ctrlSetText "포장 후 결과";
	gui_tilte1 ctrlCommit 0;
	
	gui_listFrom = findDisplay 602 ctrlCreate["RscListBox", 8500];
	gui_listFrom ctrlSetPosition [0.273125 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
	gui_listFrom ctrlCommit 0;
	
	gui_listTo = findDisplay 602 ctrlCreate["RscListBox", 8500];
	gui_listTo ctrlSetPosition [0.463906 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.185625 * safezoneW,0.132 * safezoneH];
	gui_listTo ctrlCommit 0;
	
	gui_BtnOK = findDisplay 602 ctrlCreate["RscButton", 8501];
	gui_BtnOK ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.797 * safezoneH + safezoneY,0.0721875 * safezoneW,0.077 * safezoneH];
	gui_BtnOK ctrlSetText "탄창정리";
	gui_BtnOK ctrlEnable false;
	gui_BtnOK ctrlCommit 0;
	
	gui_BtnReset = findDisplay 602 ctrlCreate["RscButton", 8502];
	gui_BtnReset ctrlSetPosition [0.654688 * safezoneW + safezoneX,0.885 * safezoneH + safezoneY,0.0721875 * safezoneW,0.044 * safezoneH];
	gui_BtnReset ctrlSetText "초기화";
	gui_BtnReset ctrlEnable true;
	gui_BtnReset ctrlCommit 0;	
};

calculate_Mags = {
	if((gui_listFrom lbColor _selectedIndex)#1==1)then{			
		gui_listFrom lbSetColor [_selectedIndex, [1,0,0,1]];	
		
		_tmp = parseSimpleArray (gui_listFrom lbData _selectedIndex);
		mags_toRepack pushBack [_tmp#0, _tmp#1, _tmp#4];		
		
		_typeOfBalls_toRepack = [];
		_balls = 0;
		{
			_typeOfBalls_toRepack pushBackUnique getText (configfile >> "CfgMagazines" >> _x#0 >> "ammo");
			_balls = _balls + _x#1;
		}forEach mags_toRepack;
		
		if((count _typeOfBalls_toRepack == 1) && (count mags_toRepack > 1))then{gui_BtnOK ctrlEnable true;}else{gui_BtnOK ctrlEnable false;};	
		
		Estimated_repack = [];
		{
			_tmp = getNumber (configfile >> "CfgMagazines" >> _x#0 >> "count");
			Estimated_repack pushBack [_x#0, 0 max (_tmp min _balls), _x#2];
			_balls = _balls - (0 max (_tmp min _balls));
		}forEach mags_toRepack;
		
		lbClear gui_listTo;		
		{
			if(_x#1 > 0)then{
				gui_listTo lbAdd str formatText ["%1 [%2/%3]",
				getText (configfile >> "CfgMagazines" >> _x#0 >> "displayName"),
				_x#1,
				getNumber (configfile >> "CfgMagazines" >> _x#0 >> "count")
				];
			};
		}forEach Estimated_repack;			
		
		_resultMags = [];
		{			
			_ball_ref = getText (configfile >> "CfgMagazines" >> ((Estimated_repack#0)#0) >> "ammo");
			_ball_toAdd = getText (configfile >> "CfgMagazines" >> _x#0 >> "ammo");
			//systemChat str [_ball_toAdd,_ball_ref];
			if((_ball_toAdd == _ball_ref) && (_x#4 in ["Uniform", "Vest", "Backpack"]))then{
				_resultMags pushBack [_x#0,_x#1,_x#4];
			};
		}forEach (magazinesAmmoFull player);
		
		mags_toReAdd = (_resultMags-mags_toRepack+Estimated_repack);			
		//hint str mags_toReAdd;
	};
};