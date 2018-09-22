local _, ns = ...
local M, R, U, I = unpack(ns)
---------------------------
-- rButtonTemplate, zork
---------------------------
local Bar = M:GetModule("Actionbar")
local _G = getfenv(0)

local function CallButtonFunctionByName(button, func, ...)
	if button and func and button[func] then
		button[func](button, ...)
	end
end

local function ResetNormalTexture(self, file)
	if not self.__normalTextureFile then return end
	if file == self.__normalTextureFile then return end
	self:SetNormalTexture(self.__normalTextureFile)
end

local function ResetTexture(self, file)
	if not self.__textureFile then return end
	if file == self.__textureFile then return end
	self:SetTexture(self.__textureFile)
end

local function ResetVertexColor(self, r, g, b, a)
	if not self.__vertexColor then return end
	local r2, g2, b2, a2 = unpack(self.__vertexColor)
	if not a2 then a2 = 1 end
	if r ~= r2 or g ~= g2 or b ~= b2 or a ~= a2 then
		self:SetVertexColor(r2, g2, b2, a2)
	end
end

local function ApplyPoints(self, points)
	if not points then return end
	self:ClearAllPoints()
	for _, point in next, points do
		self:SetPoint(unpack(point))
	end
end

local function ApplyTexCoord(texture, texCoord)
	if not texCoord then return end
	texture:SetTexCoord(unpack(texCoord))
end

local function ApplyVertexColor(texture, color)
	if not color then return end
	texture.__vertexColor = color
	texture:SetVertexColor(unpack(color))
	hooksecurefunc(texture, "SetVertexColor", ResetVertexColor)
end

local function ApplyAlpha(region, alpha)
	if not alpha then return end
	region:SetAlpha(alpha)
end

local function ApplyFont(fontString, font)
	if not font then return end
	fontString:SetFont(unpack(font))
end

local function ApplyHorizontalAlign(fontString, align)
	if not align then return end
	fontString:SetJustifyH(align)
end

local function ApplyVerticalAlign(fontString, align)
	if not align then return end
	fontString:SetJustifyV(align)
end

local function ApplyTexture(texture, file)
	if not file then return end
	texture.__textureFile = file
	texture:SetTexture(file)
	hooksecurefunc(texture, "SetTexture", ResetTexture)
end

local function ApplyNormalTexture(button, file)
	if not file then return end
	button.__normalTextureFile = file
	button:SetNormalTexture(file)
	hooksecurefunc(button, "SetNormalTexture", ResetNormalTexture)
end

local function SetupTexture(texture, cfg, func, button)
	if not texture or not cfg then return end
	ApplyTexCoord(texture, cfg.texCoord)
	ApplyPoints(texture, cfg.points)
	ApplyVertexColor(texture, cfg.color)
	ApplyAlpha(texture, cfg.alpha)
	if func == "SetTexture" then
		ApplyTexture(texture, cfg.file)
	elseif func == "SetNormalTexture" then
		ApplyNormalTexture(button, cfg.file)
	elseif cfg.file then
		CallButtonFunctionByName(button, func, cfg.file)
	end
end

local function SetupFontString(fontString, cfg)
	if not fontString or not cfg then return end
	ApplyPoints(fontString, cfg.points)
	ApplyFont(fontString, cfg.font)
	ApplyAlpha(fontString, cfg.alpha)
	ApplyHorizontalAlign(fontString, cfg.halign)
	ApplyVerticalAlign(fontString, cfg.valign)
end

local function SetupCooldown(cooldown, cfg)
	if not cooldown or not cfg then return end
	ApplyPoints(cooldown, cfg.points)
end

local function SetupBackdrop(button)
	local bg = M.CreateBG(button, 0)
	M.CreateBD(bg)
	M.CreateSD(bg)
	M.CreateTex(bg)
	if MaoRUISettingDB["Actionbar"]["Classcolor"] then
		bg:SetBackdropColor(I.ClassColor.r, I.ClassColor.g, I.ClassColor.b, .25)
	else
		bg:SetBackdropColor(.2, .2, .2, .25)
	end
