local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Auras")

local IconSize = R.Auras.IconSize + 2
local bu, bar, boom = {}

local function CreateElements()
	if bar then bar:Show() return end

	bar = CreateFrame("StatusBar", nil, UIParent)
	bar:SetSize(IconSize*5+20, 6)
	M.CreateSB(bar, true)
	M.SmoothBar(bar)
	bar:SetAlpha(.5)
	bar.Count = M.CreateFS(bar, 18, "", false, "CENTER", 0, -5)

	local spells = {259491, 131894, 259495, 259387, 266779}

	for i = 1, 5 do
		bu[i] = CreateFrame("Frame", nil, UIParent)
		bu[i]:SetSize(IconSize, IconSize)
		M.CreateIF(bu[i], false, true)
		bu[i]:SetAlpha(.5)
		bu[i].Icon:SetTexture(GetSpellTexture(spells[i]))
		bu[i].Count = M.CreateFS(bu[i], 16, "")
		bu[i].Count:SetPoint("TOP", 0, 15)
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", bar, "TOPLEFT", 0, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 5, 0)
		end
	end

	boom = CreateFrame("Frame", nil, UIParent)
	boom:SetSize(IconSize, IconSize)
	boom:SetPoint("BOTTOM", bu[3], "TOP", 0, 5)
	M.CreateIF(boom, false, true)
	boom:Hide()

	M.Mover(bar, "HunterTool", "HunterTool", R.Auras.HunterToolPos, bar:GetWidth(), 30)
end

local function UpdatePowerBar()
	local cur, max = UnitPower("player"), UnitPowerMax("player")
	bar:SetMinMaxValues(0, max)
	bar:SetValue(cur)
	bar.Count:SetText(cur)
	bar:SetAlpha(1)
	if cur > 80 then
		bar.Count:SetTextColor(1, 0, 0)
	elseif cur > 30 then
		bar.Count:SetTextColor(0, 1, 0)
	else
		bar.Count:SetTextColor(1, 1, 1)
	end
end

local function GetUnitAura(unit, spell, filter)
	for index = 1, 32 do
		local name, _, count, _, dur, exp, caster, _, _, spellID = UnitAura(unit, index, filter)
		if name and spellID == spell then
			return name, count, dur, exp, caster, spellID
		end
	end
end

local function UpdateCooldown(button, spellID, updateTexture)
	local charges, maxCharges, chargeStart, chargeDuration = GetSpellCharges(spellID)
	local start, duration = GetSpellCooldown(spellID)
	if charges and maxCharges > 1 then button.Count:SetText(charges) end
	if charges and charges > 0 and charges < maxCharges then
		button.CD:SetCooldown(chargeStart, chargeDuration)
		button.CD:Show()
		button:SetAlpha(1)
		button.Count:SetTextColor(0, 1, 0)
	elseif start and duration > 1.5 then
		button.CD:SetCooldown(start, duration)
		button.CD:Show()
		button:SetAlpha(.5)
		button.Count:SetTextColor(1, 1, 1)
	else
		button.CD:Hide()
		button:SetAlpha(1)
		if charges == maxCharges then button.Count:SetTextColor(1, 0, 0) end
	end
	if updateTexture then
		button.Icon:SetTexture(GetSpellTexture(spellID))
	end
end

local function UpdateBuff(button, spellID, auraID, cooldown, isPet)
	button.Icon:SetTexture(GetSpellTexture(spellID))
	local name, count, duration, expire = GetUnitAura(isPet and "pet" or "player", auraID, "HELPFUL")
	if name then
		if count == 0 then count = "" end
		button.Count:SetText(count)
		button.CD:SetCooldown(expire-duration, duration)
		button.CD:Show()
		button:SetAlpha(1)
	else
		if cooldown then
			UpdateCooldown(button, spellID)
		else
			button.Count:SetText("")
			button.CD:Hide()
			button:SetAlpha(.5)
		end
	end
end

