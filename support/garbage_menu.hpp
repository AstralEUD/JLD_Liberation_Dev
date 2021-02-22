class CfgCommunicationMenu
{
	class AST_garbage_menu
	{
		text = "Garbage Cleaner";
		submenu = "";
		expression = "[player] remoteExec ['AST_Garbage_Cleaner', 2]";
		icon = "\a3\Ui_f\data\GUI\Cfg\CommunicationMenu\defend_ca.paa";
		cursor = "\a3\Ui_f\data\IGUI\Cfg\Cursors\iconCursorSupport_ca.paa";
		enable = "1";
		removeAfterExpressionCall = 0;
	};
};