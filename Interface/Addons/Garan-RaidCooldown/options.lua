if not RDCD then return end
local RDCD = RDCD
local addon_name = "Garan-RaidCooldown"

local function TestSlider_OnValueChanged(self, value)
   if not self._onsetting then   -- is single threaded 
     self._onsetting = true
     self:SetValue(self:GetValue())
     value = self:GetValue()     -- cant use original 'value' parameter
     self._onsetting = false
   else return end               -- ignore recursion for actual event handler
 end
 
 local function createslider(parent, name, tip, value, min, max, step, ...)
	local slider = CreateFrame("Slider", "rdcd"..value, parent, "OptionsSliderTemplate")
	slider.value = value
	slider:SetWidth(200)
	slider:SetHeight(15)
	slider:SetPoint(...)
	_G[slider:GetName()..'Low']:SetText(min)
	_G[slider:GetName()..'Low']:ClearAllPoints()
	_G[slider:GetName()..'Low']:SetPoint("RIGHT", slider, "LEFT", 10, 0)
	_G[slider:GetName()..'High']:SetText(max)
	_G[slider:GetName()..'High']:ClearAllPoints()
	_G[slider:GetName()..'High']:SetPoint("LEFT", slider, "RIGHT", -10, 0)
	_G[slider:GetName()..'Text']:ClearAllPoints()
	_G[slider:GetName()..'Text']:SetPoint("BOTTOM", slider, "TOP", 0, 3)
	_G[slider:GetName()..'Text']:SetFontObject(GameFontHighlight)
	BlizzardOptionsPanel_Slider_Enable(slider)
	slider:SetMinMaxValues(min, max)
	slider:SetValueStep(step)
	slider:SetScript("OnShow", function(self)
		_G[slider:GetName()..'Text']:SetText(name.." |cFF00FFFF"..RDCDDB[self.value].."|r")
		self:SetValue(RDCDDB[self.value]) 
	end)
	slider:SetScript("OnValueChanged", function(self, getvalue)
		TestSlider_OnValueChanged(self, getvalue)
		_G[slider:GetName()..'Text']:SetText(name.." |cFF00FFFF"..RDCDDB[self.value].."|r")
		RDCDDB[self.value] = math.floor(getvalue)
	end)
	slider:SetScript("OnEnter", function(self) 
		GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
		GameTooltip:AddLine(tip, 1, 1, 0, true)
		GameTooltip:Show() 
	end)
	slider:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	return slider
end

local function createcheckbutton(parent, name, icon, arg1, arg2, ...)
	local bu = CreateFrame("CheckButton", "rdcd"..arg1..arg2, parent, "InterfaceOptionsCheckButtonTemplate")
	bu:SetPoint(...)
	bu.arg1 = arg1
	bu.arg2 = arg2
	bu.text = bu:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	bu.text:SetText(name)
	if icon then
		bu.icon = bu:CreateTexture(nil, "ARTWORK")
		bu.icon:SetPoint("LEFT", bu, "RIGHT", 5, 0)
		bu.icon:SetSize(18, 18)
		bu.icon:SetTexture(select(3, GetSpellInfo(arg2)))
		bu.text:SetPoint("LEFT", bu.icon, "RIGHT", 1, 1)
	else
		bu.text:SetPoint("LEFT", bu, "RIGHT", 1, 1)
	end
	bu:SetScript("OnShow", function(self) self:SetChecked(RDCDDB[arg1][arg2]) end)
	bu:SetScript("OnClick", function(self) RDCDDB[arg1][arg2] = self:GetChecked() or false end)
	return bu
end

RDCD.OPframe = CreateFrame("Frame", "Garan-RaidCooldown Options")
RDCD.OPframe:SetSize(650, 520)
RDCD.OPframe:SetPoint("CENTER", UIParent, "CENTER")
RDCD.OPframe:SetFrameStrata("HIGH")
RDCD.OPframe:SetFrameLevel(2)
RDCD.OPframe:Hide()

RDCD.OPframe:RegisterForDrag("LeftButton")
RDCD.OPframe:SetScript("OnDragStart", function(self) self:StartMoving() end)
RDCD.OPframe:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
RDCD.OPframe:SetClampedToScreen(true)
RDCD.OPframe:SetMovable(true)
RDCD.OPframe:SetUserPlaced(true)
RDCD.OPframe:EnableMouse(true)

