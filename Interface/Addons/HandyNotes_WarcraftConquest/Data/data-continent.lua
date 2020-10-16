local myname, ns = ...

local C = ns.CONST;
local arrow = ns.textures.arrow;

if not ns.points then ns.points = {} end;
-- -------------------------------------------------------------------------------------------------------------------

ns.points[C.ZONES.NORTHREND] = { -- Northrend continent

  [50505240] = { label = "WC - Northrend Campaign",       campaign = true, campaigntype = "Pre-Shadowlands", text = "The Coalition answers the call to battle the scourge in a coming storm.",  },
  [26105990] = { label = "WC - Northrend Campaign",       campaign = true, campaigntype = "Pre-Shadowlands", text = "The Coalition answers the call to battle the scourge in a coming storm.",  },
};

-- -------------------------------------------------------------------------------------------------------------------
-- Make Indices
-- -------------------------------------------------------------------------------------------------------------------
if not ns.index then ns.index = {} end;
ns.index[C.ZONES.NORTHREND] = ns.utils.points.index(ns.points[C.ZONES.NORTHREND]);
