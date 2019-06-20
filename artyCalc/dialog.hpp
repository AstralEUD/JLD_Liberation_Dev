class BTCS_Control: RscControlsGroupBTCS
{
	idd = 1200;
	movingEnable = true;
	onLoad = "[] spawn BTCS_init; [] spawn BTCS_load;";
	onChar = "[] spawn BTCS_save";
	class Controls
	{
		////////////////////////////////////////////////////////
		// GUI EDITOR OUTPUT START (by SAKY, v1.063, #Cutube)
		////////////////////////////////////////////////////////

		class BTCS_Background: IGUIBackBTCS
		{
			idc = 2200;
			moving = 1;
			x = 0.0257887 * safezoneW;
			y = 0.022 * safezoneH;
			w = 0.206302 * safezoneW;
			h = 0.55 * safezoneH;
		};
		class RscText_1001: RscTextBTCS
		{
			idc = 1000;

			text = "BTCS"; //--- ToDo: Localize;
			x = 0.030945 * safezoneW;
			y = 0.022 * safezoneH;
			w = 0.0257877 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1008: RscTextBTCS
		{
			idc = 1000;

			text = "BATTERY"; //--- ToDo: Localize;
			x = 0.0309451 * safezoneW;
			y = 0.352 * safezoneH;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1010: RscTextBTCS
		{
			idc = 1000;

			text = "SOLUTION#2"; //--- ToDo: Localize;
			x = 0.0309457 * safezoneW;
			y = 0.539 * safezoneH;
			w = 0.056733 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1005: RscTextBTCS
		{
			idc = 1000;

			text = "TYPE"; //--- ToDo: Localize;
			x = 0.0309451 * safezoneW;
			y = 0.231 * safezoneH;
			w = 0.0825207 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscText_1006: RscTextBTCS
		{
			idc = 1000;

			text = "SHELL VELOCITY"; //--- ToDo: Localize;
			x = 0.123781 * safezoneW;
			y = 0.231 * safezoneH;
			w = 0.103151 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscText_1011: RscTextBTCS
		{
			idc = 1000;

			text = "SOLUTION#1"; //--- ToDo: Localize;
			x = 0.0309457 * safezoneW;
			y = 0.506 * safezoneH;
			w = 0.056733 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class RscText_1012: RscTextBTCS
		{
			idc = 1000;

			text = "ANGLE"; //--- ToDo: Localize;
			x = 0.0876786 * safezoneW;
			y = 0.473 * safezoneH;
			w = 0.056733 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1013: RscTextBTCS
		{
			idc = 1000;

			text = "ETA"; //--- ToDo: Localize;
			x = 0.139254 * safezoneW;
			y = 0.473 * safezoneH;
			w = 0.0515754 * safezoneW;
			h = 0.033 * safezoneH;
		};
		class RscText_1002: RscTextBTCS
		{
			idc = 1000;

			text = "X"; //--- ToDo: Localize;
			x = 0.077363 * safezoneW;
			y = 0.33 * safezoneH;
			w = 0.0412603 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscText_1003: RscTextBTCS
		{
			idc = 1000;

			text = "Y"; //--- ToDo: Localize;
			x = 0.128938 * safezoneW;
			y = 0.33 * safezoneH;
			w = 0.0412603 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscText_1004: RscTextBTCS
		{
			idc = 1000;

			text = "Z"; //--- ToDo: Localize;
			x = 0.180514 * safezoneW;
			y = 0.33 * safezoneH;
			w = 0.0412603 * safezoneW;
			h = 0.011 * safezoneH;
		};
		class RscText_1018: RscTextBTCS
		{
			idc = 1000;

			text = "TARGET"; //--- ToDo: Localize;
			x = 0.0309451 * safezoneW;
			y = 0.385 * safezoneH;
			w = 0.0412603 * safezoneW;
			h = 0.022 * safezoneH;
		};
		class BTCS_Vehicle: RscListboxBTCS
		{
			idc = 1500;
			x = 0.0309451 * safezoneW;
			y = 0.253 * safezoneH;
			w = 0.0825207 * safezoneW;
			h = 0.066 * safezoneH;
			onLBSelChanged = "[] spawn BTCS_initRange;[] spawn BTCS_save;";
		};
		class BTCS_Shell: RscListboxBTCS
		{
			idc = 1501;
			x = 0.123781 * safezoneW;
			y = 0.253 * safezoneH;
			w = 0.0979933 * safezoneW;
			h = 0.066 * safezoneH;
			onLBSelChanged = "[] spawn BTCS_save;";
		};
		class BTCS_BatX: RscEditBTCS
		{
			idc = 1400;
			x = 0.077363 * safezoneW;
			y = 0.352 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_BatY: RscEditBTCS
		{
			idc = 1401;
			x = 0.128938 * safezoneW;
			y = 0.352 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_BatZ: RscEditBTCS
		{
			idc = 1402;
			x = 0.180514 * safezoneW;
			y = 0.352 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_TgtX: RscEditBTCS
		{
			idc = 1403;
			x = 0.077363 * safezoneW;
			y = 0.385 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_TgtY: RscEditBTCS
		{
			idc = 1404;
			x = 0.128938 * safezoneW;
			y = 0.385 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_TgtZ: RscEditBTCS
		{
			idc = 1405;
			x = 0.180514 * safezoneW;
			y = 0.385 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			maxChars = 4;
		};
		class BTCS_Result: RscListboxBTCS
		{
			idc = 1007;
			x = 0.0309463 * safezoneW;
			y = 0.418 * safezoneH;
			w = 0.195987 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
		};
		class BTCS_ELV1: RscEditBTCS
		{
			idc = 1406;
			x = 0.0876786 * safezoneW;
			y = 0.506 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			canModify = false;
		};
		class BTCS_ETA1: RscEditBTCS
		{
			idc = 1407;
			x = 0.139254 * safezoneW;
			y = 0.506 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			canModify = false;
		};
		class BTCS_ELV2: RscEditBTCS
		{
			idc = 1408;
			x = 0.0876786 * safezoneW;
			y = 0.539 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			canModify = false;
		};
		class BTCS_ETA2: RscEditBTCS
		{
			idc = 1409;
			x = 0.139254 * safezoneW;
			y = 0.539 * safezoneH;
			w = 0.0464179 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {1,1,1,0.3};
			canModify = false;
		};
		class BTCS_Calc: RscButtonBTCS
		{
			idc = 1600;
			text = "CALC"; //--- ToDo: Localize;
			x = 0.190829 * safezoneW;
			y = 0.484 * safezoneH;
			w = 0.0361028 * safezoneW;
			h = 0.077 * safezoneH;
			action = "[] spawn BTCS_calculate";
		};
		class BTCS_Map: RscMapControlBTCS
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.0325025 * safezoneW;
			y = 0.053037 * safezoneH;
			w = 0.190829 * safezoneW;
			h = 0.165 * safezoneH;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////
