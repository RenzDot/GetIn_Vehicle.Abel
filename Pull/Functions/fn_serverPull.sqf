//[1, "rc4", plainText, key] call Renz_fnc_pull;
if (!isServer) exitWith {};
Renz_Client_PullValue = profileNamespace getVariable "Renz_clientPullKey";
publicVariable "Renz_Client_PullValue";

//compileFinal pull functions
_pullFunctions = [missionConfigFile >> "Renz_Server_ToPull"] call Renz_fnc_getFunctionNames;
{
	_reassign = compile format["%1 = compileFinal toString([0, 'rc4', toString(call %1), profileNamespace getVariable 'Renz_serverPullKey'] call Renz_fnc_pull)", _x];
	call _reassign;
} forEach _pullFunctions;
copyToClipboard str _pullFunctions;

//compileFinal all BIS functions
{
	_compileFinal = compile format["%1 = compileFinal (	(str %1) select [1, count (str %1) - 2]	)", _x];
	call _compileFinal;
} forEach (	call (uinamespace getvariable ["bis_functions_list",{[]}])	);
