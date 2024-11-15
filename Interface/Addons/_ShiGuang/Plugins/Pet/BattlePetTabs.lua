--## Author: Vladinator ## Version: 11.0.2.240908 ## SavedVariables: BattlePetTabsDB3
if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then return end

local _G = _G
local assert = assert
local C_PetJournal = C_PetJournal
local ClearCursor = ClearCursor
local CreateFrame = CreateFrame
local format = format
local GetAddOnInfo = GetAddOnInfo or C_AddOns.GetAddOnInfo ---@diagnostic disable-line: deprecated
local ipairs = ipairs
local IsAddOnLoaded = IsAddOnLoaded or C_AddOns.IsAddOnLoaded ---@diagnostic disable-line: deprecated
local math = math
local next = next
local pairs = pairs
local table = table
local tonumber = tonumber
local type = type

local addonName = ... ---@type string
local addon = CreateFrame("Frame") ---@class AddOnFrame : Frame
addon:SetScript("OnEvent", function(self, event, ...) self[event](self, event, ...) end)

-- variables
local MAX_BATTLE_TABS = 10 -- 8 to 10 for most natural results
local MAX_ACTIVE_PETS = 3 -- AddOns/Blizzard_Collections/Blizzard_PetCollection.lua:2
local HEAL_PET_SPELL = 125439 -- AddOns/Blizzard_Collections/Blizzard_PetCollection.lua:6
local BATTLEPETTABSFLYOUT_BORDERWIDTH = 0
local BATTLEPETTABSFLYOUT_ITEM_HEIGHT = 35
local BATTLEPETTABSFLYOUT_ITEM_WIDTH = 35
local BATTLEPETTABSFLYOUT_ITEM_XOFFSET = 4
local BATTLEPETTABSFLYOUT_ITEM_YOFFSET = -6
local BATTLEPETTABSFLYOUT_ITEMS_PER_ROW = 5
local BATTLEPETTABSFLYOUT_MAX_ITEMS = 65
local FLYOUT_COMMAND_NEW = 1
local FLYOUT_COMMAND_MOVETO = 2
local FLYOUT_COMMAND_RENAME = 3
local FLYOUT_COMMAND_DELETE = 4
local FLYOUT_COMMAND_TEAM = 5

-- the recheck ticker handle to avoid bubbling events
local RECHECK_TICKER

---@class AddOnDB
---@field public Teams TeamButton[]
---@field public Inactive TeamButton[]
---@field public Groups? any
---@field public LoadOutTeamIndex? number

-- load defaults or fallback to stored settings
---@type AddOnDB
BattlePetTabsDB3 = type(BattlePetTabsDB3) == "table" and BattlePetTabsDB3 or {
	Teams = {},
	Inactive = {},
	Groups = nil,
	LoadOutTeamIndex = nil,
}

-- temporary variables until the dependency addon loads
addon.PetJournalName = "Blizzard_Collections"
addon.NumLoaded = 0
addon.TeamButtonNamePrefix = "^" .. addonName .. "Team"

-- loads the UI once our addon and the pet journal have loaded
function addon:ADDON_LOADED(event, name)
	if name == addonName then
		addon.NumLoaded = addon.NumLoaded + 1
		-- the journal was loaded before our addon
		if IsAddOnLoaded(addon.PetJournalName) then
			addon.NumLoaded = addon.NumLoaded + 1
		end
		-- check if Aurora is enabled
		local _, _, _, enabled = GetAddOnInfo("Aurora")
		addon.HasAurora = enabled
	elseif name == addon.PetJournalName then
		addon.NumLoaded = addon.NumLoaded + 1
	end
	if addon.NumLoaded >= 2 then
		addon.ADDON_LOADED = function() end
		addon.PetJournalName, addon.NumLoaded = nil, nil
		addon:UnregisterEvent(event)
		addon:CreateUI()
		addon:RegisterEvent("BATTLE_PET_CURSOR_CLEAR")
		addon:RegisterEvent("COMPANION_UPDATE")
		addon:RegisterEvent("MOUNT_CURSOR_CLEAR")
		addon:RegisterUnitEvent("UNIT_PET", "player")
	end
end

