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
GOLD_AMOUNT = "|c00ffd700%d●|r";--GOLD_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-GoldIcon:0:0:2:0\124t"
SILVER_AMOUNT = "|c00c7c7cf%d●|r";--SILVER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-SilverIcon:0:0:2:0\124t"
COPPER_AMOUNT = "|c00eda55f%d●|r";--COPPER_AMOUNT = "%d\124TInterface\\MoneyFrame\\UI-CopperIcon:0:0:2:0\124t"
ENTERING_COMBAT = "";
LEAVING_COMBAT = "";

	CHAT_GUILD_GET = "|Hchannel:GUILD|h[G]|h %s ";
	CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[O]|h %s ";
	CHAT_RAID_GET = "|Hchannel:RAID|h[R]|h %s ";
	CHAT_RAID_WARNING_GET = "[RW] %s ";
	CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[RL]|h %s ";
	CHAT_PARTY_GET = "|Hchannel:PARTY|h[P]|h %s ";
	CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[PL]|h %s ";
	CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[PG]|h %s ";
	CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE|h[I]|h %s ";
	CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE|h[IL]|h %s ";
  CHAT_WHISPER_INFORM_GET = "<%s:";
  CHAT_WHISPER_GET = ">>%s:";
  CHAT_BN_WHISPER_INFORM_GET = "<%s:";
  CHAT_BN_WHISPER_GET = ">>%s:";
  CHAT_SAY_GET = "%s:";
  CHAT_YELL_GET = "%s:"  ;
  CHAT_FLAG_AFK = "[AFK]";
  CHAT_FLAG_DND = "[Busy]";
  CHAT_FLAG_GM = "[GM]";
ITEM_CREATED_BY="|cFF00DDFF<Thanks For Using MaoR UI>|r";
--- 改變頻道提示 [加入頻道→+][離開頻道→-][改變頻道→=]
CHAT_YOU_CHANGED_NOTICE = "=|Hchannel:%d|h[%s]|h";
CHAT_YOU_CHANGED_NOTICE_BN = "=|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE = "+|Hchannel:%d|h[%s]|h";
CHAT_YOU_JOINED_NOTICE_BN = "+|Hchannel:CHANNEL:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE = "-|Hchannel:%d|h[%s]|h";
CHAT_YOU_LEFT_NOTICE_BN = "-|Hchannel:CHANNEL:%d|h[%s]|h";

Welcome_loginChatText1 = "<<<-------------- 有你们的魔兽，才是世界 ----";
Welcome_loginChatText2 = "|cFFBF00FFMao|r|cFF00DDFFR|r|cffff8800 UI|r|cff3399ff By Shiguang + TuTu v.180121|r";
Welcome_loginChatText3 = "|cff02F78E大大大的感谢|r|cffC495DDSiweia|r|cff02F78E大大,向他学到了好多.|r";
Welcome_loginChatText4 = "-------  v2.3.0 For 7.3.5  --------------->>>";
Welcome_SmallText1 = "[ 微美化界面 ]";
Welcome_SmallText2 = "[ 全职业适用无障碍 ]";
Welcome_SmallText3 = "[ 开袋即食 轻优化 无需设置 ]";
Welcome_SmallText4 = "[ 插件每月21日UI官网 准时更新发布 ]";
Welcome_Large1 = "[ V 2.3.0 ]";
Welcome_Large2 = "[ Hi Legion 7.3.5 ]";
Welcome_Large3 = "[ 右键小地图便捷设置 ]";
Welcome_Large4 = "[ 系统自带功能，插件有针对性删减 ]";
Welcome_Large5 = "更多内容详见官网· · ·";

DANWEI_WAN = "W";
DANWEI_YI = "Y";

