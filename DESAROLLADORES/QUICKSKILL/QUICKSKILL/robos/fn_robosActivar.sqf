/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Ativar robo "+1 si ya estan robando sino inncluir robo en array global de robos"
*/
private ["_maximoRobosActivo", "_nombreRobo ", "_roboActivo ", "_ladronesEnRobo", "_iFindID"];

_maximoRobosActivos = 2;
_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;
_roboActivo = "no";

///for de robos activos
_iFindID = 0;
{
//nombre robo del array global de robos activos
_nombreRoboCompare = robosActivosGLOBAL select _iFindID;
_nombreRoboCompare = _nombreRoboCompare select 0;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_nombreRobo == _nombreRoboCompare) then {
  // ya estan robando actualizar numero de ladrones
   _ladronesEnRobo = robosActivosGLOBAL select _iFindID;
   _ladronesEnRobo  = _ladronesEnRobo  select 1;
  robosActivosGLOBAL  set [_iFindID,_ladronesEnRobo + 1]
};

//siguiente id 
_iFindID = _iFindID +1;

} forEach robosActivosGLOBAL;

//sino esta en la lista de robosActivos agregamso el robo con 1 ladron inicial
if(_roboActivo == "no") then {

robosActivosGLOBAL pushBack [_nombreRobo,1];

};

publicVariable robosActivosGLOBAL;

	
//terminar script si hay mas de 2 robos activos

///for de robos activos
_robosActivosCount = 0;
_iFindID = 0;
{

	 // mirar cuantos ladrones hay en cada robo
   _ladronesEnRobo = robosActivosGLOBAL select _iFindID;
   _ladronesEnRobo  = _ladronesEnRobo  select 1;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_ladronesEnRobo > 1) then {
 
  _robosActivosCount = _robosActivosCount +1;
};

//siguiente id 
_iFindID = _iFindID +1;

} forEach robosActivosGLOBAL;


if(_robosActivosCount > _maximoRobosActivos ) exitWith{[]spawn { sleep 3;hint "Hay demasiados robos activos, espera a que terminen para poder robar";sleep 3;} };

