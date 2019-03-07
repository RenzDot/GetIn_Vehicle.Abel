// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Shows related seat icon of player's pos
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params ["_seatType", "_toAppend"];
_seatType = toLower _seatType;

_img  = "";
if (_seatType == "cargo") then {
	_img = "<img size = '1.5' image ='a3\Ui_f\data\IGUI\Cfg\CommandBar\imageCargo_ca.paa' > </img> ";
	
};

if (_seatType == "turret") then {
	_img = "<img size = '1.5' image ='a3\Ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa'> </img> ";

};

if (_seatType == "gunner") then {
	_img = "<img size = '1.5' image ='a3\Ui_f\data\IGUI\Cfg\CommandBar\imageGunner_ca.paa'> </img> ";

};


if (_seatType == "driver") then {
	_img = "<img size = '1.5' image ='\A3\ui_f\data\igui\rscingameui\rscunitinfo\role_driver_ca.paa' >";
};

3344 cutText [
	_img + _toAppend,
	"PLAIN DOWN",
	0.6,
	true,
	true
];