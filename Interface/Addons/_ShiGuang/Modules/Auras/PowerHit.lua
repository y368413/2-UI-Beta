local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Auras")

--------------------------Class recoure Place ---by y368413 ----
local function yInvertTexture(Texture)
	local Left, Top, _, Bottom, Right = Texture:GetTexCoord()
	Texture:SetTexCoord(Left, Right, Bottom, Top) -- Swapping parameters 3 & 4 (top & bottom)
end
local function yInvertAllTextures(Frame)
	for _, Region in pairs({ Frame:GetRegions() }) do
		if Region:IsObjectType("Texture") then yInvertTexture(Region) end
	end
end

local function ClassRecourePlace()
  if I.MyClass == "DRUID" or I.MyClass == "ROGUE" then
    ComboPointPlayerFrame:SetAlpha(1)
    ComboPointPlayerFrame.Background:Hide()
    ComboPointPlayerFrame:SetScale(1.5)
    M.Mover(ComboPointPlayerFrame, "ComboPointPlayerFrame", "ComboPointPlayerFrame", R.Auras.ComboPointPos, 180, 43)
  elseif I.MyClass == "WARLOCK" then
    --yInvertAllTextures(WarlockPowerFrame)
    WarlockPowerFrame:SetAlpha(1)
    WarlockPowerFrame:SetScale(1.2)
    M.Mover(WarlockPowerFrame, "WarlockPowerFrame", "WarlockPowerFrame", R.Auras.WarlockPowerPos, 120, 36)
  elseif I.MyClass == "PALADIN" then
    PaladinPowerBarFrame:SetAlpha(1)
    PaladinPowerBarFrameBG:Hide()
    PaladinPowerBarFrameGlowBG:Hide()
    PaladinPowerBarFrame:SetScale(1.5)
    M.Mover(PaladinPowerBarFrame, "PaladinPowerBarFrame", "PaladinPowerBarFrame", R.Auras.PaladinPowerPos, 180, 43)
  elseif I.MyClass == "DEATHKNIGHT"  and GetSpecialization() ~= 1 then
    RuneFrame:SetAlpha(1)
    RuneFrame:SetScale(1.5)
    M.Mover(RuneFrame, "RuneFrame", "RuneFrame", R.Auras.RunePos, 160, 36)
  elseif I.MyClass == "MONK" then
    MonkHarmonyBarFrame:SetAlpha(1)
    yInvertAllTextures(MonkHarmonyBarFrame)
    MonkHarmonyBarFrame:SetScale(1.2)
    M.Mover(MonkHarmonyBarFrame, "MonkHarmonyBarFrame", "MonkHarmonyBarFrame", R.Auras.MonkHarmonyPos, 180, 43)
  elseif I.MyClass == "MAGE" then
    MageArcaneChargesFrame:SetAlpha(1)
    MageArcaneChargesFrame.Background:Hide()
    MageArcaneChargesFrame:SetScale(1.5)
    M.Mover(MageArcaneChargesFrame, "MageArcaneChargesFrame", "MageArcaneChargesFrame", R.Auras.MageArcaneChargesPos, 170, 43)
  end
end
function module:ClassRecoure()
	if not MaoRUISettingDB["Auras"]["ClassRecourePlace"] then return end
	ClassRecourePlace()
end


-------------------------------------------------------------------------------------------------- RiphieEnergy
local function RiphieEnergy()
  local EnergyBar = CreateFrame("StatusBar", "EnergyBar", M.UIParent)
  EnergyBar:SetHeight(6)
  EnergyBar:SetWidth(200)
  M.CreateSBC(EnergyBar, true)
  EnergyBar:SetStatusBarColor(246/255, 222/255, 32/255, 1)    --黄红渐变
    --mana       = {   0/255, 190/255, 230/255, 1 },  --天蓝色
    --rage       = {  65/255,  65/255,  65/255, 1 },  --暗紫色
    --focus      = { 230/255, 140/255,  60/255, 1 },  --深红色
    --maelstrom  = {   0/255, 127/255, 255/255, 1 },  --深蓝色
  EnergyBar.Count = M.CreateFS(EnergyBar, 14, "")
  EnergyBar.Count:ClearAllPoints()
  EnergyBar.Count:SetPoint("CENTER", EnergyBar, "CENTER", 0, 3)
  M.Mover(EnergyBar, "EnergyBar", "EnergyBar", R.Auras.EnergyPos, 200, 12)
end

local function updateEnergy()
  cur, maxPower = UnitPower("player"), UnitPowerMax("player")
  EnergyBar:SetMinMaxValues(0, maxPower)
  EnergyBar:SetValue(cur)
  M.SmoothBar(EnergyBar)
  if (cur == maxPower) or (cur == 0) then EnergyBar.Count:SetText("") else EnergyBar.Count:SetText(M.Numb(cur)) end
  if C_PetBattles.IsInBattle() then EnergyBar:Hide() return else EnergyBar:Show() end
end

