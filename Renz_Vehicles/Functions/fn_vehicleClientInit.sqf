// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles for client
// Author: Renz
// Called on all clients 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

//Force eject keybind
{
	[_x, "call Renz_fnc_vehicleForceEject"] spawn Renz_fnc_vehicleAddKeybind;
} forEach ((actionKeys "GetOut") + (actionKeys "Eject"));

//Switch seat keybind
[27,"[vehicle player, true] call Renz_fnc_vehicleSwitchSeat"] spawn Renz_fnc_vehicleAddKeybind;
[26,"[vehicle player, false] call Renz_fnc_vehicleSwitchSeat"] spawn Renz_fnc_vehicleAddKeybind;

//Counter measure keybind
{
	[_x, "call Renz_fnc_vehicleCounterMeasure"] spawn Renz_fnc_vehicleAddKeybind;
} forEach actionKeys "reloadMagazine";

//Vehicle third person
call Renz_fnc_vehicleCamera;

//Sets gunner's side 
//call Renz_fnc_vehicleHostility;

//Setup global variables
call Renz_fnc_vehicleSwitchMoveGlobal;
call Renz_fnc_vehicleAddactionGlobal;
call Renz_fnc_vehicleAddactionJIP;

//systemchat "Client init done";

