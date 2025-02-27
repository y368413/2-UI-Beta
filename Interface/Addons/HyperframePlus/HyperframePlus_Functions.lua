
-- Register Addon Table --
-------------------------- 
	local Addon = HyperframePlusAddon           -- Addon Table (Table)
    local AddonName = Addon.AddonName           -- Addon Name (String)
    local AddonFileName = Addon.AddonFileName   -- Addon File Name (String)



-- Update UI CVar Element --
---------------------------- 

	local isUpdating = false

	function Addon:UpdateUICVarElement(cvar, value)

		if not Addon.reset then
    
			if isUpdating then
				return
			end
    
			isUpdating = true

			local prefix = Addon.lastAppliedContentType or ""
			local fullSettingName = prefix .. "_" .. cvar

			-- Update Checkbox 
			local checkbox = InterfaceSettingsLib[AddonName].Checkboxes[fullSettingName]
			if checkbox then
				local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes[fullSettingName]
				local settingsTable = checkboxData:GetSetting()
				local booleanValue = (value == 1) and true or false

				-- Update Checkbox If SetValue Exists 
				if settingsTable.SetValue then

				-- Debug
					if Addon.debug then
						print("[Updated Checkbox]:", fullSettingName, booleanValue)
					end

					settingsTable:SetValue(booleanValue)
				end
			end

			-- Update Slider 
			local slider = InterfaceSettingsLib[AddonName].Sliders[fullSettingName]
			if slider then
				local sliderData = InterfaceSettingsLib[AddonName].Sliders[fullSettingName]
				local settingsTable = sliderData:GetSetting()

				-- Update Slider If SetValue Exists 
				if settingsTable.SetValue then

				-- Debug
					if Addon.debug then
						print("[Update Slider]:", fullSettingName, value)
					end

					settingsTable:SetValue(tonumber(value))
				end
			end
			isUpdating = false
		end
	end

-- Apply CVar Settings --
------------------------- 
	function Addon:ApplyCVarSettings(setting, value, updateElement)

	-- Debug
		if Addon.debug then
			print("[Apply CVar Settings]:", type(setting), setting, type(value), value, updateElement)
		end

		if not Addon.reset then
	
		-- Apply Table Settings 
			if type(setting) == "table" then
				for cvar, tableValue in pairs(setting) do

					local success = C_CVar.SetCVar(cvar, tableValue)

				-- Debug
					if Addon.debug then
						print("[Apply CVar Settings - Table]:", cvar, tableValue, success)
					end

				-- Update UI Element For Each CVar 
					Addon:UpdateUICVarElement(cvar, tableValue)

				end

		-- Apply Individual Setting 
			elseif type(setting) == "string" then
				local success = C_CVar.SetCVar(setting, value)

				-- Debug
					if Addon.debug then
						print("[Apply CVar Settings - Individual]:", setting, value, success)
					end

			-- Update UI Element For The Setting
				if updateElement ~= false then
					Addon:UpdateUICVarElement(setting, value)
				end
			end
		end
	end

-- Apply Content Settings --
---------------------------- 
	function Addon:ApplyContentSettings(contentType)

		-- Loop Through HFP_SETTINGS And Find Matching Content Type Settings
		for cvar, value in pairs(HFP_SETTINGS) do
			if string.match(cvar, "^" .. contentType) then

				-- Extract CVar Name 
				local actualCvar = string.sub(cvar, string.len(contentType) + 2)

				-- Convert true Or false To Number 
				if type(value) == "boolean" then
					value = value and 1 or 0
				end

				-- Handle Restricted CVars 
				if Addon.combatRestricted[actualCvar] then
					local inCombat = UnitAffectingCombat("player")

					-- Not In Combat
					if not inCombat and not Addon.combat then

						-- Debug
						if Addon.debug then
							print("[CHANGE CVARS]:", actualCvar, C_CVar.GetCVar(actualCvar), "change to", value .. ".")
						end

						-- Apply Settings
						if actualCvar == "nameplateMaxDistance" then
							local cbSetting = cvar .. "_CheckBox"
							if HFP_SETTINGS[cbSetting] == true then
								Addon:ApplyCVarSettings(actualCvar, value)
							end
						else
							Addon:ApplyCVarSettings(actualCvar, value)
						end

					-- In Combat
					else

						-- Display Combat Restricted Warning
						print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00ffffff", actualCvar, "|c00f20000couldn't be applied because you're in combat. It will be re-applied the next time this preset is activated.")
					end

				-- Handle Other CVars
				else

					-- Debug
					if Addon.debug then
						print("[CHANGE CVARS]:", actualCvar, C_CVar.GetCVar(actualCvar), "change to", value .. ".")
					end

					-- Apply Settings
					Addon:ApplyCVarSettings(actualCvar, value)
				end
			end
		end
	end

