systemChat "금지 품목 자동삭제 스크립트 활성화";
while {
	true
}
do {
	_blockedItemsAll = [];
	_blockedAssignedItems = assignedItems player arrayIntersect GRLIB_blacklisted_from_arsenal;
	_blockedUniformItems = []; {
		if (_x in GRLIB_blacklisted_from_arsenal)
			then {
				_blockedUniformItems pushBack _x;
			};
	}
	foreach uniformItems player;
	_blockedVestItems = []; {
		if (_x in GRLIB_blacklisted_from_arsenal)
			then {
				_blockedVestItems pushBack _x;
			};
	}
	foreach vestItems player;
	_blockedBackpackItems = []; {
		if (_x in GRLIB_blacklisted_from_arsenal)
			then {
				_blockedBackpackItems pushBack _x;
			};
	}
	foreach backpackItems player;
	_blockedItemsAll = _blockedAssignedItems + _blockedUniformItems + _blockedVestItems + _blockedBackpackItems; {
		player unassignItem _x;
		player removeItem _x;
	}
	foreach _blockedAssignedItems;

	if (uniform player in GRLIB_blacklisted_from_arsenal)
		then {
			_blockedItemsAll pushBack uniform player;
			removeUniform player;
		}
	else { {
			player removeItemFromUniform _x;
		}
		foreach _blockedUniformItems;
	};

	if (vest player in GRLIB_blacklisted_from_arsenal)
		then {
			_blockedItemsAll pushBack vest player;
			removeVest player;
		}
	else { {
			player removeItemFromVest _x;
		}
		foreach _blockedVestItems;
	};

	if (backpack player in GRLIB_blacklisted_from_arsenal)
		then {
			_blockedItemsAll pushBack backpack player;
			removeBackpack player;
		}
	else { {
			player removeItemFromBackpack _x;
		}
		foreach _blockedBackpackItems;
	};

	_blockedItemsAll sort true;

	if (count _blockedItemsAll != 0)
		then {
			_blockedItemsAllText = ""; {
				_blockedItemsAllText = _blockedItemsAllText + _x + "\n";
			}
			foreach _blockedItemsAll;
			hint format["아래의 항목들이 인벤토리에서 삭제되었습니다.\n%1", _blockedItemsAllText];
		};
	sleep 0.5;
};
