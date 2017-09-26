/*
  version 1.0
  description: just move that function to it's own file
*/
systemchat "init fn_removeString";

params ["_from", "_to", "_string"];
_stringArray = _string splitString "";
_stringArray deleteRange [_from, _to];
_stringArray = _stringArray joinString "";
private _returnMe = _stringArray;
_returnMe;
