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
addon:BuildSpellList(spellList, 8143)  --颤栗
addon:BuildSpellList(spellList, 2062)  --土元素
addon:BuildSpellList(spellList, 2484)  --地缚
addon:BuildSpellList(spellList, 108270)  --石壁

local button = addon:CreateActionButton("ShamanEarth", "大地图腾",nil, 300, "TOTEM")
button:SetFlyProtect()
button:SetScrollable(spellList)
button:RequireSpell(8143)


