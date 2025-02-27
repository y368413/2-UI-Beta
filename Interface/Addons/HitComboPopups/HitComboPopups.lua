--------------------------------------
-- Use /hcp to config
-- If you want larger popups, swap the .tga files in Interface/Addons/HitComboPopups with the ones in the "Large Graphics" folder
-- For the default popup size, the standard graphics are recommended as scaling a large image down creates aliasing





-- Store the texture paths into a table
local texturePaths = {
"Interface\\AddOns\\HitComboPopups\\1hit.tga",
"Interface\\AddOns\\HitComboPopups\\2hit.tga",
"Interface\\AddOns\\HitComboPopups\\3hit.tga",
"Interface\\AddOns\\HitComboPopups\\4hit.tga",
"Interface\\AddOns\\HitComboPopups\\maxhit.tga"}

-- Default variable values
local popupScaleDefault = 1.5
local popupSizeDefault = 120
local popupPopDurationDefault = 0.15
local popupFadeDurationDefault = 1.7
local popupXOffsetDefault = 0
local popupYOffsetDefault = -75
local attachToPRDDefault = true

-- Create a frame for the event handler and register events
local eventFrame = CreateFrame("frame", "eventFrame")
eventFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterUnitEvent("UNIT_AURA", "player")

-- Initialize variables
local frame = CreateFrame("Frame", "HitComboPopups_Frame", UIParent)
local texture = frame:CreateTexture()
local configFrame = CreateFrame("Frame", "HitComboPopupsConfigFrame", UIParent, "BasicFrameTemplateWithInset")
local animationGroup = texture:CreateAnimationGroup()
local animScale = animationGroup:CreateAnimation("Scale", nil)
local animAlpha = animationGroup:CreateAnimation("Alpha", nil)

local function round(number, decimals)
    return (("%%.%df"):format(decimals)):format(number)
end

local function CreateAnimations()
	-- Create the pop animation based on the duration from the settings
	animScale:SetScaleFrom(hitComboPopupsVariables.popupScale, hitComboPopupsVariables.popupScale)
	animScale:SetScaleTo(1.0, 1.0)
	animScale:SetDuration(hitComboPopupsVariables.popupPopDuration)

	-- Create the fade out duration based on the fade duration from the settings, delayed by the time the pop animation takes
	animAlpha:SetFromAlpha(1.0)
	animAlpha:SetToAlpha(0.0)
	animAlpha:SetDuration(hitComboPopupsVariables.popupFadeDuration)
	animAlpha:SetStartDelay(hitComboPopupsVariables.popupPopDuration) 
	animAlpha:SetSmoothing("OUT")
	
	-- Set frame size
	frame:SetWidth(hitComboPopupsVariables.popupSize)
	frame:SetHeight(hitComboPopupsVariables.popupSize)
	
	-- Hide the frame when the animation is complete
	animationGroup:SetScript("OnFinished", function(self)
	frame:Hide()
	end)
end

local function SetDefaultVariables()
	hitComboPopupsVariables = {
		popupScale = popupScaleDefault,
		popupSize = popupSizeDefault,
		popupPopDuration = popupPopDurationDefault,
		popupFadeDuration = popupFadeDurationDefault,
		popupXOffset = popupXOffsetDefault,
		popupYOffset = popupYOffsetDefault,
		attachToPRD = attachToPRDDefault}
end

local function UpdateConfigWidgets()
	configFrame.editBoxXOffset:SetText(hitComboPopupsVariables.popupXOffset)
	configFrame.editBoxYOffset:SetText(hitComboPopupsVariables.popupYOffset)
	configFrame.sliderSize:SetValue(hitComboPopupsVariables.popupSize)
	configFrame.valueSize:SetText(hitComboPopupsVariables.popupSize)
	configFrame.sliderScale:SetValue(hitComboPopupsVariables.popupScale)
	configFrame.valueScale:SetText(hitComboPopupsVariables.popupScale)
	configFrame.sliderFadeDuration:SetValue(hitComboPopupsVariables.popupFadeDuration)
	configFrame.valueFadeDuration:SetText(hitComboPopupsVariables.popupFadeDuration)
	configFrame.sliderPopDuration:SetValue(hitComboPopupsVariables.popupPopDuration)
	configFrame.valuePopDuration:SetText(hitComboPopupsVariables.popupPopDuration)
	configFrame.tickboxPRD:SetChecked(hitComboPopupsVariables.attachToPRD)
end

