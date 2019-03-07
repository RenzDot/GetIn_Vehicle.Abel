// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Makes switchmove play for everyone
// Author: Renz
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_actor",objNull],"_animation"];

if (isNil "Renz_animationNames") then {

	//All animations must be lowercase
	Renz_animationNames = [
		"inbasemoves_sithighup1",
		"hubsittingchaira_move1",
		"passenger_mrap_01_back_settlein",
		"passenger_generic01_foldhands"
	];//Only animations placed here will play globally

	//Reciever 
	"Renz_switchMoveEvent" addPublicVariableEventHandler {
		(_this select 1) params ["_netId","_animId"];
		_actor = objectFromNetId _netId;
		_actor switchMove (Renz_animationNames select _animId);
	};

};

if (isNil "_animation") exitWith {};

//Sender
_actor switchMove _animation;
_animID = Renz_animationNames find (toLower _animation);
if (_animId > -1) then {
	Renz_switchMoveEvent = [netID _actor, _animId];
	publicVariable "Renz_switchMoveEvent";
};
 