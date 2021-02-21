GRLIB_support_transport = compileFinal preprocessFileLineNumbers "support\transport.sqf";
GRLIB_support_transport_dest = compileFinal preprocessFileLineNumbers "support\transport_dest.sqf";
AST_Garbage_Cleaner = compileFinal preprocessFileLineNumbers "support\garbage.sqf";

if (isServer) then {
	GRLIB_support_transport_timer = 0;
};
if (hasInterface) then {
	[player,"GRLIB_support_transport_menu"] call BIS_fnc_addCommMenuItem;
	[player,"AST_garbage_menu"] call BIS_fnc_addCommMenuItem;
};