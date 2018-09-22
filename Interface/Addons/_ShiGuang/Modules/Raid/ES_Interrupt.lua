--## Author: Elêssar   ## Notes: Keeps track of your partymembers interrupts.  ## Version: 1.0.1  ## Saved Variables: ESINT_Lock, ESINT_PositionX, ESINT_PositionY, ESINT_Scale, ESINT_Show ##
if (ShiGuangDB["ESINT_Show"] == nil) then ShiGuangDB["ESINT_Show"] = 1 end

--## Locals and tables ##
local ESINT_Total = 0
local InsTar = ""
local sequence = 1
local pWrl = 0
local p0 = 0
local p1 = 0
local p2 = 0
local p3 = 0
local p4 = 0
local Tsp0 = 0
local Tsp1 = 0
local Tsp2 = 0
local Tsp3 = 0
local Tsp4 = 0
local text_Mask = "Interface\\Addons\\_ShiGuang\\Media\\Hexagon"
--local text_Border = "Interface\\Addons\\ES_Interrupt\\img\\Border.tga"

local ESINT_Spec = {--Spec ID's
    [250] = { texture = "Interface\\ICONS\\spell_deathknight_mindfreeze.blp" },
    [251] = { texture = "Interface\\ICONS\\spell_deathknight_mindfreeze.blp" },
    [252] = { texture = "Interface\\ICONS\\spell_deathknight_mindfreeze.blp" },
    [577] = { texture = "Interface\\ICONS\\ability_demonhunter_consumemagic.blp" },
    [581] = { texture = "Interface\\ICONS\\ability_demonhunter_consumemagic.blp" },
    [102] = { texture = "Interface\\ICONS\\ability_vehicle_sonicshockwave.blp" },
    [103] = { texture = "Interface\\ICONS\\INV_Bone_Skull_04.blp" },
    [104] = { texture = "Interface\\ICONS\\INV_Bone_Skull_04.blp" },
    [253] = { texture = "Interface\\ICONS\\inv_ammo_arrow_03.blp" },
    [254] = { texture = "Interface\\ICONS\\inv_ammo_arrow_03.blp" },
    [255] = { texture = "Interface\\ICONS\\ability_hunter_negate.blp" },
    [62] = { texture = "Interface\\ICONS\\spell_frost_iceshock.blp" },
    [63] = { texture = "Interface\\ICONS\\spell_frost_iceshock.blp" },
    [64] = { texture = "Interface\\ICONS\\spell_frost_iceshock.blp" },
    [268] = { texture = "Interface\\ICONS\\ability_monk_spearhand.blp" },
    [269] = { texture = "Interface\\ICONS\\ability_monk_spearhand.blp" },
    [66] = { texture = "Interface\\ICONS\\spell_holy_rebuke.blp" },
    [70] = { texture = "Interface\\ICONS\\spell_holy_rebuke.blp" },
    [258] = { texture = "Interface\\ICONS\\ability_priest_silence.blp" },
    [259] = { texture = "Interface\\ICONS\\ability_kick.blp" },
    [260] = { texture = "Interface\\ICONS\\ability_kick.blp" },
    [261] = { texture = "Interface\\ICONS\\ability_kick.blp" },
    [262] = { texture = "Interface\\ICONS\\Spell_nature_cyclone.blp" },
    [263] = { texture = "Interface\\ICONS\\Spell_nature_cyclone.blp" },
    [264] = { texture = "Interface\\ICONS\\Spell_nature_cyclone.blp" },
    [71] = { texture = "Interface\\ICONS\\inv_gauntlets_04.blp" },
    [72] = { texture = "Interface\\ICONS\\inv_gauntlets_04.blp" },
    [73] = { texture = "Interface\\ICONS\\inv_gauntlets_04.blp" },
	[265] = { texture = "Interface\\ICONS\\spell_shadow_mindrot.blp" }, -- Affliction
	-- Due to limited functionality for checking available interrupts on partymembers,
	-- partymember warlocks will show on Affliction and Destruction. Disabled on Demonology
	--[266] = { texture = "Interface\\ICONS\\spell_shadow_mindrot.blp" }, -- Demonology
	[267] = { texture = "Interface\\ICONS\\spell_shadow_mindrot.blp" }, -- Destruction
	
}

