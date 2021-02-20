private ["_params", "_action"];

// Parameters passed by the action
_action = _this select 0;
_target = _this select 1;
_caller = _this select 2;

////////////////////////////////////////////////
// Handle actions
////////////////////////////////////////////////
if (_action == "action_revive") then
{
	[_target, _caller] spawn FAR_HandleRevive;
};

if (_action == "action_stabilize") then
{
	[_target, _caller] spawn FAR_HandleStabilize;
};

if (_action == "action_suicide") then
{
	player setDamage 1;
};

if (_action == "action_drag") then
{
	[_target, _caller ] spawn FAR_Drag;
};

if (_action == "action_release") then
{
	[_caller] spawn FAR_Release;
};