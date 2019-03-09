class CfgRenzVehicles
{

	class Vehicles
	{
		class B_MRAP_01_F
		{
			body = "O_Flames_MRAP_01_flames_01_F";
			bodyTextures[] = {"a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa",""};
			turretTextures[] = {"","",""};
			attachPos[] = {0,0,0};
			seatFunction = "car";
		}

		
		class O_G_Offroad_01_armed_F
		{
			body = "O_Flames_Offroad_01_flames_01_F";
			bodyTextures[] = {"a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\offroad_01_ext_flames_01_co.paa"};
			turretTextures[] = {"",""};
			turretSeatPosition = 4;
			turretAnimation = "InBaseMoves_sitHighUp1";
			attachPos[] = {0,-0.15,0.55}; 
			weapons[] = {"HMG_M2"};
			magazines[] = {"100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow","100Rnd_127x99_mag_Tracer_Yellow"};
			seatFunction = "car";
		}

		class B_G_Offroad_01_armed_F
		{
			body = "O_Flames_Offroad_01_flames_01_F";
			bodyTextures[] = {"a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa","a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_ig_10_co.paa"};
			turretTextures[] = {"",""};
			turretSeatPosition = 4;
			turretAnimation = "InBaseMoves_sitHighUp1";
			attachPos[] = {0,-0.15,0.55}; 
			weapons[] = {"HMG_M2"};
			magazines[] = {"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
			seatFunction = "car";
		}

		class B_LSV_01_armed_F 
		{
			body = "O_Flames_LSV_01_unarmed_flames_01_F";
			bodyTextures[] = {"a3\soft_f_exp\lsv_01\data\nato_lsv_01_sand_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_02_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_03_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_adds_flames_01_co.paa"};
			turretTextures[] = {"","","",""};
			turretAnimation = "HubSittingChairA_move1";
			attachPos[] = {0,0,0}; 
			weapons[] = {"HMG_127_LSV_01"};
			magazines[] = {"100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red","100Rnd_127x99_mag_Tracer_Red"};
			seatFunction = "car";
		}

		class O_LSV_02_armed_F 
		{
			body = "O_Flames_LSV_01_unarmed_flames_01_F";
			bodyTextures[] = {"a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_02_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_03_flames_01_co.paa","argo\supporterspack_argo\vehicles\data\nato_lsv_adds_flames_01_co.paa"};
			turretTextures[] = {"","",""};
			turretAnimation = "HubSittingChairA_move1";
			attachPos[] = {0.2,0.45,-0.5}; 
			weapons[] = {"LMG_Minigun_Transport"};
			magazines[] = {"2000Rnd_65x39_Belt_Tracer_Green_Splash"};
			seatFunction = "car";
		}

			class B_MRAP_01_hmg_F
		{
			body = "O_Flames_MRAP_01_flames_01_F";									
			bodyTextures[] = {"a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa","a3\data_f\vehicles\turret_co.paa"};
			turretTextures[] = {"","","a3\data_f\vehicles\turret_co.paa"};
			turretAnimation = "passenger_generic01_foldhands";
			turretSeatPosition = 2;
			attachPos[] = {0,0,0.55}; 
			weapons[] = {};
			magazines[] = {};
			seatFunction = "car";
		}

		class B_MRAP_01_gmg_F
		{
			body = "O_Flames_MRAP_01_flames_01_F";									
			bodyTextures[] = {"a3\soft_f\mrap_01\data\mrap_01_base_co.paa","a3\soft_f\mrap_01\data\mrap_01_adds_co.paa","a3\data_f\vehicles\turret_co.paa"};
			turretTextures[] = {"","","a3\data_f\vehicles\turret_co.paa"};
			turretAnimation = "passenger_generic01_foldhands";
			turretSeatPosition = 2;
			attachPos[] = {0,0,0.55}; 
			weapons[] = {"GMG_40mm"};
			magazines[] = {"96Rnd_40mm_G_belt","96Rnd_40mm_G_belt"};
			seatFunction = "car";
		}

		class I_MRAP_03_hmg_F
		{
			body = "B_Clouds_MRAP_03_blufor_F";									
			bodyTextures[] = {"a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f\vehicles\turret_co.paa"};
			turretTextures[] = {"","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"};
			turretAnimation = "passenger_generic01_foldhands";
			turretID = 1;
			attachPos[] = {0,0,0.7}; 
			weapons[] = {"HMG_127"};
			magazines[] = {"200Rnd_127x99_mag_Tracer_Yellow","200Rnd_127x99_mag_Tracer_Yellow"};
			seatFunction = "car";
			hitParts[] = {"glass1", "glass2", "glass3", "glass4", "glass5"};
		}

		class I_MRAP_03_gmg_F
		{
			body = "B_Clouds_MRAP_03_blufor_F";
			bodyTextures[] = {"a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f\vehicles\turret_co.paa"};
			turretTextures[] = {"","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"};
			turretAnimation = "passenger_generic01_foldhands";
			turretID = 1;
			attachPos[] = {0,0,0.7}; 
			weapons[] = {};
			magazines[] = {"96Rnd_40mm_G_belt"};
			seatFunction = "car";
			hitParts[] = {"glass1", "glass2", "glass3", "glass4", "glass5"};
		}
		
		class B_APC_Tracked_01_AA_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyTextures[] = {"#(rgb,8,8,3)color(0.73,0.7,0.6,0.15)","a3\armor_f_gamma\mbt_01\data\mbt_01_body_co.paa"};
			turretTextures[] = {};
			attachPos[] = {0.3,-0.5,0.6}; 
			weapons[] = {"autocannon_35mm","missiles_titan_AA"};
			magazines[] = {"4Rnd_Titan_long_missiles","4Rnd_Titan_long_missiles","680Rnd_35mm_AA_shells_Tracer_Red","680Rnd_35mm_AA_shells_Tracer_Red"};
			seatFunction = "tank";
			isTracked = 1;
		}
		
		class O_APC_Tracked_02_AA_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyTextures[] = {"","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"};
			turretTextures[] = {};
			attachPos[] = {0.34,0.2,0.4}; 
			weapons[] = {};
			magazines[] = {"680Rnd_35mm_AA_shells_Tracer_Green"};
			seatFunction = "tank";
			isTracked = 1;
		}

		class I_APC_tracked_03_cannon_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyTextures[] = {"","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"};
			turretTextures[] = {"a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa","a3\armor_f_beta\apc_tracked_02\data\apc_tracked_02_ext_01_aa_hexarid_co.paa"};
			attachPos[] = {0.34,-0.9,0.1}; 
			weapons[] = {"autocannon_30mm","LMG_coax"};
			magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Yellow","140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow","200Rnd_762x51_Belt_Yellow"};
			seatFunction = "tank";
			isTracked = 1;
		}
		
		class I_APC_Wheeled_03_cannon_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyMass = 10000;
			bodyTextures[] = {"#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)","argo\supporterspack_argo\vehicles\data\apc_wheeled_02_ext_02_clouds_01_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"};
			turretTextures[] = {"","","#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)",""};
			turretID = 2;
			attachPos[] = {-0.2,-0.7,0.2}; 
			weapons[] = {};
			magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Yellow","60Rnd_30mm_APFSDS_shells_Tracer_Yellow"};
			seatFunction = "tank";
		}

		
		class B_APC_Wheeled_01_cannon_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyMass = 10000;
			bodyTextures[] = {"#(rgb,8,8,3)color(0.73,0.7,0.6,0.25)","argo\supporterspack_argo\vehicles\data\apc_wheeled_02_ext_02_clouds_01_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"};
			turretTextures[] = {"","","a3\armor_f_beta\apc_wheeled_01\data\apc_wheeled_01_tows_co.paa"};
			attachPos[] = {0.34,-1.1,0}; 
			weapons[] = {};
			magazines[] = {"60Rnd_40mm_GPR_Tracer_Red_shells", "40Rnd_40mm_APFSDS_Tracer_Red_shells"};
			seatFunction = "tank";
		};
	
		class O_APC_Tracked_02_cannon_F
		{
			body = "B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F";
			bodyTextures[] = {"","a3\armor_f_beta\apc_tracked_02\data\rcws30_opfor_co.paa","a3\data_f_exp\vehicles\turret_ghex_co.paa"};
			turretTextures[] = {};
			attachPos[] = {0.34,0.1,0.2}; 
			weapons[] = {};
			magazines[] = {"140Rnd_30mm_MP_shells_Tracer_Green","60Rnd_30mm_APFSDS_shells_Tracer_Green"};
			seatFunction = "tank";
			isTracked = 1;
		};

		

	};
};