[player] remoteExec["EM_Beep", (player nearEntities 15)];
_weaponDir = vectorNormalized(player weaponDirection "hgun_esd_01_F");
{
	_targetDir = vectorNormalized((eyePos player)vectorFromTo(getPosASL _x));
	_distance = player distance _x;
	_cosine = (_weaponDir vectorDotProduct _targetDir);
	_signalPower = ([ _distance, EM_Power_Mine, _cosine ] call EM_CalcPower);
	if ((_signalPower call EM_Log) > -40)then{_x setDamage 1};
}forEach allMines;	