-- Apply Low (1) Settings --
---------------------------- 
	function Addon:ApplyLow()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 1000)
				Addon:ApplyCVarSettings("horizonStart", 400)

			end

		-- Set Preset To Low 
			HFP_SETTINGS.preset = 1

		-- Apply Low CVar Settings 
			Addon:ApplyCVarSettings(Addon.lowSettings)

		end		
	
	end

-- Apply Fair (2) Settings --
----------------------------- 
	function Addon:ApplyFair()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 1000)
				Addon:ApplyCVarSettings("horizonStart", 800)

			end

		-- Set Preset To Fair 
			HFP_SETTINGS.preset = 2

		-- Apply Fair CVar Settings 
			Addon:ApplyCVarSettings(Addon.fairSettings)

		end
	end

-- Apply Good (3) Settings --
----------------------------- 
	function Addon:ApplyGood()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 1600)
				Addon:ApplyCVarSettings("horizonStart", 1000)

			end

		-- Set Preset To Good 
			HFP_SETTINGS.preset = 3

		-- Apply Good CVar Settings 
			Addon:ApplyCVarSettings(Addon.goodSettings)

		end
	end

-- Apply High (4) Settings --
----------------------------- 
	function Addon:ApplyHigh()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 3200)
				Addon:ApplyCVarSettings("horizonStart", 1600)

			end

		-- Set Preset To High 
			HFP_SETTINGS.preset = 4

		-- Apply High CVar Settings 
			Addon:ApplyCVarSettings(Addon.highSettings)

		end
	
	end

-- Apply Very High (5) Settings --
---------------------------------- 
	function Addon:ApplyVeryHigh()

	-- Check If Resetting Defaults
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 4000)
				Addon:ApplyCVarSettings("horizonStart", 3200)

			end

		-- Set Preset To Very High 
			HFP_SETTINGS.preset = 5

		-- Apply Very High CVar Settings 
			Addon:ApplyCVarSettings(Addon.veryHighSettings)

		end
	end

-- Apply Ultra (6) Settings --
------------------------------ 
	function Addon:ApplyUltra()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 4050)
				Addon:ApplyCVarSettings("horizonStart", 4000)
			end

		-- Set Preset To Ultra 
			HFP_SETTINGS.preset = 6

		-- Apply Ultra CVar Settings 
			Addon:ApplyCVarSettings(Addon.ultraSettings)

		end
	
	end

-- Apply Ultra High (7) Settings --
----------------------------------- 
	function Addon:ApplyUltraHigh()

	-- Check If Resetting Defaults
		if not Addon.reset then

		-- Check If Apply View Distances Is Checked 
			if HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Apply View Distance CVars 
				Addon:ApplyCVarSettings("farclip", 10000)
				Addon:ApplyCVarSettings("horizonStart", 4000)
			end

		-- Set Preset To Ultra High 
			HFP_SETTINGS.preset = 7

		-- Apply Ultra High CVar Settings 
			Addon:ApplyCVarSettings(Addon.ultraHighSettings)

		end
	
	end

