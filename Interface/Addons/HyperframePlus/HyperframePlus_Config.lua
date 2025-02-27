
-- Addon Table --
----------------- 

	HyperframePlusAddon = {}
	HyperframePlusAddon.AddonName = "Hyperframe+"
	HyperframePlusAddon.AddonFileName = "HyperframePlus"

	-- Core --
	---------- 

		-- Variables --
		--------------- 

			-- Colors 
				HyperframePlusAddon.b = "\124cnBATTLENET_FONT_COLOR:"
				HyperframePlusAddon.dg = "\124cFF40BC40"
				HyperframePlusAddon.g = "\124cFF3CE13F"
				HyperframePlusAddon.n = "\124cnNORMAL_FONT_COLOR:"
				HyperframePlusAddon.o = "\124cnORANGE_FONT_COLOR:"
				HyperframePlusAddon.r = "\124cnWARNING_FONT_COLOR:"
				HyperframePlusAddon.p = "\124cnTRANSMOGRIFY_FONT_COLOR:"
				HyperframePlusAddon.w = "\124cnWHITE_FONT_COLOR:"
				HyperframePlusAddon.y = "\124cnPASSIVE_SPELL_FONT_COLOR:"
				HyperframePlusAddon.ly = "\124cnLIGHTYELLOW_FONT_COLOR:"

			-- Register Addon Shortname 
				local adn = HyperframePlusAddon

			-- Version 
				HyperframePlusAddon.HFP_isClassic = (WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC)
				HyperframePlusAddon.HFP_isVanilla = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC)
				HyperframePlusAddon.isVanillaOrClassic = HyperframePlusAddon.HFP_isClassic or HyperframePlusAddon.HFP_isVanilla 

		-- Functions --
		--------------- 

			-- GenerateTooltip 
				local function GenerateTooltip(description, performanceImpact, addonDefault, gameDefault, additionalInfo) 
					local tooltip = description

					if performanceImpact then
						tooltip = tooltip .. "\n\n" .. adn.g .. performanceImpact
					end

					if addonDefault then
						tooltip = tooltip .. adn.b .. "\n\nAddon Default: " .. adn.w .. addonDefault
					end

					if gameDefault then
						tooltip = tooltip .. adn.b .. "\nGame Default: " .. adn.w .. gameDefault
					end

					if additionalInfo then
						tooltip = tooltip .. adn.r .. "\n\n" .. additionalInfo
					end

					return tooltip
				end

	-- Config --
	------------ 

		-- Booleans --
		-------------- 

			-- Debug 
			HyperframePlusAddon.debug = false

			-- Reset 
			HyperframePlusAddon.reset = false

			-- Addon Loaded
			HyperframePlusAddon.addonLoaded = false
			if HyperframePlusAddon.addonLoaded == false then
				HyperframePlusAddon.addonLoaded = true
				HyperframePlusAddon.HFP_LoginStartTime = debugprofilestop()
			end

			-- Edit Box Placeholder
			HyperframePlusAddon.editBoxPlaceHolder = nil

		-- Tables --
		------------ 

			-- Checkbox Definitions 

				-- Uber Settings
					HyperframePlusAddon.uberSettingsCheckboxes = {
						{ -- Force Forward Transparent Lighting
							name = "Force Forward Transparent Lighting", 
							variable = "forceClusteredShading", 
							default = false, 
							tooltip = GenerateTooltip(
								"Controls whether the game forces all transparent objects to use forward transparent lighting.",
								"Enabling this option enhances lighting quality on all transparent objects at the cost of performance.",
								"Disabled",
								"Disabled",
								"Forward Transparent Lighting must be enabled for this setting to have an effect."
							)
						},
						{ -- Use Old Volumetric Fog
							name = "Use Old Volumetric Fog", 
							variable = "UseOldVolumeFog", 
							default = false, 
							tooltip = GenerateTooltip( 
								"Controls whether the game renders volumetric fog using the old or new method.", 
								"Enabling this option uses the old volumetric fog method, providing a denser, more cinematic look at the cost of performance.", 
								"Disabled", 
								"Disabled",
								"Compute Effects must be set to Good or higher for this setting to have an effect."
							)
						},
					}

				-- Global Combat Settings
					HyperframePlusAddon.globalCombatSettingsCheckboxes = {
						{ -- Fullscreen Nether 
							name = "Fullscreen Nether", 
							variable = "ffxNether", 
							default = true, 
							tooltip = GenerateTooltip(
								"Controls fullscreen nether-like effects, such as those from Mage's Greater Invisibility and edge-screen effects.",
								"Enabling this option can reduce performance by increasing GPU usage associated with rendering transparency.",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Predicted Health 
							name = "Predicted Health", 
							variable = "predictedHealth", 
							default = true, 
							tooltip = GenerateTooltip( 
								"Controls the display of player health to include pending heals or damage as if already applied.", 
								"Enabling this option can reduce performance by increasing the CPU load associated with real-time health updates.", 
								"Enabled", 
								"Enabled",
								"Disabling this option is not recommended for healers or tanks."
							)
						},
					}

				-- Global Graphics Settings
					HyperframePlusAddon.globalSettingsCheckboxes = {
						{ -- Component Emissive 
							name = "Component Emissive", 
							variable = "componentEmissive", 
							default = false, 
							tooltip = GenerateTooltip(
								"Controls character tattoo-like effects and similar emissive details.",
								"Enabling this option can reduce performance by increasing visual complexity on certain models.",
								"Disabled",
								"Enabled"
							)
						},
						{ -- Component Texture Level 
							name = "Component Texture Level",
							variable = "componentTextureLevel",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting lowers the level of detail for character component textures.",
								"Disabling this option may reduce performance and increase memory usage.",
								"Enabled",
								"Disabled",
								"Changing the Texture Resolution setting will re-apply this value."
							)
						},
						{ -- Forward Transparent Lighting
							name = "Forward Transparent Lighting", 
							variable = "clusteredShading", 
							default = false, 
							tooltip = GenerateTooltip(
								"When enabled, this setting allows forward transparent lighting, affecting how transparent objects interact with light.",
								"Enabling this option can reduce performance by increasing GPU usage, especially in dark environments.",
								"Disabled",
								"Enabled",
								"Changing the Compute Effects setting will re-apply this value."
							)
						},
						{ -- Fullscreen Death 
							name = "Fullscreen Death", 
							variable = "ffxDeath", 
							default = true, 
							tooltip = GenerateTooltip(
								"Controls the fullscreen death effect.",
								"Enabling this option can reduce performance by increasing GPU usage while dead.",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Ground Effect Animation 
							name = "Ground Effect Animation", 
							variable = "groundEffectAnimation", 
							classicOnly = true,
							default = false, 
							tooltip = GenerateTooltip(
								"Controls animations for ground effect objects, such as grass and flowers, causing them to move dynamically as you walk through them.",
								"Enabling this option can reduce performance by increasing GPU usage for dynamic object animations.", 
								"Disabled",
								"Enabled"
							)
						},
						{ -- Soft Shadows 
							name = "Soft Shadows", 
							variable = "shadowSoft", 
							default = false, 
							tooltip = GenerateTooltip(
								"Controls the softness of rendered shadows.",
								"Enabling this option can significantly reduce performance by increasing GPU usage and causes shadow banding if the Shadow Texture Size is 512 MB.",
								"Disabled",
								"Disabled",
								"Changing the Shadow Quality setting will re-apply this value."
							)
						},
						--[[ { -- Use Old Volume Fog 
							name = "Use Old Volumetric Fog", 
							variable = "UseOldVolumeFog", 
							default = true, 
							tooltip = GenerateTooltip(
								"Controls whether the game uses advanced volumetric fog.",
								"Enabling this option uses advanced volumetric fog and can reduce performance by increasing GPU usage in fog-heavy areas, especially when Compute Effects is set to a higher value.",
								"Disabled",
								"Enabled",
								"Changing this setting will disable Multithreaded Volume Fog Rendering."
							)
						} ]]
					}

				-- Global Advanced Settings
					HyperframePlusAddon.experimentalSettingsCheckboxes = {
						{ -- Cacheless Shader Mode 
							name = "Cacheless Shader Mode", 
							variable = "GxAllowCachelessShaderMode", 
							default = false, 
							tooltip = GenerateTooltip(
								"Controls whether shaders are fetched from disk as needed instead of being kept in memory. ",
								"Enabling this option can improve performance on systems with less than 16 GB of RAM, particularly when the game is stored on a solid-state drive, by reducing disk paging" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"Disabled",
								"Disabled"
							)
						},
						{ -- Camera Spline Optimization 
							name = "Camera Spline Optimization", 
							variable = "SplineOpt", 
							default = true, 
							tooltip = GenerateTooltip(
								"Controls camera movements along splines to improve the smoothness of transitions and motion.",
								"Enabling this option can reduce performance on GPU-limited systems while the camera is in motion.",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Login Optimizations
							name = "Login Optimizations", 
							variable = "manageLogoutSettings", 
							default = false, 
							tooltip = GenerateTooltip(
								"Adjusts various graphics settings and console variables to enhance loading times for your next login.",
								"Enabling this option can reduce loading times but may negatively affect the appearance of the character login screen. Disabling this option retains the last-used graphics preset but may increase loading times.",
								"Disabled"
							)
						},
						{ -- Multithreaded Alpha Rendering 
							name = "Multithreaded Alpha Rendering",
							variable = "gxMTAlphaM2",
							default = true,
							tooltip = GenerateTooltip(
								"Distributes transparent rendering workloads across multiple threads.",
								"Enabling this option may reduce performance in cities or raids due to CPU overutilization, while disabling it may slightly impact open world performance and loading times.",
								"Enabled",
								"Enabled",
								"Performance results may vary depending on content type, system hardware, and current in-game conditions."
							)
						},
						{ -- Multithreaded Miscellaneous Rendering 
							name = "Multithreaded Miscellaneous Rendering",
							variable = "gxMTMisc",
							default = true,
							tooltip = GenerateTooltip(
								"Distributes miscellaneous rendering (minor or secondary tasks that don’t fall into major categories) workloads across multiple threads.",
								"Enabling this option may reduce performance in cities or raids due to CPU overutilization, while disabling it may slightly impact open world performance and loading times.",
								"Enabled",
								"Enabled",
								"Performance results may vary depending on content type, system hardware, and current in-game conditions."
							)
						},
						{ -- Multithreaded Outline Rendering 
							name = "Multithreaded Outline Rendering",
							variable = "gxMTOutlines",
							retailOnly = true,
							default = true,
							tooltip = GenerateTooltip(
								"Distributes outline rendering (the process of drawing borders around objects or characters) workloads across multiple threads.",
								"Enabling this option may reduce performance in cities or raids due to CPU overutilization, while disabling it may slightly impact open world performance and loading times.",
								"Enabled",
								"Enabled",
								"Performance results may vary depending on content type, system hardware, and current in-game conditions."
							)
						},
						{ -- Multithreaded Volume Fog Rendering 
							name = "Multithreaded Volume Fog Rendering",
							variable = "gxMTVolFog",
							default = true,
							tooltip = GenerateTooltip(
								"Distributes volume fog rendering (the process of simulating fog or mist in 3D space) workloads across multiple threads.",
								"Enabling this option may reduce performance in cities or raids due to CPU overutilization, while disabling it may slightly impact open world performance and loading times.",
								"Enabled",
								"Enabled",
								"Performance results may vary depending on content type, system hardware, and current in-game conditions."
							)
						},
						{ -- Scene Occlusion 
							name = "Scene Occlusion",
							variable = "sceneOcclusionEnable",
							default = true,
							tooltip = GenerateTooltip(
								"Controls occlusion culling, which skips rendering objects not visible to the player.",
								"Enabling this option may reduce performance in cities or raids due to CPU overutilization, while disabling this option can improve performance in these areas if your system has sufficient memory to render the hidden objects, reducing the CPU load.",
								"Enabled",
								"Enabled",
								"Performance results may vary depending on content type, system hardware, and current in-game conditions."
							)
						},
						{ -- Shadow Flickering 
							name = "Shadow Flickering",
							variable = "gxMTOpaqueM2",
							default = true,
							tooltip = GenerateTooltip(
								"Disabling this option fixes shadow flickering introduced in Cataclysm but significantly reduces frame rate.",
								"Enabling this option is recommended unless you are encountering the issue.",
								"Enabled",
								"Enabled",
								"This bug is unrelated to the addon but included to help affected players."
							),
							cataclysmOnly = true
						},
						{ -- Sort Disk Reads 
							name = "Sort Disk Reads",
							variable = "sortDiskReads",
							default = false,
							tooltip = GenerateTooltip(
								"Sorts disk reads to prevent sudden spikes in access times.",
								"Enabling this option may improve performance on systems with slower, older hard disk drives" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"Disabled",
								"Disabled",
								"This setting should not be enabled on solid-state drives, as it can result in slower asset loading."
							)
						},
						{ -- Slug Text Rendering
							name = "Slug Text Rendering", 
							variable = "UseSlug", 
							default = true, 
							tooltip = GenerateTooltip(
								"Renders text using outline data to produce crisp text for game world objects, such as player names, and floating combat text.",
								"Enabling this option may reduce performance in areas with a lot of displayed text, as it increases CPU and GPU usage for rendering.",
								"Enabled",
								"Enabled",
								"When disabled, this may make small text in the game world difficult to read."
							)
						}
					}

				-- Global Addon Settings
					HyperframePlusAddon.addonSettingsCheckboxes = {
						{ -- Display Addon Chat Messages
							name = "Display Chat Messages", 
							variable = "DisplayCurrentPreset", 
							default = true, 
							tooltip = GenerateTooltip(
								"Displays a message whenever the content type changes, such as transitioning from World to City, and hides the login messages.",
								"Enabling this option helps inform you of upcoming visual changes based on the newly applied preset and warns against changing settings during addon initialization.",
								"Enabled"
							)
						},
						{ -- Display Login Time
							name = "Display Login Time", 
							variable = "DisplayLoginTime", 
							default = false, 
							tooltip = GenerateTooltip(
								"Displays a message showing how long it took for the game to load after the first addon was loaded.",
								"Enabling this option helps inform you of how long it took for the game to load.",
								"Disabled"
							)
						},
					}

				-- Global Audio Settings
					HyperframePlusAddon.globalAudioSettingsCheckboxes = {
						{ -- DSP Effects 
							name = "DSP Effects",
							variable = "Sound_EnableDSPEffects",
							retailOnly = true,
							default = true,
							tooltip = GenerateTooltip(
								"Applies highpass filtering to player, NPC, and ambient sounds.",
								"Enabling this option can reduce performance by increasing CPU usage for real-time audio processing" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Footstep Sounds 
							name = "Footstep Sounds",
							variable = "FootstepSounds",
							default = true,
							tooltip = GenerateTooltip(
								"Plays footstep sounds for nearby objects, including the player.",
								"Enabling this option can reduce performance by increasing CPU usage for processing nearby sound effects.",
								"Enabled",
								"Enabled"
							)
						}
					}

				-- Graphics Presets
					HyperframePlusAddon.graphicsPresetsCheckboxes = {
						{ -- Use Content Presets 
							name = "Use Content Presets",
							variable = "useContentPresets",
							default = true,
							tooltip = GenerateTooltip(
								"When disabled, content presets won't auto-apply based on your activity. Use slash commands or the games graphics options to adjust settings manually.",
								nil,
								"Enabled",
								nil,
								"Unchecking this option restores the default content type and preset settings, and disables the Hide Talking Head Frame option. Global Settings will still be applied to enhance performance."
							)
						}
					}
				
				-- View Distance Settings 
					HyperframePlusAddon.viewDistanceSettingsCheckboxes = {
						{ -- Apply Preset View Distances 
							name = "Apply Preset View Distances",
							variable = "applyPresetViewDistances",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting overrides the Far Clip and Horizon Start sliders below, applying preset view distances instead.",
								nil,
								"Enabled",
								nil,
								"This has no effect when using the Custom Preset; use the Custom Preset sliders instead."
							)
						}
					}

				-- Combat Settings 
					HyperframePlusAddon.combatSettingsCheckboxes = {
						{ -- Buff Durations 
							name = "Buff Durations",
							variable = "buffDurations",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting displays a numerical countdown for the remaining duration of buffs and debuffs on your character.",
								"Disabling this option may improve performance.",
								"Varies",
								"Enabled"
							)
						},
						{ -- Display Only Dispellable Debuffs 
							name = "Display Only Dispellable Debuffs",
							variable = "showDispelDebuffs",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting shows only dispellable debuffs on raid frames.",
								"Disabling this option may reduce performance.",
								"Varies",
								"Enabled"
							)
						},
						{ -- Floating Combat Text Damage 
							name = "Floating Combat Text Damage",
							variable = "floatingCombatTextCombatDamage",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting displays floating text showing the damage dealt to enemies in real time.",
								"Disabling this option may improve performance.",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Floating Combat Text Healing 
							name = "Floating Combat Text Healing",
							variable = "floatingCombatTextCombatHealing",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting displays floating text showing the healing done to others in real time.",
								"Disabling this option may improve performance.",
								"Enabled",
								"Enabled"
							)
						},
						{ -- Show Guild Titles 
							name = "Show Guild Titles",
							variable = "UnitNamePlayerGuild",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting displays guild titles in the game world.",
								"Disabling this option may improve performance.",
								"Enabled",
								"Enabled",
								"This setting cannot be modified during combat."
							)
						},
						{ -- Show Player Titles 
							name = "Show Player Titles",
							variable = "UnitNamePlayerPVPTitle",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting displays player titles in the game world.",
								"Disabling this option may improve performance.",
								"Enabled",
								"Enabled",
								"This setting cannot be modified during combat."
							)
						},
						{ -- Replace My Player Portrait 
							name = "Replace My Player Portrait",
							variable = "ReplaceMyPlayerPortrait",
							retailOnly = true,
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting replaces your player unit frame portrait with your class icon.",
								"Disabling this option may reduce performance.",
								"Varies",
								"Disabled"
							)
						},
						{ -- Replace Other Player Portraits 
							name = "Replace Other Player Portraits",
							variable = "ReplaceOtherPlayerPortraits",
							retailOnly = true,
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting replaces portraits in other players' unit frames with their class icons.",
								"Disabling this option may reduce performance.",
								"Varies",
								"Disabled"
							)
						}
					}

				-- Graphics Settings 
					HyperframePlusAddon.graphicsSettingsCheckboxes = {
						{ -- Animation Level of Detail 
							name = "Animation Level of Detail",
							variable = "animFrameSkipLOD",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting adjusts how often animation frames are rendered for certain objects or characters, typically those farther from the camera.",
								"Disabling this option may reduce performance.",
								"Varies",
								"Disabled"
							)
						},
						{ -- Cloud Level of Detail 
							name = "Cloud Level of Detail",
							variable = "SkyCloudLOD",
							default = true,
							tooltip = GenerateTooltip(
								"When enabled, this setting reduces the level of detail of clouds in the sky.",
								"Disabling this option may reduce performance.",
								"Varies",
								"Disabled"
							)
						},
						{ -- Fullscreen Glow 
							name = "Fullscreen Glow",
							variable = "ffxGlow",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting adds a subtle glowing effect to certain objects and environments, giving a smoother, more luminous appearance, particularly in areas with bright lighting or strong contrast.",
								"Enabling this option may reduce performance.",
								"Varies",
								"Enabled"
							)
						},
						{ -- Specular 
							name = "Specular",
							variable = "specular",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, objects like water, terrain, or metallic surfaces will appear shinier and more reflective under direct lighting.",
								"Enabling this option may reduce performance.",
								"Varies",
								"Enabled"
							)
						}
					}

				-- Advanced Settings 
					HyperframePlusAddon.advancedSettingsCheckboxes = {
						{ -- Ignore Talking Head
							name = "Ignore Talking Head",
							variable = "hideTalkingHeadFrame",
							retailOnly = true,
							default = true,
							tooltip = GenerateTooltip(
								"Enabling this option automatically hides and silences the Talking Head frame whenever it appears.",
								"Enabling this option can improve performance by reducing CPU and GPU usage associated with rendering, updating UI elements, and processing sound.",
								"Enabled",
								"Disabled"
							)
						},
						{ -- Impact Model Collision Melee 
							name = "Impact Model Collision Melee",
							variable = "ImpactModelCollisionMelee",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting controls whether melee attacks trigger collision effects or interact with impact models in a realistic way.",
								"Enabling this option may reduce performance.",
								"Disabled",
								"Enabled"
							)
						},
						{ -- Impact Model Collision Missile 
							name = "Impact Model Collision Missile",
							variable = "ImpactModelCollisionMissile",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting controls whether projectile or missile-type attacks (such as arrows or thrown objects) trigger collision effects or interact with impact models in a realistic way.",
								"Enabling this option may reduce performance.",
								"Disabled",
								"Enabled"
							)
						},
						{ -- Impact Model Collision Ranged 
							name = "Impact Model Collision Ranged",
							variable = "ImpactModelCollisionRanged",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting controls whether ranged attacks trigger collision effects or interact with impact models in a realistic way.",
								"Enabling this option may reduce performance.",
								"Disabled",
								"Enabled"
							)
						},
						{ -- Path Smoothing 
							name = "Path Smoothing",
							variable = "pathSmoothing",
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting smooths the movement paths for NPCs, making their motion appear more fluid.",
								"Enabling this option may reduce performance.",
								"Varies",
								"Enabled"
							)
						},
						{ -- Units Look At Players 
							name = "Units Look At Players",
							variable = "unitsLookAtPlayers",
							retailOnly = true,
							default = false,
							tooltip = GenerateTooltip(
								"When enabled, this setting makes NPCs and certain creatures visually follow or look at the player as they move.",
								"Enabling this option may reduce performance.",
								"Varies",
								"Enabled"
							)
						}					
					}

			-- Content Type 
				HyperframePlusAddon.contentType = {}

			-- Slider Definitions 

				-- Uber Graphics Settings 
					HyperframePlusAddon.uberSettingsSliders = {
						{ -- ASSAO Horizon Angle Thresh
							name = "ASSAO Horizon Angle Thresh",
							variable = "assaoHorizonAngleThresh",
							min = 0.4,
							max = 0.7,
							step = 0.1,
							default = 0.4,
							tooltip = GenerateTooltip(
								"",
								"",
								"0.4",
								"0.4",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Radius
							name = "ASSAO Radius",
							variable = "assaoRadius",
							min = 0,
							max = 2,
							step = 0.05,
							default = 1.85,
							tooltip = GenerateTooltip(
								"",
								"",
								"1.85",
								"1.85",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Shadow Clamp
							name = "ASSAO Shadow Clamp",
							variable = "assaoShadowClamp",
							min = 0,
							max = 1,
							step = 0.02,
							default = 0.98,
							tooltip = GenerateTooltip(
								"",
								"",
								"0.98",
								"0.98",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Shadow Multiplier
							name = "ASSAO Shadow Multiplier",
							variable = "assaoShadowMult",
							min = 0,
							max = 3,
							step = 0.1,
							default = 1.1,
							tooltip = GenerateTooltip(
								"",
								"",
								"1.1",
								"1.1",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Shadow Power
							name = "ASSAO Shadow Power",
							variable = "assaoShadowPower",
							min = 0,
							max = 2,
							step = 0.02,
							default = 1.34,
							tooltip = GenerateTooltip(
								"",
								"",
								"1.34",
								"1.34",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Sharpness
							name = "ASSAO Sharpness",
							variable = "assaoSharpness",
							min = 0,
							max = 1,
							step = 0.02,
							default = 0.98,
							tooltip = GenerateTooltip(
								"",
								"",
								"0.98",
								"0.98",
								""
							),
							UseDecimals = true
						},
						{ -- ASSAO Shadow Strength
							name = "ASSAO Shadow Strength",
							variable = "assaoDetailShadowStrength",
							min = 0,
							max = 3,
							step = 1,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls the strength of shadow detail applied by ASSAO effects.",
								"Enabling this option enhances ASSAO shadow quality at the cost of performance.",
								"0",
								"0",
								"SSAO must be set to High or higher for this setting to have an effect."
							)
						}
					}

				-- Global Audio Settings 
					HyperframePlusAddon.globalAudioSettingsSliders = {
						{ -- DSP Buffer Size 
							name = "DSP Buffer Size",
							variable = "Sound_DSPBufferSize",
							min = 0,
							max = 536870912,
							step = 67108864,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls the size of the DSP buffer in bytes. Has no effect when DSP Effects is disabled.",
								"A higher value may improve performance but increase memory usage" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"0 MB",
								"0 MB",
								"In rare cases, a higher value can increase loading times on some systems."
							)
						},
						{ -- Cache Size 
							name = "Cache Size",
							variable = "Sound_MaxCacheSizeInBytes",
							min = 0,
							max = 536870912,
							step = 67108864,
							default = 134217728,
							tooltip = GenerateTooltip(
								"Controls the total size of the audio cache.",
								"A higher value may improve performance but increase memory usage" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"128 MB",
								"128 MB",
								"In rare cases, a higher value can increase loading times on some systems."
							)
						},
						{ -- Max Cacheable Size 
							name = "Max Cacheable Size",
							variable = "Sound_MaxCacheableSizeInBytes",
							min = 0,
							max = 4194288,
							step = 174762,
							default = 174762,
							tooltip = GenerateTooltip(
								"Controls the maximum size of an audio file that can be cached.",
								"A higher value may improve performance" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"0.17 MB",
								"0.17 MB"
							)
						},
						{ -- Sound Variation Cap 
							name = "Sound Variation Cap",
							variable = "SoundPerf_VariationCap",
							min = 1,
							max = 64,
							step = 1,
							default = 16,
							tooltip = GenerateTooltip(
								"Controls the number of sound kit variations played across the game.",
								"A lower value can improve performance and decrease memory usage.",
								"16",
								"32"
							)
						}					
					}

				-- Global Graphics Settings 
					HyperframePlusAddon.globalGraphicsSettingsSliders = {
						{ -- ASSAO Blur Pass Count 
							name = "ASSAO Blur Pass Count",
							variable = "assaoBlurPassCount",
							min = 0,
							max = 6,
							step = 1,
							default = 1,
							tooltip = GenerateTooltip(
								"Controls the number of blur passes applied to ASSAO effects.",
								"A lower setting may improve performance but may cause flickering during movement.",
								"1",
								"2"
							)
						},
						{ -- ASSAO Fade Out Distance
							name = "ASSAO Fade Out Distance",
							variable = "assaoFadeOutTo",
							min = 51,
							max = 1000,
							step = 1,
							default = 60,
							tooltip = GenerateTooltip(
								"Controls the distance at which ASSAO effects fade out.",
								"A lower setting may improve performance.",
								"60",
								"300",
								"A setting above 300 exceeds the maximum game defaults and is classified as an Uber Setting."
							)
						},
						{ -- Particle Mesh Texture Density
							name = "Particle Mesh Texture Density",
							variable = "particleMTDensity",
							min = 0,
							max = 100,
							step = 1,
							default = 70,
							tooltip = GenerateTooltip(
								"Controls the density of mesh-textured particle effects, such as inner flames, spell effects, and environmental overlays.",
								"A lower setting reduces or disable these effects, improving performance in CPU-heavy encounters by reducing particle processing load.",
								"70",
								"70",
								"Changing the Particle Density setting will re-apply this value."
							)
						}
					}

				-- Global Advanced Settings 
					HyperframePlusAddon.experimentalSettingsSliders = {
						{ -- Async Handler Timeout 
							name = "Async Handler Timeout",
							variable = "asyncHandlerTimeout",
							min = 0,
							max = 300,
							step = 5,
							default = 100,
							tooltip = GenerateTooltip(
								"Controls the timeout duration for asynchronous tasks or handlers.",
								"On faster systems, a lower setting may improve performance, while on slower systems, it could reduce performance or cause hitching" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"100 ms",
								"100 ms"
							)
						},
						{ -- Async Thread Sleep 
							name = "Async Thread Sleep",
							variable = "asyncThreadSleep",
							min = 0,
							max = 300,
							step = 5,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls the sleep duration for the asynchronous rendering thread while the game renders graphics.",
								"This setting can impact performance by allowing the rendering thread to briefly pause, reducing CPU/GPU load and supporting more consistent boost clock speeds" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"0 ms",
								"0 ms"
							)
						},
						{ -- Component Texture Cache Size 
							name = "Component Texture Cache Size",
							variable = "componentTexCacheSize",
							min = 32,
							max = 8192,
							step = 32,
							default = 32,
							tooltip = GenerateTooltip(
								"Controls the memory allocated for caching character component textures.",
								"Higher values use more RAM but can improve character loading speeds, reducing delays when characters appear. Lower values conserve memory but may result in slower loading times" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"32 MB",
								"32 MB",
								"In rare cases, a higher value can increase loading times on some systems."
							)
						},
						{ -- Frame Buffer 
							name = "Frame Buffer",
							variable = "GxMaxFrameLatency",
							min = 0,
							max = 6,
							step = 1,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls the maximum number of frames that can be buffered before they are displayed on the screen.",
								"Lower values can reduce input lag, while higher values result in smoother visuals" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"0 Frames",
								"3 Frames",
								"Changing the Triple Buffering setting will re-apply this value."
							)
						},
						--[[ { -- Process Affinity Mask
							name = "Process Affinity Mask",
							variable = "processAffinityMask",
							min = 0,
							max = 21845,
							step = 1,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls which CPU cores the game client can run on by specifying a CPU affinity mask.",
								"Limiting the game to physical cores can improve performance under CPU load by reducing contention with hyperthreaded cores" .. adn.dg .. " (restart required)" .. adn.g .. ".",
								"0",
								"0",
								"This setting only works if manually added to the config.wtf file. For more information, join our Discord server: Jnry6pVy73."
							)
						} ]]
					}

				-- View Distance Settings 
					HyperframePlusAddon.viewDistanceSettingsSliders = {
						{ -- Far Clip 
							name = "Far Clip",
							variable = "farClip",
							min = 1000,
							max = 19600,
							step = 50,
							default = 1250,
							tooltip = GenerateTooltip(
								"Controls the distance at which terrain and world map objects, like important buildings and structures, are rendered.",
								"A lower value may improve performance.",
								"1250",
								"1000"
							)
						},
						{ -- Horizon Start 
							name = "Horizon Start",
							variable = "horizonStart",
							min = 400,
							max = 5600,
							step = 50,
							default = 1200,
							tooltip = GenerateTooltip(
								"Sets the starting point of the horizon and controls the distance at which non-world map objects, like trees and rocks, are rendered.",
								"A lower value may improve performance.",
								"1200",
								"800"
							)
						}
					}

				-- Custom Preset 
					HyperframePlusAddon.customPresetSliders = {
						{ -- Far Clip 
							name = "Far Clip",
							variable = "Custom_farClip",
							min = 1000,
							max = 19600,
							step = 50,
							default = 1000,
							tooltip = GenerateTooltip(
								"Controls the distance at which terrain and world map objects, like important buildings and structures, are rendered.",
								"A lower value may improve performance.",
								"1000",
								"1000"
							)
						},
						{ -- Horizon Start
							name = "Horizon Start",
							variable = "Custom_horizonStart",
							min = 400,
							max = 5600,
							step = 50,
							default = 750,
							tooltip = GenerateTooltip(
								"Sets the starting point of the horizon and controls the distance at which non-world map objects, like trees and rocks, are rendered.",
								"A lower value may improve performance.",
								"750",
								"800"
							)
						},
						{ -- Ground Effect Density 
							name = "Ground Effect Density",
							variable = "Custom_groundEffectDensity",
							min = 16,
							max = 256,
							step = 16,
							default = 64,
							tooltip = GenerateTooltip(
								"Sets the density of ground effects.",
								"A lower value may improve performance.",
								"64"
							)
						},
						{ -- Ground Effect Distance 
							name = "Ground Effect Distance",
							variable = "Custom_groundEffectDist",
							min = 40,
							max = 320,
							step = 1,
							default = 160,
							tooltip = GenerateTooltip(
								"Sets the rendering distance for ground effects.",
								"A lower value may improve performance.",
								"160"
							)
						},
						{ -- Terrain LOD Distance 
							name = "Terrain LOD Distance",
							variable = "Custom_terrainLodDist",
							min = 128,
							max = 5248,
							step = 128,
							default = 384,
							tooltip = GenerateTooltip(
								"Controls the terrain level of detail.",
								"This setting indirectly influences all other Terrain LOD settings, resulting in varying performance.",
								"384"
							)
						},
						{ -- Terrain LOD Divisor 
							name = "Terrain LOD Divisor",
							variable = "Custom_TerrainLodDiv",
							min = 128,
							max = 5248,
							step = 128,
							default = 128,
							tooltip = GenerateTooltip(
								"Controls the terrain level of detail.",
								"This setting indirectly influences all other Terrain LOD object settings, resulting in varying performance.",
								"128"
							)
						},
						{ -- LOD Object Cull Distance 
							name = "LOD Object Cull Distance",
							variable = "Custom_lodObjectCullDist",
							min = 1,
							max = 200,
							step = 1,
							default = 25,
							tooltip = GenerateTooltip(
								"Sets the distance at which objects begin to be culled.",
								"This setting indirectly influences all other LOD object settings, resulting in varying performance.",
								"25",
								nil,
								"This setting can cause some game objects to not be visible until you're close to them. This can impact gameplay, as distant objects may not appear in time."
							)
						},
						{ -- LOD Object Cull Size 
							name = "LOD Object Cull Size",
							variable = "Custom_lodObjectCullSize",
							min = 1,
							max = 100,
							step = 1,
							default = 38,
							tooltip = GenerateTooltip(
								"Sets the size at which objects are culled.",
								"This setting indirectly influences all other LOD object settings, resulting in varying performance.",
								"38",
								nil,
								"This setting can cause some game objects to not be visible until you're close to them. This can impact gameplay, as distant objects may not appear in time."
							)
						},
						{ -- LOD Object Fade Scale 
							name = "LOD Object Fade Scale",
							variable = "Custom_lodObjectFadeScale",
							min = 50,
							max = 150,
							step = 2,
							default = 82,
							tooltip = GenerateTooltip(
								"Sets the fade distance scaling for objects.",
								"This setting indirectly influences all other LOD object settings, resulting in varying performance.",
								"82",
								nil,
								"This setting can cause some game objects to not be visible until you're close to them. This can impact gameplay, as distant objects may not appear in time."
							)
						},
						{ -- LOD Object Minimum Size 
							name = "LOD Object Minimum Size",
							variable = "Custom_lodObjectMinSize",
							min = 0,
							max = 200,
							step = 2,
							default = 20,
							tooltip = GenerateTooltip(
								"Sets the minimum size of objects to apply level of detail.",
								"This setting indirectly influences all other LOD object settings, resulting in varying performance.",
								"20",
								nil,
								"This setting can cause some game objects to not be visible until you're close to them. This can impact gameplay, as distant objects may not appear in time."
							)
						},
						{ -- WMO LOD Distance 
							name = "WMO LOD Distance",
							variable = "Custom_wmoLodDist",
							min = 200,
							max = 1000,
							step = 50,
							default = 350,
							tooltip = GenerateTooltip(
								"Sets the level of detail distance for world map objects.",
								"A lower value may improve performance.",
								"350"
							)
						},
						{ -- Doodad LOD Scale 
							name = "Doodad LOD Scale",
							variable = "Custom_doodadLodScale",
							min = 50,
							max = 200,
							step = 25,
							default = 75,
							tooltip = GenerateTooltip(
								"Sets the level of detail for doodads.",
								"A lower value may improve performance.",
								"75"
							)
						},
						{ -- Entity LOD Distance 
							name = "Entity LOD Distance",
							variable = "Custom_entityLodDist",
							min = 10,
							max = 200,
							step = 2,
							default = 10,
							tooltip = GenerateTooltip(
								"Sets the distance at which entities use levels of detail.",
								"A lower value may improve performance.",
								"10"
							)
						},
						{ -- Entity Shadow Fade Scale 
							name = "Entity Shadow Fade Scale",
							variable = "Custom_entityShadowFadeScale",
							min = 10,
							max = 100,
							step = 2,
							default = 10,
							tooltip = GenerateTooltip(
								"Sets the rendering distance for entity shadows.",
								"A lower value may improve performance.",
								"10"
							)
						},
						{ -- Max Light Distance 
							name = "Max Light Distance",
							variable = "Custom_maxLightDist",
							min = 8,
							max = 1024,
							step = 8,
							default = 48,
							tooltip = GenerateTooltip(
								"Sets the distance at which light sources are rendered.",
								"A lower value may improve performance.",
								"48"
							)
						}
					}

				-- Graphics Settings 
					HyperframePlusAddon.graphicsSettingsSliders = {
						{ -- Violence Level 
							name = "Violence Level",
							variable = "violenceLevel",
							min = 0,
							max = 5,
							step = 1,
							default = 0,
							tooltip = GenerateTooltip(
								"Controls the intensity of in-game blood, gore, and other violent effects.",
								"A lower value may improve performance.",
								"Varies",
								"2"
							)
						},
						{ -- Weather Density 
							name = "Weather Density",
							variable = "weatherDensity",
							min = 0,
							max = 3,
							step = 1,
							default = 1,
							tooltip = GenerateTooltip(
								"Controls the intensity of in-game weather effects, including ash, rain, snow, and fog. Compute Effects and Particle Density must be enabled to display these effects.",
								"A lower value may improve performance.",
								"Varies",
								"2",
								"Changing the Particle Density setting will re-apply this value for the current preset."
							)
						}					
					}

			-- Dropdown Definitions And Options

				-- Graphics Preset Table
					HyperframePlusAddon.graphicsPresetsDropdowns = {
						{ -- Arena 
							name = "Arena",
							variable = "Arena",
							defaultValue = 5,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in an Arena.",
								nil,
								"Very High"
							)
						},
						{ -- Battleground 
							name = "Battleground",
							variable = "Battleground",
							defaultValue = 4,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Battleground.",
								nil,
								"High"
							)
						},
						{ -- Epic Battleground 
							name = "Epic Battleground",
							variable = "EpicBattleground",
							defaultValue = 3,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in an Epic Battleground.",
								nil,
								"Good"
							)
						},
						{ -- City 
							name = "City",
							variable = "City",
							defaultValue = 8,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a City.",
								nil,
								"Custom"
							)
						},
						{ -- Delve 
							name = "Delve",
							variable = "Delve",
							defaultValue = 5,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Delve.",
								nil,
								"Very High"
							),
							retailOnly = true
						},
						{ -- Dungeon 
							name = "Dungeon",
							variable = "Dungeon",
							defaultValue = 5,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Dungeon.",
								nil,
								"Very High"
							)
						},
						{ -- Large Raid 
							name = "Large Raid",
							variable = "LargeRaid",
							defaultValue = 3,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Raid with greater than 15 players.",
								nil,
								"Good"
							)
						},
						{ -- Small Raid 
							name = "Small Raid",
							variable = "SmallRaid",
							defaultValue = 4,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Raid with 15 or fewer players.",
								nil,
								"High"
							)
						},
						{ -- Scenario 
							name = "Scenario",
							variable = "Scenario",
							defaultValue = 5,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in a Scenario.",
								nil,
								"Very High"
							)
						},
						{ -- World 
							name = "World",
							variable = "World",
							defaultValue = 6,
							tooltip = GenerateTooltip(
								"Applies the chosen graphics preset while in the World.",
								nil,
								"Ultra"
							)
						}					
					}

				-- Global Graphics Settings
					HyperframePlusAddon.globalSettingsDropdowns = {
						{ -- Shadow Texture Size 
							name = "Shadow Texture Size",
							variable = "shadowTextureSize",
							defaultValue = 2,
							tooltip = GenerateTooltip(
								"Controls the texture resolution for rendered shadows.",
								"Lower values can improve performance but may decrease video memory usage on dedicated GPUs and system memory on integrated GPUs.",
								"1024 MB",
								"1024 MB",
								"Changing the Shadow Quality setting will re-apply this value."
							)
						},
						{ -- World Base Mipmap Level 
							name = "World Base Mipmap Level", 
							variable = "worldBaseMip", 
							defaultValue = 3,
							tooltip = GenerateTooltip(
								"Controls the mipmap level of world textures, affecting how sharp or blurry they appear.",
								"Enabling this option can improve performance by reducing GPU and memory usage.",
								"High",
								"High",
								"Changing the Texture Resolution setting will re-apply this value."
							)
						}
					}

				-- Global Audio Settings
					HyperframePlusAddon.globalAudioSettingsDropdowns = {
						{ -- Sample Rate 
							name = "Sample Rate",
							variable = "Sound_OutputSampleRate",
							defaultValue = 4,
							tooltip = GenerateTooltip(
								"These options apply the sample rate for audio playback.",
								"A lower value may improve performance" .. adn.dg .. " (restart required)",
								"22050 Hz",
								"44100 Hz",
								"There is no benefit if set higher than your speaker's supported frequency."
							)
						}					
					}

				-- Sample Rate Options
					HyperframePlusAddon.sampleRateOptions = {
						8000,
						11025,
						16000,
						22050,
						32000,
						44100,
						48000,
						96000,
						192000
					}

				-- Shadow Texture Size Options
					HyperframePlusAddon.shadowTextureSizeOptions = {
						512,
						1024,
						2048
					}

				-- World Base Mipmap Level Options
					HyperframePlusAddon.worldBaseMipOptions = {
						"Low",
						"Fair",
						"High"
					}

			-- Presets 

				-- Low Settings (1) 
					HyperframePlusAddon.lowSettings = {
						groundEffectDist = 70,
						groundEffectFade = 70,
						groundEffectDensity = 16,
						terrainLodDist = 128,
						TerrainLodDiv = 128,
						lodObjectMinSize = 5,
						lodObjectCullSize = 95,
						lodObjectCullDist = 5,
						entityLodDist = 1,
						entityLodOffset = 1,
						maxLightDist = 1,
						wmoLodDist = 200,
						lodObjectFadeScale = 50,
						entityShadowFadeScale = 1,
						doodadLodScale = 1,
					}

				-- Fair Settings (2) 
					HyperframePlusAddon.fairSettings = {
						groundEffectDist = 110,
						groundEffectFade = 110,
						groundEffectDensity = 48,
						terrainLodDist = 256,
						TerrainLodDiv = 128,
						lodObjectMinSize = 5,
						lodObjectCullSize = 72,
						lodObjectCullDist = 13,
						entityLodDist = 5,
						entityLodOffset = 5,
						maxLightDist = 9,
						wmoLodDist = 200,
						lodObjectFadeScale = 50,
						entityShadowFadeScale = 10,
						doodadLodScale = 65,
					}

				-- Good Settings (3) 
					HyperframePlusAddon.goodSettings = {
						groundEffectDist = 185,
						groundEffectFade = 185,
						groundEffectDensity = 80,
						terrainLodDist = 384,
						TerrainLodDiv = 256,
						lodObjectMinSize = 10,
						lodObjectCullSize = 32,
						lodObjectCullDist = 15,
						entityLodDist = 6,
						entityLodOffset = 6,
						maxLightDist = 50,
						wmoLodDist = 200,
						lodObjectFadeScale = 50,
						entityShadowFadeScale = 12,
						doodadLodScale = 80,
					}

				-- High Settings (4) 
					HyperframePlusAddon.highSettings = {
						groundEffectDist = 260,
						groundEffectFade = 260,
						groundEffectDensity = 128,
						terrainLodDist = 512,
						TerrainLodDiv = 384,
						lodObjectMinSize = 15,
						lodObjectCullSize = 24,
						lodObjectCullDist = 20,
						entityLodDist = 7,
						entityLodOffset = 7,
						maxLightDist = 72,
						wmoLodDist = 250,
						lodObjectFadeScale = 72,
						entityShadowFadeScale = 14,
						doodadLodScale = 95,
					}

				-- Very High Settings (5) 
					HyperframePlusAddon.veryHighSettings = {
						groundEffectDist = 290,
						groundEffectFade = 290,
						groundEffectDensity = 144,
						terrainLodDist = 640,
						TerrainLodDiv = 512,
						lodObjectMinSize = 20,
						lodObjectCullSize = 16,
						lodObjectCullDist = 23,
						entityLodDist = 8,
						entityLodOffset = 8,
						maxLightDist = 113,
						wmoLodDist = 275,
						lodObjectFadeScale = 72,
						entityShadowFadeScale = 14,
						doodadLodScale = 110,
					}

				-- Ultra Settings (6) 
					HyperframePlusAddon.ultraSettings = {
						groundEffectDist = 320,
						groundEffectFade = 320,
						groundEffectDensity = 160,
						terrainLodDist = 768,
						TerrainLodDiv = 640,
						lodObjectMinSize = 20,
						lodObjectCullSize = 14,
						lodObjectCullDist = 25,
						entityLodDist = 9,
						entityLodOffset = 9,
						maxLightDist = 131,
						wmoLodDist = 300,
						lodObjectFadeScale = 75,
						entityShadowFadeScale = 16,
						doodadLodScale = 125,
					}

				-- Ultra High Settings (7) 
					HyperframePlusAddon.ultraHighSettings = {
						groundEffectDist = 320,
						groundEffectFade = 320,
						groundEffectDensity = 172,
						terrainLodDist = 896,
						TerrainLodDiv = 768,
						lodObjectMinSize = 26,
						lodObjectCullSize = 12,
						lodObjectCullDist = 30,
						entityLodDist = 10,
						entityLodOffset = 10,
						maxLightDist = 157,
						wmoLodDist = 350,
						lodObjectFadeScale = 100,
						entityShadowFadeScale = 18,
						doodadLodScale = 140,
					}

			-- Preset Definitions 
				HyperframePlusAddon.PresetNames = {
					adn.r .. "Low",			-- 1
					adn.r .. "Fair",		-- 2
					"Good",					-- 3
					"High",					-- 4
					"Very High",			-- 5
					"Ultra",				-- 6
					"Ultra High",			-- 7
					"Custom"				-- 8
				}

			-- CVars To Reset 
				HyperframePlusAddon.cvarsToReset = {

					-- Defaults
					"ThreadPoolLimitHP",
					"ThreadPoolLimitMP",
					"ThreadPoolLimitLP",
					"vrsParticles",
					"spellClutter",
					"dynamicLod",
					"dynamicRenderScale",
					"maxLightCount",
					"clubFinderCacheExpiry",
					"clubFinderCachePendingExpiry",
					"wmoLodDistScale",
					"lodObjectSizeScale",
					"UnitNameFriendlySpecialNPCName",
					"CMAA2Quality",
					"forceClusteredShading",
					"hotReloadModels",
					"vrsValarAlwaysOn",
					"shadowCull",

					-- In Use
					"UseOldVolumeFog",
					"particleMTDensity",
					"clusteredShading",
					"gxMTAlphaM2",
					"graphicsTextureResolution",
					"gxMTOutlines",
					"gxMTVolFog",
					"Sound_OutputSampleRate",
					"Sound_DSPBufferSize",
					"Sound_MaxCacheableSizeInBytes",
					"Sound_MaxCacheSizeInBytes",
					"Sound_EnableDSPEffects",
					"FootstepSounds",
					"farclip",
					"nameplateMaxDistance",
					"asyncHandlerTimeout",
					"groundEffectFade",
					"asyncThreadSleep",
					"SplineOpt",
					"graphicsViewDistance",
					"graphicsEnvironmentDetail",
					"graphicsGroundClutter",
					"assaoShadowPower",
					"HorizonStart",
					"groundEffectDist",
					"groundEffectDensity",
					"terrainLodDist",
					"TerrainLodDiv",
					"lodObjectMinSize",
					"lodObjectCullSize",
					"lodObjectCullDist",
					"lodObjectFadeScale",
					"entityLodDist",
					"weatherDensity",
					"ffxNether",
					"sceneOcclusionEnable",
					"worldBaseMip",
					"doodadLodScale",
					"animFrameSkipLOD",
					"maxLightDist",
					"wmoLodDist",
					"graphicsSpellDensity",
					"ResampleQuality",
					"showfootprintparticles",
					"MaxObservedPetBattles",
					"worldPreloadNonCriticalTimeout",
					"assaoRadius",
					"GxMaxFrameLatency",
					"entityShadowFadeScale",
					"useTargetFPS",
					"ReplaceMyPlayerPortrait",
					"ReplaceOtherPlayerPortraits",
					"floatingCombatTextCombatDamage",
					"floatingCombatTextCombatHealing",
					"buffDurations",
					"componentTexCacheSize",
					"componentTexLoadLimit",
					"predictedHealth",
					"RAIDSettingsEnabled",
					"assaoBlurPassCount",
					"assaoHorizonAngleThresh",
					"assaoShadowMult",
					"unitClutterPlayerThreshold",
					"worldPreloadHighResTextures",
					"preloadLoadingDistObject",
					"preloadLoadingDistTerrain",
					"unitsLookAtPlayers",
					"specular",
					"showDispelDebuffs",
					"gxMTMisc",
					"SortDiskReads",
					"pathSmoothing",
					"preloadPlayerModels",
					"showLoadingScreenTips",
					"ResampleSharpness",
					"GxAllowCachelessShaderMode",
					"ResampleAlwaysSharpen",
					"maxFPSLoading",
					"SkyCloudLOD",
					"gxMTDecals",
					"ffxGlow",
					"Sound_EnableErrorSpeech",
					"wmodoodadDist",
					"violenceLevel",
					"minimapTrackingShowAll",
					"GxSlowShaderWarnThreshold",
					"componentTextureLevel",
					"worldViewCullMaxJobs",
					"locateViewerMaxJobs",
					"worldIntersectMaxJobs",
					"MaxCharacterComponentLoadStartsPerFrame",
					"bodyQuota",
					"graphicsComputeEffects",
					"graphicsDepthEffects",
					"graphicsLiquidDetail",
					"graphicsParticleDensity",
					"graphicsSSAO",
					"graphicsoutlineMode",
					"graphicsProjectedTextures",
					"textureFilteringMode",
					"shadowRt",
					"vrsValar",
					"physicsLevel",
					"graphicsShadowQuality",
					"ImpactModelCollisionMelee",
					"ImpactModelCollisionMissile",
					"ImpactModelCollisionRanged",
					"preloadStreamingDistObject",
					"preloadStreamingDistTerrain",
					"shadowSoft",
					"shadowTextureSize",
					"groundEffectAnimation",
					"ffxAntiAliasingMode",
					"MSAAQuality",
					"ffxDeath",
					"occlusionMaxJobs",
					"graphicsSunshafts",
					"componentEmissive",
					"componentSpecular",
					"teleportMaxNoLoadDist",
					"smoothUnitPhasing",
					"unitClutterInstancesOnly",
					"entityLodOffset",
					"unitClutter",
					"instantQuestText",
					"terrainMipLevel",
					"Sound_EnableArmorFoleySoundForOthers",
					"Sound_EnableArmorFoleySoundForSelf",
					"enableQuestCacheLogging",
					"UnitNamePlayerGuild",
					"UnitNamePlayerPVPTitle",
					"UseSlug",
					"shadowBlendCascades",
					"assaoFadeOutTo",
					"assaoShadowClamp",
					"assaoSharpness",
					"ssaoMagicNormals",
					"SoundPerf_VariationCap",
					"gxMTOpaqueM2",
					"vrsValarUseAsyncCompute",
				}

			-- Content Settings To Reset 
				HyperframePlusAddon.contentSettingsToReset = {
					"violenceLevel",
					"weatherDensity",
					"nameplateMaxDistance",
					"unitsLookAtPlayers",
					"pathSmoothing",
					"ImpactModelCollisionRanged",
					"ImpactModelCollisionMissile",
					"ImpactModelCollisionMelee",
					"componentTextureLevel",
					"animFrameSkipLOD",
					"SkyCloudLOD",
					"ffxGlow",
					"specular",
					"ReplaceOtherPlayerPortraits",
					"ReplaceMyPlayerPortrait",
					"floatingCombatTextCombatHealing",
					"floatingCombatTextCombatDamage",
					"showDispelDebuffs",
					"buffDurations",
					"entityShadowFadeScale",
					"wmoLodDist",
					"maxLightDist",
					"entityLodDist",
					"lodObjectCullDist",
					"lodObjectCullSize",
					"lodObjectMinSize",
					"TerrainLodDiv",
					"terrainLodDist",
					"groundEffectDist",
					"groundEffectDensity",
					"lodObjectFadeScale",
					"groundEffectFade",
					"entityLodOffset",
					"doodadLodScale",
					"UnitNamePlayerGuild",
					"UnitNamePlayerPVPTitle",
					"farclip",
					"horizonStart",
				}

			-- Global Settings 
				HyperframePlusAddon.globalSettings = {

					-- In Use
					--assaoHorizonAngleThresh = 0.3,
					--assaoRadius = 1.45,
					--assaoShadowMult = 0.9,
					--assaoShadowPower = 1.04,
					bodyQuota = 82,
					componentTexLoadLimit = 16,						-- Restore to Default if Login Optimizations are enabled
					GxSlowShaderWarnThreshold = 30000,				-- Default
					maxFPSLoading = 10,								-- Default, causes longer loading times when Vertical Sync is enabled on lower-end systems.
					MaxCharacterComponentLoadStartsPerFrame = 4,	-- Restore to Default if Login Optimizations are enabled
					MaxObservedPetBattles = 1,
					minimapTrackingShowAll = 1,
					preloadLoadingDistObject = 256,
					preloadLoadingDistTerrain = 512,
					ResampleAlwaysSharpen = 1,
					showLoadingScreenTips = 0,
					Sound_EnableErrorSpeech = 0,
					wmoDoodadDist = 1500,
					worldIntersectMaxJobs = 32,						-- Default
					worldViewCullMaxJobs = 32,						-- Default
					locateViewerMaxJobs = 32,						-- Default
					worldPreloadHighResTextures = 0,
					worldPreloadNonCritical = 0,
					worldPreloadNonCriticalTimeout = 45,			-- Default
					preloadPlayerModels = 0,
					preloadStreamingDistObject = 32,
					preloadStreamingDistTerrain = 128,
					occlusionMaxJobs = 3,
					componentSpecular = 0,
					smoothUnitPhasing = 0,
					unitClutterInstancesOnly = 0,
					unitClutterPlayerThreshold = 5,
					unitClutter = 1,
					instantQuestText = 1,
					enableQuestCacheLogging = 0,
					Sound_EnableArmorFoleySoundForOthers = 0,
					Sound_EnableArmorFoleySoundForSelf = 0,
					showfootprintparticles = 0,
					shadowBlendCascades = 0,
					--assaoShadowClamp = 0.78,
					--assaoSharpness = 0.78,
					ssaoMagicNormals = 0,
					vrsValarUseAsyncCompute = 1,
					teleportMaxNoLoadDist = 400,
					terrainMipLevel = 1
				}

			-- Logout Settings 
				HyperframePlusAddon.optimizedLogoutSettings = {
					componentTexLoadLimit = 32,
					componentTextureLevel = 1,
					entityLodDist = 1,
					entityLodOffset = 1,
					entityShadowFadeScale = 1,
					farclip = 1000,
					groundEffectDensity = 16,
					groundEffectDist = 40,
					groundEffectFade = 40,
					horizonStart = 400,
					lodObjectCullDist = 1,
					lodObjectCullSize = 100,
					lodObjectFadeScale = 50,
					lodObjectMinSize = 0,
					maxLightDist = 1,
					MaxCharacterComponentLoadStartsPerFrame = 8,
					terrainLodDist = 128,
					TerrainLodDiv = 128,
					wmoLodDist = 1,
					doodadLodScale = 1,
					wmoDoodadDist = 1000,
					preloadLoadingDistObject = 256,
					preloadLoadingDistTerrain = 512,
					preloadStreamingDistObject = 32,
					preloadStreamingDistTerrain = 128,
					worldPreloadNonCritical = 0,
				}

			-- Logout Without Content Presets Settings 
				HyperframePlusAddon.optimizedLogoutNoContentPresetsSettings = {
					componentTexLoadLimit = 32,
					componentTextureLevel = 1,
					MaxCharacterComponentLoadStartsPerFrame = 8,
					preloadLoadingDistObject = 256,
					preloadLoadingDistTerrain = 512,
					preloadStreamingDistObject = 64,
					preloadStreamingDistTerrain = 256,
					wmoDoodadDist = 1000,
				}

			-- Managed Settings 
				HyperframePlusAddon.managedGraphicsSettings = {
					graphicsComputeEffects = 1,
					graphicsDepthEffects = 0,
					graphicsLiquidDetail = 1,
					graphicsOutlineMode = 1,
					graphicsParticleDensity = 3,
					graphicsTextureResolution = 1,
					graphicsSpellDensity = 4,
					graphicsProjectedTextures = 1,
					graphicsSSAO = 1,
					graphicsSunshafts = 0,
					graphicsShadowQuality = 4,
					physicsLevel = 0,
					ResampleQuality = 3,
					shadowRt = 0,
					textureFilteringMode = 2,
					useTargetFPS = 1,
					MSAAQuality = 0,
					ffxAntiAliasingMode = 2,
					vrsValar = 1,
				}

			-- Combat Restricted CVars
				HyperframePlusAddon.combatRestricted = {
					nameplateMaxDistance = true,
					UnitNamePlayerGuild = true,
					UnitNamePlayerPVPTitle = true
				}
			
			-- Slash Commands 
				HyperframePlusAddon.SlashCommands = {
					Command1 = "/hf",
					Command2 = "/hyperframe"
				}

			-- Blacklist Map IDs
				HyperframePlusAddon.mapIDs = {
					[2369] = true
				}

		-- Variables --
		--------------- 

			-- Combat
				HyperframePlusAddon.combat = UnitAffectingCombat("player")

			-- Last Content Type 
				HyperframePlusAddon.lastAppliedContentType = nil

			-- Player Role 
				HyperframePlusAddon.role = nil

			-- Timers

				-- Event Delay
					HyperframePlusAddon.timerEventDelay = 3

				-- Global Settings At Login
					HyperframePlusAddon.timerGlobalSettingsLogin = 10

				-- Determine Preset At Login
					HyperframePlusAddon.timerDeterminePresetLogin = 11

				-- Determine Preset Delays
					HyperframePlusAddon.timerDeterminePresetDelay = 1.5

				-- Settings Applied After login
					HyperframePlusAddon.timerSettingsAppliedLogin = 19

			-- Zone Change Trackers 
				
				-- Debounce Interval 
					HyperframePlusAddon.debounceInterval = 1.5

				-- Timer 
					HyperframePlusAddon.zoneChangeTimer = nil

	-- Widgets --
	------------- 

		-- Frames --
		------------ 

			-- On Event 
				HyperframePlusAddon.HFP_ONEVENT = CreateFrame("Frame")