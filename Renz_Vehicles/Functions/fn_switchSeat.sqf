// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle","_goRight"];
if (isNull objectParent Player) exitWith {};

(_vehicle call Renz_fnc_getGunnerBody) params ["_gunner","_body"];
_newSeatPos = [_gunner,_body,_goRight] call Renz_fnc_getNewSeat;

_switchFnc = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> ( [typeOf _gunner,typeOf _body] select (isNull _gunner)) ), "seatFunction", ""] call BIS_fnc_returnConfigEntry;
if (_switchFnc == "tank") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatTank;
};

if (_switchFnc == "car") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatCar;
};

if (_switchFnc == "air") exitWith {
	[_gunner, _body, _newSeatPos] call Renz_fnc_switchSeatAir;
}