----------------Title----------------------
CHAT_WHISPERPOP_TITLE="|cff777777[Chat]|rWhisperPop";
GEAR_DELETEEMPTYMAILS_TITLE="|cffFFFFFF[Mail]|rMailboxCleaner";
GEAR_MOLINARI_TITLE="|cff8080ff[Profession]|rMolinari";
NOTICE_INCENTIVEPROGRAM_PANEL_TITLE="|cff8080ffIncentiveProgram|r";
NOTICE_INCENTIVEPROGRAM_TITLE="(|cFF69CCF0IncentiveProgram|r)";
LOOT_ANNOUNCERBUTTON_TITLE="Notify loot(Riad)";
CurrencyTracking_TITLE = "|cFF00FF00[Currency]|rTracking";
RelicInspector_TITLE = "|cff8080ff[Tips]|rRelicInspector";
Savedinstances_TITLE = "|c00FF68CC[Tips]|rSavedinstances";
QuestNotifier_TITLE = "|cff0080ff[Quest]|rQuestNotifier";
----------------Charms----------------------
CHARMS_BUY_STACK="You sure buy|cffff0000 a stack |rthis item？"  ;
CHARMS_NAKEDIZE="Nakedize";
CHARMS_TARGET="Target";
CHARMS_MALE="Male";
CHARMS_FEMALE="Female";
CHARMS_HUMAN="Human";
CHARMS_ORC="Orc";
CHARMS_DWARF="Dwarf";
CHARMS_NIGHTELF="NightElf";
CHARMS_SCOURGE="Scourge";
CHARMS_TAUREN="Tauren";
CHARMS_GNOME="Gnome";
CHARMS_TROLL="Troll";
CHARMS_GOBLIN="Goblin";
CHARMS_BLOODELF="BloodElf";
CHARMS_DRAENEI="Draenei";
CHARMS_WORGEN="Worgen";
CHARMS_PANDAREN="Pandaren";
CHARMS_EXTEND="extend";
----------------Gear----------------------
GEAR_AHHELPER_AUTOSELL="-- |cFF00DDFFAlt&RightClick |rto selling with auto price--";
MAIL_RECEIVELETTERS="Items";
MAIL_RECEIVECOINS="Coins";
MAIL_DELETEEMPTYMAILS="Del empty";
MAIL_OPENMAILBOX=" - You Should Open The Mailbox First";
MOLINARI_BLACKLIST="Blacklist";
MOLINARI_DRAGTOADD="Drag items into the window below to add more.";
MOLINARI_POTENTIALLYpotentially="Items blacklisted from potentially being processed.";
MOLINARI_REMOVEITEM="Right-click to remove item";
NOMICAKES_POTENTIAL="Potential Recipes";
SUBSPEC_NEWSET="[New Set]";
SUBSPEC_LEFTSHIFT="Left Shift";
SUBSPEC_RIGHTSHIFT="Right Shift";
SUBSPEC_NEWPROFILENAME="Enter the new configuration file name";
TRAINALL_ALLLEARN="Train All";
----------------Loot----------------------
PLH_LONG_ADDON_NAME = 'Personal Loot Helper';
PLH_AUTHOR_NAME = 'Author:Madone-Zul\'Jin';
PLH_ADDON_NOTE = "Personal Loot Helper";
PLH_INCLUDE_BOEITEM = "Include Bind on Equip items";
PLH_SPEC_ONLY = "Evaluate based on current spec only";
PLH_NOTIFY_GROUPS = "Notify group (automatically disabled in LFR)";
PLH_COORDINATE_ROLL = "Coordinate rolls (group leaders or assistants only)";
PLH_MANAGE_ROLLS = "Manage loot rolls. Players can whisper the roll coordinator with <trade> or <trade [item]> to initiate rolls.";
PLH_NO_LOWLEVEL = "Exclude notifications if character is too low level to equip item";
PLH_SHOW_INRAID = "Show tradeable items in raid frames";
PLH_THANKS_ALL = "Thank you to all of the players who trade loot to others who can use it! Your generosity is part of what makes the WoW community great.\nYou rock!!!";
----------------Map----------------------
FOGLIGHT_HYBIRD = "Hybrid";
FOGLIGHT_DISABLE = "Disabled";
FOGLIGHT_ALL = "All Terrain";
FOGLIGHT_NONE = "No Terrain";
MAPTREASURES_SHOW = "Show Treasures";
MINIMAP_MENU_BARSTYLE = "Actionbar style";
MINIMAP_MENU_KEYBIND = "Key BindPad";
MINIMAP_MENU_QUESTBUTTON = "Actionbar Button";
MINIMAP_MENU_SPECIALBUTTON = "Special Button";
MINIMAP_MENU_AURACONFIG = "AURA Config";
MINIMAP_MENU_AURADIY = "   --AURA Setting";
MINIMAP_MENU_CONTROLNOTICE = "Control Notice";
MINIMAP_MENU_CASTBAR = "Castbar";
MINIMAP_MENU_ONOFF = "on-off";
MINIMAP_MENU_Click = "Click2Cast";
MINIMAP_MENU_DAMAGESTYLE = "Damage style";
MINIMAP_MENU_GRIDTOOL = "Grid tool";
MINIMAP_MENU_lOOTHELPER = "Loot helper";
MINIMAP_MENU_DISTANCE = "Show distance";
MINIMAP_MENU_COMBOPOINTS = "Combo points";
MINIMAP_MENU_COMPAREITEMS = "Compare Items";
MINIMAP_MENU_SWITCHUF = "Switch UF";
MINIMAP_MENU_AFKSCREEN = "AFK Screen";
MINIMAP_MENU_CHECKFOODSSS = "Check food/drink";
MINIMAP_MENU_QUSETIONANSWER = "Question/Answer";
MINIMAP_MENU_UISETTING = " Setting";
MINIMAP_MENU_MORE = "      More...";
----------------Notice----------------------
COMBATNOTIFICATIONINFO_INFO_WOWTIME_TIP = "will start within 15 minute";
COMBATNOTIFICATIONINFO_need = " reward bags!";
COMBATNOTIFICATIONINFO_Tank = "|cffA52A00<Tank>|r";
COMBATNOTIFICATIONINFO_Healer = "|cff009300<Healer>|r";
COMBATNOTIFICATIONINFO_DPS = "|cffEE3A8C<DPS>|r";
COMBATNOTIFICATIONINFO_combat_enter = "- ENTERING COMBAT -";
COMBATNOTIFICATIONINFO_combat_leav = "- LEAVING COMBAT -";
COMBATNOTIFICATIONINFO_Tank_G = "<Tank>";
COMBATNOTIFICATIONINFO_Healer_G = "<Healer>";
COMBATNOTIFICATIONINFO_DPS_G = "<DPS>";
COMBATNOTIFICATIONINFO_CLICK = "<%s> is casting %s. Click!";
COMBATNOTIFICATIONINFO_NOFOOD = "No Food: ";
COMBATNOTIFICATIONINFO_NOFLASK = "No Flask: ";
COMBATNOTIFICATIONINFO_NORUNE = "No Rune: ";
COMBATNOTIFICATIONINFO_ALLBUFFED = "All Buffed!";
INCENTIVEPROGRAM_ROLES = "职责";
INCENTIVEPROGRAM_IGNORED = "忽略";
INCENTIVEPROGRAM_NO_IGNORED = "没有忽略的副本";
INCENTIVEPROGRAM_SETTINGS = "设置";
INCENTIVEPROGRAM_HIDE_IN_PARTY = "有队伍就不显示了";
INCENTIVEPROGRAM_HIDE_ALWAYS = "隐藏";
INCENTIVEPROGRAM_HIDE_EMPTY = "没有需求时候隐藏";
INCENTIVEPROGRAM_ALERT = "有新的奖励时候提醒我";
INCENTIVEPROGRAM_ALERT_TOAST = "使用全局提醒框";
INCENTIVEPROGRAM_IGNORE_COMPLETED_LFR = "隐藏已经打过的本";
INCENTIVEPROGRAM_IGNORE = "忽略";
INCENTIVEPROGRAM_UNIGNORE = "沒有忽略的随机副本";  
INCENTIVEPROGRAM_JOIN_QUEUE = "加入随机队伍队列";
INCENTIVEPROGRAM_TOOLTIP_IGNORE_LFR = "LFRs with all encounters defeated no longer alert or show in count, but still show up in left click menu.";
INCENTIVEPROGRAM_TOOLTIP_HIDE_ALWAYS = "Hide's the frame always.  This is intended for use with Data Brokers.  Type /ip to undo.";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_1 = "You can find Sound IDs at http://www.wowhead.com/sounds. When you find a sound， the ID is in the address bar (i.e. http://www.wowhead.com/sound=47615/ui-groupfinderreceiveapplication)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_2 = "You can find Sound IDs at http://www.wowhead.com/sounds. When you find a sound, the ID is in the address bar (i.e. http://www.wowhead.com/sound=18019/ui-bnettoast)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_REPEATS = "Number of times the sound effect plays.";
INCENTIVEPROGRAM_TOOLTIP_CYCLE_COUNT = "Number of times the three coin images rotate when a new alert appears.";
INCENTIVEPROGRAM_TOOLTIP_CONTINUOUSLY_CYCLE = "The frame will continuously cycle the coin images while an alert is active.";
INCENTIVEPROGRAM_CHANNEL = "Channel:";
INCENTIVEPROGRAM_CHANNEL_DISC="This is the default channel.";
INCENTIVEPROGRAM_MUSIC = "Music";
INCENTIVEPROGRAM_SOUND_ID = "Sound ID";
INCENTIVEPROGRAM_REPEATS = "Repeats";
INCENTIVEPROGRAM_AMBIENCE = "Ambience";
INCENTIVEPROGRAM_MASTER="Master *";
INCENTIVEPROGRAM_MASTER_DISC="This plays at the Master Volume Slider's level, even if Sound Effects are disabled.";
INCENTIVEPROGRAM_ALERT_PING = "Alert Ping";
INCENTIVEPROGRAM_TOAST_PING = "Toast Ping";
INCENTIVEPROGRAM_TEST = "Test";
INCENTIVEPROGRAM_ANIM_CYCLES = "Cycles";
INCENTIVEPROGRAM_CONTINUOUSLY_CYCLE = "Continuously Cycle";
INCENTIVEPROGRAM_RESET_POSITION = "RESET_POSITION";
REMINDER_BAGS_SPACE = "Bag slots only ";
BARRELSOEASY_NO_GROUP = "Warning, being in a group will cause BarrelsOEasy's marks to clear after each round.";
BARRELSOEASY_NO_GROUPS = "Warning, being in a group will cause BarrelsOEasy's marks to clear after each round.";
BARRELSOEASY_START_FIRST = "Please start the first round, so that the barrels can be marked after they stop moving.";
----------------Role----------------------
PVPPP_KILL_MSG = "Honorable kills:%s/%s";
PVPPP_KILL_AVG = "You've get %s 's honorable kills in last hour";
----------------UFs----------------------
UFRAMESTYLE_BLINKHEALTHTEXT_ANCHOR = "LeftClick - Move\nRightClick - Lock";

