class CfgCommunicationMenu
{
	class GRLIB_support_transport_menu
	{
		text = "Request a transport helicopter (costs 4 ammos)";
		submenu = "";
		expression = "[_this select 0, _this select 1] remoteExec ['GRLIB_support_transport', 2]";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\transport_ca.paa";
		cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
	};
};