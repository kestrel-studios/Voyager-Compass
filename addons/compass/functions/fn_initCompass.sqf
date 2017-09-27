/*
  version 1.0
  description:
*/

 waitUntil {!isNull player};

systemchat "init UGTX_fnc_initCompass";

[] spawn UGTX_fnc_showCompass;

player addAction ["Compass Settings", {[] call UGTX_fnc_showSettings;}];
