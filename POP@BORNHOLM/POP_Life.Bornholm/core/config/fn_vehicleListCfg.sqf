#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000 * Desc],
			["C_Kart_01_Fuel_F",15000 * Desc],
			["C_Kart_01_Red_F",15000 * Desc],
			["C_Kart_01_Vrana_F",15000 * Desc]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",5000 * Desc],
			["C_SUV_01_F",9500 * Desc],
			["ambulancia_f",1000 * Desc]
		];
	};

	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",50000 * Desc]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2000 * Desc],
			["C_Van_01_transport_F",23000 * Desc],
			["C_Hatchback_01_sport_F",41500 * Desc],
			["DAR_TahoeCiv",17500 * Desc],
			["DAR_FusionCiv",17000 * Desc],
			["DAR_TaurusCiv",17500 * Desc],
			["DAR_ImpalaCivA",17600 * Desc],
			["cl3_civic_vti_black",18700 * Desc],
			["cl3_polo_gti_black",18700  * Desc],
			["cl3_insignia_black",18000 * Desc],
			["cl3_range_rover_black",19800 * Desc],
			["Orel_Monster",45000 * Desc],
			["cl3_e63_amg_black",78000 * Desc],
			["cl3_dodge_charger_s_black",82500 * Desc],
			["cl3_z4_2008_black",55400 * Desc]

		];

			if(__GETC__(life_donator) == 1) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
		};
			if(__GETC__(life_donator) == 2) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black", 3700000 * Desc];
		};
			if(__GETC__(life_donator) == 3) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black",3700000 * Desc];
			_return pushBack ["cl3_r8_spyder_black",2070000 * Desc];
		};
			if(__GETC__(life_donator) == 4) then
			{
		    _return pushBack ["B_Quadbike_01_F",2500 * Desc];
			_return pushBack ["C_Van_01_transport_F",40000 * Desc];
			_return pushBack ["C_Hatchback_01_sport_F",60000 * Desc];
			_return pushBack ["cl3_civic_vti_black",67000 * Desc];
			_return pushBack ["cl3_polo_gti_black",70000 * Desc];
			_return pushBack ["cl3_insignia_black",70000 * Desc];
			_return pushBack ["cl3_range_rover_black",70000 * Desc];
			_return pushBack ["Orel_Monster",1070000 * Desc];
			_return pushBack ["cl3_e63_amg_black",1170000 * Desc];
			_return pushBack ["cl3_dodge_charger_s_black",2070000 * Desc];
			_return pushBack ["cl3_z4_2008_black",700000 * Desc];
			_return pushBack ["cl3_carrera_gt_black",2217000 * Desc];
			_return pushBack ["cl3_dbs_volante_black",3700000 * Desc];
			_return pushBack ["cl3_r8_spyder_black",2070000 * Desc];
			_return pushBack ["cl3_murcielago_black",2070000 * Desc];
			_return pushBack ["cl3_reventon_black",4170000 * Desc];
		};
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",21400 * Desc],
			["I_Truck_02_transport_F",32800 * Desc],
			["I_Truck_02_covered_F",53700 * Desc],
			["B_Truck_01_transport_F",64500 * Desc],
			["O_Truck_03_transport_F",37800 * Desc],
			["O_Truck_03_covered_F",40100 * Desc],
			["B_Truck_01_box_F",67200 * Desc],
			["O_Truck_03_device_F",69900 * Desc]
		];
		if(license_civ_rebel) then {
			_return pushBack ["O_Truck_02_transport_F",32800 * Desc];
			_return pushBack ["O_Truck_02_covered_F",53700 * Desc];
			_return pushBack ["O_Truck_03_transport_F",64500 * Desc];
		    _return pushBack ["O_Truck_03_covered_F",40100 * Desc];
			_return pushBack ["O_Truck_03_fuel_F",65000 * Desc];
			_return pushBack ["O_Truck_03_device_F",69900 * Desc];
		};
	};


	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2000 * Desc],
			["B_G_Offroad_01_F",17500 * Desc],
			["O_MRAP_02_F",85000 * Desc],
			["DAR_MK23",65000 * Desc],
			["DAR_LHS_16",65000 * Desc],
			["DAR_4X4",65000 * Desc],
			["DAR_MK27T",65000 * Desc],
			["DAR_MK23",65000 * Desc],
			["B_Heli_Light_01_F",750000 * Desc]
		];

		if(license_civ_rebel) then
		{
			_return pushBack ["O_MRAP_02_hmg_F",6900000 * Desc];
			_return pushBack ["B_G_Offroad_01_armed_F",1200000 * Desc];
		};
	};

	case "cop_car":
	{
		_return pushBack ["TDR_Taurus_CNP_ST",1000 * Desc];
		_return pushBack ["TDR_Tahoe_K",20500 * Desc];
		_return pushBack ["TDR_Explorer_K",20500 * Desc];
		_return pushBack ["TDR_Taurus_CNP_ST",20500 * Desc];

		if(__GETC__(life_coplevel) >= 6) then
			{
		_return pushBack ["B_MRAP_01_F",20500 * Desc];
		};

		if(__GETC__(life_coplevel) >= 7) then
			{
		_return pushBack ["B_MRAP_01_hmg_F",20500 * Desc];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["TDR_Explorer_GC",20500 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_Tahoe_K",30500 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_BlindadoGEO",30500 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["TDR_Explorer_K",30500 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["TDR_Taurus_CNP_ST",20500* Desc];
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			_return pushBack ["Orel_Dingo",45000 * Desc];
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",750000 * Desc],
			["dezkit_b206x_unarmed",560000 * Desc],
			["dezkit_b206_news",560000 * Desc],
			["dezkit_b206_ls",560000 * Desc],
			["dezkit_b206x_unarmed",560000 * Desc],
			["C_Heli_Light_01_civil_F", 805000 * Desc],
			["O_Heli_Light_02_unarmed_F",1800000 * Desc],
			["I_Heli_Transport_02_F",3500000 * Desc],
			["O_Heli_Transport_04_F",3850000 * Desc],
			["O_Heli_Transport_04_bench_F", 3700000 * Desc],
			["O_Heli_Transport_04_covered_F", 3150000 * Desc],
			["B_Heli_Transport_03_F", 3450000 * Desc],
			["B_Heli_Attack_01_F", 7500000 * Desc],
			["O_Heli_Attack_02_F", 7800000 * Desc]
		];
	};

	case "cop_air":
	{
			_return pushBack ["B_Heli_Light_01_F",130000 * Desc];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_F",170000 * Desc];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",250000 * Desc];
			_return pushBack ["O_Heli_Transport_04_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_box_F", 350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_covered_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",350000 * Desc];
			_return pushBack ["B_Heli_Transport_03_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["ec135_policia_f", 50000 * Desc];
		};
	};

	case "cop_airhq":
	{
			_return pushBack ["B_Heli_Light_01_F",130000 * Desc];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_Heli_Transport_01_F",170000 * Desc];
			_return pushBack ["B_Heli_Transport_03_unarmed_F",250000 * Desc];
			_return pushBack ["O_Heli_Transport_04_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_bench_F",350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_box_F", 350000 * Desc];
			_return pushBack ["O_Heli_Transport_04_covered_F", 350000 * Desc];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",350000 * Desc];
			_return pushBack ["B_Heli_Transport_03_F", 350000 * Desc];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000 * Desc],
			["C_Boat_Civil_01_F",18500 * Desc]
		];
		if(license_civ_rebel) then {
		_return pushBack ["O_Boat_Transport_01_F",9700 * Desc];
		_return pushBack ["B_Boat_Armed_01_minigun_F",200000 * Desc];
		_return pushBack ["O_SDV_01_F",250000 * Desc];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000 * Desc],
			["C_Boat_Civil_01_police_F",15800 * Desc],
			["B_Boat_Armed_01_minigun_F",75000 * Desc],
			["B_SDV_01_F",75000 * Desc]
		];
	};

	case "merc_c":
	{
        if(__GETC__(life_merclevel) == 1) then {
		_return pushBack	["I_Quadbike_01_F",1000 * Desc];
		_return pushBack	["I_G_Offroad_01_F",9000 * Desc];
		_return pushBack	["I_G_Offroad_01_armed_F",450000 * Desc];
		_return pushBack	["C_Hatchback_01_sport_F",9000 * Desc];
		_return pushBack	["ffaa_et_vamtac_ume",39000 * Desc];
		_return pushBack	["ffaa_et_anibal",39000 * Desc];
        };
        if(__GETC__(life_merclevel) == 2) then {
		_return pushBack	["I_MRAP_03_F",1200000 * Desc];
		_return pushBack	["I_MRAP_03_hmg_F",2500000 * Desc];
		_return pushBack	["ffaa_et_rg31_samson",2500000 * Desc];
		_return pushBack	["ffaa_et_vamtac_ume",39000 * Desc];
		_return pushBack	["ffaa_et_anibal",39000 * Desc];
		_return pushBack	["I_Quadbike_01_F",1000 * Desc];
		_return pushBack	["I_G_Offroad_01_F",9000 * Desc];
		_return pushBack	["I_G_Offroad_01_armed_F",450000 * Desc];
		_return pushBack	["C_Hatchback_01_sport_F",9000 * Desc];
        };
    };

    case "merc_a":
	{
        if(__GETC__(life_merclevel) >= 1) then {
		_return pushBack	["B_Heli_Light_01_F",300000 * Desc];
		_return pushBack	["O_Heli_Light_02_unarmed_F",450000 * Desc];
		_return pushBack	["I_Heli_light_03_unarmed_F",550000 * Desc];
        };
        if(__GETC__(life_merclevel) >= 3) then {
        _return pushBack    ["B_Heli_Light_01_armed_F", 3500000 * Desc];
        _return pushBack	["B_Heli_Light_01_F",300000 * Desc];
		_return pushBack	["O_Heli_Light_02_unarmed_F",450000 * Desc];
		_return pushBack	["I_Heli_light_03_unarmed_F",550000 * Desc];
        };
    };

	case "reb_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",750000 * Desc],
			["C_Heli_Light_01_civil_F",805000 * Desc],
			["O_Heli_Light_02_unarmed_F",1800000 * Desc],
			["I_Heli_Transport_02_F",3500000 * Desc],
			["O_Heli_Transport_04_F",3850000 * Desc],
			["O_Heli_Transport_04_bench_F",3700000 * Desc],
			["O_Heli_Transport_04_covered_F",3150000 * Desc],
			["B_Heli_Transport_03_F",3450000 * Desc],
			["B_Heli_Attack_01_F",7500000 * Desc],
			["O_Heli_Attack_02_F",7800000 * Desc]
		];
	};
};

_return;
