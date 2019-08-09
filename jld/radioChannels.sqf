radio_joined = false;

0 enableChannel [false, false];
1 enableChannel [true, false];
2 enableChannel [false, false];

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

if (isServer) then
{
	private _channelName = "전술통신망";
	channelID = radioChannelCreate [[1, 0.2, 0.2, 0.9], _channelName, "%UNIT_NAME", []];
	if (channelID == 0) exitWith {diag_log format ["Custom channel '%1' creation failed!", _channelName]};
	publicVariable "channelID";
	//[_channelID, {_this radioChannelAdd [player]}] remoteExec ["call", [0, -2] select isDedicated, _channelName];
};

if( (typeOf player == "B_Pilot_F") ) then {		
	[] spawn radio_join;
};