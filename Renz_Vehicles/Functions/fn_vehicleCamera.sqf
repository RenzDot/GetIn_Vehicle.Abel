// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Third person for vehicles
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //


player addEventHandler ["GetInMan", {
	_eh = addMissionEventHandler ["EachFrame", {
		if (vehicle player != player) then {
			_turrets = allTurrets [vehicle player, true];
			_inTurret = false;
			{
				if (vehicle player turretUnit _x == player) then {
					_inTurret = true;
				}
			} forEach _turrets;

			if (!_inTurret) then {
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
