--## Author: Metriss - Stormrage  ## Version: 1
ESSENCE_SET_MANAGER_ADDON = ESSENCE_SET_MANAGER_ADDON or LibStub("AceAddon-3.0"):NewAddon("ESSENCE_SET_MANAGER_ADDON", "AceConsole-3.0")
local esm = ESSENCE_SET_MANAGER_ADDON
local _G = _G
local setButtons = {}
local setNames = {}

local MAX_SETS = 7
local Y_OFFSET = -70
local SLOT_MAJOR = 115
local SLOT_MINOR1 = 116
local SLOT_MINOR2 = 117
local SLOT_MINOR3 = 119
local CHANGE_SPELL_IDS = {227041, 256231, 226241, 256229}

esm.specProfiles = {}
esm.ae = C_AzeriteEssence

local eventHandlerFrame = CreateFrame("Frame")
eventHandlerFrame:RegisterEvent("ADDON_LOADED")
eventHandlerFrame:RegisterEvent("AZERITE_ESSENCE_UPDATE")
eventHandlerFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
eventHandlerFrame:SetScript("OnEvent", function(self, event, arg1)
	if event == "ADDON_LOADED" then
		if arg1 == "_ShiGuang" then
			if ShiGuangPerDB.EssenceSetManager == nil then ShiGuangPerDB.EssenceSetManager = {} end
			esm.specProfiles = ShiGuangPerDB.EssenceSetManager
			esm.createFonts()
		elseif arg1 == "Blizzard_AzeriteEssenceUI" then
			esm.createSaveFrames()
			_G.AzeriteEssenceUI:HookScript("OnShow", function() esm.azeriteUIShow() end)
			_G.AzeriteEssenceUI:HookScript("OnHide", function() esm.azeriteUIHide() end)
			eventHandlerFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
		end
	elseif event == "PLAYER_SPECIALIZATION_CHANGED" or event == "PLAYER_ENTERING_WORLD" then
		esm.currentSpec = esm.getSpecName()
		esm.createSpecSet(esm.currentSpec)
		esm.updateSetNames()
		if event == "PLAYER_SPECIALIZATION_CHANGED" then
			esm.updateSetButtons()
			esm.input:SetText("")
		end
	elseif event == "AZERITE_ESSENCE_UPDATE" then
		esm.updateSetButtons()
		esm.updateInfoTooltip()
	elseif event == "PLAYER_UPDATE_RESTING" then
		esm.saturation = esm.checkIfCanChange()
		esm.updateBtnSaturation()
	elseif event == "UNIT_AURA" and arg1 == "player" then
		esm.saturation = esm.checkIfCanChange()
		esm.updateBtnSaturation()
	end
end)

esm.azeriteUIShow = function()
	eventHandlerFrame:RegisterEvent("PLAYER_UPDATE_RESTING")
	eventHandlerFrame:RegisterEvent("UNIT_AURA")
	esm.updateSetButtons()
end

esm.azeriteUIHide = function()
	eventHandlerFrame:UnregisterEvent("PLAYER_UPDATE_RESTING")
	eventHandlerFrame:UnregisterEvent("UNIT_AURA")
end

esm.getSpecName = function()
	local currentSpec = GetSpecialization()
	local currentSpecName = currentSpec and select(2, GetSpecializationInfo(currentSpec)) or "None"
	return currentSpecName
end

esm.updateBtnSaturation = function()
	for i=0, #(setButtons) do
		setButtons[i].tex:SetDesaturated(esm.saturation)
	end
end

esm.createSpecSet = function(spec)
	if esm.specProfiles[spec] == nil then
		esm.specProfiles[spec] = {}
	end
end

esm.updateSetNames = function()
	setNames = {}
	for k,v in pairs(esm.specProfiles[esm.currentSpec]) do
		table.insert(setNames, k)
	end
end

esm.pairsByKeys = function(t)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a,  function(a,b) return b>a end)
    local i = 0 
    local iter = function () 
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
     end
     return iter
end