-- Apply Custom (8) Settings --
----------------------------------- 
	function Addon:ApplyCustom()

	-- Check If Resetting Defaults 
		if not Addon.reset then

		-- Create Settings Table 
			local customSettings = {
				farclip = HFP_SETTINGS["Custom_farClip"],
				horizonStart = HFP_SETTINGS["Custom_horizonStart"],
				groundEffectDensity = HFP_SETTINGS["Custom_groundEffectDensity"],
				groundEffectDist = HFP_SETTINGS["Custom_groundEffectDist"],
				terrainLodDist = HFP_SETTINGS["Custom_terrainLodDist"],
				TerrainLodDiv = HFP_SETTINGS["Custom_TerrainLodDiv"],
				lodObjectMinSize = HFP_SETTINGS["Custom_lodObjectMinSize"],
				lodObjectCullSize = HFP_SETTINGS["Custom_lodObjectCullSize"],
				lodObjectCullDist = HFP_SETTINGS["Custom_lodObjectCullDist"],
				lodObjectFadeScale = HFP_SETTINGS["Custom_lodObjectFadeScale"],
				wmoLodDist = HFP_SETTINGS["Custom_wmoLodDist"],
				doodadLodScale = HFP_SETTINGS["Custom_doodadLodScale"],
				entityLodDist = HFP_SETTINGS["Custom_entityLodDist"],
				entityShadowFadeScale = HFP_SETTINGS["Custom_entityShadowFadeScale"],
				maxLightDist = HFP_SETTINGS["Custom_maxLightDist"],
				entityLodOffset = HFP_SETTINGS["Custom_entityLodDist"],
				groundEffectFade = HFP_SETTINGS["Custom_groundEffectDist"],
			}

		-- Set Preset To Custom 
			HFP_SETTINGS.preset = 8

		-- Apply Custom CVar Settings 
			Addon:ApplyCVarSettings(customSettings)

		end
	end

-- Apply Preset --
------------------ 
	function Addon:ApplyPreset(preset)

	-- Check If Preset Is Already Applied
		if HFP_SETTINGS.preset ~= preset then

		-- Debug 
			if Addon.debug then
				print("[Apply Preset]:", preset)
			end

		-- Apply Preset Based On Level 
			if preset == 1 then -- Low
				Addon:ApplyLow()
			elseif preset == 2 then -- Fair
				Addon:ApplyFair()
			elseif preset == 3 then -- Good
				Addon:ApplyGood()
			elseif preset == 4 then -- High
				Addon:ApplyHigh()
			elseif preset == 5 then -- Very High
				Addon:ApplyVeryHigh()
			elseif preset == 6 then -- Ultra
				Addon:ApplyUltra()
			elseif preset == 7 then -- Ultra High
				Addon:ApplyUltraHigh()
			elseif preset == 8 then -- Custom
				Addon:ApplyCustom()
			end

		-- Apply User Defined View Distance If Unchecked 
			if not HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then

			-- Debug
				if Addon.debug then
					print("[Apply Preset]: Applying User Defined View Distance.")
				end

				if preset ~= 8 then
					Addon:ApplyCVarSettings("farclip", HFP_SETTINGS["ViewDistanceSettings_farClip"])
					Addon:ApplyCVarSettings("horizonStart", HFP_SETTINGS["ViewDistanceSettings_horizonStart"])
				else
					Addon:ApplyCVarSettings("farclip", HFP_SETTINGS["Custom_farClip"])
					Addon:ApplyCVarSettings("horizonStart", HFP_SETTINGS["Custom_horizonStart"])
				end

		-- Apply Preset View Distance If Checked 
			else

			-- Debug
				if Addon.debug then
					print("[Apply Preset]: Only Applying Preset View Distance.")
				end

				if preset == 1 then -- Low
					Addon:ApplyCVarSettings("farclip", 1000)
					Addon:ApplyCVarSettings("horizonStart", 400)	
				elseif preset == 2 then -- Fair
					Addon:ApplyCVarSettings("farclip", 1000)
					Addon:ApplyCVarSettings("horizonStart", 800)
				elseif preset == 3 then -- Good
					Addon:ApplyCVarSettings("farclip", 1600)
					Addon:ApplyCVarSettings("horizonStart", 1000)
				elseif preset == 4 then -- High
					Addon:ApplyCVarSettings("farclip", 3200)
					Addon:ApplyCVarSettings("horizonStart", 1600)
				elseif preset == 5 then -- Very High
					Addon:ApplyCVarSettings("farclip", 4000)
					Addon:ApplyCVarSettings("horizonStart", 3200)
				elseif preset == 6 then -- Ultra
					Addon:ApplyCVarSettings("farclip", 4050)
					Addon:ApplyCVarSettings("horizonStart", 4000)
				elseif preset == 7 then -- Ultra High
					Addon:ApplyCVarSettings("farclip", 10000)
					Addon:ApplyCVarSettings("horizonStart", 4000)
				elseif preset == 8 then -- Custom
					Addon:ApplyCVarSettings("farclip", HFP_SETTINGS["Custom_farClip"])
					Addon:ApplyCVarSettings("horizonStart", HFP_SETTINGS["Custom_horizonStart"])
				end
			end

	-- Preset Is Already Applied 
		else

		-- Debug
			if Addon.debug then
				print("[Apply Preset]: Preset Already Applied Or Changed Different Content Preset Than Currently In.")
			end

		end

	end

