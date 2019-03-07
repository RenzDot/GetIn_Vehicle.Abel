// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Sets up Argo vehicles 
// Author: Renz
// To use: 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

params [["_turret",objNull]];
 
if !(local _turret) exitWith {};

//>>>>> Vehicle Config
_config =  (missionConfigFile >> "CfgRenzVehicles" >> "Vehicles" >> typeOf _turret);
_bodyType = [_config,"body",""] call BIS_fnc_returnConfigEntry;
_bodyTextures = [_config,"bodyTextures",[]] call BIS_fnc_returnConfigEntry;
_turretSelections = [_config, "turretSelections",[]] call BIS_fnc_returnConfigEntry;
_turretAnimation = [_config, "turretAnimation", ""] call BIS_fnc_returnConfigEntry;
_turretID = [_config, "turretID",-1] call BIS_fnc_returnConfigEntry;
_attachPos = [_config, "attachPos", [0,0,0]] call BIS_fnc_returnConfigEntry;
_weapons = [_config, "weapons",[]] call BIS_fnc_returnConfigEntry;
_magazines = [_config, "magazines",[]] call BIS_fnc_returnConfigEntry;
_mass = [_config, "bodyMass",-1] call BIS_fnc_returnConfigEntry;
_seatFunction = [_config, "seatFunction", ""] call BIS_fnc_returnConfigEntry;
_hitParts = [_config, "hitParts",[]] call BIS_fnc_returnConfigEntry;
_isTracked = [_config, "isTracked", 0] call BIS_fnc_returnConfigEntry;

//>>>>> Setup turret 
_pos = getPosATL _turret;
_body = _bodyType createVehicle [0,0,0];
_body setVectorDirAndUp [vectorDir _turret, vectorUp _turret];

{_turret setHit [_x, 1, false]} forEach _hitParts;
if (_mass > 0) then {_body setMass _mass};
_turret attachTo [_body,_attachPos];
_body setPosATL _pos;

{_body setObjectTextureGlobal [_forEachIndex, _x]} forEach _bodyTextures;
{_turret setObjectTextureGlobal [_x,""]} forEach _turretSelections;
{_turret addWeapon _x} forEach _weapons;
{_turret addMagazine _x} forEach _magazines; 

//Wheel damage resistance for tracked vehicles
if (_isTracked == 1) then {
	_body addEventHandler ["HitPart",{
		(_this select 0) params ["_body", "","","","","_selection"];
		_hitPart = (_selection select 0);
		systemChat str _hitPart;
		_wheels = ["wheel_2_1_hide","wheel_2_2_hide","wheel_2_3_hide","wheel_1_1_hide","wheel_1_2_hide","wheel_1_3_hide"];
		if (_hitPart in _wheels) then {
			_body setHit [_hitPart, 0];
			systemChat (_hitPart + " hit");
		};
	}];
};

if (_turretID > -1) then {
	_turret setObjectTextureGlobal [_turretID, (_bodyTextures select 0)];
};

_turret addEventHandler ["Deleted", {	deleteVehicle (attachedTo (_this select 0))	}];
_turret addEventHandler ["Killed",{	(attachedTo (_this select 0)) setDamage 1	}];

_body addEventHandler ["Deleted",{
	_turret = ((_this select 0) call Renz_fnc_getTurretBody) select 0;
	deleteVehicle _turret;
}];
_body addEventHandler ["Killed",{
	_turret = ((_this select 0) call Renz_fnc_getTurretBody) select 0;
	_turret setDamage 1;
}];

_turret lock true;
_body lock true;

//addAction to vehicle
[_turret, true] call Renz_fnc_addVehActionGlobal;
