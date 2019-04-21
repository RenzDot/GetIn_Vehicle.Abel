// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Creates a vehicle
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //


params [	
	["_type","",[""]],
	["_position",[0,0,0],[[],0,objNull]],
	["_markers", [],[[],"",objNull]],
	["_placement", 0, [0]],
	["_special","NONE",[""]]
];

if (isServer) then {
	"renz_vehicleCreateEvent" addPublicVariableEventHandler {
		_parameters = (_this select 1);
		_veh = createVehicle _parameters;
		diag_log "Vehicle Create Event: " + str _parameters;

		if ((_parameters select 0) in Renz_Vehicle_Types) then {
			[_veh] call Renz_fnc_vehicleInit;
		};
	};
};

if (_type == "") exitWith {};
renz_vehicleCreateEvent = [_type,_position,_markers,_placement,_special];
publicVariableServer "renz_vehicleCreateEvent";
