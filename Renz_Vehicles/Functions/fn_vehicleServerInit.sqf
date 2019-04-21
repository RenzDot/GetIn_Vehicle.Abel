// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles for server
// Called on all clients 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
if (!isServer) exitWith {};

[] call Renz_fnc_vehicleInit;
[] call Renz_fnc_vehicleCreate;
[] call Renz_fnc_vehicleConvertServer;

