/*
	Author: quick
	
	Description:
	mis cojones gordos

	this addAction["Capturar Barrio",QUICK_fnc_capturarBarrio,[_barrioBandera,_jugador,_barrioName]];

	Ejemplo -> poner en una bandera de esas 
	this addAction["Capturar Barrio",QUICK_fnc_capturarBarrio,"Las 3000"];
*/
private["_barrioBandera","_jugador","_barrioName","_capturado","_tiempoCaptura","_barrioMetros"];


_barrioBandera= _this select 0;
_jugador= _this select 1;
_barrioName = _this select 2;
_bandaNombre = (group _jugador) getVariable "gang_name";
_capturado = 0;
_tiempoCaptura = 30;
_barrioMetros = 250;


life_action_inUse = true;
disableUserInput true;
//timer
while {_tiempoCaptura > 1} do
{    

	//si muere matamos al timer
  if(!alive _jugador)then{
  	_tiempoCaptura =0;

  };

  

	
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	
	sleep 1;
	
	_tiempoCaptura = _tiempoCaptura - 1;	

		hintSilent format["Tiempo para capturar: %1 ", [((_tiempoCaptura)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
	
 };


//ha terminado el timer
if(_tiempoCaptura<1)then{

	hint "El barrio ha sido capturado";


	if( alive _jugador )then{
		//han capturado el barrio

		
		_flagTexture = [
		"\A3\Data_F\Flags\Flag_red_CO.paa",
		"\A3\Data_F\Flags\Flag_green_CO.paa",
		"\A3\Data_F\Flags\Flag_blue_CO.paa",
		"\A3\Data_F\Flags\Flag_white_CO.paa",
		"\A3\Data_F\Flags\flag_fd_red_CO.paa",
		"\A3\Data_F\Flags\flag_fd_green_CO.paa",
		"\A3\Data_F\Flags\flag_fd_blue_CO.paa",
		"\A3\Data_F\Flags\flag_fd_orange_CO.paa"
		] call BIS_fnc_selectRandom;
		_barrioBandera setFlagTexture _flagTexture;

		
		_barrioBandera setVariable["capturadoPor",_bandaNombre,true];

		//crear markador de capturado
		_pos = position _barrioBandera;
		_markerID = format["marker_%1",floor(random 1000)];
		_marker = createMarker [ _markerID, _pos];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText format["!Barrio capturado por %1!!",_bandaNombre];
		_marker setMarkerType "mil_warning";

		//iniciar recompensas
		[_barrioBandera,_jugador,_barrioMetros,_marker] spawn QUICK_fnc_barrioCapturado;

		//quitar action
		_barrioBandera removeAction _id;


	};

	if(!alive _jugador)then{
		//han capturado el barrio
		titleText["Has fallado al capturar el barrio.","PLAIN"];

	};

	disableUserInput false;
	life_action_inUse = false;
	_barrioBandera setVariable["capturando",false,true];


};
