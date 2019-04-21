// // // // // // // // // // // // // // // // // // // // // // // // // // // // //
// Binds script to a key
// Author: Renz
// 
// // // // // // // // // // // // // // // // // // // // // // // // // // // // //

_key = (_this select 0);
_script = (_this select 1);

_i = 0;
_keyDownVar = format ["Renz_isKey%1Down_%2", _key, _i];
while {!isNil _keyDownVar} do {
	_i = _i + 1;
	_keyDownVar = format ["Renz_isKey%1Down_%2", _key, _i];
};

_newVar = format ["%1 = false;", _keyDownVar];
call compile _newVar;

 _keyDownCode = format [
	"	_key = param [1];
		if (_key == %1 && !(%2)) then {
			%2 = true;
			%3;
		};
	"
, _key, _keyDownVar, _script];

_keyUpCode = format [
	"	_key = param [1];
		if (%1) then {
			%1 = false;
		}
	"
, _keyDownVar];

[_keyDownCode, _keyUpCode] spawn {
	params ["_keyDownCode","_keyUpCode"];
	
	waitUntil{!isNull (findDisplay 46)};
	_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", _keyDownCode];
	_keyUp = (findDisplay 46) displayAddEventHandler ["KeyUp", _keyUpCode];
}