end

--update hotkey func
	local replaces = {
		{"(Mouse Button )", "M"},
		{"(Middle Mouse)", "●"},
		{"(Mouse Wheel Down)", "▲"},
		{"(Mouse Wheel Up)", "▼"},
		{"(鼠标按键)", "M"},
		{"(滑鼠按鍵)", "M"},
		{"(鼠标中键)", "●"},
		{"(鼠标滚轮向上滚动)", "▲"},
		{"(鼠标滚轮向下滚动)", "▼"},
		{"(a%-)", "A"},
		{"(c%-)", "C"},
		{"(s%-)", "S"},
		{KEY_BUTTON3, "M3"},
		{KEY_MOUSEWHEELUP, "MU"},
		{KEY_MOUSEWHEELDOWN, "MD"},
		{KEY_SPACE, "空"},
		{CAPSLOCK_KEY_TEXT, "CL"},
		{"(Num Pad )", "数"},
		{"(Num Pad +)", "+"},
		{"(数字键盘 +)", "+"},
		{"(数字键盘 %-)", "数"},
		{"(Page Up)", "P↑"},
		{"(Page Down)", "P↓"},
		{"(Insert)", "Ins"},
		{"(Delete)", "Del"},
		{"(`)", "~"},
		{"(鼠标按键)", "M"},
	}

function M:UpdateHotKey()
	local hotkey = _G[self:GetName().."HotKey"]
	if hotkey and hotkey:IsShown() and not MaoRUISettingDB["Actionbar"]["Hotkeys"] then
		hotkey:Hide()
		return
	end

	local text = hotkey:GetText()
	if not text then return end

	for _, value in pairs(replaces) do
		text = gsub(text, value[1], value[2])
	end

	if text == RANGE_INDICATOR then
		hotkey:SetText("")
	else
		hotkey:SetText(text)
	end
end

function M:StyleActionButton(button, cfg)
	if not button then return end
	if button.__styled then return end

	local buttonName = button:GetName()
	local icon = _G[buttonName.."Icon"]
	local flash = _G[buttonName.."Flash"]
	local flyoutBorder = _G[buttonName.."FlyoutBorder"]
	local flyoutBorderShadow = _G[buttonName.."FlyoutBorderShadow"]
	local hotkey = _G[buttonName.."HotKey"]
	local count = _G[buttonName.."Count"]
	local name = _G[buttonName.."Name"]
	local border = _G[buttonName.."Border"]
	local NewActionTexture = button.NewActionTexture
	local cooldown = _G[buttonName.."Cooldown"]
	local normalTexture = button:GetNormalTexture()
	local pushedTexture = button:GetPushedTexture()
	local highlightTexture = button:GetHighlightTexture()
	--normal buttons do not have a checked texture, but checkbuttons do and normal actionbuttons are checkbuttons
	local checkedTexture = nil
	if button.GetCheckedTexture then checkedTexture = button:GetCheckedTexture() end
	local floatingBG = _G[buttonName.."FloatingBG"]

	--hide stuff
	if floatingBG then floatingBG:Hide() end
	if NewActionTexture then NewActionTexture:SetTexture(nil) end

	--backdrop
	SetupBackdrop(button)

	--textures
	SetupTexture(icon, cfg.icon, "SetTexture", icon)
	SetupTexture(flash, cfg.flash, "SetTexture", flash)
	SetupTexture(flyoutBorder, cfg.flyoutBorder, "SetTexture", flyoutBorder)
	SetupTexture(flyoutBorderShadow, cfg.flyoutBorderShadow, "SetTexture", flyoutBorderShadow)
	SetupTexture(border, cfg.border, "SetTexture", border)
	SetupTexture(normalTexture, cfg.normalTexture, "SetNormalTexture", button)
	SetupTexture(pushedTexture, cfg.pushedTexture, "SetPushedTexture", button)
	SetupTexture(highlightTexture, cfg.highlightTexture, "SetHighlightTexture", button)
	SetupTexture(checkedTexture, cfg.checkedTexture, "SetCheckedTexture", button)
	highlightTexture:SetColorTexture(1, 1, 1, .25)

	--cooldown
	SetupCooldown(cooldown, cfg.cooldown)

	--no clue why but blizzard created count and duration on background layer, need to fix that
	local overlay = CreateFrame("Frame", nil, button)
	overlay:SetAllPoints()
	if count then
		if MaoRUISettingDB["Actionbar"]["Count"] then
			count:SetParent(overlay)
			SetupFontString(count, cfg.count)
		else
			count:Hide()
		end
	end
	if hotkey then
		if MaoRUISettingDB["Actionbar"]["Hotkeys"] then
			hotkey:SetParent(overlay)
			M.UpdateHotKey(button)
			SetupFontString(hotkey, cfg.hotkey)
		else
			hotkey:Hide()
		end
	end
	if name then
		if MaoRUISettingDB["Actionbar"]["Macro"] then
			name:SetParent(overlay)
			SetupFontString(name, cfg.name)
		else
			name:Hide()
		end
	end

	button.__styled = true
