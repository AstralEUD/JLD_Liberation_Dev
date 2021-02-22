class liberation_squad {
	idd = 5155;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "OuterCenterPanel","Header","SquadList","DeployMap", "ButtonClose",
		"NameLabel", "ClassLabel", "HealthLabel", "DistanceLabel", "PrimaryLabel", "PrimaryMagsLabel", "SecondaryLabel", "SecondaryMagsLabel", "VehicleLabel",
		"ResupplyButton", "RemoveButton", "ReplaceButton", "ConfirmButton", "CancelButton", "PiPZone", "RemoteControlButton"};

	objects[] = {};

	class StdSquadLabel : StdText {
		x = (0.32 * safezoneW + safezoneX) + (BORDERSIZE);
		w = (0.12 * safezoneW) - BORDERSIZE;
		h = (0.03 * safezoneH);
		shadow = 2;
		sizeEx = 0.018 * safezoneH;
		text = "";
	};
	class RecycleBG : BgPicture
	{
		idc = 1000;
		x = 0.189462 * safezoneW + safezoneX;
		y = 0.17912 * safezoneH + safezoneY;
		w = 0.621 * safezoneW;
		h = 0.642001 * safezoneH;
	};
	class DeployMap : kndr_MapControl
	{
		idc = 100;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.59996 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.2 * safezoneH;
	};
	class OuterBG : StdBG
	{
		idc = 1002;
		x = 0.189462 * safezoneW + safezoneX;
		y = 0.17912 * safezoneH + safezoneY;
		w = 0.621 * safezoneW;
		h = 0.642001 * safezoneH;
		colorBackground[] = { 0.3,0.25,0.2,0.75 };
	};
	class OuterBG_F : OuterBG
	{
		style = 64;

		idc = 1003;
		x = 0.189462 * safezoneW + safezoneX;
		y = 0.17912 * safezoneH + safezoneY;
		w = 0.621 * safezoneW;
		h = 0.642001 * safezoneH;
		colorBackground[] = { 0.3,0.25,0.2,0.75 };
	};
	class InnerBG : OuterBG
	{
		idc = 1004;
		x = 0.194713 * safezoneW + safezoneX;
		y = 0.2396 * safezoneH + safezoneY;
		w = 0.6105 * safezoneW;
		h = 0.571001 * safezoneH;
		colorBackground[] = { 0.2,0.23,0.18,0.75 };
	};
	class OuterCenterPanel : StdBG
	{
		style = 64;

		idc = 1006;
		x = 0.325306 * safezoneW + safezoneX;
		y = 0.24996 * safezoneH + safezoneY;
		w = 0.12 * safezoneW;
		h = 0.3395 * safezoneH;
		colorBackground[] = { 0.2,0.23,0.18,0.75 };
	};
	class Header : StdHeader
	{
		idc = 1007;
		text = "SQUAD MANAGEMENT"; //--- ToDo: Localize;
		x = 0.194713 * safezoneW + safezoneX;
		y = 0.19004 * safezoneH + safezoneY;
		w = 0.6105 * safezoneW;
		h = 0.0429999 * safezoneH;
		colorBackground[] = { 0.6,0.6,0.6,0.8 };
		sizeEx = 0.03 * safezoneH ;
	};
	class SquadList : StdListBox
	{
		idc = 101;
		shadow = 2;
		onLBSelChanged = "";

		x = 0.204688 * safezoneW + safezoneX;
		y = 0.248 * safezoneH + safezoneY;
		w = 0.118125 * safezoneW;
		h = 0.266 * safezoneH;
	};
	class ResupplyButton : StdButton
	{
		idc = 210;
		action = "GRLIB_squadaction = 1";

		text = "Resupply"; //--- ToDo: Localize;
		x = 0.204688 * safezoneW + safezoneX;
		y = 0.584 * safezoneH + safezoneY;
		w = 0.118125 * safezoneW;
		h = 0.042 * safezoneH;
		tooltip = "If the selected squad member is close enough from a resupply point (mobile spawn or FOB) they will get a brand new, full loadout."; //--- ToDo: Localize;
		sizeEx = 0.025 * safezoneH ;
	};
	class RemoveButton : StdButton
	{
		idc = 211;
		action = "GRLIB_squadaction = 2";

		text = "Remove"; //--- ToDo: Localize;
		x = 0.204688 * safezoneW + safezoneX;
		y = 0.64 * safezoneH + safezoneY;
		w = 0.118125 * safezoneW;
		h = 0.042 * safezoneH;
		tooltip = "The selected squad member will be deleted."; //--- ToDo: Localize;
		sizeEx = 0.025 * safezoneH;
	};
	class ReplaceButton : StdButton
	{
		idc = 212;
		action = "GRLIB_squadaction = 3";

		text = "Replace"; //--- ToDo: Localize;
		x = 0.204688 * safezoneW + safezoneX;
		y = 0.696 * safezoneH + safezoneY;
		w = 0.118125 * safezoneW;
		h = 0.042 * safezoneH;
		tooltip = "You will deploy on the selected squad member and replace them while keeping your current loadout."; //--- ToDo: Localize;
		sizeEx = 0.025 * safezoneH;
	};
	class ConfirmButton : StdButton
	{
		idc = 213;
		action = "GRLIB_squadconfirm = 1";

		text = "Confirm"; //--- ToDo: Localize;
		x = 0.204688 * safezoneW + safezoneX;
		y = 0.752 * safezoneH + safezoneY;
		w = 0.0525 * safezoneW;
		h = 0.042 * safezoneH;
		sizeEx = 0.025 * safezoneH;
	};
	class CancelButton : StdButton
	{
		idc = 214;
		action = "GRLIB_squadconfirm = 0";

		text = "Cancel"; //--- ToDo: Localize;
		x = 0.270313 * safezoneW + safezoneX;
		y = 0.752 * safezoneH + safezoneY;
		w = 0.0525 * safezoneW;
		h = 0.042 * safezoneH;
		sizeEx = 0.025 * safezoneH;
	};
	class ButtonClose : StdButton
	{
		action = "closeDialog 0";

		idc = 1014;
		text = "X"; //--- ToDo: Localize;
		x = 0.784944 * safezoneW + safezoneX;
		y = 0.19508 * safezoneH + safezoneY;
		w = 0.015 * safezoneW;
		h = 0.02 * safezoneH;
	};
	class NameLabel : StdSquadLabel
	{
		idc = 201;
		style = 2;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.24996 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.022 * safezoneH;
	};
	class ClassLabel : StdSquadLabel
	{
		idc = 202;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.30008 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class HealthLabel : StdSquadLabel
	{
		idc = 203;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.325 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class DistanceLabel : StdSquadLabel
	{
		idc = 204;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.34992 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class PrimaryLabel : StdSquadLabel
	{
		idc = 205;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.40004 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class PrimaryMagsLabel : StdSquadLabel
	{
		idc = 206;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.42496 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH ;
	};
	class SecondaryLabel : StdSquadLabel
	{
		idc = 207;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.47508 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class SecondaryMagsLabel : StdSquadLabel
	{
		idc = 208;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.5 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class VehicleLabel : StdSquadLabel
	{
		idc = 209;

		x = 0.325306 * safezoneW + safezoneX;
		y = 0.55012 * safezoneH + safezoneY;
		w = 0.11475 * safezoneW;
		h = 0.03 * safezoneH;
		sizeEx = 0.018 * safezoneH;
	};
	class PiPZone : RscText
	{
		idc = 333;
		type = 0;
		style = 48;
		font = "puristaMedium";
		moving = "false";

		text = "#(argb,512,512,1)r2t(rtt,1.333)"; //--- ToDo: Localize;
		x = 0.450519 * safezoneW + safezoneX;
		y = 0.24996 * safezoneH + safezoneY;
		w = 0.3495 * safezoneW;
		h = 0.550001 * safezoneH;
		colorText[] = { 1,1,1,1 };
		colorBackground[] = { 1,1,1,1 };
	};
	class RemoteControlButton : StdButton
	{
		idc = 210;
		action = "GRLIB_squadaction = 4";

		text = "Remote Control"; //--- ToDo: Localize;
		x = 0.204688 * safezoneW + safezoneX;
		y = 0.528 * safezoneH + safezoneY;
		w = 0.118125 * safezoneW;
		h = 0.042 * safezoneH;
		tooltip = "Remote Control the AI"; //--- ToDo: Localize;
		sizeEx = 0.025 * safezoneH;
	};

};