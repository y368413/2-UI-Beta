local _, ns = ...
local M, R, U, I = unpack(ns)
local LSM = M:RegisterPlusModule("LootSpecManager")
----------------------------
-- Credit: LootSpecManager
----------------------------
LSM.Data = {
	Raid = {},
	MythicPlus = {},
}

LSM.CheckBoxes = {
	Raid = {},
	MythicPlus = {},
}

LSM.DiffNames = {
  [14] = "Normal",
  [15] = "Heroic",
  [16] = "Mythic",
  [17] = "LFR",
}

local SPACING = 24
local IGNORE = -1

local function GetEncounterList(instanceID)
	local list = { }
	local name, _, _, _, _, _, encounterID = EJ_GetEncounterInfoByIndex(1, instanceID)
	while name do
		tinsert(list, {name = name, id = encounterID})
		name, _, _, _, _, _, encounterID = EJ_GetEncounterInfoByIndex(#list + 1, instanceID)
	end
	return list
end

function LSM:UpdateRaidData()
	local maxTier = EJ_GetNumTiers()
	if EJ_GetCurrentTier() ~= maxTier then
		EJ_SelectTier(maxTier)
	end

	local index = 2
	local raidInstID, name = EJ_GetInstanceByIndex(index, true)
	while raidInstID do
		EJ_SelectInstance(raidInstID)
		local encounters = GetEncounterList(raidInstID)
		tinsert(LSM.Data.Raid, 1, {id = raidInstID, name = name, encounters = encounters})

		index = index + 1
		raidInstID, name = EJ_GetInstanceByIndex(index, true)
	end
end

function LSM:UpdateMythicPlusData()
	local index = 1
	local dungeonInstID, name = EJ_GetInstanceByIndex(index, false)
	while dungeonInstID do
		EJ_SelectInstance(dungeonInstID)
		local instanceID = select(8, EJ_GetEncounterInfoByIndex(1, dungeonInstID))
		tinsert(LSM.Data.MythicPlus, {id = instanceID, name = name})

		index = index + 1
		dungeonInstID, name = EJ_GetInstanceByIndex(index, false)
	end
end

function LSM:GetSpecIcons()
	local classID = select(3, UnitClass("player"))
	local specs = {}
	for i = 1, GetNumSpecializationsForClassID(classID) do
		local id, _, _, icon = GetSpecializationInfoForClassID(classID, i)
		if not id then break end

		tinsert(specs, {id = id, icon = icon})
	end
	return specs
end

function LSM:GetRaidSpec(encounter, diffID)
	local diffName = LSM.DiffNames[diffID]

	return LSM.db["Encounters"][diffName][encounter] or IGNORE
end

function LSM:GetSpecSetting(type, id)
	if type == "Raid" then
		return LSM.db["Encounters"][LSM.db.Current][id] or IGNORE
	elseif type == "MythicPlus" then
		return LSM.db["MythicPlus"][id] or IGNORE
	end
end

function LSM:SetSpecSetting(type, id, spec)
	if type == "Raid" then
		LSM.db["Encounters"][LSM.db.Current][id] = spec
	elseif type == "MythicPlus" then
		LSM.db["MythicPlus"][id] = spec
	end
end

function LSM:SetLootSpec(spec)
	if spec == IGNORE then
		return false
	end

	SetLootSpecialization(spec)
	return true
end

-- GUI
local function CreateSpecIcon(parent, icon, x)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(SPACING - 2, SPACING -2)
	frame:SetPoint("TOPRIGHT", parent, "TOPRIGHT", x, 0)

	local texture = frame:CreateTexture(nil, "ARTWORK")
	texture:SetTexture(icon)
	texture:SetAllPoints()
	M.ReskinIcon(texture)
	frame.icon = texture

    return frame
end

local function CreateHeader(parent, title, specs, y)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(parent:GetWidth(), SPACING)
	frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, y)

	frame.title = M.CreateFS(frame, 18, title, true, "LEFT", 10, 0)
	frame.ignore = CreateSpecIcon(frame, "Interface\\BUTTONS\\UI-GroupLoot-Pass-Up", -4)
	for i, spec in ipairs(specs) do
		frame["spec"..i] = CreateSpecIcon(frame, spec.icon, -4 - i * (SPACING + 4))
	end

	return frame
end

