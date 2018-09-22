local _, ns = ...
local M, R, U, I = unpack(ns)

local classification = {
	elite = " |cffcc8800"..ELITE.."|r",
	rare = " |cffff99cc"..RARITY.."|r",
	rareelite = " |cffff99cc"..RARITY.."|r ".."|cffcc8800"..ELITE.."|r",
	worldboss = " |cffff0000"..BOSS.."|r",
}
local COALESCED_REALM_TOOLTIP1 = string.split(FOREIGN_SERVER_LABEL, COALESCED_REALM_TOOLTIP)
local INTERACTIVE_REALM_TOOLTIP1 = string.split(INTERACTIVE_SERVER_LABEL, INTERACTIVE_REALM_TOOLTIP)

local function getUnit(self)
	local _, unit = self and self:GetUnit()
	if(not unit) then
		local mFocus = GetMouseFocus()
		unit = mFocus and (mFocus.unit or (mFocus.GetAttribute and mFocus:GetAttribute("unit"))) or "mouseover"
	end
	return unit
end

local function hideLines(self)
    for i = 3, self:NumLines() do
        local tiptext = _G["GameTooltipTextLeft"..i]
		local linetext = tiptext:GetText()
		if linetext then
			if linetext == PVP_ENABLED then  --NDuiDB["Tooltip"]["HidePVP"] 
				tiptext:SetText(nil)
				tiptext:Hide()
			elseif linetext:find(COALESCED_REALM_TOOLTIP1) or linetext:find(INTERACTIVE_REALM_TOOLTIP1) then
				tiptext:SetText(nil)
				tiptext:Hide()
				local pretiptext = _G["GameTooltipTextLeft"..i-1]
				pretiptext:SetText(nil)
				pretiptext:Hide()
				self:Show()
			elseif (linetext == FACTION_HORDE) or (linetext == FACTION_ALLIANCE) then
					tiptext:SetText(nil)					--tiptext:SetText("|cffff5040"..linetext.."|r")
					tiptext:Hide()					--tiptext:SetText("|cff4080ff"..linetext.."|r")
			end
		end
    end
end

local function getTarget(unit)
	if UnitIsUnit(unit, "player") then
		return ("|cffff0000%s|r"):format(">"..string.upper(YOU).."<")
	else
		return M.HexRGB(M.UnitColor(unit))..UnitName(unit).."|r"
	end
end

local function InsertFactionFrame(self, faction)
	if not self.factionFrame then
		local f = self:CreateTexture(nil, "OVERLAY")
		f:SetPoint("TOPRIGHT", 0, -5)
		f:SetBlendMode("ADD")
		self.factionFrame = f
	end
	self.factionFrame:SetTexture("Interface\\FriendsFrame\\PlusManz-"..faction)
	self.factionFrame:SetAlpha(.5)
end

local roleTex = {
	["HEALER"] = {.066, .222, .133, .445},
	["TANK"] = {.375, .532, .133, .445},
	["DAMAGER"] = {.66, .813, .133, .445},
}

local function InsertRoleFrame(self, role)
	if not self.roleFrame then
		local f = self:CreateTexture(nil, "OVERLAY")
		f:SetPoint("TOPRIGHT", self, "TOPLEFT", -1, -4)
		f:SetSize(20, 20)
		f:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
		M.CreateSD(f, 3, 3)
		self.roleFrame = f
	end
	self.roleFrame:SetTexCoord(unpack(roleTex[role]))
	self.roleFrame:SetAlpha(1)
	self.roleFrame.Shadow:SetAlpha(1)
end

GameTooltip:HookScript("OnTooltipCleared", function(self)
	if self.factionFrame and self.factionFrame:GetAlpha() ~= 0 then
		self.factionFrame:SetAlpha(0)
	end
	if self.roleFrame and self.roleFrame:GetAlpha() ~= 0 then
		self.roleFrame:SetAlpha(0)
		self.roleFrame.Shadow:SetAlpha(0)
	end
end)

