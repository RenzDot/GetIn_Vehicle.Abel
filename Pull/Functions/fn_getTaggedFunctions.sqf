//By Renz, 2019
//Returns a list of function names from a config such as cfgFunctions

_searchTag = param [0, "", [""]];
_cfgFnc = "true" configClasses (getMissionConfig "CfgFunctions");
_taggedFncs = [];

for "_group" from 0 to (count _cfgFnc - 1) do {
	_fncTag = getText (_cfgFnc select _group >> "tag");
	_fncSet = "true" configClasses (_cfgFnc select _group);

	for "_set" from 0 to (count _fncSet -1) do {
		_fncAllNames = "true" configClasses (_fncSet select _set);
		
		for "_name" from 0 to (count _fncAllNames -1) do {
			_fncName = configName (_fncAllNames select _name); 
			_endTag = _fncName select [count _fncName - count _searchTag, count _fncName - 1];
			if (toLower _searchTag == toLower _endTag) then {
				_compiledName = format ["%1_fnc_%2", _fncTag, _fncName];
				_taggedFncs pushBack _compiledName;
			};
		};

	};
	
};

_taggedFncs