local function UpdateDebuff(button, spellID, auraID, cooldown)
	button.Icon:SetTexture(GetSpellTexture(spellID))
	local name, _, duration, expire, caster = GetUnitAura("target", auraID, "HARMFUL")
	if name and caster == "player" then
		button:SetAlpha(1)
		button.CD:SetCooldown(expire-duration, duration)
		button.CD:Show()
	else
		if cooldown then
			UpdateCooldown(button, spellID)
		else
			button:SetAlpha(.5)
			button.CD:Hide()
		end
	end
end

local boomGroups = {
	[270339] = 186270,
	[270332] = 259489,
	[271049] = 259491,
}
local function UpdateIcons()
	if GetSpecialization() == 1 then
		UpdateCooldown(bu[1], 34026, true)
		UpdateCooldown(bu[2], 217200, true)
		UpdateBuff(bu[3], 106785, 272790, false, true)
		UpdateBuff(bu[4], 19574, 19574, true)
		UpdateBuff(bu[5], 193530, 193530, true)

	elseif GetSpecialization() == 2 then
		UpdateCooldown(bu[1], 19434, true)

		do
			local button = bu[2]
			if IsPlayerSpell(271788) then
				UpdateDebuff(button, 271788, 271788)
			elseif IsPlayerSpell(131894) then
				UpdateDebuff(button, 131894, 131894, true)
			else
				UpdateBuff(button, 260309, 269576)
			end
		end

		do
			local button = bu[3]
			if IsPlayerSpell(193533) then
				UpdateBuff(button, 193534, 193534)
			elseif IsPlayerSpell(257284) then
				UpdateDebuff(button, 257284, 257284)
			else
				UpdateCooldown(button, 257044, true)
			end
		end

		do
			local button = bu[4]
			if IsPlayerSpell(260402) then
				UpdateCooldown(button, 260402, true)
			elseif IsPlayerSpell(120360) then
				UpdateCooldown(button, 120360, true)
			else
				UpdateBuff(button, 260395, 260395)
			end
		end

		UpdateBuff(bu[5], 193526, 193526, true)

	elseif GetSpecialization() == 3 then
		UpdateDebuff(bu[1], 259491, 259491)

		do
			local button = bu[2]
			if IsPlayerSpell(260248) then
				UpdateBuff(button, 260248, 260249)
			elseif IsPlayerSpell(162488) then
				UpdateDebuff(button, 162488, 162487, true)
			else
				UpdateDebuff(button, 131894, 131894, true)
			end
		end

		do
			local button = bu[4]
			if IsPlayerSpell(260285) then
				UpdateBuff(button, 260285, 260286)
			elseif IsPlayerSpell(269751) then
				UpdateCooldown(button, 269751, true)
			else
				UpdateBuff(button, 259387, 259388)
			end
		end

		do
			local button = bu[3]
			if IsPlayerSpell(271014) then
				boom:Show()

				local name, _, duration, expire, caster, spellID = GetUnitAura("target", 270339, "HARMFUL")
				if not name then name, _, duration, expire, caster, spellID = GetUnitAura("target", 270332, "HARMFUL") end
				if not name then name, _, duration, expire, caster, spellID = GetUnitAura("target", 271049, "HARMFUL") end
				if name and caster == "player" then
					boom.Icon:SetTexture(GetSpellTexture(boomGroups[spellID]))
					boom.CD:SetCooldown(expire-duration, duration)
					boom.CD:Show()
					boom:SetAlpha(1)
				else
					local texture = GetSpellTexture(259495)
					if texture == GetSpellTexture(270323) then
						boom.Icon:SetTexture(GetSpellTexture(259489))
						boom:SetAlpha(.5)
					elseif texture == GetSpellTexture(270335) then
						boom.Icon:SetTexture(GetSpellTexture(186270))
						boom:SetAlpha(.5)
					elseif texture == GetSpellTexture(271045) then
						boom.Icon:SetTexture(GetSpellTexture(259491))
						boom:SetAlpha(.5)
					end
					boom:SetAlpha(.5)
				end

				UpdateCooldown(button, 259495, true)
			else
				boom:Hide()
				UpdateDebuff(button, 259495, 269747, true)
			end
		end

		UpdateBuff(bu[5], 266779, 266779, true)
	end