-- Determine Preset to Apply --
------------------------------- 
	function Addon:DeterminePreset(event, applyContentTypeRegardless)

	-- Reset Logged Out After Login Complete 
		if event == "PLAYER_LOGIN" then
			HFP_SETTINGS.loggedOut = nil
		end

		local contentType

		-- Debug
		if Addon.debug then
			ConsoleExec("GxCurrentGPU")
		end

	-- Determine Preset Based on Content Type 
		if HFP_SETTINGS["GraphicsPresets_useContentPresets"] == true then
			C_Timer.After(Addon.timerDeterminePresetDelay, function()

			-- Debug 
				if Addon.debug then
					print("-- [Applying Presets] --")
					print("[Determine Preset]:", event, applyContentTypeRegardless)
				end

			-- Cancel Zone Change Timer 
				if Addon.zoneChangeTimer then
					Addon.zoneChangeTimer:Cancel()
					Addon.zoneChangeTimer = nil
				end

				local inInstance, instanceType = IsInInstance()
				if inInstance then

				-- Apply Scenario Preset 
					if instanceType == "scenario" and not C_PartyInfo.IsDelveInProgress() then
						Addon:DefragGPU()
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_Scenario)
						contentType = "Scenario"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end

				-- Apply Raid Preset 
					elseif instanceType == "raid" then
						local numPlayers = GetNumGroupMembers()
						Addon:DefragGPU()
						if numPlayers > 15 then
							Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_LargeRaid)
							contentType = "LargeRaid"
							if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
								print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffffLarge Raid|c00ffff00 preset has been applied.")
							end
						else
							Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_SmallRaid)
							contentType = "SmallRaid"
							if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
								print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffffSmall Raid|c00ffff00 preset has been applied.")
							end
						end

				-- Apply Dungeon Preset 
					elseif instanceType == "party" then
						Addon:DefragGPU()
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_Dungeon)
						contentType = "Dungeon"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end

				-- Apply Arena Preset 
					elseif instanceType == "arena" then
						Addon:DefragGPU()
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_Arena)
						contentType = "Arena"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end

				-- Apply Battleground Preset 
					elseif instanceType == "pvp" then
						Addon:DefragGPU()
						local instanceMapID = select(8, GetInstanceInfo())
						local epicBattlegrounds = {
							[2118] = true, -- Alterac Valley
							[2197] = true, -- Isle of Conquest
							[2107] = true, -- Wintergrasp
							[1803] = true, -- Ashran
							[2245] = true, -- Korrak's Revenge
						}
						local isEpicBG = epicBattlegrounds[instanceMapID]
						if isEpicBG then
							Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_EpicBattleground)
							contentType = "EpicBattleground"
							if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
								print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffffEpic Battleground|c00ffff00 preset has been applied.")
							end
						else
							Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_Battleground)
							contentType = "Battleground"
							if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
								print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffffBattleground|c00ffff00 preset has been applied.")
							end
						end
					end

			-- Apply City/World Preset 
				else
					local mapID = C_Map.GetBestMapForUnit("player")
					if IsResting() and not HyperframePlusAddon.mapIDs[mapID] then
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_City)
						contentType = "City"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end
					else
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_World)
						contentType = "World"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and not HyperframePlusAddon.mapIDs[mapID] and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end
					end
				end

			-- Apply Delve Preset If Active 
				if not Addon.isVanillaOrClassic then
					if C_PartyInfo.IsDelveInProgress() then
						Addon:DefragGPU()
						Addon:ApplyPreset(HFP_SETTINGS.GraphicsPresets_Delve)
						contentType = "Delve"
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset and Addon.AddonInit == false and contentType ~= Addon.lastAppliedContentType then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffff" .. contentType .. "|c00ffff00 preset has been applied.")
						end
					end
				end

			-- Apply Content Settings If Content Type Has Changed 
				if not applyContentTypeRegardless then
					if contentType and contentType ~= Addon.lastAppliedContentType then
						Addon.lastAppliedContentType = contentType
						Addon:ApplyContentSettings(contentType)
					end
				elseif applyContentTypeRegardless then
					Addon.lastAppliedContentType = contentType
					Addon:ApplyContentSettings(contentType)
				end
			
			end)
		end
	
	end

