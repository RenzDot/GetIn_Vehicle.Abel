// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in tanks
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_gunner","_body","_newSeatPos"];

if (count _newSeatPos == 0) exitWith {
	["","All seats taken"] call Renz_fnc_vehicleShowSeat;
};

//Move in cargo or Fire From Vehicle seat
_newSeatType = toLower (_newSeatPos select 1);
if (_newSeatType in ["cargo","Turret"]) then {
	[_body,_newSeatPos] spawn {
		params ["_body","_newSeatPos"];

		_currentPos = assignedVehicleRole player;
		_isInGunner = ((_currentPos select 0) == "Turret") && {(_currentPos select 1) isEqualTo [0]};
	
		//Workaround since some action commands don't work when inside the gunner or driver positions
		_getInCargo = {};
		_newSeatType = (_newSeatPos select 1);
		if (_isInGunner) then {
			_getInCargo = [
				{player moveInCargo [_body, (_newSeatPos select 2)]}, 
				{player moveInTurret [_body, (_newSeatPos select 3)]}
			] select (_newSeatType == "turret");

		} else {
			_getInCargo = [
				{player action ["moveToCargo", _body, (_newSeatPos select 2)]}, 
				{player action ["moveToTurret", _body, (_newSeatPos select 3)]}
			] select (_newSeatType == "turret");
		};

		//switch period for cargo seats
		if (!_isInGunner) then _getInCargo else {
			moveOut player;
			_endTime = diag_tickTime + 0.5;
			waitUntil {
				if (isNull objectParent player) then _getInCargo;
				diag_tickTime > _endTime;
			};

		};


	};	

//Move in driver, commander or gunner
} else {
	[_gunner,_body,_newSeatPos] spawn {
		params ["_gunner","_body","_newSeatPos"];

		_getInDriverOrGunner = switch (toLower (_newSeatPos select 1)) do {
			case "driver" : { {player moveInDriver _body} };
			case "gunner" : { {player moveInTurret [_gunner, (_newSeatPos select 3)]} };
			case "commander" : { {player moveInCommander _gunner} };
		};
		
		//Workaround since moveInDriver/moveInTurret/moveInCommander is not instant
		moveOut player;
		_endTime = diag_tickTime + 0.5;
		waitUntil {
			if (isNull objectParent player) then _getInDriverOrGunner;
			diag_tickTime > _endTime;
		};

	};

};

[	(_newSeatPos select 1), 
	["", str (_newSeatPos select 2)] select ((_newSeatPos select 2) != -1)
] call Renz_fnc_vehicleShowSeat;