RDCD.createborder(RDCD.OPframe)

RDCD.OPframe.title = RDCD.createtext(RDCD.OPframe, "OVERLAY", 15, "OUTLINE", "CENTER")
RDCD.OPframe.title:SetPoint("BOTTOM", RDCD.OPframe, "TOP", 0, -5)
RDCD.OPframe.title:SetText("|cffA6FFFFGaran-RaidCooldown v"..GetAddOnMetadata("Garan-RaidCooldown", "Version").."|r")

RDCD.OPframe.close = CreateFrame("Button", nil, RDCD.OPframe)
RDCD.OPframe.close:SetPoint("BOTTOMRIGHT", -10, 10)
RDCD.OPframe.close:SetSize(20, 20)
RDCD.OPframe.close:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
RDCD.OPframe.close:SetHighlightTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Highlight")
RDCD.OPframe.close:SetPushedTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Down")
RDCD.OPframe.close:SetPushedTextOffset(3, 3)
RDCD.OPframe.close:SetScript("OnClick", function()
	RDCD.OPframe:Hide()
end)
--====================================================--
--[[                   -- GUI --                    ]]--
--====================================================--
local gui = CreateFrame("Frame", "Garan-RaidCooldown GUI", RDCD.OPframe)
gui:SetAllPoints(RDCD.OPframe)

RDCD.heightslider = createslider(gui, RDCD.L["高度"], RDCD.L["高度Tip"], "height", 10, 25, 1, "TOPLEFT", 30, -35)
RDCD.widthslider = createslider(gui, RDCD.L["宽度"], RDCD.L["宽度Tip"], "width", 100, 300, 5, "TOPLEFT", 280, -35)
RDCD.maxgroupslider = createslider(gui, RDCD.L["最大分组数"], RDCD.L["最大分组数Tip"], "maxgroup", 3, 10, 1, "TOPLEFT", 30, -85)
RDCD.maxlineslider = createslider(gui, RDCD.L["框架高度"], RDCD.L["框架高度Tip"],"maxline", 10, 40, 1, "TOPLEFT", 280, -85)

local onlyactive = CreateFrame("CheckButton", "rdcd onlyactive", gui, "InterfaceOptionsCheckButtonTemplate")
onlyactive:SetPoint("TOPLEFT", 20, -135)
onlyactive.text = onlyactive:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
onlyactive.text:SetText(RDCD.L["在团队时只检测1-5队"])
onlyactive.text:SetPoint("LEFT", onlyactive, "RIGHT", 1, 1)
onlyactive:SetScript("OnShow", function(self) self:SetChecked(RDCDDB["onlyactive"]) end)
onlyactive:SetScript("OnClick", function(self) RDCDDB["onlyactive"] = self:GetChecked() or false end)

local clickable = CreateFrame("CheckButton", "rdcd clickable", gui, "InterfaceOptionsCheckButtonTemplate")
clickable:SetPoint("TOPLEFT", 250, -135)
clickable.text = clickable:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
clickable.text:SetText(RDCD.L["点击通报"])
clickable.text:SetPoint("LEFT", clickable, "RIGHT", 1, 1)
clickable:SetScript("OnShow", function(self) self:SetChecked(RDCDDB["clickable"]) end)
clickable:SetScript("OnClick", function(self) RDCDDB["clickable"] = self:GetChecked() or false end)
clickable:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine(RDCD.L["点击通报Tip"], 1, 1, 0, true)
	GameTooltip:Show() 
end)
clickable:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	
local boardcastuse_button = createcheckbutton(gui, RDCD.L["使用时通报"], false, "boardcast", "use", "TOPLEFT", 20, -165)
local boardcastready_button = createcheckbutton(gui, RDCD.L["就绪时通报"], false, "boardcast", "ready", "TOPLEFT", 250, -165)

gui.title2 = gui:CreateFontString(nil, "ARTWORK", "GameFontNormal")
gui.title2:SetPoint("BOTTOMLEFT", gui, "TOPLEFT", 25, -230)
gui.title2:SetText(RDCD.L["法术"])

