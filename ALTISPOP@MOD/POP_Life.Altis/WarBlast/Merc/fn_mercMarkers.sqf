/*
	File: fn_mercMarkers.sqf
	Author: WarBlast

	Description:
	Marcadores
*/
private["_markers","_cops"];
_markers = [];
_gunits = [];

if(isNull (group player)) exitWith {};

sleep 0.5;
if(visibleMap) then {
	{if(side _x == opfor) then {_gunits pushBack _x;}} foreach (units group player); // Solo los de su grupo

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];

		_markers pushBack [_marker,_x];
	} foreach _gunits;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_gunits = [];
};