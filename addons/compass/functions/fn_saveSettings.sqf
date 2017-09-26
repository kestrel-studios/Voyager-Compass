/*
  version 1.0
  description: saves settings to profileNameSpace
*/
systemchat "init fn_saveSettings";

params ["_ncX", "_ncY","_ncW","_ncSpan","_ncType","_ncFontSize","_ncAlpha","_ncAlphaNr","_ncFontOption","_ncInvert","_ncShadow","_ncMarkerVisibility","_ncMarkerY","_ncFontOptionNr","_ncColorNr","_ncTypeNr","_ncColorCustom","_ncColor"];

profileNamespace setVariable ["nc_settings",[_ncX,_ncY,_ncW,_ncSpan,_ncType,_ncFontSize,_ncAlpha,_ncAlphaNr,_ncFontOption,_ncInvert,_ncShadow,_ncMarkerVisibility,_ncMarkerY,_ncFontOptionNr,_ncColorNr,_ncTypeNr,_ncColorCustom,_ncColor]];
saveProfileNamespace;

systemchat "saving complete";
