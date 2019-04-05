// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_gunner",objNull]];
 
if !(local _gunner) exitWith {};
if (isNil "Renz_Vehicle_Configs") then {
	call Renz_fnc_vehicleConfigSetup;
};

_vehIndex = (Renz_Vehicle_Types find (typeOf _gunner));
if (_vehIndex == -1) exitWith {systemChat (typeOf _gunner + " does not exist")};

//>>>>> Vehicle Config
_vehConfig = Renz_Vehicle_Configs select _vehIndex;
_bodyType = _vehConfig select 1;
_bodyTextures = _vehConfig select 2;
_gunnerTextures = _vehConfig select 3;
_gunnerAnimation = _vehConfig select 4;
_attachPos = _vehConfig select 5;
_weapons = _vehConfig select 6;
_magazines = _vehConfig select 7;
_mass = _vehConfig select 8;
_seatFunction = _vehConfig select 9;
_hitParts = _vehConfig select 10;
_isTracked = _vehConfig select 11;
_compositeType = _vehConfig select 12;
_gunnerSeatPosition = _vehConfig select 13;

//>>>>> Setup Body
_pos = getPosATL _gunner;
_body = createVehicle [_bodyType,  [0,0,0],[],0,"NONE"];
_body setVectorDirAndUp [vectorDir _gunner, vectorUp _gunner];
_body setVariable ["Renz_seatFunction", _seatFunction];

{_body setObjectTextureGlobal [_forEachIndex, _x]} forEach _bodyTextures;
if (_mass > 0) then {_body setMass _mass};
_body lock true;
_gunner lock true;

//>>>>> Connect Gunner to Body
if (_seatFunction in ["car","tank"]) then {
	if (count allTurrets _gunner > 0) then {
		_gunner attachTo [_body,_attachPos];
		_gunner setVariable ["Renz_seatFunction", _seatFunction, true];
		_gunner setVariable ["Renz_gunnerSeatPosition", _gunnerSeatPosition, true];
		{_gunner setHit [_x, 1, false]} forEach _hitParts;
		{_gunner setObjectTextureGlobal [_forEachIndex, _x]} forEach _gunnerTextures;
		{_gunner addWeapon _x} forEach _weapons;
		{_gunner addMagazine _x} forEach _magazines; 

		_gunner addEventHandler ["Deleted", {	deleteVehicle (attachedTo (_this select 0))	}];
		_gunner addEventHandler ["Killed",{	(attachedTo (_this select 0)) setDamage 1	}];

		_body addEventHandler ["Deleted",{
			_gunner = ((_this select 0) call Renz_fnc_vehicleGetGunnerBody) select 0;
			deleteVehicle _gunner;
		}];
		_body addEventHandler ["Killed",{
			_gunner = ((_this select 0) call Renz_fnc_vehicleGetGunnerBody) select 0;
			_gunner setDamage 1;
		}];
	} else {//Unarmed vehicle
		deleteVehicle _gunner;
	};
};

if (_seatFunction == "air") then {
	{_body addWeapon _x} forEach _weapons;
	{_body addMagazine _x} forEach _magazines; 
	deleteVehicle _gunner; 
};

_body setPosATL _pos;

//addAction to vehicle
[_body, true] call Renz_fnc_vehicleAddactionGlobal;
