waitUntil {
	!isNil "save_is_loaded"
};
waitUntil {
	!isNil "blufor_sectors"
};
waitUntil {
	!isNil "saved_ammo_res"
};
waitUntil {
	!isNil "saved_intel_res"
};

resources_ammo = saved_ammo_res;
resources_intel = saved_intel_res;
while {
	GRLIB_endgame == 0
}
do {

	_base_tick_period = 3600;

	if (count allPlayers > 0)
		then {

			_blufor_mil_sectors = []; {
				if (_x in sectors_military)
					then {
						_blufor_mil_sectors pushback _x;
						_base_tick_period = _base_tick_period * 0.9;
					};
			}
			foreach blufor_sectors;

			_base_tick_period = _base_tick_period / GRLIB_resources_multiplier;

			if (_base_tick_period < 300)
				then {
					_base_tick_period = 300
				};

			sleep _base_tick_period;

			if (count _blufor_mil_sectors > 0)
				then {
					if (GRLIB_passive_income)
						then {
							_chkInc = 0; {
								//마을 하나당 5, 공장 하나당 10, 밀베 하나당 20, 대도시당 20, FOB하나당 -150
								if (_x in sectors_capture)
									then {
										_chkInc = _chkInc + 3;
									};
								if (_x in sectors_tower)
									then {
										_chkInc = _chkInc + 2;
									};
								if (_x in sectors_factory)
									then {
										_chkInc = _chkInc + 3;
									};
								if (_x in sectors_military)
									then {
										_chkInc = _chkInc + 5;
									};
								if (_x in sectors_bigtown)
									then {
										_chkInc = _chkInc + 5;
									};
							}
							foreach blufor_sectors;
							
							_chkInc = round(_chkInc - combat_readiness*15*_base_tick_period/3600);

							if (_chkInc < 0 && (resources_ammo + _chkInc < 150))
								then {
									[gamelogic, format["자원이 150미만이어서 차감되지 않았습니다. 다음 자원은 %1분 후에 추가됩니다.", round (_base_tick_period / 60)]]remoteExec["globalChat"];
								}
							else {
								Resources_ammo = Resources_ammo + _chkInc;
								[gamelogic, format["%1의 자원이 추가되었습니다. 다음 자원은 %2분 후에 추가됩니다.", _chkInc, round (_base_tick_period / 60)]]remoteExec["globalChat"];
							};
						}
					else {
						if (({
								typeof _x == ammobox_b_typename
							}
								count vehicles) <= (ceil((count _blufor_mil_sectors) * 1.3)))
							then {

								_spawnsector = (_blufor_mil_sectors call BIS_fnc_selectRandom);
								_spawnpos = zeropos;
								while {
									_spawnpos distance zeropos < 1000
								}
								do {
									_spawnpos = ([(markerpos _spawnsector), random 50, random 360]call BIS_fnc_relPos)findEmptyPosition[10, 100, 'B_Heli_Transport_01_F'];
									if (count _spawnpos == 0)
										then {
											_spawnpos = zeropos;
										};
								};
						_newbox = ammobox_b_typename createVehicle _spawnpos;
				_newbox setpos _spawnpos;
		_newbox setdir(random 360);
clearWeaponCargoGlobal _newbox;
clearMagazineCargoGlobal _newbox;
clearItemCargoGlobal _newbox;
clearBackpackCargoGlobal _newbox;
_newbox addMPEventHandler['MPKilled', {
		_this spawn kill_manager
	}
];

[[_newbox, 500], "F_setMass"]call BIS_fnc_MP;

};
};
};
};

};