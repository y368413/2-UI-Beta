local AceGUI = LibStub("AceGUI-3.0")
local LibDeflate = LibStub:GetLibrary("LibDeflate")
local AceSerializer = LibStub("AceSerializer-3.0")

local tapFrame = CreateFrame("frame", "torghastautopicker", UIParent)
tapFrame:RegisterEvent("ADDON_LOADED")
tapFrame:RegisterEvent("PLAYER_LOGOUT")
tapFrame:RegisterEvent("PLAYER_CHOICE_UPDATE")
tapFrame:RegisterEvent("JAILERS_TOWER_LEVEL_UPDATE")
tapFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

local C_PlayerChoice_IsWaitingForPlayerChoiceResponse = C_PlayerChoice.IsWaitingForPlayerChoiceResponse
local C_PlayerChoice_GetCurrentPlayerChoiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo
local C_PlayerChoice_SendPlayerChoiceResponse = C_PlayerChoice.SendPlayerChoiceResponse
local C_PlayerChoice_OnUIClosed = C_PlayerChoice.OnUIClosed
local GetInstanceInfo = GetInstanceInfo
local GetSpellInfo = GetSpellInfo
local GetSpecialization = GetSpecialization
local UnitAura = UnitAura
local UnitClass = UnitClass

local WARRIOR = 1
local PALADIN = 2
local HUNTER = 3
local ROGUE = 4
local PRIEST = 5
local DEATHKNIGHT = 6
local SHAMAN = 7
local MAGE = 8
local WARLOCK = 9
local MONK = 10
local DRUID = 11
local DEMONHUNTER = 12

local classNames = {
	[WARRIOR] = "Warrior",
	[PALADIN] = "Paladin",
	[HUNTER] = "Hunter",
	[ROGUE] = "Rogue",
	[PRIEST] = "Priest",
	[DEATHKNIGHT] = "Death Knight",
	[SHAMAN] = "Shaman",
	[MAGE] = "Mage",
	[WARLOCK] = "Warlock",
	[MONK] = "Monk",
	[DRUID] = "Druid",
	[DEMONHUNTER] = "Demon Hunter"
}
local specs = {
	[WARRIOR] = {[1] = "Arms", [2] = "Fury", [3] = "Protection"},
	[PALADIN] = {[1] = "Holy", [2] = "Protection", [3] = "Retribution"},
	[HUNTER] = {[1] = "Beast Mastery", [2] = "Marksmanship", [3] = "Survival"},
	[ROGUE] = {[1] = "Assassination", [2] = "Outlaw", [3] = "Subtlety"},
	[PRIEST] = {[1] = "Discipline", [2] = "Holy", [3] = "Shadow"},
	[DEATHKNIGHT] = {[1] = "Blood", [2] = "Frost", [3] = "Unholy"},
	[SHAMAN] = {[1] = "Elemental", [2] = "Enhancement", [3] = "Restoration"},
	[MAGE] = {[1] = "Arcane", [2] = "Fire", [3] = "Frost"},
	[WARLOCK] = {[1] = "Affliction", [2] = "Demonology", [3] = "Destruction"},
	[MONK] = {[1] = "Brewmaster", [2] = "Mistweaver", [3] = "Windwalker"},
	[DRUID] = {[1] = "Balance", [2] = "Feral", [3] = "Guardian", [4] = "Restoration"},
	[DEMONHUNTER] = {[1] = "Havoc", [2] = "Vengeance"}
}

local debugOn = true

local currentClass = nil

local currentFloor = 1

local powersByClass = {
	[DEATHKNIGHT] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[DEMONHUNTER] = {
		[1] = { 

		},
		[2] = { 

		}
	},
	[DRUID] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		},
		[4] = {

		}
	},
	[HUNTER] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[MAGE] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[MONK] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[PALADIN] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[PRIEST] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[ROGUE] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[SHAMAN] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[WARLOCK] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	},
	[WARRIOR] = {
		[1] = {

		},
		[2] = {

		},
		[3] = {

		}
	}
}

local function tapPrint(text)
	print("[TAP] " .. text)
end

local function GetBaseValues(spellID)
	local base = {
		spellID = spellID,
		basePrio = 1,
		hidden = false,
		byFloor = {
			[1] = -1, [2] = -1, [3] = -1, [4] = -1, [5] = -1, [6] = -1, [7] = -1
		},
		byPowers = { }
	}
	return base
