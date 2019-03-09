// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in cars
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_gunner","_body","_newSeatPos"];

if (count _newSeatPos == 0) exitWith {
	["","All seats taken"] call Renz_fnc_showSeat;
};

//Workaround since moveInTurret/moveInGunner is broken for gunner
_newSeatType = toLower (_newSeatPos select 1);
if (_newSeatType in ["gunner","driver"]) then {	

	//Another workaround to make moveInAny work for car gunners
	_bouncer = objNull;
	if (_newSeatType == "gunner") then {
		_hasEmptyCommander = count ((fullCrew [_gunner, "commander",true]) - (fullCrew [_gunner, "commander"])) == 1;

		if (_hasEmptyCommander) then {
			_bouncer = createAgent [typeOf player , [0,0,0],[],0,"NONE"];
			_bouncer moveInAny _gunner;
			systemChat "Bouncer bounced";
		};
	};

	//switch period for driver/gunner
	[_gunner, _body, _bouncer, _newSeatType] spawn {
		params ["_gunner","_body","_bouncer","_newSeatType"];
		_getInDriverOrGunner = [
			{player moveInDriver _body}, 
			{player moveInAny _gunner}
		] select (_newSeatType == "gunner");

		moveOut player;
		_endTime = diag_tickTime + 0.5;
		waitUntil {
			if (isNull objectParent player) then _getInDriverOrGunner;
			diag_tickTime > _endTime;
		};

		//Fix for gunner animation
		if (!isNull objectParent player && _newSeatType == "gunner") then {
			_animation =  [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _gunner), "gunnerAnimation",""] call BIS_fnc_returnConfigEntry;
			[player, _animation] call Renz_fnc_switchMoveGlobal;
		};
		deleteVehicle _bouncer;
	};

} else {
	
	//Move in cargo or Fire From Vehicle seat
	[_body,_newSeatPos] spawn {
		params ["_body","_newSeatPos"];

		_currentPos = assignedVehicleRole player;
		_isInGunner = ((_currentPos select 0) == "Turret") && {(_currentPos select 1) isEqualTo [0]};
	
		//Workaround since some action commands don't work when inside gunner or driver positions
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
};

[	(_newSeatPos select 1), 
	["", str (_newSeatPos select 2)] select ((_newSeatPos select 2) != -1)
] call Renz_fnc_showSeat;

/*
