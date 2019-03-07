// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Returns which part of a vehicle is the body, and which is the turret
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_vehicle",objNull]];
_turret = objNull;
_body = attachedTo _vehicle;

if (isNull _body) then {
	_body = _vehicle;
	{	
		if (isClass (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _x)) exitWith {
			_turret = _x;
		};
	} forEach attachedObjects _body;

} else {
	_turret = _vehicle;
};

[_turret, _body]