end

function M:StyleExtraActionButton(cfg)
	local button = ExtraActionButton1
	if button.__styled then return end

	local buttonName = button:GetName()
	local icon = _G[buttonName.."Icon"]
	--local flash = _G[buttonName.."Flash"] --wierd the template has two textures of the same name
	local hotkey = _G[buttonName.."HotKey"]
	local count = _G[buttonName.."Count"]
	local buttonstyle = button.style --artwork around the button
	local cooldown = _G[buttonName.."Cooldown"]

	local normalTexture = button:GetNormalTexture()
	local pushedTexture = button:GetPushedTexture()
	local highlightTexture = button:GetHighlightTexture()
	local checkedTexture = button:GetCheckedTexture()

	--backdrop
	SetupBackdrop(button)

	--textures
	SetupTexture(icon, cfg.icon, "SetTexture", icon)
	SetupTexture(buttonstyle, cfg.buttonstyle, "SetTexture", buttonstyle)
	SetupTexture(normalTexture, cfg.normalTexture, "SetNormalTexture", button)
	SetupTexture(pushedTexture, cfg.pushedTexture, "SetPushedTexture", button)
	SetupTexture(highlightTexture, cfg.highlightTexture, "SetHighlightTexture", button)
	SetupTexture(checkedTexture, cfg.checkedTexture, "SetCheckedTexture", button)
	highlightTexture:SetColorTexture(1, 1, 1, .25)

	--cooldown
	SetupCooldown(cooldown, cfg.cooldown)

	--hotkey, count
	if MaoRUISettingDB["Actionbar"]["Hotkeys"] then
		M.UpdateHotKey(button)
		SetupFontString(hotkey, cfg.hotkey)
	else
		hotkey:Hide()
	end
	if MaoRUISettingDB["Actionbar"]["Count"] then
		SetupFontString(count, cfg.count)
	else
		count:Hide()
	end

	button.__styled = true
end

