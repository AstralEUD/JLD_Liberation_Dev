//NERF
//NERF stands for...
//Nerf over-powered infantry thermal Equipment by adjusting view Range For fun
//Made by UNIT_normal
NERF_viewDistance = 300;
NERF_viewDistance_gun_scope = 600;

_limit_viewDistance = "
	while {currentVisionMode player == 2} do {
		_player_muzzle_check = currentMuzzle player splitString '_' select 0;
		if ((cameraView == 'GUNNER') && (_player_muzzle_check != 'launch' || _player_muzzle_check != 'Laserdesignator')) then {
			player action ['nvGogglesOff', player];
			if (currentVisionMode player == 2) then {
				setViewDistance NERF_viewDistance_gun_scope;
			};
		};
		if ((cameraView == 'GUNNER') && (_player_muzzle_check != 'launch' || _player_muzzle_check != 'Laserdesignator')) then {
			setViewDistance _current_viewDistance;
		};
		if (cameraView != 'GUNNER') then {
			setViewDistance NERF_viewDistance;
		};
	};
";

_limit_viewDistance_commander = "
	while {currentVisionMode player == 2} do {
		_player_muzzle_check = currentMuzzle player splitString '_' select 0;
		if ((cameraView == 'GUNNER') && (_player_muzzle_check != 'launch' || _player_muzzle_check != 'Laserdesignator')) then {
			player action ['nvGogglesOff', player];
			if (currentVisionMode player == 2) then {
				setViewDistance NERF_viewDistance_gun_scope;
			};
		};
		if ((cameraView == 'GUNNER') && (_player_muzzle_check != 'launch' || _player_muzzle_check != 'Laserdesignator')) then {
			setViewDistance _current_viewDistance;
		};
		if (cameraView != 'GUNNER') then {
			setViewDistance NERF_viewDistance;
		};
		if (cameraView == 'EXTERNAL') then {
			player action ['nvGogglesOff', player];
		};
	};
";

fnc_NERF_limit_viewDistance = compileFinal _limit_viewDistance;
fnc_NERF_limit_viewDistance_commander = compileFinal _limit_viewDistance_commander;

while {true} do {
	_current_viewDistance = viewDistance;
	if (currentVisionMode player == 2) then {
		if (player == vehicle player) then {
			[] call fnc_NERF_limit_viewDistance;
		};
		if (player != vehicle player) then {
			_current_vehicle = vehicle player;
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
		setViewDistance _current_viewDistance;
	};
	uisleep 0.1;
};