local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Settings")

-- Tuitorial
local function ForceDefaultSettings()
	SetCVar("scriptErrors", 1)     --0是屏蔽错误1是不屏蔽错误
	SetCVar("autoLootDefault", 1)
	SetCVar("alwaysCompareItems", 1)
	SetCVar("lootUnderMouse", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("synchronizeSettings", 1)
  SetCVar("synchronizeMacros", 1)
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowSelf", 0)
	SetCVar("nameplateShowAll", 1)
	SetCVar("nameplateMotion", 1)
	SetCVar("ShowClassColorInNameplate", 1)
	SetCVar("nameplateShowFriendlyNPCs", 0)
	SetCVar("screenshotQuality", 10)
	SetCVar("showTutorials", 0)
	SetCVar("alwaysShowActionBars", 1)
	SetCVar("lockActionBars", 1)
	SetActionBarToggles(1, 1, 1, 1)
	SetCVar("enableFloatingCombatText", 1)
	SetCVar("floatingCombatTextCombatDamage", 0)
	SetCVar("floatingCombatTextCombatHealing", 0)
	SetCVar("floatingCombatTextCombatDamageDirectionalScale", 1)
	SetCVar("floatingCombatTextFloatMode", 3)
	 --寵物對目標傷害 
   SetCVar("floatingCombatTextPetMeleeDamage", 0) 
   SetCVar("floatingCombatTextPetSpellDamage", 0) 
   --目標盾提示 
   SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0) 
   --自身得盾/護甲提示 
   SetCVar("floatingCombatTextCombatHealingAbsorbSelf", 0) 
   --閃招 
   SetCVar("floatingCombatTextDodgeParryMiss", 0) 
   --傷害減免   
   SetCVar("floatingCombatTextDamageReduction", 0) 
   --周期性傷害 
   SetCVar("floatingCombatTextCombatLogPeriodicSpells", 0) 
   --法術警示 
   SetCVar("floatingCombatTextReactives", 0) 
   --他人的糾纏效果(例如 誘補(xxxx-xxxx)) 
   SetCVar("floatingCombatTextSpellMechanics", 0) 
   --聲望變化 
   SetCVar("floatingCombatTextRepChanges", 1) 
   --友方治療者名稱 
   SetCVar("floatingCombatTextFriendlyHealers", 1) 
   --進入/離開戰鬥文字提示 
   SetCVar("floatingCombatTextCombatState", 1) 
   --低MP/低HP文字提示 
   SetCVar("floatingCombatTextLowManaHealth", 1)   
   --連擊點 
   SetCVar("floatingCombatTextComboPoints", 0) 
   --能量獲得 
   SetCVar("floatingCombatTextEnergyGains", 0) 
   --周期性能量   
   SetCVar("floatingCombatTextPeriodicEnergyGains", 0) 
   --榮譽擊殺 
   SetCVar("floatingCombatTextHonorGains", 0) 
   --光環 
   SetCVar("floatingCombatTextAuras", 0)
	SetCVar("doNotFlashLowHealthWarning", 1)
	SetCVar("ffxGlow", 0)
	SetCVar("autoQuestWatch", 1)
	SetCVar("overrideArchive", 0)
	SetCVar("WorldTextScale", 1.5)
	SetCVar("enableMouseSpeed", 0);
	--	SetCVar("mouseSpeed", 5); -- Maximum in-game: 1.4
	--	SetCVar("cameraPitchMoveSpeed", 135);
	SetCVar("cameraYawMoveSpeed", 360); -- Maximum in-game: 270
end
local function ForceRaidFrame()
	if not CompactUnitFrameProfiles.selectedProfile then return end
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "useClassColors", true)
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "displayPowerBar", true)
	SetRaidProfileOption(CompactUnitFrameProfiles.selectedProfile, "displayBorder", false)
	CompactUnitFrameProfiles_ApplyCurrentSettings()
	CompactUnitFrameProfiles_UpdateCurrentPanel()
end

local function ForceUIScale()
	Advanced_UseUIScale:Hide()
	Advanced_UIScaleSlider:Hide()
	SetCVar("useUiScale", 1)
	local scale = MaoRUISettingDB["Settings"]["SetScale"]
	if MaoRUISettingDB["Settings"]["LockUIScale"] then
		if GetCurrentResolution() ~= 0 then
			scale = .8*768/string.match(({GetScreenResolutions()})[GetCurrentResolution()], "%d+x(%d+)")
		end
		if scale < .5 then scale = .5 end
		MaoRUISettingDB["Settings"]["SetScale"] = scale
	end

	if scale < .65 then UIParent:SetScale(scale)
	else SetCVar("uiScale", scale)
	end

	-- Restore from Auto-scaling
	local function RestoreUIScale(scale)
		UIParent:SetScale(scale)
		if MaoRUISettingDB["Chat"]["Lock"] then
				ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -2, 21)
		end
	end

	MaoRUI:EventFrame("UI_SCALE_CHANGED"):SetScript("OnEvent", function()
		if scale < .65 then RestoreUIScale(scale) end

		C_Timer.After(1, function()
			if scale < .65 and UIParent:GetScale() ~= scale then
				RestoreUIScale(scale)
			end
		end)
	end)