end

local tapDB = nil

local function GetPriority(spellID)
	local currentSpec = GetSpecialization()
	local prio = tapDB.powers[currentClass][currentSpec][spellID]
	if prio then
		-- by floor
		local p = prio.byFloor[currentFloor]
		if p and p ~= -1 then
			return p
		end

		-- by other powers present
		local max = 0
		local maxVal = 0
		for id,val in pairs(prio.byPowers) do
			for i=1,255 do
				local spellID = select(10, UnitAura("player", i, "MAW"))
				if spellID then
					if id == spellID and val > maxVal then
						max = id
						maxVal = val
					end
				else
					break
				end
			end 
		end
		if max ~= 0 then
			return maxVal
		end

		-- by base value
		return prio.basePrio
	else
		if tapDB.showOptions then
			local link = GetSpellLink(spellID)
			if link then
				tapPrint("New power added: " .. link)
			else
				tapPrint("New power added: " .. spellID)
			end
		end
		tapDB.powers[currentClass][currentSpec][spellID] = GetBaseValues(spellID)
	end

	return 1
end

tapFrame:SetScript("OnEvent", function(self, evt, arg1, ...)
	if evt == "ADDON_LOADED" and arg1 == "TorghastAutoPicker" then
		tapDB = _G["TorghastAutoPickerDB"]
		if not tapDB then 
			tapDB = {
				powers = powersByClass,
				autoPickOn = false,
				showOptions = true
			}
		elseif not tapDB.powers then
			tapDB.powers = powersByClass
		end
		if not tapDB.currentRunPowers then
			tapDB.currentRunPowers = { }
		end
	elseif evt == "PLAYER_ENTERING_WORLD" then
		_, _, currentClass = UnitClass("player") 
	elseif evt == "PLAYER_LOGOUT" then
		_G["TorghastAutoPickerDB"] = tapDB
    elseif evt == "JAILERS_TOWER_LEVEL_UPDATE" then
		currentFloor = arg1
		if currentFloor == 1 then
			tapDB.currentRunPowers = { }
		end
	elseif evt == "PLAYER_CHOICE_UPDATE" and C_PlayerChoice_IsWaitingForPlayerChoiceResponse() then
		local _, _, diff = GetInstanceInfo()
		if diff == 167 then 
			local pci = C_PlayerChoice_GetCurrentPlayerChoiceInfo()
			if pci then
				local best = 0
				local bestPrio = 0
				localBestName = ""
				for _, option in pairs(pci.options) do
					tapDB.currentRunPowers[option.spellID] = true
					local p = GetPriority(option.spellID)
					if tapDB.showOptions and tapDB.autoPickOn then
						local link = GetSpellLink(option.spellID)
						if link then
							tapPrint(p .. ": " .. link)
						else
							tapPrint(p .. ": " .. option.spellID)
						end
					end
					if p > bestPrio then
						best = option.buttons[1].id
						bestPrio = p
						bestName = option.header
					end
				end
				if tapDB.autoPickOn then
					C_PlayerChoice_SendPlayerChoiceResponse(best)
					C_PlayerChoice_OnUIClosed()
					PlayerChoiceFrame:Hide()
				end
			end
		end
	end
end)

local gui = nil
local FillPowerWidgets = nil

