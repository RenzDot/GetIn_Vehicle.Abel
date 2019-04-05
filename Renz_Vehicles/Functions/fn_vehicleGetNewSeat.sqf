// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Finds the next empty seat in a vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_gunner","_body","_goRight"];
_allPositions = fullCrew [_body, "", true];//[[player, seatType, cargoIndex, gunnerIndex, isFFV], ...]

//Replace cargo 0 with gunner seat
if (!isNull _gunner) then {
	_gunnerSeatPosition = _gunner getVariable ["Renz_gunnerSeatPosition", 0];
	{
		if ((_x select 2) == _gunnerSeatPosition) exitWith {
			_gunnerPos = fullCrew [_gunner, "gunner", true];
			if (count _gunnerPos != 0) then {
				_allPositions set [_forEachIndex, _gunnerPos select 0];
			};
		};
	} forEach _allPositions;
};

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

_newSeatPos