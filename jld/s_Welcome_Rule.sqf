welcomeFinished = false;
waitUntil{!isNull findDisplay 46};
//sleep 5;//서버 시작후 몇초뒤에 실행될지 결정
[] spawn {
	welcomeFinished = [parseText "<br/><t align='center' size='1.2'><a color='#ffd800'>안녕하세요! :) 서버장 Niveatt 입니다</a></t>
	<br/><t align='center' size='1.5'><a color='#ffd800'>전라도 바닐라 서버에 오신걸 환영합니다</a></t>
	<br/><t align='center'></t>
	<br/><t align='center'>전라도 서버그룹(바닐라,에드온)은 아르마3를 처음접하시는 초보분들 및 기존의 유저분들 모두에게 재밌고 즐거운 게임환경을 만들기위해 노력하고있습니다 :D</t>
	<br/><t align='center'></t>
	<br/><t align='center'>이 외에 전라도 서버는 네이버카페 및 디스코드를 운영하고 있으므로 더 많은 정보 및 소식을 접하실 수 있습니다</t>
	<br/><t align='center'></t>
	<br/><t align='center'><t size='0.9'>
	<a color='#ffd800' href='http://cafe.naver.com/jeonladoserver/1371'>   초보유저 도움영상   </a><a color='#ffd800' href='http://cafe.naver.com/jeonladoserver/1709'>   바닐라서버 스크립트 안내문   </a><a color='#ffd800' href='https://youtu.be/VUh5p4BU-So'>   전라도서버 홍보영상   </a></t></t><br/>
	<br/><t align='center'></t>
	<br/><t align='center'><t size='1'>
◇ 서버규칙 확인<a color='#008cff' href='https://cafe.naver.com/jeonladoserver/book5099327'> 링크 이동 </a>	◇ 민폐유저 처벌이력<a color='#008cff' href='https://docs.google.com/spreadsheets/d/1Dyqf3BtXBEZgSE-2F-p2WLetWiwvvqqGUHy0oB5SAYY/edit#gid=0'> 링크 이동 </a></t></t><br/>
	<br/><t align='center'></t>
	<br/><t align='center'>※ 서버 규칙(Rule)을 꼭 확인 및 숙지하시길 바랍니다※</t>
	<br/><t align='center'></t>
	<br/><t align='right'><t size='1'>
	디스코드<a color='#ffd800' href='https://discord.gg/9NgM26P'> 접속하기</a><br/>
	네이버 카페<a color='#008cff' href='http://cafe.naver.com/jeonladoserver'> 접속하기</a></t></t><br/>
	<br/>
	<br/><t align='center' size='0.9'>리버레이션 분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용하실수 있습니다</t>
	<br/>
	<br/><t align='center' size='0.9'><a color='#ffd800'>소총등뒤에 메기 -키, 자동달리기 =키</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 서버안내문 도움 - BWB Gaming Group </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡ 혹은 확인버튼 클릭)</a></t></t><br/>"
	,"전라도 바닐라서버에 오신것을 환영합니다!"] call BIS_fnc_guiMessage;
	welcomeFinished = true;
};

/*
"Welcome to Jeonlado Vanilla Server!" hintC [
    parseText 
	"
	<br/><t align='center' size='1.2'><a color='#ffd800'>안녕하세요! :) 서버장 Niveatt 입니다</a></t>
	<br/><t align='center' size='1.5'><a color='#ffd800'>전라도 바닐라 서버에 오신걸 환영합니다</a></t>
	<br/><t align='center'></t>
	<br/><t align='center'>전라도 서버그룹(바닐라,에드온)은 아르마3를 처음접하시는 초보분들 및 기존의 유저분들 모두에게 재밌고 즐거운 게임환경을 만들기위해 노력하고있습니다 :D</t>
	<br/><t align='center'></t>
	<br/><t align='center'>이 외에 전라도 서버는 네이버카페 및 디스코드를 운영하고 있으므로 더 많은 정보 및 소식을 접하실 수 있습니다</t>
	<br/><t align='center'></t>
	<br/><t align='center'><t size='0.9'>
	<a color='#ffd800' href='http://cafe.naver.com/jeonladoserver/1371'>   초보유저 도움영상   </a><a color='#ffd800' href='http://cafe.naver.com/jeonladoserver/1709'>   바닐라서버 스크립트 안내문   </a><a color='#ffd800' href='https://youtu.be/VUh5p4BU-So'>   전라도서버 홍보영상   </a></t></t><br/>
	<br/><t align='center'></t>
	<br/><t align='center'><t size='1'>
◇ 서버규칙 확인<a color='#008cff' href='https://cafe.naver.com/jeonladoserver/book5099327'> 링크 이동 </a>	◇ 민폐유저 처벌이력<a color='#008cff' href='https://docs.google.com/spreadsheets/d/1Dyqf3BtXBEZgSE-2F-p2WLetWiwvvqqGUHy0oB5SAYY/edit#gid=0'> 링크 이동 </a></t></t><br/>
	<br/><t align='center'></t>
	<br/><t align='center'>※ 서버 규칙(Rule)을 꼭 확인 및 숙지하시길 바랍니다※</t>
	<br/><t align='center'></t>
	<br/><t align='right'><t size='1'>
	디스코드<a color='#ffd800' href='https://discord.gg/9NgM26P'> 접속하기</a><br/>
	네이버 카페<a color='#008cff' href='http://cafe.naver.com/jeonladoserver'> 접속하기</a></t></t><br/>
	<br/>
	<br/><t align='center' size='0.9'>리버레이션 분대창설, 가입은 U키, 그외 마우스휠을 굴려 메뉴를 사용하실수 있습니다</t>
	<br/>
	<br/><t align='center' size='0.9'><a color='#ffd800'>소총등뒤에 메기 -키, 자동달리기 =키</a></t>
	<br/><t align='center'></t>
	<br/>
	<t size='0.8'><t align='left'> 서버안내문 도움 - BWB Gaming Group </a><br/>
	<t size='1'><a color='#ff0000'>(서버 공지사항 끄기 ‡ESC‡)</a></t></t><br/>"
];

hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "U키를 눌러 분대에 가입할 수 있습니다.";
    };
}];
*/