local function CreateCheckbox(parent, offset, id, spec, type)
	local box = M.CreateCheckBox(parent)
	box:SetPoint("TOPRIGHT", parent, "TOPRIGHT", offset, 0)
	box.Type = nil
	box.id = id
	box.spec = spec
	box:SetScript("OnClick", function(self)
		for _, bu in pairs(parent.buttons) do
			if bu ~= self then
				bu:SetChecked(false)
			end
		end
		LSM:SetSpecSetting(type, id, spec)
	end)

	tinsert(parent.buttons, box)
	tinsert(LSM.CheckBoxes[type], box)

	return box
end

local function CreateSubGroup(parent, y, specs, info, type)
	local frame = CreateFrame("Frame", nil, parent)
	frame:SetSize(parent:GetWidth(), SPACING)
	frame:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, y)
	frame.name = M.CreateFS(frame, 14, info.name, false, "LEFT", 30, 0)
	frame.buttons = {}

	frame.ignore = CreateCheckbox(frame, -2, info.id, IGNORE, type)
	for i, spec in ipairs(specs) do
		frame["spec"..i] = CreateCheckbox(frame, -2 - i * (SPACING + 4), info.id, spec.id, type)
	end

	return frame
end

function LSM:CreateGUI()
	if LSM.GUI then LSM.GUI:Show() return end

	local gui = CreateFrame("Frame", "NDuiPlus_LSMFrame", UIParent)
	tinsert(UISpecialFrames, "NDuiPlus_LSMFrame")
	gui:SetWidth(370)
	gui:SetHeight(505)
	gui:SetPoint("CENTER")
	gui:SetFrameStrata("HIGH")
	gui:SetFrameLevel(5)
	M.CreateMF(gui)
	M.SetBD(gui)
	M.CreateFS(gui, 18, "LootSpecManager", true, "TOP", 0, -10)

	local scroll = CreateFrame("ScrollFrame", nil, gui, "UIPanelScrollFrameTemplate")
	scroll:SetPoint("TOPLEFT", 0, -70)
	scroll:SetPoint("BOTTOMRIGHT", -30, 50)
	scroll.child = CreateFrame("Frame", nil, scroll)
	scroll.child:SetSize(340, 1)
	scroll:SetScrollChild(scroll.child)
	M.ReskinScroll(scroll.ScrollBar)

	local specs = LSM:GetSpecIcons()
	local offset = -5

	-- Raid
	for _, instance in ipairs(LSM.Data.Raid) do
		CreateHeader(scroll.child, instance.name, specs, offset)
		offset = offset - SPACING

		for _, boss in ipairs(instance.encounters) do
			CreateSubGroup(scroll.child, offset, specs, boss, "Raid")
			offset = offset - SPACING
		end

		offset = offset - 10
	end

	-- Mythic+
	CreateHeader(scroll.child, U["Mythic+"], specs, offset)
	offset = offset - SPACING

	for _, instance in ipairs(LSM.Data.MythicPlus) do
		CreateSubGroup(scroll.child, offset, specs, instance, "MythicPlus")
		offset = offset - SPACING
	end

	local close = M.CreateButton(gui, 80, 20, CLOSE)
	close:SetPoint("BOTTOMRIGHT", -20, 15)
	close:SetScript("OnClick", function()
		gui:Hide()
	end)
	gui.close = close

	local helpInfo = M.CreateHelpInfo(gui)
	helpInfo:SetPoint("TOPRIGHT", -5, -5)
	helpInfo.title = U["LootSpecManager"]
	M.AddTooltip(helpInfo, "ANCHOR_RIGHT", U["LootSpecManagerTips"], "info")
	gui.help = helpInfo

	local current = CreateFrame("Frame", nil, gui, "UIDropDownMenuTemplate")
	current:SetPoint("TOPLEFT", NDuiPlus_LSMFrame, "TOPLEFT", -5, -40)
	UIDropDownMenu_SetWidth(current, 100)
	--P.ReskinDropDown(current)
	UIDropDownMenu_Initialize(current, function()
		local function callback(self)
			LSM.db["Current"] = self.value
			LSM:RefreshGUI()
			UIDropDownMenu_SetSelectedValue(current, self.value)
    	end

		local function make_button(info, value, text)
			info.text = text
			info.value = value
			info.func = callback
			info.checked = false
			info.isNotRadio = false
			UIDropDownMenu_AddButton(info)
		end

		local info = UIDropDownMenu_CreateInfo()
		make_button(info, "Mythic", PLAYER_DIFFICULTY6)
		make_button(info, "Heroic", PLAYER_DIFFICULTY2)
		make_button(info, "Normal", PLAYER_DIFFICULTY1)
		make_button(info, "LFR", PLAYER_DIFFICULTY3)
	end)
	UIDropDownMenu_SetSelectedValue(current, LSM.db["Current"])
	gui.current = current

	LSM.GUI = gui
	LSM.GUI.CheckBoxes = LSM.CheckBoxes
	LSM:RefreshGUI()