gui.line2 = gui:CreateTexture(nil, "ARTWORK")
gui.line2:SetSize(600, 1)
gui.line2:SetPoint("TOP", 0, -235)
gui.line2:SetTexture(1, 1, 1, .2)

gui.reload = CreateFrame("Button", nil, gui, "UIPanelButtonTemplate")
gui.reload:SetPoint("BOTTOMRIGHT", gui.line2, "TOPRIGHT", 0, 5)
gui.reload:SetSize(160, 20)
gui.reload:SetText(RDCD.L["重载界面"])
gui.reload:SetScript("OnClick", ReloadUI)
gui.reload:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine(RDCD.L["重载界面Tip"], 1, 1, 0, true)
	GameTooltip:Show() 
end)
gui.reload:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

gui.reset = CreateFrame("Button", nil, gui, "UIPanelButtonTemplate")
gui.reset:SetPoint("RIGHT", gui.reload , "LEFT", -5, 0)
gui.reset:SetSize(160, 20)
gui.reset:SetText(RDCD.L["重置插件配置"])
gui.reset:SetScript("OnClick", function() ReloadUI() RDCD.ResetVariables() RDCD.LoadVariables() end)

local lock = CreateFrame("CheckButton", "rdcd lock", gui, "InterfaceOptionsCheckButtonTemplate")
lock:SetPoint("BOTTOMLEFT", gui, "BOTTOMRIGHT", -240, 6)
lock.text = lock:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
lock.text:SetText(RDCD.L["隐藏标签（锁定）"])
lock.text:SetPoint("LEFT", lock, "RIGHT", 1, 1)
lock:SetScript("OnShow", function(self) self:SetChecked(RDCDDB["locked"]) end)
lock:SetScript("OnClick", function(self)
	if self:GetChecked() then
		RDCDDB["locked"] = true
		RDCD:LockFrame()
	else
		RDCDDB["locked"] = false
		RDCD:UnlockFrame()
	end
end)

local count = 1
for spellID, cooldown in pairs(RDCD.cooldowns) do
	local spell = GetSpellInfo(spellID)
	if count%3 == 1 then
		createcheckbutton(gui, spell, true, "spells", spellID, "TOPLEFT", gui, "TOPLEFT", 20, -math.floor(count/3)*25-240)
	elseif count%3 == 2 then
		createcheckbutton(gui, spell, true, "spells", spellID, "TOPLEFT", gui, "TOP", -80, -math.floor(count/3)*25-240)
	else
		createcheckbutton(gui, spell, true, "spells", spellID, "TOPLEFT", gui, "TOPRIGHT", -200, -math.floor(count/3)*25-215)
	end
	count = count + 1
end

--====================================================--
--[[                   -- Options --                    ]]--
--====================================================--

local options = CreateFrame("Frame", "Garan-RaidCooldown OP", RDCD.OPframe)
options:SetAllPoints(RDCD.OPframe)
options:Hide()