local ESINT_Ability = {
	[47528] = { cd = 15 }, -- Mind Freeze
	[183752] = { cd = 15 }, -- Disrupt
	[78675] = { cd = 60 }, -- Solar Beam
	[106839] = { cd = 15 }, -- Skull Bash
	[147362] = { cd = 24 }, -- Counter Shot
	[187707] = { cd = 15 }, -- Muzzle
	[2139] = { cd = 24 }, -- Counterspell
	[116705] = { cd = 15 }, -- Spear Hand Strike
	[96231] = { cd = 15 }, -- Rebuke
	[15487] = { cd = 45 }, -- Silence
	[1766] = { cd = 15 }, -- Kick
	[57994] = { cd = 12 }, -- Wind Shear
	[6552] = { cd = 15 }, -- Pummel
	[119910] = { cd = 24 },  -- Spell Lock  (With pet)
	[132409] = { cd = 24 }, -- Spell Lock (With Sacrifice)
}


--## Create frames ##
ES_Interrupt = {};
local ESINT_Anchor = CreateFrame("Frame","ES_INT_Anchor", UIParent)
local ESINT_Container = CreateFrame("Frame","ES_INT_Container", UIParent)
local ESINT_PartyListener = CreateFrame("Frame","ES_INT_PartyListener", UIParent)
local ESINT_Loadlistener = CreateFrame("Frame","ES_INT_Loadlistener", UIParent)
local ESINT_Looptimer = CreateFrame("Frame","ES_INT_Looptimer", ESINT_Container)
ES_Interrupt.panel = CreateFrame("Frame", "ES_InterruptPanel", UIParent);
local ESINTtitle = CreateFrame("Frame", "ESINTtitle", ES_InterruptPanel)
ESINTlockcheck = CreateFrame("CheckButton", "ESINTlockcheck", ES_InterruptPanel, "InterfaceOptionsCheckButtonTemplate")
ESINTlockcheckframe = CreateFrame("Frame", "ESINTlockcheckframe", UIParent)
ESINTshowcheck = CreateFrame("CheckButton", "ESINTshowcheck", ES_InterruptPanel, "InterfaceOptionsCheckButtonTemplate")
ESINTshowcheckframe = CreateFrame("Frame", "ESINTshowcheckframe", UIParent)
ESINTScaleF = CreateFrame("Slider", "ESINTScaleFrame", ES_InterruptPanel, "OptionsSliderTemplate")
local ESINT_Party0 = CreateFrame("Frame","ES_INT_Party0", ESINT_Container)
local ESINT_Party0cd = CreateFrame("Cooldown","ES_INT_cd0", UIParent, "CooldownFrameTemplate")
local ESINT_Party0brd = CreateFrame("Frame","ES_INT_brd0", UIParent)
local ESINT_Party1 = CreateFrame("Frame","ES_INT_Party1", ESINT_Container)
local ESINT_Party1cd = CreateFrame("Cooldown","ES_INT_cd1", UIParent, "CooldownFrameTemplate")
local ESINT_Party1brd = CreateFrame("Frame","ES_INT_brd1", UIParent)
local ESINT_Party2 = CreateFrame("Frame","ES_INT_Party2", ESINT_Container)
local ESINT_Party2cd = CreateFrame("Cooldown","ES_INT_cd2", UIParent, "CooldownFrameTemplate")
local ESINT_Party2brd = CreateFrame("Frame","ES_INT_brd2", UIParent)
local ESINT_Party3 = CreateFrame("Frame","ES_INT_Party3", ESINT_Container)
local ESINT_Party3cd = CreateFrame("Cooldown","ES_INT_cd3", UIParent, "CooldownFrameTemplate")
local ESINT_Party3brd = CreateFrame("Frame","ES_INT_brd3", UIParent)
local ESINT_Party4 = CreateFrame("Frame","ES_INT_Party4", ESINT_Container)
local ESINT_Party4cd = CreateFrame("Cooldown","ES_INT_cd4", UIParent, "CooldownFrameTemplate")
local ESINT_Party4brd = CreateFrame("Frame","ES_INT_brd4", UIParent)


