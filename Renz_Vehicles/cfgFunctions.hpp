#define fnc(fname) class fname {headerType = -1;}


class Renz_Vehicles
{
	tag = "Renz";

	class Vehicles 
	{
		file = "Renz_Vehicles\Functions";
		fnc(vehicleInit);
		fnc(vehicleCamera);
		fnc(vehicleAddKeybind);
		fnc(vehicleForceEject);
		fnc(vehicleSwitchSeat);
		fnc(vehicleSwitchSeatCar);
		fnc(vehicleSwitchSeatTank);
		fnc(vehicleSwitchSeatAir);
		fnc(vehicleShowSeat);
		fnc(vehicleSwitchMoveGlobal);
		fnc(vehicleAddActionGlobal);
		fnc(vehicleAddActionJIP);
		fnc(vehicleGetGunnerBody);
		fnc(vehicleGetIn);
		fnc(vehicleGetNewSeat);
		fnc(vehicleConfigSetup);
	}
};
