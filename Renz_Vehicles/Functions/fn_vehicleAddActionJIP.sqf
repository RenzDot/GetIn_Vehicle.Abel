// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Ensures Join In Progress players have vehicle access 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

if (isServer) exitWith {};
[] spawn {
	waitUntil {time > 0 && !isNil "Renz_Vehicle_Types"};
	//_config = (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles");

	{
		////systemchat str [typeOf _x, isClass (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _x)]
		//systemchat str [typeOf _x, typeOf _x in Renz_Vehicle_Types];
		if (typeOf _x in Renz_Vehicle_Types) then {

			//Air 
			if (_x isKindof "air") then {
				[_x] call Renz_fnc_vehicleAddActionGlobal;
			};

			//Unarmed 
			if ((_x getVariable ["Renz_seatFunction",""]) == "car"  && count (attachedObjects _x) == 0 ) then {
				[_x] call Renz_fnc_vehicleAddActionGlobal;
			};

			//Armed car or tank 
			if ((_x getVariable ["Renz_seatFunction",""]) != "" && !isNull attachedTo _x) then {
				[_x] call Renz_fnc_vehicleAddActionGlobal;
			};
			
			
		};
	} forEach vehicles;
	//systemchat "JIP";
};