local scrollFrame = CreateFrame("ScrollFrame", "Garan-RaidCooldown_ScrollFrame", options, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", options, "TOPLEFT", 25, -30)
scrollFrame:SetPoint("BOTTOMRIGHT", options, "BOTTOM", 50, 45)
scrollFrame:SetFrameLevel(options:GetFrameLevel()+1)
RDCD.createborder(scrollFrame)
scrollFrame.sd:SetBackdropColor(.1, .3, .3)

scrollFrame.Anchor = CreateFrame("Frame", "Garan-RaidCooldown_ScrollAnchor", scrollFrame)
scrollFrame.Anchor:SetPoint("TOP", scrollFrame, "TOP", 0, -3)
scrollFrame.Anchor:SetWidth(scrollFrame:GetWidth()-30)
scrollFrame.Anchor:SetHeight(scrollFrame:GetHeight())
scrollFrame.Anchor:SetFrameLevel(scrollFrame:GetFrameLevel()+1)
scrollFrame:SetScrollChild(scrollFrame.Anchor)

scrollFrame.Anchor:SetScript("OnEnter", function(self) 
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine(RDCD.L["用半角逗号隔开法术。"], 1, 1, 0, true)
	GameTooltip:Show() 
end)
scrollFrame.Anchor:SetScript("OnLeave", function(self) GameTooltip:Hide() end)

local function CreateEditBox(index, parent, width, height, text, ...)
	local scrollBG = CreateFrame("ScrollFrame", "Garan-RaidCooldown_ScrollBG"..index, parent, "UIPanelScrollFrameTemplate")
	scrollBG:SetPoint(...)
	scrollBG:SetSize(width, height)
	scrollBG:SetFrameLevel(parent:GetFrameLevel()+1)
	RDCD.createborder(scrollBG)
	scrollBG.sd:SetBackdropColor(.03, .03, .03, .3)

	local scrollAC = CreateFrame("Frame", "Garan-RaidCooldown_ScrollAC"..index, scrollBG)
	scrollAC:SetPoint("TOP", scrollBG, "TOP", 0, -3)
	scrollAC:SetWidth(scrollBG:GetWidth())
	scrollAC:SetHeight(scrollBG:GetHeight())
	scrollAC:SetFrameLevel(scrollBG:GetFrameLevel()+1)
	scrollBG:SetScrollChild(scrollAC)

	scrollBG.edit = CreateFrame("EditBox", "Garan-RaidCooldown_EidtBox"..index, scrollAC)
	scrollBG.edit:SetTextInsets(0, 0, 3, 3)
	scrollBG.edit:SetFrameLevel(scrollAC:GetFrameLevel()+1)
	scrollBG.edit:SetAllPoints()
	scrollBG.edit:SetFontObject(ChatFontNormal)
	scrollBG.edit:SetMultiLine(true)
	scrollBG.edit:EnableMouse(true)
	scrollBG.edit:SetAutoFocus(false)

	scrollBG.edit:SetScript("OnShow", function(self) 
		if not RDCDDB["editbox"]["group"..index] then
			RDCDDB["editbox"]["group"..index] = ""
		end
		self:SetText(RDCDDB["editbox"]["group"..index]) 
	end)
	scrollBG.edit:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)

	scrollBG.text = scrollBG:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	scrollBG.text:SetPoint("BOTTOMLEFT", scrollBG, "TOPLEFT", 5, 8)
	scrollBG.text:SetJustifyH("LEFT")
	scrollBG.text:SetText(text)
	
	return scrollBG
end

for i = 1, 9 do
	scrollFrame.Anchor["box"..i] = CreateEditBox(i, scrollFrame.Anchor, 300, 80, RDCD.L["技能分组"]..i, "TOP", scrollFrame.Anchor, "TOP", 5, 75-i*110)
end

gui.save = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.save:SetPoint("TOP", scrollFrame, "BOTTOM", 0, -5)
gui.save:SetSize(200, 20)
gui.save:SetText(RDCD.L["保存"])
gui.save.v = 1

StaticPopupDialogs[addon_name.."incorrect spell"] = {
	text = RDCD.L["法术名称不正确。"],
	button1 = ACCEPT, 
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

function RDCD:CheckSpells(button)
	local Incorrect = {}
	for a = 1, 9 do
		local str = scrollFrame.Anchor["box"..a].edit:GetText() 
		local spells = {string.split(",", str)}
		for i = 1, #spells do
			if not (spells[i] == "" or RDCD.CDSpells[spells[i]]) then
				table.insert(Incorrect, "|cffA6FFFF["..a.."]|r"..spells[i])
			end
		end
	end
	if #Incorrect == 0 then -- 无误
		for i = 1, 9 do
			scrollFrame.Anchor["box"..i].edit:SetEnabled(false)
			scrollFrame.Anchor["box"..i].sd:SetBackdropColor(.5, .5, .5, .5)
			RDCDDB["editbox"]["group"..i] = scrollFrame.Anchor["box"..i].edit:GetText() 
		end
		button:SetText(RDCD.L["编辑"])
		button.v = 0
	else
		StaticPopupDialogs[addon_name.."incorrect spell"].text = "法术名称不正确: "..table.concat(Incorrect, ", ")
		StaticPopup_Show(addon_name.."incorrect spell")
	end
end

gui.save:SetScript("OnClick", function(self) 
	if self.v == 1 then
		RDCD:CheckSpells(self)
	else
		for i = 1, 9 do
			scrollFrame.Anchor["box"..i].edit:SetEnabled(true)
			scrollFrame.Anchor["box"..i].sd:SetBackdropColor(.03, .03, .03, .3)
		end
		self:SetText(RDCD.L["保存"])
		self.v = 1
	end
end)

gui.getcurrent = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.getcurrent:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 45, 0)
gui.getcurrent:SetSize(200, 20)
gui.getcurrent:SetText(RDCD.L["获取团队分组"])
gui.getcurrent:SetScript("OnClick", function(self)
	RDCD:GetCurrentGroupingSettings()
	for i = 1, 9 do
		scrollFrame.Anchor["box"..i].edit:SetText(RDCDDB["editbox"]["group"..i]) 
	end
end)

