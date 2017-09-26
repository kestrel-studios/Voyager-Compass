/*
  version 1.0
  description: opens the settings dialog with saved settings shown or default if no settings saved

  usage: [] call UGTX_fnc_showSettings; IMPORTANT: UGTX_fnc_showCompass has to be executed afterwards!

*/
systemchat "init UGTX_fnc_showSettings";

disableSerialization;

ncColorOption = "f9f9f9";
nc_lb_colorOption = [
ncColorOption,
"FFFFFF",
"000000"];
nc_lb_fontOption = [
"EtelkaMonospacePro",
"EtelkaMonospaceProBold",
"EtelkaNarrowMediumPro",
"LucidaConsoleB",
"PuristaBold",
"PuristaLight",
"PuristaMedium",
"PuristaSemiBold",
"RobotoCondensed",
"RobotoCondensedBold",
"RobotoCondensedLight",
"TahomaB"];

folder = [] call UGTX_fnc_loadSettings;
if (isNil "folder") then {
  folder = [0.499889,0.0346965,3.16098,1.86439,0,1.18143,"C0",0.753254,"PuristaLight",0,1,1,-0.0340903,5,1,0,"B1B1","FFFFFF"];
};

("compassTitle" call BIS_fnc_rscLayer) cutRsc ["RscTitleDisplayEmpty", "PLAIN"];


ncX                 = folder select 0;
ncY                 = folder select 1;
ncW                 = folder select 2;
ncSpan              = folder select 3;
ncType              = folder select 4;
ncFontSize          = folder select 5;
ncAlpha             = folder select 6;
ncAlphaNr           = folder select 7;
ncFontOption        = folder select 8;
ncInvert            = folder select 9;
ncShadow            = folder select 10;
ncMarkerVisibility  = folder select 11;
ncMarkerY           = folder select 12;
ncFontOptionNr      = folder select 13;
ncColorNr           = folder select 14;
ncTypeNr            = folder select 15;

ncColor             = folder select 17;

nc_barOffsetX       = (ncX * safezoneW + safezoneX);
nc_barOffsetY       = (ncY * safezoneH + safezoneY);
nc_marker_offset    = ncMarkerY + nc_barOffsetY;

