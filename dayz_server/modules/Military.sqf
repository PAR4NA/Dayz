private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_loot_box = "USVehicleBox";
//Random Loot List
_loot_lists = [
[
["G36a","G36C","G36_C_SD_eotech","G36K","MP5A5","MP5SD"],
["20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD","20Rnd_556x45_Stanag","30Rnd_556x45_G36","30Rnd_556x45_G36SD","30Rnd_556x45_Stanag","30Rnd_556x45_StanagSD","30Rnd_9x19_MP5","30Rnd_9x19_MP5SD","15Rnd_9x19_M9SD"]
],
[
["BAF_LRR_scoped"],
["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"]
],
[
["BAF_LRR_scoped_W"],
["5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1"]
],
[
["revolver_gold_EP1"],
["HandGrenade_West","SmokeShell","SmokeShellGreen","SmokeShellRed","SmokeShellYellow","SmokeShellOrange","SmokeShellPurple","SmokeShellBlue","PipeBomb","Mine","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","PipeBomb"]
],
[
["M32_EP1"],
["1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203","1Rnd_HE_M203"]
],
[
["RPG7V"],
["PG7V","PG7V","PG7VR"]
],
[
["M107"],
["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]
],
[
["USSR_cheytacM200"],
["USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408","USSR_5Rnd_408"]
],
[
["BAF_AS50_scoped"],
["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107"]
],
[
["DMR","M4SPR","M8_sharpshooter","M24","M40A3"],
["20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24"]
],
[
["MG36","Mk_48","M240","M249","M8_SAW"],
["100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249"]
],
[
["M16A2","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
],
[
["M8_carbine","M8_carbineGL","M8_compact"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
waitUntil {!isNil "DZMSStatLocs"}; 
 
_loot_amount = 75;
_wait_time = 300; 
 
// Dont mess with theses unless u know what yours doing
_start_time = time;
 
if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};
 
// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};
 

EPOCH_EVENT_RUNNING = true;
 
// Random location
_position = DZMSStatLocs call BIS_fnc_selectRandom;
 
diag_log(format["Spawning loot event at %1", _position]);

_markerRadius = 350;
_markershape = "ELLIPSE";
_markercolor = "ColorRed";
_missiontype = 0;
_refreshmarker = [_position,_markerRadius,_markershape,_markercolor,_missiontype,_start_time] execVM "\z\addons\dayz_server\modules\refreshmarker.sqf";
 
_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;
 
diag_log(format["Creating ammo box at %1", _loot_pos]);
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;
 
// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Military Crate</t><br/><t align='center' color='#ffffff'>A special forces unit lost a precious cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

//Wait until player is Near.
waitUntil{
sleep 1;
(({isPlayer _x && _x distance _loot_box <= 5} count playableUnits > 0));
};

_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Military Crate</t><br/><t align='center' color='#ffffff'>Precious Military Cargo Has been captured!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorRed";
_debug_marker setMarkerAlpha 1;

EPOCH_EVENT_RUNNING = false;
sleep 30;
deleteMarker _event_marker;

// Wait
sleep _wait_time;
 
// Clean up
deleteVehicle _loot_box;
deleteVehicle _clutter;
deleteMarker _debug_marker;
