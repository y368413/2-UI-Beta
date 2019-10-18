--## Version: 1.30 ## Author: Saxitoxin
local cfg = {
	frameScale = "1",
	smallScale = "0.85",
	bigScale = "1",
	initialShow = false,
	useExtraButtons = true,
}

-----------------------------------------
-- DO NOT EDIT ANYTHING UNDER HERE UNLESS YOU KNOW WHAT YOU ARE DOING
-----------------------------------------
cfg.test = false

cfg.portraitmedia = "Interface\\CHARACTERFRAME\\TEMPORARYPORTRAIT-"
cfg.raceID = {
	[ "Human"] = 1,
	[ "Orc"] = 2,
	[ "Dwarf"] = 3,
	[ "NightElf"] = 4,
	[ "Scourge"] = 5,
	[ "Tauren"] = 6,
	[ "Gnome"] = 7,
	[ "Troll"] = 8,
	[ "Goblin"] = 9,
	[ "BloodElf"] = 10,
	[ "Draenei"] = 11,
	[ "Worgen"] = 22,
	[ "Pandaren"] = 24,
	[ "Nightborne"] = 27,
	[ "HighmountainTauren"] = 28,
	[ "VoidElf"] = 29,
	[ "LightforgedDraenei"] = 30, 
	["ZandalariTroll"] = 31,
	["KulTiranHuman"] = 32,
	["DarkIronDwarf"] = 34,
	["MagharOrc"] = 36,
}

local gender = 0
local gendertext = ""
local activeRace = select(2,UnitRace("player"))
local faction = UnitFactionGroup("player")

local buttonHolder = CreateFrame("Frame","SXidButtonHolderFrame", DressUpFrame)
buttonHolder:SetAllPoints()

buttonHolder:SetScript("OnShow", function(self)
	UIFrameFadeIn(self, .2, 0, 1)
end)

if UnitSex("player") == 3 then gender = 1 else gender = 0 end
if gender == 0 then genderText = "Male" else genderText = "Female" end

local function onEnter(self) 
	UIFrameFadeIn(self.hightlight, .1, self.hightlight:GetAlpha(), .5)
end

local function onLeave(self) 
	UIFrameFadeOut(self.hightlight, .5, self.hightlight:GetAlpha(), 0)
end

local function onClick(self)
	activeRace = self.text:GetText()
	DressUpFrame.ModelScene:GetPlayerActor():SetCustomRace( cfg.raceID[activeRace], gender )
end

local function raceButtonTemplate(parent, size, race,...)

    local f = CreateFrame("BUTTON", nil, parent or UIParent)
    f:SetSize(size, size)
	f:EnableMouse(true)
    if (...) then
        f:SetPoint(...)
    else
        f:SetPoint("CENTER")
    end
	-- BG
    f.bg = f:CreateTexture(nil,"BACKGROUND",nil,-8)
    f.bg:SetPoint("CENTER")
	f.bg:SetSize(size, size)
    f.bg:SetTexture("Interface\\CHARACTERFRAME\\TempPortraitAlphaMask")
	f.bg:SetVertexColor(.1,.1,.1)
	
	-- ICON
    f.icon = f:CreateTexture(nil,"BACKGROUND",nil,-7)
    f.icon:SetPoint("CENTER")
	f.icon:SetSize(size, size)
    f.icon:SetTexture(cfg.portraitmedia..genderText.."-"..race)
		
	-- HIGHTLIGHT
	f.hightlight = f:CreateTexture(nil,"BACKGROUND",nil,-5)
    f.hightlight:SetPoint("CENTER",0,-1)
	f.hightlight:SetSize(size*1.6, size*1.6)
	f.hightlight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
	f.hightlight:SetTexCoord(0.84375000, 0.94140625, 0.10253906, 0.15136719)
	f.hightlight:SetAlpha(0)
	f.hightlight:SetBlendMode("ADD")

	-- BORDER
	f.border = f:CreateTexture(nil,"BACKGROUND",nil,-4)
    f.border:SetPoint("CENTER",-1,-1)
	f.border:SetSize(size*1.6, size*1.6)
	f.border:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
	f.border:SetTexCoord(0.50585938, 0.63085938, 0.02246094, 0.08203125)
	
	f.text = f:CreateFontString(nil, "OVERLAY",nil,6)
	f.text:SetPoint("BOTTOM", f )
	f.text:SetFont(STANDARD_TEXT_FONT, 12, "THINOUTLINE")
	f.text:SetText(race)
	f.text:SetAlpha(0)
	
	f:SetScript("OnEnter", onEnter)
	f:SetScript("OnLeave", onLeave)
	f:SetScript("OnMouseUp", onClick)
    return f
