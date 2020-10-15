------------------------------------------------------------
-- MainFrame.lua
--
-- Abin
-- 2016-10-20
------------------------------------------------------------

local type = type
local pairs = pairs
local ipairs = ipairs
local select = select
local format = format
local CreateFrame = CreateFrame
local strsub = strsub

local _, addon = ...
local L = addon.L

local NAME_WIDTH = 80
local ILEVEL_WIDTH = 60
local COMPLETED_WIDTH = 24
local KEYSTONE_WIDTH = 200
local CLOAK_WIDTH = 32

local frameWidth = NAME_WIDTH + ILEVEL_WIDTH * 2 + KEYSTONE_WIDTH + 72 + CLOAK_WIDTH + 16

do
	local _, data
	for _, data in ipairs(addon.RESOURCE_WATCH) do
		if data.max and data.max < 100 then
			data.width = 24
		else
			data.width = 50
		end
		frameWidth = frameWidth + 16 + data.width + 2
	end
end

local frame = CreateFrame("Frame", "AltconFrame", UIParent)
addon.frame = frame
frame:Hide()
frame:SetSize(frameWidth, 330)
frame:SetPoint("CENTER")
frame:SetBackdrop({ bgFile = "Interface\\FrameGeneral\\UI-Background-Marble", edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border", edgeSize = 16, insets = { left = 5, right = 5, top = 5, bottom = 5 } })
frame:SetFrameStrata("DIALOG")
frame:SetMovable(true)
frame:SetToplevel(true)
frame:SetUserPlaced(true)
frame:EnableMouse(true)
frame:SetClampedToScreen(true)
tinsert(UISpecialFrames, frame:GetName())

frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)

frame:SetScript("OnShow", function()
	addon:RequestChallengeData()
end)

local topClose = CreateFrame("Button", frame:GetName().."TopClose", frame, "UIPanelCloseButton")
topClose:SetSize(24, 24)
topClose:SetPoint("TOPRIGHT", -5, -5)

local title = frame:CreateFontString(frame:GetName().."Title", "ARTWORK", "GameFontNormal")
title:SetPoint("TOP", 0, -17)
title:SetText(L["title"])

local list = UICreateVirtualScrollList(frame:GetName().."List", frame, 12, nil, nil, "")
list:SetPoint("TOPLEFT", 12, -44)
list:SetPoint("TOPRIGHT", -12, -44)
list:SetHeight(242)

local function DeleteProfile(data)
	local index = list:FindData(data)
	list:RemoveData(index)
	addon:DeleteProfile(data.profile)
end

local function DelButton_OnClick(self)
	addon:PopupShowConfirm(format(L["delete confirm"], self.data.profile), DeleteProfile, self.data)
end

local function Button_OnDragStart(self)
	frame:StartMoving()
end

local function Button_OnDragStop(self)
	frame:StopMovingOrSizing()
end

local function ButtonResData_UpdateValue(self, db)
	local amount = db[self.data.key] or 0
	if amount > 0 then
		self.icon:SetVertexColor(1, 1, 1)
		if amount < 10000 then
			self.text:SetFormattedText("%d", amount)
		elseif amount < 10000000 then
			self.text:SetFormattedText("%.1fw", amount / 10000)
		else
			self.text:SetFormattedText("%.1fy", amount / 10000000)
		end
	else
		self.icon:SetVertexColor(0.5, 0.5, 0.5)
		self.text:SetText()
	end

	if self.data.max and self.data.max <= amount then
		self.text:SetVertexColor(1, 0, 0)
	else
		self.text:SetVertexColor(1, 1, 1)
	end
end

local function CreateButtonIconText(button, texture, width, anchor, data)
	local icon = button:CreateTexture(nil, "ARTWORK")
	icon:SetSize(14, 14)
	icon:SetTexCoord(0.08, 0.92, 0.08, 0.92)
	icon:SetTexture(texture)

	if anchor then
		icon:SetPoint("LEFT", anchor, "RIGHT", 2, 0)
	end

	local text = button:CreateText()
	text:SetPoint("LEFT", icon, "RIGHT", 4, 0)
	if width and width > 0 then
		text:SetWidth(width)
	end
	text:SetTextColor(1, 1, 1)

	return { icon = icon, text = text, db = db, data = data, UpdateValue = ButtonResData_UpdateValue }
end

function list:OnButtonCreated(button)
	button:RegisterForDrag("LeftButton")
	button:SetScript("OnDragStart", Button_OnDragStart)
	button:SetScript("OnDragStop", Button_OnDragStop)

	button.delButton = CreateFrame("Button", button:GetName().."Delete", button, "UIPanelCloseButton")
	button.delButton:SetSize(24, 24)
	button.delButton:SetPoint("RIGHT")
	button.delButton:SetScript("OnClick", DelButton_OnClick)

	button.ilevel = button.text
	button.ilevel:SetWidth(ILEVEL_WIDTH)
	button.ilevel:SetJustifyH("CENTER")

	button.name = button:CreateText()
	button.name:SetPoint("LEFT", button.ilevel, "RIGHT", 2, 0)
	button.name:SetWidth(NAME_WIDTH)

	button.completedLevel = button:CreateText("CENTER", 0, 1, 0)
	button.completedLevel:SetPoint("LEFT", button.name, "RIGHT")
	button.completedLevel:SetWidth(COMPLETED_WIDTH)

	local keystone = CreateButtonIconText(button, 525134, KEYSTONE_WIDTH, button.completedLevel)
	keystone.text:SetTextColor(0xa3/0xff, 0x35/0xff, 0xee/0xff)
	button.keystone = keystone

	button.cloak = CreateButtonIconText(button, 530999, CLOAK_WIDTH, button.keystone.text)
	button.cloak.text:SetTextColor(1, 0.486, 0.039)

	button.resGroups = {};

	local prevGroup = button.cloak
	local _, data
	for _, data in ipairs(addon.RESOURCE_WATCH) do
		local group = CreateButtonIconText(button, data.icon, data.width, prevGroup.text, data)
		tinsert(button.resGroups, group)
		prevGroup = group
	end
end

function list:OnButtonUpdate(button, data)
	if data.profile == addon:GetCurProfileName() then
		button.delButton:Disable()
	else
		button.delButton:Enable()
	end

	button.delButton.data = data

	local coords = CLASS_ICON_TCOORDS[data.class]
	if coords then
		button.icon:SetTexture("Interface\\WorldStateFrame\\Icons-Classes")
		button.icon:SetTexCoord(coords[1], coords[2], coords[3], coords[4])
	end

	button.ilevel:SetText(data.ilevel)
	button.name:SetText(addon:GetDisplayName(data.profile))

	local r, g, b = addon:GetDisplayColor(data.class)
	button.ilevel:SetTextColor(r, g, b)
	button.name:SetTextColor(r, g, b)

	if data.challenge.completed then
		button.completedLevel:SetFormattedText("%d", data.challenge.completed)
		button.completedLevel:SetTextColor(0, 1, 0, 1)
	elseif data.recordedLevel then
		button.completedLevel:SetFormattedText("%d", data.recordedLevel)
		button.completedLevel:SetTextColor(0.5, 0.5, 0.5, 0.5)
	else
		button.completedLevel:SetText()
	end

	if data.challenge.key then
		--button.keystone.level:SetFormattedText("%d", data.challenge.level)
		button.keystone.text:SetText(data.challenge.key)
	else
		--button.keystone.icon:SetVertexColor(1, 1, 1)
		--button.keystone.level:SetText()
		button.keystone.text:SetText()
	end

	button._dataLink = data.challenge.link
	button.cloak.text:SetText(data.cloak)

	local _, group
	for _, group in ipairs(button.resGroups) do
		group:UpdateValue(data)
	end
end

frame:SetScript("OnUpdate", function(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed > 1 then
		self.elapsed = 0
		list:UpdateList()
	end
end)

local function FillList()
	list:Clear()
	local profile, data
	for profile, data in pairs(addon.db.profiles) do
		list:InsertData(data)
	end
end

addon:RegisterEventCallback("OnInitialize", FillList)
addon:RegisterEventCallback("OnDataUpdate", FillList)

function addon:ToggleFrame()
	if frame:IsShown() then
		frame:Hide()
	else
		frame:Show()
	end
end

function addon:OnSlashCmd(commands)
	self:ToggleFrame()
end