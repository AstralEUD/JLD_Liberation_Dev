welcomeFinished = false;
waitUntil{!isNull findDisplay 46};
//sleep 5;//서버 시작후 몇초뒤에 실행될지 결정
[] spawn {
	welcomeFinished = [parseText "<t align='center' size='1.3'><a color='#ffd800'>안녕하세요! :)</a></t>
	<br/><t align='center' size='1.3'><a color='#ffd800'>전라도1004에 오신것을 환영합니다.</a></t>
	<br/><t align='center'></t>
	<br/><t align='center'>전라도1004는 아르마3를 처음접하시는 초보분들 및 기존의 유저분들 모두에게 재밌고 즐거운 게임환경을 만들기위해 노력하고있습니다 :D</t>
	<br/><t align='center'></t>
	<br/><t align='center'>※ 서버 규칙(Rule)을 꼭 확인 및 숙지하시길 바랍니다※</t>
	<br/><t align='center' size='1.1'><a color='#ffd800'>분대가입:[U], 추가기능:[Window], 자동달리기:[=]</a></t>
	<br/><t align='center'></t>
	<br/><t align='right'>디스코드 <a color='#ffd800' href='https://discord.gg/HCxfhDe'>접속하기</a><br/>"
	,"전라도 바닐라서버에 오신것을 환영합니다!"] call BIS_fnc_guiMessage;
	welcomeFinished = true;
};
	