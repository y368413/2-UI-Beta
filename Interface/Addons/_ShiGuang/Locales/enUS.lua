local _, _, U, _ = unpack(select(2, ...))
--if GetLocale() ~= "enUS" then return end
FACTION_BAR_COLORS = {
	[1] = { r= .54, g= 0,   b= 0   }, -- hated
	[2] = { r= 1,   g= .10, b= .1  }, -- hostile
	[3] = { r= 1,   g= .55, b= 0   }, -- unfriendly
	[4] = { r= .87, g= .87, b= .87 }, -- neutral
	[5] = { r= 1,   g= 1,   b= 0   }, -- friendly
	[6] = { r= .1,  g= .9,  b= .1  }, -- honored
	[7] = { r= .25, g= .41, b= .88 }, -- revered
	[8] = { r= .6,  g= .2,  b= .8  }, -- exalted
	[9] = { r= .4,  g= 0,   b= .6  }, -- past exalted
};
GOLD_AMOUNT = "|c00ffd700%d●|r"--GOLD_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0\124t"
SILVER_AMOUNT = "|c00c7c7cf%d●|r"--SILVER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0\124t"
COPPER_AMOUNT = "|c00eda55f%d●|r"--COPPER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0\124t"
ENTERING_COMBAT = ""
LEAVING_COMBAT = ""
  --密语  
  CHAT_WHISPER_INFORM_GET = "<<<%s:"
  CHAT_WHISPER_GET = ">>>%s:"
  CHAT_BN_WHISPER_INFORM_GET = "<<<%s:"
  CHAT_BN_WHISPER_GET = ">>>%s:"
    --说 / 喊
  CHAT_SAY_GET = "%s: "
  CHAT_YELL_GET = "%s: "  
    --flags
  CHAT_FLAG_AFK = "[AFK] "
  CHAT_FLAG_DND = "[Busy] "
  CHAT_FLAG_GM = "[GM] "
----------------madebyhidden----------------------
ITEM_CREATED_BY="|cFF00DDFF<Thanks For Using MaoR UI>|r"
  --CHAT_GUILD_GET = "|Hchannel:GUILD|hG|h %s "
  --CHAT_OFFICER_GET = "|Hchannel:OFFICER|hO|h %s "
  --CHAT_RAID_GET = "|Hchannel:RAID|hR|h %s "
  --CHAT_RAID_WARNING_GET = "RW %s "
  --CHAT_RAID_LEADER_GET = "|Hchannel:RAID|hRL|h %s "
  --CHAT_PARTY_GET = "|Hchannel:PARTY|hP|h %s "
  --CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|hPL|h %s "
  --CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|hPG|h %s "
  --CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|hI.|h %s: "
  --CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|hIL.|h %s: "

--- 改變頻道提示 [加入頻道→+][離開頻道→-][改變頻道→=]
CHAT_YOU_CHANGED_NOTICE = "=|Hchannel:%d|h[%s]|h";
CHAT_YOU_CHANGED_NOTICE_BN = "=|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE = "+|Hchannel:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE_BN = "+|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE = "-|Hchannel:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE_BN = "-|Hchannel:CHANNEL:%d|h[%s]|h";

Welcome_loginChatText1 = "<<<-------------- 有你们的魔兽，才是世界 ----";
Welcome_loginChatText2 = "|cFFBF00FFMao|r|cFF00DDFFR|r|cffff8800 UI|r|cff3399ff By Shiguang + TuTu v.170521|r";
Welcome_loginChatText3 = "|cff02F78E大大大的感谢|r|cffC495DDSiweia|r|cff02F78E大大,向他学到了好多.|r";
Welcome_loginChatText4 = "------  v2.2.1 For 7.2  ------------------->>>";
Welcome_SmallText1 = "[ 微美化界面 ]";
Welcome_SmallText2 = "[ 全职业适用无障碍 ]";
Welcome_SmallText3 = "[ 开袋即食 轻优化 无需设置 ]";
Welcome_SmallText4 = "[ 插件每月21日UI官网 准时更新发布 ]";
Welcome_Large1 = "[ V 2.2.1 ]";
Welcome_Large2 = "[ Hi Legion 7.2 ]";
Welcome_Large3 = "[ 右键小地图便捷设置 ]";
Welcome_Large4 = "[ 系统自带功能，插件有针对性删减 ]";
Welcome_Large5 = "更多内容详见官网· · ·";

DANWEI_WAN = "%.1fW";
DANWEI_YI = "%.1fY";

