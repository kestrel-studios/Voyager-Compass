/*
  version 1.0
  description: This function  generates the points. It will be called from the control-actions
*/

/// coordinates of compass angles
compass_pos = [
[3400, -225   ,"SE" ],
[3401, -210   ,"140"],
[3402, -195   ,"165"],

[3403, -180    ,"S" ],

[3405, -165   ,"195"],
[3406, -150   ,"210"],
[3407, -135   ,"SW" ],
[3408, -120   ,"240"],
[3409, -105   ,"255"],

[3410, -090    ,"W" ],

[3421, -075   ,"285"],
[3422, -060   ,"300"],
[3423, -045   ,"NW" ],
[3424, -030   ,"330"],
[3425, -015   ,"345"],

[3426, 0       ,"N" ],

[3427, 015   ,"15"  ],
[3428, 030   ,"30"  ],
[3429, 045   ,"NE"  ],
[3430, 060   ,"60"  ],
[3431, 075   ,"75"  ],

[3432, 090   ,"E"   ],

[3433, 105   ,"105" ],
[3434, 120   ,"120" ],
[3435, 135   ,"SE"  ],
[3436, 150   ,"150" ],
[3437, 165   ,"165" ],

[3438, 180   ,"S"   ],

[3439, 195   ,"195" ],
[3440, 210   ,"210" ],
[3441, 225   ,"SW"  ],
[3442, 240   ,"240" ],
[3443, 255   ,"255" ],

[3445, 270   ,"W"   ],

[3446, 285   ,"285" ],
[3447, 300   ,"300" ],
[3448, 315   ,"NW"  ],
[3449, 330   ,"330" ],
[3450, 345   ,"345" ],

[3451, 360   ,"N"   ],

[3452, 375   ,"15"  ],
[3453, 390   ,"30"  ],
[3454, 405   ,"NE"  ],
[3455, 420   ,"60"  ],
[3456, 435   ,"75"  ],

[3457, 450   ,"E"   ],

[3458, 465   ,"105" ],
[3459, 480   ,"120" ],
[3460, 495   ,"SE"  ],
[3461, 510   ,"150" ],
[3462, 525   ,"165" ],

[3463, 540   ,"S"   ],

[3464, 555   ,"195" ],
[3465, 570   ,"210" ],
[3466, 585  ,"SW"   ]
];
compass_pos_a3 = [
[3410, 0       ,"no" ]
];
///

_nc_lb_type = [compass_pos, compass_pos_a3];


disableSerialization;
params ["_compassType", "_ncNeedle","_ncFontSize","_ncShadow","_ncFontOption", "_ncAlpha", "_ncColorOption"];


_display = uiNamespace getVariable "RscTitleDisplayEmpty";

for "_i" from 3399 to 3499 do
{
  ctrlDelete (_display displayCtrl _i);
};
_compass = _nc_lb_type select _compassType;
_compassNeedle = _display ctrlCreate ["RscStructuredText", 3399];
_compassNeedle ctrlSetStructuredText parseText format["<t shadow=2><t shadowColor='#ff0000' align='center' size='%1' color='#f9f9f9'>|</t>", 0.65];

for "_i" from 0 to (count _compass - 1) do
{
  _idc = ((_compass select _i) select 0);
  _dir = ((_compass select _i) select 2);
  _arrayIndex = _i;//_compassType find _x;

  nc_sizeX = 0.65 * _ncFontSize;
  if (_arrayIndex % 6 == 3) then
  {
    nc_sizeX = 1 * _ncFontSize;
  };
  if (_arrayIndex % 6 == 0) then
  {
    nc_sizeX = 0.8 * _ncFontSize;
  };
  _edit = _display ctrlCreate ["RscStructuredText", _idc];

  _var_needle = "";
  switch (_ncNeedle) do {
    case (1): {
      _var_needle = _dir + "<br />|</t>";
    };
    case (0): {
      _var_needle = "|<br />" + _dir + "</t>";
    };
  };
  _edit ctrlSetStructuredText parseText ("<t shadow=" + str _ncShadow + "><t shadowColor='#000000' align='center' size='" + str nc_sizeX + "' font='" + _ncFontOption + "' color='#" + _ncAlpha + _ncColorOption + "'>" + _var_needle);
  _edit ctrlCommit 0;
};
