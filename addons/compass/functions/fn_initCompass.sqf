/*
  version 1.0
  description:
*/

 waitUntil {!isNull player};

systemchat "init UGTX_fnc_initCompass";

[] spawn UGTX_fnc_showCompass;

(_this select 0) addAction ["Compass Settings", {[] call UGTX_fnc_showSettings;}];
