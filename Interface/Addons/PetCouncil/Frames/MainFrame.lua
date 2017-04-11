-------------------------------------------------------------- MainFrame.lua---- Abin-- 2012/12/18
------------------------------------------------------------Fix by Siweia for 7.0

local StaticPopup_Hide = StaticPopup_Hide
local IsModifiedClick = IsModifiedClick
local ChatEdit_InsertLink = ChatEdit_InsertLink
local StaticPopup_Show = StaticPopup_Show
local IsShiftKeyDown = IsShiftKeyDown
local type = type
local ipairs = ipairs
local strupper = strupper
local gsub = gsub
local GameTooltip = GameTooltip

local addonName, addon = ...
local L = addon.L

local selectedData

local frame, list

local function loadFrame()
	frame = UICreateInterfaceOptionPage("PetCouncilMainFrame", L["title"], nil, nil, PetJournal)
	addon.frame = frame

	frame:SetDialogStyle("DIALOG")
	frame.topClose:Hide()
	frame:SetBackdrop({ bgFile = "Interface\\FrameGeneral\\UI-Background-Marble", edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 16, insets = { left = 5, right = 5, top = 5, bottom = 5 } })
	frame:SetSize(310, 600)
	frame:SetPoint("TOPLEFT", PetJournal, "TOPRIGHT", 0, -24)
	frame:SetUserPlaced(true)
	frame:SetDontSavePosition(false)
	frame:SetClampedToScreen(true)
	frame:SetFrameStrata("HIGH")
	frame:Show()

	local function Child_OnDragStart(self)
		frame:StartMoving()
	end

	local function Child_OnDragStop(self)
		frame:StopMovingOrSizing()
	end

	local function RegisterForDrag(child)
		child:RegisterForDrag("LeftButton")
		child:SetScript("OnDragStart", Child_OnDragStart)
		child:SetScript("OnDragStop", Child_OnDragStop)
	end

	local panel = frame:CreatePanel(nil, 1)
	panel:SetPoint("TOPLEFT", 16, -42)
	panel:SetPoint("TOPRIGHT", -16, -42)
	panel:SetHeight(460)

	local function PressButton_OnClick(self, ...)
		StaticPopup_Hide("PETCOUNCIL_RENAME")
		if self.OnClick then
			self:OnClick(IsShiftKeyDown(), ...)
		end
	end

	local function CreatePressButton(text, point, relativeTo, relativePoint, x, y, tooltipText, enable)
		local button = frame:CreatePressButton(text)
		button:SetWidth(92)
		RegisterForDrag(button)
		if not enable then
			button:Disable()
		end

		button.tooltipTitle = text
		button.tooltipText = tooltipText
		button:SetScript("OnClick", PressButton_OnClick)
		button:SetPoint(point, relativeTo, relativePoint, x, y)
		return button
	end

	local addButton = CreatePressButton(ADD, "TOPLEFT", panel, "BOTTOMLEFT", 4, -8, L["tooltip add"], 1)
	local updateButton = CreatePressButton(UPDATE, "LEFT", addButton, "RIGHT", 0, 0, L["tooltip update"])
	local deleteButton = CreatePressButton(DELETE, "LEFT", updateButton, "RIGHT", 0, 0, L["tooltip delete"])
	local renameButton = CreatePressButton(L["rename"], "TOP", addButton, "BOTTOM", 0, 0, L["tooltip rename"])
	local upButton = CreatePressButton(TRACKER_SORT_MANUAL_UP, "TOP", updateButton, "BOTTOM", 0, 0, L["tooltip up"])
	local downButton = CreatePressButton(TRACKER_SORT_MANUAL_DOWN, "TOP", deleteButton, "BOTTOM", 0, 0, L["tooltip down"])

	list = UICreateVirtualScrollList(frame:GetName().."List", frame, 8, 1)
	addon.teamList = list

	list:SetPoint("TOPLEFT", panel, "TOPLEFT", 8, -8)
	list:SetPoint("BOTTOMRIGHT", panel, "BOTTOMRIGHT", -8, 8)

	function list:OnButtonCreated(button)
		button:SetHeight(50)
		RegisterForDrag(button)

		button.pet1 = addon:CreatePetButton(button, 1)
		button.pet1:SetPoint("TOPLEFT", 2, -2)
		RegisterForDrag(button.pet1)

		button.pet2 = addon:CreatePetButton(button, 2)
		button.pet2:SetPoint("LEFT", button.pet1, "RIGHT", 4, 0)
		RegisterForDrag(button.pet2)

		button.pet3 = addon:CreatePetButton(button, 3)
		button.pet3:SetPoint("LEFT", button.pet2, "RIGHT", 4, 0)
		RegisterForDrag(button.pet3)

		button.check = button:CreateTexture(nil, "BORDER")
		button.check:SetSize(32, 32)
		button.check:SetPoint("RIGHT", -6, 0)
		button.check:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")

		local name = button:CreateFontString(nil, "ARTWORK", "GameFontHighlightLeft")
		button.name = name
		name:SetPoint("TOPLEFT", button.pet3, "TOPRIGHT", 8, 0)
		name:SetPoint("BOTTOMRIGHT", -2, 4)
		name:SetFont(STANDARD_TEXT_FONT, 13)
		name:SetNonSpaceWrap(false)
	end

	function list:OnButtonUpdate(button, data)
		button.pet1:Update(data.pet1, data.pet1ability1, data.pet1ability2, data.pet1ability3)
		button.pet2:Update(data.pet2, data.pet2ability1, data.pet2ability2, data.pet2ability3)
		button.pet3:Update(data.pet3, data.pet3ability1, data.pet3ability2, data.pet3ability3)
		button.name:SetText(data.name or L["unnamed"])

		if addon:IsTeamActive(data) then
			button.check:Show()
		else
			button.check:Hide()
		end
	end

	function list:OnButtonTooltip(button, data)
		GameTooltip:AddLine(data.name or L["unnamed"])
		GameTooltip:AddLine(L["tooltip list double click"], 1, 1, 1, 1)
		GameTooltip:AddLine(L["tooltip list shift click"], 1, 1, 1, 1)
	end

	function list:OnSelectionChanged(position, data)
		StaticPopup_Hide("PETCOUNCIL_RENAME")
		selectedData = data

		if position then
			renameButton:Enable()
			deleteButton:Enable()
			updateButton:Enable()

			if position > 1 then
				upButton:Enable()
			else
				upButton:Disable()
			end

			if position < list:GetDataCount() then
				downButton:Enable()
			else
				downButton:Disable()
			end
		else
			renameButton:Disable()
			deleteButton:Disable()
			updateButton:Disable()
			upButton:Disable()
			downButton:Disable()
		end
	end

	function list:OnButtonClick(button, data, flag)
		StaticPopup_Hide("PETCOUNCIL_RENAME")
		if IsModifiedClick("CHATLINK") then
			ChatEdit_InsertLink((button.pet1.link or "")..(button.pet2.link or "")..(button.pet3.link or ""))
		end
	end

	function list:OnButtonDoubleClick(button, data)
		StaticPopup_Hide("PETCOUNCIL_RENAME")
		addon:SelectTeam(data)
	end

	list:RegisterEvent("PLAYER_ENTERING_WORLD")
	list:RegisterEvent("PET_JOURNAL_LIST_UPDATE")
	list:RegisterEvent("PET_JOURNAL_PET_DELETED")
	list:RegisterEvent("PET_JOURNAL_PETS_HEALED")
	list:RegisterEvent("PET_BATTLE_LEVEL_CHANGED")
	list:SetScript("OnEvent", list.RefreshContents)

	local function OnSelPetDetailChange()
		list:RefreshContents()
	end

	hooksecurefunc(C_PetJournal, "SetPetLoadOutInfo", OnSelPetDetailChange)
	hooksecurefunc(C_PetJournal, "SetAbility", OnSelPetDetailChange)

	local function RenameTeam(name)
		if not selectedData then
			return
		end

		name = strtrim(name or "")
		if name == "" or name == L["unnamed"] then
			name = nil
		end

		selectedData.name = name
		list:EnsureVisible()
		list:UpdateData()
	end

	StaticPopupDialogs["PETCOUNCIL_RENAME"] = {
		text = L["rename prompt"],
		button1 = OKAY,
		button2 = CANCEL,
		hasEditBox = 1,
		timeout = 0,
		exclusive = 1,
		whileDead = 1,
		hideOnEscape = 1,

		OnAccept = function(self)
			RenameTeam(self.editBox:GetText())
		end,

		EditBoxOnEnterPressed = function(self)
			self:GetParent():Hide()
			RenameTeam(self:GetText())
		end,

		EditBoxOnEscapePressed = function(self)
			self:GetParent():Hide()
		end,

		OnShow = function(self)
			self.editBox:SetText(selectedData and selectedData.name or L["unnamed"])
			self.editBox:SetFocus()
			self.editBox:HighlightText()
		end,
	}

	function addButton:OnClick(shiftDown)
		local team = {}
		addon:UpdateTeam(team)
		list:InsertData(team)
		StaticPopup_Show("PETCOUNCIL_RENAME")
	end


	function renameButton:OnClick(shiftDown)
		StaticPopup_Show("PETCOUNCIL_RENAME")
	end

	function deleteButton:OnClick(shiftDown)
		list:RemoveData()
	end

	function updateButton:OnClick(shiftDown)
		addon:UpdateTeam(selectedData)
		list:EnsureVisible()
		list:UpdateData()
	end

	function upButton:OnClick(shiftDown)
		list:MoveData(nil, shiftDown and "TOP" or "UP")
	end

	function downButton:OnClick(shiftDown)
		list:MoveData(nil, shiftDown and "BOTTOM" or "DOWN")
	end

	local group = frame:CreateMultiSelectionGroup()
	local altCheck = group:AddButton(L["alternative pets"], "alternative")
	altCheck:SetPoint("TOPLEFT", panel, "BOTTOMLEFT", 0, -58)
	altCheck.tooltipTitle = L["alternative pets"]
	altCheck.tooltipText = L["tooltip alternative pets"]

	function group:OnCheckInit(value)
		return addon.db[value]
	end

	function group:OnCheckChanged(value, checked)
		addon.db[value] = checked
	end
