#define AT_SPAWN _nearNow=call _atSpawn;{if!(_x in _nearFinal)then{_nearFinal set [count _nearFinal,_x];};}count _nearNow;
private ["_debug","_go","_holder","_isPZombie","_platform","_inDebug","_playerPos","_pos","_distance","_keepGear"];

_debug = getMarkerPos "respawn_west";
_inDebug = false;
if (surfaceIsWater _debug) then {
	_debug set [2,2];
	_platform = "MetalFloor_DZ" createVehicleLocal _debug;
	_platform setPosASL _debug;
	_platform allowDamage false;
	_platform hideObject true;
	_platform enableSimulation false;
};
waitUntil {!isNil "PVDZE_plr_LoginRecord"};
_playerPos 	= dayzPlayerLogin2 select 0;
_isPZombie 	= player isKindOf "PZombie_VB";
_go 		= dayzPlayerLogin2 select 2;
_keepGear 	= dayzPlayerLogin2 select 3;
_pos 		= position player;
_distance 	= _debug distance _pos;

if (_distance < 500) then {_inDebug = true;};

if (_go || _inDebug) then {
	enableEnvironment false;
	0 fadeSound 0;
	if ((player distance _debug) > 100) then {
		_debug = getPosATL player;
		if (surfaceIsWater _debug) then {_debug = getPosASL player;};
	};
	_holder = "Survivor1_DZ" createVehicleLocal _debug;
	if (surfaceIsWater _debug) then {_holder setPosASL _debug;};
	player attachTo [_holder,[0,0,0]];
	_nearFinal = [];
	_atSpawn = {
		private "_ret";_ret=[];
		dayz_temperatur = 36;
		DZE_InRadiationZone = false;
		fnc_usec_damageHandler = {};
		player hideObject true;
		player switchCamera "INTERNAL";
		player setVariable ["combattimeout",0,false];
		{if (!local _x) then {_x hideObject true;};_x allowDamage false;_ret set [count _ret,_x];} count (player nearEntities ["Man",100]);
		_ret
	};
	_hasMap = "ItemMap" in items player;
	_hasGPS = "ItemGPS" in items player;
	#include "class.sqf"
	#include "spawn.sqf"
	#include "halo.sqf"
	#include "startSpawn.sqf"
	
	{_x hideObject false;_x allowDamage true;player reveal _x;} count _nearFinal;
	deleteVehicle _holder;
	fnc_usec_damageHandler = compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\fn_damageHandler.sqf";
	enableEnvironment true;
	0 fadeSound 1;
	if (isNil "_halo") then {cutText ["","BLACK IN"];};
};