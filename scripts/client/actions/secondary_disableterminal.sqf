//removes addaction and animates object and sets task to complete
//[[_terminalobj,["<t size='1.5' shadow='2' color='#2EFEF7'>Disable Terminal Link</t>", "call ghst_fnc_disableterminal", _tsk, 6, true, true, "",""]],"ghst_fnc_addaction",true,true] spawn BIS_fnc_MP;
private ["_host","_caller","_id","_tsk"];

_host = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_tsk = _this select 3;

_host removeaction _id;

//_caller sidechat "I found the terminal. Disabling terminal link.";

[_host,0] call BIS_fnc_dataTerminalAnimate;

_host setVariable ["notdisabled", false, true];

[_tsk,"succeeded"] call BIS_fnc_taskSetState;