local function makePowerRow(scroll, classID, specID, setting, spellID, prio)
	local group = AceGUI:Create("InlineGroup")
	group:SetLayout("Flow")
	group:SetFullWidth(true)
	local name, _, icon = GetSpellInfo(spellID)
	group:SetTitle(name)
	local iconWidget = AceGUI:Create("Icon")
	iconWidget:SetWidth(36)
	iconWidget:SetImage(icon)
	iconWidget:SetImageSize(32, 32)
	iconWidget:SetCallback("OnEnter", function() 
		if not GameTooltip:IsVisible() then
			ShowUIPanel(GameTooltip)
			GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
		end
		GameTooltip:SetHyperlink(GetSpellLink(spellID))
	end)
	iconWidget:SetCallback("OnLeave", function()
		HideUIPanel(GameTooltip)
	end)
	iconWidget:SetCallback("OnClick", function(container, evt, btn)
		if setting ~= 2 then
			if prio.hidden then
				prio.hidden = false
				gui:SetStatusText(name .. " no longer hidden.")
			else
				prio.hidden = true
				gui:SetStatusText(name .. " hidden.")
			end
			FillPowerWidgets(scroll, classID, specID, setting)
		end
	end)
	group:AddChild(iconWidget)
	local baseEdit = AceGUI:Create("EditBox")
	baseEdit:SetWidth(50)
	baseEdit:DisableButton(true)
	baseEdit:SetLabel("Base")
	baseEdit:SetText(prio.basePrio)
	baseEdit:SetCallback("OnEnterPressed", function()
		local text = baseEdit:GetText()
		local val = tonumber(text)
		if val and val > 0 then
			prio.basePrio = val
			gui:SetStatusText(name .. " base priority set to " .. val .. ".")
		else
			baseEdit:SetText(prio.basePrio)
			gui:SetStatusText("Invalid value: " .. text)
		end
	end)
	group:AddChild(baseEdit)
	for i=1,7 do
		local floorEdit = AceGUI:Create("EditBox")
		floorEdit:SetWidth(50)
		floorEdit:DisableButton(true)
		floorEdit:SetLabel("Floor " .. i)
		local byFloor = prio.byFloor[i]
		if byFloor ~= -1 then
			floorEdit:SetText(byFloor)
		else
			floorEdit:SetText("")
		end
		floorEdit:SetCallback("OnEnterPressed", function()
			local text = floorEdit:GetText()
			if text == "" then
				prio.byFloor[i] = -1
				gui:SetStatusText(name .. "removed value for floor " .. i .. ".")
			else
				local val = tonumber(text)
				if val and val > 0 then
					prio.byFloor[i] = val
					gui:SetStatusText(name .. " set priority for floor " .. i .. " to " .. val .. ".")
				else
					local byFloor = prio.byFloor[i]
					if byFloor ~= -1 then
						floorEdit:SetText(byFloor)
					else
						floorEdit:SetText("")
					end
					gui:SetStatusText("Invalid value: " .. text)
				end
			end
		end)
		group:AddChild(floorEdit)
	end
	local byPowerIdEdit = AceGUI:Create("EditBox")
	local byPowerIcon = AceGUI:Create("Icon")
	local byPowerValEdit = AceGUI:Create("EditBox")
	byPowerIdEdit:SetWidth(65)
	byPowerIdEdit:DisableButton(true)
	byPowerIdEdit:SetLabel("By Power")
	byPowerIdEdit:SetCallback("OnEnterPressed", function()
		gui:SetStatusText("")
		local id = tonumber(byPowerIdEdit:GetText())
		if id then
			local _, _, icon = GetSpellInfo(id)
			if icon then
				byPowerIcon:SetImage(icon)
				local val = prio.byPowers[id]
				if val then
					byPowerValEdit:SetText(val)
				else
					byPowerValEdit:SetText("")
				end
			else
				byPowerIdEdit:SetText("")
				byPowerIcon:SetImage(nil)
				byPowerValEdit:SetText("")
			end
		else
			byPowerIdEdit:SetText("")
			byPowerIcon:SetImage(nil)
			byPowerValEdit:SetText("")
		end
	end)
	group:AddChild(byPowerIdEdit)
	byPowerValEdit:SetWidth(50)
	byPowerValEdit:DisableButton(true)
	byPowerValEdit:SetCallback("OnEnterPressed", function()
		local text = byPowerValEdit:GetText()
		local val = tonumber(text)
		local id = tonumber(byPowerIdEdit:GetText())
		if id and val and val > 0 then
			prio.byPowers[id] = val
			local otherName = GetSpellInfo(id)
			if not otherName then
				otherName = id
			end
			gui:SetStatusText(name .. " priority set when power " .. otherName .. " also present set to " .. val .. ".")
		else
			byPowerValEdit:SetText("")
			gui:SetStatusText("Invalid ID or value entered.")
		end
	end)
	byPowerIcon:SetWidth(34)
	byPowerIcon:SetImageSize(32, 32)
	byPowerIcon:SetCallback("OnEnter", function() 
		local id = tonumber(byPowerIdEdit:GetText())
		if id then
			local link = GetSpellLink(id)
			if link then
				if not GameTooltip:IsVisible() then
					ShowUIPanel(GameTooltip)
					GameTooltip:SetOwner(UIParent, "ANCHOR_CURSOR")
				end
				GameTooltip:SetHyperlink(link)
			end
		end
	end)
	byPowerIcon:SetCallback("OnLeave", function()
		HideUIPanel(GameTooltip)
	end)
	group:AddChild(byPowerIcon)
	group:AddChild(byPowerValEdit)
	return group
