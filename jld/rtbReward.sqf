SAKY_Reward = 0;

SAKY_RTBReward_IncreaseReward = {
	SAKY_Reward = SAKY_Reward + 1;
	gamelogic globalChat ("점령 보너스를 획득하였습니다. 재배치나 사망 없이 FOB로 복귀에 성공하면 보너스 자원을 획득합니다.");
	SAKY_Reward
};

SAKY_RTBReward_CheckFOB = {
	_nearestfob = [ getpos player ] call F_getNearestFob;
	_isNearFOB = false;	
	if((player distance _nearestfob)<GRLIB_fob_range)then{_isNearFOB = true};
	_isNearFOB
};

SAKY_RTBReward_CheckLiberators = {
	params ["_sector"];
	_liberators = [];
	{if((_x distance markerPos _sector)<GRLIB_capture_size*2)then{_liberators pushBack _x};}forEach allPlayers;
	_liberators
};

SAKY_RTBReward_SERVERAMMO = {
	params ["_increase"];
	resources_ammo = resources_ammo + _increase; 
	please_recalculate = true;
};

SAKY_RTBReward_GiveReward = {
	if(call SAKY_RTBReward_CheckFOB)then{
		if(SAKY_Reward>0 && (vehicle player == player))then{
			_player = player;
			_randomfx = random [25,75,150];
			_increase = SAKY_Reward * _randomfx;
			[gamelogic, str formatText["%1님이 FOB복귀에 성공해 %2의 자원을 추가로 획득하였습니다.",name _player, _increase*_randomfx]] remoteExec ["globalChat"];
			[_increase] remoteExec ["SAKY_RTBReward_SERVERAMMO",2];
			[player, _increase*20] remoteExec ["addScore", 2]; 		
			SAKY_Reward = 0;
		};
	};
};	

SAKY_RTBReward_RemoveReward = {
	if(SAKY_Reward>0)then{
		gamelogic globalChat ("재배치 사용으로 인해 점령 보너스가 초기화되었습니다.");
		SAKY_Reward = 0; 
	};
};

if(hasInterface)then{		
	[] spawn {
		while{true}do{
			waitUntil{sleep 10; count GRLIB_all_fobs > 0};
			call SAKY_RTBReward_GiveReward;			
		};
	};

	player addEventHandler ["Killed",{
		if(SAKY_Reward>0)then{
			gamelogic globalChat ("사망으로 인해 점령 보너스가 초기화되었습니다.");
			SAKY_Reward = 0; 
		};
	}
	];
};