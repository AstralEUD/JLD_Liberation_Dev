enableSaving [ false, false ];

if(isClass(configFile>>"CfgWeapons">>"gm_g3a3_oli"))then{endMission "End2";};

[] call compileFinal preprocessFileLineNumbers "scripts\shared\atlas_manager.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\liberation_functions.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\init_sectors.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\fetch_params.sqf";
[] call compileFinal preprocessFileLineNUmbers "gameplay_constants.sqf";
[] call compileFinal preprocessFileLineNUmbers "classnames_extension.sqf";
[] call compileFinal preprocessFileLineNUmbers "scripts\shared\classnames.sqf";

if ( GRLIB_revive > 0 ) then {
	[] execVM "FAR_revive\FAR_revive_init.sqf";
};
[] execVM "GREUH\scripts\GREUH_activate.sqf";

[] call compileFinal preprocessfilelinenumbers "scripts\shared\init_shared.sqf";

if (isServer) then {
	[] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 2500;
};

//ADV_zeus(zeus moddule name = adminZeus)
if (isServer) then {[adminZeus,true] execVM "ADV_zeus.sqf";};

//daymessages
[] execVM "jld\daymessages.sqf";

//advancedSlingLoad
[] execVM "scripts\fn_advancedSlingLoadingInit.sqf";

//bobcat
[] execVM "jld\cratercleaner.sqf";

//fast rope
[] execVM "jld\SHK_Fastrope.sqf";

//compass
[] execVM "jld\fn_voyagerCompass.sqf";

//server rule
[] execVM "jld\s_Welcome_Rule.sqf";

//realism scripts
null=[]execVM"CRS\init.sqf";

//lgi load
[] execVM "IgiLoad\IgiLoadInit.sqf";

//FFE
nul = [] execVM "RYD_FFE\FFE.sqf";

//Saky scripts
if(!isDedicated && hasInterface)then{
	[] execVM "ctmenu\ctmenu.sqf";
	[] execVM "jld\itemblackList.sqf";	
	[] execVM "jld\loadMortar.sqf";
	[] execVM "jld\tankboy.sqf";
	[] execVM "jld\serverRules.sqf";
	//[] execVM "jld\scanEnemy.sqf";
	[] execVM "EM_DEVICE\EM_Init.sqf";
	[] execVM "jld\SAKY_MAGAZINE_REPACK.sqf";
	[] execVM "artyCalc\artyCalc.sqf";
	[] execVM "VAM_GUI\VAM_GUI_init.sqf";
	[] execVM "PPAP\PPAP_init.sqf";	
	[] execVM "traitManager\traitManager.sqf";	
	[] execVM "jld\Auto_running.sqf";
	[] execVM "NERF\NERF.sqf";
	[] execVM "rokaUniform\rokaUniform.sqf";
};
[] execVM "jld\radioChannels.sqf";
[] execVM "jld\rtbReward.sqf";

player addEventHandler ["Respawn", {
	[] execVM "jld\Auto_running.sqf";
}];