function module:Energy()
	if not MaoRUISettingDB["Auras"]["EnergyBar"] then return end
	RiphieEnergy()
	M:RegisterEvent("UNIT_AURA", updateEnergy)
	M:RegisterEvent("UNIT_POWER_UPDATE", updateEnergy)
	M:RegisterEvent("UNIT_POWER_FREQUENT", updateEnergy)
	M:RegisterEvent("SPELL_UPDATE_COOLDOWN", updateEnergy)
	M:RegisterEvent("PET_BATTLE_CLOSE", updateEnergy)
	M:RegisterEvent("PET_BATTLE_OPENING_START", updateEnergy)
	M:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED", updateEnergy)
end

----------------------------------------------------------------------  Mod Name : BlinkComboHelper 1.03 --  Author   : Blink
local BlinkComboHelper = {}
local animations = {}
local BASE_FONT_SIZE = 66
local fadeSide = -1 -- 사라지는 방향

local function updateFunc(frame, alpha, size, x, y)
	frame:SetAlpha(alpha);
	frame.combo:SetTextHeight(size);
	frame:SetPoint("CENTER", "UIParent", "CENTER", x, y );
end

function animations:pop()
	SetUpAnimation(BlinkComboHelperFrame, {
		totalTime = 1.0,
		updateFunc = updateFunc,
		getPosFunc = function (self, fraction)
			if fraction < 0.15 then
				local f = fraction / 0.15
				return f, BASE_FONT_SIZE * f + 1, 0, BASE_FONT_SIZE*f
			elseif fraction < 0.5 then
				return 1.0, BASE_FONT_SIZE + 1, 0, BASE_FONT_SIZE
			else
				local f = (fraction-0.5) / 0.5
				local alpha = 1.0-f;
				if alpha<0 then
					alpha = 0
				end
				return alpha, BASE_FONT_SIZE * alpha + 1, f*fadeSide*20, BASE_FONT_SIZE
			end
		end,
	},function(self)
		fadeSide = fadeSide * -1
	end)
end

function BlinkComboHelper:updateCombo()
	local combo = 0
	if select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID" then
		combo = GetComboPoints("player", "target")
	elseif select(2, UnitClass("player")) == "PALADIN" then
		combo = UnitPower( "player", Enum.PowerType.HolyPower );
	elseif select(2, UnitClass("player")) == "MAGE" then
		combo = UnitPower("player", Enum.PowerType.ArcaneCharges, true)
	elseif select(2, UnitClass("player")) == "MONK" and GetSpecialization()==3 then
		combo = UnitPower( "player", Enum.PowerType.Chi )
	elseif select(2, UnitClass("player")) == "WARLOCK" then
		combo = UnitPower( "player", Enum.PowerType.SoulShards )
	elseif select(2, UnitClass("player")) == "DEATHKNIGHT" and GetSpecialization()==1 then
		local name, _ = GetSpellInfo(195181) -- Bone Shield
		combo, _ = select(3, AuraUtil.FindAuraByName(name, 'player', 'HELPFUL|PLAYER')) or 0
	else
		self.lastCombo = combo
		return
	end
	if combo > 0 and combo~=self.lastCombo then
		BlinkComboHelperFrame.combo:SetText(combo)
		animations:pop()
	end
	self.lastCombo = combo
end

BlinkComboHelperFrame = CreateFrame("Frame")
BlinkComboHelperFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
BlinkComboHelperFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
BlinkComboHelperFrame:RegisterEvent("PLAYER_LOGIN")
BlinkComboHelperFrame:SetScript("OnEvent", function(self, event, ...)
  if not MaoRUISettingDB["Auras"]["BlinkComboHelper"] then return end
	if ( event == "PLAYER_LOGIN" ) then		--self:UnregisterEvent("PLAYER_LOGIN");
		self:Hide();
		self.delayedUpdate = 0
		BlinkComboHelperFrame:ClearAllPoints()
	    BlinkComboHelperFrame:SetPoint("CENTER", 0, 60)
	    BlinkComboHelperFrame:SetFrameStrata("BACKGROUND")
	    BlinkComboHelperFrame:SetFrameLevel(0)
	    BlinkComboHelperFrame.combo = BlinkComboHelperFrame:CreateFontString(nil, "OVERLAY")
	    BlinkComboHelperFrame.combo:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Eggo.ttf", BASE_FONT_SIZE, "THICKOUTLINE")
	    BlinkComboHelperFrame.combo:SetPoint("CENTER", BlinkComboHelperFrame)
	    BlinkComboHelperFrame.combo:SetAlpha(1.0)
	    BlinkComboHelperFrame.combo:SetJustifyH("CENTER")
	    BlinkComboHelperFrame.combo:SetTextColor(0.1, 1.0, 0.1);
	    BlinkComboHelperFrame:SetHeight(BlinkComboHelperFrame.combo:GetHeight())
	    BlinkComboHelperFrame:SetWidth(50)
	elseif event == "PLAYER_REGEN_DISABLED" then
		self.inCombat = true
		self:Show();
		self:SetScript("OnUpdate", function(self, elapsed)
	    self.delayedUpdate = self.delayedUpdate + elapsed
	      if self.delayedUpdate > 0.1 then
		     self.delayedUpdate = 0
		     BlinkComboHelper:updateCombo();
	      end
        end)
	elseif event == "PLAYER_REGEN_ENABLED" then
		self.inCombat = false
		self:Hide();
		self:SetScript("OnUpdate", nil)
	end
end)