end

local function UpdateVisibility()
	if InCombatLockdown() then return end
	if not bar then return end
	bar:SetAlpha(.1)
	bar.Count:SetText("")
	for i = 1, 5 do
		bu[i]:SetAlpha(.1)
		bu[i].Count:SetTextColor(1, 1, 1)
		bu[i].Count:SetText("")
	end
	if boom:IsShown() then boom:SetAlpha(.1) end
end

local function TurnOn()
	M:RegisterEvent("UNIT_POWER_FREQUENT", UpdatePowerBar, "player")
	M:RegisterEvent("UNIT_AURA", UpdateIcons, "player", "target")
	M:RegisterEvent("PLAYER_TARGET_CHANGED", UpdateIcons)
	M:RegisterEvent("SPELL_UPDATE_COOLDOWN", UpdateIcons)
	M:RegisterEvent("SPELL_UPDATE_CHARGES", UpdateIcons)
end

local function TurnOff()
	M:UnregisterEvent("UNIT_POWER_FREQUENT", UpdatePowerBar)
	M:UnregisterEvent("UNIT_AURA", UpdateIcons)
	M:UnregisterEvent("PLAYER_TARGET_CHANGED", UpdateIcons)
	M:UnregisterEvent("SPELL_UPDATE_COOLDOWN", UpdateIcons)
	M:UnregisterEvent("SPELL_UPDATE_CHARGES", UpdateIcons)

	UpdateVisibility()
end

local function CheckSpec(event)
	if UnitLevel("player") < 100 then return end

	if GetSpecialization() then
		CreateElements()
		for i = 1, 5 do bu[i]:Show() end
		if boom then boom:Hide() end

		UpdateIcons()
		UpdateVisibility()
		M:RegisterEvent("PLAYER_REGEN_DISABLED", TurnOn)
		M:RegisterEvent("PLAYER_REGEN_ENABLED", TurnOff)
	else
		for i = 1, 5 do
			if bu[i] then bu[i]:Hide() end
		end
		if boom then boom:Hide() end
		if bar then bar:Hide() end

		M:UnregisterEvent("PLAYER_REGEN_DISABLED", TurnOn)
		M:UnregisterEvent("PLAYER_REGEN_ENABLED", TurnOff)
	end

	if event == "PLAYER_ENTERING_WORLD" then
		M:UnregisterEvent(event, checkSpec)
	end
end

function module:HunterTool()
	if not MaoRUISettingDB["Auras"]["HunterTool"] then return end

	M:RegisterEvent("PLAYER_ENTERING_WORLD", CheckSpec)
	M:RegisterEvent("PLAYER_TALENT_UPDATE", CheckSpec)
end

--PetHealthWarning------------------
local PetHealthAlert= {}
local Frame=CreateFrame("ScrollingMessageFrame","!PHA",UIParent)	
Frame.Threshold=35
Frame.Warned=false
-- Initialize
function PetHealthAlert:Initialize()	
	Frame:SetWidth(450)
	Frame:SetHeight(200)
	Frame:SetPoint("CENTER",UIParent,"CENTER",0,360)	
	Frame:SetFont("Interface\\addons\\Ace3\\ShiGuang\\Media\\Fonts\\RedCircl.TTF",36,"THICKOUTLINE")
	Frame:SetShadowColor(0.00,0.00,0.00,0.75)
	Frame:SetShadowOffset(3.00,-3.00)
	Frame:SetJustifyH("CENTER")		
	Frame:SetMaxLines(2)
	--Frame:SetInsertMode("BOTTOM")
	Frame:SetTimeVisible(2)
	Frame:SetFadeDuration(1)		
	--HealthWatch:Update()