-- Zone Changed --
------------------ 
	function Addon:ZoneChanged(event)

	-- Debug 
		if Addon.debug then
			print("[Zone Changed]:", event)
		end

	-- Check For Existing Zone Change Timer 
		if not Addon.zoneChangeTimer then

		-- Start Zone Change Timer 
			Addon.zoneChangeTimer = C_Timer.NewTimer(Addon.debounceInterval, function()

			-- Check If Logged Out
				if not HFP_SETTINGS.loggedOut then

				-- Check If Content Presets Are Enabled 
					if HFP_SETTINGS["GraphicsPresets_useContentPresets"] == true then

					-- Determine Preset Based on Zone 
						Addon:DeterminePreset(event)
				
					end

				end

				Addon.zoneChangeTimer:Cancel()
				Addon.zoneChangeTimer = nil

			end)

	-- Reset and Restart Zone Change Timer 
		else

			Addon.zoneChangeTimer:Cancel()
			Addon.zoneChangeTimer = C_Timer.NewTimer(Addon.debounceInterval, function()

			-- Check If Logged Out 
				if not HFP_SETTINGS.loggedOut then

				-- Check If Content Presets Are Enabled 
					if HFP_SETTINGS["GraphicsPresets_useContentPresets"] == true then

					-- Determine Preset Based on Zone 
						Addon:DeterminePreset(event)
					
					end
				
				end

				Addon.zoneChangeTimer:Cancel()
				Addon.zoneChangeTimer = nil

			end)
		end
	end

-- Defrag GPU --
---------------- 
	function Addon:DefragGPU()
		ConsoleExec("DefragmentGPU")
		if Addon.debug then
			C_Timer.After(5, function()
				ConsoleExec("GxCurrentGPU")
			end)
		end
	end



-- Apply All Settings --
------------------------ 
	function Addon:ApplyToAll(contentType)
		local settings = {}
		local currentType = contentType.name
		currentType = string.gsub(currentType, " Settings$", "")
		currentType = string.gsub(currentType, " ", "")
		for key, value in pairs(HFP_SETTINGS) do
			local cleanKey = key:match("^" .. currentType .. "(.*)")
			if cleanKey then
				settings[cleanKey] = value
			end
		end
		for _, definition in ipairs(HyperframePlusAddon.graphicsPresetsDropdowns) do
			local variableName = definition.variable
			if variableName ~= currentType then
				for cleanKey, value in pairs(settings) do
					local targetKey = variableName .. cleanKey
					if HFP_SETTINGS[targetKey] ~= nil then
						HFP_SETTINGS[targetKey] = value
					end
				end
			end
		end
		Addon:DeterminePreset("[ApplyToAll]", true)
	end