Announcer_Sap = ">>>Sapped<<<";
Announcer_RocketPP = "Rocket Fuel Leak!!!Help me~";
Announcer_Purgatory = "Shroud of Purgatory, Heal ~~~~";
Announcer_Interrupted = "Interrupted→";
Announcer_Disperse = "Disperse→";
Announcer_Stole = "Stole→";
Announcer_SpellIDnof = "<Spelllink(ID) not found>";

STRENGTH = "Strength";
AGILITY = "Agility";
STAMINA = "Stamina";
VERSATILITY = "Versatility";
MULTISTRIKE = "Multistrike";
BONUSARMOR = "BonusArmor";
ARMOR = "Armor";
HASTE = "Haste";
MASTERY = "Mastery";
CRIT = "Crit";
INTELLECT = "Intellect";
SPIRIT = "Spirit";	
REPAIR_COST = "repair："

Chatbar_ChatMiniMizeButtonText = "-";
Chatbar_rollText = "R";
Chatbar_StatReport = "M";
Chatbar_ChannelYell = "Y";
Chatbar_ChannelSay = "S";
Chatbar_ChannelParty = "P";
Chatbar_ChannelRaidWarns = "W";
Chatbar_ChannelRaid = "R";
Chatbar_ChannelBattleGround = "I";
Chatbar_ChannelGuild = "G";
Chatbar_EmoteCallButtonText = "E";

ChatFilter_You = "You";
ChatFilter_Space = ", ";
ChatFilter_Channel = "Channel";
ChatFilter_QuestReport = "Quest progress%s?:";
ChatFilter_Achievement = "[%s] have earned the achievement %s!";
ChatFilter_LearnSpell = "You have learned: %s";
ChatFilter_UnlearnSpell = "You have unlearned: %s";
ChatFilter_FriendlistFull = "Your friend list is full, remove 2 for this addon to function properly!";

InboxMailBag_Advanced = "Advanced";
InboxMailBag_ADVANCED_MODE_DESC = "Enable Advanced mode. Displaying more information about your mailbox, and allowing stacks of gold to be retrieved as well.";
InboxMailBag_ADVANCED_MODE_DISABLED = "|cff00ff96InboxMailbag: Advanced mode|r disabled";
InboxMailBag_ADVANCED_MODE_ENABLED = "|cff00ff96InboxMailbag: Advanced mode|r enabled";
InboxMailBag_BAGNAME = "Bag";
InboxMailBag_DELETED = "%s from %s |cff20FF20 Deleted in %d |4Day:Days;|r";
InboxMailBag_DELETED_1 = "%s from %s |cffFF2020 Deleted in %s|r";
InboxMailBag_DELETED_7 = "%s from %s |cffFF6020 Deleted in %d |4Day:Days;|r";
InboxMailBag_FRAMENAME = "Inbox Mailbag";
InboxMailBag_Group_Stacks = "Group Stacks";
InboxMailBag_MAIL_DEFAULT = "Default to Mailbag";
InboxMailBag_MAIL_DEFAULT_DESC = "Enabling this will cause the Mailbox to initially open to Inbox Mailbag instead of the normal %s";
InboxMailBag_MAIL_DEFAULT_DISABLED = "|cff00ff96InboxMailbag: Mailbox will default to|r %s";
InboxMailBag_MAIL_DEFAULT_ENABLED = "|cff00ff96InboxMailbag: Mailbox will default to|r Inbox Mailbag";
InboxMailBag_QUALITY_COLOR_MODE_DESC = "Enable the display of item quality via the item's border.";
InboxMailBag_Quality_Colors = "Quality Colors";
InboxMailBag_QUALITY_COLORS_MODE_DISABLED = "|cff00ff96InboxMailbag: Quality Colors|r disabled";
InboxMailBag_QUALITY_COLORS_MODE_ENABLED = "|cff00ff96InboxMailbag: Quality Colors|r enabled";
InboxMailBag_RETURNED = "%s from %s |cff20FF20 Returned in %d |4Day:Days;|r";
InboxMailBag_RETURNED_1 = "%s from %s |cffFF2020 Returned in %s|r";
InboxMailBag_RETURNED_7 = "%s from %s |cffFFA020 Returned in %d |4Day:Days;|r";
InboxMailBag_TOTAL = "Total messages: %d";
InboxMailBag_TOTAL_MORE = "Total messages: %d (%d)";

