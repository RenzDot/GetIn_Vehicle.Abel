player removeAllEventHandlers "GetInMan";
player removeAllEventHandlers "GetOutMan";
player removeAllEventHandlers "Killed";

(findDisplay 46) displayRemoveAllEventHandlers "KeyDown";
(findDisplay 46) displayRemoveAllEventHandlers "KeyUp";
removeAllMissionEventHandlers "EachFrame";

//Recompile functions
/*_fncPaths = "true" configClasses (missionConfigFile >> "cfgFunctions" >> "Renz_Vehicles" >> "Vehicles");
{
	_fncName = configName _x;
	_filePath = format ["Renz_Vehicles\Functions\fn_%1.sqf",_fncName];
	_code = format ["Renz_fnc_%1 = compile preprocessFileLineNumbers '%2'", _fncName, _filePath];
	call compile _code;
} forEach _fncPaths;*/

execVM "Renz_Vehicles\clientInit.sqf";

