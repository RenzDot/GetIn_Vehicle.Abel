#define fnc(fname) class fname {headerType = -1;}


class Renz_Vehicles
{
	tag = "Renz";

	class Vehicles 
	{
		file = "Renz_Vehicles\Functions";
		fnc(vehicleInit);
		fnc(vehicleCamera);
		fnc(addKeybind);
		fnc(forceEject);
		fnc(switchSeat);
		fnc(switchSeatCar);
		fnc(switchSeatTank);
		fnc(switchSeatAir);
		fnc(showSeat);
		fnc(switchMoveGlobal);
		fnc(addVehActionGlobal);
		fnc(addVehActionJIP);
		fnc(getGunnerBody);
		fnc(getIn);
		fnc(getNewSeat);
	}
}