function M:StyleAllActionButtons(cfg)
	for i = 1, NUM_ACTIONBAR_BUTTONS do
		M:StyleActionButton(_G["ActionButton"..i], cfg)
		M:StyleActionButton(_G["MultiBarBottomLeftButton"..i], cfg)
		M:StyleActionButton(_G["MultiBarBottomRightButton"..i], cfg)
		M:StyleActionButton(_G["MultiBarRightButton"..i], cfg)
		M:StyleActionButton(_G["MultiBarLeftButton"..i], cfg)
	end
	for i = 1, 6 do
		M:StyleActionButton(_G["OverrideActionBarButton"..i], cfg)
	end
	--petbar buttons
	for i = 1, NUM_PET_ACTION_SLOTS do
		M:StyleActionButton(_G["PetActionButton"..i], cfg)
	end
	--stancebar buttons
	for i = 1, NUM_STANCE_SLOTS do
		M:StyleActionButton(_G["StanceButton"..i], cfg)
	end
	--possess buttons
	for i = 1, NUM_POSSESS_SLOTS do
		M:StyleActionButton(_G["PossessButton"..i], cfg)
	end
	--extra action button
	M:StyleExtraActionButton(cfg)
	--spell flyout
	SpellFlyoutBackgroundEnd:SetTexture(nil)
	SpellFlyoutHorizontalBackground:SetTexture(nil)
	SpellFlyoutVerticalBackground:SetTexture(nil)
	local function checkForFlyoutButtons()
		local i = 1
		local button = _G["SpellFlyoutButton"..i]
		while button and button:IsShown() do
			M:StyleActionButton(button, cfg)
			i = i + 1
			button = _G["SpellFlyoutButton"..i]
		end
	end
	SpellFlyout:HookScript("OnShow", checkForFlyoutButtons)
end

function Bar:ReskinBars()
	local cfg = {
		icon = {
			texCoord = I.TexCoord,
			points = {
				{"TOPLEFT", 1, -1},
				{"BOTTOMRIGHT", -1, 1},
			},
		},
		flyoutBorder = {file = ""},
		flyoutBorderShadow = {file = ""},
		border = {file = ""},
		normalTexture = {
			file = I.textures.normal,
			texCoord = I.TexCoord,
			color = {.3, .3, .3},
			points = {
				{"TOPLEFT", 0, 0},
				{"BOTTOMRIGHT", 0, 0},
			},
		},
		flash = {file = I.textures.flash},
		pushedTexture = {file = I.textures.pushed},
		checkedTexture = {file = I.textures.checked},
		highlightTexture = {
			file = "",
			points = {
				{"TOPLEFT", 1, -1},
				{"BOTTOMRIGHT", -1, 1},
			},
		},
		cooldown = {
			points = {
				{"TOPLEFT", 0, 0},
				{"BOTTOMRIGHT", 0, 0},
			},
		},
		name = {
			font = I.Font,
			points = {
				{"BOTTOMLEFT", 0, 0},
				{"BOTTOMRIGHT", 0, 0},
			},
		},
		hotkey = {
			font = I.Font,
			points = {
				{"TOPRIGHT", 0, 0},
				{"TOPLEFT", 0, 0},
			},
		},
		count = {
			font = I.Font,
			points = {
				{"BOTTOMRIGHT", 2, 0},
			},
		},
		buttonstyle = { file = ""},
	}
	M:StyleAllActionButtons(cfg)
	hooksecurefunc("ActionButton_UpdateHotkeys", M.UpdateHotKey)
end


