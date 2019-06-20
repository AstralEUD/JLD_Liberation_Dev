_idact = -1;
while { true } do {
	waitUntil{ sleep 0.3; alive player };
	_idact = player addAction ["<t color='#FF8000'>-- 추가설정 메뉴 --</t>","GREUH\scripts\GREUH_dialog.sqf","",-999,false,true];
	waitUntil{ sleep 0.3; !alive player};
};