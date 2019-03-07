// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Ensures Join In Progress players have vehicle access 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

if (isServer) exitWith {};
[] spawn {
	waitUntil {time > 0};
	_config = (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles");

	{
		systemChat str [typeOf _x, isClass (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _x)];
		if (isClass (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _x)) then {
			(_x call Renz_fnc_getTurretBody) params ["_turret","_body"];
			systemChat str [_turret, _body];
			if (!isNull _turret) then {
				[_x] call Renz_fnc_addVehActionGlobal;
			};
			
		};
	} forEach vehicles;
	systemChat "JIP";
};