--## ESINT_Anchor ##
ESINT_Anchor:SetWidth(21);
ESINT_Anchor:SetHeight(21);
--ESINT_Anchor:SetFrameStrata("LOW");
ESINT_Anchor:SetClampedToScreen(true)
ESINT_Anchor:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Hexagon"})
ESINT_Anchor:SetBackdropColor(RAID_CLASS_COLORS[select(2, UnitClass("player"))].r, RAID_CLASS_COLORS[select(2, UnitClass("player"))].g, RAID_CLASS_COLORS[select(2, UnitClass("player"))].b)
ESINT_Anchor:RegisterForDrag("LeftButton")
ESINT_Anchor:SetPoint("LEFT", UIParent, "LEFT", 60, 210)
ESINT_Anchor:SetMovable(true)
ESINT_Anchor:EnableMouse(true)
ESINT_Anchor:SetScript("OnDragStart", function(self) ESINT_Anchor:StartMoving() end)
ESINT_Anchor:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
ESINT_Anchor:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(ESINT_Anchor, "ANCHOR_TOP")
	GameTooltip:AddLine("点我拖动", 1,2,0)
	GameTooltip:Show()
end)
ESINT_Anchor:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

--## ESINT_Container ##
ESINT_Container:SetWidth(64)
ESINT_Container:SetHeight(304)
--ESINT_Container:SetFrameStrata("LOW");
ESINT_Container:SetClampedToScreen(true)
ESINT_Container:SetPoint("TOPLEFT", ESINT_Anchor, "BOTTOMRIGHT")
ESINT_Container:Hide()


--## ESINT_Party0 ##
ESINT_Party0:SetWidth(43)
ESINT_Party0:SetHeight(43)
--ESINT_Party0:SetFrameStrata("LOW")
ESINT_Party0.texture = ESINT_Party0:CreateTexture(nil)
ESINT_Party0.texture:SetAllPoints(ESINT_Party0)
ESINT_Party0.texture:SetMask(text_Mask)
ESINT_Party0.font = ESINT_Party0:CreateFontString(nil)
ESINT_Party0.font:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ESINT_Party0.font:SetPoint("RIGHT", ESINT_Party0, "LEFT");
ESINT_Party0.font:SetText("");
ESINT_Party0cd:SetAllPoints(ESINT_Party0)
ESINT_Party0cd:SetSwipeTexture(text_Mask)
ESINT_Party0cd:SetDrawEdge(false)
ESINT_Party0cd:SetBlingTexture(text_Mask)
ESINT_Party0:Hide()



--## ESINT_Party1 ##
ESINT_Party1:SetWidth(43)
ESINT_Party1:SetHeight(43)
--ESINT_Party1:SetFrameStrata("LOW")
ESINT_Party1.texture = ESINT_Party1:CreateTexture(nil)
ESINT_Party1.texture:SetAllPoints(ESINT_Party1)
ESINT_Party1.texture:SetMask(text_Mask)
ESINT_Party1.font = ESINT_Party1:CreateFontString(nil)
ESINT_Party1.font:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ESINT_Party1.font:SetPoint("RIGHT", ESINT_Party1, "LEFT");
ESINT_Party1.font:SetText("");
ESINT_Party1cd:SetAllPoints(ESINT_Party1)
ESINT_Party1cd:SetSwipeTexture(text_Mask)
ESINT_Party1cd:SetDrawEdge(false)
ESINT_Party1cd:SetBlingTexture(text_Mask)
ESINT_Party1:Hide()