end

local function ForceChatSettings()
	FCF_SetLocked(ChatFrame1, nil)
	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -2, 21)
	ChatFrame1:SetWidth(360)
	ChatFrame1:SetHeight(121)
  ChatFrame1:SetUserPlaced(true)
	for i = 1, 10 do
		local cf = _G["ChatFrame"..i]
		FCF_SetWindowAlpha(cf, 0)
		ChatFrame_RemoveMessageGroup(cf,"CHANNEL")
	end
	local channels = {"SAY","EMOTE","YELL","GUILD","OFFICER","GUILD_ACHIEVEMENT","ACHIEVEMENT",
	"WHISPER","PARTY","PARTY_LEADER","RAID","RAID_LEADER","RAID_WARNING","INSTANCE_CHAT",
	"INSTANCE_CHAT_LEADER","CHANNEL1","CHANNEL2","CHANNEL3","CHANNEL4","CHANNEL5","CHANNEL6","CHANNEL7",
	}	
	for i, v in ipairs(channels) do
		ToggleChatColorNamesByClassGroup(true, v)
	end
	FCF_SavePositionAndDimensions(ChatFrame1)
	FCF_SetLocked(ChatFrame1, true)
	MaoRUISettingDB["Chat"]["Lock"] = true
end

StaticPopupDialogs["RELOAD_NDUI"] = {
	text = "需要重载插件让设置生效",
	button1 = APPLY,
	button2 = CLASS_TRIAL_THANKS_DIALOG_CLOSE_BUTTON,
	OnAccept = function()
		ReloadUI()
	end,
}

-- DBM bars	
local function ForceDBMOptions()
	if not IsAddOnLoaded("DBM-Core") then return end
	if DBT_AllPersistentOptions then table.wipe(DBT_AllPersistentOptions) end
	DBT_AllPersistentOptions = {
		["Default"] = {
			["DBM"] = {
				["Scale"] = 0.9,
				["HugeScale"] = 1.2,
				["ExpandUpwards"] = true,
				["ExpandUpwardsLarge"] = true,
				["BarXOffset"] = 0,
				["BarYOffset"] = 1,
				["TimerPoint"] = "BOTTOMLEFT",
				["TimerX"] = 100,
				["TimerY"] = 210,
				["Width"] = 200,
				["Heigh"] = 14,
				["HugeWidth"] = 280,
				["HugeBarXOffset"] = 0,
				["HugeBarYOffset"] = 3,
				["HugeTimerPoint"] = "CENTER",
				["HugeTimerX"] = -12,
				["HugeTimerY"] = -143,
				["FontSize"] = 15,
				["StartColorR"] = 1,
				["StartColorG"] = .7,
				["StartColorB"] = 0,
				["EndColorR"] = 1,
				["EndColorG"] = 0,
				["EndColorB"] = 0,
				["Texture"] = I.normTex,
			},
		},
	}

	if not DBM_AllSavedOptions["Default"] then DBM_AllSavedOptions["Default"] = {} end
	DBM_AllSavedOptions["Default"]["ChosenVoicePack"] = "Yike"
	DBM_AllSavedOptions["Default"]["RangeFrameRadarPoint"] = "RIGHT"
	DBM_AllSavedOptions["Default"]["RangeFrameRadarX"] = -90
	DBM_AllSavedOptions["Default"]["RangeFrameRadarY"] = -180
	DBM_AllSavedOptions["Default"]["InfoFrameX"] = 300
	DBM_AllSavedOptions["Default"]["InfoFrameY"] = 210
	DBM_AllSavedOptions["Default"]["HPFramePoint"] = "RIGHT"
	DBM_AllSavedOptions["Default"]["HPFrameX"] = -160
	DBM_AllSavedOptions["Default"]["WarningY"] = 260
	DBM_AllSavedOptions["Default"]["WarningX"] = 0
	DBM_AllSavedOptions["Default"]["WarningFontStyle"] = "OUTLINE"
	DBM_AllSavedOptions["Default"]["SpecialWarningPoint"] = "TOP"
	DBM_AllSavedOptions["Default"]["SpecialWarningFontCol"] = {1.0, 0.3, 0.0}
	DBM_AllSavedOptions["Default"]["SpecialWarningX"] = 0
	DBM_AllSavedOptions["Default"]["SpecialWarningY"] = -195
	DBM_AllSavedOptions["Default"]["SpecialWarningFontStyle"] = "OUTLINE"
	DBM_AllSavedOptions["Default"]["HideObjectivesFrame"] = false
	DBM_AllSavedOptions["Default"]["WarningFontSize"] = 20
	DBM_AllSavedOptions["Default"]["SpecialWarningFontSize2"] = 36

	MaoRUISettingDB["Settings"]["DBMRequest"] = false
