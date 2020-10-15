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
addon:BuildSpellList(spellList, 98008)  --灵魂连接
addon:BuildSpellList(spellList, 108269)  --电能
addon:BuildSpellList(spellList, 8177)  --根基
addon:BuildSpellList(spellList, 108273)  --风行

local button = addon:CreateActionButton("ShamanWind", "空气图腾",nil, 300, "TOTEM")
button:SetFlyProtect()
button:SetScrollable(spellList)
button:RequireSpell(98008)


