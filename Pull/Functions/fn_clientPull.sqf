waitUntil{!isNil "Renz_Client_PullValue"};

//compileFinal pull functions
_pullFunctions = [missionConfigFile >> "Renz_Client_ToPull"] call Renz_fnc_getFunctionNames;
{
	_reassign = compile format["%1 = compileFinal toString([0, 'rc4', toString(call %1), profileNamespace getVariable 'Renz_clientPullKey'] call Renz_fnc_pull)", _x];
	call _reassign;
} forEach _pullFunctions;


//compileFinal all functions from descrption.ext
_missionFunctions = ([missionConfigFile >> "CfgFunctions"] call Renz_fnc_getFunctionNames) - _pullFunctions;
{
	_compileFinal = compile format["%1 = compileFinal (	(str %1) select [1, count (str %1) - 2]	)", _x];
	call _compileFinal;
} forEach _missionFunctions;


if (isServer) exitWith {};

//compileFinal all BIS functions
{
	_compileFinal = compile format["%1 = compileFinal (	(str %1) select [1, count (str %1) - 2]	)", _x];
	call _compileFinal;
} forEach (	call (uinamespace getvariable ["bis_functions_list",{[]}])	);
