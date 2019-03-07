// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Forces player to exit locked vehicles
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
if (vehicle player == player) exitWith {};
player action ["GetOut", vehicle player];
3344 cutText ["","PLAIN DOWN"];

//Fixes bug where players get out too high

[] spawn {
	sleep 0.6;
	if (vehicle player != player) exitWith {};
	_exitPos = getPosATL player;
	_dir = getDir player;

	if ((_exitPos select 2) > 1) then {
		player setPosATL [_exitPos select 0, _exitPos select 1, ((_exitPos select 2) - 2) max 0];
		player setDir _dir;
	};
	
	
	
}
	