GameTooltip:HookScript("OnTooltipSetUnit", function(self)
	if MaoRUISettingDB["Tooltip"]["CombatHide"] and InCombatLockdown() then
		return self:Hide()
	end
	hideLines(self)

	local unit = getUnit(self)
	if UnitExists(unit) then
		local hexColor = M.HexRGB(M.UnitColor(unit))
		local ricon = GetRaidTargetIndex(unit)
		if ricon and ricon > 8 then ricon = nil end
		if ricon then
			local text = GameTooltipTextLeft1:GetText()
			GameTooltipTextLeft1:SetFormattedText(("%s %s"), ICON_LIST[ricon].."18|t", text)
		end

		if UnitIsPlayer(unit) then
			local unitName
			--if NDuiDB["Tooltip"]["HideTitle"] and NDuiDB["Tooltip"]["HideRealm"] then
				--unitName = UnitName(unit)
			--elseif NDuiDB["Tooltip"]["HideTitle"] then
				--unitName = GetUnitName(unit, true)
			--elseif NDuiDB["Tooltip"]["HideRealm"] then
				unitName = UnitPVPName(unit) or UnitName(unit)
			--end
			if unitName then GameTooltipTextLeft1:SetText(unitName) end

			local relationship = UnitRealmRelationship(unit)
			if(relationship == LE_REALM_RELATION_VIRTUAL) then
				self:AppendText(("|cffcccccc%s|r"):format(INTERACTIVE_SERVER_LABEL))
			end

			local status = (UnitIsAFK(unit) and AFK) or (UnitIsDND(unit) and DND) or (not UnitIsConnected(unit) and PLAYER_OFFLINE)
			if status then
				self:AppendText((" |cff00cc00<%s>|r"):format(status))
			end

			--if NDuiDB["Tooltip"]["FactionIcon"] then
				local faction = UnitFactionGroup(unit)
				if faction and faction ~= "Neutral" then
					InsertFactionFrame(self, faction)
				end
			--end

			--if NDuiDB["Tooltip"]["LFDRole"] then
				local role = UnitGroupRolesAssigned(unit)
				if role ~= "NONE" then
					InsertRoleFrame(self, role)
				end
			--end

			local guildName, rank, rankIndex, guildRealm = GetGuildInfo(unit)
			local text = GameTooltipTextLeft2:GetText()
			if rank and text then
				rankIndex = rankIndex + 1
				--if NDuiDB["Tooltip"]["HideRank"] then
					--GameTooltipTextLeft2:SetText("<"..text..">")
				--else
					GameTooltipTextLeft2:SetText("<"..text..">  "..rank.."("..rankIndex..")")
				--end

				local myGuild, _, _, myGuildRealm = GetGuildInfo("player")
				if IsInGuild() and guildName == myGuild and guildRealm == myGuildRealm then
					GameTooltipTextLeft2:SetTextColor(.25, 1, .25)
				else
					GameTooltipTextLeft2:SetTextColor(.6, .8, 1)
				end
			end
		end

		local line1 = GameTooltipTextLeft1:GetText()
		GameTooltipTextLeft1:SetFormattedText("%s", hexColor..line1)

		local alive = not UnitIsDeadOrGhost(unit)
		local level
		if UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit) then
			level = UnitBattlePetLevel(unit)
		else
			level = UnitLevel(unit)
		end

		if level then
			local boss
			if level == -1 then boss = "|cffff0000??|r" end

			local diff = GetCreatureDifficultyColor(level)
			local classify = UnitClassification(unit)
			local textLevel = ("%s%s%s|r"):format(M.HexRGB(diff), boss or ("%d"):format(level), classification[classify] or "")
			local tiptextLevel
			for i = 2, self:NumLines() do
				local tiptext = _G["GameTooltipTextLeft"..i]
				local linetext = tiptext:GetText()
				if linetext and linetext:find(LEVEL) then
					tiptextLevel = tiptext
				end
			end

			local creature = not UnitIsPlayer(unit) and UnitCreatureType(unit) or ""
			local unitClass = UnitIsPlayer(unit) and ("%s %s"):format(UnitRace(unit) or "", hexColor..(UnitClass(unit) or "").."|r") or ""
			if tiptextLevel then
				tiptextLevel:SetFormattedText(("%s %s%s %s"), textLevel, creature, unitClass, (not alive and "|cffCCCCCC"..DEAD.."|r" or ""))
			end
		end

		if UnitExists(unit.."target") then
			local tarRicon = GetRaidTargetIndex(unit.."target")
			if tarRicon and tarRicon > 8 then tarRicon = nil end
			local tar = ("%s%s"):format((tarRicon and ICON_LIST[tarRicon].."10|t") or "", getTarget(unit.."target"))
			self:AddLine(TARGET..": "..tar)
		end

		if alive then
			GameTooltipStatusBar:SetStatusBarColor(M.UnitColor(unit))
		else
			GameTooltipStatusBar:Hide()
		end
	else
		GameTooltipStatusBar:SetStatusBarColor(0, .9, 0)
	end

	if GameTooltipStatusBar:IsShown() then
		GameTooltipStatusBar:ClearAllPoints()
		GameTooltipStatusBar:SetPoint("BOTTOMLEFT", self, "TOPLEFT", 2, 3)
		GameTooltipStatusBar:SetPoint("BOTTOMRIGHT", self, "TOPRIGHT", -2, 3)
	end
