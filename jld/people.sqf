_sltime = 600;

sleep 10;
while {true} do 
{
	["people",[count blufor_sectors,count sectors_allSectors,count allPlayers]] call DiscordEmbedBuilder_fnc_buildCfg;
    sleep _sltime;

};
