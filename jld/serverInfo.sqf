"Welcome to Jeonlado Vanilla Server!" hintC [
    parseText 
	"
	<br/><br/><t align='center' size='1.2'><a color='#ffd800' href='https://discord.gg/HCxfhDe'>서버 디스코드 / Server Discord</a></t><br/><br/>
"
];
hintC_arr_EH = findDisplay 72 displayAddEventHandler ["unload", {
    0 = _this spawn {
        _this select 0 displayRemoveEventHandler ["unload", hintC_arr_EH];
        hintSilent "";
    };
}];