end)

-- Tooltip statusbars
do
	GameTooltipStatusBar:SetStatusBarTexture(I.normTex)
	GameTooltipStatusBar:SetHeight(5)
	M.CreateSD(GameTooltipStatusBar, 3, 3)
	local bg = M.CreateBG(GameTooltipStatusBar, 1)
	M.CreateBD(bg, .7)
	M.CreateSD(bg)
	M.CreateTex(bg)
end

GameTooltipStatusBar:SetScript("OnValueChanged", function(self, value)
	if not value then return end
	local min, max = self:GetMinMaxValues()
	if (value < min) or (value > max) then return end

	local unit = getUnit(GameTooltip)
	if UnitExists(unit) then
		min, max = UnitHealth(unit), UnitHealthMax(unit)
		if not self.text then
			self.text = M.CreateFS(self, 12, "")
		end
		self.text:Show()
		local hp = M.Numb(min).." / "..M.Numb(max)
		self.text:SetText(hp)
	end
end)

hooksecurefunc("GameTooltip_ShowStatusBar", function(self)
	if self.statusBarPool then
		local bar = self.statusBarPool:Acquire()
		if bar and not bar.styled then
			local _, bd, tex = bar:GetRegions()
			tex:SetTexture(I.normTex)
			bd:Hide()
			local bg = M.CreateBG(bd, 0)
			M.CreateBD(bg, .25)

			bar.styled = true
		end
	end
end)

hooksecurefunc("GameTooltip_ShowProgressBar", function(self)
	if self.progressBarPool then
		local bar = self.progressBarPool:Acquire()
		if bar and not bar.styled then
			M.StripTextures(bar.Bar, true)
			bar.Bar:SetStatusBarTexture(I.normTex)
			M.CreateBD(bar, .25)
			bar:SetSize(216, 18)

			bar.styled = true
		end
	end
end)

-- Anchor and mover
local mover
hooksecurefunc("GameTooltip_SetDefaultAnchor", function(tooltip, parent)
	if MaoRUISettingDB["Tooltip"]["Cursor"] then
		tooltip:SetOwner(parent, "ANCHOR_CURSOR_RIGHT")
	else
		if not mover then
			mover = M.Mover(tooltip, "Tooltip", "GameTooltip", R.Tooltips.TipPos, 240, 120)
		end
		tooltip:SetOwner(parent, "ANCHOR_NONE")
		tooltip:ClearAllPoints()
		tooltip:SetPoint("BOTTOMRIGHT", mover)
	end
end)

