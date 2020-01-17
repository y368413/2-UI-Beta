local _, ns = ...
local M, R, U, I = unpack(ns)
local Bar = M:GetModule("Actionbar")

-- Texture credit: 胡里胡涂
local _G = getfenv(0)
local tinsert, pairs, type = table.insert, pairs, type
local buttonList = {}

function Bar:MicroButton_SetupTexture(icon, texture)
	local r, g, b = I.r, I.g, I.b
	if not MaoRUISettingDB["Skins"]["ClassLine"] then r, g, b = 0, 0, 0 end

	icon:SetOutside(nil, 3, 3)
	icon:SetTexture(I.MicroTex..texture)
	icon:SetVertexColor(r, g, b)
end

function Bar:MicroButton_Create(parent, data)
	local texture, method, tooltip = unpack(data)

	local bu = CreateFrame("Frame", nil, parent)
	tinsert(buttonList, bu)
	bu:SetSize(21, 21)

	local icon = bu:CreateTexture(nil, "ARTWORK")
	Bar:MicroButton_SetupTexture(icon, texture)

	if type(method) == "string" then
		local button = _G[method]
		button:SetHitRectInsets(0, 0, 0, 0)
		button:SetParent(bu)
		button:ClearAllPoints(bu)
		button:SetAllPoints(bu)
		button.SetPoint = M.Dummy
		button:UnregisterAllEvents()
		button:SetNormalTexture(nil)
		button:SetPushedTexture(nil)
		button:SetDisabledTexture(nil)
		if tooltip then M.AddTooltip(button, "ANCHOR_RIGHT", tooltip) end

		local hl = button:GetHighlightTexture()
		Bar:MicroButton_SetupTexture(hl, texture)
		if not MaoRUISettingDB["Skins"]["ClassLine"] then hl:SetVertexColor(1, 1, 1) end

		local flash = button.Flash
		Bar:MicroButton_SetupTexture(flash, texture)
		if not MaoRUISettingDB["Skins"]["ClassLine"] then flash:SetVertexColor(1, 1, 1) end
	else
		bu:SetScript("OnMouseUp", method)
		M.AddTooltip(bu, "ANCHOR_RIGHT", tooltip)

		local hl = bu:CreateTexture(nil, "HIGHLIGHT")
		hl:SetBlendMode("ADD")
		Bar:MicroButton_SetupTexture(hl, texture)
		if not MaoRUISettingDB["Skins"]["ClassLine"] then hl:SetVertexColor(1, 1, 1) end
	end
end

function Bar:MicroMenu()
	if not MaoRUISettingDB["Actionbar"]["MicroMenu"] then return end

	local menubar = CreateFrame("Frame", nil, UIParent)
	menubar:SetSize(21, 185)
	M.Mover(menubar, U["Menubar"], "Menubar", R.Skins.MicroMenuPos)

	-- Generate Buttons
	local buttonInfo = {
		{"player", "CharacterMicroButton"},
		{"encounter", "EJMicroButton"},
		{"collections", "CollectionsMicroButton"},
		{"talents", "TalentMicroButton"},
		{"LFG", "LFDMicroButton"},
		{"achievements", "AchievementMicroButton"},
		{"spellbook", "SpellbookMicroButton"},
		{"guild", "GuildMicroButton"},
		{"quests", "QuestLogMicroButton"},
		{"store", "StoreMicroButton"},
		{"help", "MainMenuMicroButton", MicroButtonTooltipText(MAINMENU_BUTTON, "TOGGLEGAMEMENU")},
		{"bags", ToggleAllBags, MicroButtonTooltipText(BAGSLOT, "OPENALLBAGS")},
	}
	for _, info in pairs(buttonInfo) do
		Bar:MicroButton_Create(menubar, info)
	end

	-- Order Positions
	for i = 1, #buttonList do
		if i == 1 then
			buttonList[i]:SetPoint("BOTTOM")
		elseif i == 9 then
			buttonList[i]:SetPoint("BOTTOMLEFT", Minimap, "BOTTOMRIGHT", -1, -3)
		else
			buttonList[i]:SetPoint("BOTTOM", buttonList[i-1], "TOP", 0, 3)
		end
	end

	-- Default elements
	M.HideObject(MicroButtonPortrait)
	M.HideObject(GuildMicroButtonTabard)
	M.HideObject(MainMenuBarDownload)
	M.HideObject(HelpOpenWebTicketButton)
	M.HideObject(MainMenuBarPerformanceBar)
	MainMenuMicroButton:SetScript("OnUpdate", nil)

	CharacterMicroButtonAlert:EnableMouse(false)
	M.HideOption(CharacterMicroButtonAlert)
end