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
	"",//_vehType
	"",//_bodyType
	[],//_bodyTextures 
	[],//_gunnerTextures 
	"",//_gunnerAnimation 
	[0,0,0],//_attachPos
	[],//_weapons
	[],//_magazines
	-1,//_mass 
	"",//_seatFunction 
	[],//_hitParts 
	0,//_isTracked 
	1,//_compositeType 
	0//_gunnerSeatPosition
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
		"O_APC_Tracked_02_cannon_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["","",""],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0.34,0.1,0.2],//_attachPos
		[],//_weapons
		["140Rnd_30mm_MP_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Green"],//_magazines
		-1,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		1,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_APC_Wheeled_01_cannon_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)","argo\supporterspack_argo\vehicles\data\apc_wheeled_02_ext_02_clouds_01_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"],//_bodyTextures 
		["","","a3\armor_f_beta\apc_wheeled_01\data\apc_wheeled_01_tows_co.paa"],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0.34,-1.1,0],//_attachPos
		[],//_weapons
		["60Rnd_40mm_GPR_Tracer_Red_shells", "40Rnd_40mm_APFSDS_Tracer_Red_shells"],//_magazines
		10000,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"I_APC_Wheeled_03_cannon_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)","argo\supporterspack_argo\vehicles\data\apc_wheeled_02_ext_02_clouds_01_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"],//_bodyTextures 
		["","","#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)",""],//_gunnerTextures 
		"",//_gunnerAnimation 
		[-0.2,-0.7,0.2],//_attachPos
		[],//_weapons
		["140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow"],//_magazines
		10000,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"I_APC_tracked_03_cannon_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["",""],//_bodyTextures 
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0.34,-0.9,0.1],//_attachPos
		["autocannon_30mm","LMG_coax"],//_weapons
		["140Rnd_30mm_MP_shells_Tracer_Yellow","140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow"],//_magazines
		-1,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		1,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_APC_Tracked_02_AA_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["","",""],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0.34,0.2,0.4],//_attachPos
		[],//_weapons
		["680Rnd_35mm_AA_shells_Tracer_Green"],//_magazines
		-1,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		1,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_APC_Tracked_01_AA_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		["",""],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0.3,-0.5,0.6],//_attachPos
		["autocannon_35mm","missiles_titan"],//_weapons
		["680Rnd_35mm_AA_shells_Tracer_Red","680Rnd_35mm_AA_shells_Tracer_Red","4Rnd_Titan_long_missiles","4Rnd_Titan_long_missiles"],//_magazines
		-1,//_mass 
		"tank",//_seatFunction 
		[],//_hitParts 
		1,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"I_MRAP_03_gmg_F",//_vehType
		"B_Clouds_MRAP_03_blufor_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f\vehicles\turret_co.paa"],//_bodyTextures 
		["","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"],//_gunnerTextures 
		"passenger_generic01_foldhands",//_gunnerAnimation 
		[0,0,0.7],//_attachPos
		[],//_weapons
		["96Rnd_40mm_G_belt"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		["glass1", "glass2", "glass3", "glass4", "glass5"],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"I_MRAP_03_hmg_F",//_vehType
		"B_Clouds_MRAP_03_blufor_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f\vehicles\turret_co.paa"],//_bodyTextures 
		["","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"],//_gunnerTextures 
		"passenger_generic01_foldhands",//_gunnerAnimation 
		[0,0,0.7],//_attachPos
		["HMG_127"],//_weapons
		["200Rnd_127x99_mag_Tracer_Yellow","200Rnd_127x99_mag_Tracer_Yellow"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		["glass1", "glass2", "glass3", "glass4", "glass5"],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_MRAP_01_gmg_F",//_vehType
		"O_Flames_MRAP_01_flames_01_F",//_bodyType
		["a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa","a3\data_f\vehicles\turret_co.paa"],//_bodyTextures 
		["","","a3\data_f\vehicles\turret_co.paa"],//_gunnerTextures 
		"passenger_generic01_foldhands",//_gunnerAnimation 
		[0,0,0.55],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		2//_gunnerSeatPosition
	],

	[
		"B_MRAP_01_hmg_F",//_vehType
		"O_Flames_MRAP_01_flames_01_F",//_bodyType
		["a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa","a3\data_f\vehicles\turret_co.paa"],//_bodyTextures 
		["","","a3\data_f\vehicles\turret_co.paa"],//_gunnerTextures 
		"passenger_generic01_foldhands",//_gunnerAnimation ""
		[0,0,0.55],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 0
		1,//_compositeType 0
		2//_gunnerSeatPosition
	],

	[
		"O_LSV_02_armed_F",//_vehType
		"O_Flames_LSV_01_unarmed_flames_01_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_02_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_03_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_adds_flames_01_co.paa"],//_bodyTextures 
		["","",""],//_gunnerTextures 
		"HubSittingChairA_move1",//_gunnerAnimation
		[0.2,0.45,-0.5],//_attachPos
		["LMG_Minigun_Transport"],//_weapons
		["2000Rnd_65x39_Belt_Tracer_Green_Splash"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType
		0//_gunnerSeatPosition
	],

	[
		"B_LSV_01_armed_F",//_vehType
		"O_Flames_LSV_01_unarmed_flames_01_F",//_bodyType
		["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_02_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_03_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_adds_flames_01_co.paa"],//_bodyTextures 
		["","","",""],//_gunnerTextures 
		"HubSittingChairA_move1",//_gunnerAnimation 
		[0,0,0],//_attachPos
		["HMG_127_LSV_01"],//_weapons
		["100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_G_Offroad_01_armed_F",//_vehType
		"O_Flames_Offroad_01_flames_01_F",//_bodyType
		["a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa","a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa"],//_bodyTextures 
		["",""],//_gunnerTextures 
		"InBaseMoves_sitHighUp1",//_gunnerAnimation 
		[0,-0.15,0.55],//_attachPos
		["HMG_M2"],//_weapons
		["100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		4//_gunnerSeatPosition
	],

	[
		"O_G_Offroad_01_armed_F",//_vehType
		"O_Flames_Offroad_01_flames_01_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\offroad_01_ext_flames_01_co.paa"],//_bodyTextures 
		["",""],//_gunnerTextures 
		"InBaseMoves_sitHighUp1",//_gunnerAnimation 
		[0,-0.15,0.55],//_attachPos
		["HMG_M2"],//_weapons
		["100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow"],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		4//_gunnerSeatPosition
	],

	[
		"B_MRAP_01_F",//_vehType
		"O_Flames_MRAP_01_flames_01_F",//_bodyType
		["a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa",""],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_LSV_01_unarmed_F",//_vehType
		"O_Flames_LSV_01_unarmed_flames_01_F",//_bodyType
		["a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_02_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_03_sand_co.paa","a3\soft_f_exp\lsv_01\data\nato_lsv_adds_sand_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		2,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_G_Offroad_01_F",//_vehType
		"O_Flames_Offroad_01_flames_01_F",//_bodyType
		["a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa","a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		2,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"I_MRAP_03_F",//_vehType
		"B_Clouds_MRAP_03_blufor_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f\vehicles\turret_co.paa"],//_bodyTextures 
		["",""],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		["glass1", "glass2", "glass3", "glass4", "glass5"],//_hitParts 
		0,//_isTracked 
		2,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_LSV_02_unarmed_F",//_vehType
		"O_Flames_LSV_01_unarmed_flames_01_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_02_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_03_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_adds_flames_01_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		2,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_Flames_MRAP_01_flames_01_F",//_vehType
		"O_Flames_MRAP_01_flames_01_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_G_Offroad_01_F",//_vehType
		"O_Flames_Offroad_01_flames_01_F",//_bodyType
		["a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\offroad_01_ext_flames_01_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		2,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_Heli_Light_02_F",//_vehType
		"B_Clouds_Heli_Light_02_unarmed_clouds_01_F",//_bodyType
		["a3\air_f\heli_light_02\data\heli_light_02_ext_opfor_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		["CMFlareLauncher","gatling_20mm_VTOL_01","missiles_DAGR"],//_weapons
		["240Rnd_CMFlare_Chaff_Magazine","4000Rnd_20mm_Tracer_Red_shells","12Rnd_PG_missiles"],//_magazines
		-1,//_mass 
		"air",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"O_Heli_Light_02_v2_F",//_vehType
		"B_Clouds_Heli_Light_02_unarmed_cloudrider_01_AM",//_bodyType
		["a3\air_f_heli\heli_light_02\data\heli_light_02_ext_opfor_v2_co.paa","a3\air_f_heli\heli_light_02\data\rockets_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		["CMFlareLauncher","gatling_20mm_VTOL_01","missiles_DAGR"],//_weapons
		["240Rnd_CMFlare_Chaff_Magazine","4000Rnd_20mm_Tracer_Red_shells","12Rnd_PG_missiles"],//_magazines
		-1,//_mass 
		"air",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		1,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_Clouds_Heli_Light_02_unarmed_cloudrider_01_AM",//_vehType
		"B_Clouds_Heli_Light_02_unarmed_cloudrider_01_AM",//_bodyType
		["argo\halloween2017_argo\heli_light_02\data\heli_light_02_ext_cloudrider_01_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		["CMFlareLauncher"],//_weapons
		["240Rnd_CMFlare_Chaff_Magazine"],//_magazines
		-1,//_mass 
		"air",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		0//_gunnerSeatPosition
	],

	[
		"B_Clouds_Heli_Light_02_unarmed_clouds_01_F",//_vehType
		"B_Clouds_Heli_Light_02_unarmed_clouds_01_F",//_bodyType
		["a3\air_f\heli_light_02\data\heli_light_02_ext_co.paa"],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		["CMFlareLauncher"],//_weapons
		["240Rnd_CMFlare_Chaff_Magazine"],//_magazines
		-1,//_mass 
		"air",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"B_Clouds_MRAP_03_blufor_F",//_vehType
		"B_Clouds_MRAP_03_blufor_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"O_Flames_Offroad_01_flames_01_F",//_vehType
		"O_Flames_Offroad_01_flames_01_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"O_Flames_LSV_01_unarmed_flames_01_F",//_vehType
		"O_Flames_LSV_01_unarmed_flames_01_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"O_Flames_Offroad_01_halloween_witch_01_AM",//_vehType
		"O_Flames_Offroad_01_halloween_witch_01_AM",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"B_Clouds_MRAP_03_blufor_F",//_vehType
		"B_Clouds_MRAP_03_blufor_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	],

	[
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_vehType
		"B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F",//_bodyType
		[],//_bodyTextures 
		[],//_gunnerTextures 
		"",//_gunnerAnimation 
		[0,0,0],//_attachPos
		[],//_weapons
		[],//_magazines
		-1,//_mass 
		"car",//_seatFunction 
		[],//_hitParts 
		0,//_isTracked 
		0,//_compositeType 
		-1//_gunnerSeatPosition
	]

];

Renz_Vehicle_Types = [];
{
	Renz_Vehicle_Types pushBack (_x select 0)
} forEach Renz_Vehicle_Configs;