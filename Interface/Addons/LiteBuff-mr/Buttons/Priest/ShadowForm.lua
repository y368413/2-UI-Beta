------------------------------------------------------------
-- ShadowForm.lua
--
-- Abin
-- 2011/11/13
------------------------------------------------------------

if select(2, UnitClass("player")) ~= "PRIEST" then return end

local IsSpellKnown = IsSpellKnown

local _, addon = ...
local L = addon.L

local spellList = {}
addon:BuildSpellList(spellList, 15473)

local button = addon:CreateActionButton("PriestShadowForm", 15473, nil, nil, "PLAYER_AURA")
button:SetSpell(15473)
button:SetAttribute("spell", button.spell)
button:SetFlyProtect()
button:RequireSpell(15473)