end

local BS = 40

local pandaButton = raceButtonTemplate(buttonHolder, BS, CHARMS_PANDAREN ,"BOTTOMLEFT", DressUpFrame, "BOTTOMRIGHT", 9, 8)
local worGobButton = raceButtonTemplate(buttonHolder, BS, CHARMS_WORGEN ,"BOTTOM", pandaButton, "TOP", 0, 8)
local draBElfButton = raceButtonTemplate(buttonHolder, BS, CHARMS_DRAENEI ,"BOTTOM", worGobButton, "TOP", 0, 8)
local gnoTroButton = raceButtonTemplate(buttonHolder, BS, CHARMS_GNOME, "BOTTOM", draBElfButton, "TOP", 0, 8)
local NElfTauButton = raceButtonTemplate(buttonHolder, BS, CHARMS_NIGHTELF ,"BOTTOM", gnoTroButton, "TOP", 0, 8)
local dwaUndButton = raceButtonTemplate(buttonHolder, BS, CHARMS_DWARF ,"BOTTOM", NElfTauButton, "TOP", 0, 8)
local humOrcButton = raceButtonTemplate(buttonHolder, BS, CHARMS_HUMAN ,"BOTTOM", dwaUndButton, "TOP", 0, 8)

--Allied Races
local VElfHmTauButton = raceButtonTemplate(buttonHolder, BS*.8, CHARMS_VOIDELF ,"LEFT", NElfTauButton, "RIGHT", 8, 0)
VElfHmTauButton.border:SetTexCoord(0.72656250, 0.81445313, 0.02246094, 0.06542969)
VElfHmTauButton.border:SetSize(BS*1.4, BS*1.4)
local LFdraNborButton = raceButtonTemplate(buttonHolder, BS*.8, CHARMS_LIGHTFORGEDDRAENEI ,"LEFT", draBElfButton, "RIGHT", 8, 0)
LFdraNborButton.border:SetTexCoord(0.72656250, 0.81445313, 0.02246094, 0.06542969)
LFdraNborButton.border:SetSize(BS*1.4, BS*1.4)

local factionButton = raceButtonTemplate(buttonHolder, BS*1.2, "Faction" ,"TOPLEFT",DressUpFrame, "TOPRIGHT", 9, -25)
factionButton.icon:SetTexture("Interface\\FriendsFrame\\PlusManz-"..faction)
local genderButton = raceButtonTemplate(buttonHolder, BS*1.2, "Gender" ,"TOP", factionButton, "BOTTOM", 0, -10)
genderButton.icon:SetTexture("interface\\addons\\_ShiGuang\\Media\\Modules\\Role\\gender_"..genderText)

local function updateButtons()
	if faction == "Horde" then
	humOrcButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Orc")
	dwaUndButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Scourge")
	NElfTauButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Tauren")
	gnoTroButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Troll")
	draBElfButton.icon:SetTexture(cfg.portraitmedia..genderText.."-BloodElf")
	worGobButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Goblin")
	--Allied Races
	VElfHmTauButton.icon:SetTexture(cfg.portraitmedia..genderText.."-HighmountainTauren")
	LFdraNborButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Nightborne")
	else
	humOrcButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Human")
	dwaUndButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Dwarf")
	NElfTauButton.icon:SetTexture(cfg.portraitmedia..genderText.."-NightElf")
	gnoTroButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Gnome")
	draBElfButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Draenei")
	worGobButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Worgen")
	--Allied Races
	VElfHmTauButton.icon:SetTexture(cfg.portraitmedia..genderText.."-VoidElf")
	LFdraNborButton.icon:SetTexture(cfg.portraitmedia..genderText.."-LightforgedDraenei")
	end
	pandaButton.icon:SetTexture(cfg.portraitmedia..genderText.."-Pandaren")	
	factionButton.icon:SetTexture("Interface\\FriendsFrame\\PlusManz-"..faction)
	genderButton.icon:SetTexture("interface\\addons\\_ShiGuang\\Media\\Modules\\Role\\gender_"..genderText)
