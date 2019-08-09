["Initialize"] call BIS_fnc_dynamicGroups;

["serverOpen"] call DiscordEmbedBuilder_fnc_buildCfg;

[] execVM "jld\people.sqf";


[] spawn {
	_opos = getPosASL landLeader;
	while{true}do{
		if(_opos distance landLeader > 5)then{landLeader setPosASL _opos};
		sleep 10;
	};
};