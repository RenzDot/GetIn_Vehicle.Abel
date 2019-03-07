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
for "_i" from 0 to _posCount do {
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
_seatType = toLower (_newSeatPos select 1);
if (_seatType == "gunner") then {	

	//Another workaround to make moveInAny work for car gunners
	_bouncer = objNull;
	_hasEmptyCommander = count ((fullCrew [_turret, "commander",true]) - (fullCrew [_turret, "commander"])) == 1;
	if (_hasEmptyCommander) then {
		_bouncer = createAgent [typeOf player , [0,0,0],[],0,"NONE"];
		_bouncer moveInAny _turret;
		systemChat "bouncer bounced";
	};

	//switch period 
	[_turret, _bouncer] spawn {
		params ["_turret","_bouncer"];

		player action ["eject",vehicle player];
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
		case "driver" : {player action ["moveInDriver", _body]};
		case "cargo" : {player action ["moveInCargo", _body, (_newSeatPos select 2)]};
		case "turret" : {player action ["moveInTurret", _body, (_newSeatPos select 3)]};
	};
};
/*
//Fix for switching to gunner when commander empty
_bouncer = objNull;
_seatType = toLower (_newSeatPos select 1);
_hasEmptyCommander = count ((fullCrew [_turret, "commander",true]) - (fullCrew [_turret, "commander"])) == 1;
systemChat ("Started at : " + str time);
if (_hasEmptyCommander && _seatType == "gunner" ) then {
	_bouncer = createAgent [typeOf player,[0,0,0],[],0,"NONE"];
	_bouncer moveInAny _turret;
	systemChat str "Bouncer bounced";
};


//Workaround since moveToXXX is somewhat broken
player action ["eject", vehicle player];
player setPosATL (player getRelPos [6, getDir player - 90]);//Ensures player is not run over
[_body, _turret,_newSeatPos, _bouncer,_currentPos] spawn {
	params ["_body","_turret","_newSeatPos","_bouncer","_currentPos"];
	_doGetIn = switch (toLower (_newSeatPos select 1)) do {
		case "driver": { {player moveInDriver _body} };
		case "gunner": { {player moveInAny _turret} };
		case "turret": { {
				if (_currentPos == -1) then {
					
				} else {
					player moveInCargo [_body, (_newSeatPos select 2)]} 
				}
				

			};
		case "cargo": { {player moveInCargo [_body, (_newSeatPos select 2)]} };
	};

	//Switch period
	_endTime = time + 0.5;
	waitUntil {
		if ( vehicle player == player) then _doGetIn;
		time > _endTime; 
	};

	deleteVehicle _bouncer;
	
	//Fix broken animation for turret seat
	if (	vehicle player != player && 
			(assignedVehicleRole player select 0) == "Turret" &&
			{(assignedVehicleRole player select 1) isEqualTo [0]}
	) then {
		_turretAnim = [(missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret), "turretAnimation", ""] call BIS_fnc_returnConfigEntry;
		if (_turretAnim != "") then {
			[player, _turretAnim] call Renz_fnc_switchMoveGlobal;
		};
	};
	systemChat ("switch period ended at " + str time);
};*/

[	(_newSeatPos select 1), 
	["", str (_newSeatPos select 2)] select ((_newSeatPos select 2) != -1)
] call Renz_fnc_showSeat;

/*
