params ["_controlled"];
player remoteControl _controlled;
switchCamera _controlled;

if (_controlled getVariable ["LULULALA_remoteControl_eh", 0] == 0) then {
	_controlled addEventHandler [
		"Killed",
		{
		objNull remoteControl (_this select 0);
		switchCamera player;
		hint "조종하던 유닛이 사망했습니다.";
		(_this select 0) setVariable ["LULULALA_remoteControl_eh", 1];
		}
	];
};