end
-- Update health warning
function PetHealthAlert:Update()	
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)<=Frame.Threshold and Frame.Warned==false)then
		PlaySoundFile("Interface\\AddOns\\Ace3\\ShiGuang\\Media\\Sounds\\Beep.ogg")	
		Frame:AddMessage("- CRITICAL PET HEALTH -", 1, 0, 0, nil, 3)
		Frame.Warned=true
		return
	end
	if(floor((UnitHealth("pet")/UnitHealthMax("pet"))*100)>Frame.Threshold)then
		Frame.Warned=false
		return
	end	
end
-- Handle events
function PetHealthAlert:OnEvent(Event,Arg1,...)
	if(Event=="PLAYER_LOGIN")then
		PetHealthAlert:Initialize()
		return
	end	
	if(Event=="UNIT_HEALTH" and Arg1=="pet")then
		PetHealthAlert:Update()
		return
	end	
end
Frame:SetScript("OnEvent",PetHealthAlert.OnEvent)
Frame:RegisterEvent("PLAYER_LOGIN")
Frame:RegisterEvent("UNIT_HEALTH")


--StableHand--------------------## Author: Gwiezdoblask; built on StableHelper by: cybermind, JoKosan## Version: v1.05
if (select(2,UnitClass("player")) == "HUNTER") then
local BEAST_STRING = U["Beast"]
local MECH_STRING = U["Mechanical"]
-- maps pet family icons to english pet family names (eliminates need for translations)
local petIconMap = {
  [877476] = "Basilisk",
  [132182] = "Bat",
  [132183] = "Bear",
  [133570] = "Beetle",
  [132192] = "Bird of Prey",
  [132184] = "Boar",
  [132200] = "Carrion Bird",
  [132185] = "Cat",
  [236190] = "Chimaera",
  [1044794] = "Clefthoof",
  [236191] = "Core Hound",
  [132186] = "Crab",
  [877479] = "Crane",
  [132187] = "Crocolisk",
  [236192] = "Devilsaur",
  [877480] = "Direhorn",
  [877481] = "Dog",
  [132188] = "Dragonhawk",
  [929300] = "Feathermane",
  [458223] = "Fox",
  [877477] = "Goat",
  [132189] = "Gorilla",
  [463493] = "Hydra",
  [132190] = "Hyena",
  [2011146] = "Krolusk",
  [2027936] = "Lizard",
  [132247] = "Mechanical",
  [877482] = "Monkey",
  [236193] = "Moth",
  [132191] = "Nether Ray",
  [616693] = "Oxen",
  [1624590] = "Pterrordax",
  [625905] = "Quilen",
  [132193] = "Raptor",
  [132194] = "Ravager",
  [1044490] = "Riverbeast",
  [644001] = "Rodent",
  [646378] = "Scalehide",
  [132195] = "Scorpid",
  [136040] = "Serpent",
  [877478] = "Shale Spider",
  [236195] = "Silithid",
  [132196] = "Spider",
  [236165] = "Spirit Beast",
  [132197] = "Sporebat",
  [1044501] = "Stag",
  [132198] = "Tallstrider",
  [804969] = "Toad",
  [132199] = "Turtle",
  [132201] = "Warp Stalker",
  [236196] = "Wasp",
  [643423] = "Water Strider",
  [132202] = "Wind Serpent",
  [132203] = "Wolf",
  [236197] = "Worm",
}
-- which classes are exotic-only
local exotics = {
  ["Shale Spider"] = true,
  ["Silithid"] = true,
  ["Water Strider"] = true,
  ["Quilen"] = true,
  ["Core Hound"] = true,
  ["Devilsaur"] = true,
  ["Spirit Beast"] = true,
  ["Chimaera"] = true,
  ["Worm"] = true,
  ["Clefthoof"] = true,
  ["Krolusk"] = true,
  ["Pterrordax"] = true
}

-- specs, colorcoded. --gwiezdoblask
local Fer = "|cFFCC0000" .. U["Ferocity"] .. "|r"
local Cun = "|cFF44AA08" .. U["Cunning"] .. "|r"
local Ten = "|cFF1070FF" .. U["Tenacity"] .. "|r"

