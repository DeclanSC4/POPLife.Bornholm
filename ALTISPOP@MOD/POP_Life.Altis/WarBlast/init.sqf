//fix para los coches
[] execVM "WarBlast\Vehiculosfps\vehicleManager.sqf";
[] execVM "WarBlast\zlt_fastrope.sqf";
[] execVM "WarBlast\Luces\fn_luces.sqf";
[] execVM "WarBlast\Policias\lacrimogeno.sqf";
[] execVM "WarBlast\fn_statusBar.sqf";
// [] execVM "WarBlast\real_weather.sqf";
//[] execVM "WarBlast\randomWeather2.sqf";
//activar cleanup en el servidor
if(isServer) then  {
	[
		3*60, // seconds to delete dead bodies (0 means don't delete)
		2*45, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		1*45, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "WarBlast\repetitive_cleanup.sqf";


//[] execVM "WarBlast\module_cleanup\init.sqf";
//[] execVM "WarBlast\module_monitor\init.sqf";

};