end

FillPowerWidgets = function(scroll, classID, specID, setting)
	scroll:ReleaseChildren()
	for spellID, prio in pairs(tapDB.powers[classID][specID]) do
		if (setting == 1 and not prio.hidden) or (setting == 2 and tapDB.currentRunPowers[spellID]) or (setting == 3 and prio.hidden) then	
			local group = makePowerRow(scroll, classID, specID, setting, spellID, prio)
			scroll:AddChild(group)
		end
	end
end

local function GetClassTab(classID)
	local scrollContainer = AceGUI:Create("SimpleGroup")
	scrollContainer:SetLayout("Flow")
	local scroll = AceGUI:Create("ScrollFrame")
	local specDropdown = AceGUI:Create("Dropdown")
	for i,spec in pairs(specs[classID]) do
		specDropdown:AddItem(i, spec)
	end
	specDropdown:SetWidth(150)
	scrollContainer:AddChild(specDropdown)
	specDropdown:SetCallback("OnValueChanged", function(container, event, key)
		gui:SetStatusText(specs[classID][key] .. " selected.")
		FillPowerWidgets(scroll, classID, key, 1)
	end)
	local settingDropDown = AceGUI:Create("Dropdown")
	settingDropDown:AddItem(1, "Powers")
	settingDropDown:AddItem(2, "Current Run")
	settingDropDown:AddItem(3, "Hidden")
	settingDropDown:SetValue(1)
	settingDropDown:SetCallback("OnValueChanged", function(container, evt, key)
		gui:SetStatusText("")
		FillPowerWidgets(scroll, classID, specDropdown:GetValue(), key)
	end)
	scrollContainer:AddChild(settingDropDown)
	local exportButton = AceGUI:Create("Button")
	exportButton:SetText("Export")
	exportButton:SetWidth(80)
	scrollContainer:AddChild(exportButton)
	exportButton:SetCallback("OnClick", function()
		local exportFrame = AceGUI:Create("Frame")
		exportFrame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
		exportFrame:SetLayout("Fill")
		exportFrame:SetTitle("Export")
		exportFrame:SetWidth(600)
		exportFrame:SetHeight(400)
		local editBox = AceGUI:Create("MultiLineEditBox")
		editBox:DisableButton(true)
		editBox:SetLabel("")
		local currentSpec = specDropdown:GetValue()
		local serialized = AceSerializer:Serialize("TorghastAutoPicker", classID, currentSpec, tapDB.powers[classID][currentSpec])
		local compressed = LibDeflate:CompressDeflate(serialized)
		local exportText = LibDeflate:EncodeForPrint(compressed)
		editBox:SetText(exportText)
		editBox:SetFocus()
		editBox:HighlightText()
		exportFrame:AddChild(editBox)
	end)
	local importButton = AceGUI:Create("Button")
	importButton:SetText("Import")
	importButton:SetWidth(80)
	scrollContainer:AddChild(importButton)
	importButton:SetCallback("OnClick", function()
		local importFrame = AceGUI:Create("Frame")
		importFrame:SetCallback("OnClose", function(widget) AceGUI:Release(widget) end)
		importFrame:SetLayout("Flow")
		importFrame:SetTitle("Import - THIS WILL REPLACE ALL SETTINGS FOR THIS SPEC")
		importFrame:SetWidth(600)
		importFrame:SetHeight(400)
		local editBox = AceGUI:Create("MultiLineEditBox")
		editBox:DisableButton(true)
		editBox:SetLabel("")
		editBox:SetFocus()
		local importButton = AceGUI:Create("Button")
		importButton:SetText("Import")
		importButton:SetWidth(80)
		importButton:SetCallback("OnClick", function()
			local encoded = editBox:GetText()
			local decoded = LibDeflate:DecodeForPrint(encoded)
			if decoded then
				local decompressed = LibDeflate:DecompressDeflate(decoded)
				if decompressed then
					local success, addonName, importClass, importSpec, deserialized = AceSerializer:Deserialize(decompressed)
					if success and addonName == "TorghastAutoPicker" then
						local currentSpec = specDropdown:GetValue()
						if importClass == classID and importSpec == currentSpec then
							tapDB.powers[classID][currentSpec] = deserialized
							FillPowerWidgets(scroll, classID, currentSpec, 1)
							gui:SetStatusText("Successfully imported for " .. specs[importClass][importSpec] .. " " .. classNames[importClass] .. ".")
						else
							gui:SetStatusText("Can't import " .. specs[importClass][importSpec] .. " " .. classNames[importClass] .. " to " .. specs[classID][currentSpec] .. " " .. classNames[classID] .. ".")
						end
					else
						gui:SetStatusText("Import failed.")
					end
				else
					gui:SetStatusText("Import failed.")
				end
			else 
				gui:SetStatusText("Import failed.")
			end
			importFrame:Hide()
		end)
		importFrame:AddChild(importButton)
		local group = AceGUI:Create("SimpleGroup")
		group:SetLayout("Fill")
		group:SetFullWidth(true)
		group:SetFullHeight(true)
		importFrame:AddChild(group)
		group:AddChild(editBox)
	end)
	scroll:SetLayout("Flow")
	scroll:SetFullWidth(true)
	scroll:SetFullHeight(true)
	scrollContainer:AddChild(scroll)
	return scrollContainer, specDropdown, scroll
