if ( !GRLIB_teamkill_penalty ) then {
	while { true } do {
		waitUntil { rating player < 0 };
		player addRating (abs (rating player));
		"FRIENDLY FIRE!!" hintC [
		"아군을 공격하였습니다. 다른 유저를 공격한 경우 즉시 사과하시기 바랍니다.",
		"아군 오사에 대해 사과하지 않고 도주하는 경우에는 처벌될 수 있습니다.",
		"TIP:액션메뉴 가장 아래의 추가설정에서 아군 표식을 설정할 수 있습니다.",
		"이 창은 ESC를 눌러 닫습니다."
		];		
	};
};