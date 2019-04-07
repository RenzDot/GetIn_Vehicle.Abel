// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up vehicles init
// Called on all clients 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
if (isServer) then {
	[] execVM "Renz_Vehicles\serverInit.sqf";
};

[] execVM "Renz_Vehicles\clientInit.sqf";