end

local function ShowGUI()
	gui = AceGUI:Create("Frame")
	gui:SetCallback("OnClose", function(widget) AceGUI:Release(widget); gui = nil end)
	gui:SetTitle("Torghast Auto Picker")
	gui:SetLayout("Flow")
	local autoPickCheckBox = AceGUI:Create("CheckBox")
	autoPickCheckBox:SetLabel("Auto-picking On")
	autoPickCheckBox:SetValue(tapDB.autoPickOn)
	autoPickCheckBox:SetCallback("OnValueChanged", function(container, evt, value) tapDB.autoPickOn = value end)
	gui:AddChild(autoPickCheckBox)
	local showOptionsCheckBox = AceGUI:Create("CheckBox")
	showOptionsCheckBox:SetLabel("Show Options in Chat")
	showOptionsCheckBox:SetValue(tapDB.showOptions)
	showOptionsCheckBox:SetCallback("OnValueChanged", function(container, evt, value) tapDB.showOptions = value end)
	gui:AddChild(showOptionsCheckBox)
	local group = AceGUI:Create("SimpleGroup")
	group:SetLayout("Fill")
	group:SetFullWidth(true)
	group:SetFullHeight(true)
	gui:AddChild(group)
	local tabGroup = AceGUI:Create("TabGroup")
	tabGroup:SetLayout("Fill")
	local tabs = { }
	for i=1,12 do
		tabs[i] = { value = i, text = classNames[i]}
	end
	table.sort(tabs, function(a,b) return a.text < b.text end)
	tabGroup:SetCallback("OnGroupSelected", function(container, evt, group)
		container:ReleaseChildren()
		local scrollContainer, specDropdown, scroll = GetClassTab(group)
		container:AddChild(scrollContainer)
		if group == currentClass then
			local spec = GetSpecialization()
			specDropdown:SetValue(spec)
			FillPowerWidgets(scroll, group, spec, 1)
		else
			specDropdown:SetValue(1)
			FillPowerWidgets(scroll, group, 1, 1)
		end
		gui:SetStatusText(classNames[group] .. " selected.")
	end)
	tabGroup:SetTabs(tabs)
	group:AddChild(tabGroup)
	tabGroup:SelectTab(currentClass)

	_G["TorghastAutoPickerGUI"] = gui
	tinsert(UISpecialFrames, "TorghastAutoPickerGUI")
end

SLASH_TORGHASTAUTOPICKER1 = "/tap"
SlashCmdList["TORGHASTAUTOPICKER"] = function(msg, ...)
	if gui and gui:IsVisible() then
		gui:Hide()
		gui = nil
	else 
		ShowGUI()
	end
end

