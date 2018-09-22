function PLH_CreateOptionsPanel()

	--[[ Main Panel ]]--
	local configFrame = CreateFrame('Frame', 'PLHConfigFrame', InterfaceOptionsFramePanelContainer)
	configFrame:Hide()
	configFrame.name = PLH_LONG_ADDON_NAME
	InterfaceOptions_AddCategory(configFrame)

	--[[ Title ]]--
	local titleLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
	titleLabel:SetPoint('TOPLEFT', configFrame, 'TOPLEFT', 16, -16)
	titleLabel:SetText('Personal Loot Helper (PLH)')

	-- [[ Version ]] --
	local versionLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	versionLabel:SetPoint('BOTTOMLEFT', titleLabel, 'BOTTOMRIGHT', 8, 0)
	versionLabel:SetText('v2.08')

	--[[ Author ]]--
	local authorLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	authorLabel:SetPoint('TOPRIGHT', configFrame, 'TOPRIGHT', -16, -24)
	authorLabel:SetText("Author: Madone-Zul'Jin")

	--[[ Display Options ]]--
	local displayLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	displayLabel:SetPoint('TOPLEFT', titleLabel, 'BOTTOMLEFT', 20, -20)
	displayLabel:SetText(OPTIONS)


	--[[ PLH_PREFS_SKIP_CONFIRMATION ]]--
	local skipConfirmationCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	skipConfirmationCheckbox:SetPoint('TOPLEFT', displayLabel, 'BOTTOMLEFT', 20, -5)
	skipConfirmationCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION])

	local skipConfirmationLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	skipConfirmationLabel:SetPoint('LEFT', skipConfirmationCheckbox, 'RIGHT', 0, 0)
	skipConfirmationLabel:SetText(PLH_QUICK_GET)

	local announceTradesCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	announceTradesCheckbox:SetPoint('TOPLEFT', skipConfirmationCheckbox, 'BOTTOMLEFT', 0, -5)
	announceTradesCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION])

	local announceTradeLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	announceTradeLabel:SetPoint('LEFT', announceTradesCheckbox, 'RIGHT', 0, 0)
	announceTradeLabel:SetText("Announce completed trades (guild groups only)")
	
	--[[ Looter Options ]]--
	--local looterLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	--looterLabel:SetPoint('TOPLEFT', skipConfirmationCheckbox, 'BOTTOMLEFT', -20, -15)
	--looterLabel:SetText("当我拾取到可以交易的战利品...")
	
	--[[ PLH_PREFS_ONLY_OFFER_IF_UPGRADE ]]
	local onlyOfferIfUpgradeCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	onlyOfferIfUpgradeCheckbox:SetPoint('TOPLEFT', skipConfirmationCheckbox, 'BOTTOMLEFT', 0, -5)
	onlyOfferIfUpgradeCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_ONLY_OFFER_IF_UPGRADE])

	local onlyOfferIfUpgradeLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	onlyOfferIfUpgradeLabel:SetPoint('LEFT', onlyOfferIfUpgradeCheckbox, 'RIGHT', 0, 0)
	onlyOfferIfUpgradeLabel:SetText(PLH_ADDON_NOTE)

	--[[ PLH_PREFS_NEVER_OFFER_BOE ]]--
	local neverOfferBOECheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	neverOfferBOECheckbox:SetPoint('TOPLEFT', onlyOfferIfUpgradeCheckbox, 'BOTTOMLEFT', 0, -5)
	neverOfferBOECheckbox:SetChecked(PLH_PREFS[PLH_PREFS_NEVER_OFFER_BOE])

	local neverOfferBOELabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	neverOfferBOELabel:SetPoint('LEFT', neverOfferBOECheckbox, 'RIGHT', 0, 0)
	neverOfferBOELabel:SetText(PLH_INCLUDE_BOEITEM)

	-- [[ PLH_PREFS_SHOW_TRADEABLE_ALERT ]] --
	local showTradeableAlertCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	showTradeableAlertCheckbox:SetPoint('TOPLEFT', neverOfferBOECheckbox, 'BOTTOMLEFT', 0, -5)
	showTradeableAlertCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_SHOW_TRADEABLE_ALERT])

	local showTradeableAlertLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	showTradeableAlertLabel:SetPoint('LEFT', showTradeableAlertCheckbox, 'RIGHT', 0, 0)
	showTradeableAlertLabel:SetText(PLH_CAN_LOOT_LIST)
	
	--[[ Non-looter Options ]]--
	--local nonLooterLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	--nonLooterLabel:SetPoint('TOPLEFT', showTradeableAlertCheckbox, 'BOTTOMLEFT', -20, -15)
	--nonLooterLabel:SetText("当队友有可以交易的战利品...")

	--[[ PLH_PREFS_CURRENT_SPEC_ONLY ]]--
	local currentSpecOnlyCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	currentSpecOnlyCheckbox:SetPoint('TOPLEFT', showTradeableAlertCheckbox, 'BOTTOMLEFT', 0, -15)
	currentSpecOnlyCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY])

	local currentSpecOnlyLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	currentSpecOnlyLabel:SetPoint('LEFT', currentSpecOnlyCheckbox, 'RIGHT', 0, 0)
	currentSpecOnlyLabel:SetText(PLH_ONLY_CAN_EQUIP)

	--[[ PLH_PREFS_ILVL_THRESHOLD ]]--

	local ilvlThresholdLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	ilvlThresholdLabel:SetPoint('TOPLEFT', currentSpecOnlyCheckbox, 'BOTTOMLEFT', 5, -10)
	ilvlThresholdLabel:SetText(PLH_ONLY_NOTICE)

	local ilvlThresholdValue = {
		0,
		-1,
		-6,
		-11,
		-16,
		-21,
		-26,
		-31,
		-9999
	}

	local ilvlThresholdDescription = {
		EQUIPSET_EQUIP..LEVEL.." >  "..CURRENTLY_EQUIPPED,
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED,
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -5",
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -10",
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -15",
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -20",
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -25",
		EQUIPSET_EQUIP..LEVEL.." >= "..CURRENTLY_EQUIPPED.." -30",
		ALL
	}

	local ilvlThresholdMenu = CreateFrame('Button', 'ilvlThresholdMenu', configFrame, 'UIDropDownMenuTemplate')
	ilvlThresholdMenu:SetPoint('LEFT', ilvlThresholdLabel, 'RIGHT', -5, 0)

	local function ilvlThresholdMenu_OnClick(self, arg1, arg2, checked)
		MSA_DropDownMenu_SetText(ilvlThresholdMenu, ilvlThresholdDescription[arg1])
	end

	local function ilvlThresholdMenu_Initialize(self, level)
		local info = MSA_DropDownMenu_CreateInfo()
		info.func = ilvlThresholdMenu_OnClick
		for i = 1, #ilvlThresholdValue do
			info.arg1 = i
			info.text = ilvlThresholdDescription[i]
			MSA_DropDownMenu_AddButton(info)
		end
	end

	MSA_DropDownMenu_Initialize(ilvlThresholdMenu, ilvlThresholdMenu_Initialize)
	MSA_DropDownMenu_SetWidth(ilvlThresholdMenu, 300);
	MSA_DropDownMenu_JustifyText(ilvlThresholdMenu, 'LEFT')

	local function GetILVLThresholdDescription(ilvlThreshold)
		for i = 1, #ilvlThresholdValue do
			if ilvlThresholdValue[i] == ilvlThreshold then
				return ilvlThresholdDescription[i]
			end
		end
		return ilvlThresholdDescription[2]  -- we couldn't find a match, so return default
	end

	local function GetILVLThresholdValue(description)
		for i = 1, #ilvlThresholdDescription do
			if ilvlThresholdDescription[i] == description then
				return ilvlThresholdValue[i]
			end
		end
		return ilvlThresholdValue[2]  -- we couldn't find a match, so return default
	end

	MSA_DropDownMenu_SetText(ilvlThresholdMenu, GetILVLThresholdDescription(PLH_PREFS[PLH_PREFS_ILVL_THRESHOLD]))
	
	--[[ PLH_PREFS_INCLUDE_XMOG ]]--
	
	local includeXMOGCheckbox = CreateFrame('CheckButton', nil, configFrame, 'InterfaceOptionsCheckButtonTemplate')
	includeXMOGCheckbox:SetPoint('TOPLEFT', neverOfferBOECheckbox, 'BOTTOMLEFT', 0, -110)
	includeXMOGCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_INCLUDE_XMOG])

	local includeXMOGLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	includeXMOGLabel:SetPoint('LEFT', includeXMOGCheckbox, 'RIGHT', 0, 0)
	includeXMOGLabel:SetText(PLH_SHOW_TRANSMOG)

	-- [[ PLH_PREFS_WHISPER_MESSAGE ]]--
	
	local whisperMessageLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	whisperMessageLabel:SetPoint('TOPLEFT', includeXMOGCheckbox, 'BOTTOMLEFT', -20, -15)
	whisperMessageLabel:SetText(PLH_ASK_ITEMS)
	whisperMessageLabel:SetWordWrap(true)
	whisperMessageLabel:SetJustifyH('LEFT')
	whisperMessageLabel:SetWidth(500)
	whisperMessageLabel:SetSpacing(3)

	local whisperMessageEditBox = CreateFrame('EditBox', nil, configFrame)
	whisperMessageEditBox:SetWidth(450)
	whisperMessageEditBox:SetHeight(30)
	whisperMessageEditBox:SetTextInsets(4, 4, 4, 4)
	whisperMessageEditBox:SetMaxLetters(100)
	whisperMessageEditBox:SetAutoFocus(false)
	whisperMessageEditBox:SetFont(STANDARD_TEXT_FONT, 12)
	whisperMessageEditBox:SetPoint('TOPLEFT', whisperMessageLabel, 'BOTTOMLEFT', 20, -10)
	whisperMessageEditBox:SetText(PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE])
	
	local whisperMessageEditBoxBackdrop = {
		bgFile = nil, 
		edgeFile = 'Interface/Tooltips/UI-Tooltip-Border',
		tile = false,
		tileSize = 8,
		edgeSize = 8,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	}

	local whisperMessageEditBoxBorder = CreateFrame('Frame', nil, whisperMessageEditBox)
	whisperMessageEditBoxBorder:SetWidth(whisperMessageEditBox:GetWidth() + 5)
	whisperMessageEditBoxBorder:SetHeight(whisperMessageEditBox:GetHeight() + 5)
	whisperMessageEditBoxBorder:SetPoint('CENTER', whisperMessageEditBox, 'CENTER')
	whisperMessageEditBoxBorder:SetBackdrop(whisperMessageEditBoxBackdrop)

	--[[ Thank You Message ]] --
	local thankYouLabel = configFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
	thankYouLabel:SetPoint('BOTTOM', configFrame, 'BOTTOM', 0, 24)
	thankYouLabel:SetSpacing(5)
	thankYouLabel:SetWidth(500)
	thankYouLabel:SetWordWrap(true)
	
	local function UpdateThankYouLabel()
		thankYouLabel:SetText('' .. "\n" .. PLH_THANKS_ALL)
	end
	
	--[[ OnShow Event]]
	configFrame:SetScript('OnShow', function(frame)
		skipConfirmationCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION])
		announceTradesCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_ANNOUNCE_TRADES])
		onlyOfferIfUpgradeCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_ONLY_OFFER_IF_UPGRADE])
		neverOfferBOECheckbox:SetChecked(PLH_PREFS[PLH_PREFS_NEVER_OFFER_BOE])
		showTradeableAlertCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_SHOW_TRADEABLE_ALERT])
		currentSpecOnlyCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY])
		MSA_DropDownMenu_SetText(ilvlThresholdMenu, GetILVLThresholdDescription(PLH_PREFS[PLH_PREFS_ILVL_THRESHOLD]))
		includeXMOGCheckbox:SetChecked(PLH_PREFS[PLH_PREFS_INCLUDE_XMOG])
		whisperMessageEditBox:SetText(PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE])
		UpdateThankYouLabel()
	end)

	--[[ Okay Action ]]--
	function configFrame.okay(arg1, arg2, arg3, ...)
		PLH_PREFS[PLH_PREFS_SKIP_CONFIRMATION] = skipConfirmationCheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_ANNOUNCE_TRADES] = announceTradesCheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_ONLY_OFFER_IF_UPGRADE] = onlyOfferIfUpgradeCheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_NEVER_OFFER_BOE] = neverOfferBOECheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_SHOW_TRADEABLE_ALERT] = showTradeableAlertCheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_CURRENT_SPEC_ONLY] = currentSpecOnlyCheckbox:GetChecked()
		PLH_PREFS[PLH_PREFS_ILVL_THRESHOLD] = GetILVLThresholdValue(MSA_DropDownMenu_GetText(ilvlThresholdMenu))
		PLH_PREFS[PLH_PREFS_INCLUDE_XMOG] = includeXMOGCheckbox:GetChecked()
		if PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE] ~= whisperMessageEditBox:GetText() then
			PLH_PREFS[PLH_PREFS_WHISPER_MESSAGE] = whisperMessageEditBox:GetText()
			PLH_META[PLH_SHOW_WHISPER_WARNING] = true
		end
	end

end