-- what buffs/abilities each family has
local buffs = {
  ["Basilisk"] =        { Cun, U["Snare"] },
  ["Bat"] =             { Fer, U["Tranq/Dispel"] },
  ["Bear"] =            { Ten, U["Shield Wall"] .. U[" (auto)"] },
  ["Beetle"] =          { Ten, U["Shield Wall"] .. U[" (toggle)"] },
  ["Bird of Prey"] =    { Cun, U["Snare"] },
  ["Boar"] =            { Cun, U["Shield Wall"] .. U[" (toggle)"] },
  ["Carrion Bird"] =    { Fer, U["Mortal Wounds"] },
  ["Cat"] =             { Fer, U["Dodge"] .. ", " .. U["Prowl"] },
  ["Chimaera"] =        { Fer, U["Snare"] .. U[" (ranged)"] .. ", " .. "AOE"},
  ["Clefthoof"] =       { Fer, U["Shield Wall"] .. U[" (auto)"] .. ", " .. U["Tanky"] },
  ["Core Hound"] =      { Fer, U["Shield Wall"] .. U[" (toggle)"] ..", " .. U["Thorns"] },
  ["Crab"] =            { Ten, U["Snare"] },
  ["Crane"] =           { Ten, U["Tranq/Dispel"] },
  ["Crocolisk"] =       { Fer, U["Snare"] },
  ["Devilsaur"] =       { Fer, U["Mortal Wounds"] .. ", " .. U["Cannibalize"] },
  ["Direhorn"] =        { Ten, U["Mortal Wounds"] },
  ["Dog"] =             { Cun, U["Snare"] },
  ["Dragonhawk"] =      { Ten, U["Dodge"] },
  ["Feathermane"] =     { Ten, U["Dodge"] .. ", " .. U["Slowfall"] },
  ["Fox"] =             { Cun, U["Dodge"] },
  ["Goat"] =            { Cun, U["Shield Wall"] .. U[" (auto)"] },
  ["Gorilla"] =         { Fer, U["Shield Wall"] .. U[" (auto)"] },
  ["Hydra"] =           { Ten, U["Mortal Wounds"] },
  ["Hyena"] =           { Cun, U["Mortal Wounds"] },
  ["Krolusk"] =         { Ten, U["Shield Wall"] .. U[" (toggle)"] .. " ," .. U["Physical Resistance"] },
  ["Lizard"] =          { Ten, U["Mortal Wounds"] },
  ["Mechanical"] =      { Cun, U["Shield Wall"] .. U[" (toggle)"] },
  ["Monkey"] =          { Cun, U["Dodge"] },
  ["Moth"] =            { Cun, U["Tranq/Dispel"] },
  ["Nether Ray"] =      { Fer, U["Tranq/Dispel"] },
  ["Oxen"] =            { Ten, U["Shield Wall"] .. U[" (auto)"] },
  ["Pterrordax"] =      { Cun, U["Shield Wall"] .. U[" (auto)"] .. ", " .. U["Slowfall"] },
  ["Quilen"] =          { Ten, U["Shield Wall"] .. U[" with Self-Heal"] .. U[" (auto)"] .. ", " .. U["Reincarnation"] },
  ["Raptor"] =          { Cun, U["Mortal Wounds"] },
  ["Ravager"] =         { Fer, U["Mortal Wounds"] },
  ["Riverbeast"] =      { Ten, U["Mortal Wounds"] },
  ["Rodent"] =          { Cun, U["Mortal Wounds"] },
  ["Scalehide"] =       { Fer, U["Shield Wall"] .. U[" (toggle)"] },
  ["Scorpid"] =         { Fer, U["Mortal Wounds"] },
  ["Serpent"] =         { Cun, U["Dodge"] },
  ["Shale Spider"] =    { Cun, U["Shield Wall"] .. U[" (toggle)"] .. ", " .. U["Magic Resistance"] },
  ["Silithid"] =        { Cun, U["Snare"] .. ", " .. U["Fast"] },
  ["Spider"] =          { Fer, U["Snare"] },
  ["Spirit Beast"] =    { Ten, U["Tranq/Dispel"] .. ", " .. U["Prowl"].. ", " .. U["Heal"]},
  ["Sporebat"] =        { Cun, U["Tranq/Dispel"] },
  ["Stag"] =            { Ten, U["Tranq/Dispel"] },
  ["Tallstrider"] =     { Fer, U["Snare"] },
  ["Toad"] =            { Ten, U["Dodge"] },
  ["Turtle"] =          { Ten, U["Shield Wall"] .. U[" (toggle)"] },
  ["Warp Stalker"] =    { Cun, U["Snare"] },
  ["Wasp"] =            { Fer, U["Mortal Wounds"] },
  ["Water Strider"] =   { Cun, U["Tranq/Dispel"] .. ", " .. U["Water Walking"]},
  ["Wind Serpent"] =    { Fer, U["Dodge"] },
  ["Wolf"] =            { Fer, U["Snare"] },
  ["Worm"] =            { Ten, U["Snare"] .. U[" (ranged)"] .. ", " .. "AOE"},
}

