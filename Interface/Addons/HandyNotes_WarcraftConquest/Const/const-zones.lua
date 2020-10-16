local myname, ns = ...

local C         = ns.CONST;

if not ns.CONST       then ns.CONST       = {}; end;

-- See https://wow.gamepedia.com/UiMapID to get map zones and ids

C.ZONES          =
  { NORTHREND    = 113,
    DALARAN      = 125,
    DRAGONBLIGHT = 115,
    BOREANTUNDRA = 114,
    ICECROWN     = 118,
    GRIZZLYHILLS = 116,
    HOWLINGFJORD = 117, 
    SHOLAZARBASIN= 119,
    THESTORMPEAKS= 120,
    ZULDRAK      = 121,
    EASTERNKINGDOMS = 13,
    KALIMDOR = 12,
    PANDARIA = 989,
  };

C.ZONENAMES     = 
  { [113]      = "Northrend",
    [125]      = "Dalaran City",
    [115]      = "Dragonblight",
    [114]      = "Borean Tundra",
    [118]      = "Icecrown",
    [116]      = "Grizzly Hills",
    [117]      = "Howling Fjord",
    [119]      = "Sholazar Basin",
    [120]      = "The Storm Peaks",
    [121]      = "Zul'Drak",
    [13]       = "Eastern Kingdoms",
    [12]       = "Kalimdor",
    [989]      = "Pandaria",
  };

C.ZONE          = C.ZONES.DALARAN;

