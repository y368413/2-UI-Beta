local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")

local IsUsableAction = _G.IsUsableAction
local IsActionInRange = _G.IsActionInRange
local ActionHasRange = _G.ActionHasRange

function Bar:RangeOnUpdate()
	if not self.rangeTimer then return end

	if self.rangeTimer == TOOLTIP_UPDATE_TIME then
		Bar.RangeUpdate(self)
	end
end

function Bar:RangeUpdate()
	if MaoRUISettingDB["Actionbar"]["Enable"] then
		local bar = self:GetParent():GetParent()
		if bar and bar:GetAlpha() == 0 then return end
	end

	local icon = self.icon
	local normalTexture = self.NormalTexture
	local ID = self.action
	if not ID then return end

	local IsUsable, NotEnoughMana = IsUsableAction(ID)
	local HasRange = ActionHasRange(ID)
	local InRange = IsActionInRange(ID)

	if IsUsable then -- Usable
		if HasRange and InRange == false then -- Out of range
			icon:SetVertexColor(.9, .1, .1)
			normalTexture:SetVertexColor(.9, .1, .1)
		else -- In range
			icon:SetVertexColor(1, 1, 1)
			normalTexture:SetVertexColor(1, 1, 1)
		end
	elseif NotEnoughMana then -- Not enough power
		icon:SetVertexColor(.3, .3, 1)
		normalTexture:SetVertexColor(.3, .3, 1)
	else -- Not usable
		icon:SetVertexColor(.3, .3, .3)
		normalTexture:SetVertexColor(.3, .3, .3)
	end
end

hooksecurefunc("ActionButton_OnUpdate", Bar.RangeOnUpdate)
hooksecurefunc("ActionButton_Update", Bar.RangeUpdate)
hooksecurefunc("ActionButton_UpdateUsable", Bar.RangeUpdate)


--------------Fivecombo-----------------------------------------------
local enaleAlert = true;
local OverlayedSpellID = {};
local SPEC_MAGE_ARCANE = 1
local SPEC_MONK_WINDWALKER = 3
local SPEC_PALADIN_RETRIBUTION = 3
local SPEC_WARLOCK_DESTRUCTION = 3
local SPELL_POWER_ENERGY = 3
local SPELL_POWER_COMBO_POINTS = 4
local SPELL_POWER_SOUL_SHARDS = 7
local SPELL_POWER_HOLY_POWER = 9
local SPELL_POWER_CHI = 12
local SPELL_POWER_ARCANE_CHARGES = 16
-- 盗贼
OverlayedSpellID["ROGUE"] = {
	2098,  --刺骨
	32645, --毒伤
	8647,  --破甲
	5171,  --切割
	408,   --肾击
	26679, --致命投掷
	1943,  --割裂
	73651, --恢复
	193316,
	199804,
	196819,
	195452,
	206237
};
-- 德鲁伊
OverlayedSpellID["DRUID"] = {
	52610,  --野蛮咆哮
	1079,   --割裂
	22568,  --割碎
	22570,  --凶猛撕咬
};
local function GetMaxPoints()
	local MAX_POINTS
	local _, _, classID = UnitClass("player")
	if classID == 4 then
		if IsPlayerSpell(193531) then
			MAX_POINTS = 6
		elseif IsPlayerSpell(14983) then
			MAX_POINTS = 5
		else
			MAX_POINTS = 5
		end
	elseif classID == 11 then
		if IsPlayerSpell(202157) or IsPlayerSpell(197490) or IsPlayerSpell(202155) or GetSpecialization() == 2 then
			MAX_POINTS = 5
		else
			MAX_POINTS = 0
		end
	else
		MAX_POINTS = 0
	end
	return MAX_POINTS
end
local function IsOverlayedSpell(spellID)
	local _, class = UnitClass("player");
	if (not OverlayedSpellID[class]) then return false end
	for i, id in ipairs(OverlayedSpellID[class]) do
		if (id == spellID) then
			return true;
		end
	end
	return false;
end
local function comboEventFrame_OnUpdate(self, elapsed)
	local countTime = self.countTime - elapsed;
	if (countTime <= 0) then
		local parent = self:GetParent();
		local points = UnitPower("player", SPELL_POWER_COMBO_POINTS)
		if (self.isAlert and points ~= GetMaxPoints()) then
			self:SetScript("OnUpdate", nil);
			ActionButton_HideOverlayGlow(parent);
			self.countTime = 0;
		end
		self.countTime = TOOLTIP_UPDATE_TIME;
	end
end
local function comboEventFrame_OnEvent(self, event, ...)
	local parent = self:GetParent();
	local points = UnitPower("player", SPELL_POWER_COMBO_POINTS)
	local spellType, id, subType  = GetActionInfo(parent.action);
	-- 如果是系统自身的提示，就不再处理
	if ( spellType == "spell" and IsSpellOverlayed(id) ) then
		return;
	elseif (spellType == "macro") then
		local _, _, spellId = GetMacroSpell(id);
		if ( spellId and IsSpellOverlayed(spellId) ) then
			return;
		end		
	end
	if (points >= 5 and enaleAlert) then		
		if ( spellType == "spell" and IsOverlayedSpell(id) ) then
			ActionButton_ShowOverlayGlow(parent);
			self.isAlert = true;
			self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
		elseif ( spellType == "macro" ) then
			local _, _, spellId = GetMacroSpell(id);
			if ( spellId and IsOverlayedSpell(spellId) ) then
				ActionButton_ShowOverlayGlow(parent);
				self.isAlert = true;
				self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
			else
				ActionButton_HideOverlayGlow(parent);
			end
		else
			ActionButton_HideOverlayGlow(parent);
		end
	else
		ActionButton_HideOverlayGlow(parent);
	end	
end
hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
	if (self.comboAlert) then return end
	self.comboAlert = true;
	self.comboEventFrame = CreateFrame("Frame", nil, self);
	self.comboEventFrame.countTime = 0;
	self.comboEventFrame:RegisterEvent("UNIT_POWER_UPDATE");
	self.comboEventFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
	self.comboEventFrame:RegisterEvent('UNIT_POWER_FREQUENT')
	self.comboEventFrame:RegisterEvent('UNIT_MAXPOWER')
	self.comboEventFrame:SetScript("OnEvent", comboEventFrame_OnEvent);
end)