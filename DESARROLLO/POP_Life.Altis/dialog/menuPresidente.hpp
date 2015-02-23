/**
* Archivo: fn_menuPresidente.sqf
* Autor: Rosen
* Descripcion: Menu del presidente.
*
**/

class life_presidente_menu 
{
	idd = 1900;
	name= "life_presidente_menu";
	movingEnable = false;
	enableSimulation = true;
	
	
	class controlsBackground {
		class Presi_RscTitleBackground : life_RscText {
			colorBackground[] = {0.4, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2;
			w = 0.5;
			h = (1 / 25);
		};
		
		class MainBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.2 + (11 / 250);
			w = 0.5;
			h = 0.45 - (22 / 250);
		};	
	};
	
	class controls 
	{
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Menu del presidente";
			x = 0.3;
			y = 0.2;
			w = 0.8;
			h = (1 / 25);
		};
		
		class Legalizar: life_RscButtonMenu
		{
			idc = -1;
			text = "Legalizar Marihuana";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[marijuana] spawn AKR_fnc_makeLegal;";
			x = 22;
			y = 15;
			w = 15;
			h = 2;
		};
		
		class Ilegalizar: life_RscButtonMenu
		{
			idc = -1;
			text = "Ilegalizar Marihuana";
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			onButtonClick = "[marijuana] spawn AKR_fnc_makeIlegal;";
			x = 40;
			y = 15;
			w = 15;
			h = 2;
		};

		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "Cerrar";
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.65 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};