local SavedButtonsFrame = CreateFrame("ScrollFrame", "Garan-RaidCooldown_SavedButtonsFrame", options, "UIPanelScrollFrameTemplate")
SavedButtonsFrame:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 45, -5-28*3)
SavedButtonsFrame:SetSize(200, 300)
SavedButtonsFrame:SetFrameLevel(options:GetFrameLevel()+1)
RDCD.createborder(SavedButtonsFrame)
SavedButtonsFrame.sd:SetBackdropColor(.1, .3, .3)

SavedButtonsFrame.Anchor = CreateFrame("Frame", "Garan-RaidCooldown_SavedButtonsFrame_ScrollAnchor", SavedButtonsFrame)
SavedButtonsFrame.Anchor:SetPoint("TOP", SavedButtonsFrame, "TOP", 0, -3)
SavedButtonsFrame.Anchor:SetWidth(SavedButtonsFrame:GetWidth()-30)
SavedButtonsFrame.Anchor:SetHeight(SavedButtonsFrame:GetHeight())
SavedButtonsFrame.Anchor:SetFrameLevel(SavedButtonsFrame:GetFrameLevel()+1)
SavedButtonsFrame:SetScrollChild(SavedButtonsFrame.Anchor)

local SavedButtons = {}
local select

function RDCD:SortSavedButtons()
	sort(SavedButtons, function(a, b) return (a.name < b.name) end)
	for i = 1, #SavedButtons do
		SavedButtons[i]:ClearAllPoints()
		if i == 1 then
			SavedButtons[i]:SetPoint("TOPLEFT", SavedButtonsFrame.Anchor, "TOPLEFT", 5, -5)
		else
			SavedButtons[i]:SetPoint("TOPLEFT", SavedButtons[i-1], "BOTTOMLEFT", 0, -5)
		end
	end
end

function RDCD:CreateSavedButton(name)
	if RDCDDB["savedgrouping"][name] == nil then
		RDCDDB["savedgrouping"][name] = {}
		for a, b in pairs(RDCDDB["editbox"]) do
			RDCDDB["savedgrouping"][name][a] = b
		end
	end
	
	local button = CreateFrame("Button", nil, SavedButtonsFrame.Anchor, "UIPanelButtonTemplate")
	button:SetSize(190, 20)
	button:SetPushedTexture("Interface\\Buttons\\WHITE8x8")
	button:GetPushedTexture():SetVertexColor(.15, .5, .5)
	button:SetText(name)
	button.name = name
	button.v = 0
	
	table.insert(SavedButtons, button)
	
	button:SetScript("OnClick", function(self)
		if self.v == 0 then
			select = name
			for i = 1, #SavedButtons do
				if SavedButtons[i].name == self.name then
					self:SetButtonState("PUSHED", true)
				else
					SavedButtons[i]:SetButtonState("NORMAL", false)
					SavedButtons[i].v = 0
				end
			end
			gui.displayselect:Enable()
			gui.useselect:Enable()
			gui.deleteselect:Enable()
			self.v = 1
		else
			select = nil
			self:SetButtonState("NORMAL", false)
			gui.displayselect:Disable()
			gui.useselect:Disable()
			gui.deleteselect:Disable()
			self.v = 0
		end
	end)
	
	RDCD:SortSavedButtons()
end