DEX_FontList = {
	"Fonts\\ARIALN.TTF",
	"Fonts\\FRIZQT__.ttf",
	"Fonts\\skurri.ttf",
};
DEX_TXT_CRUSH = "Crush!"
DEX_TXT_DISPELLED = "Dispel! "
DEX_TXT_STOLEN = "Steal! "
DEX_TXT_REFLECT = " Reflect! "
DEX_TXT_CRIT = "Crit! ";
DEX_TXT_INTERUPT = "Interrupt! ";
DEX_MAIN_OPTION = "DamageEx";
DEX_BUTTON_RESET_TIP = "Restore defaults";
DEX_PREVIEW_LABEL = "Drag me to *change* text position";
DEXColorMode_T = "Color mode"
DEXOptionsDropDown = {"Monochrome","Double","Gradient"};
DEXOptionsFrameCheckButtons = {
	["DEX_Enable"] = { title = "Enable", tooltipText = "Enable damage displaying"},
	["DEX_ShowWithMess"] = { title = "As combat log", tooltipText = "Display damage texts as combat log"},
	["DEX_ShowSpellName"] = { title = "Spell names", tooltipText = "Display spell names next to damage texts"},
	["DEX_ShowNameOnCrit"] = { title = "Crits only", tooltipText = "Display spell names only for critical hits"},
	["DEX_ShowNameOnMiss"] = { title = "Missed only", tooltipText = "Display spell names only for missed hits"},
	["DEX_ShowInterruptCrit"] = { title = "Interrupts as crits", tooltipText = "Display interrupts in the crits way"},
	["DEX_ShowCurrentOnly"] = { title = "Target only", tooltipText = "Only display damage texts for current target"},
	["DEX_ShowDamagePeriodic"] = { title = "DOT", tooltipText = "Display DOT"},
	["DEX_ShowDamageShield"] = { title = "Reflect", tooltipText = "Display reflected damages"},
	["DEX_ShowDamageHealth"] = { title = "Healing", tooltipText = "Display healing texts"},
	["DEX_ShowDamagePet"] = { title = "Pet", tooltipText = "Display damages from your pets"},
	["DEX_ShowBlockNumber"] = { title = "Blocked", tooltipText = "Display blocked/resisted damages"},
	["DEX_ShowDamageWoW"] = { title = "Enable system combat texts", tooltipText = "Enable system default floating combat texts"},
	["DEX_ShowOwnHealth"] = { title = "Self healing", tooltipText = "Display healings apply to yourself"},
	["DEX_UniteSpell"] = { title = "Combine damages", tooltipText = "Combine simutaneous damages against same target"},
	["DEX_NumberFormat"] = { title = "Display digit separator", tooltipText = "Display the number of sub digital separation"},	
	["DEX_NumberFormat"] = { title = "W/Y", tooltipText = "Shot number style"},
	["DEX_ShowSpellIcon"] = { title = "Show Spell Icon", tooltipText = "Display Spell Icon,Choosen to replace the spell name"},
	["DEX_ShowInterrupt"] = { title = "Show Interrupt", tooltipText = "Display Interrupt texts"},	
	["DEX_ShowOverHeal"] = { title = "Show Overheal", tooltipText = "Display Overhealing apply to all target"},		
};
DEXOptionsFrameSliders = {
	["DEX_Font"] = {  title = "Font ", minText="Font1", maxText="Font3", tooltipText = "Reset font"},
	["DEX_FontSize"] = {  title = "Font size ", minText="Small", maxText="Large", tooltipText = "Config font size"},
	["DEX_OutLine"] = {  title = "Font outline ", minText="None", maxText="Thick", tooltipText = "Config font outline"},
	["DEX_Speed"] = {  title = "Text floating speed ", minText="Slow", maxText="Fast", tooltipText = "Config text floating speed"},
	["DEX_LOGLINE"] = {  title = "Max lines ", minText="5", maxText="20", tooltipText = "Config max text lines"},
	["DEX_LOGTIME"] = {  title = "Fade duration (sec) ", minText="5", maxText="60", tooltipText = "Config line fade duration"},
};
DEXOptionsColorPickerEx = {
	["DEX_ColorNormal"] = { title = "Physical color"},
	["DEX_ColorSkill"] = { title = "Spell color"},
	["DEX_ColorPeriodic"] = { title = "DOT color"},
	["DEX_ColorHealth"] = { title = "Healing color"},
	["DEX_ColorPet"] = { title = "Pet color"},
	["DEX_ColorSpec"] = { title = "Interrupt/dispel color"},
	["DEX_ColorMana"] = { title = "Mana burn color"},
};