----------------BRP----------------------
BRP_Description="Lock/unlock movement with /brp lock, and reset the position with /brp reset.";
BRP_AlwaysShow="Always unfold the loot list";
BRP_FillDirection="Direction the loot list should appear";

U["Lock UIScale"] = "Lock UIScale"
U["Lock Chat"] = "Lock Chat"
U["Minimap Clock"] = "Minimap Clock"
U["Setup UIScale"] = "Setup UIScale"
U["PlayerFrame Scale"] = "PlayerFrame Scale"
U["Map Scale"] = "WorldMap Scale"
U["Map Coords"] = "WorldMap Coords"
U["Enable Reminder"] = "Enable Class Reminder"
U["Enable Familiar"] = "Enable Familiar"
U["Enable Stagger"] = "Enable Stagger"
U["Enable Statue"] = "Enable Statue"
U["Enable Totems"] = "Enable Totems"
U["Destroy Totems"] = "Destroy Totems"
U["Enable Marksman"] = "Enable Marksman"
U["Enable BloodyHell"] = "Enable BloodyHell"
U["kAutoOpen"] = "keep Auto Open Items"
U["QuickQueue"] = "Quick Queue"
U["AutoConfirmRoll"] = "Auto Confirm Roll"
U["Enable Nameplate"] = "Enable NameplateMods"
U["Max Auras"] = "Max Auras"
U["Auras Size"] = "Auras Size"
U["Nameplate InsideView"] = "Nameplate InsideView"
U["Tank Mode"] = "Tank Mode"
U["Auras Border"] = "Auras Border"
U["Friendly CC"] = "Friendly Class Color"
U["Hostile CC"] = "Hostile Class Color"
U["PlayerPlate Aura"] = "PlayerPlate Aura"
U["NP Width"] = "NameplateMods Width"
U["NP Height"] = "NameplateMods Height"
U["Nameplate MinAlpha"] = "Nameplate MinAlpha"
U["Faster Loot"] = "Faster Loot"
U["Mail Tool"] = "Mail Tool"
U["Hide Error"] = "Hide Error"
U["SoloInfo"] = "SoloInfo Notice"
U["Rare Alert"] = "Rare Alert"
U["Alert In Chat"] = "Alert In Chat"
U["Easy Focus"] = "Easy Focus(Shift click)"
U["No Talking"] = "No NPC Talking"
U["Hide Bossbanner"] = "Hide Bossbanner"
U["FriendGroups"] = "Friends Groups"
U["Whisper Invite"] = "Whisper Invite"
U["Guild Invite Only"] = "Guild Invite Only"
U["Whisper Keyword"] = "Whisper Keyword"
U["Enable AuraWatch"] = "Enable AuraWatch"
U["AuraWatch Tooltip"] = "AuraWatch Tooltip"
U["Enable Actionbar"] = "Enable Actionbar"
U["Actionbar Style"] = "Actionbar Style"
U["Bar4 Fade"] = "Bar4 Fade"
U["Bar5 Fade"] = "Bar5 Fade"
U["Actionbar Hotkey"] = "Actionbar Hotkey"
U["Actionbar Macro"] = "Actionbar Macro"
U["Actionbar Item Counts"] = "Actionbar Item Counts"
U["Show Cooldown"] = "Show Cooldown"
U["Decimal Cooldown"] = "Decimal Cooldown"
U["ClassColor BG"] = "ClassColor BG"

	U["NFG"] = "Not From Guild"
	U["New"] = "New"
	U["Mail"] = "Mail"
	U["No Mail"] = ""
	U["Bags"] = "Bags"
	U["Total"] = "Total"
	U["Used"] = "Used"
	U["CurrencyPanel"] = "<Left Key>Open Currency"
	U["AutoSell Junk"] = "<Ctrl Click>Autosell Junk"
	U["Your vendor trash has been sold and you earned"] = "Your vendor trash has been sold and you earned"
	U["D"] = "D"
	U["Low Durability"] = "You got low durabilty slots！"
	U["PlayerPanel"] = "<Left Key>Open CharacterFrame"
	U["AutoRepair"] = "<Right Key>AutoRepair"
	U["Repair cost covered by G-Bank"] = "Repair cost covered by G-Bank"
	U["Repair cost"] = "Repair cost"
	U["Go farm newbie"] = "Go farm newbie"
	U["none"] = "None"
	U["My Coordinate"] = "My Coordinate"
	
	U["Friends list:"] = "Friends list:"
	U["Friends"] = "Friends"
	U["Earned:"] = "Earned:"
	U["Spent:"] = "Spent:"
	U["Deficit:"] = "Deficit:"
	U["Profit:"] = "Profit:"
	U["Session"] = "Session"
	U["Server"] = "Server"
	U["Character"] = "Character"
	
	U["Guild"] = "Guild"
	U["No Guild"] = "No Guild"
	U["Sorting"] = "Sorting"
	U["Sorting by:"] = "Sorting by:"
	U["Excessive"] = "Excessive !"
	
	U["Hidden"] = "Hidden"
	U["Shift"] = "Shift"
	U["Default UI Memory Usage:"] = "Default UI Memory Usage:"
	U["Total Memory Usage:"] = "Total Memory Usage:"
	U["Garbage collected"] = "Garbage collected"
	U["ManulCollect"] = "<Left Key>Collect Memory"
	U["AutoCollect"] = "<Right Key>AutoCollect Memory"
	
	U["No Talents"] = "No Talents"
	U["Active Talent"] = "Active Talent : "
	U["Talent"] = "Talent : "
	U["Primary Talent"] = "PTalent : "
	U["Secondary Talent"] = "STalent : "
	
	U["My Position"] = "My Position"
	U["System"] = "System"
	U["Home"] = "Home"
	U["Latency"] = "Latency"
	U["CPU Usage"] = "<Right Key>Show CPU Usage"
	U["Toggle CPU Usage"] = "Toggle CPU Usage."
	U["Reload UI(on)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:You could see addon's CPU usage after reloding UI,Please Reload UI!"
	U["Reload UI(off)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:You could hide the addon's CPU usage table after reloding UI,Please Reload UI!"
	U["Are you sure to reset the gold count?"] = "Are you sure to reset the gold count?"
	U["WoW"] = "<World of Warcraft>"
	U["BN"] = "<Battle.NET>"
	U["SpecPanel"] = "<Left Key>Toggle TalentFrame"
	U["Change Spec"] = "<Left Key>Select Your Spec"
	U["Change Loot"] = "<Right Key>Select Your Loot Spec"
	U["Reset Gold"] = "<Ctrl+Right Key>Reset Data"
	U["BN Info"] = "BN Announce"
	U["Toggle Calendar"] = "<Left Key>Toggle Calendar"
	U["Toggle Clock"] = "<Right Key>Toggle Clock"
	U["WorldMap"] = "<Left Key>Toggle Map"
	U["Send My Pos"] = "<Right Key>Send My Coords"
	U["Show Menus"] = "<Right Key>Quick Menus"
	U["Show Friends"] = "<Left Key>Toggle FriendsFrame"
	U["No Online"] = "No friends online at the moment."
	U["NotInGuild"] = "You aren't in a guild."
	U["LookForGuild"] = "<Left Key>Looking for Guild"
	U["Hide Members"] = "Online members exceed, %d have been hidden."
	U["Show Guild"] = "<Left Key>Toggle GuildFrame"
	U["Unknown"] = "Location Unknown"
	U["Timewarped"] = "Timewarped Badge Reward"
	U["Deathtalon"] = "Deathtalon"
	U["Terrorfist"] = "Terrorfist"
	U["Doomroller"] = "Doomroller"
	U["Vengeance"] = "Vengeance"
	U["Tanaan"] = "Tanaan"
	U["Platinum Invasion"] = "Platinum Invasion"
	U["Gold Invasion"] = "Gold Invasion"
	U["Silver Invasion"] = "Silver Invasion"
	U["Bronze Invasion"] = "Bronze Invasion"

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
REPAIR_COST = "repair：";


  ACP_AddonControlPanel = "Addon Control Panel";
			ACP_SomeprotectedaddonsarenloadedReloadnow = "ACP: Some protected addons aren't loaded. Reload now?";
			ACP_ActiveEmbeds = "Active Embeds";
			ACP_AddOns = "AddOns";
			ACP_Addonnotvalid = "Addon <%s> not valid";
			ACP_AddonsLoaded = "Addons [%s] Loaded.";
			ACP_Addonsrenamedto = "Addons [%s] renamed to [%s].";
			ACP_AddonsSaved = "Addons [%s] Saved.";
			ACP_AddonsUnloaded = "Addons [%s] Unloaded.";
			ACP_Addtocurrentselection = "Add to current selection";
			ACP_Author = "Author";
			ACP_ClicktoenableprotectmodeProtectedaddonswillnotbedisabled = "Click to enable protect mode. Protected addons will not be disabled";
			ACP_Close = "Close";
			ACP_Default = "Default";
			ACP_Dependencies = "Dependencies";
			ACP_DisableAll = "Disable All";
			ACP_DisabledonreloadUI = "Disabled on reloadUI";
			ACP_Embeds = "Optional Deps";
			ACP_EnableAll = "Enable All";
			ACP_EnablingyourUI = "*** Enabling <%s> %s your UI ***";
			ACP_Enterthenewnamefor = "Enter the new name for [%s]:";
			ACP_Load = "Load";
			ACP_LoadableOnDemand = "Loadable OnDemand";
			ACP_Loaded = "Loaded";
			ACP_Loadedondemand = "Loaded on demand.";
			ACP_LoDChildEnableisnow = "LoD Child Enable is now %s";
			ACP_MemoryUsage = "Memory Usage";
			ACP_Noinformationavailable = "No information available.";
			ACP_Recursive = "Recursive";
			ACP_RecursiveEnableisnow = "Recursive Enable is now %s";
			ACP_Reload = "Reload";
			ACP_ReloadUI = "ReloadUI";
			ACP_ReloadyourUserInterface = "Reload your User Interface?";
			ACP_Removefromcurrentselection = "Remove from current selection";
			ACP_Rename = "Rename";
			ACP_ResurseToolTip = "When enabling an addon, attempt to enable any addons the addon depends on";
			ACP_Save = "Save";
			ACP_Savethecurrentaddonlistto = "Save the current addon list to [%s]?";
			ACP_Set = "Set ";
			ACP_Sets = "Sets";
			ACP_Status = "Status";
			ACP_UnknownAddonRequired = "*** Unknown Addon <%s> Required ***";
			ACP_UseSHIFTtooverridethecurrentenablingofdependanciesbehaviour = "Use SHIFT to override the current enabling of dependancies behaviour.";
			ACP_Version = "Version";
			ACP_whenperformingareloadui = "when performing a reloadui.";
			
			
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
DEX_TXT_CRUSH = "Crush!";
DEX_TXT_DISPELLED = "Dispel! ";
DEX_TXT_STOLEN = "Steal! ";
DEX_TXT_REFLECT = " Reflect! ";
DEX_TXT_CRIT = "Crit! ";
DEX_TXT_INTERUPT = "Interrupt! ";
DEX_MAIN_OPTION = "DamageEx";
DEX_BUTTON_RESET_TIP = "Restore defaults";
DEX_PREVIEW_LABEL = "Drag me to *change* text position";
DEXColorMode_T = "Color mode";
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
IEQUIP_WEARSET = "Wear Set[|cff00ff00%d|r] - |T%s:12:12:0:0|t|cff00ff00%s|r";
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
	QN_Colon       = "：";
	QN_Quest       = "Quest";
	QN_Progress    = "Progress";
	QN_Complete    = "Completed!";
	QN_Accept      = "AcceptQuest";


WHISPERPOP_LOCALE = {
	["title"] = "WhisperPop",
	["tip tooltip"] = "Left-drag to move this tip icon, left-click to open WhisperPop main frame.",
	["no new messages"] = "No unread messages",
	["new messages from"] = "Unread messages from: ",
	["receive only"] = "Show received messages only",
	["sound notifying"] = "Sound notifying",
	["time"] = "Show time stamp",
	["receive only tooltip"] = "If checked, sent messages will not be displayed in the list.",
	["sound notifying tooltip"] = "If checked, you will be notifyed with a sound alert every time a new message comes in.",
	["time tooltip"] = "If checked, a time stamp will be displayed in front of every message text.",
	["delete messages"] = "Delete all messages",
	["delete messages tooltip"] = "Click to delete all existing messages.",
	["keep messages"] = "Keep all messages",
	["keep messages tooltip"] = "Keep all existing messages.",
	["toggle frame"] = "Toggle WhisperPop frame",
};
	
	CurrencyTracking_ADDON_NOTES = "Currency Tracking is an addon to help you track the currencies you gained, showing the selected currency even on top of the game screen.";
	CurrencyTracking_OPTIONS = "Options";
	CurrencyTracking_DISPLAYSETTINGS = "Display Settings";
	CurrencyTracking_OPT_SHOWONSCREEN = "Show currency info on screen";
	CurrencyTracking_SHOWTOOLTIP = "Show tooltip";
	CurrencyTracking_SHOWTOOLTIPINFO = "Show all currency's info in tooltip.";
	CurrencyTracking_SHOW_MONEY = "Show money info";
	CurrencyTracking_ENABLE_SHOW_MONEY_WITH_CURRENCIES = "Enable to show total money together with currencies' info.";
	CurrencyTracking_SHOW_ICON = "Show icon only";
	CurrencyTracking_SHOW_ICON = "Show only the currency / item's icon, do not show the amounts.";
	CurrencyTracking_RESET_POSITION = "Reset position";
	CurrencyTracking_RESET_SCREEN_POSITION = "Reset on-screen currency frame's position.";
	CurrencyTracking_BREAKUP_NUMBERS = "Breakup numbers";
	CurrencyTracking_OPT_BREAKUP_NUMBERS = "Converts a number into a localized string, grouping digits as required.";
	CurrencyTracking_HIDEZERO = "Hide zero";
  CurrencyTracking_AUTOHIDEITEMS = "Auto-hide items / currencies which have zero amount.";
  CurrencyTracking_ICON_FIRST = "Icon first";
	CurrencyTracking_OPT_ICON_PRIORTO_NUMBER = "Put currency icon prior to its amount";
	CurrencyTracking_OPT_ALWAYS_LOCK = "Always lock the currency info frame";
	CurrencyTracking_OPT_ALWAYS_LOCK_TIP = "Enable to always lock the frame even not in combat. Disable to only lock the frame while in combat. ";
	CurrencyTracking_OPT_HIDE_IN_PETBATTLE = "Hide while in pet battle";
  CurrencyTracking_OPT_AUTO_HIDE_IN_PETBATTLE = "Automatically hide the tracking frame while in pet battle.";
	-- Scale and Transparency
  CurrencyTracking_SCALE_TRANSPARENCY = "Scale and Transparency";
  CurrencyTracking_ON_SCREEN_FRAME = "On-screen frame";
  CurrencyTracking_TOOLTIP = "Tooltip";
  CurrencyTracking_SCALE = "Scale";
  CurrencyTracking_TRANSPARENCY = "Transparency";
  CurrencyTracking_BACKGROUND = "Background";
  CurrencyTracking_OPT_BGTRANSPARENCY = "Currencies info's background transparency";
  -- Others
  CurrencyTracking_MAXITEMS = "Max items per row";
  CurrencyTracking_MAXITEMSINFO = "Set the maximum number of items to be displayed per row. Set to 0 to allow unlimited items on one single row.";
  CurrencyTracking_CURRENCY_TO_TRACK = "Currencies to be tracked on screen:";
  CurrencyTracking_TRACKED_CURRENCY = "Tracked Currencies";
  CurrencyTracking_TRACKED_ITEMS = "Tracked Items";
  CurrencyTracking_PROFILE_OPTIONS = "Profile Options";

	
	TinyInspectL = {
    ShowItemBorder              = "物品直角邊框",
    EnableItemLevel             = "物品等級顯示",
    ShowColoredItemLevelString  = "裝等文字隨物品品質",
    ShowItemSlotString          = "顯示背包装备部位文字",
    ShowInspectAngularBorder    = "觀察面板直角邊框",
    ShowInspectColoredLabel     = "觀察面板高亮橙裝武器標簽",
    ShowOwnFrameWhenInspecting  = "觀察同時顯示自己裝備列表",
    DisplayPercentageStats      = "裝備屬性換算成百分比數值",
    EnablePartyItemLevel        = "小隊隊友裝等",
    SendPartyItemLevelToSelf    = "發送隊友裝等到自己面板",
    SendPartyItemLevelToParty   = "發送隊友裝等到隊伍頻道",
    EnableRaidItemLevel         = "團隊成員裝等",
    ["general.statusbarOffsetX"] = "Statusbar Margin-X (0:Default)",
    ["general.statusbarOffsetY"] = "Statusbar Offset Y (0:Default)",
    ["general.alwaysShowIdInfo"] = "Always Show Id Info (Otherwise hold down SHIFT/ALT)",
    ["general.skinMoreFrames"]   = "Skin More Frames |cffcccc33(need to /reload)|r",
    ["dropdown.inherit"]        = "|cffffee00inherit|r",
    ["dropdown.default"]        = "|cffaaaaaadefault|r",
    ["dropdown.cursor"]         = "|cff33ccffcursor|r",
    ["dropdown.static"]         = "|cff33ccffstatic|r",
    ["dropdown.none"]           = "|cffaaaaaanone|r",
    ["dropdown.not reaction5"]      = "|cffff3333not|r reaction5",
    ["dropdown.not reaction6"]      = "|cffff3333not|r reaction6",
    ["dropdown.not inraid"]         = "|cffff3333not|r inraid",
    ["dropdown.not incombat"]       = "|cffff3333not|r incombat",
    ["dropdown.not inpvp"]          = "|cffff3333not|r inpvp",
    ["dropdown.not inarena"]        = "|cffff3333not|r inarena",
    ["dropdown.not ininstance"]     = "|cffff3333not|r ininstance",
    ["dropdown.not samerealm"]      = "|cffff3333not|r samerealm",
    ["dropdown.not samecrossrealm"]  = "|cffff3333not|rsameCrossrealm",
    ["TargetBy"]                    = "Targeted By",
    ["showTargetBy"]                = "Show Targeted By",
  };