--## ESINT_Party2 ##
ESINT_Party2:SetWidth(43)
ESINT_Party2:SetHeight(43)
--ESINT_Party2:SetFrameStrata("LOW")
ESINT_Party2.texture = ESINT_Party2:CreateTexture(nil)
ESINT_Party2.texture:SetAllPoints(ESINT_Party2)
ESINT_Party2.texture:SetMask(text_Mask)
ESINT_Party2.font = ESINT_Party2:CreateFontString(nil)
ESINT_Party2.font:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ESINT_Party2.font:SetPoint("RIGHT", ESINT_Party2, "LEFT");
ESINT_Party2.font:SetText("");
ESINT_Party2cd:SetAllPoints(ESINT_Party2)
ESINT_Party2cd:SetSwipeTexture(text_Mask)
ESINT_Party2cd:SetDrawEdge(false)
ESINT_Party2cd:SetBlingTexture(text_Mask)
ESINT_Party2:Hide()


--## ESINT_Party3 ##
ESINT_Party3:SetWidth(43)
ESINT_Party3:SetHeight(43)
--ESINT_Party3:SetFrameStrata("LOW")
ESINT_Party3.texture = ESINT_Party3:CreateTexture(nil)
ESINT_Party3.texture:SetAllPoints(ESINT_Party3)
ESINT_Party3.texture:SetMask(text_Mask)
ESINT_Party3.font = ESINT_Party3:CreateFontString(nil)
ESINT_Party3.font:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ESINT_Party3.font:SetPoint("RIGHT", ESINT_Party3, "LEFT");
ESINT_Party3.font:SetText("");
ESINT_Party3cd:SetAllPoints(ESINT_Party3)
ESINT_Party3cd:SetSwipeTexture(text_Mask)
ESINT_Party3cd:SetDrawEdge(false)
ESINT_Party3cd:SetBlingTexture(text_Mask)
ESINT_Party3:Hide()


--## ESINT_Party4 ##
ESINT_Party4:SetWidth(43)
ESINT_Party4:SetHeight(43)
--ESINT_Party4:SetFrameStrata("LOW")
ESINT_Party4.texture = ESINT_Party4:CreateTexture(nil)
ESINT_Party4.texture:SetAllPoints(ESINT_Party4)
ESINT_Party4.texture:SetMask(text_Mask)
ESINT_Party4.font = ESINT_Party4:CreateFontString(nil)
ESINT_Party4.font:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
ESINT_Party4.font:SetPoint("RIGHT", ESINT_Party4, "LEFT");
ESINT_Party4.font:SetText("");
ESINT_Party4cd:SetAllPoints(ESINT_Party4)
ESINT_Party4cd:SetSwipeTexture(text_Mask)
ESINT_Party4cd:SetDrawEdge(false)
ESINT_Party4cd:SetBlingTexture(text_Mask)
ESINT_Party4:Hide()

--## Load Addon and saved variables ##
ESINT_Loadlistener:RegisterEvent("PLAYER_ENTERING_WORLD")
ESINT_Loadlistener:SetScript("OnEvent", function(self, event, ...)
	ESINT_PartyListener:Show()
	ESINTScaleF:SetValue(string.format("%.2f", 1))
	ESINT_Container:SetScale(1)
-- Check saved settings for options
		--ESINT_Anchor:Show()
		--ESINTlockcheck:SetChecked(false)
	--if (ShiGuangDB["ESINT_Show"] == 1) then
		--ESINTshowcheck:SetChecked(true)
	--else
		--ESINTshowcheck:SetChecked(false)
	--end
end)


