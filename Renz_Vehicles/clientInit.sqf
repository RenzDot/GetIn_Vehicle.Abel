// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles for client
// Author: Renz
// Called on all clients 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

//Force eject keybind
{
	[_x, "call Renz_fnc_forceEject"] spawn Renz_fnc_addKeybind;
} forEach (actionKeys "Eject") + (actionKeys "GetOut");

//Switch seat keybind
[27,"[vehicle player, true] call Renz_fnc_switchSeat"] spawn Renz_fnc_addKeybind;
[26,"[vehicle player, false] call Renz_fnc_switchSeat"] spawn Renz_fnc_addKeybind;

//Vehicle third person
call Renz_fnc_vehicleCamera;

//Setup global variables
call Renz_fnc_switchMoveGlobal;
call Renz_fnc_addVehActionGlobal;
call Renz_fnc_addVehActionJIP;

systemchat "Client init done";


/*
MP tests

vehInit 
- Correct textures on creation - true
- Correct textures after JIP - true

Camera 
- Third person on driver - true
- First person on gunner & commander - true

addAction 
- addAction moves caller into vehicle - true
- addAction appears for remote vehicle on creation - true
- addAction appears for remote vehicle after JIP - 
- addAction does not appear for dead vehicle
- addAction does not appear for enemy callers

keybinds 
- player ejected from vehicle on keypress - true
- engine switched off on eject 

switchSeats 
- Player can get in vehicle - true
- Player switches seats to driver, gunner and passenger - true
- Player does not switch when in a full vehicle
- Player only switches to empty seats - player cannot switch to empty seat
- Player does not die while switching at high speeds
- EachFrame event removed properly
- Player displays correct turret animation for other players - animation only displays locally
- Player displays correct turret animation after for JIP players

Show icons 
- Seat icons appear correctly 
- Seat icon for full seats appear

Finalisation 
- Remove debug chat 
- Disable allowFunctionsRecompile
- Change execVM to call
- compileFinal all inline functions


*/