esm.updateSetButtons = function()
	if ElvUI then --more room if you use ElvUI because the giant azerite icon isn't there
		Y_OFFSET = -40
		MAX_SETS = 8
	end
	esm.saturation = esm.checkIfCanChange()
	esm.createSetFromEquipped()
	esm.getUnlockedCount()
	local i = 0
	for name, line in esm.pairsByKeys(esm.specProfiles[esm.currentSpec]) do
		esm.createSetButton(name, i)
		i = i + 1
    end
	if (#(setButtons)+1) > i then --hide unused buttons if you delete some
		for ii=i, #(setButtons)+1 do
			if setButtons[ii] then
				setButtons[ii]:Hide()
			end
		end
	end
end

esm.createFonts = function()
	local fontStr = "Fonts\\FRIZQT___CYR.TTF"

	esm.fontWhite = CreateFont("noMatch")
	esm.fontWhite:CopyFontObject("GameFontNormal");
	esm.fontWhite:SetTextColor(1, 1, 1, 1.0);
	esm.fontWhite:SetFont(fontStr, 14, "OUTLINE")
	
	esm.fontGreen = CreateFont("Match")
	esm.fontGreen:CopyFontObject("GameFontNormal");
	esm.fontGreen:SetTextColor(0, 1, 0, 1.0);
	esm.fontGreen:SetFont(fontStr, 15, "OUTLINE")
	
	esm.fontRed = CreateFont("Missing")
	esm.fontRed:CopyFontObject("GameFontNormal");
	esm.fontRed:SetTextColor(1, 0, 0, 1.0);
	esm.fontRed:SetFont(fontStr, 14, "OUTLINE")

end

esm.createSaveFrames = function()
	esm.input = CreateFrame("EditBox", "", AzeriteEssenceUI, "InputBoxTemplate");
	esm.input:SetPoint("TOPLEFT", AzeriteEssenceUI, "TOPLEFT" , 80, -35)
	esm.input:SetFrameStrata("DIALOG")
	esm.input:SetSize(80,30)
	esm.input:SetMultiLine(false)
    esm.input:SetAutoFocus(false)
	esm.input:SetMaxLetters(10)
	esm.input:SetScript("OnTextChanged", function() esm.inputTextChanged() end)

	esm.save = CreateFrame("Button", "", esm.input, "UIPanelButtonTemplate")
	esm.save:SetPoint("RIGHT", esm.input, "RIGHT" , 85, 0)
	esm.save:SetWidth(80)
	esm.save:SetHeight(25)
	esm.save:SetNormalFontObject("GameFontNormal")
	esm.save:SetScript("OnClick", function() esm.saveButtonPress(esm.save) end)
	esm.save:SetText("Create")
	esm.save:Disable()

end

esm.getFont = function(set)
	if esm.isMissingEssence(set) then
		useFont = esm.fontRed
	else
		local match = true
		if set.major.ID ~= esm.equippedMajorID then
			match = false
		else
			for k,v in pairs(set.minors) do
				if v.ID then
					if not tContains(esm.equippedMinorIDs, v.ID) then
						match = false
					end
				end
			end
		end
		if match then
			useFont = esm.fontGreen
		else
			useFont = esm.fontWhite
		end
	end
	return useFont
end

esm.createSetButton = function(text, i)
	local set = esm.specProfiles[esm.currentSpec][text]
	if not setButtons[i] then
		setButtons[i] = CreateFrame("Button", "", AzeriteEssenceUI, "UIPanelButtonTemplate")
		setButtons[i]:SetPoint("TOPLEFT", AzeriteEssenceUI, "TOPLEFT" , 15, Y_OFFSET + -50 * i)
		setButtons[i]:SetWidth(50)
		setButtons[i]:SetHeight(50)
		setButtons[i]:SetScript("OnClick", function() esm.setButtonPress(setButtons[i]) end)
		setButtons[i]:SetScript("OnEnter", function() esm.showInfoTooltip(setButtons[i]) end)
		setButtons[i]:SetScript("OnLeave", function() esm.hideInfoTooltip(setButtons[i]) end)
		setButtons[i].tex = setButtons[i]:CreateTexture()
		setButtons[i].tex:SetAllPoints()
	end
	local useFont = esm.getFont(set)
	if set.major.ID then
		setButtons[i].tex:SetTexture(esm.ae.GetEssenceInfo(set.major.ID).icon)
		setButtons[i].tex:SetDesaturated(esm.saturation)
	end
	setButtons[i]:SetNormalFontObject(useFont)
	setButtons[i]:SetHighlightFontObject(useFont)
	setButtons[i]:Show()
	setButtons[i].setName = text
	setButtons[i]:SetText(esm.getSplitText(text))
end

esm.getSplitText = function(text)
	part1, part2 = strsplit(" ", text, 2)
	if part1 and part2 then
		return part1 .. "\n" .. part2
	else
		return text
	end
end

esm.getUnlockedCount = function()
	esm.unlocked = 0
	local azeriteItemLocation = C_AzeriteItem.FindActiveAzeriteItem()
    local level = C_AzeriteItem.GetPowerLevel(azeriteItemLocation)

	if level >= 75 then
		esm.unlocked = 4
	elseif level >= 65 then
		esm.unlocked = 3
	elseif level >= 55 then
		esm.unlocked = 2
	elseif level >= 35 then
		esm.unlocked = 1
	end
end

esm.isMissingEssence = function(set, unlocked)	
	local saveCount = 0
	if set.major.ID then
		saveCount = 1
	end
	
	saveCount = saveCount + #(set.minors)

	for k, v in pairs(set.minors) do
		if v.ID then
			saveCount = saveCount + 1
		end
	end
	
	if saveCount < esm.unlocked then
		return true
	end
	
end

esm.addTooltipLine = function(type, essence, setName)
	local r, g, b
	local match = false
	local emptyText = "|cffff0009<EMPTY>|r"
	local text = essence.name or emptyText
	if type == "major" then
		if esm.equippedMajorID == essence.ID then
			match = true
		end
	else
		text = "|cffffc500>|r"..text
		if tContains(esm.equippedMinorIDs, essence.ID) then
			match = true
		end
	end
	if match then
		r, g, b = 0, 1, 0
	else
		r, g, b = 1, 1, 1
	end
	GameTooltip:AddLine(text, r, g, b)

end

esm.showInfoTooltip = function(button)
	esm.currentButton = button
	GameTooltip:SetOwner(button, "ANCHOR_RIGHT")
	local major = esm.specProfiles[esm.currentSpec][button.setName].major
	local minors = esm.specProfiles[esm.currentSpec][button.setName].minors
	local emptyText = "|cffff0009<EMPTY>|r"
	local mOneName, mTwoName, mThreeName
	
	esm.addTooltipLine("major", major, button.setName)
	if esm.unlocked >= 2 then
		esm.addTooltipLine("minor", minors.one, button.setName)
	end
	if esm.unlocked >= 3 then
		esm.addTooltipLine("minor", minors.two, button.setName)
	end
	if esm.unlocked >= 4 then
		esm.addTooltipLine("minor", minors.three, button.setName)
	end
	
	GameTooltip:AddLine(" ")
	GameTooltip:AddLine("|cffeda55fShift-Click |r to |cfff98f00 Update/Overwrite |r")
	GameTooltip:AddLine("|cffeda55fShift-CTRL-Click |r to |cffff0009 Delete |r")
	GameTooltip:Show()
end


esm.hideInfoTooltip = function(button)
	GameTooltip:Hide()
	esm.currentButton = nil
end

esm.updateInfoTooltip = function()
	if esm.currentButton then
		esm.showInfoTooltip(esm.currentButton)
	end
end

esm.saveButtonPress = function()
	if esm.input:GetText() ~= "" then
		esm.saveSet(esm.input:GetText())
		esm.input:SetText("")
	end
end

esm.setButtonPress = function(button)
	if IsShiftKeyDown() then
		if IsControlKeyDown() then
			esm.deleteSet(button.setName)
			esm.updateSetButtons()
		else
			esm.saveSet(button.setName)
		end
	else
		esm.activateSet(button.setName)
	end
end

esm.inputTextChanged = function()
	if esm.input:GetText() == "" then
		esm.save:Disable()
	else
		esm.save:Show()
		esm.save:Enable()
		esm.save:Hide()
		esm.save:Show()
	end
	if not tContains(setNames, esm.input:GetText()) then
		esm.save:SetText("Create")
	else
		esm.save:SetText("Update")
	end
end

esm.printHelp = function()
   print("|cff60d4d4Essence Set Manager|r commands: ")
   esm.printHelpActivate()
end

esm.printHelpActivate = function()
   print("|cff60d4d4/esm|r |cffffff33activate|r |cfffcffb0<name>|r - Activate the Azerite Essence set saved as <name>. Use this if you wish to activate from a macro.")
end

esm.activateSet = function(name)
	local set = esm.specProfiles[esm.currentSpec][name]
	
	if set.major.ID then
		esm.ae.ActivateEssence(set.major.ID, SLOT_MAJOR)
	end
	if set.minors.one.ID then
		esm.ae.ActivateEssence(set.minors.one.ID, SLOT_MINOR1)
	end
	if set.minors.two.ID then
		esm.ae.ActivateEssence(set.minors.two.ID, SLOT_MINOR2)
	end
	if set.minors.three.ID then
		esm.ae.ActivateEssence(set.minors.three.ID, SLOT_MINOR3)
	end
 
end

esm.checkIfCanChange = function()
	if IsResting() then
		return nil
	end
	for i = 1, 40 do
		local _, _, _, _, _, _, _, _, _, spellID = UnitAura("player", i, "HELPFUL|PLAYER")
		if spellID then
			if tContains(CHANGE_SPELL_IDS, spellID) then
				return nil
			end
		end
	end
	return 1
end

esm.getEssenceNameByID = function(ID)
	return esm.ae.GetEssenceInfo(ID).name
end

esm.createEssenceTableBySlot = function(slot)
	local ID = esm.ae.GetMilestoneEssence(slot)
	local name
	if ID then
		name = esm.getEssenceNameByID(ID)
	end
	return {ID = ID, name = name}
end

esm.createEquipIDVariables = function(major, minors)
	esm.equippedMajorID = major.ID
	esm.equippedMinorIDs = {minors.one.ID or -1, minors.two.ID or -1, minors.three.ID or -1}
end

esm.createSetFromEquipped = function()
	local major = esm.createEssenceTableBySlot(SLOT_MAJOR)
	local one = esm.createEssenceTableBySlot(SLOT_MINOR1)
	local two = esm.createEssenceTableBySlot(SLOT_MINOR2)
	local three = esm.createEssenceTableBySlot(SLOT_MINOR3)
	local minors = {one = one, two = two, three = three}
	esm.createEquipIDVariables(major, minors)
	if major.ID then
		return {major = major or nil, minors = minors}
	else
		return nil
	end

end

esm.saveSet = function(name)
	local set = esm.createSetFromEquipped()
	if set then
		esm.specProfiles[esm.currentSpec][name] = set
		esm.updateSetButtons()
		esm.updateSetNames()
		esm.updateInfoTooltip()
	else
		esm.errorPrint("You can not save a set without a major essence!")
	end
end

esm.errorPrint = function(text)
	print("|cff60d4d4ESM|r |cffff0009<ERROR>|r "..text)
end

esm.deleteSet = function(name)
	esm.specProfiles[esm.currentSpec][name] = nil
	esm.updateSetNames()
	if name == esm.input:GetText() then
		esm.save:SetText("Create")
	end
end

esm:RegisterChatCommand("esm", function(msg, editbox)
      local words = {}
      for word in msg:gmatch("[^ ]+") do 
         table.insert(words, word)
      end
      if words[1] == "activate" then
         table.remove(words, 1)
         local name = table.concat(words, " ")
         if name == "" then 
            esm.printHelpActivate()
         else
			if esm.specProfiles[esm.currentSpec][name] then
				esm.activateSet(name)
			else
				esm.errorPrint("There is no set saved with this name for this spec. Capitalization must be the same.")
			end
         end
      else
         esm.printHelp()
      end
      
end)