end

genderButton:SetScript("OnMouseUp", function(self, button)
	gender = gender+1
	if gender > 1 then gender = 0 end
	if gender == 0 then genderText = "male" else genderText = "female" end
	
	updateButtons()
	DressUpFrame.ModelScene:GetPlayerActor():SetCustomRace( cfg.raceID[activeRace], gender )
end)

factionButton:SetScript("OnMouseUp", function(self, button)
	if faction == "Horde" then faction = "Alliance" else faction = "Horde" end
	factionButton.icon:SetTexture("Interface\\Timer\\"..faction.."-Logo")
	updateButtons()
end)

-- NO BUTTON BELLOW HERE IS A MODEL BUTTON
local toggleModelCheckButton = CreateFrame("CheckButton", "toggleExtraModelButtons", DressUpFrame, "UICheckButtonTemplate") 
toggleModelCheckButton:SetPoint("TOPLEFT", DressUpFrame,"TOPLEFT",54,4)
toggleModelCheckButton:SetChecked(cfg.initialShow)

toggleModelCheckButton:SetScript("OnClick", function(self, button, up)
	if self:GetChecked() then
		buttonHolder:Show()
	else
		buttonHolder:Hide()
	end
end)

local lowerButtonHolder = CreateFrame("Frame",nil, DressUpFrame)
lowerButtonHolder:SetAllPoints()

--[[local SXimprovedDressupDropdown = CreateFrame("Button", "SXimprovedDressupDropdown", lowerButtonHolder, "UIDropDownMenuTemplate")
SXimprovedDressupDropdown:SetPoint("BOTTOMLEFT", DressUpFrame, -16, -4)

local gear = {
	"Tabard",		-- 19
	"Head",			-- 1
	"Shoulder",		-- 3
	"Chest",		-- 5	
	"Belt",			-- 6
	"Pants",		-- 7 
	"Boots",		-- 8
	"Wrists",		-- 9
	"Hands",		-- 10
	"Main Hand",	-- 16
	"Off Hand",		-- 17
	"Shirt",		-- 4
}

local function OnClick(self)
	
	if self:GetID() == 1 then		
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(19)
	elseif self:GetID() == 2 then 
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(1)
	elseif self:GetID() == 3 then 
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(3)
	elseif self:GetID() == 10 then 
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(16)
	elseif self:GetID() == 11 then 
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(17)
	elseif self:GetID() == 12 then 
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(4)
	else
		DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(self:GetID())
	end
	
	UIDropDownMenu_SetSelectedID(SXimprovedDressupDropdown, 0)
	UIDropDownMenu_SetText(SXimprovedDressupDropdown, "Select what to undress")
end
	 
local function initialize(self, level)
   local info = UIDropDownMenu_CreateInfo()
   for k,v in pairs(gear) do
	  info = UIDropDownMenu_CreateInfo()
	  info.text = v
	  info.value = v
	  info.func = OnClick
	  UIDropDownMenu_AddButton(info, level)
   end
end
	 
UIDropDownMenu_Initialize(SXimprovedDressupDropdown, initialize)
UIDropDownMenu_SetWidth(SXimprovedDressupDropdown, 72)
UIDropDownMenu_SetButtonWidth(SXimprovedDressupDropdown, 72)
UIDropDownMenu_SetText(SXimprovedDressupDropdown, "Select to undress")
UIDropDownMenu_JustifyText(SXimprovedDressupDropdown, "LEFT")]]

