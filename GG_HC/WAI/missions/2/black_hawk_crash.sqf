private ["_complete","_crate_type","_mission","_position","_crate","_baserunover"];
_position = [30] call find_position2;
_mission = [_position,"Medium","Black Hawk Crash","MainHero",true] call mission_init2;	

diag_log 		format["WAI: [Mission:[Hero] Black Hawk Crash]: Starting... %1",_position];

//Setup the crate
_crate_type = crates_medium call BIS_fnc_selectRandom;
_crate = createVehicle [_crate_type,[(_position select 0),(_position select 1),0],[],0,"CAN_COLLIDE"];

//Base
_baserunover = createVehicle ["UH60_ARMY_Wreck_burned_DZ",[((_position select 0) + 5), ((_position select 1) + 5), 0],[],10,"FORM"];
_baserunover 	setVectorUp surfaceNormal position _baserunover;

//Troops
[[_position select 0,_position select 1,0],(2 + round(random 3)),"Medium",["Random","AT"],4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;
[[_position select 0,_position select 1,0],3,"Medium","Random",4,"Random","Bandit","Random","Bandit",_mission] call spawn_group2;

//Static Guns
[[
	[(_position select 0) - 20, (_position select 1) - 20, 0]
],"M2StaticMG","Easy","Bandit","Bandit",0,2,"Random","Random",_mission] call spawn_static2;

//Condition
_complete = [
	[_mission,_crate],	// mission number and crate
	["crate"], 			// ["crate"], or ["kill"], or ["assassinate", _unitGroup],
	[_baserunover], 	// cleanup objects
	"A Black Hawk carrying supplies has crashed and bandits are securing the site! Check your map for the location!",	// mission announcement
	"The crashed black hawk and supplies have been secured, well done!",												// mission success
	"The black hawk was not secured in time!"															// mission fail
] call mission_winorfail2;

diag_log format["WAI: [Mission:[Hero] Black Hawk Crash]: Ended at %1",_position];

if (_complete) then {[_crate] call spawn_ammo_box};

h_missionrunning2 = false;