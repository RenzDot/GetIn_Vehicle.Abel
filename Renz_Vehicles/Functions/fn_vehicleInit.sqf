// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_gunner",objNull]];
 
if !(local _gunner) exitWith {};

//>>>>> Vehicle Config
_config =  (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _gunner);
_bodyType = [_config,"body",""] call BIS_fnc_returnConfigEntry;
_bodyTextures = [_config,"bodyTextures",[]] call BIS_fnc_returnConfigEntry;
_gunnerTextures = [_config, "gunnerTextures",[]] call BIS_fnc_returnConfigEntry;
_gunnerAnimation = [_config, "gunnerAnimation", ""] call BIS_fnc_returnConfigEntry;
_attachPos = [_config, "attachPos", [0,0,0]] call BIS_fnc_returnConfigEntry;
_weapons = [_config, "weapons",[]] call BIS_fnc_returnConfigEntry;
_magazines = [_config, "magazines",[]] call BIS_fnc_returnConfigEntry;
_mass = [_config, "bodyMass",-1] call BIS_fnc_returnConfigEntry;
_seatFunction = [_config, "seatFunction", ""] call BIS_fnc_returnConfigEntry;
_hitParts = [_config, "hitParts",[]] call BIS_fnc_returnConfigEntry;
_isTracked = [_config, "isTracked", 0] call BIS_fnc_returnConfigEntry;

//>>>>> Setup Body
_pos = getPosATL _gunner;
_body = createVehicle [_bodyType,  [0,0,0],[],0,"NONE"];
_body setVectorDirAndUp [vectorDir _gunner, vectorUp _gunner];
{_body setObjectTextureGlobal [_forEachIndex, _x]} forEach _bodyTextures;
if (_mass > 0) then {_body setMass _mass};
_body lock true;
_gunner lock true;

//>>>>> Connect Gunner to Body
if (_seatFunction in ["car","tank"]) then {

	if (count allTurrets _gunner > 0) then {
		_gunner attachTo [_body,_attachPos];
		{_gunner setHit [_x, 1, false]} forEach _hitParts;
		{_gunner setObjectTextureGlobal [_forEachIndex, _x]} forEach _gunnerTextures;
		{_gunner addWeapon _x} forEach _weapons;
		{_gunner addMagazine _x} forEach _magazines; 

		_gunner addEventHandler ["Deleted", {	deleteVehicle (attachedTo (_this select 0))	}];
		_gunner addEventHandler ["Killed",{	(attachedTo (_this select 0)) setDamage [1,false]	}];

		_body addEventHandler ["Deleted",{
			_gunner = ((_this select 0) call Renz_fnc_getGunnerBody) select 0;
			deleteVehicle _gunner;
		}];
		_body addEventHandler ["Killed",{
			_gunner = ((_this select 0) call Renz_fnc_getGunnerBody) select 0;
			_gunner setDamage [1,false];
		}];
	} else {
		deleteVehicle _gunner;
	};
};
_body setPosATL _pos;

//addAction to vehicle
[_body, true] call Renz_fnc_addVehActionGlobal;
