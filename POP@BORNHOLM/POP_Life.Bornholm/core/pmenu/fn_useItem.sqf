/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item","_sed","_hambre"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

_hambre = (profileNamespace getVariable "hambre");
_sed = (profileNamespace getVariable "sed");

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			profileNamespace setVariable ["sed", _sed + 45];
			player setFatigue 0;
			if(_sed > 100) then {_sed = 100; player setFatigue 1; hint "Bebistes demasiado!"; profileNamespace setVariable ["sed",_sed];};

		};
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			profileNamespace setVariable ["sed", _sed + 30];
			player setFatigue 0;
			if(_sed > 100) then {_sed = 100; player setFatigue 1; hint "Bebistes demasiado!";};
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item in ["rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};

	///cositas quick!!
	 //usar gps
	case (_item == "gpsEspia"): {
		///usar gps espia en jugador



		    //quitar 1 gps
			[false,"gpsEspia",1] call life_fnc_handleInv;

			_espia = player;
			_espiado = cursorTarget;

			_script_handler = [_espia,_espiado] spawn QUICK_fnc_gpsEspia;



	};

	 //usar semillas
	case (_item == "semillasMaria"): {

			[false,"semillasMaria",1] call life_fnc_handleInv;

						_script_handler = [] spawn QUICK_fnc_plantarMaria;



	};

	case (_item == "semillasCoca"): {

			[false,"semillasCoca",1] call life_fnc_handleInv;

						_script_handler = [] spawn QUICK_fnc_plantarCoca;



	};


	case (_item == "semillasTomate"): {

			[false,"semillasTomate",1] call life_fnc_handleInv;

						_script_handler = [] spawn QUICK_fnc_plantarTomates;



	};

	case (_item == "semillasMaiz"): {

			[false,"semillasMaiz",1] call life_fnc_handleInv;

						_script_handler = [] spawn QUICK_fnc_plantarMaiz;



	};


	//usar droga

	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 80;
			life_hunger = 80;
			[] spawn
			{
				switch(round(random(5))) do {
					case 0: { titleText["¡Que white widow mas buena!","PLAIN"]; };
					case 1: { titleText["¡Bua como rompe el pecho!","PLAIN"]; };
					case 2: { titleText["¡Este a caraperro!","PLAIN"]; };
					case 3: { titleText["¡Pasate ese mail y hazte otro!","PLAIN"]; };
					case 4: { titleText["Este peta es hidroponico","PLAIN"]; };
					case 5: { titleText["A cogollo regalao no le mires la resina","PLAIN"]; };
				};
				["marijuana"] spawn QUICK_fnc_drugsEffects;
			};
		};
	};



	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			["heroinp"] spawn QUICK_fnc_drugsEffects;
		};
	};

	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 80;
			[] spawn
			{

				switch(round(random(4))) do {
					case 0: { titleText["¡Bua esta es pura!","PLAIN"]; };
					case 1: { titleText["¡Esto no lleva corte!","PLAIN"]; };
					case 2: { titleText["¡Un pollito entero!","PLAIN"]; };
					case 3: { titleText["Una raya detras de otra","PLAIN"]; };
					case 4: { titleText["Pim Pam toma lacasitos...","PLAIN"]; };
				};

				["cocainep"] spawn QUICK_fnc_drugsEffects;


			};
		};
	};
};


[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;