-- Check Content Type --
------------------------ 
	local function isContentTypeSetting(variableKey)
		for _, preset in ipairs(HyperframePlusAddon.graphicsPresetsDropdowns) do
			if variableKey:find("^" .. preset.variable) then
				return preset.variable
			end
		end
		return nil
	end

-- Set Reloaded / Logged Out Variables --
----------------------------------------- 

	-- Hook Reload UI Function 
		hooksecurefunc("ReloadUI", function()
			if HFP_SETTINGS ~= nil then
				HFP_SETTINGS.reloaded = true
				HFP_SETTINGS.loggedOut = false
			end
		end)

	-- Hook Logout Function 
		hooksecurefunc("Logout", function()
			if HFP_SETTINGS ~= nil then
				HFP_SETTINGS.loggedOut = true
				HFP_SETTINGS.reloaded = false
			end
		end)

	-- Hook Quit Function 
		hooksecurefunc("Quit", function()
			if HFP_SETTINGS ~= nil then
				HFP_SETTINGS.loggedOut = true
				HFP_SETTINGS.reloaded = false
			end
		end)

	-- Hook Force Quit Function 
		hooksecurefunc("ForceQuit", function()
			if HFP_SETTINGS ~= nil then
				HFP_SETTINGS.loggedOut = true
				HFP_SETTINGS.reloaded = false
			end
		end)



-- Backup Settings --
--------------------- 
	function Addon:BackupSettings()
		local AllCVars = (C_Console and C_Console.GetAllCommands) or ConsoleGetAllCommands
		HFP_SAVEDCVARS = HFP_SAVEDCVARS or {}

		if AllCVars then
			for _, info in pairs(AllCVars()) do
				if info.commandType == 0 then
					local value = GetCVar(info.command)
					if value then
						HFP_SAVEDCVARS[info.command] = value
					end
				end
			end

			HFP_SAVEDCVARS.LastBackupDate = tostring(date("%m/%d/%y"))

		end
	end

-- Restore Settings (Uninstall) --
---------------------------------- 
	function Addon:RestoreSettings()

		Addon.reset = true

		-- Get Enabled Action Bars
		local actionBarsBit = C_CVar.GetCVar("enableMultiActionBars")

		if not HFP_SAVEDCVARS or next(HFP_SAVEDCVARS) == nil then
			Addon:ResetDefaults()
		end

		for name, value in pairs(HFP_SAVEDCVARS) do
			SetCVar(name, value)
		end

		HFP_SETTINGS = nil
		HyperframePlusAddon = nil
		InterfaceSettingsLib["Hyperframe+"] = nil
		HFP_SAVEDCVARS = nil
		C_AddOns.DisableAddOn(Addon.AddonFileName)

		-- Restore Enabled Actions Bars
		C_CVar.SetCVar("enableMultiActionBars", actionBarsBit)

		ReloadUI()

	end

-- Reset Defaults (Defaults) --
------------------------------- 

	-- Message
	StaticPopupDialogs["HYPERFRAME_DEFAULTS_CONFIRM"] = {
		text = "Are you sure you want to restore Hyperframe defaults?\n\n" .. Addon.r .. "Restoring defaults will reset all settings, disable the addon, but will not overwrite your existing backup when re-enabled",
		button1 = "Yes",
		button2 = "No",
		OnAccept = function()
			Addon:ResetDefaults()
		end,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}

	-- Function
	function Addon:ResetDefaults()

		Addon.reset = true

		for _, cvar in ipairs(HyperframePlusAddon.cvarsToReset) do
			SetCVar(cvar, GetCVarDefault(cvar))
		end

		HFP_SETTINGS = nil
		HyperframePlusAddon = nil
		InterfaceSettingsLib["Hyperframe+"] = nil
		C_AddOns.DisableAddOn(Addon.AddonFileName)

		ReloadUI()

	end

