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
	[] execVM "jld\fob_nodamage.sqf";
};

if (!isDedicated && !hasInterface && isMultiplayer) then {
	[] spawn compileFinal preprocessFileLineNumbers "scripts\server\offloading\hc_manager.sqf";
};

if (!isDedicated && hasInterface) then {
	waitUntil { alive player };
	[] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
} else {
	setViewDistance 1300;
};

//ADV_zeus(zeus moddule name = adminZeus)
if (isServer) then {[adminZeus,true] execVM "ADV_zeus.sqf";};

//earplug
//[] execVM "jld\NRE_earplugs.sqf";

//daymessages
[] execVM "jld\daymessages.sqf";

//advancedSlingLoad
[] execVM "scripts\fn_advancedSlingLoadingInit.sqf";

//bobcat
[] execVM "jld\cratercleaner.sqf";

//fast rope
[] execVM "jld\SHK_Fastrope.sqf";

//irstrobe
//[] execVM "jld\irstrobelite.sqf";

//compass
[] execVM "jld\fn_voyagerCompass.sqf";

//server rule
[] execVM "jld\s_Welcome_Rule.sqf";

//real
null=[]execVM"CRS\init.sqf";

//lgi load
[] execVM "IgiLoad\IgiLoadInit.sqf";

//Saky scripts
if(hasInterface)then{
	[] execVM "jld\itemblackList.sqf";	
	[] execVM "jld\rule_enforcer.sqf";
	[] execVM "jld\loadMortar.sqf";
	[] execVM "ctmenu\ctmenu.sqf";
	[] execVM "artyCalc\artyCalc.sqf";
	[] execVM "VAM_GUI\VAM_GUI_init.sqf";//VAM	
	[] execVM "jld\tankboy.sqf";
};
[] execVM "jld\radioChannels.sqf";

player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	[] execVM "VAM_GUI\VAM_GUI_init.sqf";//VAM	
	[] execVM "jld\tankboy.sqf";
}];

//FFE
nul = [] execVM "RYD_FFE\FFE.sqf";
