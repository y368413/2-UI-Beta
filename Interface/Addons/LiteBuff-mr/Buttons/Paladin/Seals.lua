------------------------------------------------------------
-- Seals.lua
--
-- Abin
-- 2011/11/13
------------------------------------------------------------

if select(2, UnitClass("player")) ~= "PALADIN" then return end

local UnitGUID = UnitGUID

local _, addon = ...
local L = addon.L

local spellList = {}
addon:BuildSpellList(spellList, 20154)
addon:BuildSpellList(spellList, 20164)
addon:BuildSpellList(spellList, 20165)
addon:BuildSpellList(spellList, 31801)

local button = addon:CreateActionButton("PaladinSeals", L["seals"], nil, nil, "DUAL", "STANCE")
button:SetAttribute("type", "spell")
button:SetScrollable(spellList)

function button:OnSpellUpdate(combat)
	if combat then
		return
	end

	if GetSpecialization() == 2 then
		button:SetSpell2(25780)
	else
		button:SetSpell2(nil)
	end

	button:SetAttribute("spell2", button.spell2)
end

function button:OnUpdateTimer(spell1, spell2)
	local has1 = addon:IsFormActive(spell1)
	if not spell2 then
		return has1
	end

	local has2 = addon:GetUnitBuffTimer("player", spell2, 1)
	if has1 and has2 then
		return 1
	elseif has1 or has2 then
		return -1
	end
end