//NERF
//NERF stands for...
//Nerf over-powered infantry thermal Equipment by adjusting view Range For fun
//Made by UNIT_normal
NERF_viewDistance = 300;
NERF_viewDistance_gun_scope = 600;
isNERFactivated = false;
fnc_NERF_limit_viewDistance = compileFinal loadFile "NERF\NERF_limit_viewDistance.sqf";
fnc_NERF_limit_viewDistance_commander = compileFinal loadFile "NERF\NERF_limit_viewDistance_commander.sqf";

while {true} do {
	NERF_current_viewDistance = viewDistance;
	if (currentVisionMode player == 2) then {
		if (player == vehicle player) then {
			[] call fnc_NERF_limit_viewDistance;
		};
		if (player != vehicle player) then {
			private _current_vehicle = vehicle player;
			if (_current_vehicle getCargoIndex player != -1) then {
				[] call fnc_NERF_limit_viewDistance;
			} else {
				if (commander _current_vehicle == player && isTurnedOut player) then {
					[] call fnc_NERF_limit_viewDistance_commander;
				} else {
					if (cameraView == "EXTERNAL" || cameraView == "INTERNAL") then {
						player action ["nvGogglesOff", player];
					};
				};
			};
		};
		setViewDistance NERF_current_viewDistance;
		isNERFactivated = false;
	};
	uisleep 0.1;
};