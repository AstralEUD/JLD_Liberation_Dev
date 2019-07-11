radio_joined = false;

0 enableChannel [false, false];
1 enableChannel [true, false];
2 enableChannel [true, false];

radio_join = {	
	if("ItemRadio" in assignedItems player)then{
		if(!radio_joined)then{
			[channelID, [player]] remoteExec ["radioChannelAdd"];
			[player, [channelID, "전술통신망 개통되었음!"]] remoteExec ["customChat",-2];
			setCurrentChannel (channelID+5);
			radio_joined = true;
		};
	}else{
		if(radio_joined)then{			
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

if(hasInterface)then{
	waitUntil{!isNil "channelID"};
	while{true}do{[] spawn radio_join; sleep 0.1;};
};

