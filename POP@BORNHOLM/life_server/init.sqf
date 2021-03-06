#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.

_extDB = false;

//Only need to setup extDB once.
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	//extDB Version
	_result = "extDB" callExtension "9:VERSION";
	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {};
	if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};

	//Initialize the database
	_result = "extDB" callExtension "9:DATABASE:Database2";
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	"extDB" callExtension "9:LOCK";
	_extDB = true;
	diag_log "extDB: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	_extDB = true;
	diag_log "extDB: Still Connected to Database";
};

//Broadbase PV to Clients, to warn about extDB Error.
//	exitWith to stop trying to run rest of Server Code
if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB: Error checked extDB/logs for more info";
};

//Run procedures for SQL cleanup on mission start.
["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs
//["CALL setPlayerDead",1] spawn DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;
life_merclevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\life_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_emergencias = radioChannelCreate [[1, 0, 0, 0.8], "Emergencias", "%UNIT_NAME", []];

serv_sv_use = [];

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_group_list = [];
publicVariable "life_group_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1];
	};
};


//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;

//WarBlast: Mapa Dinamico
//[] execVM "\life_server\Functions\WarBlast\fn_spawnHeliCrash.sqf";
//call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";
//[] execVM "\life_server\Functions\WarBlast\fn_spawnNaufragios.sqf";
//call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";
//airdrop
//[] execVM "\life_server\Functions\airdrop\config.sqf";
//[] execVM "\life_server\Functions\airdrop\fn_generateAirdropAuto.sqf";
[
		10*60, // seconds to delete dead bodies (0 means don't delete)
		2*60, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		1*45, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "life_server\repetitive_cleanup.sqf";

life_server_isReady = true;
publicVariable "life_server_isReady";