--## Listen for spellcast ##
ESINT_Container:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
-- arg1 = unit , arg2 = "ignore", arg3 = SpellID
ESINT_Container:SetScript("OnEvent", function(self, event, arg1, arg2, arg3)
	cRaid = IsInRaid()
	cGroup = IsInGroup()
	if (cRaid == false) and (cGroup == true) and (ShiGuangDB["ESINT_Show"] == 1) then
		if (ESINT_Ability[arg3]) then
			cTime = GetTime()
			cCD = ESINT_Ability[arg3].cd
			if (arg1 == "player") and (ESINT_Ability[arg3]) then
				if (arg3 == 15487) and (Tsp0 == 1) then
					ESINT_Party0cd:SetCooldown(cTime, (cCD - 15))
				else
					ESINT_Party0cd:SetCooldown(cTime, cCD)
				end
			elseif (arg1 == "party1") and (ESINT_Ability[arg3]) then
				if (arg3 == 15487) and (Tsp1 == 1) then
					ESINT_Party1cd:SetCooldown(cTime, (cCD - 15))
				else
					ESINT_Party1cd:SetCooldown(cTime, cCD)
				end
			elseif (arg1 == "party2") and (ESINT_Ability[arg3]) then
				if (arg3 == 15487) and (Tsp2 == 1) then
					ESINT_Party2cd:SetCooldown(cTime, (cCD - 15))
				else
					ESINT_Party2cd:SetCooldown(cTime, cCD)
				end
			elseif (arg1 == "party3") and (ESINT_Ability[arg3]) then
				if (arg3 == 15487) and (Tsp3 == 1) then
					ESINT_Party3cd:SetCooldown(cTime, (cCD - 15))
				else
					ESINT_Party3cd:SetCooldown(cTime, cCD)
				end
			elseif (arg1 == "party4") and (ESINT_Ability[arg3]) then
				if (arg3 == 15487) and (Tsp4 == 1) then
					ESINT_Party4cd:SetCooldown(cTime, (cCD - 15))
				else
					ESINT_Party4cd:SetCooldown(cTime, cCD)
				end
			end
		end
	end
end) 


local function ClassColor(index)
	if (index == 1) then
		return 0.78,0.61,0.43,1
	elseif (index == 2) then
		return 0.96,0.55,0.73,1
	elseif (index == 3) then
		return 0.67,0.83,0.45,1
	elseif (index == 4) then
		return 1.00,0.96,0.41,1
	elseif (index == 5) then
		return 1.00,1.00,1.00,1
	elseif (index == 6) then
		return 0.77,0.12,0.23,1
	elseif (index == 7) then
		return 0.00,0.44,0.87,1
	elseif (index == 8) then
		return 0.41,0.80,0.94,1
	elseif (index == 9) then
		return 0.58,0.51,0.79,1
	elseif (index == 10) then
		return 0.33,0.54,0.52,1
	elseif (index == 11) then
		return 1.00,0.49,0.04,1
	elseif (index == 12) then
		return 0.64,0.19,0.79,1
	end
end


