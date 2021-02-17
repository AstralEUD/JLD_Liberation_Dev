["Initialize"] call BIS_fnc_dynamicGroups;

//["serverOpen"] call DiscordEmbedBuilder_fnc_buildCfg;

//[] execVM "jld\people.sqf";
[] execVM "jld\fob_nodamage.sqf";

[] spawn {
	_opos = getPosASL landLeader;
	while{true}do{
		if(_opos distance landLeader > 1)then{landLeader setPosASL _opos};
		sleep 10;
	};
};