"Welcome to Jeonlado Vanilla Server!" hintC [
    parseText 
	"
	<br/><t align='center' size='1.2'><a color='#ffd800' href='http://cafe.naver.com/jeonladoserver/1371'>전라도 서버 네이버 카페 / Jeonlado Server Naver Cafe(Korean)</a></t><br/><br/>
	<t align='center' size='1.2'><a color='#ffd800' href='https://discord.gg/9NgM26P'>서버 디스코드 / Server Discord</a></t><br/><br/>
	<t align='center' size='1.2'><a color='#ffd800' href='https://goo.gl/XSeqo9'>서버 규정 카페북(한국어) / Server Rule Book (Korean)</a></t><br/><br/>
	<t align='center' size='1.2'><a color='#ffd800' href='https://goo.gl/ftAJ5h'>서버 규정 카페북(번역기) / Server Rule Book (Translated)</a></t><br/><br/>
"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];