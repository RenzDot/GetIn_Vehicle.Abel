// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle","_goRight"];
if (isNull objectParent Player) exitWith {};

(_vehicle call Renz_fnc_vehicleGetGunnerBody) params ["_gunner","_body"];
_newSeatPos = [_gunner,_body,_goRight] call Renz_fnc_vehicleGetNewSeat;

_switchFnc = _body getVariable ["Renz_seatFunction", _gunner getVariable ["Renz_seatFunction", ""]];
if (_switchFnc == "tank") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_vehicleSwitchSeatTank;
};

if (_switchFnc == "car") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_vehicleSwitchSeatCar;
};

if (_switchFnc == "air") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_vehicleSwitchSeatAir;
};