nc_dialog_controls = [
	[1000,"nc_background",[1,"",[0.29375 * safezoneW + safezoneX,0.225 * safezoneH + safezoneY,0.170156 * safezoneW,0.759 * safezoneH],[-1,-1,-1,-1],[0.07,0.07,0.07,1],[-1,-1,-1,-1],"","RscText"],[]],
  [1004,"nc_background_char",[1,"",[0.304062 * safezoneW + safezoneX,0.489 * safezoneH + safezoneY,0.149531 * safezoneW,0.264 * safezoneH],[-1,-1,-1,-1],[0.03,0.03,0.03,1],[-1,-1,-1,-1],"","RscText"],[]],
  [1001,"nc_background_pos",[1,"",[0.304062 * safezoneW + safezoneX,0.28 * safezoneH + safezoneY,0.149531 * safezoneW,0.154 * safezoneH],[-1,-1,-1,-1],[0.03,0.03,0.03,1],[-1,-1,-1,-1],"","RscText"],[]],
  [1007,"nc_background_features",[1,"",[0.304062 * safezoneW + safezoneX,0.808 * safezoneH + safezoneY,0.149531 * safezoneW,0.11 * safezoneH],[-1,-1,-1,-1],[0.03,0.03,0.03,1],[-1,-1,-1,-1],"","RscText"],[]],
  [1002,"nc_background_title_pos",[1,"STAND & SPOT",[0.304062 * safezoneW + safezoneX,0.247 * safezoneH + safezoneY,0.149531 * safezoneW,0.033 * safezoneH],[-1,-1,-1,-1],[0.11,0.11,0.11,1],[-1,-1,-1,-1],"","RscText"],[]],
	[1103,"nc_background_pos_x",[1,"X",[0.314375 * safezoneW + safezoneX,0.291 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"HORIZONTAL POSITION. Set the correct horizontal position you desire.","RscStructuredText"],[]],
	[1104,"nc_background_pos_y",[1,"Y",[0.314375 * safezoneW + safezoneX,0.324 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"VERTICAL POSITION. Set the correct vertical position you desire.","RscStructuredText"],[]],
  [1106,"nc_background_pos_w",[1,"W",[0.314375 * safezoneW + safezoneX,0.357 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"WIDTH. Exact range of visibility for points.","RscStructuredText"],[]],
  [1107,"nc_background_pos_s",[1,"S",[0.314375 * safezoneW + safezoneX,0.39 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"SPAN. Change the distance between the points.","RscStructuredText"],[]],
	[1003,"nc_background_title_char",[1,"CHARACTERISTICS",[0.304062 * safezoneW + safezoneX,0.456 * safezoneH + safezoneY,0.149531 * safezoneW,0.033 * safezoneH],[-1,-1,-1,-1],[0.11,0.11,0.11,1],[-1,-1,-1,-1],"","RscText"],[]],
  [1100,"nc_background_fontSize",[1,"sS",[0.314375 * safezoneW + safezoneX,0.544 * safezoneH + safezoneY,0.020625 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"SIZE-FONT. Determines the size of the individual cardinal points.","RscStructuredText"],[]],
  [1102,"nc_background_fontAlpha",[1,"A",[0.314375 * safezoneW + safezoneX,0.577 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[1,1,1,0.5],[0,0,0,0],[-1,-1,-1,-1],"TRANSPARENCY. Set the visibility of the whole compass.","RscStructuredText"],[]],
  [1109,"nc_background_fontColor",[1,"#",[0.314375 * safezoneW + safezoneX,0.621 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[1,0,0,1],[0,0,0,0],[-1,-1,-1,-1],"COLOR-CODE. put #HEX color here for custom color.","RscStructuredText"],[]],
  [1110,"nc_background_shadow",[1,"Shadow",[0.402031 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0360937 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"SHADOW. Enable the dropshadow for the cardinal points.","RscStructuredText"],[]],
	[1111,"nc_background_invert",[1,"Invert",[0.355625 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0309375 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"INVERT. Switch between the option of the needles being at the top or bottom of the cardinal points.","RscStructuredText"],[]],
  [1006,"nc_background_title_features",[1,"MARKERS & FEATURES",[0.304062 * safezoneW + safezoneX,0.775 * safezoneH + safezoneY,0.149531 * safezoneW,0.033 * safezoneH],[-1,-1,-1,-1],[0.11,0.11,0.11,1],[-1,-1,-1,-1],"","RscText"],[]],
	[1112,"nc_background_pos_markerY",[1,"Y",[0.314375 * safezoneW + safezoneX,0.83 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"VERTICAL OFFSET. Set the correct vertical offset you desire.","RscStructuredText"],[]],
	[1113,"nc_background_visibility",[1,"Visbility",[0.402031 * safezoneW + safezoneX,0.874 * safezoneH + safezoneY,0.0360937 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[0,0,0,0],[-1,-1,-1,-1],"VISIBILITY. Toggle it.","RscStructuredText"],[]],
  [1114,"nc_background_info_soon",[1,"more features soon",[0.314375 * safezoneW + safezoneX,0.874 * safezoneH + safezoneY,0.0825 * safezoneW,0.022 * safezoneH],[1,1,1,0.3],[0,0,0,0],[-1,-1,-1,-1],"INFO. Future updates coming. Stay tuned","RscText"],[]],
	[1115,"nc_background_impressum",[1,"Voyage Compass 1.0",[0.304062 * safezoneW + safezoneX,0.94 * safezoneH + safezoneY,0.0825 * safezoneW,0.022 * safezoneH],[1,1,1,0.3],[0,0,0,0],[-1,-1,-1,-1],"Creator: Unknown_GTX aka JonVeD","RscText"],[]],
  [2400,"nc_save",[1,"SAVE",[0.412344 * safezoneW + safezoneX,0.94 * safezoneH + safezoneY,0.04125 * safezoneW,0.022 * safezoneH],[0.07,0.07,0.07,1],[0.93,0.93,0.93,1],[0.07,0.07,0.07,1],"Permanently save changes. (stays even after restarting the game)","RscButton"],[],
  ["profileNamespace setVariable ['nc_settings',folder]; saveProfileNamespace;"]],
	[2401,"nc_close",[1,"X",[0.391719 * safezoneW + safezoneX,0.94 * safezoneH + safezoneY,0.0154688 * safezoneW,0.022 * safezoneH],[0.07,0.07,0.07,1],[0.93,0.93,0.93,1],[-1,-1,-1,-1],"Close without save.","RscButton"],[],
  ["(uiNamespace getVariable 'nc_dialogDisplay') closeDisplay 2"]],
	[2800,"ncShadow",[1,"",[0.391719 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0103125 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"SHADOW. Enable the dropshadow for the cardinal points.","RscCheckBox"],[],
	[ncShadow, "folder set [10, (_this select 1)]; switch (_this select 1) do { case (0): { ncShadow = 0; }; case (1): { ncShadow = 2; };};  _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;"]],

	[1901,"ncX",[1,"",[0.340156 * safezoneW + safezoneX,0.302 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"HORIZONTAL POSITION. Set the correct horizontal position you desire.","RscSlider"],[],
	[[/*range*/0,1, ncX], "folder set [0, (_this select 1)]; nc_barOffsetX = ((_this select 1) * safezoneH + safezoneY)"]],

	[1900,"nc_y",[1,"",[0.340156 * safezoneW + safezoneX,0.335 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"VERTICAL POSITION. Set the correct vertical position you desire.","RscSlider"],[],
	[[/*range*/0,1, ncY], "folder set [1, (_this select 1)]; nc_barOffsetY = ((_this select 1) * safezoneH + safezoneY)"]],

	[1902,"nc_w",[1,"",[0.340156 * safezoneW + safezoneX,0.368 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"WIDTH. Exact range of visibility for points.","RscSlider"],[],
	[[/*range*/0,5, ncW], "folder set [2, (_this select 1)]; ncW = (_this select 1)"]],

	[1903,"nc_s",[1,"",[0.340156 * safezoneW + safezoneX,0.401 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"SPAN. Change the distance between the points.","RscSlider"],[],
	[[/*range*/1,3, ncSpan], "folder set [3, (_this select 1)]; ncSpan = (_this select 1)"]],

	[2100,"nc_type",[1,"",[0.319531 * safezoneW + safezoneX,0.511 * safezoneH + safezoneY,0.118594 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"TYPE. Decide what kind of compass you want.","RscCombo"],[],
	[["Arma 3","Battlegrounds"], "folder set [15, (_this select 1)]; ncType = (_this select 1)", ncTypeNr]],

	[1904,"nc_fontSize",[1,"",[0.340156 * safezoneW + safezoneX,0.555 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"SIZE-FONT. Determines the size of the individual cardinal points.","RscSlider"],[],
	[[/*range*/0.8,1.4, ncFontSize], "folder set [5, (_this select 1)]; ncFontSize = (_this select 1); _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;"]],

	[1905,"nc_fontAlpha",[1,"",[0.340156 * safezoneW + safezoneX,0.588 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"TRANSPARENCY. Set the visibility of the whole compass.","RscSlider"],[],
	[[/*range*/0,1,ncAlphaNr], "folder set [7, (_this select 1)]; _clr = [0,0,0,(_this select 1)] call BIS_fnc_ColorRGBAtoHTML; _cutBelow = [0,1, _clr] call UGTX_fnc_removeString; _cutAbove = [2,6, _cutBelow] call UGTX_fnc_removeString; folder set [6, _cutAbove]; ncAlpha = _cutAbove; _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;"]],

	[2103,"nc_font",[1,"",[0.319531 * safezoneW + safezoneX,0.665 * safezoneH + safezoneY,0.118594 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"FONT.  Switch between different looks with the font.","RscCombo"],[],
  [["EtelkaMonospacePro","EtelkaMonospaceProBold","EtelkaNarrowMediumPro","LucidaConsoleB","PuristaBold","PuristaLight","PuristaMedium","PuristaSemiBold","RobotoCondensed","RobotoCondensedBold","RobotoCondensedLight","TahomaB"],
  "folder set [13, (_this select 1)];folder set [8, (nc_lb_fontOption select (_this select 1))]; ncFontOptionNr = (_this select 1); ncFontOption = nc_lb_fontOption select (_this select 1);  _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;", ncFontOptionNr]],

  [1005,"ncColor_code",[1,"",[0.326719 * safezoneW + safezoneX,0.621 * safezoneH + safezoneY,0.04125 * safezoneW,0.022 * safezoneH],[1,1,1,1],[0.03,0.03,0.03,1],[-1,-1,-1,-1],"","RscEdit"],[]],
	[2102,"ncColor",[1,"",[0.371094 * safezoneW + safezoneX,0.621 * safezoneH + safezoneY,0.0670312 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"COLOR. Choose between predefined colors.","RscCombo"],[],
	[["Custom","White","Black"], "folder set [14, (_this select 1)]; folder set [17, (nc_lb_colorOption select (_this select 1))]; ncColorOption = nc_lb_colorOption select (_this select 1);  _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;", ncColorNr]],

	[2801,"nc_invert",[1,"",[0.345312 * safezoneW + safezoneX,0.709 * safezoneH + safezoneY,0.0103125 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"INVERT. Switch between the option of the needles being at the top or bottom of the cardinal points.","RscCheckBox"],[],
	[ncInvert, "folder set [9, (_this select 1)]; ncInvert = (_this select 1);  _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;"]],

	[1906,"nc_markerY",[1,"",[0.340156 * safezoneW + safezoneX,0.841 * safezoneH + safezoneY,0.0979687 * safezoneW,0.011 * safezoneH],[-1,-1,-1,-1],[1,1,1,1],[-1,-1,-1,-1],"VERTICAL OFFSET. Set the correct vertical offset you desire.","RscSlider"],[],
	[[/*range*/-2,2, ncMarkerY], "folder set [12, (_this select 1)]; nc_marker_offset = (_this select 1) + nc_barOffsetY"]],

	[2802,"nc_visibility",[1,"",[0.391719 * safezoneW + safezoneX,0.874 * safezoneH + safezoneY,0.0103125 * safezoneW,0.022 * safezoneH],[-1,-1,-1,-1],[-1,-1,-1,-1],[-1,-1,-1,-1],"VISIBILITY. Toggle it.","RscCheckBox"],[],
	[ncMarkerVisibility, "folder set [11, (_this select 1)]; ncMarkerVisibility = (_this select 1)"]]
	];

with uiNamespace do {
  nc_dialogDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
};
{
  _idc  = _x select 0;
  _type = (_x select 2) select 7;
  _pos  = (_x select 2) select 2;

  _tooltip = (_x select 2)select 6;
  _background_color = (_x select 2) select 4;
  _txt  = (_x select 2) select 1;

  _display = uiNamespace getVariable "nc_dialogDisplay";

  switch (_type) do {
    case ("RscText"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      _ctrl ctrlSetText _txt;
      //hint format ["x: %1, x: %2, x: %3, x: %4", _posx, _posy, _posw, _posh];
      _ctrl ctrlSetTextColor [1, 1, 1, 1];
      _ctrl ctrlSetBackgroundColor _background_color;
    };
    case ("RscStructuredText"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      _ctrl ctrlSetText _txt;
      _ctrl ctrlSetTextColor [1, 1, 1, 1];
      _ctrl ctrlSetBackgroundColor _background_color;
    };
    case ("RscSlider"): {
      _sliderRange_start = ((_x select 4) select 0) select 0;
      _sliderRange_end = ((_x select 4) select 0) select 1;
			_sliderPos = ((_x select 4) select 0) select 2;
      _func = compile ((_x select 4) select 1);

      _ctrl = _display ctrlCreate [_type, _idc];
      _ctrl sliderSetRange [_sliderRange_start, _sliderRange_end];
			_ctrl sliderSetPosition _sliderPos;
      _ctrl ctrlAddEventHandler ["SliderPosChanged",_func];
    };
    case ("RscCombo"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      _func = compile ((_x select 4) select 1);
      for "_i" from 0 to (count ((_x select 4) select 0)-1) do
      {
        _lbItem = ((_x select 4) select 0) select _i;
        _index = _ctrl lbAdd _lbItem;
      };
			_indexy = (_x select 4) select 2;
			_ctrl lbSetCurSel _indexy;
      _ctrl ctrlAddEventHandler ["LBSelChanged",_func];
    };
    case ("RscCheckBox"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      if ((_x select 4) select 0 == 1) then {
        _ctrl cbSetChecked true;
      };
      _func = compile ((_x select 4) select 1);
      _ctrl ctrlAddEventHandler ["CheckedChanged",_func];
			if (ncInvert == 1) then {
			  _ctrl ctrlSetChecked true;
			}else{_ctrl ctrlSetChecked false;};
    };
    case ("RscButton"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      _ctrl ctrlSetText _txt;
      _func = compile ((_x select 4) select 0);
			_ctrl ctrlAddEventHandler ["ButtonClick",_func];
    };
    case ("RscEdit"): {
      _ctrl = _display ctrlCreate [_type, _idc];
      _ctrl ctrlSetTextColor [1, 1, 1, 1];
      _ctrl ctrlSetBackgroundColor [0, 0, 0, 1];
			_ctrl ctrlAddEventHandler ["KeyUp",{ncColorOption =  ctrlText ((uiNamespace getVariable "nc_dialogDisplay") displayCtrl 1005);  _comp = [ncType, ncInvert, ncFontSize, ncShadow, ncFontOption, ncAlpha, ncColorOption] call UGTX_fnc_compileCompass;}];
			_ctrl ctrlSetText ncColorOption;
		};
  };
  _ctrl = _display displayCtrl _idc;
  _ctrl ctrlSetPosition _pos;
  _ctrl ctrlCommit 0;
  _ctrl ctrlSetTooltip _tooltip;
} forEach nc_dialog_controls;