local function InitializeHCP()
	-- Check variables, initialize defaults if the addon hasn't been used before
	if hitComboPopupsVariables == nil then
		SetDefaultVariables()
	end
	
	-- Create the animations based on the saved variables
	CreateAnimations()
	
	-- Create the addon's main display frame
	frame:SetFrameStrata("MEDIUM")
	frame:Hide()

	-- Add a texture to the frame to display the graphic
	texture:SetWidth(frame:GetWidth())
	texture:SetHeight(frame:GetHeight())
	texture:SetAllPoints(frame)
	
	-- Create window for config frame
	configFrame:SetSize(300, 500);
	configFrame:SetPoint("CENTER", UIParent, "CENTER");

	-- Add title to window
	configFrame.title = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.title:SetFontObject("GameFontHighlight")
	configFrame.title:SetPoint("LEFT", configFrame.TitleBg, "LEFT", 5, 0)
	configFrame.title:SetText("Hit Combo Popups Options")

	-- X offset title
	configFrame.titleXOffset = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titleXOffset:SetFontObject("GameFontHighlight")
	configFrame.titleXOffset:SetPoint("LEFT", configFrame, "TOPLEFT", 55, -45)
	configFrame.titleXOffset:SetText("X Offset")

	-- X offset box
	configFrame.editBoxXOffset = CreateFrame("EditBox", nil, configFrame, "InputBoxTemplate")
	configFrame.editBoxXOffset:SetPoint("TOP", configFrame.titleXOffset, "BOTTOM", 0, -7)
	configFrame.editBoxXOffset:SetHeight(15)
	configFrame.editBoxXOffset:SetWidth(100)
	configFrame.editBoxXOffset:SetMultiLine(false)
	configFrame.editBoxXOffset:SetAutoFocus(false)

	configFrame.editBoxXOffset:SetScript("OnEscapePressed", function()
		configFrame.editBoxXOffset:ClearFocus()
	end)

	configFrame.editBoxXOffset:SetScript("OnEditFocusLost", function(self)
		configFrame.editBoxXOffset:ClearFocus()
		local newNumber = tonumber(configFrame.editBoxXOffset:GetText())
		
		if newNumber ~= nil then
			hitComboPopupsVariables.popupXOffset = newNumber
			configFrame.editBoxXOffset:SetText(hitComboPopupsVariables.popupXOffset)
		else
			configFrame.editBoxXOffset:SetText(hitComboPopupsVariables.popupXOffset)
		end
	end)

	configFrame.editBoxXOffset:SetScript("OnEnterPressed", function(self)
		configFrame.editBoxXOffset:ClearFocus()
	end)

	
	
	--------------- CONFIG WIDGETS ---------------

	-- Y offset title
	configFrame.titleYOffset = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titleYOffset:SetFontObject("GameFontHighlight")
	configFrame.titleYOffset:SetPoint("RIGHT", configFrame, "TOPRIGHT", -53, -45)
	configFrame.titleYOffset:SetText("Y Offset")

	-- Y offset box
	configFrame.editBoxYOffset = CreateFrame("EditBox", nil, configFrame, "InputBoxTemplate")
	configFrame.editBoxYOffset:SetPoint("TOP", configFrame.titleYOffset, "BOTTOM", 0, -7)
	configFrame.editBoxYOffset:SetHeight(15)
	configFrame.editBoxYOffset:SetWidth(100)
	configFrame.editBoxYOffset:SetMultiLine(false)
	configFrame.editBoxYOffset:SetAutoFocus(false)
	configFrame.editBoxYOffset:SetScript("OnEscapePressed", function()
		configFrame.editBoxYOffset:ClearFocus()
	end)

	configFrame.editBoxYOffset:SetScript("OnEditFocusLost", function(self)
		configFrame.editBoxYOffset:ClearFocus()
		local newNumber = tonumber(configFrame.editBoxYOffset:GetText())
		
		if newNumber ~= nil then
			hitComboPopupsVariables.popupYOffset = newNumber
			configFrame.editBoxYOffset:SetText(hitComboPopupsVariables.popupYOffset)
		else
			configFrame.editBoxYOffset:SetText(hitComboPopupsVariables.popupYOffset)
		end
	end)

	configFrame.editBoxYOffset:SetScript("OnEnterPressed", function(self)
		configFrame.editBoxYOffset:ClearFocus()
	end)


	-- Size slider title
	configFrame.titleSize = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titleSize:SetFontObject("GameFontHighlight")
	configFrame.titleSize:SetPoint("TOP", configFrame, "TOP", 0, -100)
	configFrame.titleSize:SetText("Size")

	-- Size slider
	configFrame.sliderSize = CreateFrame("Slider", nil, configFrame, "OptionsSliderTemplate")
	configFrame.sliderSize:SetPoint("TOP", configFrame.titleSize, "BOTTOM", 0, -5)
	configFrame.sliderSize:SetWidth(242)
	configFrame.sliderSize:SetMinMaxValues(50, 500)

	configFrame.sliderSize:SetValueStep(1)
	configFrame.sliderSize:SetObeyStepOnDrag(true)

	-- Size slider value
	configFrame.valueSize = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.valueSize:SetFontObject("GameFontHighlight")
	configFrame.valueSize:SetPoint("TOP", configFrame.sliderSize, "BOTTOM", 0, 0)
	configFrame.sliderSize:SetScript("OnValueChanged", function(self,value)
		local newValue = round(value, 0)
		
		hitComboPopupsVariables.popupSize = newValue
		configFrame.valueSize:SetText(newValue)
	end)


	-- Pop Scale slider title
	configFrame.titleScale = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titleScale:SetFontObject("GameFontHighlight")
	configFrame.titleScale:SetPoint("TOP", configFrame.valueSize, "TOP", 0, -40)
	configFrame.titleScale:SetText("Pop Scale")

	-- Pop Scale slider
	configFrame.sliderScale = CreateFrame("Slider", nil, configFrame, "OptionsSliderTemplate")
	configFrame.sliderScale:SetPoint("TOP", configFrame.titleScale, "BOTTOM", 0, -5)
	configFrame.sliderScale:SetWidth(242)
	configFrame.sliderScale:SetMinMaxValues(0.5, 5.0)

	configFrame.sliderScale:SetValueStep(0.1)
	configFrame.sliderScale:SetObeyStepOnDrag(true)

	-- Pop Scale slider value
	configFrame.valueScale = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.valueScale:SetFontObject("GameFontHighlight")
	configFrame.valueScale:SetPoint("TOP", configFrame.sliderScale, "BOTTOM", 0, 0)
	configFrame.sliderScale:SetScript("OnValueChanged", function(self,value)
		local newValue = round(value, 1)
		
		hitComboPopupsVariables.popupScale = newValue
		configFrame.valueScale:SetText(newValue)
	end)


	-- Fade Duration slider title
	configFrame.titleFadeDuration = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titleFadeDuration:SetFontObject("GameFontHighlight")
	configFrame.titleFadeDuration:SetPoint("TOP", configFrame.valueScale, "TOP", 0, -40)
	configFrame.titleFadeDuration:SetText("Fadeout Duration")

	-- Fade Duration slider
	configFrame.sliderFadeDuration = CreateFrame("Slider", nil, configFrame, "OptionsSliderTemplate")
	configFrame.sliderFadeDuration:SetPoint("TOP", configFrame.titleFadeDuration, "BOTTOM", 0, -5)
	configFrame.sliderFadeDuration:SetWidth(242)
	configFrame.sliderFadeDuration:SetMinMaxValues(0.2, 5.0)

	configFrame.sliderFadeDuration:SetValueStep(0.05)
	configFrame.sliderFadeDuration:SetObeyStepOnDrag(true)

	-- Fade Duration value
	configFrame.valueFadeDuration = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.valueFadeDuration:SetFontObject("GameFontHighlight")
	configFrame.valueFadeDuration:SetPoint("TOP", configFrame.sliderFadeDuration, "BOTTOM", 0, 0)
	configFrame.sliderFadeDuration:SetScript("OnValueChanged", function(self,value)
		local newValue = round(value, 1)
		
		hitComboPopupsVariables.popupFadeDuration = newValue
		configFrame.valueFadeDuration:SetText(newValue)
	end)
	
	
	-- Pop Duration slider title
	configFrame.titlePopDuration = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.titlePopDuration:SetFontObject("GameFontHighlight")
	configFrame.titlePopDuration:SetPoint("TOP", configFrame.valueFadeDuration, "TOP", 0, -40)
	configFrame.titlePopDuration:SetText("Pop Animation Duration")

	-- Pop Duration slider
	configFrame.sliderPopDuration = CreateFrame("Slider", nil, configFrame, "OptionsSliderTemplate")
	configFrame.sliderPopDuration:SetPoint("TOP", configFrame.titlePopDuration, "BOTTOM", 0, -5)
	configFrame.sliderPopDuration:SetWidth(242)
	configFrame.sliderPopDuration:SetMinMaxValues(0, 5.0)

	configFrame.sliderPopDuration:SetValueStep(0.05)
	configFrame.sliderPopDuration:SetObeyStepOnDrag(true)

	-- Pop Duration value
	configFrame.valuePopDuration = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.valuePopDuration:SetFontObject("GameFontHighlight")
	configFrame.valuePopDuration:SetPoint("TOP", configFrame.sliderPopDuration, "BOTTOM", 0, 0)
	configFrame.sliderPopDuration:SetScript("OnValueChanged", function(self,value)
		local newValue = round(value, 2)
		
		hitComboPopupsVariables.popupPopDuration = newValue
		configFrame.valuePopDuration:SetText(newValue)
	end)


	-- Anchor to PRD button
	configFrame.tickboxPRD = CreateFrame("CheckButton", nil, configFrame, "ChatConfigCheckButtonTemplate");
	configFrame.tickboxPRD:SetPoint("TOP", configFrame.valuePopDuration, "BOTTOM", -112, -30)
	configFrame.PRDText = configFrame:CreateFontString(nil, "OVERLAY")
	configFrame.PRDText:SetPoint("LEFT", configFrame.tickboxPRD, "RIGHT", 5, 0)
	configFrame.PRDText:SetFontObject("GameFontHighlight")
	configFrame.PRDText:SetText("Anchor to personal resource bar")

	configFrame.tickboxPRD:SetScript("OnClick", function()
		hitComboPopupsVariables.attachToPRD = configFrame.tickboxPRD:GetChecked()
	end);
	
	
	-- Reset to defaults button
	configFrame.resetButton = CreateFrame("Button", nil, configFrame, "UIPanelButtonTemplate")
	configFrame.resetButton:SetSize(110, 22)
	configFrame.resetButton:SetText("Reset Defaults")
	configFrame.resetButton:SetPoint("TOP", configFrame.tickboxPRD, "BOTTOM", 113, -27)
	configFrame.resetButton:SetScript("OnClick", function()
		SetDefaultVariables()
		UpdateConfigWidgets()
	end)
	
	--------------- END CONFIG WIDGETS ---------------
	
	
	
	-- Fill all the settings with the saved variables when the settings frame appears
	configFrame:SetScript("OnShow", function(self)
		UpdateConfigWidgets()
	end)

	-- Remake the animations when the settings window is closed
	configFrame:SetScript("OnHide", function(self)
		CreateAnimations()
	end)

	-- Allow the window to be closed with the escape key
	tinsert(UISpecialFrames, configFrame:GetName())

