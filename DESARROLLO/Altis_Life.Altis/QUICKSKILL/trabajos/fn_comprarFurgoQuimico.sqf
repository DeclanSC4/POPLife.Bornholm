///comprar camion pa hacer drogas!! by quickskill para plata o plomo
waitUntil {!isNull player};

_precio = 1000000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
_vendedor = player;
_coche = "O_Truck_02_box_F" createVehicle position _vendedor;
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
_carga =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0, 2, 0.6] ];
_carga enableSimulation false;
_carga =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0.7, 2, 0.6] ];
_carga enableSimulation false;
_carga =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga attachTo [_coche, [-0.7, 2, 0.6] ];
_carga enableSimulation false;

_coche addAction["Cocinar Meta", QUICK_fnc_cocinarMeta,_coche];


//cargar skin globalmente

//cargar skin globalmente


//deorar furgo



//añadir action de cocinar 


if(true) exitWith{hint "Has comprado un camion laboratorio!!";[] spawn { sleep 5;hint "";} };