-- maps call pet spellid to petslot index
local callPetSpells = {
  [883] = 1,
  [83242] = 2,
  [83243] = 3,
  [83244] = 4,
  [83245] = 5,
}

-- returns new tooltip information for a given pet stable slot
local function GetNewTooltip(petSlot)
  local icon, name, level, family = GetStablePetInfo(petSlot)
  if not family or family == "" then return "" end
  
  local englishfamily = petIconMap[icon]
  if not englishfamily then englishfamily = "Unknown" end
  
  -- handle missing families
  if not buffs[englishfamily] then buffs[englishfamily] = {} end
  
  local newfamily = family
  -- add " (Exotic)" to pet family display
  if exotics[englishfamily] then
    newfamily = newfamily.." |cFFFFFF20"..U["(Exotic)"].."|cFFFFFFFF"
  end

  -- add buffs/abilities
  tooltipstr = format(STABLE_PET_INFO_TOOLTIP_TEXT, level, newfamily, GetSpecString(englishfamily)).."  |cFFFFFFFF".. GetAbilityString(englishfamily)

  return tooltipstr
end

--add info to stabled pet tooltips
hooksecurefunc("PetStable_UpdateSlot", function (button, petSlot)
  -- is there actually a pet in this slot?
  local _, _, _, family = GetStablePetInfo(petSlot)
  if not family or family == "" then return end
  
  -- set button tooltip
  button.tooltipSubtext = GetNewTooltip(petSlot)
  
  if GameTooltip:IsOwned(button) then button:GetScript("OnEnter")(button) end
end)

-- add info to Call Pet # tooltips
GameTooltip:HookScript("OnTooltipSetSpell", function (tooltip)
  local spellName, spellID = tooltip:GetSpell()
  if not spellName then return end
  
  -- is this a "call pet" spell?
  local petSlot = callPetSpells[spellID]
  if not petSlot then return end
  
  -- is there actually a pet in this slot?
  local _, _, _, family = GetStablePetInfo(petSlot)
  if not family or family == "" then return end

  -- add to spell tooltip
  tooltip:AddLine("|n|cFFFFFFFF"..GetNewTooltip(petSlot))
end)


function GetSpecString(family)
    if buffs[family] then return buffs[family][1]; else return "|cFFFF88FF??|r"; end    --Unknown spec
end   

function GetAbilityString(family)
    if buffs[family] then return "|cFFFFD200" .. buffs[family][2] .. "|r"; else return "|cFFFF88FF??|r"; end
end    

