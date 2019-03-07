// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle","_goRight"];
(_vehicle call Renz_fnc_getTurretBody) params ["_gunner","_body"];
if (_gunner == _body) exitWith {};

_newSeatPos = [_gunner,_body,_goRight] call Renz_fnc_getNewSeat;

_switchFnc = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _gunner), "seatFunction", ""] call BIS_fnc_returnConfigEntry;
if (_switchFnc == "tank") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatTank;
};

if (_switchFnc == "car") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatCar;
};

if (_switchFnc == "air") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatAir;
}