-- Tooltip skin
local function style(self)
	self:SetScale(MaoRUISettingDB["Tooltip"]["TooltipScale"])

	if not self.tipStyled then
		self:SetBackdrop(nil)
		local bg = M.CreateBG(self, 0)
		bg:SetFrameLevel(self:GetFrameLevel())
		M.CreateBD(bg, .7)
		M.CreateSD(bg)
		M.CreateTex(bg)
		self.bg = bg

		-- other gametooltip-like support
		self.GetBackdrop = function() return bg:GetBackdrop() end
		self.GetBackdropColor = function() return 0, 0, 0, .7 end
		self.GetBackdropBorderColor = function() return 0, 0, 0 end

		self.tipStyled = true
	end

	self.bg:SetBackdropBorderColor(0, 0, 0)
	if self.GetItem then  -- NDuiDB["Tooltip"]["ClassColor"] and
		local _, item = self:GetItem()
		if item then
			local quality = select(3, GetItemInfo(item))
			local color = BAG_ITEM_QUALITY_COLORS[quality or 1]
			if color then
				self.bg:SetBackdropBorderColor(color.r, color.g, color.b)
			end
		end
	end

	if self.NumLines and self:NumLines() > 0 then
		for index = 1, self:NumLines() do
			if index == 1 then
				_G[self:GetName().."TextLeft"..index]:SetFont(I.TipFont[1], I.TipFont[2] + 2, I.TipFont[3])
			else
				_G[self:GetName().."TextLeft"..index]:SetFont(unpack(I.TipFont))
			end
			_G[self:GetName().."TextRight"..index]:SetFont(unpack(I.TipFont))
		end
	end
end

local function extrastyle(self)
	if not self.styled then
		self:DisableDrawLayer("BACKGROUND")
		style(self)
		self.styled = true
	end
end

hooksecurefunc("GameTooltip_SetBackdropStyle", function(self)
	if not self.tipStyled then return end
	self:SetBackdrop(nil)
end)