StaticPopupDialogs[addon_name.."need save"] = {
	text = RDCD.L["必须先保存编辑中的分组。"],
	button1 = ACCEPT, 
	button2 = CANCEL,
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

StaticPopupDialogs[addon_name.."need save"].OnAccept = function(self)
	RDCD:CheckSpells(gui.save)
end

StaticPopupDialogs[addon_name.."name already exist"] = {
	text = RDCD.L["该名字已经存在"],
	button1 = ACCEPT, 
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

StaticPopupDialogs[addon_name.."give name"] = {
	text = RDCD.L["新的分组配置："],
	button1 = ACCEPT, 
	button2 = CANCEL,
	hasEditBox = 1,
	hideOnEscape = 1, 
	whileDead = true,
	preferredIndex = 3,
}

StaticPopupDialogs[addon_name.."give name"].OnAccept = function(self)
	local name = _G[self:GetName().."EditBox"]:GetText()
	if RDCDDB["savedgrouping"][name] == nil then
		RDCD:CreateSavedButton(name)
	else
		StaticPopup_Show(addon_name.."name already exist")
	end
end

StaticPopupDialogs[addon_name.."give name"].OnShow = function(self)
	_G[self:GetName().."EditBox"]:SetText(RDCD.L["输入名字"])
	_G[self:GetName().."EditBox"]:SetAutoFocus(true)
	_G[self:GetName().."EditBox"]:HighlightText()
end

gui.savecurrent = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.savecurrent:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 45, -28*1)
gui.savecurrent:SetSize(200, 20)
gui.savecurrent:SetText(RDCD.L["储存当前配置"])
gui.savecurrent:SetScript("OnClick", function(self)
	if gui.save.v == 1 then
		StaticPopup_Show(addon_name.."need save")
	else
		StaticPopup_Show(addon_name.."give name")
	end
end)

gui.usecurrent = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.usecurrent:SetPoint("TOPLEFT", scrollFrame, "TOPRIGHT", 45, -28*2)
gui.usecurrent:SetSize(200, 20)
gui.usecurrent:SetText(RDCD.L["启用当前配置"])
gui.usecurrent:SetScript("OnClick", function(self)
	if gui.save.v == 1 then
		StaticPopup_Show(addon_name.."need save")
	else
		RDCD:ApplySavedGroup(RDCDDB["editbox"])
	end
end)

gui.deleteselect = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.deleteselect:SetPoint("BOTTOMLEFT", scrollFrame, "BOTTOMRIGHT", 45, 0)
gui.deleteselect:SetSize(60, 40)
gui.deleteselect:SetText(RDCD.L["删除"])
gui.deleteselect:Disable()
gui.deleteselect:SetScript("OnClick", function(self)
	for i = 1, #SavedButtons do
		if not SavedButtons[i] then return end
		if SavedButtons[i]["name"] == select then
			RDCDDB["savedgrouping"][select] = nil
			SavedButtons[i]:Hide()
			tremove(SavedButtons, i)
		end
		RDCD:SortSavedButtons()
	end
end)

gui.useselect = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.useselect:SetPoint("LEFT", gui.deleteselect, "RIGHT", 10, 0)
gui.useselect:SetSize(60, 40)
gui.useselect:SetText(RDCD.L["启用"])
gui.useselect:Disable()
gui.useselect:SetScript("OnClick", function(self)
	RDCD:ApplySavedGroup(RDCDDB["savedgrouping"][select])
end)

gui.displayselect = CreateFrame("Button", nil, options, "UIPanelButtonTemplate")
gui.displayselect:SetPoint("LEFT", gui.useselect, "RIGHT", 10, 0)
gui.displayselect:SetSize(60, 40)
gui.displayselect:SetText(RDCD.L["显示"])
gui.displayselect:Disable()
gui.displayselect:SetScript("OnClick", function(self)
	for a, b in pairs(RDCDDB["savedgrouping"][select]) do
		RDCDDB["editbox"][a] = b
	end
	for i = 1, 9 do
		scrollFrame.Anchor["box"..i].edit:SetText(RDCDDB["editbox"]["group"..i])
	end
end)
--====================================================--
--[[                   -- Options --                    ]]--
--====================================================--

local credits = CreateFrame("Frame", "Garan-RaidCooldown Credits", RDCD.OPframe)
credits:SetAllPoints(RDCD.OPframe)
credits:Hide()

credits.text = credits:CreateFontString(nil, "ARTWORK", "GameFontNormal")
credits.text:SetPoint("CENTER", 0, -100)
credits.text:SetText(RDCD.L["作者"])

model = CreateFrame("PlayerModel", nil, credits)
model:SetSize(300,300)
model:SetPoint("BOTTOM", credits.text, "TOP", 0, 10)

model:SetPosition(-2.5, 0, -1.6)
model:SetFacing(1)
model:SetCreature(51122)

model.text = RDCD.createtext(model, "HIGHLIGHT", 20, "NONE", "CENTER")
model.text:SetPoint("BOTTOM", model, "BOTTOM", 0, 25)
model.text:SetTextColor(1, 1, 1)
model.text:SetText(RDCD.L["讨厌!"])

model.glow = model:CreateTexture(nil, "HIGHLIGHT")
model.glow:SetSize(30, 30)
model.glow:SetPoint("CENTER", model.text, "TOPRIGHT", -3, -5)
model.glow:SetTexture("Interface\\Cooldown\\star4")
model.glow:SetVertexColor(1, 1, 1, .7)
model.glow:SetBlendMode("ADD")

model:SetScript("OnEnter", function(self) self:SetFacing(0) end)
model:SetScript("OnLeave", function(self) self:SetFacing(1) end)
	
model:EnableMouse(true)
--====================================================--
--[[                   -- TABS --                    ]]--
--====================================================--
local tab1 = CreateFrame("Frame", "Garan-RaidCooldown Options Tab1", RDCD.OPframe)
local tab2 = CreateFrame("Frame", "Garan-RaidCooldown Options Tab2", RDCD.OPframe)
local tab3 = CreateFrame("Frame", "Garan-RaidCooldown Options Tab3", RDCD.OPframe)

local function CreateTab(tab, index, text, frame)
	tab:SetSize(125, 20)
	
	tab:SetFrameLevel(1)
	RDCD.createborder(tab)

	tab.name = RDCD.createtext(tab, "OVERLAY", 15, "OUTLINE", "CENTER")
	tab.name:SetPoint("CENTER")
	tab.name:SetText(text)
	
	if index == 1 then
		tab.sd:SetBackdropColor(.15, .5, .5)
		tab:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", 5, -30*index)
	else
		tab:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", -2, -30*index)
	end
	
	tab:SetScript("OnMouseDown", function(self, button)
		gui:Hide()
		options:Hide()
		credits:Hide()
		
		frame:Show()
		
		tab1.sd:SetBackdropColor(.15, .15, .15)
		tab2.sd:SetBackdropColor(.15, .15, .15)
		tab3.sd:SetBackdropColor(.15, .15, .15)
		
		self.sd:SetBackdropColor(.15, .5, .5)
		
		tab1:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", -2, -30)
		tab2:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", -2, -60)
		tab3:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", -2, -90)
		
		self:SetPoint("TOPLEFT", RDCD.OPframe, "TOPRIGHT", 5, -30*index)
	end)
end

CreateTab(tab1, 1, RDCD.L["选项"], gui)
CreateTab(tab2, 2, RDCD.L["分组"], options)
CreateTab(tab3, 3, RDCD.L["制作"], credits)
--====================================================--
--[[            -- Minimap Button --                ]]--
--====================================================--
local MinimapButton = CreateFrame("Button","Garan-RaidCooldown_MinimapButton", Minimap)

MinimapButton:SetHeight(22)
MinimapButton:SetWidth(22)
MinimapButton:SetMovable(1)
MinimapButton:SetUserPlaced(1)
MinimapButton:EnableMouse(1)
MinimapButton:RegisterForDrag('LeftButton')
MinimapButton:SetFrameStrata('MEDIUM')
MinimapButton:SetPoint('CENTER', Minimap:GetWidth()/3*-0.9, Minimap:GetHeight()/2*-1);
MinimapButton:SetClampedToScreen(true)
MinimapButton:SetNormalTexture('Interface\\HELPFRAME\\HotIssueIcon')
MinimapButton:RegisterForClicks("LeftButtonDown", "RightButtonDown")

local OptionMenu = CreateFrame("Frame", "Garan-RaidCooldown_OptionMenu", UIParent, "UIDropDownMenuTemplate")
local OptionList = {
	{text = RDCD.L["打开控制台"], func = function() RDCD.OPframe:Show() end, notCheckable = true}, 
	{text = RDCD.L["清除所有分组"], func = function() RDCD:RemoveGroupIndex(0) end, notCheckable = true},  
}

MinimapButton:SetScript('OnClick', function(self, button)
	if button == "LeftButton" then
		if RDCD.frame:IsShown() then
			RDCD.frame:Hide()
		else
			RDCD.frame:Show()
		end
	elseif button == "RightButton" then
		EasyMenu(OptionList, OptionMenu, "cursor", 0, 0, "MENU", 2)
		DropDownList1:ClearAllPoints()
		DropDownList1:SetPoint("TOPLEFT", self, "BOTTOMLEFT", 0, -5)
	end
end)

MinimapButton:SetScript('OnDragStart', function(self, button)
	MinimapButton:SetScript('OnUpdate', function(self, elapsed)
		local x, y = Minimap:GetCenter()
		local cx, cy = GetCursorPosition()
		x, y = cx / self:GetEffectiveScale() - x, cy / self:GetEffectiveScale() - y
		if x > Minimap:GetWidth()/2+MinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2+MinimapButton:GetWidth()/2 end
		if x < Minimap:GetWidth()/2*-1-MinimapButton:GetWidth()/2 then x = Minimap:GetWidth()/2*-1-MinimapButton:GetWidth()/2 end
		if y > Minimap:GetHeight()/2+MinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2+MinimapButton:GetHeight()/2 end
		if y < Minimap:GetHeight()/2*-1-MinimapButton:GetHeight()/2 then y = Minimap:GetHeight()/2*-1-MinimapButton:GetHeight()/2 end
		MinimapButton:ClearAllPoints()
		MinimapButton:SetPoint('CENTER', x, y)
	end)
end)

MinimapButton:SetScript('OnDragStop', function(self, button)
	MinimapButton:SetScript('OnUpdate', nil)
end)

MinimapButton:SetScript('OnEnter', function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:AddLine("Garan-RaidCooldown")
	GameTooltip:AddLine(RDCD.L["左键：显示/隐藏"])
	GameTooltip:AddLine(RDCD.L["右键：打开菜单"])
	GameTooltip:Show()
end)

MinimapButton:SetScript('OnLeave', function(self)
	GameTooltip:Hide()
end)

--====================================================--
--[[                  -- Moving --                  ]]--
--====================================================--
RDCD.frame:RegisterForDrag("LeftButton")
RDCD.frame:SetScript("OnDragStart", function(self) self:StartMoving() end)
RDCD.frame:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
RDCD.frame:SetClampedToScreen(true)
RDCD.frame:SetMovable(true)
RDCD.frame:SetUserPlaced(true)
RDCD.createborder(RDCD.frame)

RDCD.frame.name = RDCD.createtext(RDCD.frame.sd, "OVERLAY", 15, "OUTLINE", "CENTER")
RDCD.frame.name:SetPoint("BOTTOM")
RDCD.frame.name:SetText("|cffFFFF00RaidCooldown|r")

RDCD.frame:SetScript("OnEnter", function(self) self.name:SetText("|cff00EE00"..RDCD.L["拖动我！"].."|r") end)
RDCD.frame:SetScript("OnLeave", function(self) self.name:SetText("|cffFFFF00RaidCooldown|r") end)
--====================================================--
--[[                  -- Command --                 ]]--
--====================================================--

local function slashCmdFunction(cmd)
    if cmd:match"show" then
		RDCD.frame:Show()
    elseif cmd:match"hide" then
		RDCD.frame:Hide()
	elseif cmd:match"config" then
		RDCD.OPframe:Show()
	elseif cmd:match"clear" then
		RDCD:RemoveGroupIndex(0)
	elseif cmd:match"anc" then
		RDCD:AncGroupIndex()
    else
        print("|cffFF1493/rdcd show|r "..RDCD.L["显示团队冷却监视"])
        print("|cffFF1493/rdcd hide|r "..RDCD.L["隐藏团队冷却监视"])
		print("|cffFF1493/rdcd config|r "..RDCD.L["打开控制台"])
		print("|cffFF1493/rdcd clear|r "..RDCD.L["清除所有分组"])
		print("|cffFF1493/rdcd anc|r "..RDCD.L["通报团队分组"])
    end
end

SlashCmdList["RaidCooldown"] = slashCmdFunction
SLASH_RaidCooldown1 = "/rdcd"