function addon:UPDATE()
	-- enable or disable the new/moveTo button depending if we reached the limit or not
	addon.Manager.flyout.new:SetEnabled(#BattlePetTabsDB3.Inactive < BATTLEPETTABSFLYOUT_MAX_ITEMS)
	addon.Manager.flyout.moveTo:SetEnabled(#BattlePetTabsDB3.Inactive < BATTLEPETTABSFLYOUT_MAX_ITEMS)

	-- teams
	for i, team in ipairs(addon.Teams) do
		local dbTeam = BattlePetTabsDB3.Teams[i]
		team.dbTeam = dbTeam
		if dbTeam then
			team.button:SetChecked(addon:IsTeamEquipped(dbTeam))
			team.icon:SetTexture(addon:GetTeamTexture(dbTeam))
			team:Show()
		elseif not addon.IsDraggingInactiveTeam then
			team.button:SetChecked(false)
			team.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			team:Hide()
		end
	end

	-- inactive teams
	for i, team in ipairs(addon.InactiveTeams) do
		local dbTeam = BattlePetTabsDB3.Inactive[i]
		team.dbTeam = dbTeam
		if dbTeam then
			team.checked:SetShown(addon:IsTeamEquipped(dbTeam))
			team.icon:SetTexture(addon:GetTeamTexture(dbTeam))
			team:Show()
		else
			team.checked:Hide()
			team.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")
			team:Hide()
		end
	end

	-- dragging a team
	if addon.IsDraggingTeam then
		if not addon.Manager.flyout:IsShown() then
			addon.Manager.button:Click()
		end
		addon.Manager.flyout.new:Hide()
		addon.Manager.flyout.moveTo:Show()
	else
		addon.Manager.flyout.new:Show()
		addon.Manager.flyout.moveTo:Hide()
	end

	-- dragging an inactive team
	if addon.IsDraggingInactiveTeam then
		for i, team in ipairs(addon.Teams) do
			if not team.dbTeam then
				team.icon:SetTexture("Interface\\Icons\\Misc_ArrowLeft")
				team:Show()
				break
			end
		end
	end

	-- force update the hover tooltip if we're hovering over our team button
	local focus ---@type TeamButton?
	if GetMouseFocus then
		---@diagnostic disable-next-line: assign-type-mismatch
		focus = GetMouseFocus() ---@type TeamButton?
	else
		---@diagnostic disable-next-line: undefined-global
		focus = GetMouseFoci()[1]
	end
	if focus and not focus:IsForbidden() and strfind(focus:GetDebugName(), addon.TeamButtonNamePrefix) then
		local frame = focus
		while frame do
			---@diagnostic disable-next-line: assign-type-mismatch
			local test = frame:GetParent() ---@type TeamButton?
			if not test then
				break
			end
			if not strfind(test:GetDebugName(), addon.TeamButtonNamePrefix) then
				break
			end
			frame = test
		end
		if not frame:IsForbidden() and frame:IsMouseOver() and frame:GetParent() == addon.Container then
			addon.Widget.PetButton.OnEnter(frame.button)
		end
	end
end

-- additional events that trigger updates
addon.BATTLE_PET_CURSOR_CLEAR = addon.UPDATE
addon.COMPANION_UPDATE = addon.UPDATE
addon.CURSOR_UPDATE = addon.UPDATE -- TODO: DF
addon.MOUNT_CURSOR_CLEAR = addon.UPDATE
addon.UNIT_PET = addon.UPDATE

-- create the addon UI
function addon:CreateUI()
	-- setup the container
	addon.Container = CreateFrame("Frame", addonName .. "Frame", PetJournal) ---@class BattlePetTabsContainer : Frame
	addon.Container:SetParent(PetJournal)
	addon.Container:SetSize(42, 50)
	addon.Container:ClearAllPoints()
	addon.Container:SetPoint("TOPLEFT", "$parent", "TOPRIGHT", addon.HasAurora and 3 or -1, MAX_BATTLE_TABS > 8 and 24 or -17)
	addon.Container:SetScript("OnShow", addon.Widget.Container.OnShow)

	-- setup the manager button
	addon.Manager = addon:CreatePetButton(0) ---@class TeamButton
	addon.Manager:SetParent(addon.Container)
	addon.Manager:ClearAllPoints()
	addon.Manager:SetPoint("TOPLEFT", "$parent", "BOTTOMLEFT")
	addon.Manager.icon:SetTexture("Interface\\Icons\\INV_Pet_Achievement_CaptureAWildPet")
	addon.Manager.button:SetScript("OnClick", addon.Widget.Manager.OnClick)
	addon.Manager.button:SetScript("OnEnter", addon.Widget.Manager.OnEnter)
	addon.Manager.button:SetScript("OnLeave", addon.Widget.Manager.OnLeave)
	addon.Manager.button:SetScript("OnDragStart", nil) ---@diagnostic disable-line: param-type-mismatch
	addon.Manager.button:SetScript("OnDragStop", nil) ---@diagnostic disable-line: param-type-mismatch
	addon.Manager.button:SetScript("OnReceiveDrag", nil) ---@diagnostic disable-line: param-type-mismatch

	-- setup the manager flyout
	addon.Manager.flyout = addon:CreateFlyout(addon.Manager) ---@class FlyoutFrame

	-- add new team button
	addon.Manager.flyout.new = addon.Manager.flyout:CreateButton(FLYOUT_COMMAND_NEW)

	-- add move to team button
	addon.Manager.flyout.moveTo = addon.Manager.flyout:CreateButton(FLYOUT_COMMAND_MOVETO)
	addon.Manager.flyout.moveTo:ClearAllPoints()
	addon.Manager.flyout.moveTo:SetAllPoints(addon.Manager.flyout.new)

	-- add padding
	for i = 1, BATTLEPETTABSFLYOUT_ITEMS_PER_ROW - 2 do
		addon.Manager.flyout:CreateButton():Hide()
	end

	-- add inactive teams
	addon.InactiveTeams = {}
	for i = 1, BATTLEPETTABSFLYOUT_MAX_ITEMS do
		local team = addon.Manager.flyout:CreateButton(FLYOUT_COMMAND_TEAM)
		team:SetID(i)
		table.insert(addon.InactiveTeams, team)
	end

	-- create team buttons
	addon.Teams = {}
	for i = 1, MAX_BATTLE_TABS do
		local team = addon:CreatePetButton(i)
		team:SetID(i)
		team:SetParent(addon.Container)
		team:ClearAllPoints()
		team:SetPoint("TOPLEFT", addon.Teams[#addon.Teams] or addon.Manager, "BOTTOMLEFT")
		team.icon:SetTexture("Interface\\Icons\\INV_Misc_QuestionMark")

		-- setup the team flyout
		team.flyout = addon:CreateFlyout(team) ---@class FlyoutFrame

		-- create team flyout buttons
		team.flyout.rename = team.flyout:CreateButton(FLYOUT_COMMAND_RENAME)
		team.flyout.delete = team.flyout:CreateButton(FLYOUT_COMMAND_DELETE)

		table.insert(addon.Teams, team)
	end

	-- create rename static popup
	StaticPopupDialogs[addonName .. "_TEAM_RENAME"] = {
		text = "",
		button1 = ACCEPT,
		button2 = CANCEL,
		hasEditBox = 1,
		maxLetters = 32,
		OnAccept = function(self, team)
			local text = self.editBox:GetText()
			if type(text) == "string" and text:len() > 0 then
				team.name = text
			end
		end,
		EditBoxOnEnterPressed = function(self, team)
			local text = self:GetParent().editBox:GetText()
			if type(text) == "string" and text:len() > 0 then
				team.name = text
			end
			self:GetParent():Hide()
		end,
		EditBoxOnEscapePressed = function(self)
			self:GetParent():Hide()
		end,
		OnShow = function(self, team)
			self.text:SetFormattedText("What do you want to rename \"%s\" to?", team.name or "Team")
			self.editBox:SetFocus()
		end,
		OnHide = function(self)
			self.editBox:SetText("")
			addon:UPDATE()
		end,
		timeout = 0,
		exclusive = 1,
		whileDead = 1,
		hideOnEscape = 1
	}

	-- create delete static popup
	StaticPopupDialogs[addonName .. "_TEAM_DELETE"] = {
		text = "",
		button1 = DELETE,
		button2 = CANCEL,
		OnAccept = function(self, temp)
			local team, collection, index = temp[1], temp[2], temp[3]
			if collection then
				if index and collection[index] == team then
					table.remove(collection, index)
				else
					for k, v in ipairs(collection) do
						if v == team then
							table.remove(collection, k)
							break
						end
					end
				end
			end
		end,
		OnShow = function(self, temp)
			local team = temp[1]
			self.text:SetFormattedText("Do you want to delete the team \"%s\"?", team.name or "Team")
		end,
		OnHide = function(self)
			addon:UPDATE()
		end,
		timeout = 0,
		exclusive = 1,
		whileDead = 1,
		hideOnEscape = 1
	}
end

-- create pet button
function addon:CreatePetButton(id)
	local frame = CreateFrame("Frame", addonName .. "Team" .. id) ---@class TeamButton : Frame
	frame:SetSize(42, 50)
	frame:SetPoint("TOPLEFT")

	frame.background = frame:CreateTexture(nil, "BACKGROUND")
	frame.background:SetTexture("Interface\\GuildBankFrame\\UI-GuildBankFrame-Tab")
	frame.background:SetSize(64, 64)
	frame.background:SetPoint("TOPLEFT")
	frame.background:SetShown(not addon.HasAurora)

	frame.button = CreateFrame("CheckButton", nil, frame)
	frame.button:SetSize(36, 34)
	frame.button:SetPoint("TOPLEFT", 2, -8)
	frame.button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	frame.button:RegisterForDrag("LeftButton")
	frame.button:SetMotionScriptsWhileDisabled(true)

	frame.button:SetScript("OnClick", addon.Widget.PetButton.OnClick)
	frame.button:SetScript("OnDragStart", addon.Widget.PetButton.OnDragStart)
	frame.button:SetScript("OnDragStop", addon.Widget.PetButton.OnDragStop)
	frame.button:SetScript("OnReceiveDrag", addon.Widget.PetButton.OnReceiveDrag)
	frame.button:SetScript("OnEnter", addon.Widget.PetButton.OnEnter)
	frame.button:SetScript("OnLeave", addon.Widget.PetButton.OnLeave)

	-- frame.button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
	frame.button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	frame.button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
	local highlight = frame.button:CreateTexture(nil, "BORDER")
	highlight:SetTexture("Interface\\Buttons\\CheckButtonHilight")
	highlight:SetBlendMode("ADD")
	frame.button:SetCheckedTexture(highlight)

	frame.icon = frame.button:CreateTexture(nil, "BORDER")
	frame.icon:SetPoint("TOPLEFT", 1, -1)
	frame.icon:SetPoint("BOTTOMRIGHT", -1, 1)
	frame.icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	frame.icon:SetTexture("Interface\\Icons\\Temp")

	frame.count = frame.button:CreateFontString(nil, "BORDER", "NumberFontNormal")
	frame.count:SetJustifyH("RIGHT")
	frame.count:SetPoint("BOTTOMRIGHT", -5, 2)

	frame.overlay = frame.button:CreateTexture(nil, "ARTWORK", nil, -4)
	frame.overlay:SetAllPoints()
	frame.overlay:SetColorTexture(0, 0, 0, 0.8)
	frame.overlay:Hide()

	return frame
end

-- create flyout frame
function addon:CreateFlyout(parent)
	local frame = CreateFrame("Frame", "$parentFlyout", parent or UIParent) ---@class FlyoutFrame : Frame
	frame:Hide()
	frame:SetPoint("TOPLEFT", "$parent", "TOPRIGHT", 0, -8)
	frame:SetSize(1, 1) -- otherwise it's invisible

	frame:SetScript("OnShow", addon.Widget.Flyout.OnShow)
	frame:SetScript("OnHide", addon.Widget.Flyout.OnHide)
	frame:SetScript("OnUpdate", addon.Widget.Flyout.OnUpdate)

	frame.CreateButton = addon.Widget.Flyout.CreateButton
	frame.GetButton = addon.Widget.Flyout.GetButton

	return frame
end

-- pickup team when dragging
function addon:DraggingPickupTeam(team)
	ClearCursor()
	if type(team) == "table" then
		local _, firstPet = next(team)
		if firstPet and firstPet[1] then
			C_PetJournal.PickupPet(firstPet[1])
		end
	end
end

-- move pet from one location to another
function addon:MoveTo(src, dst)
	if not src or not dst then
		return -- both must exist
	elseif src == dst then
		return -- pointless to move to the same location
	elseif dst.command == FLYOUT_COMMAND_NEW then
		return -- can't move to the new button
	end

	-- team variables
	local srcIsInactive, srcTeam, srcIndex = not not src.command, src.dbTeam, nil
	local dstIsInactive, dstTeam, dstIndex = not not dst.command, dst.dbTeam, nil

	-- active teams
	for i, team in ipairs(BattlePetTabsDB3.Teams) do
		if not srcIndex and not srcIsInactive and team == srcTeam then
			srcIndex = i
		end
		if not dstIndex and not dstIsInactive and team == dstTeam then
			dstIndex = i
		end
		if srcIndex and dstIndex then
			break
		end
	end

	-- inactive teams
	if not srcIndex or not dstIndex then
		for i, team in ipairs(BattlePetTabsDB3.Inactive) do
			if not srcIndex and srcIsInactive and team == srcTeam then
				srcIndex = i
			end
			if not dstIndex and dstIsInactive and team == dstTeam then
				dstIndex = i
			end
			if srcIndex and dstIndex then
				break
			end
		end
	end

	-- DEBUG
	--print("S", srcTeam and "Y" or "N", srcIndex, "D", dstTeam and "Y" or "N", dstIndex, "C", dst.command, "")

	-- logic
	if srcIsInactive and dstIsInactive then
		-- swap two inactive teams
		if srcIndex and dstIndex then
			-- don't swap, actually push the team in front the destination team and shift everything else back one slot
			local team = table.remove(BattlePetTabsDB3.Inactive, srcIndex)
			table.insert(BattlePetTabsDB3.Inactive, dstIndex, team)
			-- local teamA = BattlePetTabsDB3.Inactive[srcIndex]
			-- local teamB = BattlePetTabsDB3.Inactive[dstIndex]
			-- BattlePetTabsDB3.Inactive[srcIndex] = teamB
			-- BattlePetTabsDB3.Inactive[dstIndex] = teamA
		end
	elseif not srcIsInactive and not dstIsInactive then
		-- swap two active teams
		if srcIndex and dstIndex then
			local teamA = BattlePetTabsDB3.Teams[srcIndex]
			local teamB = BattlePetTabsDB3.Teams[dstIndex]
			BattlePetTabsDB3.Teams[srcIndex] = teamB
			BattlePetTabsDB3.Teams[dstIndex] = teamA
		end
	elseif srcIsInactive and not dstIsInactive then
		-- swap an inactive team with an active one
		if srcIndex and dstIndex then
			local teamA = BattlePetTabsDB3.Inactive[srcIndex]
			local teamB = BattlePetTabsDB3.Teams[dstIndex]
			BattlePetTabsDB3.Inactive[srcIndex] = teamB
			BattlePetTabsDB3.Teams[dstIndex] = teamA
		-- activate an inactive team
		elseif srcIndex and not dstIndex then
			-- only if we have space for an additional active team
			if #BattlePetTabsDB3.Teams < MAX_BATTLE_TABS then
				local team = table.remove(BattlePetTabsDB3.Inactive, srcIndex)
				table.insert(BattlePetTabsDB3.Teams, team)
			end
		end
	elseif not srcIsInactive and dstIsInactive then
		-- swap an active team with an inactive one
		if srcIndex and dstIndex then
			local teamA = BattlePetTabsDB3.Teams[srcIndex]
			local teamB = BattlePetTabsDB3.Inactive[dstIndex]
			BattlePetTabsDB3.Teams[srcIndex] = teamB
			BattlePetTabsDB3.Inactive[dstIndex] = teamA
		-- deactivate an active team
		elseif srcIndex and not dstIndex then
			-- only if we have space for an additional active team
			if #BattlePetTabsDB3.Inactive < BATTLEPETTABSFLYOUT_MAX_ITEMS then
				local team = table.remove(BattlePetTabsDB3.Teams, srcIndex)
				table.insert(BattlePetTabsDB3.Inactive, team)
			end
		end
	end

	-- force update the UI
	addon:UPDATE()
end

-- can copy loadout
function addon:CanCopyLoadout()
	if not IsSpellKnown(HEAL_PET_SPELL) or not C_PetJournal.IsJournalUnlocked() or C_PetBattles.IsInBattle() then
		return false -- we don't know how to use the pets, the journal is locked, or we are in a battle
	end

	for i = 1, MAX_ACTIVE_PETS do
		if C_PetJournal.GetPetLoadOutInfo(i) then
			return true
		end
	end

	return false
end

-- copy loadout
function addon:CopyLoadout()
	local team = {}
	team.name = "Team"

	for i = 1, MAX_ACTIVE_PETS do
		local petID, ability1ID, ability2ID, ability3ID, locked = C_PetJournal.GetPetLoadOutInfo(i)

		if petID then
			table.insert(team, {petID, ability1ID, ability2ID, ability3ID})
		end
	end

	return team
end

-- rename team
function addon:RenameTeam(team)
	assert(type(team) == "table", "BattlePetTabs:RenameTeam(team) expected first argument to be a table")
	StaticPopup_Show(addonName .. "_TEAM_RENAME", nil, nil, team)
end

-- delete team
function addon:DeleteTeam(team, tbr, tbi)
	assert(type(team) == "table", "BattlePetTabs:DeleteTeam(team) expected first argument to be a table")
	StaticPopup_Show(addonName .. "_TEAM_DELETE", nil, nil, { team, tbr, tbi })
end

-- find a team index from the active teams
function addon:GetTeamIndex(team, fallback)
	for i, t in ipairs(BattlePetTabsDB3.Teams) do
		if t == team then
			return i
		end
	end
	if fallback then
		return BattlePetTabsDB3.Teams[1] and 1 or 0
	end
end

-- equip a team
function addon:EquipTeamLoadout(team)
	addon.EquippedLoadOut = team
	addon.LoadingLoadOut = true

	if type(team) == "table" then
		local recheck

		for i = 1, MAX_ACTIVE_PETS do
			local equippedPetID, equippedAbility1ID, equippedAbility2ID, equippedAbility3ID, locked = C_PetJournal.GetPetLoadOutInfo(i)
			local pet = team[i]

			if type(pet) == "table" then
				if not locked then
					local petID, ability1ID, ability2ID, ability3ID = pet[1], pet[2], pet[3], pet[4]
					local petExists = C_PetJournal.GetPetInfoByPetID(petID)

					if petExists then
						if equippedPetID ~= petID then
							C_PetJournal.SetPetLoadOutInfo(i, petID)
							recheck = true
						else
							if equippedAbility1ID ~= ability1ID then
								C_PetJournal.SetAbility(i, 1, ability1ID)
								recheck = true
							end
							if equippedAbility2ID ~= ability2ID then
								C_PetJournal.SetAbility(i, 2, ability2ID)
								recheck = true
							end
							if equippedAbility3ID ~= ability3ID then
								C_PetJournal.SetAbility(i, 3, ability3ID)
								recheck = true
							end
						end
					end
				end
			end
		end

		-- if not all pets or abilities were loaded we will check again really soon
		if recheck then
			if RECHECK_TICKER then
				RECHECK_TICKER:Cancel()
			end
			RECHECK_TICKER = C_Timer.NewTimer(.1, function()
				if InCombatLockdown() then return end
				addon:EquipTeamLoadout(team)
			end)
		end

		-- update the pet journal UI
		if not InCombatLockdown() then
			PetJournal_UpdatePetLoadOut()
		end
	end

	addon.LoadingLoadOut = nil
end

-- is team equipped
function addon:IsTeamEquipped(team)
	if not team or type(team) ~= "table" then
		return false
	end
	for i = 1, MAX_ACTIVE_PETS do
		local pet = team[i]
		if type(pet) ~= "table" then
			return i > 1
		end
		local equippedPetID, equippedAbility1ID, equippedAbility2ID, equippedAbility3ID, locked = C_PetJournal.GetPetLoadOutInfo(i)
		local petID, ability1ID, ability2ID, ability3ID = pet[1], pet[2], pet[3], pet[4]
		local petExists = C_PetJournal.GetPetInfoByPetID(petID)
		if petExists then
			if equippedPetID ~= petID then
				return false
			end
			if equippedAbility1ID ~= ability1ID then
				return false
			end
			if equippedAbility2ID ~= ability2ID then
				return false
			end
			if equippedAbility3ID ~= ability3ID then
				return false
			end
		end
	end
	return true
end

-- get team texture
function addon:GetTeamTexture(team)
	local texture = "Interface\\Icons\\INV_Misc_QuestionMark"
	if type(team) == "table" then
		local _, firstPet, petTexture = next(team)
		if firstPet and firstPet[1] then
			_, _, _, _, _, _, _, _, petTexture = C_PetJournal.GetPetInfoByPetID(firstPet[1])
			texture = petTexture or texture
		end
	end
	return texture
end

-- get team tooltip string
function addon:GetTeamTooltipString(team)
	if type(team) == "table" then
		local lines = ""

		for i = 1, #team do
			local pet = team[i]

			if type(pet) == "table" then
				local petID, ability1ID, ability2ID, ability3ID = pet[1], pet[2], pet[3], pet[4]
				local speciesID, customName, level, xp, maxXp, displayID, isFavorite, name, icon, petType, creatureID, sourceText, description, isWild, canBattle, tradable, unique = C_PetJournal.GetPetInfoByPetID(petID)

				if speciesID then
					local health, maxHealth, power, speed, rarity = C_PetJournal.GetPetStats(petID)
					local color = ITEM_QUALITY_COLORS[rarity - 1]

					lines = lines .. "L" .. level .. " "
					lines = lines .. "|T" .. icon .. ":-1:-1|t "
					lines = lines .. color.hex .. (customName or name) .. "|r "
					lines = lines .. format("|cff00FF00%d|r/|cff00FFFF%d|r/|cffFFFF00%d|r", health/maxHealth*100, power, speed) .. " "
					lines = lines .. "\n"
				end
			end
		end

		lines = lines:sub(1, lines:len() - 1)

		if lines ~= "" then
			return "\n" .. lines
		end
	end
end

-- widget handlers
do
	addon.Widget = {}

	-- hide all flyouts and uncheck all buttons
	addon.Widget.HideFlyouts = function(button)
		if addon.Manager.button ~= button then
			addon.Manager.button:SetChecked(false)
			addon.Manager.flyout:Hide()
		end

		for _, team in pairs(addon.Teams) do
			if team.button ~= button then
				team.button:SetChecked(false)
				team.flyout:Hide()
			end
			if addon:IsTeamEquipped(team) then
				team.button:SetChecked(true)
			end
		end
	end

	-- tooltip handlers
	do
		addon.Tooltip = {}

		local tooltip = GameTooltip -- CreateFrame("GameTooltip", addonName .. "Tooltip", WorldFrame, "GameTooltipTemplate")

		function addon.Tooltip:Show(frame, lines)
			tooltip:SetOwner(frame, "ANCHOR_RIGHT")
			if type(lines) == "string" then
				tooltip:AddLine(lines, 1, 1, 1)
			elseif type(lines) == "table" then
				for _, line in ipairs(lines) do
					tooltip:AddLine(line, 1, 1, 1)
				end
			end
			tooltip:Show()
		end

		function addon.Tooltip:Hide()
			tooltip:Hide()
		end
	end

	-- container handlers
	do
		addon.Widget.Container = {}

		function addon.Widget.Container.OnShow(self)
			addon.Widget.HideFlyouts()
			addon:DraggingPickupTeam()

			addon.IsDraggingTeam = nil
			addon.IsDraggingInactiveTeam = nil

			addon:UPDATE()
		end
	end

	-- manager handlers
	do
		addon.Widget.Manager = {}

		function addon.Widget.Manager.OnClick(self)
			addon.Widget.HideFlyouts(self)

			if self:GetChecked() then
				self:GetParent().flyout:Show()
			else
				self:GetParent().flyout:Hide()
			end
		end

		function addon.Widget.Manager.OnEnter(self)
			if not addon.IsDraggingInactiveTeam then
				addon.Tooltip:Show(self, addonName)
			end
		end

		function addon.Widget.Manager.OnLeave(self)
			addon.Tooltip:Hide()
		end
	end

	-- pet button handlers
	do
		addon.Widget.PetButton = {}

		function addon.Widget.PetButton.OnClick(self, button)
			addon.Widget.HideFlyouts(self)

			if button == "RightButton" then
				addon:EquipTeamLoadout(self:GetParent().dbTeam)
				self:SetChecked(true)

				if self:GetChecked() then
					self:GetParent().flyout:Show()
				else
					self:GetParent().flyout:Hide()
				end
			else
				self:GetParent().flyout:Hide()
				self:SetChecked(false)

				addon:EquipTeamLoadout(self:GetParent().dbTeam)
			end

			addon:UPDATE()
		end

		function addon.Widget.PetButton.OnDragStart(self)
			self:LockHighlight()
			self:GetParent().flyout:Hide()

			addon.IsDraggingTeam = self:GetParent()
			addon:DraggingPickupTeam(self:GetParent().dbTeam)
			addon:UPDATE()
		end

		function addon.Widget.PetButton.OnDragStop(self)
			self:UnlockHighlight()

			addon:DraggingPickupTeam()
			addon:UPDATE()

			C_Timer.After(.01, function()
				addon.IsDraggingTeam = nil
				addon:UPDATE()
			end)
		end

		function addon.Widget.PetButton.OnReceiveDrag(self)
			if addon.IsDraggingInactiveTeam then
				addon:MoveTo(addon.IsDraggingInactiveTeam, self:GetParent())
			elseif addon.IsDraggingTeam then
				addon:MoveTo(addon.IsDraggingTeam, self:GetParent())
			end

			addon.IsDraggingInactiveTeam = nil
			addon.IsDraggingTeam = nil
			addon:UPDATE()
		end

		function addon.Widget.PetButton.OnEnter(self)
			if addon.IsDraggingInactiveTeam then
				addon.DraggedTeamTo = self
				if self.dbTeam then
					addon.Tooltip:Show(self, {self.dbTeam and self.dbTeam.name or "Team", "Release to swap with this team."})
				else
					addon.Tooltip:Show(self, {"Team", "Release to place team on this slot."})
				end
			else
				local dbTeam = self:GetParent().dbTeam
				local lines = {dbTeam and dbTeam.name or "Team", "Left-click to equip as current loadout.", "Right-click for additional options.", "Drag to move team."}
				local tooltip = addon:GetTeamTooltipString(dbTeam)
				if tooltip then
					table.insert(lines, tooltip)
				end
				addon.Tooltip:Show(self, lines)
			end
		end

		function addon.Widget.PetButton.OnLeave(self)
			addon.Tooltip:Hide()
		end
	end

	-- flyout handlers
	do
		addon.Widget.Flyout = {}

		function addon.Widget.Flyout.OnShow(self)
		end

		function addon.Widget.Flyout.OnHide(self)
		end

		function addon.Widget.Flyout.OnUpdate(self)
		end

		function addon.Widget.Flyout.CreateButton(self, command)
			local numButtons = #self
			local buttonIndex = numButtons + 1

			local button = CreateFrame("CheckButton", "$parent" .. buttonIndex, self) ---@class FlyoutCheckButton : CheckButton
			button.command = command
			button:SetSize(BATTLEPETTABSFLYOUT_ITEM_WIDTH, BATTLEPETTABSFLYOUT_ITEM_HEIGHT)
			button:RegisterForClicks("LeftButtonUp", "RightButtonUp")
			button:RegisterForDrag("LeftButton")
			button:SetMotionScriptsWhileDisabled(true)

			local position = numButtons / BATTLEPETTABSFLYOUT_ITEMS_PER_ROW
			if position == math.floor(position) then
				button:SetPoint("TOPLEFT", self, "TOPLEFT", BATTLEPETTABSFLYOUT_BORDERWIDTH, -BATTLEPETTABSFLYOUT_BORDERWIDTH - (BATTLEPETTABSFLYOUT_ITEM_HEIGHT - BATTLEPETTABSFLYOUT_ITEM_YOFFSET) * position)
			else
				button:SetPoint("TOPLEFT", self[numButtons], "TOPRIGHT", BATTLEPETTABSFLYOUT_ITEM_XOFFSET, 0)
			end

			button:SetScript("OnShow", addon.Widget.Flyout.Button.OnShow)
			button:SetScript("OnUpdate", addon.Widget.Flyout.Button.OnUpdate)
			button:SetScript("OnClick", addon.Widget.Flyout.Button.OnClick)
			button:SetScript("OnDragStart", addon.Widget.Flyout.Button.OnDragStart)
			button:SetScript("OnDragStop", addon.Widget.Flyout.Button.OnDragStop)
			button:SetScript("OnReceiveDrag", addon.Widget.Flyout.Button.OnReceiveDrag)
			button:SetScript("OnEnter", addon.Widget.Flyout.Button.OnEnter)
			button:SetScript("OnLeave", addon.Widget.Flyout.Button.OnLeave)

			-- button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
			button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
			button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
			local highlight = button:CreateTexture(nil, "BORDER")
			highlight:SetTexture("Interface\\Buttons\\CheckButtonHilight")
			highlight:SetBlendMode("ADD")
			button:SetCheckedTexture(highlight)

			button.icon = button:CreateTexture(nil, "BORDER")
			button.icon:SetPoint("TOPLEFT", 1, -1)
			button.icon:SetPoint("BOTTOMRIGHT", -1, 1)
			button.icon:SetTexCoord(.1, .9, .1, .9)
			button.icon:SetTexture("Interface\\Icons\\Temp")

			button.count = button:CreateFontString(nil, "BORDER", "NumberFontNormal")
			button.count:SetJustifyH("RIGHT")
			button.count:SetPoint("BOTTOMRIGHT", -5, 2)

			button.overlay = button:CreateTexture(nil, "ARTWORK", nil, -4)
			button.overlay:SetAllPoints()
			button.overlay:SetColorTexture(0, 0, 0, 0.8)
			button.overlay:Hide()

			button.checked = button:CreateTexture(nil, "ARTWORK", nil, -3)
			button.checked:SetAllPoints()
			button.checked:SetTexture("Interface\\Buttons\\CheckButtonHilight")
			button.checked:SetBlendMode("ADD")
			button.checked:Hide()

			table.insert(self, button)
			return button
		end

		function addon.Widget.Flyout.GetButton(self)
			local button

			for i = 1, #self do
				local b = self[i]

				if not b:IsShown() then
					button = b
					break
				end
			end

			if not button then
				button = self:CreateButton()
				button:SetID(#self + 1)
			end

			return button
		end

		-- flyout button handlers
		do
			addon.Widget.Flyout.Button = {}

			function addon.Widget.Flyout.Button.OnShow(self)
				if self.command == FLYOUT_COMMAND_NEW then
					self.icon:SetTexture("Interface\\GuildBankFrame\\UI-GuildBankFrame-NewTab")
				elseif self.command == FLYOUT_COMMAND_MOVETO then
					self.icon:SetTexture("Interface\\Icons\\Misc_ArrowDown")
				elseif self.command == FLYOUT_COMMAND_RENAME then
					self.icon:SetTexture("Interface\\Icons\\INV_Scroll_02")
				elseif self.command == FLYOUT_COMMAND_DELETE then
					self.icon:SetTexture("Interface\\Icons\\INV_Misc_Bone_HumanSkull_01")
				end
			end

			function addon.Widget.Flyout.Button.OnUpdate(self)
				if self.command == FLYOUT_COMMAND_NEW then
					local disabled = not addon:CanCopyLoadout()
					self.icon:SetDesaturated(disabled)
					-- self:SetButtonState("NORMAL", not disabled) -- disables the OnClick
				end
			end

			function addon.Widget.Flyout.Button.OnClick(self, button)
				self:SetChecked(false)

				if self.command == FLYOUT_COMMAND_NEW then
					if #BattlePetTabsDB3.Inactive < BATTLEPETTABSFLYOUT_MAX_ITEMS and addon:CanCopyLoadout() then
						local team = addon:CopyLoadout()
						table.insert(BattlePetTabsDB3.Inactive, team)
					end

				elseif self.command == FLYOUT_COMMAND_RENAME then
					local dbTeam = self:GetParent():GetParent().dbTeam
					if dbTeam then
						addon:RenameTeam(dbTeam)
					end

				elseif self.command == FLYOUT_COMMAND_DELETE then
					local dbTeam = self:GetParent():GetParent().dbTeam
					for i, team in ipairs(BattlePetTabsDB3.Teams) do
						if team == dbTeam then
							addon:DeleteTeam(team, BattlePetTabsDB3.Teams, i)
							break
						end
					end

				elseif self.command == FLYOUT_COMMAND_TEAM then
					if button == "RightButton" then
						for i, team in ipairs(BattlePetTabsDB3.Inactive) do
							if self.dbTeam == team then
								addon:DeleteTeam(team, BattlePetTabsDB3.Inactive, i)
								break
							end
						end
					elseif button == "LeftButton" then
						addon:EquipTeamLoadout(self.dbTeam)
					end
				end

				addon:UPDATE()
			end

			function addon.Widget.Flyout.Button.OnDragStart(self)
				if self.command == FLYOUT_COMMAND_TEAM then
					self:LockHighlight()

					addon.IsDraggingInactiveTeam = self
					addon:DraggingPickupTeam(self.dbTeam)
					addon:UPDATE()
				end
			end

			function addon.Widget.Flyout.Button.OnDragStop(self)
				if self.command == FLYOUT_COMMAND_TEAM then
					self:UnlockHighlight()

					addon:DraggingPickupTeam()
					addon:UPDATE()

					C_Timer.After(.01, function()
						addon.IsDraggingInactiveTeam = nil
						addon:UPDATE()
					end)
				end
			end

			function addon.Widget.Flyout.Button.OnReceiveDrag(self)
				if addon.IsDraggingInactiveTeam then
					addon:MoveTo(addon.IsDraggingInactiveTeam, self)
				elseif addon.IsDraggingTeam then
					addon:MoveTo(addon.IsDraggingTeam, self)
				end

				addon.IsDraggingInactiveTeam = nil
				addon.IsDraggingTeam = nil
				addon:UPDATE()
			end

			function addon.Widget.Flyout.Button.OnEnter(self)
				if self.command == FLYOUT_COMMAND_NEW then
					if not addon.IsDraggingInactiveTeam then
						if not addon:CanCopyLoadout() then
							addon.Tooltip:Show(self, {"New", "You are unable to use the Pet Journal at the moment."})
						elseif self:IsEnabled() then
							addon.Tooltip:Show(self, {"New", "Creates a copy of the current loadout."})
						else
							addon.Tooltip:Show(self, {"New", "Can't create additional teams.", "Delete unused teams to free up space."})
						end
					end
				elseif self.command == FLYOUT_COMMAND_MOVETO then
					if addon.IsDraggingTeam then
						if self:IsEnabled() then
							addon.Tooltip:Show(self, {"Deactivate", "Places the team with the other inactive teams."})
						else
							addon.Tooltip:Show(self, {"Deactivate", "Can't deactive team.", "Delete unused inactive teams to free up space."})
						end
					end
				elseif self.command == FLYOUT_COMMAND_RENAME then
					if not addon.IsDraggingInactiveTeam then
						addon.Tooltip:Show(self, "Rename")
					end
				elseif self.command == FLYOUT_COMMAND_DELETE then
					if not addon.IsDraggingInactiveTeam then
						addon.Tooltip:Show(self, "Delete") -- {"Delete", "This can't be undone."}
					end
				elseif self.command == FLYOUT_COMMAND_TEAM then
					if addon.IsDraggingInactiveTeam then
						addon.DraggedTeamTo = self
						addon.Tooltip:Show(self, {self.dbTeam and self.dbTeam.name or "Team", "Release to move team to this position."})
					else
						local lines = {self.dbTeam and self.dbTeam.name or "Team", "Drag to move team.", "Right-click to delete."}
						local tooltip = addon:GetTeamTooltipString(self.dbTeam)
						if tooltip then
							table.insert(lines, tooltip)
						end
						addon.Tooltip:Show(self, lines)
					end
				end
			end

			function addon.Widget.Flyout.Button.OnLeave(self)
				addon.Tooltip:Hide()
			end
		end
	end
end

-- update the current team when loadout is manually changed
do
	hooksecurefunc(C_PetJournal, "SetPetLoadOutInfo", function(slotIndex, petID)
		if not addon.LoadingLoadOut and addon.EquippedLoadOut and addon:CanCopyLoadout() then
			local loadout = addon:CopyLoadout()
			for i = 1, MAX_ACTIVE_PETS do
				addon.EquippedLoadOut[i] = loadout[i]
			end
		end
	end)

	hooksecurefunc(C_PetJournal, "SetAbility", function(slotIndex, abilityIndex, abilityID)
		if not addon.LoadingLoadOut and addon.EquippedLoadOut then
			addon.EquippedLoadOut[slotIndex][abilityIndex + 1] = abilityID
		end
	end)
end

-- attempt to block summoning pets when loading teams
do
	-- C_PetJournal.SetPetLoadOutInfo
	-- addon.LoadingLoadOut
end

-- gets the ball rolling
addon:RegisterEvent("ADDON_LOADED")
