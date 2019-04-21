// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Asks server to convert an existing vehicle to have get in
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //


params [	
	["_vehicle",objNull,[objNull]]
];

renz_vehicleConvertEvent = _vehicle call BIS_fnc_netId;
publicVariableServer "renz_vehicleConvertEvent";