end

function LSM:RefreshGUI()
	for type, checkboxes in pairs(LSM.CheckBoxes) do
		for _, cb in pairs(checkboxes) do
			cb:SetChecked(LSM:GetSpecSetting(type, cb.id) == cb.spec)
		end
	end
end

local defaultSettings = {
	Current = "Mythic",
	MythicPlus = {},
	Encounters = {
		Mythic = {},
		LFR = {},
		Heroic = {},
		Normal = {},
	},
}

function P_InitialSettings(source, target, fullClean)
	for i, j in pairs(source) do
		if type(j) == "table" then
			if target[i] == nil or type(target[i]) ~= "table" then target[i] = {} end
			for k, v in pairs(j) do
				if target[i][k] == nil then
					target[i][k] = v
				end
			end
		else
			if target[i] == nil then target[i] = j end
		end
	end

	for i, j in pairs(target) do
		if source[i] == nil then target[i] = nil end
		if fullClean and type(j) == "table" then
			for k, v in pairs(j) do
				if type(v) ~= "table" and source[i] and source[i][k] == nil then
					target[i][k] = nil
				end
			end
		end
	end
end

function LSM:SetupCache()
	LSM.db = MaoRUIPerDB["LootSpecManager"]
	P_InitialSettings(defaultSettings, LSM.db)
end

function LSM:EncounterStart(id, _, diffID)
	if C_ChallengeMode.GetActiveKeystoneInfo() ~= 0 then return end

	local spec = LSM:GetRaidSpec(id, diffID)
	if LSM:SetLootSpec(spec) then
		--P:Print(U["LootSpecManagerRaidStart"])
	end
end

function LSM:MythicPlusStart(id)
	local spec = LSM.db["MythicPlus"][id] or IGNORE
	if LSM:SetLootSpec(spec) then
		--P:Print(U["LootSpecManagerM+Start"])
	end
end

function LSM:UpdateData()
	wipe(LSM.Data.Raid)
	wipe(LSM.Data.MythicPlus)

	LSM:UpdateRaidData()
	LSM:UpdateMythicPlusData()
end

function P_CreateButton(width, height, color)
	local bu = CreateFrame("Button", nil, self, "UIPanelButtonTemplate")
	bu:SetSize(width, height)
	bu.Text:SetFont(I.Font[1], I.Font[2]+2, I.Font[3])
	bu.Text:SetWidth(width - 20)
	bu.Text:SetWordWrap(false)
	if color and type(color) == "boolean" then
		bu.Text:SetTextColor(I.r, I.g, I.b)
	else
		bu.Text:SetTextColor(1, 1, 1)
	end
	return bu
end

local function loadFunc(event, addon)
	if addon == "Blizzard_EncounterJournal" then
		local filter = _G.EncounterJournalEncounterFrameInfoLootScrollFrameFilterToggle
		local btn = P_CreateButton(filter, 75, 28, true)
		btn:SetPoint("BOTTOM", filter, "TOP", 0, 5)
		btn:SetText(U["Loot Spec"])
		btn.Text:SetFont(I.Font[1], 15, I.Font[3])
		btn.Text:SetWidth(75)
		btn:SetScript("OnClick", function()
			if LSM.GUI then
				M:TogglePanel(LSM.GUI)
			else
				LSM:CreateGUI()
			end
		end)

		M:UnregisterEvent(event, loadFunc)
	end
end

function LSM:OnLogin()
	--if not NDuiPlusDB["Misc"]["LootSpecManager"] then return end

	LSM:SetupCache()

	M:RegisterEvent("ADDON_LOADED", loadFunc)
	M:RegisterEvent("PLAYER_ENTERING_WORLD", LSM.UpdateData)
	M:RegisterEvent("ENCOUNTER_START", LSM.EncounterStart)
	M:RegisterEvent("CHALLENGE_MODE_START", LSM.MythicPlusStart)
end

SlashCmdList['NDUI_PLUS_LSM'] = function()
	--if not NDuiPlusDB["Misc"]["LootSpecManager"] then return end
	LSM:CreateGUI()
end
SLASH_NDUI_PLUS_LSM1 = "/lsm"