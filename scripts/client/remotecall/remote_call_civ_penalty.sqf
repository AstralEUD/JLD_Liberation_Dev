if ( isDedicated ) exitWith {};

params [ "_civname", "_civ_penalty", "_killer" ];
private [ "_playername" ];
/*
_playername = "";
if(count (squadParams _killer) != 0) then {
	_playername = "[" + ((squadParams _killer select 0) select 0) + "] ";
};
_playername = _playername + name _killer;

gamelogic globalChat (format [ localize "STR_CIV_PENALTY_MESSAGE",  _civ_penalty, _civname, _playername ] );*/
//jld editted
gamelogic globalChat ("EH302가 파괴되어 50의 자원이 소모되었습니다.");