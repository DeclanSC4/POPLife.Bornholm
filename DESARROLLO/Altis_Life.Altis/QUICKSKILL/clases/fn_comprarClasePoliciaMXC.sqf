#include <macro.h>
waitUntil {!isNull player};

_precio = 28000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_atmcash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };


 //nivel de poli
 if(__GETC__(life_coplevel) < 2) exitWith { hint "No eres poli o rango insuficiente";[] spawn { sleep 5;hint "";} };


//equipar clase poli
life_atmcash = life_atmcash-_precio;

_unit  addWeapon "arifle_MXC_F";
_unit  addItem "optic_Hamr";

_unit addMagazines ["30Rnd_65x39_caseless_mag", 10];

//solo para altis


reload _unit;
if(true) exitWith{hint "Clase Policia mxc equipada";[] spawn { sleep 5;hint "";} };