-- Dump CVars --
---------------- 
	function Addon:DumpCVars()
		Addon.CVars = {}
		local commands = ConsoleGetAllCommands()
		for _, info in pairs(commands) do
			local command = info.command
			if command then
				Addon.CVars[command] = {
					category = info.category,
					commandType = info.commandType,
					description = info.help,
					scriptContents = info.scriptContents,
					scriptParameters = info.scriptParameters,
					defaultValue = C_CVar.GetCVarDefault(command),
					currentValue = C_CVar.GetCVar(command)
				}
			end
		end
	end



-- On Checkbox Change --
------------------------ 
	local isApplyingValue = false
	function Addon:OnCheckboxSettingChanged(setting, value, event)

		if Addon.AddonInit == true then
			return
		end

		-- Debug 
		if Addon.debug then
			print("[On Checkbox Setting Changed]:", setting:GetName(), value)
		end

		-- CVarName and CVarValue
		local CVarName = tostring(setting.variableKey):gsub("^[^_]+_", "")
		local CVarValue = value and 1 or 0

		-- Check Content Type 
		local contentType = isContentTypeSetting(setting.variableKey)
		local shouldApplyCVar = not contentType or (HFP_SETTINGS.preset == HFP_SETTINGS["GraphicsPresets_" .. contentType])

		-- Apply Setting 
		if shouldApplyCVar then

			-- Apply Unit Name Settings
			if CVarName == "UnitNamePlayerPVPTitle" or CVarName == "UnitNamePlayerGuild" then
				local inCombat = UnitAffectingCombat("player")
				if not inCombat  and not Addon.combat then
					Addon:ApplyCVarSettings(CVarName, CVarValue)
				else
					print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00ffffff", CVarName, "|c00f20000couldn't be applied because you're in combat. It will be re-applied the next time this preset is activated.")
				end

			-- Apply Preset View Distances 
			elseif CVarName == "applyPresetViewDistances" then
				if value then
					-- Determine Preset View Distances 
					HFP_SETTINGS.preset = 0 
					Addon:DeterminePreset(CVarName)
					
				else
					-- Apply Custom View Distances 
					if HFP_SETTINGS["GraphicsPresets_useContentPresets"] == true then
						Addon:ApplyCVarSettings("farclip", HFP_SETTINGS["ViewDistanceSettings_farClip"])
						Addon:ApplyCVarSettings("horizonStart", HFP_SETTINGS["ViewDistanceSettings_horizonStart"])
					end
				end

			-- Use Content Presets 
			elseif CVarName == "useContentPresets" then
				if value then
					-- Determine Preset
					Addon.lastAppliedContentType = "N/A"
					HFP_SETTINGS.preset = 0
					Addon:DeterminePreset(CVarName, true)
					
				else
					Addon.lastAppliedContentType = "N/A"
					HFP_SETTINGS.preset = 0

					-- Restore Content Type Settings To Defaults 
					local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["GraphicsPresets_useContentPresets"]
					local settingsTable = checkboxData:GetSetting()
					if not settingsTable:GetValue() then
						for _, cvar in ipairs(HyperframePlusAddon.contentSettingsToReset) do
							if not Addon.reset then
								C_CVar.SetCVar(cvar, GetCVarDefault(cvar)) -- Required Or ApplyCVarSettings Will Reset UI Elements
								for key, cbData in pairs(InterfaceSettingsLib[AddonName].Checkboxes) do
									if key:match("_hideTalkingHeadFrame") then
										local settingsTable = cbData:GetSetting()
										local value = settingsTable:SetValue(false)
										TalkingHeadFrame:SetAlpha(1)
									end
								end
							end
						end
					end
				end

			-- Others 
			else
				if contentType then
					if CVarName ~= "nameplateMaxDistance_CheckBox" then
						Addon:ApplyCVarSettings(CVarName, CVarValue)
					end
				else
					if CVarName ~= "nameplateMaxDistance_CheckBox" then
						Addon:ApplyCVarSettings(CVarName, CVarValue)
					end
				end
			end
		end

		-- Nameplate Max Distance 
		if CVarName == "nameplateMaxDistance_CheckBox" then
			if isApplyingValue then
				return
			end
			local nameplateMaxDistanceValue = contentType .. "_nameplateMaxDistance"
			local nameplateMaxDistanceValue = HFP_SETTINGS[nameplateMaxDistanceValue]
			local contentNameplate = contentType .. "_nameplateMaxDistance_CheckBox"
			if HFP_SETTINGS[contentNameplate] then
				local inCombat = UnitAffectingCombat("player")
				if not inCombat and not Addon.combat then
					Addon:ApplyCVarSettings("nameplateMaxDistance", nameplateMaxDistanceValue)
				end
			end
			local valueToApply = nil
			for key, settingsTable in pairs(InterfaceSettingsLib[AddonName].CheckboxSliders) do
				if key:match(contentType) then
					valueToApply = settingsTable.data.cbSetting:GetValue()
					break
				end
			end
			if valueToApply ~= nil then
				isApplyingValue = true
				for key, settingsTable in pairs(InterfaceSettingsLib[AddonName].CheckboxSliders) do
					if key:match("nameplateMaxDistance$") then
						settingsTable.data.cbSetting:ApplyValue(valueToApply)
					end
				end
				isApplyingValue = false
			end
		end
	end

