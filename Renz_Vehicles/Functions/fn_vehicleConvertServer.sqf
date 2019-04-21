// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Converts an existing vehicle to have get in
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

if (!isServer) exitWith {};

"renz_vehicleConvertEvent" addPublicVariableEventHandler {
	_veh = objectFromNetId (_this select 1);

	if (typeOf _veh in Renz_Vehicle_Types) then {
		[_veh] call Renz_fnc_vehicleInit;
	};
};
