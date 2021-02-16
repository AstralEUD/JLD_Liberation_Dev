class ctMe{
	idd=100;
	controls[]=
	{
		CTMENU
	};
	class ContextMenu;	

	class CTMENU:ContextMenu
	{
		idc=1100;
		type=46;
		style = 0x00;
		shadow=1;	
		//x = 0.4 * safezoneW + safezoneX;
		//y = 0.5 * safezoneH + safezoneY;
		x=getMousePosition#0;
		y=getMousePosition#1;		
		w="0";
		h="0";
		sizeEx="4.32 * (1 / (getResolution select 3)) * pixelGrid * 0.5";
		font="RobotoCondensedLight";
		colorBorder[]={0,0,0,0};
		colorBackground[]={0.1,0.1,0.1,1};
		colorText[]={1,1,1,1};
		colorSelect[]={0,0,0,1};
		colorSelectBackground[]=
		{
			"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])",
			"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])",
			1
		};
		colorDisabled[]={1,1,1,0.25};
		colorPicture[]={1,1,1,1};
		colorPictureSelect[]={0,0,0,1};
		colorPictureDisabled[]={1,1,1,0.5};
		arrow="\a3\3DEN\Data\Controls\ctrlMenu\arrow_ca.paa";
		rowHeight=0;
		itemSpacingW=0.0099999998;
		itemSpacingH=0.0099999998;
		pictureCheckboxEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureCheckboxEnabled_ca.paa";
		pictureCheckboxDisabled="#(argb,8,8,3)color(0,0,0,0)";
		pictureRadioEnabled="\a3\3DEN\Data\Controls\CtrlMenu\pictureRadioEnabled_ca.paa";
		pictureRadioDisabled="#(argb,8,8,3)color(0,0,0,0)";
		class Items
		{
			items[]=
			{
				"gesture",
				"entry1",
				"Separator",
				"AIreviverequest",
				"radioToggle",
				"holster",
				"earplug",
				"Separator",
				"extmenu"
			};
			class Separator
			{
				value=0;
			};
			class entry1
			{
				text = "스트로브/야광봉 사용";
				action = "systemchat ""Selected first entry."";";
				conditionShow="1";
				items[]=
				{
					"entry2",
					"entry3",
					"entry4",
					"entry5",
					"entry6",
					"Separator",
					"entry7"
				};
			};
			class entry2
			{
				text = "IR스트로브 켜기";
				action = "[] spawn LALA_fnc_IRStrobeOn;";
				picture="a3\weapons_f_epb\Ammo\Data\UI\gear_B_IRstrobe_CA.paa";
				conditionShow="1";
			};
			class entry3
			{
				text = "녹색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn1;";
				picture="a3\weapons_f\Data\UI\M_chemlight_green_CA.paa";
				conditionShow="1";
			};
			class entry4
			{
				text = "황색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn2;";
				picture="a3\weapons_f\Data\UI\M_chemlight_yellow_CA.paa";
				conditionShow="1";
			};
			class entry5
			{
				text = "청색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn3;";
				picture="a3\weapons_f\Data\UI\M_chemlight_blue_CA.paa";
				conditionShow="1";
			};
			class entry6
			{
				text = "적색 야광봉 켜기";
				action = "[] spawn LALA_fnc_IRchemOn4;";
				picture="a3\weapons_f\Data\UI\M_chemlight_red_CA.paa";
				conditionShow="1";
			};
			class entry7
			{
				text = "모두 끄기";
				action = "[] spawn LALA_fnc_IRStrobeOff;[] spawn LALA_fnc_IRchemOff1;";
				conditionShow="1";
			};	
			class gesture
			{
				text = "수신호";
				action = "";
				conditionShow="1";	
				items[]=
				{
					"gesture1",
					"gesture3",
					"gesture4",
					"gesture5",
					"gesture6",
					"Separator",
					"gesture7",
					"gesture71",
					"gesture8",
					"gesture9"
				};
			};	
			class gesture1
			{
				text = "진격하라";
				action = "player playAction ""gestureAdvance"";""앞으로 진격!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture3
			{
				text = "사격중지";
				action = "player playAction ""gestureCeaseFire"";""사격중지! 사격중지!!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture4
			{
				text = "사격개시";
				action = "player playAction ""gestureCover"";""사격 개시!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};		
			class gesture5
			{
				text = "따라와라";
				action = "player playAction ""gestureFollow"";""따라와!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};	
			class gesture6
			{
				text = "멈춰라";
				action = "player playAction ""gestureFreeze"";""정지!"" call SAKY_Gesture_Send;";
				conditionShow="1";
			};	
			class gesture7
			{
				text = "이륙 수신호";
				action = "[""Acts_JetsShooterShootingLaunch_loop_m""] spawn Test_PlayAnim;";				
				conditionShow="1";
			};	
			class gesture71
			{
				text = "유도 수신호";
				action = "[""Acts_JetsShooterNavigate_loop""] spawn Test_PlayAnim;";				
				conditionShow="1";
			};	
			class gesture8
			{
				text = "시동 수신호";
				action = "[""Acts_JetsMarshallingEnginesOn_loop""] spawn Test_PlayAnim;";
				conditionShow="1";
			};	
			class gesture9
			{
				text = "정지 수신호";
				action = "[""Acts_JetsMarshallingEmergencyStop_loop""] spawn Test_PlayAnim;";
				conditionShow="1";
			};	
			class AIreviverequest
			{
				text = "AI에게 소생 요청";
				action = "call AI_revive_request";
				picture = "\a3\weapons_f\data\ui\gear_item_radio_ca.paa";				
				conditionShow="1";			
			class radioToggle
			{
				text = "전술통신망 토글";
				action = "call Radio_Toggle;";
				picture = "\a3\weapons_f\data\ui\gear_item_radio_ca.paa";				
				conditionShow="1";
			};
			class earplug
			{
				text = "이어플러그 착용/해제";
				action = "call Test_Earplug";
				picture = "\A3\Characters_F_Orange\Headgear\Data\UI\icon_H_EarProtectors_orange_F_CA.paa";
				conditionShow="1";
			};									
			class holster
			{
				text = "무기 집어넣기";
				action = "call CRS_Holster";
				picture = "\a3\weapons_f\pistols\p07\data\ui\gear_p07_x_ca.paa";
				conditionShow="1";
			};								
			class extmenu
			{
				text = "추가설정메뉴";
				action = "[] spawn GRLIB_ExtMenu;";
				conditionShow="1";
			};
			class Default
			{
				text="";
				data="Empty";
				action = "systemchat ""Selected Nothing."";";
				enable=0;
			};
		};
	};
};