M:RegisterEvent("ADDON_LOADED", function(_, addon)
	if addon == "Blizzard_DebugTools" then
		local tooltips = {
			FrameStackTooltip,
			EventTraceTooltip
		}
		for _, tip in pairs(tooltips) do
			tip:SetParent(UIParent)
			tip:SetFrameStrata("TOOLTIP")
			tip:HookScript("OnShow", style)
		end

	elseif addon == "_ShiGuang" then
		local tooltips = {
			ChatMenu,
			EmoteMenu,
			LanguageMenu,
			VoiceMacroMenu,
			GameTooltip,
			EmbeddedItemTooltip,
			ItemRefTooltip,
			ItemRefShoppingTooltip1,
			ItemRefShoppingTooltip2,
			ShoppingTooltip1,
			ShoppingTooltip2,
			AutoCompleteBox,
			FriendsTooltip,
			WorldMapTooltip,
			WorldMapCompareTooltip1,
			WorldMapCompareTooltip2,
			QuestScrollFrame.StoryTooltip,
			GeneralDockManagerOverflowButtonList,
			ReputationParagonTooltip,
			QuestScrollFrame.WarCampaignTooltip,
			NamePlateTooltip,
		}
		for _, f in pairs(tooltips) do
			if f then
				f:HookScript("OnShow", style)
			end
		end

		local extra = {
			QueueStatusFrame,
			FloatingGarrisonFollowerTooltip,
			FloatingGarrisonFollowerAbilityTooltip,
			FloatingGarrisonMissionTooltip,
			GarrisonFollowerAbilityTooltip,
			GarrisonFollowerTooltip,
			FloatingGarrisonShipyardFollowerTooltip,
			GarrisonShipyardFollowerTooltip,
			BattlePetTooltip,
			PetBattlePrimaryAbilityTooltip,
			PetBattlePrimaryUnitTooltip,
			FloatingBattlePetTooltip,
			FloatingPetBattleAbilityTooltip,
			IMECandidatesFrame
		}
		for _, f in pairs(extra) do
			if f then
				f:HookScript("OnShow", extrastyle)
			end
		end

		-- DropdownMenu
		hooksecurefunc("MSA_DropDownMenu_CreateFrames", function()
			for i = 1, MSA_DROPDOWNMENU_MAXLEVELS do
				local menu = _G["MSA_DropDownList"..i.."MenuBackdrop"]
				if menu and not menu.styled then
					menu:HookScript("OnShow", style)
					menu.styled = true
				end

				local menu2 = _G["MSA_DropDownList"..i.."MenuBackdrop"]
				if menu2 and not menu2.styled then
					menu2:HookScript("OnShow", style)
					menu2.styled = true
				end
			end
		end)

		-- IME
		local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b
		IMECandidatesFrame.selection:SetVertexColor(r, g, b)

		-- Pet Tooltip
		PetBattlePrimaryUnitTooltip.Delimiter:SetColorTexture(0, 0, 0)
		PetBattlePrimaryUnitTooltip.Delimiter:SetHeight(1)
		PetBattlePrimaryUnitTooltip.Delimiter2:SetColorTexture(0, 0, 0)
		PetBattlePrimaryUnitTooltip.Delimiter2:SetHeight(1)
		PetBattlePrimaryAbilityTooltip.Delimiter1:SetHeight(1)
		PetBattlePrimaryAbilityTooltip.Delimiter1:SetColorTexture(0, 0, 0)
		PetBattlePrimaryAbilityTooltip.Delimiter2:SetHeight(1)
		PetBattlePrimaryAbilityTooltip.Delimiter2:SetColorTexture(0, 0, 0)
		FloatingPetBattleAbilityTooltip.Delimiter1:SetHeight(1)
		FloatingPetBattleAbilityTooltip.Delimiter1:SetColorTexture(0, 0, 0)
		FloatingPetBattleAbilityTooltip.Delimiter2:SetHeight(1)
		FloatingPetBattleAbilityTooltip.Delimiter2:SetColorTexture(0, 0, 0)
		FloatingBattlePetTooltip.Delimiter:SetColorTexture(0, 0, 0)
		FloatingBattlePetTooltip.Delimiter:SetHeight(1)

		PetBattlePrimaryUnitTooltip:HookScript("OnShow", function(self)
			if not self.tipStyled then
				if self.glow then self.glow:Hide() end
				self.Border:Hide()
				self.Icon:SetTexCoord(unpack(I.TexCoord))
				self.tipStyled = true
			end
		end)

		hooksecurefunc("PetBattleUnitTooltip_UpdateForUnit", function(self)
			local nextBuff, nextDebuff = 1, 1
			for i = 1, C_PetBattles.GetNumAuras(self.petOwner, self.petIndex) do
				local _, _, _, isBuff = C_PetBattles.GetAuraInfo(self.petOwner, self.petIndex, i)
				if isBuff and self.Buffs then
					local frame = self.Buffs.frames[nextBuff]
					if frame and frame.Icon then
						frame.Icon:SetTexCoord(unpack(I.TexCoord))
					end
					nextBuff = nextBuff + 1
				elseif (not isBuff) and self.Debuffs then
					local frame = self.Debuffs.frames[nextDebuff]
					if frame and frame.Icon then
						frame.DebuffBorder:Hide()
						frame.Icon:SetTexCoord(unpack(I.TexCoord))
					end
					nextDebuff = nextDebuff + 1
				end
			end
		end)

	elseif addon == "Blizzard_Collections" then
		local pet = {
			PetJournalPrimaryAbilityTooltip,
			PetJournalSecondaryAbilityTooltip,
		}
		for _, f in pairs(pet) do
			if f then
				f:HookScript("OnShow", extrastyle)
			end
		end

		PetJournalPrimaryAbilityTooltip.Delimiter1:SetHeight(1)
		PetJournalPrimaryAbilityTooltip.Delimiter1:SetColorTexture(0, 0, 0)
		PetJournalPrimaryAbilityTooltip.Delimiter2:SetHeight(1)
		PetJournalPrimaryAbilityTooltip.Delimiter2:SetColorTexture(0, 0, 0)

	elseif addon == "Blizzard_GarrisonUI" then
		local gt = {
			GarrisonMissionMechanicTooltip,
			GarrisonMissionMechanicFollowerCounterTooltip,
			GarrisonShipyardMapMissionTooltip,
			GarrisonBonusAreaTooltip,
			GarrisonBuildingFrame.BuildingLevelTooltip,
			GarrisonFollowerAbilityWithoutCountersTooltip,
			GarrisonFollowerMissionAbilityWithoutCountersTooltip
		}
		for _, f in pairs(gt) do
			if f then
				f:HookScript("OnShow", extrastyle)
			end
		end

	elseif addon == "Blizzard_PVPUI" then
		ConquestTooltip:HookScript("OnShow", style)

	elseif addon == "Blizzard_Contribution" then
		ContributionBuffTooltip:HookScript("OnShow", extrastyle)
		ContributionBuffTooltip.Icon:SetTexCoord(unpack(I.TexCoord))
		ContributionBuffTooltip.Border:SetAlpha(0)

	elseif addon == "Blizzard_EncounterJournal" then
		EncounterJournalTooltip:HookScript("OnShow", style)
		EncounterJournalTooltip.Item1.icon:SetTexCoord(unpack(I.TexCoord))
		EncounterJournalTooltip.Item2.icon:SetTexCoord(unpack(I.TexCoord))

	elseif addon == "Blizzard_Calendar" then
		local gt = {
			CalendarContextMenu,
			CalendarInviteStatusContextMenu,
		}
		for _, f in pairs(gt) do
			if f then
				f:HookScript("OnShow", style)
			end
		end

	elseif addon == "Blizzard_IslandsQueueUI" then
		local tip = IslandsQueueFrameTooltip
		tip:GetParent():GetParent():HookScript("OnShow", style)
		tip:GetParent().IconBorder:SetAlpha(0)
		tip:GetParent().Icon:SetTexCoord(.08, .92, .08, .92)
	end
end)



