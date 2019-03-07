// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle","_goRight"];
(_vehicle call Renz_fnc_getTurretBody) params ["_turret","_body"];

if (_turret == _body) exitWith {};

_switchFnc = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret), "seatFunction", ""] call BIS_fnc_returnConfigEntry;
if (_switchFnc == "tank") exitWith {
	[_vehicle,_goRight] call Renz_fnc_switchSeatTank;
};

if (_switchFnc == "car") exitWith {
	[_vehicle,_goRight] call Renz_fnc_switchSeatCar;
};

if (_switchFnc == "air") exitWith {
	[_vehicle,_goRight] call Renz_fnc_switchSeatAir;
}

