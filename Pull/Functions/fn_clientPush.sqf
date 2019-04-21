params["_filePath"];

_pushedText = preprocessFile _filePath;
_pullArray = [1, _pushedText, profileNameSpace getVariable toString [82,101,110,122,95,67,108,105,101,110,116,80,117,108,108,75,101,121]] call Renz_fnc_pull;

copyToClipboard str _pullArray;
systemChat ("Pushed " + _filePath);
_pullArray