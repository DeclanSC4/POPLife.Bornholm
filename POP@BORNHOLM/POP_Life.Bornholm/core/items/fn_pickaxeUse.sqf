/*
	File: fn_pickaxeUse.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for pickaxe in mining.
*/
closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch (true) do
{
	case (player distance (getMarkerPos "Cobre_1") < 30): {_mine = "copperore"; _val = 2;};
	case (player distance (getMarkerPos "hierro_1") < 30): {_mine = "ironore"; _val = 2;};
	case (player distance (getMarkerPos "oro_1") < 120) : {_mine = "oro"; _val = 4;};
	case (player distance (getMarkerPos "carbon_1") < 75) : {_mine = "carbon"; _val = 5;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 1;};
	case (player distance (getMarkerPos "platino_1") < 40) : {_mine = "platino"; _val = 1;};
	case (player distance (getMarkerPos "platino_2") < 40) : {_mine = "platino"; _val = 1;};
	case (player distance (getMarkerPos "granito_1") < 50): {_mine = "granito"; _val = 2;};
	default {_mine = "";};
};
//Mine check
if(_mine == "") exitWith {hint localize "STR_ISTR_Pick_NotNear"};
if(vehicle player != player) exitWith {hint localize "STR_ISTR_Pick_MineVeh";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

_time = 0;
_profName = [_mine] call life_fnc_profType;
if( _profName != "" ) then
{
_data = missionNamespace getVariable (_profName);
_time = ( 3 - (0.25 * (_data select 0)));
};

for "_i" from 0 to 2 do
{
player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
sleep _time;
};


if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
_itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
titleText[format[localize "STR_ISTR_Pick_Success",_itemName,_diff],"PLAIN"];
if( _profName != "" ) then
{
[_profName,25] call life_fnc_addExp;
};
};

life_action_inUse = false;