local function colorizeSpeed(sec)
    if not(sec) then return "" end
    if (sec < 0.25) then return "|cFFFF00FF"  -- capped, magenta
    elseif (sec <= 0.5 ) then return "|cFFFF0000" -- very fast, red
    elseif (sec <= 1 ) then return "|cFFFF6600" -- quite fast, orange
    elseif (sec <=1.8) then return "|cFFFFFF00" -- some fast, yellow
    elseif (sec == 2) then return "|cFFDDDDDD" -- typical npc attack speed, whitish
    elseif (sec >= 3.5) then return "|cFF0088FF" -- slooooow, blue
    elseif (sec >= 2.8) then return "|cFF00CC88" -- some slow, cyan
    else return "|cFF88DDAA" -- sec > 2 -- a little slow, pastel green
    end
end
 
GameTooltip:HookScript("OnTooltipSetUnit", function (tooltip)
    local ttUnit = select(2,tooltip:GetUnit())
    if not(ttUnit) then return end
    local unitType = UnitCreatureType(ttUnit)
    local unitFam = UnitCreatureFamily(ttUnit)

    if ((UnitIsOtherPlayersPet(ttUnit) and unitFam and (unitType == BEAST_STRING or unitType == MECH_STRING))) then
        tooltip:AddLine(GetSpecString(unitFam) .. "  |cFFFFFFFF".. GetAbilityString(unitFam))
    end

    if not (unitFam and (unitType == BEAST_STRING or unitType == MECH_STRING)) then return end
    local unitAtkSpd = UnitAttackSpeed(ttUnit)
    local baseAtkSpd
    if ttUnit == "pet" then baseAtkSpd = floor(unitAtkSpd * (100+GetPetMeleeHaste())+0.5)/100 end
    unitAtkSpd = floor(unitAtkSpd*100+0.5)/100
    tooltip:AddDoubleLine(ATTACK_SPEED..":", colorizeSpeed(unitAtkSpd)..tostring(unitAtkSpd).."|r".. ((ttUnit == "pet" and colorizeSpeed(baseAtkSpd).." ("..tostring(baseAtkSpd)..")".."|r") or ""), 0.8,0.8,0.8, 0.8,0.8,0.8)
end)    

--ImprovedStableFrame------------------
local maxSlots = NUM_PET_STABLE_PAGES * NUM_PET_STABLE_SLOTS
local NUM_PER_ROW, heightChange = 10, 65

for i = NUM_PET_STABLE_SLOTS + 1, maxSlots do 
	if not _G["PetStableStabledPet"..i] then
		CreateFrame("Button", "PetStableStabledPet"..i, PetStableFrame, "PetStableSlotTemplate", i)
	end
end

for i = 1, maxSlots do
	local frame = _G["PetStableStabledPet"..i]
	if i > 1 then
		frame:ClearAllPoints()
		frame:SetPoint("LEFT", _G["PetStableStabledPet"..i-1], "RIGHT", 7.3, 0)
	end
	frame:SetFrameLevel(PetStableFrame:GetFrameLevel() + 1)
	frame:SetScale(7/NUM_PER_ROW)
end

PetStableStabledPet1:ClearAllPoints()
PetStableStabledPet1:SetPoint("TOPLEFT", PetStableBottomInset, 9, -9)

for i = NUM_PER_ROW+1, maxSlots, NUM_PER_ROW do
	_G["PetStableStabledPet"..i]:ClearAllPoints()
	_G["PetStableStabledPet"..i]:SetPoint("TOPLEFT", _G["PetStableStabledPet"..i-NUM_PER_ROW], "BOTTOMLEFT", 0, -5)
end

PetStableNextPageButton:Hide()
PetStablePrevPageButton:Hide()

PetStableFrameModelBg:SetHeight(281 - heightChange)
PetStableFrameModelBg:SetTexCoord(0.16406250, 0.77734375, 0.00195313, 0.55078125 - heightChange/512)

PetStableFrameInset:SetPoint("BOTTOMRIGHT", PetStableFrame, "BOTTOMRIGHT", -6, 126 + heightChange)
PetStableFrameStableBg:SetHeight(116 + heightChange)

NUM_PET_STABLE_SLOTS = maxSlots
NUM_PET_STABLE_PAGES = 1
PetStableFrame.page = 1
end