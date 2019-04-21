// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Tells a player if they have unbound keys
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

_vehActions = [
	"CarForward",
	"CarBack",
	"CarLeft",
	"CarRight",
	"CarAimUp",
	"CarAimDown",
	"CarAimLeft",
	"CarAimRight",
	"GetOut"
];

if (objectParent player isKindOf "air") exitWith {};
_unbound = [];
{
	if (count actionKeys _x == 0) then {
		_unbound pushback _x;
	};

} forEach _vehActions;

if (count _unbound != 0) then {
	_msg = "";
	{
		_msg = _msg + "  " + _x;
	} forEach _unbound;

	hintC (">>>> Unbound Keys Detected! <<<<\n\nBind the following keys to use the vehicle fully\n(Press Esc -> Options -> Controls -> Show -> (Vehicles OR Common))\n\nUnbound keys: " + _msg);
	
	hintC_EH = findDisplay 57 displayAddEventHandler ["unload", {
		0 = _this spawn {
			_this select 0 displayRemoveEventHandler ["unload", hintC_EH];
			hintSilent "";
		};
	}];

	systemchat "(Esc -> Options -> Controls -> Show -> (Vehicles OR Common)): ";
	systemchat _msg;
}