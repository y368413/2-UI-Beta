----------------------------------## SavedVariables: diminfo
-- dimInfo by Loshine, NDui MOD   ---MaoR UI DIY
----------------------------------
local addon, ns = ...
local cfg = CreateFrame("Frame")

-- enable modules

--左上

cfg.Spec = true
cfg.SpecPoint = {"topleft", UIParent,"topleft",0, 0}

cfg.Time = true
cfg.TimePoint = {"topleft", UIParent, "topleft", 22, 2}

cfg.Guild = true
cfg.GuildPoint = {"topleft", UIParent, "topleft", 95, -3}

cfg.Friends = true
cfg.FriendsPoint = {"topleft", UIParent, "topleft", 135, -3}

cfg.Durability = true
cfg.DurabilityPoint = {"topleft", UIParent, "topleft", 185, -3}

cfg.System = true
cfg.SystemPoint = {"topleft", UIParent, "topleft", 225, -3}

cfg.Memory = true
cfg.MemoryPoint = {"topleft", UIParent, "topleft", 320, -3}
cfg.MaxAddOns = 21

cfg.Bags = true
cfg.BagsPoint = {"topleft", UIParent, "topleft", 375, -3}

--右上(小地图)
cfg.Coords = false
cfg.CoordsPoint = {"topright", Minimap,"topright", -12, -2}

cfg.Mail = false
cfg.MailPoint = {"topleft", Minimap, "bottomleft", 0, -5}

cfg.Gold = true
cfg.GoldPoint = {"bottomleft", Minimap, "bottomleft", 2, 2}

cfg.Positions = true
--cfg.PositionsPoint = {"topright", Minimap,"topleft",-18, -1}
cfg.PositionsPoint = {"top", UIParent,"top", 0, -3}
--cfg.Spec = true
--cfg.SpecPoint = {"bottomright", Minimap,"bottomright",-16, 3}

--Fonts and Colors
cfg.Fonts = {STANDARD_TEXT_FONT, 12, "outline"}  --"Fonts\\ARKai_T.ttf"
cfg.TimeFonts = {"Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 24, "outline"}
cfg.TTFonts = {STANDARD_TEXT_FONT, 16, "outline"}
--cfg.PosFonts = {STANDARD_TEXT_FONT, 14, "outline"}
cfg.ColorClass = true

ns.cfg = cfg


-- init
local init = CreateFrame("Frame")

local classc = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))] 
init.Colored = ("|cff%.2x%.2x%.2x"):format(classc.r * 255, classc.g * 255, classc.b * 255)

init.gradient = function(perc)
	perc = perc > 1 and 1 or perc < 0 and 0 or perc -- Stay between 0-1
	local seg, relperc = math.modf(perc*2)
	local r1,g1,b1,r2,g2,b2 = select(seg*3+1,1,0,0,1,1,0,0,1,0,0,0,0) -- R -> Y -> G
	local r,g,b = r1+(r2-r1)*relperc,g1+(g2-g1)*relperc,b1+(b2-b1)*relperc
	return format("|cff%02x%02x%02x",r*255,g*255,b*255),r,g,b
end

if (diminfo == nil) then diminfo = {}; end

ns.init = init