------------------------------------------------------------
-- Pets.lua
--
-- Abin
-- 2011/11/13
------------------------------------------------------------

if select(2, UnitClass("player")) ~= "WARLOCK" then return end

local UnitExists = UnitExists
local IsSpellKnown = IsSpellKnown

local _, addon = ...
local L = addon.L

local spellList = {}
addon:BuildSpellList(spellList, 688)--小鬼
addon:BuildSpellList(spellList, 697)--胖子
addon:BuildSpellList(spellList, 712)--魅魔
addon:BuildSpellList(spellList, 691)--狗/眼魔
addon:BuildSpellList(spellList, 157897)--大哥
addon:BuildSpellList(spellList, 157904)--地狱火
addon:BuildSpellList(spellList, 30146)--恶魔卫士/愤怒卫士

local spec = GetActiveSpecGroup()
local id, name, texture, isDemonUnderControl = GetTalentInfo(7, 3, spec);

local button = addon:CreateActionButton("WarlockPets", L["pets"], nil, nil, "DUAL")
button:SetFlyProtect()
button:SetScrollable(spellList, "spell1")
--删除生命通道
--button:SetSpell2(755)
--button:SetAttribute("spell2", button.spell2)
--由于邪恶统御天赋下  狗/眼魔的技能完全不一样，所以需要写第二个List
local petSpells = {119899, 17735, 7870, 19505, 85692, 171014, 30151 }
local petSpells2 = {119899, 17735, 7870, 115284, 85692, 171014, 30151 }
function button:OnUpdateTimer()
	if UnitExists("pet") then
		local spell = petSpells[self.index]
		local spell2 = petSpells2[self.index]
		return spell and (IsSpellKnown(spell, true) or IsSpellKnown(spell2, true))
	end
end

function button:OnSpellUpdate()
	if IsSpellKnown(30146) then
		self:SetMaxIndex()
	else
		self:SetMaxIndex(6)
	end
	self:UpdateTimer()
end