end


-- Register the slash command to open the settings menu
SLASH_HITCOMBOPOPUPS1 = "/hcp"
function SlashCmdList.HITCOMBOPOPUPS(msg, editbox)
	configFrame:SetShown(not configFrame:IsShown())
end


local function showPopup(aura)
	if hitComboPopupsVariables.attachToPRD then
		frame:SetPoint("CENTER", C_NamePlate.GetNamePlateForUnit("player"), "CENTER", hitComboPopupsVariables.popupXOffset, hitComboPopupsVariables.popupYOffset)
	else
		frame:SetPoint("CENTER", UIParent, "CENTER", hitComboPopupsVariables.popupXOffset, hitComboPopupsVariables.popupYOffset)
	end
	-- Stop the animation in case it's still going, set the texture, show the frame, and play the animation
	animationGroup:Stop()
	texture:SetTexture(texturePaths[aura.applications])
	frame:Show()
	animationGroup:Play()
end

-- Event handler
eventFrame:SetScript("OnEvent", function(self, event, unit, info)
	if event == "UNIT_AURA" then
		if info.addedAuras then
			for _, v in pairs(info.addedAuras) do
				if v.spellId == 196741 then
					showPopup(v)
				end
			end
		end
	
		if info.updatedAuraInstanceIDs then
			for _, v in pairs(info.updatedAuraInstanceIDs) do
				local aura = C_UnitAuras.GetAuraDataByAuraInstanceID(unit, v)
				if aura ~= nil then
					if aura.spellId == 196741 then
						showPopup(aura)
					end
				end
			end
		end
	elseif event == "NAME_PLATE_UNIT_ADDED" then
		if hitComboPopupsVariables.attachToPRD then
			frame:SetPoint("CENTER", C_NamePlate.GetNamePlateForUnit("player"), "CENTER", hitComboPopupsVariables.popupXOffset, hitComboPopupsVariables.popupYOffset)
		end
	elseif event == "ADDON_LOADED" then
		InitializeHCP()
		self:UnregisterEvent("ADDON_LOADED")
	end
end)