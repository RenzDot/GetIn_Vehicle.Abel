//By Renz, 2019
//Returns a list of function names from a config such as cfgFunctions

_cfgConfig = param [0, configNull, [configNull]];
_functionNames = [];

for "_f" from 0 to (count _cfgConfig - 1) do//e.g. CfgFunctions
{
	_functionSet = _cfgConfig select _f;
	for "_s" from 0 to (count _functionSet - 1) do//e.g. Renz_functions
	{
		_functionTag = _functionSet select _s;
		for "_c" from 0 to (count _functionTag - 1) do//e.g. Renz
		{
			_functionClass = _functionTag select _c;
			if (isClass _functionClass) then {
				_fncName = format [
					"%1_fnc_%2",
					getText (_functionSet >> "tag"),
					configName _functionClass
				];

				_functionNames pushback _fncName;
			}

		}
		
	}

};

_functionNames