-- On Slider Change --
---------------------- 
	function Addon:OnSliderSettingChanged(setting, value)

		local CVarName = setting:GetVariable():gsub("^[^_]+_", "")

	-- Check Content Type 
		local contentType = isContentTypeSetting(setting:GetVariable())
		local shouldApplyCVar = not contentType or (HFP_SETTINGS.preset == HFP_SETTINGS["GraphicsPresets_" .. contentType])

	-- Apply Setting 
		if shouldApplyCVar then
			local isCustomPrefix = CVarName:match("^Custom_")

			if CVarName == "farClip" or CVarName == "horizonStart" then
				if not HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"] then
					if HFP_SETTINGS.preset ~= 8 then
						if HFP_SETTINGS["GraphicsPresets_useContentPresets"] then
							Addon:ApplyCVarSettings(CVarName, value)
						end
					end
				end
			elseif CVarName == "nameplateMaxDistance" then
				local inCombat = UnitAffectingCombat("player")
				if not inCombat and not Addon.combat then
					Addon:ApplyCVarSettings(CVarName, value)
				else
					print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00ffffff", CVarName, "|c00f20000couldn't be applied because you're in combat. It will be re-applied the next time this preset is activated.")
				end
			elseif isCustomPrefix then
				local customName = CVarName:gsub("^Custom_", "")
				HFP_SETTINGS["Custom_" .. customName] = value
				if HFP_SETTINGS["GraphicsPresets_useContentPresets"] then
					if HFP_SETTINGS.preset == 8 then
						Addon:ApplyCVarSettings(customName, value)
					end
				end
			else
				Addon:ApplyCVarSettings(CVarName, value)
			end
		end
	end

-- On Graphics Preset Dropdown Change --
---------------------------------------- 
	function Addon:OnGraphicsPresetDropdownSettingChanged(setting, value)

	-- Debug
		if Addon.debug then
			print("[Dropdown Changed]:", setting:GetName(), value)
		end
		
		if value == 1 or value == 2 then
			print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00f20000 When this preset is applied, some game objects may only become visible when you're close to them. This can impact gameplay, as distant objects might not appear in time.")
		end

		Addon:DeterminePreset("[OnDropdownSettingChanged]")

	end

-- On CVar Dropdown Change --
----------------------------- 
	function Addon:OnCVarDropdownSettingChanged(setting, value, options)
		local CVarName = setting.variableKey:match("_(.*)")
		if CVarName == "worldBaseMip" then
			if options[value] == "High" then
				Addon:ApplyCVarSettings(CVarName, 0)
			elseif options[value] == "Fair" then
				Addon:ApplyCVarSettings(CVarName, 1)
			elseif options[value] == "Low" then
				Addon:ApplyCVarSettings(CVarName, 2)
			end
		else
			Addon:ApplyCVarSettings(CVarName, options[value])
		end
	end

