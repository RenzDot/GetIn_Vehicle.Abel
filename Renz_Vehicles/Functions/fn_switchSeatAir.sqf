// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Changes player's seat in helicopters
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_gunner","_body","_newSeatPos"];

if (count _newSeatPos == 0) exitWith {
	["","All seats taken"] call Renz_fnc_showSeat;
};

