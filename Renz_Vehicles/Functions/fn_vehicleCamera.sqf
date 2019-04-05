// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Third person for vehicles
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

[] spawn {
	waituntil {!isNull player};
	
	player addEventHandler ["GetInMan", {
		_eh = addMissionEventHandler ["EachFrame", {
			_veh = (objectParent player);
			if (!isNull _veh) then {
				_turrets = allTurrets [_veh, true];
				_inTurret = false;
				{
					if (_veh turretUnit _x == player) then {
						_inTurret = true;
					}
				} forEach _turrets;

				_isPilot = (_veh getVariable ["Renz_seatFunction", ""] == "air") && (driver _veh == player);

				if (!_inTurret && !_isPilot) then {
					vehicle player switchCamera "External";
				};	
			};
		}];
		player setVariable ["Renz_vehCamera", _eh];

	}];

	player addEventHandler ["GetOutMan", {
		removeMissionEventHandler ["EachFrame",(player getVariable "Renz_vehCamera")];
	}];

	player addEventHandler ["Killed", {
		if (vehicle player != player) then {
			removeMissionEventHandler ["EachFrame",(player getVariable "Renz_vehCamera")];
		};
	}];
};
