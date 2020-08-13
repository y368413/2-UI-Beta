ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates	= TTD2.Templates

TTD2.Frames = TTD2.Frames or {}
local Frames = TTD2.Frames

--[[
this frame displays options setup by Tools.SavedVariables
]]

local super = Templates.AddonFrame
Frames.Options = super:new()
local this = Frames.Options

function this:Create()

	self.FrameName				= "TTD2_Options"
	self.FrameParent			= Frames.Main.Frame
	self.FrameTitleText			= "Options"
	self.AddonFrameResetPosX	= 305
	
	super.Create(self)
	
	--increase the frame level to make sure this frame covers all children of main
	self.Frame:SetFrameLevel(10)

	self.ScrollFrame = TTD2.Templates.ScrollableContentFrame:new()
	self.ScrollFrame.SpacingTop = 30
	self.ScrollFrame.ButtonSpacing = 0
	self.ScrollFrame.ButtonDefaultHeight = 30
	self:CreateChild(self.ScrollFrame)
	
	local PrintCompleted = TTD2.Templates.UICheckButton:new()
	PrintCompleted.CheckButtonSavedDataSetting = "PrintCompleted"
	PrintCompleted.CheckButtonLabel = "Include "..TTD2.Tools.Chat:Green("completed")
	PrintCompleted.FrameTooltipText = "Print entries that have been completed permanently.\n\n"..TTD2.Tools.Chat:Red("WARNING;").." This option will clutter your output. It is intended for informed confirmation, not for general use."
	self.ScrollFrame:AddButtonToContentFrame(PrintCompleted)
	
	local PrintDone = TTD2.Templates.UICheckButton:new()
	PrintDone.CheckButtonSavedDataSetting = "PrintDone"
	PrintDone.CheckButtonLabel = "Include "..TTD2.Tools.Chat:Red("done")
	PrintDone.FrameTooltipText = "Print entries that are not part of achievements/collections or have already been attempted and you now have lockout ID for them.\n\nAlso used if a required WQ is not up.\n\n"..TTD2.Tools.Chat:Red("WARNING;").." This option will clutter your output. It is intended for informed confirmation, not for general use."
	self.ScrollFrame:AddButtonToContentFrame(PrintDone)
	
	local PrintRare = TTD2.Templates.UICheckButton:new()
	PrintRare.CheckButtonSavedDataSetting = "RareSources"
	PrintRare.CheckButtonLabel = "Include "..TTD2.Tools.Chat:Purple("rare")
	PrintRare.FrameTooltipText = "Rare sources are not usually available and may require extensive time camping/searching them."
	self.ScrollFrame:AddButtonToContentFrame(PrintRare)
	
	local HideMinimapButton = TTD2.Templates.UICheckButton:new()
	HideMinimapButton.CheckButtonSavedDataSetting = "HideMinimapButton"
	HideMinimapButton.CheckButtonLabel = "Hide Minimap-Button"
	HideMinimapButton.FrameTooltipText = "Get rid of the Minimap-Button."
	HideMinimapButton.ButtonScriptFunction = TTD2.Frames.MinimapButton.Update
	HideMinimapButton.ButtonScriptObject = TTD2.Frames.MinimapButton
	self.ScrollFrame:AddButtonToContentFrame(HideMinimapButton)
	
	local VerboseTomTom = TTD2.Templates.UICheckButton:new()
	VerboseTomTom.CheckButtonSavedDataSetting = "VerboseTomTom"
	VerboseTomTom.CheckButtonLabel = "Verbose TomTom"
	VerboseTomTom.FrameTooltipText = "Print more verbose TomTom messages/links that will tell you exactly which continent/zone your target is in.\n\n"..TTD2.Tools.Chat:Red("WARNING;").." This option will clutter your output. Only use it if you actually need more information on target continents/zones."
	self.ScrollFrame:AddButtonToContentFrame(VerboseTomTom)
	
	local SecureButtons = TTD2.Templates.UICheckButton:new()
	SecureButtons.CheckButtonSavedDataSetting = "AllowSecureButtons"
	SecureButtons.CheckButtonLabel = "Allow SecureActionButtons"
	SecureButtons.FrameTooltipText = "Some modules may use SecureActionButtons to use items or cast spells. Since actions like that could be considered too intrusive, you have the option to disable them. These buttons are disabled in combat.\n\nModules employing a SecureActionButton:\n"..TTD2.Tools.Chat:Green(TTD2.Modules.ArchaeologyCrateButton.Name)
	self.ScrollFrame:AddButtonToContentFrame(SecureButtons)
	
	local TrackWarmode = TTD2.Templates.UICheckButton:new()
	TrackWarmode.CheckButtonSavedDataSetting = "TrackWarmode"
	TrackWarmode.CheckButtonLabel = "Track Warmode"
	TrackWarmode.FrameTooltipText = "Include modules that require warmode."
	self.ScrollFrame:AddButtonToContentFrame(TrackWarmode)
	
	--spacing
	self.ScrollFrame:AddButtonToContentFrame()
	
	local ParagonEmissary = TTD2.Templates.UICheckButton:new()
	ParagonEmissary.CheckButtonSavedDataSetting = "ParagonEmissary"
	ParagonEmissary.CheckButtonLabel = "Paragon Emissary"
	ParagonEmissary.FrameTooltipText = "Only list missing Paragon-Rewards if the associated Emissary is active. Disable this option if you always want to see all missing Paragon-Rewards."
	self.ScrollFrame:AddButtonToContentFrame(ParagonEmissary)
	
	local CharacterAchievements = TTD2.Templates.UICheckButton:new()
	CharacterAchievements.CheckButtonSavedDataSetting = "CharacterAchievements"
	CharacterAchievements.CheckButtonLabel = "Character Achievements"
	CharacterAchievements.FrameTooltipText = "Consider achievements incomplete until the current character has earned them."
	self.ScrollFrame:AddButtonToContentFrame(CharacterAchievements)
	
	local AchievementCompletionist = TTD2.Templates.SlaveUICheckButton:new()
	AchievementCompletionist.CheckButtonSavedDataSetting = "AchievementCompletionist"
	AchievementCompletionist.CheckButtonLabel = "Achievement Completionist"
	AchievementCompletionist.FrameTooltipText = "Consider achievements incomplete until "..TTD2.Tools.Chat:Green("all").." criteria are completed, even if the achievement only requires x out of y criteria to complete."
	AchievementCompletionist.MasterUICheckButton = CharacterAchievements
	self.ScrollFrame:AddButtonToContentFrame(AchievementCompletionist)
	
	
	local XMogCompletionist = TTD2.Templates.UICheckButton:new()
	XMogCompletionist.CheckButtonSavedDataSetting = "XMogCompletionist"
	XMogCompletionist.CheckButtonLabel = "XMog Completionist"
	XMogCompletionist.FrameTooltipText = "Show XMog-Items as missing even after you have earned the appearance from another item.\n\n"..TTD2.Tools.Chat:Red("WARNING;").." If you don't know and/or don't care about the difference between an appearance and a specific item you should "..TTD2.Tools.Chat:Red("not").." use this option."
	self.ScrollFrame:AddButtonToContentFrame(XMogCompletionist)
	
	local PetCompletionist = TTD2.Templates.UICheckButton:new()
	PetCompletionist.CheckButtonSavedDataSetting = "PetCompletionist"
	PetCompletionist.CheckButtonLabel = "Pet Completionist"
	PetCompletionist.FrameTooltipText = "Consider pets as incomplete until you own the maximum amount of them (usually 3/3)."
	self.ScrollFrame:AddButtonToContentFrame(PetCompletionist)
	
	local GoldenCages = TTD2.Templates.UICheckButton:new()
	GoldenCages.CheckButtonSavedDataSetting = "GoldenCages"
	GoldenCages.CheckButtonLabel = "Golden Cages"
	GoldenCages.FrameTooltipText = "Always consider cageable pets as incomplete."
	self.ScrollFrame:AddButtonToContentFrame(GoldenCages)
	
	local MPlusFeatHunter = TTD2.Templates.UICheckButton:new()
	MPlusFeatHunter.CheckButtonSavedDataSetting = "MPlusFeatHunter"
	MPlusFeatHunter.CheckButtonLabel = "M+ Feat-Hunter"
	MPlusFeatHunter.FrameTooltipText = "Include M+ Feats as tracked Achievements in the Keystone-Module."
	self.ScrollFrame:AddButtonToContentFrame(MPlusFeatHunter)
	
	local MPlusAccount = TTD2.Templates.UICheckButton:new()
	MPlusAccount.CheckButtonSavedDataSetting = "MPlusAccount"
	MPlusAccount.CheckButtonLabel = "M+ Account Data"
	MPlusAccount.FrameTooltipText = "Keep track of Keystones and completed M+ dungeons for other characters on this account as well."
	MPlusAccount.ButtonScriptFunction			= TTD2.Tools.EventDispatcher.CheckModules
	MPlusAccount.ButtonScriptObject				= TTD2.Tools.EventDispatcher
	MPlusAccount.CheckButtonToggleOnFunction	= TTD2.Tools.Keystone.UpdateAccountPlayerData
	MPlusAccount.CheckButtonToggleOnObject		= TTD2.Tools.Keystone
	MPlusAccount.CheckButtonToggleOffFunction	= TTD2.Tools.Keystone.RemoveAccountPlayerData
	MPlusAccount.CheckButtonToggleOffObject		= TTD2.Tools.Keystone
	self.ScrollFrame:AddButtonToContentFrame(MPlusAccount)
	
	local MPlusAccountAlwaysShowStones = TTD2.Templates.SlaveUICheckButton:new()
	MPlusAccountAlwaysShowStones.CheckButtonSavedDataSetting = "MPlusAccountAlwaysShowStones"
	MPlusAccountAlwaysShowStones.CheckButtonLabel = "Show all Keystones"
	MPlusAccountAlwaysShowStones.FrameTooltipText = "The default status of the Keystone-Link is the same as the Dungeon-Completion for any individual character. This option forces \"TODO\"-status for Keystone-Links which may help you to better keep track of them but also makes it a little harder to see which characters you still have to play for the week."
	MPlusAccountAlwaysShowStones.MasterUICheckButton = MPlusAccount
	self.ScrollFrame:AddButtonToContentFrame(MPlusAccountAlwaysShowStones)
	
	local ResourcefulBonusRoll = TTD2.Templates.UICheckButton:new()
	ResourcefulBonusRoll.CheckButtonSavedDataSetting = "ResourcefulBonusRoll"
	ResourcefulBonusRoll.CheckButtonLabel = "Resourceful Bonus-Roll"
	ResourcefulBonusRoll.FrameTooltipText = "You will only be told to trade more rolls if you can do so for War-Resources and currently have at least double the amount necessary.\n\nMeans: You will only be told to trade the first roll if you have at least "..TTD2.Tools.Chat:Green("500 War-Resources").." and need "..TTD2.Tools.Chat:Green("1000 War-Resources").." to be noted about the second."
	self.ScrollFrame:AddButtonToContentFrame(ResourcefulBonusRoll)
	
	local HorrificWaste = TTD2.Templates.UICheckButton:new()
	HorrificWaste.CheckButtonSavedDataSetting = "HorrificWaste"
	HorrificWaste.CheckButtonLabel = "Horrific Waste"
	HorrificWaste.FrameTooltipText = "Consider all item rewards from"..TTD2.Tools.Chat:Purple(" Horrific Visions")..TTD2.Tools.Chat:Red(" done").." as soon as any single item reward was collected for the week.\n\nMay be useful if all you care about is the"..TTD2.Tools.Chat:Orange(" Malefic Core").."."
	self.ScrollFrame:AddButtonToContentFrame(HorrificWaste)
	
	local DemandingVisions = TTD2.Templates.SlaveUICheckButton:new()
	DemandingVisions.CheckButtonSavedDataSetting = "DemandingVisions"
	DemandingVisions.CheckButtonLabel = "Demanding Visions"
	DemandingVisions.FrameTooltipText = "Only check if the"..TTD2.Tools.Chat:Green(" ilvl470 (= 5 masks)").." reward has been collected this week."
	DemandingVisions.MasterUICheckButton = HorrificWaste
	self.ScrollFrame:AddButtonToContentFrame(DemandingVisions)
	
	--spacing
	self.ScrollFrame:AddButtonToContentFrame()
	
	local ArchaeologyAutoWaypoint = TTD2.Templates.UICheckButton:new()
	ArchaeologyAutoWaypoint.CheckButtonSavedDataSetting = "ArchaeologyAutoWaypoint"
	ArchaeologyAutoWaypoint.CheckButtonLabel = "Automatic Digsite-Waypoint"
	ArchaeologyAutoWaypoint.FrameTooltipText = TTD2.Tools.Chat:Green("Archaeology:").."\nAutomatically create a TomTom-Waypoint to the next digsite on your current continent whenever you complete a digsite.\n\n"..TTD2.Tools.Chat:Green("Toggling this option on will also immediately add a waypoint.")
	ArchaeologyAutoWaypoint.ButtonScriptFunction		= TTD2.Tools.EventDispatcher.CheckModules
	ArchaeologyAutoWaypoint.ButtonScriptObject			= TTD2.Tools.EventDispatcher
	ArchaeologyAutoWaypoint.CheckButtonToggleOnFunction	= TTD2.Modules.ArchaeologyAutoWaypoint.AddWaypointToClosestDigsite
	ArchaeologyAutoWaypoint.CheckButtonToggleOnObject	= TTD2.Modules.ArchaeologyAutoWaypoint
	self.ScrollFrame:AddButtonToContentFrame(ArchaeologyAutoWaypoint)
	
	local HorrificVisionTracker = TTD2.Templates.UICheckButton:new()
	HorrificVisionTracker.CheckButtonSavedDataSetting = "HorrificVisionTracker"
	HorrificVisionTracker.CheckButtonLabel = "Horrific Vision Tracker"
	HorrificVisionTracker.FrameTooltipText = TTD2.Tools.Chat:Green("Horrific Visions:").."\nShow a small tracking frame inside of Horrific Visions. The tooltip of the frame will tell you exactly how many chests/crystals you and/or your party have collected. Will automatically add TomTom-Waypoints to chests partymembers open.\n\n"..TTD2.Tools.Chat:Green("Toggling this option on will reset the tracking frame inside visions.")
	HorrificVisionTracker.ButtonScriptFunction		= TTD2.Tools.EventDispatcher.CheckModules
	HorrificVisionTracker.ButtonScriptObject		= TTD2.Tools.EventDispatcher
	--HorrificVisionTracker.CheckButtonToggleOnFunction	= TTD2.Modules.ArchaeologyAutoWaypoint.AddWaypointToClosestDigsite
	--HorrificVisionTracker.CheckButtonToggleOnObject	= TTD2.Modules.ArchaeologyAutoWaypoint
	self.ScrollFrame:AddButtonToContentFrame(HorrificVisionTracker)

end
