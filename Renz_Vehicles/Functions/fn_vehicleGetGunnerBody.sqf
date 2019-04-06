// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Returns which part of a vehicle is the body and gunner
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_vehicle",objNull]];
_gunner = objNull;
_body = attachedTo _vehicle;

if (isNull _body) then {
	_body = _vehicle;
	{	
		if (typeOf _x in Renz_Vehicle_Types) exitWith {
			_gunner = _x;
		};
	} forEach attachedObjects _body;

} else {
	_gunner = _vehicle;
};

[_gunner, _body]