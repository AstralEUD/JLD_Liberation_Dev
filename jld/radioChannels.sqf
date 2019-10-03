Radio_Joined = false;
Radio_Members = [];

0 enableChannel [false, false];
1 enableChannel [true, false];
2 enableChannel [false, false];

Radio_Toggle = {
	if(!Radio_Joined)then{
		call Radio_Request_Join;
	}else{
		if(typeOf player == "B_Pilot_F")then{
			["<t color='#ff0000' size = '0.55' >조종사는 전술통신망을 해제할 수 없습니다!</t>"] spawn BIS_fnc_dynamicText;
			systemChat "조종사는 전술통신망을 해제할 수 없습니다!";			
		}else{
			call Radio_Request_Quit;
		};		
	};
};

if (isServer) then
{
	private _channelName = "전술통신망";
	Radio_Channel = radioChannelCreate [[1, 0.2, 0.2, 0.9], _channelName, "%UNIT_NAME", []];
	if (Radio_Channel == 0) exitWith {diag_log format ["Custom channel '%1' creation failed!", _channelName]};
	publicVariable "Radio_Channel";
	[] spawn {
		while {true} do{	
			{ 
				if(!isPlayer _x)then{Radio_Members deleteAt _forEachIndex;}; 
			}forEach Radio_Members; 
			publicVariable "Radio_Members";
			sleep 5;
		};
	};
};

Radio_Request_Join={	
	[player, Radio_Channel] remoteExec ["Radio_Server_Join", 2];
};

Radio_Server_Join={
	params["_unit", "_index"];
	_index radioChannelAdd [_unit];	
	Radio_Members pushBackUnique _unit;
	publicVariable "Radio_Members";
	[] remoteExec ["Radio_After_Join", _unit];
};

Radio_After_Join={		
	[player, [Radio_Channel, "전술통신망 개통되었음!"]] remoteExec ["customChat"];
	setCurrentChannel (Radio_Channel+5);
	Radio_Joined = true;
};

Radio_Request_Quit={	
	[player, [Radio_Channel, "수신종료!"]] remoteExec ["customChat"];
	[player, Radio_Channel] remoteExec ["Radio_Server_Quit", 2];	
	setCurrentChannel (3);
	Radio_Joined = false;
};

Radio_Server_Quit={
	params["_unit", "_index"];	
	_index radioChannelRemove [_unit];		
	Radio_Members deleteAt (Radio_Members find _unit);
	publicVariable "Radio_Members";		
};

if( (typeOf player == "B_Pilot_F") ) then {		
	call Radio_Toggle;
};

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	Radio_Joined = !Radio_Joined;		
	call Radio_Toggle;
}];


/*
radio_join = {	
	if(!radio_joined)then{
		[channelID, [player]] remoteExec ["radioChannelAdd"];
		[player, [channelID, "전술통신망 개통되었음!"]] remoteExec ["customChat",-2];
		setCurrentChannel (channelID+5);
		radio_joined = true;
	}else{			
		if( (typeOf player == "B_Pilot_F") ) then {	
			radio_joined = false;				
			["<t color='#ff0000' size = '0.55' >조종사는 전술통신망을 해제할 수 없습니다.</t>"] spawn BIS_fnc_dynamicText;
			systemChat "조종사는 전술통신망을 해제할 수 없습니다.";
			[] spawn radio_join;
		} else {
			[[player, channelID],{params ["_player", "_channelID"];_player customChat [_channelID, "수신 종료!"];}] remoteExecCall ["call"];
			[[player, channelID],{params ["_player", "_channelID"];sleep 0.1;_channelID radioChannelRemove [_player];}] remoteExecCall ["spawn"];
			setCurrentChannel 3;
			radio_joined = false;
		};
	};
};
*/