IEQUIP_OPEN = "Open";
IEQUIP_QUICKSTRIP = "Quick Strip";
IEQUIP_GEARSET = "gearset";
IEQUIP_STRIPSET = "Strip Set";
IEQUIP_STRIP = "Strip";
IEQUIP_WEARSET = "Wear Set";
IEQUIP_CHANGED = "Changed";
IEQUIP_NOTASET = "Not a set";
IEQUIP_MANAGER = "Manager";
IEQUIP_SYMBOL = "0";

GRIDCLICKSETS_MENUNAME = "Click Set";
GRIDCLICKSETS_MENUTIP = "Sets the clicking actions for every unit button.";
GRIDCLICKSETS_TITLE = "Click Sets";
GRIDCLICKSETS_LOCKWARNING = "Can't set attributes during combat, settings will be applied later.";
GRIDCLICKSETS_SET = "Click Sets has been applied.";
GRIDCLICKSETS_SET_WHEEL_UP = "W.Up";
GRIDCLICKSETS_SET_WHEEL_DOWN = "Down";
GRIDCLICKSETS_SET_RESET_WARNING = "All clickset for current specialization will lost!";

xMerchant_Tobrowseitemtooltipstoo = "To browse item tooltips, too";

	QN_Title    = "|cff0080ff[Quest]|rQuestNotifier Options";
	QN_Switch   = "Notifier On/Off";
	QN_InstanceMode = "Instance Mode";
	QN_RaidMode = "Raid Mode";
	QN_PartyMode= "Party Mode";
	QN_SoloMode = "Sole Mode";
	QN_Sound    = "Play Sound on Completed";
	QN_Debug    = "|CFF00FF00Print Color QuestInfo|r|CFF00FFFF(inactive when in a Party or Raid)|r";
	QN_NoDetail = "|CFF00FFFFDon't Notify Detail|r";
	QN_CompleteX = "|CFF00F000Auto Remove Completed Quest from quest watch frame|r";
	QN_Quest       = "Quest";
	QN_Progress    = "Progress";
	QN_Complete    = "Completed!";
	QN_Accept      = "AcceptQuest";
		
		--Titles
	EnhancedChatFilter_MainFilter = "Main Filter"
	EnhancedChatFilter_MinimapIcon = "Minimap Button"
--Minimap Tooltips
	EnhancedChatFilter_ClickToOpenConfig = "Click To Open Config"
--Common in tab
	EnhancedChatFilter_ClearUp = "ClearUp"
	EnhancedChatFilter_DoYouWantToClear = "Do you want to clear %s?"
--General
	EnhancedChatFilter_General = "General"
	EnhancedChatFilter_DND = "DND"
	EnhancedChatFilter_DNDfilterTooltip = "Filter all DND players and their auto reply"
	EnhancedChatFilter_Achievement = "Achievement"
	EnhancedChatFilter_AchievementFilterTooltip = "Filter achievement spam"
	EnhancedChatFilter_RaidAlert = "RaidAlert"
	EnhancedChatFilter_RaidAlertFilterTooltip = "Filter raid alert from other players"
	EnhancedChatFilter_QuestReport = "QuestReport"
	EnhancedChatFilter_QuestReportFilterTooltip = "Filter many kind of grouping messages"
	EnhancedChatFilter_SpecSpell = "SpecSpell"
	EnhancedChatFilter_SpecSpellFilterTooltip = "Filter spell/talent learning messages if player is at max level"
	EnhancedChatFilter_MonsterSay = "MonsterSay"
	EnhancedChatFilter_MonsterSayFilterTooltip = "Use a repeat filter to reduce monster say msg in chat. This will not filter monster yell msg while it cast spells, but may filter quest msg in some case."
	EnhancedChatFilter_RepeatOptions = "Repeat Options"
	EnhancedChatFilter_chatLinesLimit = "Repeat message cache lines"
	EnhancedChatFilter_chatLinesLimitTooltips = "Repeat message lines. Please change it to suit your message amount. Increase it will consume more memory. Set 0 to disable Repeat Filter. Default 20."
	EnhancedChatFilter_MultiLines = "MultiLines"
	EnhancedChatFilter_MultiLinesTooltip = "Filtered msg that is sent from the same person and in less than 1 sec. This may reduce chat spam but also remove report from addons."
	EnhancedChatFilter_AlsoFilterGroup = "Also FilterGroup"
	EnhancedChatFilter_AlsoFilterGroupTooltips = "Filter will also work on group and raid. This may filter some useful messages."
	EnhancedChatFilter_EnableAdvancedConfig = "Enable Advanced Config"
	EnhancedChatFilter_AdvancedWarningText = "Please do NOT change any options that you don't understand, or you may mess ECF up. If you DO know the risk, you may continue..."
	EnhancedChatFilter_WhisperWhitelistMode = "Whisper Whitelist Mode"
	EnhancedChatFilter_WhisperWhitelistModeTooltip = "Filter all whisper unless it's from guild/group/raid/friends or you have just whisper them|n|cffE2252DUse with care!"
	EnhancedChatFilter_Aggressive = "Aggressive Filters"
	EnhancedChatFilter_AggressiveTooltip = "Some aggressive but effective Filters. Disable by default."
