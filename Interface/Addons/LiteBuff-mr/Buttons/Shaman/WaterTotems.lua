------------------------------------------------------------
-- Stances.lua
--
-- Abin
-- 2012/10/02
------------------------------------------------------------

if select(2, UnitClass("player")) ~= "SHAMAN" then return end

local _, addon = ...
local L = addon.L

local spellList = {}
addon:BuildSpellList(spellList, 5394)  --治疗之泉
addon:BuildSpellList(spellList, 108280)  --奶潮

local button = addon:CreateActionButton("ShamanWater", "水之图腾",nil, 300, "TOTEM")
button:SetFlyProtect()
button:SetScrollable(spellList)
button:RequireSpell(5394)


