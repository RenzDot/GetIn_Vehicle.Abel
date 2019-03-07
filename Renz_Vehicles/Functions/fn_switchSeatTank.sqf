// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in tanks
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_goRight"];
Renz_forcedSeat = assignedVehicleRole player;
_turret = (vehicle player) getVariable ["Renz_turret", (vehicle player)];
_body = (vehicle player) getVariable ["Renz_body", (vehicle player)];
_currentSeat = -1;

//Driver position
_bodyCrew = fullCrew [_turret getVariable "Renz_body", "", true];
_vehiclePositions = [["driver", (_bodyCrew select 0) select 2]];
if (player in (_bodyCrew select 0)) then {
	_currentSeat = 0;
};

//Turret positions
_turretPositions = allTurrets _turret;
for "_i" from 0 to count _turretPositions -1 do {
	_turretPos = _turretPositions select _i;
	_vehiclePositions pushBack ["turret",_turretPos]; 

	if ((_turret turretUnit _turretPos) == player) then {
		_currentSeat = count _vehiclePositions - 1;
	}
};

//Cargo positions
_isCargoFull = true;
for "_i" from 1 to (count _bodyCrew -1) do {
	_vehSeat = (_bodyCrew select _i);
	if ((_vehSeat select 1) == "cargo") then {
		_vehiclePositions pushBack ["cargo",  (_vehSeat select 2)];
		_isCargoFull = false;
		
		if (_body getCargoIndex player == _vehSeat select 2) then {
			_currentSeat =  count _vehiclePositions - 1;
			
		}
	}

}; 

//Find next empty position
for "_i" from 1 to count _vehiclePositions do {
	_seatIndex  = [_currentSeat -1, _currentSeat +1] select (_goRight); 
	if (_seatIndex < 0) then {_seatIndex = count _vehiclePositions -1};
	if (_seatIndex >= count _vehiclePositions) then {_seatIndex = 0};

	//Move inside driver
	Renz_forcedSeat = [_body] + (_vehiclePositions select _seatIndex) + [time]; //[turret, seatType, index, time, missionEventHandler]
	if (Renz_forcedSeat select 1 == "driver" && isNull (driver _body)) exitWith {
		player action ["eject", vehicle player];
		player attachTo [_body,[0,0,0]];
		
		_switchPeriod = addMissionEventHandler ["EachFrame",{
			if (time - (Renz_forcedSeat select 3) < 0.5) then {
				player moveInDriver (Renz_forcedSeat select 0);
			} else {
				detach player;
				removeMissionEventHandler ["EachFrame", Renz_forcedSeat select 4];
			}
		}];
		Renz_forcedSeat pushBack _switchPeriod;
		["driver", ""] call Renz_fnc_showSeat;
	};

	//Move inside turret
	if (Renz_forcedSeat select 1 == "turret" && {isNull (_turret turretUnit (Renz_forcedSeat select 2))} ) exitWith {		
		player action ["eject", vehicle player];
		player attachTo [_body,[0,0,0]];

		_switchPeriod = addMissionEventHandler ["EachFrame",{
			if (time - (Renz_forcedSeat select 3) < 0.5) then {
				player moveInTurret [(Renz_forcedSeat select 0) getVariable "Renz_turret", Renz_forcedSeat select 2];
				//call {player moveInTurret [turret1, [0]]};
			} else {
				detach player;
				removeMissionEventHandler ["EachFrame", Renz_forcedSeat select 4];
			}
		}];
		Renz_forcedSeat pushBack _switchPeriod;
		["turret", str (Renz_forcedSeat select 2)] call Renz_fnc_showSeat;
		
	};

	//Move inside cargo
	if (Renz_forcedSeat select 1 == "cargo" && !_isCargoFull) exitWith {
		player action ["eject", vehicle player];
		player attachTo [_body,[0,0,0]];
		//systemChat str  [Renz_forcedSeat select 0, Renz_forcedSeat select 2];
		systemChat str [Renz_forcedSeat select 0, Renz_forcedSeat select 2];
		_switchPeriod = addMissionEventHandler ["EachFrame",{
			if (time - (Renz_forcedSeat select 3) < 0.5) then {
				player moveInCargo [Renz_forcedSeat select 0, Renz_forcedSeat select 2];
			} else {
				detach player;
				removeMissionEventHandler ["EachFrame", Renz_forcedSeat select 4];
			}
		}];
		Renz_forcedSeat pushBack _switchPeriod;
		["cargo", str (Renz_forcedSeat select 2)] call Renz_fnc_showSeat;
		
	};
	
};

