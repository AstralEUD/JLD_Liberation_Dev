while {currentVisionMode player == 2} do {
    private _player_muzzle_check = currentMuzzle player splitString '_' select 0;
    if (isNil "_player_muzzle_check") then {
        _player_muzzle_check = "placeholder";
    };
    if (cameraView == "GUNNER") then {
        if (_player_muzzle_check == "launch" || _player_muzzle_check == "Laserdesignator") then {
            setViewDistance NERF_current_viewDistance;
            isNERFactivated = false;
        } else {
                if (_player_muzzle_check != "launch" || _player_muzzle_check != "Laserdesignator") then {
                player action ['nvGogglesOff', player];
                if (currentVisionMode player == 2) then {
                    setViewDistance NERF_viewDistance_gun_scope;
                    isNERFactivated = true;
                };
            };
        };
    };
    if (cameraView != "GUNNER") then {
        setViewDistance NERF_viewDistance;
        isNERFactivated = true;
    };
    if (cameraView == "EXTERNAL") then {
        player action ['nvGogglesOff', player];
    };
};