-------------------------DarkmoonTicketTooltip-------------------------------------------
-- Database of turnin items
local questItems = {
	[71715] = { ["quest"] = 29451, ["tickets"] = 10, title = "The Master Strategist" }, -- A Treatise on Strategy
	[71638] = { ["quest"] = 29446, ["tickets"] = 10, title = "A Wondrous Weapon" }, -- Ornate Weapon
	[71637] = { ["quest"] = 29445, ["tickets"] = 10, title = "An Intriguing Grimoire" }, -- Mysterious Grimoire
	[71636] = { ["quest"] = 29444, ["tickets"] = 10, title = "An Exotic Egg" }, -- Monstrous Egg
	[71635] = { ["quest"] = 29443, ["tickets"] = 10, title = "A Curious Crystal" }, -- Imbued Crystal
	[71716] = { ["quest"] = 29464, ["tickets"] = 10, title = "Tools of Divination" }, -- Soothsayer's Runes
	[71952] = { ["quest"] = 29457, ["tickets"] = 5, title = "The Enemy's Insignia" }, -- Captured Insignia
	[71951] = { ["quest"] = 29456, ["tickets"] = 5, title = "A Captured Banner" }, -- Banner of the Fallen
	[71953] = { ["quest"] = 29458, ["tickets"] = 5, title = "The Captured Journal" }, -- Fallen Adventurer's Journal
	[105891] = { quest = 33354, tickets = 10, title = "Den Mother's Demise" }, -- Moonfang's Pelt -> Den Mother's Demise (probably too expensive in almost all cases, but added for completion)
	[124669] = { quest = 38934, tickets = 100, title = "Silas' Secret Stash", numRequiredItems = 100 }, -- Darkmoon Daggermaw -> Silas' Secret Stash (one-time only)
}

-- Display tooltip information, but only on DMF quest items
GameTooltip:HookScript("OnTooltipSetItem", function(self)
local _, itemLink = self:GetItem()
	if type(itemLink) == "string" then -- Is valid item string (i.e., not nil) -> Check if it's the right item
		local itemID = GetItemInfoInstant(itemLink)
			if questItems[itemID] then -- Is DMF turnin item -> Show tooltip info
				local numRequiredItems = questItems[itemID]["numRequiredItems"] or 1 -- Only 1 is required of the regular quest items
				if IsQuestFlaggedCompleted(questItems[itemID]["quest"]) then -- Is completed - > Show text in green
					self:AddLine(format("✓\"%s\"--%s%d%s--", questItems[itemID]["title"], "|cFF8080FF", questItems[itemID]["tickets"], "|r"), 0xFF/255, 0x1A/255, 0x1A/255)
				else -- Not yet completed -> Show text in red
					self:AddLine(format("x\"%s\"--%s%d%s--", questItems[itemID]["title"], "|cFF8080FF", questItems[itemID]["tickets"], "|r"), 0x1E/255, 0xFF/255, 0x00/255)
				end			
			end
	end
end)