--BlackwordList
	EnhancedChatFilter_BlackwordList = "BlackWordList"
	EnhancedChatFilter_AddBlackWordTitle = "Add Blackword"
	EnhancedChatFilter_IncludeAutofilteredWord = "%s includes symbels to be filtered. It will be ignored."
	EnhancedChatFilter_Regex = "Regex"
	EnhancedChatFilter_RegexTooltip = "Blackword that will be added should be a regex expression. Only works for this blackword."
	EnhancedChatFilter_LesserBlackWord = "LesserBlackWord"
	EnhancedChatFilter_LesserBlackWordTooltip = "Blackword that will be added should be a lesser blackword. Only works for this blackword.|nA message will be filtered when contains multiple lesser blackwords.|n|nYou should only add words which are used by everyone, but the spam will have much more at the same time.|nDon't add words that are too short."
	EnhancedChatFilter_LesserBlackwordList = "LesserBlackwordList"
	EnhancedChatFilter_LesserBlackWordThreshold = "LesserBlackWordThreshold"
	EnhancedChatFilter_LesserBlackWordThresholdTooltips = "Filter msgs contained many lesser blackwords"
	EnhancedChatFilter_BlackList = "BlackList"
	EnhancedChatFilter_StringIO = "Import/Export"
	EnhancedChatFilter_Import = "Import"
	EnhancedChatFilter_StringHashMismatch = "String Hash Mismatch"
	EnhancedChatFilter_ImportSucceeded = "Import Succeeded"
	EnhancedChatFilter_Export = "Export"
--LootFilter
	EnhancedChatFilter_LootFilter = "LootFilter"
	EnhancedChatFilter_AddItemWithID = "Add With ID"
	EnhancedChatFilter_NotExists = "Do not Exists"
	EnhancedChatFilter_LootFilterList = "LootFilterList"
	EnhancedChatFilter_LootQualityFilter = "LootItemQuality"
	EnhancedChatFilter_LootQualityFilterTooltips = "Filter any loot that is poorer than you choose"
--AchievementFilter
	EnhancedChatFilter_GotAchievement = "[%s]have earned the achievement%s!"
	EnhancedChatFilter_And = ", "
	
	CurrencyTracking_CT_TITLE = "Currency Tracking";
	CurrencyTracking_CT_ADDON_NOTES = "Currency Tracking is an addon to help you track the currencies you gained, showing the selected currency even on top of the game screen.";
	CurrencyTracking_CT_OPTIONS = "Options";
	CurrencyTracking_CT_OPT_SHOWONSCREEN = "Show currency info on screen";
	CurrencyTracking_CT_OPT_SCALE = "Currencies info's scale";
	CurrencyTracking_CT_OPT_TRANSPARENCY = "Currencies info's transparency";
	CurrencyTracking_CT_OPT_BGTRANSPARENCY = "Currencies info's background transparency";
	CurrencyTracking_CT_OPT_TOOLTIPTRANSPARENCY = "Currencies info tooltip's transparency";
	CurrencyTracking_CT_OPT_TOOLTIPSCALE = "Currencies info tooltip's scale";
	CurrencyTracking_CT_OPT_BREAKUPNUMBERS = "Converts a number into a localized string, grouping digits as required."
	CurrencyTracking_CT_CURRENCY_TO_TRACK = "Currencies to be tracked on screen:";
	CurrencyTracking_CT_OPT_ICONPRIORTONUMBER = "Put currency icon prior to its amount";
  CurrencyTracking_CT_OPT_ALWAYSLOCK = "Always lock the currency info frame";
  CurrencyTracking_CT_OPT_ALWAYSLOCK_TIP = "Enable to always lock the frame even not in combat. Disable to only lock the frame while in combat. ";
	CurrencyTracking_CT_CAT_TRACKED_CURRENCY = "Tracked Currencies";