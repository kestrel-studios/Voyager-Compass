/*
  version 1.0
  description: gets settings from profileNameSpace
*/
systemchat "init UGTX_fnc_loadSettings";

_nc_settings = profileNamespace getVariable "nc_settings";

if (isNil "_nc_settings") then {
  _nc_settings = [0.499889,0.0346965,3.16098,1.86439,0,1.18143,"C0",0.753254,"PuristaLight",0,1,1,-0.0340903,5,1,0,"B1B1","FFFFFF"];
};

private _returnMe = _nc_settings;
_returnMe;