end


local event = CreateFrame("Frame")
event:RegisterEvent("ADDON_LOADED")
event:SetScript("OnEvent", function(self, event, arg1)
	if arg1 == "Blizzard_Collections" then

		if type(PetCouncilDB) ~= "table" then
			PetCouncilDB = { alternative = 1 }
		end

		addon.db = PetCouncilDB
		if type(addon.db.teams) ~= "table" then
			addon.db.teams = {
			{
			["pet2ability1"] = 509,
			["pet1ability1"] = 515,
			["pet2"] = "BattlePet-0-0000024C99B3",
			["pet1"] = "BattlePet-0-00000107C5F8",
			["pet3"] = "BattlePet-0-000001276B14",
			["pet1ability3"] = 334,
			["name"] = "特斯菲罗",
			["pet1ability2"] = 282,
			["pet3ability2"] = 389,
			["pet3ability1"] = 535,
			["pet3ability3"] = 536,
			["pet2ability2"] = 123,
			["pet2ability3"] = 513,
		}, -- [1]
		{
			["pet2ability1"] = 921,
			["pet1ability1"] = 921,
			["pet2"] = "BattlePet-0-0000035B3905",
			["pet1"] = "BattlePet-0-0000035B3904",
			["pet3"] = "BattlePet-0-0000035B3907",
			["pet1ability3"] = 919,
			["pet2ability3"] = 919,
			["pet1ability2"] = 920,
			["pet3ability2"] = 920,
			["pet3ability1"] = 921,
			["pet3ability3"] = 919,
			["pet2ability2"] = 920,
			["name"] = "狩猎小队",
		}, -- [2]
		}
		end

		-- Since 50200 pet id are in upper cased format but the "0x" prefix remains in lower case
		if not addon.db.v50200 then
			addon.db.v50200 = 1
			local data
			for _, data in ipairs(addon.db.teams) do
				local i
				for i = 1, 3 do
					local id = data["pet"..i]
					if id then
						id = strupper(id)
						data["pet"..i] = gsub(id, "0X", "0x")
					end
				end
			end
		end

		-- Since 60000 pet id is changed into format of "BattlePet-0-guid", "guid" 12 digits only
		if not addon.db.v60000 then
			addon.db.v60000 = 1
			local data
			for _, data in ipairs(addon.db.teams) do
				local i
				for i = 1, 3 do
					local guid = data["pet"..i]
					if guid then
						data["pet"..i] = gsub(guid, "0x0000", "BattlePet-0-")
					end
				end
			end
		end
		
		loadFrame()
		list:BindDataList(addon.db.teams)
	end
end)