end
-- Skada
local function ForceSkadaOptions()
	if not IsAddOnLoaded("Skada") then return end
	if SkadaDB then table.wipe(SkadaDB) end
	SkadaDB = {
		["hasUpgraded"] = true,
		["profiles"] = {
			["Default"] = {
				["windows"] = {
					{
						["barheight"] = 18,
						["classicons"] = false,
						["barslocked"] = true,
						["y"] = 24,
						["x"] = -5,
						["title"] = {
							["color"] = {
								["a"] = 0.3,
								["b"] = 0,
								["g"] = 0,
								["r"] = 0,
							},
							["font"] = "",
							["borderthickness"] = 0,
							["fontflags"] = "OUTLINE",
							["fontsize"] = 14,
							["texture"] = "normTex",
						},
						["barfontflags"] = "OUTLINE",
						["point"] = "BOTTOMRIGHT",
						["mode"] = "",
						["barwidth"] = 300,
						["barbgcolor"] = {
							["a"] = 0,
							["b"] = 0,
							["g"] = 0,
							["r"] = 0,
						},
						["barfontsize"] = 15,
						["background"] = {
							["height"] = 180,
							["texture"] = "None",
							["bordercolor"] = {
								["a"] = 0,
							},
						},
						["bartexture"] = "normTex",
					}, -- [1]
				},
				["tooltiprows"] = 10,
				["setstokeep"] = 30,
				["tooltippos"] = "topleft",
				["reset"] = {
					["instance"] = 3,
					["join"] = 1,
				},
			},
		},
	}
	MaoRUISettingDB["Settings"]["SkadaRequest"] = false
end

-- BigWigs
local function ForceBigwigs()
	if not IsAddOnLoaded("BigWigs") then return end
	if BigWigs3DB then table.wipe(BigWigs3DB) end
	BigWigs3DB = {
		["namespaces"] = {
			["BigWigs_Plugins_Bars"] = {
				["profiles"] = {
					["Default"] = {
						["outline"] = "OUTLINE",
						["fontSize"] = 12,
						["BigWigsAnchor_y"] = 336,
						["BigWigsAnchor_x"] = 20,
						["BigWigsAnchor_width"] = 175,
						["growup"] = true, 
						["interceptMouse"] = false,
						["barStyle"] = "NDui",
						["LeftButton"] = {
							["emphasize"] = false,
						},
						["font"] = I.Font[1],
						["onlyInterceptOnKeypress"] = true,
						["emphasizeScale"] = 1,
						["BigWigsEmphasizeAnchor_x"] = 836,
						["BigWigsEmphasizeAnchor_y"] = 350,
						["BigWigsEmphasizeAnchor_width"] = 220,
						["emphasizeGrowup"] = true,
					},
				},
			},
			["BigWigs_Plugins_Super Emphasize"] = {
				["profiles"] = {
					["Default"] = {
						["fontSize"] = 28,
						["font"] = I.Font[1],
					},
				},
			},
			["BigWigs_Plugins_Messages"] = {
				["profiles"] = {
					["Default"] = {
						["fontSize"] = 18,
						["font"] = I.Font[1],
						["BWEmphasizeCountdownMessageAnchor_x"] = 665,
						["BWMessageAnchor_x"] = 616,
						["BWEmphasizeCountdownMessageAnchor_y"] = 530,
						["BWMessageAnchor_y"] = 305,
					},
				},
			},
			["BigWigs_Plugins_Proximity"] = {
				["profiles"] = {
					["Default"] = {
						["fontSize"] = 18,
						["font"] = I.Font[1],
						["posy"] = 346,
						["width"] = 140,
						["posx"] = 1024,
						["height"] = 120,
					},
				},
			},
			["BigWigs_Plugins_Alt Power"] = {
				["profiles"] = {
					["Default"] = {
						["posx"] = 1002,
						["fontSize"] = 14,
						["font"] = I.Font[1],
						["fontOutline"] = "OUTLINE",
						["posy"] = 490,
					},
				},
			},
		},
		["profiles"] = {
			["Default"] = {
				["fakeDBMVersion"] = true,
			},
		},
	}
	MaoRUISettingDB["Settings"]["BWRequest"] = false
end

local function ForceAddonSkins()
	if MaoRUISettingDB["Settings"]["DBMRequest"] then ForceDBMOptions() end
	if MaoRUISettingDB["Settings"]["SkadaRequest"] then ForceSkadaOptions() end
	if MaoRUISettingDB["Settings"]["BWRequest"] then ForceBigwigs() end
end
-----------------------------------------
function sendCmd(cmd) ChatFrame1EditBox:SetText(""); ChatFrame1EditBox:Insert(cmd); ChatEdit_SendText(ChatFrame1EditBox); end
print(Welcome_loginChatText1) print(Welcome_loginChatText2) print(Welcome_loginChatText3) print(Welcome_loginChatText4)
function module:OnLogin()

	ForceUIScale()
	ForceAddonSkins()
	if MaoRUISettingDB["Chat"]["Lock"] then ForceChatSettings() end

	if tonumber(GetCVar("cameraDistanceMaxZoomFactor")) ~= 2.6 then
		SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	end
end