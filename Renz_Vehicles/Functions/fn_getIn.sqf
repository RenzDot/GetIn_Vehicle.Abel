// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Moves player inside a vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle"];
(_vehicle call Renz_fnc_getTurretBody) params ["_turret","_body"];

//Obtain all seat positions
_allPositions = fullCrew [_body, "", true];//[[player, seatType, cargoIndex, turretIndex, isFFV], ...]

//Replace cargo with turret seat
_turretSeatPosition = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret), "turretSeatPosition",0] call BIS_fnc_returnConfigEntry;
{
	if ((_x select 2) == _turretSeatPosition) exitWith {
		_allPositions set [_forEachIndex, (fullCrew [_turret, "gunner", true]) select 0];
	};
} forEach _allPositions;

//Find first empty space
_newSeatIndex = -1;
{
	if (!alive (_x select 0)) exitWith {
		_newSeatIndex = _forEachIndex;
	};
} forEach _allPositions;

if (_newSeatIndex == -1) exitWith {
	["","All seats taken"] execVM Renz_fnc_showSeat;
};

_newSeatPos = _allPositions select _newSeatIndex;

//Workaround since moveInTurret/moveInGunner is broken for gunner
_seatType = toLower (_newSeatPos select 1);
if (_seatType == "gunner") then {
	
	//Another workaround to make moveInAny work for car gunners
	_bouncer = objNull;
	_seatFunction = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret), "seatFunction",""] call BIS_fnc_returnConfigEntry;
	if (_seatFunction == "car") then {
		_hasEmptyCommander = count ((fullCrew [_turret, "commander",true]) - (fullCrew [_turret, "commander"])) == 1;

		if (_hasEmptyCommander) then {
			_bouncer = createAgent [typeOf player,[0,0,0],[],0,"NONE"];
			_bouncer moveInAny _turret;
			systemChat "Bouncer bounced";
		};
	};
	systemChat ("Started at : " + str time);

	//Switch period
	[_turret,_bouncer] spawn {
		params ["_turret", "_bouncer"];

		_endTime = diag_tickTime + 0.5;
		waitUntil {
			if (isNull objectParent player) then {
				player moveInAny _turret;
			};
			diag_tickTime > _endTime;
		};

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