local function ESINT_UpdateFrames()
	n0 = UnitName("player")
	_, _, c0 = UnitClass("player")
	n1 = UnitName("party1")
	_, _, c1 = UnitClass("party1")
	n2 = UnitName("party2")
	_, _, c2 = UnitClass("party2")
	n3 = UnitName("party3")
	_, _, c3 = UnitClass("party3")
	n4 = UnitName("party4")
	_, _, c4 = UnitClass("party4")
	
	if (ESINT_Spec[p0]) and (c0 ~= 9) then
		ESINT_Party0:SetPoint("TOPRIGHT",ESINT_Anchor,"BOTTOMRIGHT",43,12)
		ESINT_Party0:Show()
		ESINT_Party0brd:Show()
		ESINT_Party0.texture:SetTexture(ESINT_Spec[p0].texture)
		ESINT_Party0.font:SetText(n0);
		ESINT_Party0.font:SetTextColor(ClassColor(c0))
		ESINT_Party0cd:Show()
	elseif (c0 == 9) and (pWrl == 1) then
		ESINT_Party0:SetPoint("TOPRIGHT",ESINT_Anchor,"BOTTOMRIGHT",43,12)
		ESINT_Party0:Show()
		ESINT_Party0brd:Show()
		ESINT_Party0.texture:SetTexture("Interface\\ICONS\\spell_shadow_mindrot.blp")
		ESINT_Party0.font:SetText(n0);
		ESINT_Party0.font:SetTextColor(ClassColor(c0))
		ESINT_Party0cd:Show()
	else
		ESINT_Party0:SetPoint("TOPRIGHT",ESINT_Anchor,"BOTTOMRIGHT",43,46)
		ESINT_Party0:Hide()
		ESINT_Party0brd:Hide()
		ESINT_Party0.font:SetText("");
		ESINT_Party0cd:Hide()
	end
	
	if (UnitExists("party1")) and (ESINT_Spec[p1]) then
		ESINT_Party1:SetPoint("TOPLEFT",ESINT_Party0,"BOTTOMLEFT",0,4)
		ESINT_Party1:Show()
		ESINT_Party1brd:Show()
		ESINT_Party1.texture:SetTexture(ESINT_Spec[p1].texture)
		ESINT_Party1.font:SetText(n1);
		ESINT_Party1.font:SetTextColor(ClassColor(c1))
		ESINT_Party1cd:Show()
	else
		ESINT_Party1:SetPoint("TOPLEFT",ESINT_Party0,"BOTTOMLEFT",0,8)
		ESINT_Party1:Hide()
		ESINT_Party1brd:Hide()
		ESINT_Party1.font:SetText("");
		ESINT_Party1cd:Hide()
	end
	
	if (UnitExists("party2")) and (ESINT_Spec[p2]) then
		ESINT_Party2:SetPoint("TOPLEFT",ESINT_Party1,"BOTTOMLEFT",0,4)
		ESINT_Party2:Show()
		ESINT_Party2brd:Show()
		ESINT_Party2.texture:SetTexture(ESINT_Spec[p2].texture)
		ESINT_Party2.font:SetText(n2);
		ESINT_Party2.font:SetTextColor(ClassColor(c2))
		ESINT_Party2cd:Show()
	else
		ESINT_Party2:SetPoint("TOPLEFT",ESINT_Party1,"BOTTOMLEFT",0,8)
		ESINT_Party2:Hide()
		ESINT_Party2brd:Hide()
		ESINT_Party2.font:SetText("");
		ESINT_Party2cd:Hide()
	end
	
	if (UnitExists("party3")) and (ESINT_Spec[p3]) then 
		ESINT_Party3:SetPoint("TOPLEFT",ESINT_Party2,"BOTTOMLEFT",0,4)
		ESINT_Party3:Show()
		ESINT_Party3brd:Show()
		ESINT_Party3.texture:SetTexture(ESINT_Spec[p3].texture)
		ESINT_Party3.font:SetText(n3);
		ESINT_Party3.font:SetTextColor(ClassColor(c3))
		ESINT_Party3cd:Show()
	else
		ESINT_Party3:SetPoint("TOPLEFT",ESINT_Party2,"BOTTOMLEFT",0,8)
		ESINT_Party3:Hide()
		ESINT_Party3brd:Hide()
		ESINT_Party3.font:SetText("");
		ESINT_Party3cd:Hide()
	end
	
	if (UnitExists("party4")) and (ESINT_Spec[p4]) then 
		ESINT_Party4:SetPoint("TOPLEFT",ESINT_Party3,"BOTTOMLEFT",0,4)
		ESINT_Party4:Show()
		ESINT_Party4brd:Show()
		ESINT_Party4.texture:SetTexture(ESINT_Spec[p4].texture)
		ESINT_Party4.font:SetText(n4);
		ESINT_Party4.font:SetTextColor(ClassColor(c4))
		ESINT_Party4cd:Show()
	else
		ESINT_Party4:SetPoint("TOPLEFT",ESINT_Party3,"BOTTOMLEFT",0,8)
		ESINT_Party4:Hide()
		ESINT_Party4brd:Hide()
		ESINT_Party4.font:SetText("");
		ESINT_Party4cd:Hide()
	end
end


local function ESINT_ChkInsWin()
	local checkInsFrame = _G["InspectFrame"]
	local ToF = false
	
	if (checkInsFrame == nil) then
		return true
	else
		if (checkInsFrame:IsVisible()) then
			return false
		else
			return true
		end
	end