--[[==================================================== hide the artwork from blz ============================================================--
local Empty_Art = CreateFrame("frame", nil)
Empty_Art:Hide()

for i = 0,3 do _G["MainMenuBarTexture"..i]:SetParent(Empty_Art)	 	end				--Art of Exp Bar(include Keys&Bags)
for i = 0,3 do _G["MainMenuMaxLevelBar"..i]:SetParent(Empty_Art)	end				--Art of Exp Bar(When Exp & Rep hide)
for i = 1,2 do _G["PossessBackground"..i]:SetParent(Empty_Art)	 	end				--Art of Possess(When Bar Bottomleft)
for i = 0,1 do _G["SlidingActionBarTexture"..i]:SetParent(Empty_Art)end			--Art of Pet 	(When Bar Bottomleft)
for i = 1,19 do _G["MainMenuXPBarDiv"..i]:SetParent(Empty_Art)		end				--Art of Exp. Bar Grid

for i = 0,3 do ReputationWatchBar.StatusBar["WatchBarTexture"..i]:SetParent(Empty_Art)  end 	--Grid of Rep.
for i = 0,3 do ArtifactWatchBar.StatusBar["WatchBarTexture"..i]:SetParent(Empty_Art)  end		  --Grid of Arti.
for i = 0,3 do HonorWatchBar.StatusBar["WatchBarTexture"..i]:SetParent(Empty_Art)  end			  --Grid of Hor.
for i = 0,3 do ReputationWatchBar.StatusBar["XPBarTexture"..i]:SetParent(Empty_Art)  end		  --Grid of Rep.  ( when self show only )
for i = 0,3 do ArtifactWatchBar.StatusBar["XPBarTexture"..i]:SetParent(Empty_Art)  end			  --Grid of Arti. ( when self show only )
for i = 0,3 do HonorWatchBar.StatusBar["XPBarTexture"..i]:SetParent(Empty_Art) end				    --Grid of Hor. 	( when self show only )

for _, texture in next, {
	MainMenuBarPageNumber,ActionBarUpButton,ActionBarDownButton, 							            --Art of Bar Number
	MainMenuXPBarTextureLeftCap,MainMenuXPBarTextureRightCap,MainMenuXPBarTextureMid,  		--the background of xp bar bottom
	StanceBarLeft, StanceBarMiddle, StanceBarRight, } 										                --Art of StanceBar when BL hide
do	texture:SetParent(Empty_Art)  end]]

--[[------------------------------X   HotSpotMicroMenu by Sojik X ------------------------------]]--

local HotSpotMicroMenu = CreateFrame("Frame","MicroMenuHolder",UIParent)
local MicroButtons = {
CharacterMicroButton, SpellbookMicroButton, TalentMicroButton, AchievementMicroButton, QuestLogMicroButton, GuildMicroButton, LFDMicroButton, CollectionsMicroButton, EJMicroButton, StoreMicroButton, MainMenuMicroButton,}
--, HelpMicroButton, PVPMicroButton, SocialsMicroButton
local function MoveMicroButtons(skinName)
	for _, menu in pairs(MicroButtons) do
		menu:SetParent(HotSpotMicroMenu)
		menu:ClearAllPoints()
		menu:SetScale(0.775)
	end
	CharacterMicroButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", 3, -5)
	EJMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, -5) 
	CollectionsMicroButton:SetPoint("BOTTOMRIGHT", EJMicroButton, "TOPRIGHT", 0, -5)
	TalentMicroButton:SetPoint("BOTTOMRIGHT", CollectionsMicroButton, "TOPRIGHT", 0, -5) 
	LFDMicroButton:SetPoint("BOTTOMRIGHT", TalentMicroButton, "TOPRIGHT", 0, -5) 
	AchievementMicroButton:SetPoint("BOTTOMRIGHT", LFDMicroButton, "TOPRIGHT", 0, -5)
	SpellbookMicroButton:SetPoint("BOTTOMRIGHT", AchievementMicroButton, "TOPRIGHT", 0, -5)
	GuildMicroButton:SetPoint("BOTTOMRIGHT", SpellbookMicroButton, "TOPRIGHT", 0, -5)
	QuestLogMicroButton:SetPoint("BOTTOMRIGHT", GuildMicroButton, "TOPRIGHT", 0, -5)
	StoreMicroButton:SetPoint("BOTTOMRIGHT", QuestLogMicroButton, "TOPRIGHT", 0, -5)
	MainMenuMicroButton:SetPoint("BOTTOMRIGHT", StoreMicroButton, "TOPRIGHT", 0, -5)
end
HotSpotMicroMenu:RegisterEvent("PLAYER_ENTERING_WORLD")
HotSpotMicroMenu:SetScript("OnEvent", function()
  if not MaoRUISettingDB["Actionbar"]["Enable"] then return end
	hooksecurefunc("UpdateMicroButtons", MoveMicroButtons)
	MoveMicroButtons()
end)