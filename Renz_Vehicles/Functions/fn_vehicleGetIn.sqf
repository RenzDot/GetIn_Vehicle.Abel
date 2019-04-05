// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Moves player inside a vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle"];
(_vehicle call Renz_fnc_vehicleGetgunnerBody) params ["_gunner","_body"];

//Obtain all seat positions
_allPositions = fullCrew [_body, "", true];//[[player, seatType, cargoIndex, gunnerIndex, isFFV], ...]

//Replace cargo with gunner seat
_gunnerSeatPosition = _gunner getVariable ["Renz_gunnerSeatPosition",-1];
if (_gunnerSeatPosition != -1) then {
	{
		if ((_x select 2) == _gunnerSeatPosition) exitWith {
			_allPositions set [_forEachIndex, (fullCrew [_gunner, "gunner", true]) select 0];
		};
	} forEach _allPositions;
};

//Find first empty space
_newSeatIndex = -1;
{
	if (!alive (_x select 0)) exitWith {
		_newSeatIndex = _forEachIndex;
	};
} forEach _allPositions;

if (_newSeatIndex == -1) exitWith {
	["","All seats taken"] execVM Renz_fnc_vehicleShowSeat;
};

_newSeatPos = _allPositions select _newSeatIndex;

//Workaround since moveIngunner/moveInGunner is broken for gunner
_seatType = toLower (_newSeatPos select 1);
if (_seatType == "gunner") then {
	
	//Another workaround to make moveInAny work for car gunners
	_bouncer = objNull;
	_seatFunction = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _gunner), "seatFunction",""] call BIS_fnc_returnConfigEntry;
	if (_seatFunction == "car") then {
		_hasEmptyCommander = count ((fullCrew [_gunner, "commander",true]) - (fullCrew [_gunner, "commander"])) == 1;

		if (_hasEmptyCommander) then {
			_bouncer = createAgent [typeOf player,[0,0,0],[],0,"NONE"];
			_bouncer moveInAny _gunner;
			systemChat "Bouncer bounced";
		};
	};
	systemChat ("Started at : " + str time);

	//Switch period
	[_gunner,_bouncer] spawn {
		params ["_gunner", "_bouncer"];

		_endTime = diag_tickTime + 0.5;
		waitUntil {
			if (isNull objectParent player) then {
				player moveInAny _gunner;
			};
			diag_tickTime > _endTime;
		};
		_animation = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _gunner), "gunnerAnimation",""] call BIS_fnc_returnConfigEntry;
		[player, _animation] call Renz_fnc_vehicleSwitchMoveGlobal;
		deleteVehicle _bouncer;
	};
} else {

	//Move in driver, cargo or Fire From Vehicle seat
	0 = switch (_seatType) do {
		case "driver" : {player moveInDriver _body};
		case "cargo" : {player moveInCargo [_body, _newSeatPos select 2]};
		case "turret" : {player moveInTurret [_body, _newSeatPos select 3]};
	};

};