end


local function ESINT_SpcUpd(unit)
	if CanInspect(unit) and (ESINT_ChkInsWin()) then
		InsTar = unit
		NotifyInspect(unit)
		ESINT_PartyListener:RegisterEvent("INSPECT_READY")
	end
end

--## Listen for groupchanges ##
ESINT_PartyListener:RegisterEvent("PLAYER_ENTERING_WORLD")
ESINT_PartyListener:RegisterEvent("GROUP_ROSTER_UPDATE")
ESINT_PartyListener:SetScript("OnEvent", function(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") or (event == "GROUP_ROSTER_UPDATE") then
		cRaid = IsInRaid()
		cGroup = IsInGroup()
		if (cRaid == false) and (cGroup == true) and (ShiGuangDB["ESINT_Show"] == 1) then
			ESINT_Container:Show()
			ESINT_Anchor:Show()
		else
			ESINT_Anchor:Hide()
			ESINT_Container:Hide()
			ESINT_Party0brd:Hide()
			ESINT_Party1brd:Hide()
			ESINT_Party2brd:Hide()
			ESINT_Party3brd:Hide()
			ESINT_Party4brd:Hide()
			ESINT_Party0cd:Hide()
			ESINT_Party1cd:Hide()
			ESINT_Party2cd:Hide()
			ESINT_Party3cd:Hide()
			ESINT_Party4cd:Hide()
		end
	end
	if (event == "INSPECT_READY") then
		local specID = GetInspectSpecialization(InsTar)
		local _, _, _, selected = GetTalentInfo(4, 1, 3, true, InsTar)
		ESINT_PartyListener:UnregisterEvent("INSPECT_READY")
		ClearInspectPlayer()
		if (InsTar == "party1") then
			p1 = specID
			if (specID == 258) and (selected == true) then
				Tsp1 = 1
			else
				Tsp1 = 0
			end
		elseif (InsTar == "party2") then
			p2 = specID
			if (specID == 258) and (selected == true) then
				Tsp2 = 1
			else
				Tsp2 = 0
			end
		elseif (InsTar == "party3") then
			p3 = specID
			if (specID == 258) and (selected == true) then
				Tsp3 = 1
			else
				Tsp3 = 0
			end
		elseif (InsTar == "party4") then
			p4 = specID
			if (specID == 258) and (selected == true) then
				Tsp4 = 1
			else
				Tsp4 = 0
			end
		end
		
		ESINT_UpdateFrames()
		
		InsTar = ""
		sequence = sequence + 1
	end
end)


local function ESINT_Cache()
	tp0 = GetSpecializationInfoByID(GetSpecializationInfo(GetSpecialization()))
	local _, _, _, selected = GetTalentInfoByID(23137, (GetActiveSpecGroup()))
	local spelllock = GetSpellInfo("Command Demon")
	
	if (tp0 == 258) and (selected) then
		Tsp0 = 1
	else
		Tsp0 = 0
	end
	
	if (spelllock == "Spell Lock") then
		if (pWrl == 0) then
			pWrl = 1
			ESINT_UpdateFrames()
		end
	else
		if (pWrl == 1) then
			pWrl = 0
			ESINT_UpdateFrames()
		end
	end
	
	if (p0 ~= tp0) then
		p0 = tp0
		ESINT_UpdateFrames()
	end
	
	
	if (sequence == 1) then
		if (UnitExists("party1")) and (UnitIsConnected("party1")) then
			ESINT_SpcUpd("party1")
		else
			ESINT_Party1:SetPoint("TOPLEFT",ESINT_Party0,"BOTTOMLEFT",0,43)
			ESINT_Party1:Hide()
			ESINT_Party1brd:Hide()
			ESINT_Party1.font:SetText("");
			ESINT_Party1cd:Hide()
			p1 = 0
			sequence = sequence + 1
		end
	elseif (sequence == 2) then
		if (UnitExists("party2")) and (UnitIsConnected("party2")) then
			ESINT_SpcUpd("party2")
		else
			ESINT_Party2:SetPoint("TOPLEFT",ESINT_Party1,"BOTTOMLEFT",0,43)
			ESINT_Party2:Hide()
			ESINT_Party2brd:Hide()
			ESINT_Party2.font:SetText("");
			ESINT_Party2cd:Hide()
			p2 = 0
			sequence = sequence + 1
		end
	elseif (sequence == 3) then
		if (UnitExists("party3")) and (UnitIsConnected("party3")) then
			ESINT_SpcUpd("party3")
		else
			ESINT_Party3:SetPoint("TOPLEFT",ESINT_Party2,"BOTTOMLEFT",0,43)
			ESINT_Party3:Hide()
			ESINT_Party3brd:Hide()
			ESINT_Party3.font:SetText("");
			ESINT_Party3cd:Hide()
			p3 = 0
			sequence = sequence + 1
		end
	elseif (sequence == 4) then
		if (UnitExists("party4")) and (UnitIsConnected("party4")) then
			ESINT_SpcUpd("party4")
		else
			ESINT_Party4:SetPoint("TOPLEFT",ESINT_Party3,"BOTTOMLEFT",0,43)
			ESINT_Party4:Hide()
			ESINT_Party4brd:Hide()
			ESINT_Party4.font:SetText("");
			ESINT_Party4cd:Hide()
			p4 = 0
			sequence = 1
		end
	else
		sequence = 1
	end
end


--## ESINT_Looptimer ##
ESINT_Looptimer:SetScript("OnUpdate", function(self,elapsed)
	ESINT_Total = ESINT_Total + elapsed
	if ESINT_Total >= 1.0 then
		ESINT_Cache()
		ESINT_Total = 0
	end
end)


ESINTshowcheck:SetScript("OnClick", function(self,button,down) 
	if self:GetChecked(true) then
		ShiGuangDB["ESINT_Show"] = 1
		if (IsInRaid() == false) and (IsInGroup() == true) then
			ESINT_Container:Show()
		else
			ESINT_Container:Hide()
			ESINT_Party0brd:Hide()
			ESINT_Party1brd:Hide()
			ESINT_Party2brd:Hide()
			ESINT_Party3brd:Hide()
			ESINT_Party4brd:Hide()
		end
	else
		ShiGuangDB["ESINT_Show"] = 0
		  ESINT_Anchor:Hide()
		  ESINT_Container:Hide()
			ESINT_Party0brd:Hide()
			ESINT_Party1brd:Hide()
			ESINT_Party2brd:Hide()
			ESINT_Party3brd:Hide()
			ESINT_Party4brd:Hide()
	end
end)

--## Slash command ##
function ESINTcommands(msg, editbox)
		if (ShiGuangDB["ESINT_Show"] == 1) then
			ShiGuangDB["ESINT_Show"] = 0
			ESINT_Anchor:Hide()
			ESINT_Container:Hide()
			ESINT_Party0brd:Hide()
			ESINT_Party1brd:Hide()
			ESINT_Party2brd:Hide()
			ESINT_Party3brd:Hide()
			ESINT_Party4brd:Hide()
			ESINTshowcheck:SetChecked(false)
		else
			ShiGuangDB["ESINT_Show"] = 1
			if (IsInRaid() == false) and (IsInGroup() == true) then
				ESINT_Container:Show()
				ESINT_Anchor:Show()
			else
				ESINT_Anchor:Hide()
				ESINT_Container:Hide()
				ESINT_Party0brd:Hide()
				ESINT_Party1brd:Hide()
				ESINT_Party2brd:Hide()
				ESINT_Party3brd:Hide()
				ESINT_Party4brd:Hide()
			end
			ESINTshowcheck:SetChecked(true)
		end
end
SLASH_ESINTTOGGLE1 = '/esi';
SlashCmdList["ESINTTOGGLE"] = ESINTcommands