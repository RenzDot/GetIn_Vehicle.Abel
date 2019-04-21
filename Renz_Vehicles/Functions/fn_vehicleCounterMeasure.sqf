// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in vehicle
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

[] spawn {
	_vehicle = objectParent player;
	if ((_vehicle isKindOf "air") && {driver _vehicle == player}) then {
		_vehicle action ["useWeapon",_vehicle, driver _vehicle,1];
		sleep 0.2;
		_vehicle action ["useWeapon",_vehicle, driver _vehicle,1];
		sleep 0.2;
		_vehicle action ["useWeapon",_vehicle, driver _vehicle,1];
		sleep 0.2;
		_vehicle action ["useWeapon",_vehicle, driver _vehicle,1];
	};
};
