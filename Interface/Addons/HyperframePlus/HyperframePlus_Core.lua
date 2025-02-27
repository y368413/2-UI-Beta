
-- Register Addon Table --
-------------------------- 
	local Addon = HyperframePlusAddon           -- Addon Table (Table)
    local AddonName = Addon.AddonName           -- Addon Name (String)
    local AddonFileName = Addon.AddonFileName   -- Addon File Name (String)



-- Addon Loaded --
------------------ 
    EventUtil.ContinueOnAddOnLoaded(Addon.AddonFileName, function()

	-- Prevent Created Elements From Apply After Being Created
		Addon.AddonInit = true

    -- Handle New Addon User 
		if not HFP_SETTINGS or next(HFP_SETTINGS) == nil then
			HFP_SETTINGS = HFP_SETTINGS or {}
			HFP_SETTINGS.reloaded = false
			HFP_SETTINGS.HFP_NewLogin = true

		-- Check If Used /hf defaults
			local backupMessage = nil
			if not HFP_SAVEDCVARS or next(HFP_SAVEDCVARS) == nil then
				Addon:BackupSettings()
				backupMessage = true
			else
				backupMessage = false
			end

		-- Initialize Settings

			-- View Distance
			local isApplyPresetViewDistancesEnabled = HFP_SETTINGS["ViewDistanceSettings_applyPresetViewDistances"]
			if HFP_SETTINGS.ViewDistanceSettings_farClip == nil then
				HFP_SETTINGS.ViewDistanceSettings_farClip = 1250
				Addon:ApplyCVarSettings("farclip", 1250)
			elseif not isApplyPresetViewDistancesEnabled then
				Addon:ApplyCVarSettings("farclip", HFP_SETTINGS.ViewDistanceSettings_farClip)
			end
			if HFP_SETTINGS.ViewDistanceSettings_horizonStart == nil then
				HFP_SETTINGS.ViewDistanceSettings_horizonStart = 1200
				Addon:ApplyCVarSettings("horizonStart", 1200)
			elseif not isApplyPresetViewDistancesEnabled then
				Addon:ApplyCVarSettings("horizonStart", HFP_SETTINGS.ViewDistanceSettings_horizonStart)
			end

			-- Sample Rate
			if HFP_SETTINGS.GlobalSettings_Sound_OutputSampleRate == nil then
				HFP_SETTINGS.GlobalSettings_Sound_OutputSampleRate = 4
				Addon:ApplyCVarSettings("Sound_OutputSampleRate", 22050)
			end

			-- Resample Sharpness 
			Addon:ApplyCVarSettings("ResampleSharpness", 0.8)

		-- Settings Applied Message 
			C_Timer.After(Addon.timerSettingsAppliedLogin, function()
				Addon.AddonInit = false
				HFP_SETTINGS.HFP_NewLogin = false
				print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The setup process is complete. Please restart the game now to finalize the changes." .. Addon.r .. "\n\nIf you're unhappy with the addon, use the Uninstall button under Global Addon Settings before disabling or uninstalling it to avoid potential issues.")
			end)

		-- New User Welcome Message 
			C_Timer.After(0.1, function()
				if backupMessage then
					print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00FF7D0A On first use, the addon creates a backup of your previous settings before applying its own. Please remain logged in until the setup process is complete, and restart the game when prompted.")
				else
					print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00FF7D0A Welcome back! Please remain logged in until the setup process is complete, and restart the game when prompted.")
				end
			end)
		end

	-- Register Parent Category, Headers and Settings 
		HFP_ParentCategory, ParentLayout = InterfaceSettingsLib:CreateCategory(Addon.AddonName)
		HFP_ParentCategory:SetExpanded(true)

		-- Global Combat Settings 
			local header = InterfaceSettingsLib:CreateHeader(Addon.AddonName, "Global", Addon.b .. "Global Combat Settings", Addon.w .. "These options are applied universally across all presets and content types, ensuring consistent performance during combat scenarios.")

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.globalCombatSettingsCheckboxes) do
					local uniqueVariableKey = "GlobalCombatSettings_" .. checkbox.variable

				-- Classic Only
					if checkbox.classicOnly then
						if Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- Retail Only
					elseif checkbox.retailOnly then
						if not Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- All Versions
					else
						local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
						local cbData = cb:GetSetting()
						cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
					end
				end

		-- Global Graphics Settings 
			local header = InterfaceSettingsLib:CreateHeader(Addon.AddonName, "Global", Addon.b .. "Global Graphics Settings", Addon.w .. "These options are applied universally across all presets and content types, ensuring consistent performance and visual quality.")

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.globalSettingsCheckboxes) do
					local uniqueVariableKey = "GlobalGraphicsSettings_" .. checkbox.variable

				-- Classic Only
					if checkbox.classicOnly then
						if Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- Retail Only
					elseif checkbox.retailOnly then
						if not Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- All Versions
					else
						local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
						local cbData = cb:GetSetting()
						cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
					end
				end

			-- Sliders 
				for _, slider in ipairs(Addon.globalGraphicsSettingsSliders) do
					local uniqueVariableKey = "GlobalGraphicsSettings_" .. slider.variable
					local sd = InterfaceSettingsLib:CreateSlider(HFP_ParentCategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end, nil)
				end

			-- Dropdowns 
				for _, dropdown in ipairs(Addon.globalSettingsDropdowns) do
					local uniqueVariableKey = "GlobalGraphicsSettings_" .. dropdown.variable
					if uniqueVariableKey == "GlobalGraphicsSettings_shadowTextureSize" then
						local dd = InterfaceSettingsLib:MakeDropdown(HFP_ParentCategory, dropdown.name, uniqueVariableKey, dropdown.defaultValue, dropdown.tooltip, Addon.shadowTextureSizeOptions, HFP_SETTINGS, function(setting, value, options) Addon:OnCVarDropdownSettingChanged(setting, value, Addon.shadowTextureSizeOptions) end, "MB")
					elseif uniqueVariableKey == "GlobalGraphicsSettings_worldBaseMip" then
						local dd = InterfaceSettingsLib:MakeDropdown(HFP_ParentCategory, dropdown.name, uniqueVariableKey, dropdown.defaultValue, dropdown.tooltip, Addon.worldBaseMipOptions, HFP_SETTINGS, function(setting, value, options) Addon:OnCVarDropdownSettingChanged(setting, value, Addon.worldBaseMipOptions) end)
					end
				end

				-- Create Manage Graphics Settings Button
					local setting = InterfaceSettingsLib:CreateButton(
						HFP_ParentCategory,
						"Optimize Graphics Settings",
						"Optimize",
						function()
							Addon:ApplyCVarSettings(Addon.managedGraphicsSettings)
						end,
						"Adjusts various graphics settings that commonly cause low FPS to optimal levels, balancing performance and visuals.\n\n" ..
						Addon.g .. "Image-Based Techniques: FXAA High" .. "\n" .. 
						"Multisample Techniques: None" .. "\n" .. 
						"Shadow Quality: Ultra" .. "\n" .. 
						"Shadow Texture Size: 1024" .. "\n" .. 
						"Shadow Soft: Disabled" .. "\n" .. 
						"Liquid Detail: Fair" .. "\n" .. 
						"Particle Density: Good" .. "\n" .. 
						"SSAO: Low" .. "\n" .. 
						"Depth Effects: Disabled" .. "\n" .. 
						"Compute Effects: Low" .. "\n" .. 
						"Outline Mode: Good" .. "\n" .. 
						"Texture Resolution: Fair" .. "\n" .. 
						"Spell Density: Dynamic" .. "\n" .. 
						"Projected Textures: Enabled" .. "\n" .. 
						"Texture Filtering: x2 Anisotropic" .. "\n" .. 
						"Ray Traced Shadows: Disabled" .. "\n" .. 
						"Resample Quality: FSR" .. "\n" .. 
						"VRS Mode: Standard" .. "\n" .. 
						"Physics Interactions: None" .. "\n" .. 
						"Target FPS: Enabled\n\n" ..
						Addon.r .. "The game will briefly pause while applying the settings.",
						true
					)

		-- Global Audio Settings 
				local header = InterfaceSettingsLib:CreateHeader(Addon.AddonName, "Global", Addon.b .. "Global Audio Settings", Addon.w .. "These options are applied universally across all presets and content types, ensuring consistent performance and audio quality.")

				-- Dropdowns (Create Function In Library For Single Dropdowns) 
					local function GetOptions()
						local container = Settings.CreateControlTextContainer()
						for i, rate in ipairs(Addon.sampleRateOptions) do
							container:Add(i, rate .. " Hz")
						end
						return container:GetData()
					end

					local setting = Settings.RegisterAddOnSetting(HFP_ParentCategory, "Sample Rate", "GlobalAudioSettings_Sound_OutputSampleRate", HFP_SETTINGS, type(4), "Sample Rate", 4)
					setting:SetValueChangedCallback(function(setting, value)
						Addon:OnCVarDropdownSettingChanged(setting, value, Addon.sampleRateOptions)
					end)

					Settings.CreateDropdown(HFP_ParentCategory, setting, GetOptions, "These options apply the sample rate for audio playback." .. Addon.g .. "\n\nA lower value may improve performance" .. Addon.dg .. " (restart required)" .. Addon.g .. "." .. Addon.b .. "\n\nAddon Default: " .. Addon.w .. "22050" .. Addon.b .. "\nGame Default: " .. Addon.w .. "44100" .. Addon.r .. "\n\n\There is no benefit if set higher than your speaker's supported frequency.")

				-- Checkboxes 
					for _, checkbox in ipairs(Addon.globalAudioSettingsCheckboxes) do
						local uniqueVariableKey = "GlobalAudioSettings_" .. checkbox.variable

					-- Classic Only
						if checkbox.classicOnly then
							if Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- Retail Only
						elseif checkbox.retailOnly then
							if not Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- All Versions
						else
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end
					end

				-- Sliders 
					for _, slider in ipairs(Addon.globalAudioSettingsSliders) do
						local uniqueVariableKey = "GlobalAudioSettings_" .. slider.variable
						local sd = InterfaceSettingsLib:CreateSlider(HFP_ParentCategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end)
					end

		-- Global Advanced Settings
			local header = InterfaceSettingsLib:CreateHeader(Addon.AddonName, "Global", Addon.b .. "Global Advanced Settings", Addon.w .. "These options are applied universally across all presets and content types, they are preconfigured for most systems to deliver the optimal balance of performance and visuals.")

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.experimentalSettingsCheckboxes) do
					local uniqueVariableKey = "GlobalAdvancedSettings_" .. checkbox.variable

				-- Cataclysm Only
					if checkbox.cataclysmOnly then
						if Addon.HFP_isClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- Classic Only
					elseif checkbox.classicOnly then
						if Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- Retail Only
					elseif checkbox.retailOnly then
						if not Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- All Versions
					else
						local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
						local cbData = cb:GetSetting()
						cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
					end
				end

			-- Sliders 
				for _, slider in ipairs(Addon.experimentalSettingsSliders) do
					local uniqueVariableKey = "GlobalAdvancedSettings_" .. slider.variable
					local sd = InterfaceSettingsLib:CreateSlider(HFP_ParentCategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end)
				end

		-- Global Addon Settings Header
			local header = InterfaceSettingsLib:CreateHeader(Addon.AddonName, "Global", Addon.b .. "Global Addon Settings", Addon.w .. "Manages settings related to the addon.")

			-- Checkboxes
				for _, checkbox in ipairs(Addon.addonSettingsCheckboxes) do
					local uniqueVariableKey = "GlobalAddonSettings_" .. checkbox.variable
					local cb = InterfaceSettingsLib:CreateCheckbox(HFP_ParentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
					local cbData = cb:GetSetting()
					cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
				end

			-- Create Apply Now Button
				local setting = InterfaceSettingsLib:CreateButton(
					HFP_ParentCategory,
					"Apply Settings",
					"Apply",
					function()
						Sound_GameSystem_RestartSoundSystem()
						RestartGx()
						Addon:ApplyCVarSettings("GxFullscreenResolution", "auto")
					end,
					"Apply settings without restarting the game, ensuring changes take effect immediately (Sort Disk Reads still requires a restart)." .. Addon.r .. "\n\nThe game will briefly pause while applying the settings.",
					true
				)

			-- CVar Viewer
				local setting = InterfaceSettingsLib:CreateButton(
					HFP_ParentCategory,
					"CVar Viewer",
					"Open",
					function()
						Addon:CreateUI()
					end,
					"Opens the CVar Viewer to allow for additional modifications.\n\n" .. Addon.r .. "Adjustments are only recommended for advanced users seeking specific customization.",
					true
				)

			-- Uninstall
				StaticPopupDialogs["HYPERFRAME_UNINSTALL_CONFIRM"] = {
					text = "Are you sure you want to uninstall Hyperframe?\n\n" 
						.. Addon.r 
						.. "Uninstalling the addon will restore your settings to their state from " 
						.. ((HFP_SAVEDCVARS and HFP_SAVEDCVARS.LastBackupDate) and (tostring(HFP_SAVEDCVARS.LastBackupDate) .. ",") or "N/A,") 
						.. " when you first used the addon.",
					button1 = "Yes",
					button2 = "No",
					OnAccept = function()
						Addon:RestoreSettings()
					end,
					timeout = 0,
					whileDead = true,
					hideOnEscape = true,
					preferredIndex = 3,
				}

				local setting = InterfaceSettingsLib:CreateButton(
					HFP_ParentCategory,
					"Uninstall Addon",
					"Uninstall",
					function()
						StaticPopup_Show("HYPERFRAME_UNINSTALL_CONFIRM")
					end,
					"Restores your settings to their state before the addon was first used, then disables the addon and reloads the game.\n\n" 
					.. Addon.r .. "Backup Date: " 
					.. ((HFP_SAVEDCVARS and HFP_SAVEDCVARS.LastBackupDate) and tostring(HFP_SAVEDCVARS.LastBackupDate) or "N/A"),
					true
				)

	-- Register Content Presets Subcategory, Headers and Settings 
		local Subcategory, SubcategoryLayout = InterfaceSettingsLib:CreateSubcategory(HFP_ParentCategory, "Content Presets")

	-- Expand Content Presets Subcategory For New Users
		if HFP_SETTINGS.HFP_NewLogin then
			Subcategory:SetExpanded(true)
		else
			Subcategory:SetExpanded(false)
		end
    
		-- Graphics Presets 
			local header = SubcategoryLayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(Addon.b .. "Content Presets", Addon.w .. "These options automatically apply a tailored preset based on the type of content you're engaged in, optimizing performance and visuals for each activity."))

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.graphicsPresetsCheckboxes) do
					local uniqueVariableKey = "GraphicsPresets_" .. checkbox.variable
					local cb = InterfaceSettingsLib:CreateCheckbox(Subcategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
				end

			-- Dropdowns 
				for _, dropdown in ipairs(Addon.graphicsPresetsDropdowns) do
					local uniqueVariableKey = "GraphicsPresets_" .. dropdown.variable
					if dropdown.retailOnly and dropdown.name == "Delve" then
						if not Addon.isVanillaOrClassic then
							local dd = InterfaceSettingsLib:MakeDropdown(Subcategory, dropdown.name .. " Preset", uniqueVariableKey, dropdown.defaultValue, dropdown.tooltip, Addon.PresetNames, HFP_SETTINGS, function(setting, value) Addon:OnGraphicsPresetDropdownSettingChanged(setting, value) end)
						end
					else
						local dd = InterfaceSettingsLib:MakeDropdown(Subcategory, dropdown.name .. " Preset", uniqueVariableKey, dropdown.defaultValue, dropdown.tooltip, Addon.PresetNames, HFP_SETTINGS, function(setting, value) Addon:OnGraphicsPresetDropdownSettingChanged(setting, value) end)
					end
				end

		-- View Distance Settings 
			local header = SubcategoryLayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(Addon.b .. "View Distance Settings", Addon.w .. "These options control how far you can see in the game world, balancing scene detail and performance based on your preferences."))

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.viewDistanceSettingsCheckboxes) do
					local uniqueVariableKey = "ViewDistanceSettings_" .. checkbox.variable
					local cb = InterfaceSettingsLib:CreateCheckbox(Subcategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
				end

			-- Sliders 
				for _, slider in ipairs(Addon.viewDistanceSettingsSliders) do
					local uniqueVariableKey = "ViewDistanceSettings_" .. slider.variable
					local sd = InterfaceSettingsLib:CreateSlider(Subcategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end)
				end

		-- Custom Preset 
			local header = SubcategoryLayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(Addon.b .. "Custom Preset Settings", Addon.w .. "These options allow you to create and save a personalized preset that can be assigned to any content preset for tailored performance and visuals."))

			-- Sliders 
				for _, slider in ipairs(Addon.customPresetSliders) do
					local uniqueVariableKey = "CustomPreset_" .. slider.variable
					local sd = InterfaceSettingsLib:CreateSlider(Subcategory, slider.name, uniqueVariableKey, slider.variable, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end)
				end

	-- Register Content Settings Subcategories, Headers, and Settings 
		local contentCategory, contentLayout = nil
		for _, contentTypeInfo in ipairs(Addon.graphicsPresetsDropdowns) do
			if Addon.isVanillaOrClassic and contentTypeInfo.retailOnly == true then 
				-- Can Be Removed 
			else

			-- Create Subcategories 
				contentCategory, contentLayout = InterfaceSettingsLib:CreateSubcategory(Subcategory, contentTypeInfo.name .. " Settings")

			-- Create Sync Settings Headers And Buttons 
				local syncHeader = InterfaceSettingsLib:CreateHeader(contentCategory:GetName(), contentTypeInfo.name, Addon.b .. "Sync Settings", Addon.w .. "Apply the current settings to all content types, ensuring consistency across all presets." .. Addon.r .. "\n\nExisting settings for other types will be overwritten.")
					local setting = InterfaceSettingsLib:CreateButton(
						contentCategory,
						"Sync Settings",
						"Sync",
						function()
							Addon:ApplyToAll(contentTypeInfo)
						end,
						"Apply the current settings to all content types, ensuring consistency across all presets." .. Addon.r .. "\n\nExisting settings for other types will be overwritten.",
						true
					)

			-- Generalize Nameplate Max Distance Checkbox Slider 
				if Addon.HFP_isClassic then
					HFP_nameplateAddonDefault = 33
					HFP_nameplateGameDefault = 33
				elseif Addon.HFP_isVanilla then
					HFP_nameplateAddonDefault = 20
					HFP_nameplateGameDefault = 20
				elseif not Addon.HFP_isClassic and not Addon.HFP_isVanilla then
					HFP_nameplateAddonDefault = 42
					HFP_nameplateGameDefault = 60
				end

			-- Combat Settings 
				local combatHeader = InterfaceSettingsLib:CreateHeader(contentCategory:GetName(), contentTypeInfo.name, Addon.b .. "Combat Settings", Addon.w .. "These options help optimize performance during combat scenarios for the selected content type.")
				
				-- Checkboxes 
					for _, checkbox in ipairs(Addon.combatSettingsCheckboxes) do
						local uniqueVariableKey = contentTypeInfo.variable .. "_" .. checkbox.variable

					-- Classic Only
						if checkbox.classicOnly then
							if Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- Retail Only
						elseif checkbox.retailOnly then
							if not Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- All Versions
						else
							local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end
					end

				-- Checkbox Sliders
					InterfaceSettingsLib:CreateCheckBoxSlider(
						contentCategory,
						"Nameplate Max Distance",
						contentTypeInfo.variable .. "_nameplateMaxDistance",
						HFP_nameplateAddonDefault,
						10,
						HFP_nameplateGameDefault,
						1,
						"Controls the maximum distance at which nameplates are visible." .. Addon.g .. "\n\nA lower value may improve performance.".. Addon.b .. "\n\nAddon Default: " .. Addon.w .. HFP_nameplateAddonDefault .. Addon.b .. "\nGame Default: " .. Addon.w .. HFP_nameplateGameDefault .. Addon.r .. "\n\nThis setting cannot be modified during combat.",
						"Nameplate Max Distance",
						false,
						"Leave this option disabled to allow other addons to manage the Nameplate Max Distance setting." .. Addon.b .. "\n\nAddon Default: " .. Addon.w .. "Disabled" .. Addon.r .. "\n\nToggling this option will apply to  all Nameplate Max Distance checkboxes. This setting cannot be modified during combat.",
						HFP_SETTINGS,
						function(setting, value) Addon:OnSliderSettingChanged(setting, value) end,
						function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end
					)

			-- Graphics Settings 
				local graphicsHeader = InterfaceSettingsLib:CreateHeader(contentCategory:GetName(), contentTypeInfo.name, Addon.b .. "Graphics Settings", Addon.w .. "These options optimize graphical effects to improve performance for the selected content type.")
				
				-- Checkboxes 
					for _, checkbox in ipairs(Addon.graphicsSettingsCheckboxes) do
						local uniqueVariableKey = contentTypeInfo.variable .. "_" .. checkbox.variable

					-- Classic Only
						if checkbox.classicOnly then
							if Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- Retail Only
						elseif checkbox.retailOnly then
							if not Addon.isVanillaOrClassic then 
								local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
								local cbData = cb:GetSetting()
								cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
							end

					-- All Versions
						else
							local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end
					end

				-- Sliders 
					for _, slider in ipairs(Addon.graphicsSettingsSliders) do
						local uniqueVariableKey = contentTypeInfo.variable .. "_" .. slider.variable
						InterfaceSettingsLib:CreateSlider(contentCategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end)
					end

			-- Advanced Settings 
				local advancedHeader = InterfaceSettingsLib:CreateHeader(contentCategory:GetName(), contentTypeInfo.name, Addon.b .. "Advanced Settings", Addon.w .. "These options are preconfigured for most systems to deliver the optimal balance of performance and visuals for the selected content type." .. Addon.r .. "\n\nAdjustments are only recommended for advanced users seeking specific customization.")
				
				-- Checkboxes 
				for _, checkbox in ipairs(Addon.advancedSettingsCheckboxes) do
					local uniqueVariableKey = contentTypeInfo.variable .. "_" .. checkbox.variable

					-- Classic Only
					if checkbox.classicOnly then
						if Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

					-- Retail Only
					elseif checkbox.retailOnly then
						if not Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

					-- All Versions
					else
						local cb = InterfaceSettingsLib:CreateCheckbox(contentCategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
						local cbData = cb:GetSetting()
						cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
					end
				end
			end
		end

	-- Register Uber Settings Subcategory
		local Subcategory, SubcategoryLayout = InterfaceSettingsLib:CreateSubcategory(HFP_ParentCategory, "Uber Settings")

		-- Uber Settings
			local header = SubcategoryLayout:AddInitializer(CreateSettingsListSectionHeaderInitializer(Addon.b .. "Uber Graphics Settings", Addon.w .. "These options are hidden in the game's settings and are designed to enhance visual quality at the cost of lower performance, depending on your hardware."))

			-- Checkboxes 
				for _, checkbox in ipairs(Addon.uberSettingsCheckboxes) do
					local uniqueVariableKey = "UberSettingsCheckboxes_" .. checkbox.variable

				-- Classic Only
					if checkbox.classicOnly then
						if Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(Subcategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- Retail Only
					elseif checkbox.retailOnly then
						if not Addon.isVanillaOrClassic then 
							local cb = InterfaceSettingsLib:CreateCheckbox(Subcategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
							local cbData = cb:GetSetting()
							cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
						end

				-- All Versions
					else
						local cb = InterfaceSettingsLib:CreateCheckbox(Subcategory, checkbox.name, uniqueVariableKey, uniqueVariableKey, HFP_SETTINGS, checkbox.default, checkbox.tooltip, function(setting, value) Addon:OnCheckboxSettingChanged(setting, value) end)
						local cbData = cb:GetSetting()
						cbData:SetValue(HFP_SETTINGS[uniqueVariableKey])
					end
				end

			-- Sliders 
				for _, slider in ipairs(Addon.uberSettingsSliders) do
					local uniqueVariableKey = "UberSettingsSliders_" .. slider.variable
					local sd = InterfaceSettingsLib:CreateSlider(Subcategory, slider.name, uniqueVariableKey, uniqueVariableKey, slider.default, slider.min, slider.max, slider.step, slider.tooltip, HFP_SETTINGS, function(setting, value) Addon:OnSliderSettingChanged(setting, value) end, slider.UseDecimals)
				end

	-- Adjust Content Settings For New Users 
		if HFP_SETTINGS.HFP_NewLogin then

		-- Retail Specific Settings 
			if not Addon.isVanillaOrClassic then

			-- Delve Settings 
				local sliderData = InterfaceSettingsLib[AddonName].Sliders["Delve_weatherDensity"]:GetSetting()
				sliderData:SetValue(2)

			-- World settings
				local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_ReplaceMyPlayerPortrait"]:GetSetting()
				checkboxData:SetValue(false)
				local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_ReplaceOtherPlayerPortraits"]:GetSetting()
				checkboxData:SetValue(false)
				local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_unitsLookAtPlayers"]:GetSetting()
				checkboxData:SetValue(true)
				local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_hideTalkingHeadFrame"]:GetSetting()
				checkboxData:SetValue(false)

		-- Classic Specific Settings 
			else

				-- Empty

			end

		-- Arena Settings 
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["Arena_showDispelDebuffs"]:GetSetting()
			checkboxData:SetValue(false)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["Arena_violenceLevel"]:GetSetting()
			sliderData:SetValue(2)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["Arena_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- Battleground Settings 
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["Battleground_showDispelDebuffs"]:GetSetting()
			checkboxData:SetValue(false)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["Battleground_violenceLevel"]:GetSetting()
			sliderData:SetValue(1)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["Battleground_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- Epic Battleground Settings 
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["EpicBattleground_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- City Settings
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["City_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- Dungeon Settings 
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["Dungeon_showDispelDebuffs"]:GetSetting()
			checkboxData:SetValue(false)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["Dungeon_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- Large Raid Settings 
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["LargeRaid_showDispelDebuffs"]:GetSetting()
			checkboxData:SetValue(false)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["LargeRaid_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- Small Raid Settings 
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["SmallRaid_showDispelDebuffs"]:GetSetting()
			checkboxData:SetValue(false)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["SmallRaid_weatherDensity"]:GetSetting()
			sliderData:SetValue(0)

		-- World Settings 
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["World_weatherDensity"]:GetSetting()
			sliderData:SetValue(2)
			local sliderData = InterfaceSettingsLib[AddonName].Sliders["World_violenceLevel"]:GetSetting()
			sliderData:SetValue(2)
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_specular"]:GetSetting()
			checkboxData:SetValue(true)
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_ffxGlow"]:GetSetting()
			checkboxData:SetValue(true)
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_SkyCloudLOD"]:GetSetting()
			checkboxData:SetValue(false)
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_animFrameSkipLOD"]:GetSetting()
			checkboxData:SetValue(false)
			local checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["World_pathSmoothing"]:GetSetting()
			checkboxData:SetValue(true)
			if not Addon.isVanillaOrClassic then

			end


		end
	
	end)

-- On Event --
-------------- 
	local function HFP_ONEVENT_FUNC(self, event, ...)

	-- Apply Preset When Zone Changes 
		if event == "ZONE_CHANGED_NEW_AREA" then
			local mapID = C_Map.GetBestMapForUnit("player")
			if HyperframePlusAddon.mapIDs[mapID] then
				print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: The |c00ffffffWorld|c00ffff00 preset has been applied.")
			end
			Addon:ZoneChanged(event)

	-- Player Login 
		elseif event == "PLAYER_LOGIN" then

			local endTime = debugprofilestop()
			if HFP_SETTINGS.GlobalAddonSettings_DisplayLoginTime == true then
				local timeTaken = (endTime - Addon.HFP_LoginStartTime) / 1000
				print(string.format("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: Login completed in " .. Addon.w .. "%.2f |c00ffff00seconds.", timeTaken))
			end

		-- Disable Old Version 
			C_AddOns.DisableAddOn("Hyperframe")

		-- Apply Global Settings At Login 
			C_Timer.After(Addon.timerGlobalSettingsLogin, function()

			-- Debug
				if Addon.debug then
					print("-- [Applying Global Settings] --")
				end

				Addon:ApplyCVarSettings(Addon.globalSettings)
			end)

		-- Determine Preset At Logon 
			if HFP_SETTINGS["GraphicsPresets_useContentPresets"] == true then
				HFP_SETTINGS.preset = 0
				C_Timer.After(Addon.timerDeterminePresetLogin, function()
					Addon:DeterminePreset(event)
				end)
			else
				if not HFP_SETTINGS.HFP_NewLogin then
					Addon.timerSettingsAppliedLogin = Addon.timerSettingsAppliedLogin  - 3
				end
			end

		-- Apply Managed Graphics Settings ( Legacy )
			if not HFP_SETTINGS.HFP_NewLogin then
				Addon.timerSettingsAppliedLogin = Addon.timerSettingsAppliedLogin  - 3
			end

		-- Welcome Message 
			if not HFP_SETTINGS.HFP_NewLogin then
				C_Timer.After(0.1, function()
					if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset then
						print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|c00FF7D0A Settings are being applied. Please avoid making changes until the process is complete.")
					end
					C_Timer.After(Addon.timerSettingsAppliedLogin, function()
						Addon.AddonInit = false
						HFP_SETTINGS.HFP_NewLogin = false
						if HFP_SETTINGS.GlobalAddonSettings_DisplayCurrentPreset then
							print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]:|cFF00FF00 All settings have been successfully applied. You can now make changes. Type |c00ffffff/hf |cFF00FF00to open the addon settings, or |c00ffffff/hf help |cFF00FF00to view available slash commands.")
						end
					end)
				end)
			end

	-- Apply Optimized Logout Settings 
		elseif event == "PLAYER_LOGOUT" then

			if not Addon.reset then

			-- Cancel Zone Change Timer 
				if Addon.zoneChangeTimer then
					Addon.zoneChangeTimer:Cancel()
					Addon.zoneChangeTimer = nil
				end

			-- Apply Settings 
				if not HFP_SETTINGS.reloaded then
					local UCP_checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["GraphicsPresets_useContentPresets"]
					local UCP_settingsTable = UCP_checkboxData:GetSetting()
					local MLS_checkboxData = InterfaceSettingsLib[AddonName].Checkboxes["GlobalAdvancedSettings_manageLogoutSettings"]
					local MLS_settingsTable = MLS_checkboxData:GetSetting()
					if not UCP_settingsTable:GetValue() or not MLS_settingsTable:GetValue() then
						Addon:ApplyCVarSettings(Addon.optimizedLogoutNoContentPresetsSettings)
					else
						Addon:ApplyCVarSettings(Addon.optimizedLogoutSettings)
					end
					HFP_SETTINGS.preset = 0
				end
			
			end

	-- Handle Combat
		elseif event == "PLAYER_REGEN_DISABLED" then
			Addon.combat = true
		elseif event == "PLAYER_REGEN_ENABLED" then
			Addon.combat = false

	-- Playing Resting 
		elseif event == "PLAYER_UPDATE_RESTING" then
			Addon:ZoneChanged(event)

	-- Hide Talking Head Frame
		elseif event == "TALKINGHEAD_REQUESTED" then
			local lastAppliedContentType = Addon.lastAppliedContentType or ""
			for key, cbData in pairs(InterfaceSettingsLib[AddonName].Checkboxes) do
				if key:match(lastAppliedContentType .. "_hideTalkingHeadFrame") then
					local settingsTable = cbData:GetSetting()
					local value = settingsTable:GetValue()
					if value then
						C_TalkingHead.IgnoreCurrentTalkingHead()
						TalkingHeadFrame:SetAlpha(0)
						TalkingHeadFrame:Hide()
						break
					else
						TalkingHeadFrame:SetAlpha(1)
					end
				end
			end

	-- On CVar Update 
		elseif event == "CVAR_UPDATE" then
			local cvar, value = ...

		-- Debug 
			if Addon.debug then
				print("[CVAR_CHANGED]:", cvar, value .. ".")
			end

		-- graphicsParticleDensity 
			if cvar == "graphicsParticleDensity" then
				C_Timer.After(Addon.timerEventDelay, function()
					local lastAppliedContentType = Addon.lastAppliedContentType or ""
					for key, sliderData in pairs(InterfaceSettingsLib[AddonName].Sliders) do
						if key:match(lastAppliedContentType .. "_weatherDensity") then
							local settingsTable = sliderData:GetSetting()
							local value = settingsTable:GetValue()
							settingsTable:ApplyValue(value)
							break
						end
					end
					local sd = InterfaceSettingsLib[AddonName].Sliders["GlobalGraphicsSettings_particleMTDensity"]
					local sdData = sd:GetSetting()
					sdData:TriggerValueChanged(sdData:GetValue())
				end)

		-- graphicsTextureResolution
			elseif cvar == "graphicsTextureResolution" then
				C_Timer.After(Addon.timerEventDelay, function()
					local dd = InterfaceSettingsLib[AddonName].Dropdowns["WorldBaseMipmapLevel"]
					local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalGraphicsSettings_componentTextureLevel"]
					local ddData = dd:GetSetting()
					local cbData = cb:GetSetting()
					local ddValue = ddData:GetValue()
					local cbValue = cbData:GetValue()
					ddData:ApplyValue(ddValue)
					cbData:ApplyValue(cbValue)
					C_CVar.SetCVar("terrainMipLevel", 1)
					C_Timer.After(Addon.timerEventDelay, function()
						Addon:DefragGPU()
					end)
				end)

		-- graphicsComputeEffects
			elseif cvar == "graphicsComputeEffects" then
				C_Timer.After(Addon.timerEventDelay, function()
					local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalGraphicsSettings_clusteredShading"]
					local cbData = cb:GetSetting()
					local cbValue = cbData:GetValue()
					cbData:ApplyValue(cbValue)
					--[[ local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalGraphicsSettings_UseOldVolumeFog"]
					local cbData = cb:GetSetting()
					local cbValue = cbData:GetValue()
					if cbValue == true then
						C_CVar.SetCVar("UseOldVolumeFog", 1)
						C_Timer.After(Addon.timerEventDelay, function()
							C_CVar.SetCVar("UseOldVolumeFog", 0)
						end)
					end ]]
				end)

		-- graphicsSliders
			elseif cvar == "graphicsViewDistance" or cvar == "graphicsEnvironmentDetail" or cvar == "graphicsGroundClutter" then
				C_Timer.After(Addon.timerEventDelay, function()
					HFP_SETTINGS.preset = 0
					Addon:DeterminePreset()
					C_Timer.After(Addon.timerEventDelay, function()
						Addon:DefragGPU()
					end)
				end)

		-- GxMaxFrameLatency 
			elseif cvar == "GxMaxFrameLatency" then
				C_Timer.After(Addon.timerEventDelay, function()
					local sd = InterfaceSettingsLib[AddonName].Sliders["GlobalAdvancedSettings_GxMaxFrameLatency"]
					local sdData = sd:GetSetting()
					sdData:TriggerValueChanged(sdData:GetValue())
				end)

		-- UseOldVolumeFog
			--[[ elseif cvar == "UseOldVolumeFog" then
				local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalAdvancedSettings_gxMTVolFog"]
				local cbData = cb:GetSetting()
				cbData:ApplyValue(false) ]]

		-- gxMTVolFog 
			--[[ elseif cvar == "gxMTVolFog" then
				local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalGraphicsSettings_UseOldVolumeFog"]
				local cbData = cb:GetSetting()
				cbData:ApplyValue(false) ]]

		-- shadowRt
			elseif cvar == "shadowRt" or cvar == "componentTextureLevel" then
				C_Timer.After(Addon.timerEventDelay, function()
					Addon:DefragGPU()
				end)

		-- graphicsShadowQuality 
			elseif cvar == "graphicsShadowQuality" then
				C_Timer.After(Addon.timerEventDelay, function()
					local dd = InterfaceSettingsLib[AddonName].Dropdowns["ShadowTextureSize"]
					local cb = InterfaceSettingsLib[AddonName].Checkboxes["GlobalGraphicsSettings_shadowSoft"]
					local ddData = dd:GetSetting()
					local cbData = cb:GetSetting()
					local ddValue = ddData:GetValue()
					local cbValue = cbData:GetValue()
					ddData:ApplyValue(ddValue)
					cbData:ApplyValue(cbValue)
					Addon:ApplyCVarSettings("shadowBlendCascades", 0)
					C_Timer.After(Addon.timerEventDelay, function()
						Addon:DefragGPU()
					end)
				end)
			end
		end
	end

	-- Register Events 
		Addon.HFP_ONEVENT:RegisterEvent("PLAYER_LOGIN")
		Addon.HFP_ONEVENT:RegisterEvent("ZONE_CHANGED_NEW_AREA")
		Addon.HFP_ONEVENT:RegisterEvent("PLAYER_LOGOUT")
		Addon.HFP_ONEVENT:RegisterEvent("CVAR_UPDATE")
		Addon.HFP_ONEVENT:RegisterEvent("PLAYER_UPDATE_RESTING")
		Addon.HFP_ONEVENT:RegisterEvent("PLAYER_REGEN_DISABLED")
		Addon.HFP_ONEVENT:RegisterEvent("PLAYER_REGEN_ENABLED")

		if not Addon.isVanillaOrClassic then
			Addon.HFP_ONEVENT:RegisterEvent("TALKINGHEAD_REQUESTED")
		end

	-- Set Scripts 
		Addon.HFP_ONEVENT:SetScript("OnEvent", HFP_ONEVENT_FUNC)

-- Slash Commands --
-------------------- 

	-- Register Slash Commands 
		SLASH_HYPERFRAMEPLUS1, SLASH_HYPERFRAMEPLUS2 = Addon.SlashCommands.Command1, Addon.SlashCommands.Command2

	-- Slash Commands Functions Table 
		local slashCommandFuncs = {
			low = function() Addon:ApplyLow() end,
			fair = function() Addon:ApplyFair() end,
			good = function() Addon:ApplyGood() end,
			high = function() Addon:ApplyHigh() end,
			["very high"] = function() Addon:ApplyVeryHigh() end,
			ultra = function() Addon:ApplyUltra() end,
			["ultra high"] = function() Addon:ApplyUltraHigh() end,
			custom = function() Addon:ApplyCustom() end,
		}

	-- Slash Commands Function 
		local function SlashCommandsHandler(msg)
		msg = string.lower(msg):gsub("^%s*(.-)%s*$", "%1"):gsub("%s+", " ")

		-- Debug 
			if Addon.debug then
				print("[Slash Command]:", msg)
			end
    
		-- Help 
			if msg == "help" then
				print("|c00ffffff/hf |c00ffff00\n- Opens the Hyperframe settings menu.")
				print("|c00ffffff/hf cvar |c00ffff00\n- Opens the addon's CVar Viewer for quick access to variable settings.")
				print("|c00ffffff/hf defaults |c00ffff00\n- Restores the addon's default settings. This does not revert your pre-addon settings (use the Uninstall button for that).")
				print("|c00ffffff/hf defrag |c00ffff00\n- Manually defragments and frees up suballocated GPU resources to optimize performance.")
				print("|c00ffffff/hf preset_name |c00ffff00\n- Temporarily applies the specified graphics preset.")

		-- Apply Preset 
			elseif slashCommandFuncs[msg] then
				slashCommandFuncs[msg]()

		-- Reset Defaults 
			elseif msg == "defaults" then
				StaticPopup_Show("HYPERFRAME_DEFAULTS_CONFIRM")

		-- Reset Defaults 
			elseif msg == "cvar" then
				Addon.CreateUI()

		-- Defrag GPU
			elseif msg == "defrag" then
				Addon:DefragGPU()
				ReloadUI()

		-- Open Interface Settings 
			else
				Settings.OpenToCategory(HFP_ParentCategory.ID)
			end

		end

		-- Register Slash Commands Handler 
			SlashCmdList["HYPERFRAMEPLUS"] = SlashCommandsHandler