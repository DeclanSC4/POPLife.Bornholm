private["_gather","_itemWeight","_diff","_itemName"];

[] spawn {
hint "Has plantado tomates, madurara en 2:30 minuto";
_plantador = player;
_planta = "Sign_Arrow_Large_F" createVehicle position _plantador;
_planta enableSimulation false;
_plantaPos = position _planta;	

_time = 160;
sleep _time;
hint "Los tomates están listos, tienes 1 minuto para recogerla"; 
deleteVehicle _planta;
_fruto = "Land_Sack_F" createVehicle _plantaPos;
_fruto enableSimulation false;
_fruto addAction["Recoger todos los tomates",QUICK_recogerFrutosTomate,_fruto];

sleep 60;
deleteVehicle _fruto;
};





QUICK_recogerFrutosTomate = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 
 _gen removeAction _id;
 _frutos = 2 + round random 8;
 _fruto =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;




for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1.5;
};

[true,"tomates",_frutos] call life_fnc_handleInv;

hint format["Has recogido %1 tomates",_frutos]; 

sleep 2;

hint "";


};