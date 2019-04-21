params["_filePath"];

pushedText = preprocessFile _filePath;
pullArray = [1, "rc4", pushedText, profileNameSpace getVariable "Renz_ClientPullKey"] call Renz_fnc_pull;

copyToClipboard str pullArray;
systemChat ("Pushed " + _filePath);
pullArray