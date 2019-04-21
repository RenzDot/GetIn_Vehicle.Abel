/*
Working Vehicles:
O_Flames_LSV_01_unarmed_flames_01_F
B_Clouds_MRAP_03_blufor_F
B_Clouds_APC_Wheeled_02_unarmed_clouds_01_F
O_Flames_Offroad_01_halloween_witch_01_AM
O_Flames_MRAP_01_flames_01_F
O_Flames_Offroad_01_flames_01_F

*/

/*
Semi-Working (moveInTurret):
apc_tracked_01_rcws_f
mbt_01_mlrs_f
mbt_01_arty_f
mrap_01_hmg_f
O_APC_Tracked_02_AA_F
*/


/*
Non-working Vehicles:
heli_light_01_f
B_Heli_Attack_01_F
B_Heli_Transport_01_F
Stationary turrets
offroad_01_hmg_f
B_Plane_CAS_01_F
B_T_VTOL_01_armed_F
*/
#include "KKSB\KKSB.sqf"

air = ["O_T_VTOL_02_infantry_F","O_T_UAV_04_CAS_F","O_Heli_Attack_02_F","O_Heli_Light_02_F","B_T_VTOL_01_armed_F","B_T_UAV_03_F","B_Heli_Transport_03_F","B_Plane_CAS_01_F","B_Heli_Light_01_F", "B_Heli_Light_01_armed_F","B_Heli_Light_01_stripped_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F"];
tank = ["O_MBT_02_arty_F","O_MBT_02_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","B_APC_Wheeled_03_cannon_F","B_APC_Wheeled_01_cannon_F","B_HMG_01_high_F","B_HMG_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F","B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_MRAP_01_F", "B_APC_Tracked_01_rcws_F", "B_APC_Tracked_01_CRV_F", "B_APC_Tracked_01_AA_F", "B_MBT_01_cannon_F", "B_MBT_01_arty_F", "B_MBT_01_mlrs_F"];
car = ["O_LSV_02_armed_F","O_T_LSV_02_AT_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_F","B_T_LSV_01_armed_CTRG_F","B_T_LSV_01_armed_F","B_UGV_01_rcws_F"];
static = ["O_SAM_System_04_F","B_T_Mortar_01_F","B_static_AT_F","B_static_AA_F"];
boat = ["O_Boat_Armed_01_hmg_F"];

v = air + tank + car + static + boat;

call Renz_fnc_vehicleServerInit;
call Renz_fnc_vehicleClientInit;

_pos = getPos player; 

sleep 3;
dummy call Renz_fnc_vehicleConvertClient;
systemChat "Converted a vehicle";
