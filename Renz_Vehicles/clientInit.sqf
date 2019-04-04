// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles for client
// Author: Renz
// Called on all clients 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

//Force eject keybind
{
	[_x, "call Renz_fnc_vehicleForceEject"] spawn Renz_fnc_vehicleAddKeybind;
} forEach (actionKeys "Eject") + (actionKeys "GetOut");

//Switch seat keybind
[27,"[vehicle player, true] call Renz_fnc_vehicleSwitchSeat"] spawn Renz_fnc_vehicleAddKeybind;
[26,"[vehicle player, false] call Renz_fnc_vehicleSwitchSeat"] spawn Renz_fnc_vehicleAddKeybind;

//Vehicle third person
call Renz_fnc_vehicleCamera;

//Setup global variables
call Renz_fnc_vehicleSwitchMoveGlobal;
call Renz_fnc_vehicleAddactionGlobal;
call Renz_fnc_vehicleAddactionJIP;

systemchat "Client init done";


/*
MP tests

>> General
vehInit 
- Correct textures on creation - true
- Correct textures after JIP - true

Camera 
- Third person on driver - true
- First person on gunner & commander - true


keybinds 
- player ejected from vehicle on keypress - true
- engine switched off on eject - true

Finalisation 
- Remove debug chat 
- Disable allowFunctionsRecompile
- Change execVM to call
- compileFinal all inline functions

>> Cars

addAction 
- addAction moves caller into vehicle - true
- addAction appears for remote vehicle on creation - true
- addAction appears for remote vehicle after JIP - true
- addAction does not appear for dead vehicle
- addAction does not appear for enemy callers

switchSeats 
- Player can get in vehicle - true
- Player switches seats to driver, gunner and passenger - true
- Player does not switch when in a full vehicle
- Player only switches to empty seats - true
- Player does not die while switching at high speeds
- EachFrame event removed properly
- Player displays correct turret animation for other players - true
- Player displays correct turret animation after for JIP players - false


Show icons 
- Seat icons appear correctly - true 
- Seat icon for full seats appear - true


>> Tanks


*/