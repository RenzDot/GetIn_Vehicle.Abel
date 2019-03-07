// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in cars
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_vehicle","_goRight"];
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

//Get current seat pos 
_currentPos = -1;
{
	if ((_x select 0) == player) exitWith {
		_currentPos = _forEachIndex;
	};
} forEach _allPositions;

//Get new seat positon
_newSeatPos = [];
_posCount = count _allPositions;
for "_i" from 0 to (_posCount - 1) do {
	_posIndex = [	
		(_currentPos + (_posCount - _i)) % (_posCount), 
		(_currentPos + _i) % (_posCount)
	] select _goRight;

	_seat = (_allPositions select (_posIndex max 0));
	_unit = (_seat select 0);
	if (!alive _unit) exitWith {
		deleteVehicle _unit;
		_newSeatPos = _seat;
	};
};


if (count _newSeatPos == 0) exitWith {
	["","All seats taken"] call Renz_fnc_showSeat;
};


//Workaround since moveInTurret/moveInGunner is broken for gunner
_newSeatType = toLower (_newSeatPos select 1);
if (_newSeatType in ["gunner","driver"]) then {	

	//Another workaround to make moveInAny work for car gunners
	_bouncer = objNull;
	
	if (_newSeatType == "gunner") then {
		_hasEmptyCommander = count ((fullCrew [_turret, "commander",true]) - (fullCrew [_turret, "commander"])) == 1;

		if (_hasEmptyCommander) then {
			_bouncer = createAgent [typeOf player , [0,0,0],[],0,"NONE"];
			_bouncer moveInAny _turret;
			systemChat "Bouncer bounced";
		};
	};

	//switch period for driver/gunner
	[_turret, _body, _bouncer, _newSeatType] spawn {
		params ["_turret","_body","_bouncer","_newSeatType"];
		_getInGunnerDriver = [
			{player moveInDriver _body}, 
			{player moveInAny _turret}
		] select (_newSeatType == "gunner");

		moveOut player;
		_endTime = diag_tickTime + 0.5;
		waitUntil {
			if (isNull objectParent player) then _getInGunnerDriver;
			diag_tickTime > _endTime;
		};

		if (!isNull objectParent player && _newSeatType == "gunner") then {
			_animation =  [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret), "turretAnimation",""] call BIS_fnc_returnConfigEntry;
			[player, _animation] call Renz_fnc_switchMoveGlobal;
		};
		deleteVehicle _bouncer;
	};

} else {
	
	//Move in cargo or Fire From Vehicle seat
	_isInGunner = (toLower ((_allPositions select _currentPos) select 1) == "gunner");
	
	[_body,_newSeatPos,_isInGunner] spawn {
		params ["_body","_newSeatPos","_isInGunner"];

		_getInCargo = {};
		_newSeatType = (_newSeatPos select 1);

		//Workaround since some action commands don't work when inside the gunner position
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
};

[	(_newSeatPos select 1), 
	["", str (_newSeatPos select 2)] select ((_newSeatPos select 2) != -1)
] call Renz_fnc_showSeat;

/*
