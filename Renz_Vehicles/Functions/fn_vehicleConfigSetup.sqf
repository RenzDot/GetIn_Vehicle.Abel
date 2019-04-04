// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Config for Argo vehicles 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

/*
Define Renz_Vehicle_Configs
Define Renz_Vehicle_Types
*/


/*
Vehicle config format [
	//_gunnerType
	//_bodyType ""
	//_bodyTextures []
	//_gunnerTextures []
	//_gunnerAnimation ""
	//_attachPos [0,0,0]
	//_weapons []
	//_magazines []
	//_mass -1
	//_seatFunction [""]
	//_hitParts []
	//_isTracked 0
	//_compositeType 0
]
*/

/*
compositeType values
0 - Working driver
1 - Working driver + Working Gunner
2 - Working driver + Working Seats
*/

if (!isNil "Renz_Vehicle_Configs") exitWith {};

Renz_Vehicle_Configs = [
	[
		"B_Clouds_MRAP_03_blufor_F",//_gunnerType
		"",//_bodyType ""
		[],//_bodyTextures []
		[],//_gunnerTextures []
		"",//_gunnerAnimation ""
		[0,0,0],//_attachPos [0,0,0]
		[],//_weapons []
		[],//_magazines []
		-1,//_mass -1
		"car",//_seatFunction ""
		[],//_hitParts []
		0,//_isTracked 0
		0//_compositeType 0
	],


	[
		"O_Flames_Offroad_01_flames_01_F",//_gunnerType
		"",//_bodyType ""
		[],//_bodyTextures []
		[],//_gunnerTextures []
		"",//_gunnerAnimation ""
		[0,0,0],//_attachPos [0,0,0]
		[],//_weapons []
		[],//_magazines []
		-1,//_mass -1
		"car",//_seatFunction ""
		[],//_hitParts []
		0,//_isTracked 0
		0//_compositeType 0
	],

	[
		"O_Flames_LSV_01_unarmed_flames_01_F",//_gunnerType
		"",//_bodyType ""
		[],//_bodyTextures []
		[],//_gunnerTextures []
		"",//_gunnerAnimation ""
		[0,0,0],//_attachPos [0,0,0]
		[],//_weapons []
		[],//_magazines []
		-1,//_mass -1
		"car",//_seatFunction ""
		[],//_hitParts []
		0,//_isTracked 0
		0//_compositeType 0
	],

	[
		"B_Clouds_Heli_Light_02_unarmed_clouds_01_F",//_gunnerType
		"B_Clouds_Heli_Light_02_unarmed_clouds_01_F",//_bodyType ""
		["a3\air_f\heli_light_02\data\heli_light_02_ext_co.paa"],//_bodyTextures []
		[],//_gunnerTextures []
		"",//_gunnerAnimation ""
		[0,0,0],//_attachPos [0,0,0]
		["CMFlareLauncher"],//_weapons []
		["240Rnd_CMFlare_Chaff_Magazine"],//_magazines []
		-1,//_mass -1
		"air",//_seatFunction ""
		[],//_hitParts []
		0,//_isTracked 0
		1//_compositeType 0
	],


	["Null"]
];

//Renz_Vehicle_Configs = compileFinal (	(str Renz_Vehicle_Configs) select [1, count (str Renz_Vehicle_Configs) - 2]	);
Renz_Vehicle_Types = [];
{
	Renz_Vehicle_Types pushBack (_x select 0)
} forEach Renz_Vehicle_Types;