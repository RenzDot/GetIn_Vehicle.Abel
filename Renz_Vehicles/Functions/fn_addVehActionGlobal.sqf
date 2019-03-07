// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Gives vehicle access
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

/*
To do:
- Ensure addAction run for all clients
*/

params [["_vehicle",objNull],["_isFirstCaller", false]];

//First time setup
if (isNull _vehicle) exitWith {
	"renz_addVehActionEvent" addPublicVariableEventHandler {
		(_this select 1) params ["_netId"];
		_vehicle = objectFromNetId _netId;
		[_vehicle, false] call Renz_fnc_addVehActionGlobal;

		if (isServer) then {
			renz_addVehActionEvent = [_netId, false];
			publicVariable "renz_addVehActionEvent";
		};
		systemChat ("addActioned + " + str _vehicle);
	};
};

(_vehicle call Renz_fnc_getTurretBody) params ["_turret", "_body"];
if (isNull _turret) exitWith {};

_config = configfile >> "CfgVehicles" >> typeOf _turret;
_icon = [_config,"picture",""] call BIS_fnc_returnConfigEntry;
_title = ["Get in... <img size = '2' image ='" + _icon + "' />","Get in..."] select (_icon == "");

_getIn = {
	params ["_vehicle"];
	[_vehicle, true] call Renz_fnc_switchSeat;
};

{
	_x addAction [
		_title, 
		Renz_fnc_getIn,
		[],
		1,
		true,
		false,
		"",
		"(side _target) in [side player, civilian] && vehicle player == player && alive _target",
		7
	];
} forEach [_turret, _body];

//addAction for all clients
if (_isFirstCaller) then {
	renz_addVehActionEvent = [netId _turret];
	publicVariableServer "renz_addVehActionEvent";
};