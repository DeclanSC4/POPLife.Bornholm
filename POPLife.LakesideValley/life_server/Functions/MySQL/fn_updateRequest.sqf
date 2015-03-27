 /*
		File: fn_updateRequest.sqf
		Author: Bryan "Tonic" Boardwine

		Description:
		Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread","_isArrested","_civPosition","_isAlive"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};

//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
		_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
		_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

//Side specific parsing
switch (_side) do {
	case civilian: {
		_isArrested = [_this, 7, false, [false]] call BIS_fnc_param;
		_isArrested = [_isArrested] call DB_fnc_bool;
		_civPosition = [_this,8,[[]]] call BIS_fnc_param;
		_civPosition = [_civPosition] call DB_fnc_mresArray;
		_isAlive = [_this,9,false,[false]] call BIS_fnc_param;
		_isAlive = [_isAlive] call DB_fnc_bool;
	};
};

switch (_side) do {
		case west: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', cop_gear='%4', cop_licenses='%5' WHERE playerid='%6'",_name,_cash,_bank,_gear,_licenses,_uid];};
		case civilian: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', civ_licenses='%4', civ_gear='%6', arrested='%7', civPosition='%8', alive='%9' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear,_isArrested,_civPosition,_isAlive]};
		case independent: {_query = format["UPDATE players SET name='%1', cash='%2', bankacc='%3', med_licenses='%4', med_gear='%6' WHERE playerid='%5'",_name,_cash,_bank,_licenses,_uid,_gear];};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["RESULT: %1",_query];
diag_log "------------------------------------------------";
