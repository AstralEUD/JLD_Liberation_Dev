EM_Signal_O_Inf = 0;
EM_Signal_B_Inf = 0;
EM_Signal_O_Veh = 0;
EM_Signal_B_Veh = 0;
EM_Signal_Air = 0;
EM_Signal_UAV = 0;
EM_Signal_Mine = 0;
EM_Signal_Radio = [];

EM_Power_Inf = 1e-15;
EM_Power_Veh = 1e-14;
EM_Power_Air = 1e-15;
EM_Power_UAV = 1e-15;
EM_Power_Mine = 1e-15;

EM_Gain_Max = 35;

EM_TrigTime = nil;
EM_AllowTransmit = false;

EM_Radios = [];

EM_AntennaPrevious = "nil";

EM_Debug = false;

waitUntil{!isNull findDisplay 46};
EM_Beep = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Beep.sqf";
EM_CalcPower = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_CalcPower.sqf";
EM_Gain = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Gain.sqf";
EM_Log = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Log.sqf";
EM_Mine_Detonator = compileFinal preprocessFileLineNumbers "EM_DEVICE\functions\EM_Mine_Detonator.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_Transmitter.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_MouseEHs.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_EachFrame.sqf";
call compileFinal preprocessFileLineNumbers "EM_Device\functions\EM_Init_Draw3D.sqf";
