/*
	File: fn_removeWeaponAction.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Desc:
	Search for weapons
*/
private["_unit"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "No puede buscar en esta persona."};
if(isNull _unit) exitWith {};

hint "Buscando armas...";

[[player],"life_fnc_removeWeapons",_unit,false] spawn life_fnc_MP;
life_action_inUse = false;