local DressUpUndressBtn = CreateFrame("Button","DressUpUndressBtn",lowerButtonHolder,"UIPanelButtonTemplate") 
DressUpUndressBtn:SetSize(DressUpFrameResetButton:GetSize())
DressUpUndressBtn:SetPoint("BOTTOMLEFT", DressUpFrame, 6,4)
DressUpUndressBtn.text = _G["DressUpUndressBtn"]
DressUpUndressBtn.text:SetText(CHARMS_NAKEDIZE)

DressUpUndressBtn:SetScript("OnClick", function()
for i = 1, 19 do
			DressUpFrame.ModelScene:GetPlayerActor():UndressSlot(i)
		end
end)

local DressUpTargetBtn = CreateFrame("Button","DressUpTargetBtn",lowerButtonHolder,"UIPanelButtonTemplate") 
DressUpTargetBtn:SetSize(DressUpFrameResetButton:GetSize())
DressUpTargetBtn:SetPoint("LEFT", DressUpUndressBtn, "RIGHT", 0,0)
DressUpTargetBtn.text = _G["DressUpTargetBtnText"]
DressUpTargetBtn.text:SetText(CHARMS_TARGET)
DressUpTargetBtn:Disable()

DressUpTargetBtn:SetScript("OnClick", function()
	DressUpFrame.ModelScene:GetPlayerActor():SetModelByUnit("target", false, true)
	faction = UnitFactionGroup("target")
	_, activeRace = UnitRace("target")
	if UnitSex("target") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	updateButtons()
end)

DressUpTargetBtn:RegisterEvent("PLAYER_TARGET_CHANGED")
DressUpTargetBtn:SetScript("OnEvent", function(self,event, ...)
	if UnitExists("target") and UnitIsPlayer("target") then
		DressUpTargetBtn:Enable() 
	else 
		DressUpTargetBtn:Disable() 
	end
end)

DressUpFrameResetButton.oldMouseUp = DressUpFrameResetButton:GetScript("OnMouseUp")
DressUpFrameResetButton:SetScript("OnMouseUp", function(self, button)
	_, activeRace = UnitRace("player")
	if UnitSex("player") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	DressUpFrame.ModelScene:GetPlayerActor():SetModelByUnit("player", false, true)
	updateButtons()
	self.oldMouseUp(self)
end)

local function repositionButtons()
	if DressUpFrame:IsShown() then
		C_Timer.After(.001, function()
			if MaximizeMinimizeFrame.MaximizeButton:IsShown() then
				buttonHolder:SetScale(cfg.smallScale)
			else
				buttonHolder:SetScale(cfg.bigScale)
			end
			if not cfg.useExtraButtons then lowerButtonHolder:Hide() else lowerButtonHolder:Show() end
		end)
	end
end

MaximizeMinimizeFrame.MaximizeButton:SetScript("OnMouseUp", function(self, button)
	repositionButtons()
end)

MaximizeMinimizeFrame.MinimizeButton:SetScript("OnMouseUp", function(self, button)
	repositionButtons()
end)

DressUpFrame.oldOnShow = DressUpFrame:GetScript("OnShow")
DressUpFrame:SetScript("OnShow", function(self)
	DressUpFrame:SetScale(cfg.frameScale)
	--DressUpFrame.ModelScene:GetPlayerActor():SetModelByUnit("player", false, true)
	faction = UnitFactionGroup("player")
	_, activeRace = UnitRace("player")
	if UnitSex("player") == 3 then gender = 1 else gender = 0 end
	if gender == 0 then genderText = "Male" else genderText = "Female" end
	
	repositionButtons()	
	updateButtons()
	
	toggleModelCheckButton:SetChecked(cfg.initialShow)
	if toggleModelCheckButton:GetChecked() then
		buttonHolder:Show()
	else
		buttonHolder:Hide()
	end
		
	self.oldOnShow(self)
end)

buttonHolder:RegisterEvent("PLAYER_ENTERING_WORLD")
buttonHolder:SetScript("OnEvent", function(self, event, ...)
	tinsert(UISpecialFrames, DressUpFrame:GetName())
	if cfg.test then
		DressUpFrame:Show()
	end
	if not cfg.initialShow then self:Hide() end
	updateButtons()
	repositionButtons()
end)