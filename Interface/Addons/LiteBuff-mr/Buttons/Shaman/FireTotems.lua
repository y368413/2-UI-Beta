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
addon:BuildSpellList(spellList, 3599)  --火焰
addon:BuildSpellList(spellList, 8190)  --火元素
addon:BuildSpellList(spellList, 2894)  --火元素

local button = addon:CreateActionButton("ShamanFire", "火焰图腾",nil, 300, "TOTEM")
button:SetFlyProtect()
button:SetScrollable(spellList)
button:RequireSpell(3599)


