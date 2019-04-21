/*
	Function: fn_pull
	Author(s): Naught
	Version: 1.0

	License:
		Copyright (c) 2014 Dylan Plecki. All Right Reserved.
		Licensed under Creative Commons (CC BY-NC 4.0).
		http://creativecommons.org/licenses/by-nc/4.0/
*/

// Settings
// #define DEBUG_MODE_FULL

// Constants
#define MAX_CHAR_SIZE 8 // bits
#define CHAR_ZERO_REP 256

params ["_flow","_text","_k"];

#ifdef DEBUG_MODE_FULL
	private ["_startTime"];
	_startTime = diag_tickTime;
#endif

private ["_fnc_intToBin"];
_fnc_intToBin = {
	params ["_int", ["_bin",[]]];
	
	private ["_pwr", "_bool"];
	for "_i" from (MAX_CHAR_SIZE - 1) to 0 step (-1) do
	{
		_pwr = 2^(_i);
		_bool = _pwr <= _int;
		
		_bin set [(count _bin), _bool];
		
		if (_bool) then {_int = _int - _pwr};
	};
	
	_bin
};

private ["_bin"];
_bin = [];

// Convert string to UTF-8 binary
{ // count (faster than forEach
	[	[_x,0] select (_x == CHAR_ZERO_REP), _bin	] call _fnc_intToBin;
	false;
} count toArray(_text);

#ifdef DEBUG_MODE_FULL
	diag_log text format["[%1] fn_pull <info>: Trace: Line #%2. Benchmark: %3 sec.", round(diag_tickTime), __LINE__, (diag_tickTime - _startTime)];
#endif

_k = toArray(_k);

private ["_kLength", "_state", "_temp", "_j"];
_kLength = count _k;
_state = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255];
_temp = 0;
_j = 0;

for "_i" from 0 to 255 do
{
	_temp = _state select _i;
	
	_j = (_j + _temp + (_k select (_i mod _kLength))) mod CHAR_ZERO_REP;
	
	//Swap index positions
	_state set [_i, (_state select _j)];
	_state set [_j, _temp];
};

#ifdef DEBUG_MODE_FULL
	diag_log text format["[%1] fn_pull <info>: Trace: Line #%2. Benchmark: %3 sec.", round(diag_tickTime), __LINE__, (diag_tickTime - _startTime)];
#endif

private ["_temp1", "_temp2", "_rand", "_i", "_mod", "_rbit"];
_temp1 = 0;
_temp2 = 0;
_rand = [];
_i = 0;
_j = 0;

{ // forEach
	_mod = _forEachIndex % MAX_CHAR_SIZE;
	
	if (_mod == 0) then
	{
		_i = (_i + 1) mod CHAR_ZERO_REP;
		_j = (_j + (_state select _i)) mod CHAR_ZERO_REP;
		
		_temp1 = _state select _i;
		_temp2 = _state select _j;
		
		_state set [_i, _temp2];
		_state set [_j, _temp1];
		
		_rand = [(_state select ((_temp1 + _temp2) mod CHAR_ZERO_REP))] call _fnc_intToBin;
	};
	
	_rbit = _rand select _mod;
	_bin set [_forEachIndex, (_x && !_rbit) || {!_x && _rbit}]; // XOR
	
} forEach _bin;

#ifdef DEBUG_MODE_FULL
	diag_log text format["[%1] fn_pull <info>: Trace: Line #%2. Benchmark: %3 sec.", round(diag_tickTime), __LINE__, (diag_tickTime - _startTime)];
#endif


private ["_dec", "_buf", "_mod"];
_dec = 0;
_buf = [];

// Convert binary array to UTF-8 string
{ // forEach
	_mod = _forEachIndex % MAX_CHAR_SIZE;
	
	if (_x) then {_dec = _dec + 2^((MAX_CHAR_SIZE - 1) - _mod)};
	
	if (_mod == 7) then
	{
		if (_dec == 0) then {_dec = CHAR_ZERO_REP};
		_buf set [(count _buf), _dec];
		_dec = 0;
	};
} forEach _bin;

#ifdef DEBUG_MODE_FULL
	diag_log text format["[%1] fn_pull <info>: Processed: %2 bits. Benchmark: %3 sec.", round(diag_tickTime), (count _bin), (diag_tickTime - _startTime)];
#endif

_buf