
-- Thank you to all of the translators that have helped localize Overachiever. In addition to those mentioned
-- below in their respective sections, recognition is due to all who have used the localization system provided
-- for Overachiever by Curse Forge. See a list of them here:
-- http://wow.curseforge.com/projects/overachiever/localization/translators/

OVERACHIEVER_STRINGS = {
	BINDING_NAME_OVERACHIEVER_TAB_SEARCH = "Open Search Tab";
	BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = "Open Suggestions Tab";
	BINDING_NAME_OVERACHIEVER_TAB_WATCH = "Open Watch Tab";

	OVERACHIEVER_INSTALLED_TOAST = "OVERACHIEVER INSTALLED!";
	OVERACHIEVER_INSTALLED_MSG = "|cff7eff00Overachiever|r v%s was installed.";
	OVERACHIEVER_UPDATED_TOAST = "OVERACHIEVER UPDATED!";
	OVERACHIEVER_UPDATED_MSG = "|cff7eff00Overachiever|r was updated to v%s.";

	STARTTOAST_EVENT = "Happening Today";

	SERIESTIP = "Part of a series:";
	REQUIREDFORMETATIP = "Required for:";
	PROGRESSIFOTHERCOMPLETED = "%s's Progress:";
	RECENTREMINDERCRITERIA = "Recently spotted objective:";

	PROGRESS = "Progress";
	YOURPROGRESS = "Your Progress";
	COMPLETEDATE = "Completed on %2$d/%1$02d/%3$02d";  -- 1 - day 2 - month 3 - year
	INCOMPLETE = "Incomplete";

	MULTI_NEED = "%s (needed for %s achievements)";

	KILL_INCOMPLETE = "Need to kill";
	KILL_COMPLETE = "Already killed";
	--? "Need to defeat" -- for things you need to defeat but not kill

	CRITTER = "Critter";
	WILDPET = "Wild Pet";
	ACH_LOVECRITTERS_INCOMPLETE = "Needs some /love";
	ACH_LOVECRITTERS_COMPLETE = "Already /loved";

	ACH_WELLREAD_INCOMPLETE = "Needs to be read";
	ACH_WELLREAD_COMPLETE = "Already read";

	ACH_ANGLER_INCOMPLETE = "Need to fish";
	ACH_ANGLER_COMPLETE = "Already fished";
	-- Since some achievements say to catch a certain fish but don't require fishing from a specific node and so don't give the node's name in the criteria,
	-- use this to make reminder tooltips work on those nodes where the fish name is known but the node's full name isn't. The %s is a stand-in for the
	-- fish name. Put each possibility on a new line.
	ACH_FISHSCHOOL_FORMAT = [[%s School
School of %s
%s Swarm]];

	-- For fishing achievements that have only one criteria and which require fishing from a node. Put each on a new line. Format: <achievement ID>=<fishing node names (separated by commas)>
	ACH_ANGLER_COUNT = [[9455=Fire Ammonite School
9456=Abyssal Gulper School,Oily Abyssal Gulper School
9457=Blackwater Whiptail School
9458=Blind Lake Sturgeon School
9459=Fat Sleeper School
9460=Jawless Skulker School
9461=Sea Scorpion School,Oily Sea Scorpion School
]];

	ACH_CONSUME_INCOMPLETE = "Need to consume";
	ACH_CONSUME_COMPLETE = "Already consumed";
	ACH_CONSUME_INCOMPLETE_EXTRA = "Haven't consumed";

	ACH_CONSUME_91_INCOMPLETE = "I dare you to eat 91 all at once!";
	ACH_CONSUME_91_COMPLETE = "Gluttony already proven"; --"1000% Satisfied";

	ACH_LETITSNOW_INCOMPLETE = "Need to use Handful of Snowflakes";
	ACH_LETITSNOW_COMPLETE = "Already used Handful of Snowflakes";
	ACH_FISTFULOFLOVE_INCOMPLETE = "Need to use Handful of Rose Petals";
	ACH_FISTFULOFLOVE_COMPLETE = "Already used Handful of Rose Petals";
	ACH_BUNNYMAKER_INCOMPLETE = "Need to use Spring Flowers";
	ACH_BUNNYMAKER_COMPLETE = "Already used Spring Flowers";
	ACH_CHECKYOURHEAD_INCOMPLETE = "Needs a pumpkin head";
	ACH_CHECKYOURHEAD_COMPLETE = "Already pumpkin-headed";
	ACH_TURKEYLURKEY_INCOMPLETE = "Needs feathers";
	ACH_TURKEYLURKEY_COMPLETE = "Already feathered";

	HOLIDAY_DARKMOONFAIRE = "Darkmoon Faire";
	HOLIDAY_LUNARFESTIVAL = "Lunar Festival";
	HOLIDAY_LOVEISINTHEAIR = "Love is in the Air";
	HOLIDAY_NOBLEGARDEN = "Noblegarden";
	HOLIDAY_CHILDRENSWEEK = "Children's Week";
	HOLIDAY_MIDSUMMER = "Midsummer Fire Festival";
	HOLIDAY_MIDSUMMER_SHORT = "Midsummer";
	HOLIDAY_PIRATESDAY = "Pirates' Day";
	HOLIDAY_BREWFEST = "Brewfest";
	HOLIDAY_HALLOWSEND = "Hallow's End";
	HOLIDAY_DAYOFTHEDEAD = "Day of the Dead";
	HOLIDAY_PIGRIMSBOUNTY = "Pilgrim's Bounty";
	HOLIDAY_WINTERVEIL = "Feast of Winter Veil";
	HOLIDAY_WINTERVEIL_SHORT = "Winter Veil";

	MSG_INVALIDID = "Invalid input: No achievement with that ID.";
	MSG_NAMENOTFOUND = 'No achievement with name containing "|cffffffff%s|r" was found.';
	MSG_OPENINGTO = "Opening to: ";
	MSG_ONEFOUND = "1 other achievement found: ";
	MSG_NUMFOUNDLIST = "%s other achievements found:";
	MSG_ACHNOTFOUND = "Achievement not found.";
	MSG_CRITERIAPROGRESS = "|cff7eff00Achievement Progress:|r %s (%s)";

	OPTPANEL_REMINDERTOOLTIPS = "Reminder Tooltips";

	OPT_LABEL_SEASONALACHS = "SEASONAL ACHIEVEMENTS";

	OPT_LABEL_ACHTWO = '"%s" and "%s"';
	OPT_LABEL_ACHTHREE = '"%s," "%s," and "%s"';
	OPT_LABEL_ACHFOUR = '"%s," "%s,"|n"%s," "%s"';
	OPT_LABEL_ACHFIVE = '"%s," "%s,"|n"%s," "%s"|n"%s"';
	OPT_LABEL_ACHSIX = '"%s," "%s,"|n"%s," "%s"|n"%s," "%s"';
	OPT_LABEL_ACHSEVEN = '"%s," "%s,"|n"%s," "%s"|n"%s," "%s," "%s"';

	OPT_ACHUNKNOWN = "<Unknown>";

	OPT_LABEL_TOOLTIPS = "Achievement Tooltips and Links";
	OPT_SHOWPROGRESS = "Add your progress";
	OPT_SHOWPROGRESS_TIP = 'Add your progress when an achievement has quantity-based criteria, such as "Obtain 10 mounts."';
	OPT_SHOWPROGRESS_OTHER = "Compare progress in others' links";
	OPT_SHOWPROGRESS_OTHER_TIP = "Add your progress when the achievement info shown is that of another player.";
	OPT_SHOWID = "Show achievement IDs";

	OPT_LABEL_TRACKING = "Achievement Tracking";
	OPT_AUTOTRACKTIMED = "Auto-track timed achievements (non-battleground)";
	OPT_AUTOTRACKTIMED_TIP = "Automatically track achievements with timed criteria when the timer starts. If you are already tracking the maximum number of achievements, it will attempt to take the place of an auto-tracked exploration achievement; otherwise, it won't be tracked.|n|nExcludes achievements that require a battleground win.";
	OPT_AUTOTRACKTIMED_BG = "Auto-track timed battleground achievements";
	OPT_AUTOTRACKTIMED_TIP_BG = "When a battleground match starts, automatically track the achievement for winning it in a set amount of time (if it is incomplete).|n|nThe achievement is untracked upon leaving the battleground.";
	OPT_AUTOTRACKEXPLORE = "Auto-track exploration achievements as you travel";
	OPT_AUTOTRACKEXPLORE_TIP = "When you enter a zone, automatically track its exploration achievement. If already tracking an exploration achievement, this will replace the previous automatically-tracked one if there is one or another exploration achievement otherwise.";
	OPT_AUTOTRACKEXPLORE_COMPLETED = "Including completed achievements";
	OPT_AUTOTRACK_CRITERIATOAST = 'Auto-track upon "Achievement Progress" toast';
	OPT_AUTOTRACK_CRITERIATOAST_TIP = 'When the "Achievement Progress" toast appears, automatically track the achievement (if the tracking limit permits).';

	OPT_LABEL_CRITERIATOAST = "Progress Reaction (Non-Tracking)";
	OPT_CRITERIATOAST_CHATLOG = "Add to chat log";
	OPT_CRITERIATOAST_CHATLOG_TIP = 'When the "Achievement Progress" toast appears, link the achievement and show the completed criteria in the chat log.';
	OPT_CRITERIATOAST_SUGGEST = "Add to Recent Reminders (Suggestions)";
	OPT_CRITERIATOAST_SUGGEST_TIP = 'When the "Achievement Progress" toast appears, temporarily add the achievement to the Suggestions tab as a "Recent Reminder."';

	OPT_CRITTERTIPS = "Critter /loved?";
	OPT_CRITTERTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to /love that type of critter.";
	OPT_PESTCONTROLTIPS = "Pest exterminated?";
	OPT_PESTCONTROLTIPS_TIP = "If this achievement is incomplete, add a line to the tooltips of critters that are part of its criteria to indicate whether you still need to exterminate them.";
	OPT_WELLREADTIPS = "Book read?";
	OPT_WELLREADTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of books that are part of its criteria to indicate whether you need to read them.";
	OPT_ANGLERTIPS = "Fishing node fished?";
	OPT_ANGLERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of fishing nodes that are part of its criteria to indicate whether you need to fish from them.";
	OPT_ANGLERTIPS_TIP_ALWAYS = "Add a line to the tooltips of fishing nodes that are part of its criteria to indicate whether you need to fish from them.";
	OPT_LABEL_DRAENORANGLER = '"%s" Sub-Achievements';

	OPT_LETITSNOWTIPS = "Handful of Snowflakes used?";
	OPT_LETITSNOWTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Snowflakes on them.";
	OPT_FISTFULOFLOVETIPS = "Handful of Rose Petals used?";
	OPT_FISTFULOFLOVETIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate race/class combo to indicate whether you need to use a Handful of Rose Petals on them.";
	OPT_BUNNYMAKERTIPS = "Spring Flowers used?";
	OPT_BUNNYMAKERTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players of an appropriate gender and level to indicate whether you need to use Spring Flowers on them. Note that enemy players that are 10 or more levels higher than you are assumed to be at least level 18.";
	OPT_CHECKYOURHEADTIPS = "Weighted Jack-o'-Lantern used?";
	OPT_CHECKYOURHEADTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players to indicate whether you need to use a Weighted Jack-o'-Lantern on them.";
	OPT_TURKEYLURKEYTIPS = "Turkey Shooter used?";
	OPT_TURKEYLURKEYTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of players to indicate whether you need to use your Turkey Shooter on them.";

	OPT_CONSUMEITEMTIPS = "Item consumed?";
	OPT_CONSUMEITEMTIPS_TIP = "If the achievement is incomplete, add a line to the tooltips of items that are part of its criteria to indicate whether you need to consume them.";
	OPT_CONSUMEITEMTIPS_TIP2 = "Items that you are too low level to consume will not trigger a reminder sound.";
	--OPT_CONSUMEITEMTIPS_TIP3 = "Note: This option can add a few seconds to your initial load time.";
	OPT_CONSUMEITEMTIPS_WHENCOMPLETE = "Show even if achievement is complete";

	OPT_SATISFIEDTIPS = "1000% Satisfied?";
	OPT_SATISFIEDTIPS_TIP = "Add a line to the tooltips of items that are part the achievement's criteria to indicate whether you need to consume them.";

	OPT_LABEL_NEEDTOKILL = 'Kill Creature Achievements ("%s," "%s," etc.)';
	OPT_KILLCREATURETIPS = "Creature killed?";
	OPT_KILLCREATURETIPS_TIP = "Add a line to the tooltips of creatures (excluding critters) that need to be killed to meet the criteria of an incomplete achievement indicating whether you still need to kill them.";
	OPT_KILLCREATURETIPS_TIP2 = "Note: At startup (or when this is option is enabled), every achievement is scanned to find unit IDs. Not all achievements provide such IDs. Most do, but the tooltips of creatures which are the criteria of those that don't won't be altered by this option.";

	OPT_LABEL_MAINUI = "Main Achievement UI Modifications";
	OPT_UI_SERIESTIP = "Tooltip for achievements that are part of a series";
	OPT_UI_SERIESTIP_TIP = "When the cursor is over an achievement that is part of a series, display the names of others in the series and its relation to them.";
	OPT_UI_REQUIREDFORMETATIP = "Tooltip for achievements required by others";
	OPT_UI_REQUIREDFORMETATIP_TIP = "When the cursor is over an achievement that is required to earn another achievement, display the name of the meta-achievement.";
	OPT_UI_PROGRESSIFOTHERCOMPLETED = "Tooltip for quantity-based progress if completed by another";
	OPT_UI_PROGRESSIFOTHERCOMPLETED_TIP = "When the cursor is over a quantity-based achievement (e.g. critera of \"Obtain 10 mounts\") that was completed but not by the current character, display the current character's progress.";
	OPT_DRAGGABLE = "Make draggable";
	OPT_DRAGSAVE = "Remember position";
	OPT_UI_HOLIDAYNOTICE = "Display notice if a holiday event is active";
	OPT_UI_HOLIDAYNOTICE_SUGGESTIONSTABONLY = "On Suggestions tab only";
	OPT_UI_HOLIDAYNOTICE_TIP = "If there is a holiday event today (e.g. Brewfest or Darkmoon Faire), a graphical notice appears next to the achievement UI. Clicking it displays achievements for that event. Put your cursor over it for more details.";
	OPT_UI_HOLIDAYNOTICE_TIP2 = "|cffffffffTabs module with Suggestions tab is required.|r";

	OPT_LABEL_TRADESKILLUI = "Professions UI Modifications";
	OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING = "Indicate uncooked recipes for complete achievements";
	OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING_TIP = "If Overachiever's Trade module is enabled, then an achievement icon appears next to recipes that you need to cook in order to earn certain achievements. If this option is checked, then these icons will appear next to uncooked recipes even if the associated achievement is complete.";

	OPT_LABEL_STARTTOAST = "Holiday/Event Toasts";
	OPT_STARTTOAST_HOLIDAY = "Show today's holidays";
	OPT_STARTTOAST_HOLIDAY_TIP = "Show today's holidays in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MICROHOLIDAY = "Show today's micro-holidays";
	OPT_STARTTOAST_MICROHOLIDAY_TIP = "Show today's micro-holidays in toast notifications upon entering the game world.";
	OPT_STARTTOAST_BONUS = "Show today's bonus events";
	OPT_STARTTOAST_BONUS_TIP = "Show today's bonus events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_DUNGEON = "Show today's dungeon events";
	OPT_STARTTOAST_DUNGEON_TIP = "Show today's dungeon events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_PVPBRAWL = "Show today's PvP brawl";
	OPT_STARTTOAST_PVPBRAWL_TIP = "Show today's PvP brawl in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MISC = "Show today's misc. holidays";
	OPT_STARTTOAST_MISC_TIP = "Show today's miscellaneous \"holiday\" events in toast notifications upon entering the game world.";
	OPT_STARTTOAST_MISC_TIP2 = "These are events found in the default calendar as \"holidays\" but are neither considered full holidays nor covered by another category given here. Examples include WoW Anniversaries and raid release days (for new raids or difficulties, not weekly resets).";
	OPT_STARTTOAST_TIMEFADE = "Do not automatically hide";
	OPT_STARTTOAST_TIMEFADE_TIP = "Prevent toast notifications you don't interact with from fading after a few seconds.";
	OPT_STARTTOAST_ONLYCLICKFADE = "Require click to hide";
	OPT_STARTTOAST_ONLYCLICKFADE_TIP = "Prevent toast notifications from fading unless left- or right-clicked. (If unchecked, they will also fade if the cursor goes over them and then moves away.)";

	OPT_SELECTSOUND = "Incomplete Achievement Reminder Sound";
	OPT_SELECTSOUND_TIP = "Play the selected sound when an incomplete achievement reminder is added to the tooltip.";
	OPT_SELECTSOUND_TIP2 = "Sounds will only play once every 15 seconds.";
	OPT_SELECTSOUND_ANGLERCHECKPOLE = "Exclude fishing node reminders if pole is equipped";
	OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP = "Don't play reminder sound from fishing nodes if your fishing pole is equipped.";
	OPT_SELECTSOUND_CHECKCOMBAT = "Exclude kill reminders if in combat with creature";
	OPT_SELECTSOUND_CHECKCOMBAT_TIP = "Don't play reminder sound from needing to kill a creature while you are in combat with it.";

	OPT_LABEL_MISC = "Miscellaneous";
	OPT_THROTTLE_ACHLOOKUP = "Startup: Throttle achievement lookup";
	OPT_THROTTLE_ACHLOOKUP_TIP = "Overachiever looks up certain data on startup. If this is unchecked, lookup happens all at once while the UI is first loading. If checked, data is gathered over time after the player enters the world.|n|nThe advantage to throttled lookup is a faster initial loading time, but, for some users and on some characters, this can temporarily impact performance.";

	SOUND_BELL_ALLIANCE = "Bell - Alliance";
	SOUND_BELL_HORDE = "Bell - Horde";
	SOUND_BELL_NIGHTELF = "Bell - Night Elf";
	SOUND_DRUMHIT = "Drum Hit";
	SOUND_BELL_BOATARRIVED = "Bells - Boat Arrived";
	SOUND_GONG_TROLL = "Gong - Troll";
	SOUND_BELL_MELLOW = "Mellow Bells";
	SOUND_ENTERQUEUE = "Enter Queue";
	SOUND_HEARTHBIND = "Hearthstone Bind";
	SOUND_BELL_KARA = "Karazhan Bell";
	SOUND_DING_AUCTION = "Auction Ding";
	SOUND_BELL_AUCTION = "Auction Bells";
	SOUND_ALARM1 = "Alarm Clock 1";
	SOUND_ALARM2 = "Alarm Clock 2";
	SOUND_ALARM3 = "Alarm Clock 3";
	SOUND_MAP_PING = "Map Ping";
	SOUND_SIMON_DING = "Simon Ding";
	SOUND_SIMON_STARTGAME = "Simon Start Game";
	SOUND_SIMON_STARTLEVEL = "Simon Start Level";
	SOUND_YAR = "Yarrrr";
	SOUND_AGGRO_WARNING = "Aggro Warning";
	SOUND_AGGRO_PULLED = "Aggro Pulled";
	SOUND_GLYPH_CREATE_MAJOR = "Glyph Create Major";
	SOUND_GLYPH_CREATE_MINOR = "Glyph Create Minor";
	SOUND_GLYPH_DESTROY_MAJOR = "Glyph Destroy Major";
	SOUND_GLYPH_DESTROY_MINOR = "Glyph Destroy Minor";
	SOUND_BGTIMER = "Battleground Timer";
	SOUND_MEDAL_EXPIRES = "Medal Expires";
	SOUND_GARRISON_INVASION = "Garrison Invasion Alert";
}

local L, locale = OVERACHIEVER_STRINGS, GetLocale()

--if (locale == "enGB") then  -- English (EU)
-- Unfortunately, GetLocale() returns "enUS" even when "enGB" would be more appropriate, and the SHORTDATE
-- global string is defined incorrectly for enGB clients (it's set as it is for enUS), so we have to do things
-- this way:
if (ACHIEVEMENT_TOOLTIP_COMPLETE == "Achievement earned by %1$s on %3$d/%2$d/20%4$02d") then
	L["COMPLETEDATE"] = "Completed on %1$d/%2$02d/%3$02d";  -- 1 - day 2 - month 3 - year
end

function iclllocaleuim()

arallbuttonmaint			= "List for zone"
arallbuttontak				= "Tactics"
areachatlist1				= "raid"
areachatlist2				= "raid warning"
areachatlist3				= "officer"
areachatlist4				= "party"
areachatlist5				= "guild"
areachatlist6				= "say"
areachatlist7				= "yell"
areachatlist8				= "self only"

ralltitle2				= "This module informs about achievements in |cff00ff00current location|r, when you enter the instance. It can also remind whether boss in your target is a criteria for any achievement. P.S. '|cffff0000not tracked by addon|r' means that addon can't track current achievement and will not inform you if it is failed, '|cffff0000got not from boss|r' - the criteria of the achievement is not a boss kill, it may be some object or something else. In current frame you can see all group achievements available in current location"
ralltxt1				= "When you enter instance it informs:"
ralltxt2				= "only uncompleted achievements"
ralltxt3				= "all achievements, including already completed"
ralltxt4				= "only uncompleted achievements needed for 'glory of the hero/raider'"
ralltxt5				= "only achievements needed for 'glory of the hero/raider', including already completed"
ralltxt6				= "FULL version - ALL achievements I need, including normal/heroic boss kills etc"
ralltxt7				= "When you target boss it informs:"
ralltxt8				= "only uncompleted achievements"
ralltxt9				= "all achievements, including already completed"
ralltxt10				= "only uncompleted achievements needed for 'glory of the hero/raider'"
ralltxt11				= "only achievements needed for 'glory of the hero/raider', including already completed"
ralltxt12				= "FULL version - ALL achievements I need, including normal/heroic boss kills etc"
ralltxton				= "(enabled)"
ralltxtoff				= "(disabled)"
rallzonenotfound			= "Current location was not found in database."
rallachiverepl1				= "Not completed achievements in"
rallachiverepl2				= "You have completed all achievements in this location."
rallachiverepl3				= "Current location is not a raid or heroic dungeon."
rallachiverepl4				= "List of all achievements in"
rallachiverepl5				= "Group achievements for this location are not found in database."
rallachiverepl6				= "Achievements checking disabled."
rallachiverepl7				= "More than 10 achievements found (|cff00ff00%s|r). Full list is available in addon's options window (/achr - List for zone)"
rallachiverepl8				= "Uncompleted achievements for 'glory of the hero/raider' in"
rallachiverepl9				= "You have completed all achievements for 'glory of the hero/raider' in this zone."
rallachiverepl10			= "Full list of achievements needed for 'glory of the hero/raider' in"
rallachiverepl11			= "Achievements needed for 'glory of the hero/raider' were NOT found in this zone."
rallachiverepl12			= "Full list of uncompleted achievements in"
rallachiverepl13			= "Uncompleted achievements for"
rallachiverepl14			= "List of all achievements for"
rallachiverepl15			= "No achievements found for the current boss with options set."
rallachiverepl16			= "Uncompleted achievements for 'glory of the hero/raider' for"
rallachiverepl17			= "Full list of achievements needed for 'glory of the hero/raider' for"
rallachiverepl18			= "Full list of uncompleted achievements for"
rallnoaddontrack			= "NO addon tracking"
rallnotfromboss				= "not from boss"
rallmenutxt1				= "    List of achievements available in a current location"
rallachdonel1				= "completed"
rallachdonel2				= "uncompleted"
rallsend				= "Send"
rallwhisper				= "whisper:"
rallmenutxt2				= "    List of achievements by choosing location"
rallbutton2				= "Choose another location"
ralltitle3				= "This module shows achievements available in chosen location. You can send this info to chat"
ralltxt13				= "FULL version - ALL achievements from this location"
rallbutton3				= "<<< Back to settings"
rallmanualtxt1				= "Expansion:"
rallmanualtxt2				= "Difficulty:"
rallmanualtxt3				= "Location:"
rallachiverepl19			= "Full list of ALL achievements in"
ralltooltiptxt				= "Show on tooltip"
ralltooltiptxt2				= "RA: Found %s achievements"
ralltooltiptxt21			= "RA: Found achievements"
ralltooltiptxt3				= "More info: /raida"
rallchatshowboss			= "Show in chat"
rallmenutxt3				= "    Tactics for group achievements"
ralltitle33				= "'tactic: /raida' in chat displays tactics for achievments that may cause difficulties. Here you can see all tactics, it`s very useful if you enter dungeon for the first time. You can edit text and send it in chat. All changes applies for all characters.\nP.S. Send your comments or tactics to me, and they will be available in this addon to help others!\nP.S.2 Found many errors in english localization? Write me to get access to the curse project page to correct them!"
ralltactictext1				= "Choose achievement:"
ralltactictext2				= "need tactic"
ralltactictext3				= "tactic: /raida"
ralluilooktactic1			= "Show tactics"
rallnotfoundachiv1			= "uncompleted achievements were not found"
rallnotfoundachiv2			= "no achievements"
ralltacticbutsave1			= "Apply changes"
ralltacticbutsave2			= "Restore default tactic"
ralluilooktactic3			= "|cffff0000No tactic|r, maybe this achievement is easy to understand by it's description. If you want |cff00ff00to add your own tactic - input text here|r"
ralluilooktactic4			= "Changes are successfully saved."
ralluilooktactic5			= "Tactic"
ralldifparty				= "party"
ralldifraid				= "raid"
ramainbattleground = "battleground"
ralldifscenario   = "scenario"
ralldefaulttacticmain1			= "Addon will inform you in chat when it's possible to kill the boss!"
ralldefaulttacticmain2			= "Attention: your pets or totems could fail this achievement!"
ralldefaulttacticmain3			= "Achievement's failure will be saved to instance ID, and you can't reset it for that day"
rallachievekologarnhp1			= "800K - 1 mln"
rallachievekologarnhp2			= "3 mln - 4 mln"
rallglory         = "glory"
ralltextoptionCharAch = "Track only character achievement (not account)"

ralldefaulttactic1			= "There are ~85 Zombies in the entire street in the beginning, so you need:\n1. Kill 1st boss.\n2. 1.Drag 2nd boss to the door of the inn (he won't let you bring him inside, just bring him near the steps).\n3. 2.Give it a minute or two until you see the zombies respawning, then kill him.\n4. 3.Talk to Arthas, then clear the inn, kill the 3rd boss, and talk to Arthas again to get him to open the bookcase.\n5. 1 or 2 dps will turn back where you have killed the 2nd boss, other party will go forward.\n6. Simultaneously begin killing zombies in both locations until you get achievement"
ralldefaulttactic2			= "Simply stay on the Stairs and kill the Mobs. There will be NO more adds spawn after Novos shield brakes down and you engage him. So you don't need to pay attention to that anymore"
ralldefaulttactic3			= "Description: sometimes boss deals damage to enemies within 50 yards. For every enemy damaged in this way boss gains 1 stack of 'Consume'\nTactic: Nuke boss"
ralldefaulttactic4			= "Kill the necessary quantity of dinosaurs during the boss fight"
ralldefaulttactic5			= "Engage boss before he comes up and block the doors"
ralldefaulttactic6			= "Don't let snakes to attack someone for a long time! Kill them or just nuke boss quick"
ralldefaulttactic7			= "You have to interrupt all 'Transformation' casts, the cast time is increased by his health"
ralldefaulttactic8			= "In order to get the Residue debuff, you need to be hit by Eck's frontal cone ability: Eck Spit. After that kill last boss, without dying"
ralldefaulttactic9			= "Actually, the impale spell won't be cast on the highest threat target, so you either need 2 tanks. Kill boss after all party players will get impaled"
ralldefaulttactic10			= "Boss starts spawning sludges at 50% and stops at 25%. Wait that little ooze will become Iron Sludges that you need to kill"
ralldefaulttactic11			= "Permafrost is stacking every 2-3 sec. You can get LOS from boss using rocks or dispel it or nuke boss very quick"
ralldefaulttactic12			= "You have to pass through ice tunnel before the 3rd boss without your entire party get hit by ANY of the falling icicles\nYou can see where they are about to fall because a blue circle will appear ~5 seconds before it comes down"
ralldefaulttactic13			= "After you have cleared the final alley BEFORE mal'ganis, you enter an area wich doesn't look like the scourge taken it over. There are 2 ways, you can either go right to Mal'ganis OR you can go left. The infinite corruptor is LEFT, if there is still time on your timer"
ralldefaulttactic14			= "Description: Every 30 sec or so, boss will target one of your party members and channel a spell that makes you spawn a Corrupted Soul Fragment, what you are supposed to do is to run as far as you can from him, because when those souls spawn they start moving towards Bronjahm, and when they touch him, they dispawn. When boss` health is under 35% he teleports to the center of the room and stops moving.\nTactic: Kite him around the platform that's right before you pull him, and wait until all 4 souls will spawn, then nuke him quick. Corrupted Soul Fragment can be slowed"
ralldefaulttactic15			= "You have to make a rotation to interrupt 'Phantom Blast' cast"
ralldefaulttactic16			= "Boss goes immune for 45 seconds one time in the fight, wait and kill him without killing Chaotic Rifts (attention with AoE)"
ralldefaulttactic17			= "Individual achievement. Intense Cold stacks on players every 2 seconds. Movement breaks the effect. If you stand with out moving more than 5 sec - you fail your achievement. Attention, Keristrasza has another ability to freeze players for 10 sec, dispel it"
ralldefaulttactic18			= "Description: the second boss is random, it will be Argent Confessor Paletress or Eadric the Pure. Paletress summons only 1 of 25 memories for the fight"
ralldefaulttactic19			= "Description: 'Hammer of Justice' - stuns an enemy, rendering them vulnerable to 'Hammer of the Righteous' and unable to move or attack for 6 sec.\n'Hammer of the Righteous' - hurls a hammer that strikes an enemy for 14000 Holy damage. If the target is not affected by 'Hammer of Justice', this Hammer may be caught and thrown back at the caster.\nTactic: Bring boss to 25K HP and wait until he stuns someone, dispel that stun and on player's ability bar will appear only 1 spell 'throw a hammer back', use it!"
ralldefaulttactic20			= "Kill ghouls or kite boss if they begin casting Explosion"
ralldefaulttactic21			= "'Frost Tomb' - encases the target in a block of ice. Just kill boss without killing tombs, that boss will casts on random players"
ralldefaulttactic22			= "There are 2 Scourge Hulks near boss, you need 1 of them for achievement. On 50% boss will begin 'Ritual of the Sword', you have to kill Scourge Hulk after sword's explosion hits him"
ralldefaulttactic23			= "To kill Grauf you have to pull 3 harpoons using harpoon guns simultaneously"
ralldefaulttactic24			= "If you don't kill boss quick - he will cast 'Bane' on himself, you don't have to do damage to boss under this buff. Just nuke boss quick before this cast"
ralldefaulttactic25			= "Kill Ichor Globules quick while they are trying to merge with boss"
ralldefaulttactic26			= "Defense Control Crystals are located on the walls, don`t click them and don`t let mobs to make damage to Prison Seal"
ralldefaulttactic27			= "Every time you visit this dungeon, you will meet only 2 boss of 6 exist"
ralldefaulttactic28			= "If Ahn'kahar Guardian is near to boss - boss becomes immune to all damage, simply kite add from boss and kill boss quick"
ralldefaulttactic29			= "Bjarngrim has 3 Platform where he stops and get his Temporary Electrical Charge. Engage him while he got his Temporary Electrical Charge on"
ralldefaulttactic30			= "Sometimes boss strikes Volkhan's Anvil, creating 2 Molten Golems. Kill him before he creates more than 4 Golems"
ralldefaulttactic31			= "On the second (fly) phase Onyxia will cast Deep Breath, get away from her direction (she will pass by diagonal across the room), if you burn her down quick - she wouldn't cast this spell"
ralldefaulttactic32			= "On 65% Onyxia enters to the second phase, when she comes off the ground you have 10 seconds to run inside the caves forcing the whelp spawns. We can kill them slowly, but have to spawn them quickly. Everyone stack up and AoE them down"
ralldefaulttactic33			= "Gormok the Impaler throw snobolds on players. Don't kill %s of them. No AoE, no Pets, no Damage Reflect of any kind. They have to live all the way through the worms and still be alive when Icehowl dies to get achievement"
ralldefaulttactic34			= "Boss will submerge periodically (only if it has >35% HP) and spawn the necessary adds. Run from adds as much as possible while tanks tank them. No AoE, No Pets, No Damage reflect of any kind. Keep the adds alive through second submerge when more adds come out. When third submerge occurs, everyone group up and AoE them down. You will have 30 seconds to kill a couple more as they spawn near the walls during the third submerge. You do not have to kill boss to get achievement"
ralldefaulttactic35			= "This is an individual achievement. You must avoid Lava Strike, NOT the flame wall. Lava Strike is a targeted AoE, look up! Or die in the beginning of the fight and you will get it ;)"
ralldefaulttactic36			= "During the second phase (after boss reaches 50%) there will be some Scions of Eternity, when 1 of them die he leaves a hover disk, you need to take it and to do a killing blow to one of the Scion of Eternity"
ralldefaulttactic37			= "There are two ways to get this achievement: 1. Don't kill adds (No pets, No AoE, no Damage Reflect of any kind.) 2. Kill adds more than 15 yards from boss"
ralldefaulttactic38			= "Description: Thaddius casts 'Polarity Shift': Places either a Negative Charge or Positive Charge to all nearby enemy targets (debuff). Players near other players with the same Charge type increases each their damage. Players near other players with the opposite Charge type deal damage to nearby raid members and FAILS achievement\nTactic: Divide raid into 2 camps (+ and -), after switching polarity run to one of the camps depending of your new debuff"
ralldefaulttactic39			= "Pull abominations until the addon says that we have killed enough"
ralldefaulttactic40			= "During fight boss will cast bone spike on players (1 for 10 men and 3 for 25 men), they must be killed very quickly"
ralldefaulttactic41			= "Main Tank is on all adds, except Off tank is on Deformed adds, constantly kiting them. No DPS on adds, no DPS on boss. When we have at least one of all 5 different adds, DPS the boss to start phase 2. Adds have to stay alive until boss dies so still don't DPS them, even in phase 2. The five adds are: Cult Fanatic, Deformed Fanatic, Reanimated Fanatic, Cult Adherent, Reanimated Adherent. (Empowered Adherents don't count for this achievement, so kill them all!)"
ralldefaulttactic42			= "Very easy fight. Each individual person make sure not to visit the boat more than twice, and don't send too many people in one trip"
ralldefaulttactic43			= "Gas Spores will spawn three times, then the boss does an AoE that removes all stacks. In order to get a stack of 25% shadow resistance, you stand near a person with a spore until it explodes. Get two stacks, but don't get three"
ralldefaulttactic44			= "Boss casts disease on a random player. Don't dispel it, and when it wears off, it will spawn a little ooze. Try to keep all oozes away from all other oozes. If two little oozes are close to each other, they will transform in a big ooze. The big will explode and fail achievement if it consumes 5 more little oozes. So kill boss quick and don't merge oozes"
ralldefaulttactic45			= "One person will be turned into a big ugly monster and eating slime and stuff. As long as this person doesn't use 'Regurgitated Ooze' we win. DO NOT dispel the disease from this monster"
ralldefaulttactic46			= "There are 3 things (each caused by the empowered boss) which could cause you to lose this achievement.\n\nValanar: Empowered Shock Vortex. When he casts it, you must spread out quickly to avoid multiple people blowing up near one another.\n\nTaldaram: Empowered Ball of Flames. When this is cast, the player who it focuses needs to run away.\n\nKeleseth: Empowered Shadow Lance. Your Keleseth tank wants to have 4 stacks of the Dark Nucleii debuff up at all times"
ralldefaulttactic47			= "The achievement is obtained by making sure that every portal is taken by someone every time portals spawn. It doesn't matter who takes them as long as they all get taken. It's better if the healers take them, though. Addon will NOT track it on a heroic difficulty"
ralldefaulttactic48			= "'Mystic Buffet' - Buffets all nearby foes with magic every 6 sec., increasing magical damage taken by 10% per application. To reset stacks you have to get LOS from boss using Ice Tombs. It's difficult for tanks, their rotation is quite complicated. Or kill her in 35 sec after she gets <35% HP"
ralldefaulttactic49			= "This achievement must be done before boss reaches 70%, so no DPS on boss during this phase. Off-tank will take all adds, nobody else should be nearby at all. No DPS on adds. The only person that should get Necrotic Plague should be Off-tank, dispel it if he gets it until it's back on an add. If someone else somehow gets Necrotic Plague, they get near the adds before it is dispelled. Addon will announce when 30 stacks, then continue fight as normal!"
ralldefaulttactic50			= "Vile Spirits occur during the third phase (<40%). They explode when they get close to players, so everyone should be running from them. All range DPS switch to them and burn them down at range as fast as possible"
ralldefaulttactic51			= "This achievement is soloable. Pull as many Steelforged Defenders as you can and kill them"
ralldefaulttactic52			= "Individual achievement. Demolisher Passengers can be launched onto the Flame Leviathan, where they can kill Defense Turrets, to get the achievement you have to make a killing blow"
ralldefaulttactic53			= "Players can be launched onto the Flame Leviathan from the Demolisher vehicles to take out its turrets. Taking out all turrets activates Overload Circuit, which stuns the Leviathan, makes him take 50% more damage and clears the entire stack of Gathering Speed. This achievement requires the raid to ignore this mechanic"
ralldefaulttactic54			= "'Slag Pot' - Charges and grabs a random enemy target, tossing them into the caster's slag pot. The target takes 4500 Fire damage every second for 10 sec. Main tank is not afflicted by this ability"
ralldefaulttactic55			= "The Iron Constructs adds can gain the buff Heat by standing in the fire left by Ignis' Scorch. Once Heat reaches 10 stacks, the Constructs gain the buff Molten, which lasts for 20 seconds. If within this time frame they are kited to a pool of water they will loose the Molten buff and instead become Brittle for 15 seconds. A single blow dealing 5000 or more damage to a Brittle Construct will shatter it, causing an explosion. Doing this last step to 2 or more Constructs within a 5 second window will grant this achievement"
ralldefaulttactic56			= "Use Single Target DPS (avoid DoT effects) and bring all the Dark Rune Guardians down to less than 15,000 HP. Right before the ground phase ends Razorscale will Flame Breath the area directly in front of him. The counter does not reset at all"
ralldefaulttactic57			= "50% boss HP in 2 ground phase"
ralldefaulttactic58			= "Achievement description is not correct, it's difficult to understand what fails it"
ralldefaulttactic59			= "Do not allow any of the XS-013 Scrapbots to reach and heal X-002 Deconstructor on normal difficulty. These bots are spawned during the expose heart phases, every 25% HP interval. They ignore aggro and keep moving towards the Deconstructor. The scrapbots can be slowed and rooted"
ralldefaulttactic60			= "Every 25% HP interval, X-002 Deconstructors heart becomes exposed and adds are spawned, amongst them some XE-321 Boombots and many XS-013 Scrapbots which will move towards X-002. When XE-321 Boombots are killed they explode dealing damage to everything near them"
ralldefaulttactic61			= "Requires the player to be under the effect of the Iron Boot Flask when the last of the tree Iron Council bosses is killed. The flask can be purchased in Storm Peaks from Olut Alegut (H) or Rork Sharpchin (A)"
ralldefaulttactic62			= "Everyone stand in melee range, except 3 rangers, they will kite Focused Eye Beam"
ralldefaulttactic63			= "Kill arms and wait their respawn. DON'T do any damage to the boss"
ralldefaulttactic64			= "Burn the boss to %s HP, kill both arms simultaneously"
ralldefaulttactic65			= "The Feral Defender spawns after 1 minute and begins the fight with 8 stacks of Feral Essence. He can revive himself at the cost of 1 stack, so getting this achievement requires killing the Defender 9 times. Be ready to kill boss after last add's life, enrage will be near"
ralldefaulttactic66			= "Individual achievement. Storm Power buffs a player for 30 seconds regardless of where he stands, but the Toasty Fire and Starlight buffs appear to be limited to a random location, you have to get all that 3 buffs"
ralldefaulttactic67			= "Kill all Flash Freeze that will spawn on NPC"
ralldefaulttactic68			= "All raid members must avoid every Flash Freeze by standing on Snowdrifts. They are spawned after an Icicle fell on the ground"
ralldefaulttactic69			= "Do not allow a single raid member to get more than 2 stacks of Biting Cold while killing Hodir. Biting Cold stack size increase on the entire raid over time and each stack causes damage over time. Both movement and proximity to the Toasty Fires created by the mage adds will lower the amount of stacks. The dispelable close range Freeze and the avoidable Flash Freeze complicate using movement to clear the stack"
ralldefaulttactic70			= "You have 3 min to kill boss before he shatters his rare cache"
ralldefaulttactic71			= "Once the raid has completed the gauntlet and engaged Thorim, he will cast Lightning Charge every 15 seconds. It appears to be a cone based attack originating at Thorim and aimed at a lightning orb surrounding the arena"
ralldefaulttactic72			= "Both of these adds are encountered by the raid group that goes through the gauntlet. But all raid members will earn this achievement once you kill boss"
ralldefaulttactic73			= "The Dark Rune Warbringer - NPC that is spawned during the first phase, he gives the 'Aura' of Celerity aura. This NPC will have to be 'Mind controlled' to buff the party with this aura at the time Thorim is defeated. The aura radius is 40 yards"
ralldefaulttactic74			= "There will be 6 waves of adds. Kill 5 waves and then nuke boss with at least one wave alive"
ralldefaulttactic75			= "The entire raid must avoid the Proximity Mines from phase 1 and 4, the Rocket Strikes from phases 2 and 4 and the explosions of Bomb Bot adds from phase 3. The achievement can be done in increments, so avoiding all Bomb Bots will complete that condition and allow the raid to focus more on Proximity Mines or Rocket Strikes for the next week"
ralldefaulttactic76			= "One of the Assault Bots from 3 phase must be left alive for phase 4. In Phase 4, Mimiron again casts the lethal Rocket Strike at a location, preceded by a 3 second visible warning. Kite the Assault bot into this small area"
ralldefaulttactic77			= "Hard-mode. Don't kill any Saronite Crystals, wait when they transforms into Saronite Animus, kill him and after that - defeat boss"
ralldefaulttactic78			= "Use the /kiss emote on Sara in phase 2 of the Yogg-Saron encounter. Macro:\n/tar Sara\n/kiss"
ralldefaulttactic79			= "During phase 2, portals will open next to Yogg. When you go inside, you will be in one of the 3 visions"
ralldefaulttactic80			= "You start the fight with 100% sanity, which goes down when hit by his abilities. During the fight, Sanity Wells will spawn, which are used to restore some of your sanity over time when you stand near them (only if you ask Freya to help you). When a person reaches 0% sanity, they become mind controlled by Yogg-Saron till either one of them dies"
ralldefaulttactic81			= "Black Holes are formed when Collapsing Stars die. This achievement refer to the closing of Black Holes by kiting the Living Constellations into them simultaneously"
ralldefaulttactic82			= "Each time Lumbering Oaf uses his charge ability on a player, random number of Mine Rats spawn around the lumber pile which the player was smashed into. Count doesn't reset, so you can do it bit by bit"
ralldefaulttactic83			= "You need to avoid the reaper to take any damage during trash (maybe BUG) and bossfight to get this achievement (reaper is immune to fire damage - boss adds)"
ralldefaulttactic84			= "Individual achievement. Boss casts fire wall during all second phase"
ralldefaulttactic85			= "After each 'Asphyxiate' boss channels his heal 'Stay of Execution' interrupt it immediately"
ralldefaulttactic86			= "Adds (not boss) cast 'Unholy Empowerment' - interrupt all their casts"
ralldefaulttactic87			= "When adds come - make one of them get into Geyser. No need to kill Boss to get this achievment"
ralldefaulttactic88			= "Don't kill the Unyielding Behemoth until you get Tidal Surge effect on 3rd phase"
ralldefaulttactic89			= "Let zealots evolve 1 by 1 and burn them down as fast as you can (before they destroy your tank). They get evolved if you don't stand in a ray"
ralldefaulttactic90			= "Individual achievement. Jump when boss casts 'Static Cling' - so you don't get rooted by his ability, best way to get this achievement is to jump all the fight"
ralldefaulttactic91			= "To get him affected, you must kill an affected Trogg Dweller near him. Attention: 'Modgud's Malice' - Increases damage done by 100%"
ralldefaulttactic92			= "Achievement will be awarded to all party. There are more than 5 orbs in instance, you have to get only 5 of them. For example, 2 of them are above the platform of the 2nd boss, to get them - you have to use tornado during boss fight"
ralldefaulttactic93			= "When you enter the 'spirit world' at 50%, a Dark Hatchling will spawn. Every few seconds, a soul fragment will spawn that channels a heal on the Dark Hatchling. Move them into the flame patches transforming them into Burning Souls. Kill 3 of then and you will get achieve without killing a boss!"
ralldefaulttactic94			= "You can only perform half of this achievement on your first run here, and the other half on a subsequent run. If you want to be bitten (or to NOT be bitten) then speak up now. The more DPS we do, the less people will have to be bitten"
end

if (locale == "zhTW") then  -- Traditional Chinese
-- Thanks to user xyrho at wowinterface.com and laincat at curse.com for many of these translations:
L["ACH_ANGLER_COMPLETE"] = "已釣過"
--Translation missing 
-- L["ACH_ANGLER_COUNT"] = ""
L["ACH_ANGLER_INCOMPLETE"] = "未釣過"
L["ACH_BUNNYMAKER_COMPLETE"] = "已經使用春日鮮花"
L["ACH_BUNNYMAKER_INCOMPLETE"] = "需要使用春日鮮花"
L["ACH_CHECKYOURHEAD_COMPLETE"] = "已經使用增重的南瓜燈籠"
L["ACH_CHECKYOURHEAD_INCOMPLETE"] = "需要使用增重的南瓜燈籠"
--Translation missing 
-- L["ACH_CONSUME_91_COMPLETE"] = ""
--Translation missing 
-- L["ACH_CONSUME_91_INCOMPLETE"] = ""
L["ACH_CONSUME_COMPLETE"] = "已使用過"
L["ACH_CONSUME_INCOMPLETE"] = "需要使用"
L["ACH_CONSUME_INCOMPLETE_EXTRA"] = "未使用過"
L["ACH_FISHSCHOOL_FORMAT"] = "%s系"
L["ACH_FISTFULOFLOVE_COMPLETE"] = "已用過一把玫瑰花瓣"
L["ACH_FISTFULOFLOVE_INCOMPLETE"] = "需使用一把玫瑰花瓣"
L["ACH_LETITSNOW_COMPLETE"] = "已用過一捧雪花"
L["ACH_LETITSNOW_INCOMPLETE"] = "需使用一捧雪花"
L["ACH_LOVECRITTERS_COMPLETE"] = "已 /愛 過"
L["ACH_LOVECRITTERS_INCOMPLETE"] = "需要 /愛"
L["ACH_TURKEYLURKEY_COMPLETE"] = "已經使用過火雞獵槍"
L["ACH_TURKEYLURKEY_INCOMPLETE"] = "需要使用火雞獵槍"
L["ACH_WELLREAD_COMPLETE"] = "已讀過"
L["ACH_WELLREAD_INCOMPLETE"] = "未讀過"
L["BINDING_NAME_OVERACHIEVER_TAB_SEARCH"] = "開啟搜尋標籤頁面"
L["BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS"] = "開啟建議標籤頁面"
L["BINDING_NAME_OVERACHIEVER_TAB_WATCH"] = "開啟觀察標籤頁面"
L["COMPLETEDATE"] = "已完成 %2$d/%1$02d/%3$02d"
L["CRITTER"] = "小動物"
--Translation missing 
-- L["HOLIDAY_BREWFEST"] = ""
--Translation missing 
-- L["HOLIDAY_CHILDRENSWEEK"] = ""
--Translation missing 
-- L["HOLIDAY_DARKMOONFAIRE"] = ""
--Translation missing 
-- L["HOLIDAY_DAYOFTHEDEAD"] = ""
--Translation missing 
-- L["HOLIDAY_HALLOWSEND"] = ""
--Translation missing 
-- L["HOLIDAY_LOVEISINTHEAIR"] = ""
--Translation missing 
-- L["HOLIDAY_LUNARFESTIVAL"] = ""
--Translation missing 
-- L["HOLIDAY_MIDSUMMER"] = ""
--Translation missing 
-- L["HOLIDAY_MIDSUMMER_SHORT"] = ""
--Translation missing 
-- L["HOLIDAY_NOBLEGARDEN"] = ""
--Translation missing 
-- L["HOLIDAY_PIGRIMSBOUNTY"] = ""
--Translation missing 
-- L["HOLIDAY_PIRATESDAY"] = ""
--Translation missing 
-- L["HOLIDAY_WINTERVEIL"] = ""
--Translation missing 
-- L["HOLIDAY_WINTERVEIL_SHORT"] = ""
L["INCOMPLETE"] = "未完成"
L["KILL_COMPLETE"] = "已擊殺"
L["KILL_INCOMPLETE"] = "需要擊殺"
L["MSG_ACHNOTFOUND"] = "找不到該成就。"
--Translation missing 
-- L["MSG_CRITERIAPROGRESS"] = ""
L["MSG_INVALIDID"] = "無效輸入：沒有成就有這編號。"
L["MSG_NAMENOTFOUND"] = "沒有包含 \"|cffffffff%s|r\" 的成就名稱被找到。"
L["MSG_NUMFOUNDLIST"] = "另外找到 %s 項成就："
L["MSG_ONEFOUND"] = "找到 1 項成就："
L["MSG_OPENINGTO"] = "開啟："
--Translation missing 
-- L["MULTI_NEED"] = ""
L["OPT_ACHUNKNOWN"] = "<未知>"
L["OPT_ANGLERTIPS"] = "提示魚點是否釣過？"
L["OPT_ANGLERTIPS_TIP"] = "如果成就有缺少，新增一行提示到魚點的標準說明從任何你需要來釣魚的魚點。"
--Translation missing 
-- L["OPT_ANGLERTIPS_TIP_ALWAYS"] = ""
L["OPT_AUTOTRACK_CRITERIATOAST"] = "自動追蹤彈出的 \"成就進度\""
L["OPT_AUTOTRACK_CRITERIATOAST_TIP"] = "\"成就進度\" 訊息彈出時，自動追蹤成就 (沒有超過追蹤數量上限時)。"
L["OPT_AUTOTRACKEXPLORE"] = "自動追蹤探索成就"
L["OPT_AUTOTRACKEXPLORE_COMPLETED"] = "包括已完成的成就"
L["OPT_AUTOTRACKEXPLORE_TIP"] = "轉換地圖時自動追蹤該區域探索成就。"
L["OPT_AUTOTRACKTIMED"] = "自動追蹤計時相關的成就 (戰場除外)"
L["OPT_AUTOTRACKTIMED_BG"] = "自動追蹤計時相關的戰場成就"
L["OPT_AUTOTRACKTIMED_TIP"] = "開始計時的時候自動追蹤有時間限制標準的成就。如果已經達到能夠追蹤的成就數量上限，會嘗試取代自動追蹤的探索成就；否則將不會被追蹤。|n|n不包含需要戰場勝利的成就。"
L["OPT_AUTOTRACKTIMED_TIP_BG"] = "戰場配對開始時，自動追蹤在特定時間內勝利的成就 (如果尚未完成的話)。|n|n離開戰場時會取消追蹤成就。"
L["OPT_BUNNYMAKERTIPS"] = "新增任何你需要許用春日鮮花"
L["OPT_BUNNYMAKERTIPS_TIP"] = "如果這個成就尚未完成，在18級以上女性玩家的提示訊息中提示你是否需要對她使用春日鮮花。注意假如是大於你10級的敵對角色，會被假設為至少18級。"
L["OPT_CHECKYOURHEADTIPS"] = "提示是否需要使用增重的南瓜燈籠"
L["OPT_CHECKYOURHEADTIPS_TIP"] = "如果這個成就尚未完成，在玩家的提示訊息中提示你是否需要對他使用增重的南瓜燈籠。"
L["OPT_CONSUMEITEMTIPS"] = "提示食物是否吃過？"
L["OPT_CONSUMEITEMTIPS_TIP"] = "增加食物提示說明"
L["OPT_CONSUMEITEMTIPS_TIP2"] = "如果你的等級不足以食用這個物品時，將不做提示"
L["OPT_CONSUMEITEMTIPS_WHENCOMPLETE"] = "完成後是否繼續提示"
L["OPT_CRITERIATOAST_CHATLOG"] = "新增到聊天內容"
L["OPT_CRITERIATOAST_CHATLOG_TIP"] = "\"成就進度\" 訊息彈出時，連結成就並且在聊天內容中顯示達成條件。"
L["OPT_CRITERIATOAST_SUGGEST"] = "新增到近期提醒 (建議)"
L["OPT_CRITERIATOAST_SUGGEST_TIP"] = "\"成就進度\" 訊息彈出時，將成就暫時加入到建議標籤頁做為 \"近期提醒\"。"
L["OPT_CRITTERTIPS"] = "提示小動物是否愛過"
L["OPT_CRITTERTIPS_TIP"] = "在小動物的提示說明中註明."
L["OPT_DRAGGABLE"] = "可拖曳移動"
L["OPT_DRAGSAVE"] = "記住視窗位置"
L["OPT_FISTFULOFLOVETIPS"] = "提示是否需要使用一把玫瑰花瓣"
L["OPT_FISTFULOFLOVETIPS_TIP"] = "增加玩家提示說明。"
L["OPT_KILLCREATURETIPS"] = "新增您是否需要殺死的怪物"
L["OPT_KILLCREATURETIPS_TIP"] = "新增一行動物提示(不包括小動物 )需要加以殺害，以符合標準的未完成的成就說明，表明您是否仍然需要殺死他們。"
L["OPT_KILLCREATURETIPS_TIP2"] = "注意：在啟動時(或是這設定啟用)，每個成就會被掃描來找出單位編號。並非所有成就提供編號。大部分如此，但是其中的生物的提示不會因為這設定而有改變。"
--Translation missing 
-- L["OPT_LABEL_ACHFIVE"] = ""
L["OPT_LABEL_ACHFOUR"] = "\"%s,\" \"%s,\"|n\"%s,\" \"%s\""
--Translation missing 
-- L["OPT_LABEL_ACHSEVEN"] = ""
L["OPT_LABEL_ACHSIX"] = "\"%s,\" \"%s,\"|n\"%s,\" \"%s\"|n\"%s,\" \"%s\""
L["OPT_LABEL_ACHTHREE"] = "\"%s,\" \"%s,\" 和 \"%s\""
L["OPT_LABEL_ACHTWO"] = "\"%s\" 和 \"%s\""
L["OPT_LABEL_CRITERIATOAST"] = "進度相關動作 (不追蹤)"
--Translation missing 
-- L["OPT_LABEL_DRAENORANGLER"] = ""
L["OPT_LABEL_MAINUI"] = "成就視窗微調"
L["OPT_LABEL_NEEDTOKILL"] = "擊殺怪物成就 (\"%s\",\"%s\",及其他)"
L["OPT_LABEL_SEASONALACHS"] = "世界事件成就"
L["OPT_LABEL_STARTTOAST"] = "節慶/事件彈出通知"
L["OPT_LABEL_TOOLTIPS"] = "成就提示和連結"
L["OPT_LABEL_TRACKING"] = "成就追蹤"
L["OPT_LABEL_TRADESKILLUI"] = "專業視窗微調"
L["OPT_LETITSNOWTIPS"] = "提示是否需要使用一捧雪花？"
L["OPT_LETITSNOWTIPS_TIP"] = "如果成就尚未完成，在適當種族與職業組合玩家的提示訊息中提示你是否需要使用一捧雪花。"
L["OPT_PESTCONTROLTIPS"] = "顯示是否需要擊殺害蟲的提示"
L["OPT_PESTCONTROLTIPS_TIP"] = "如果這個成就尚未完成，在那些害蟲的提示訊息中提示你是否需要擊殺牠們。"
L["OPT_SATISFIEDTIPS"] = "1000%滿足?"
--Translation missing 
-- L["OPT_SATISFIEDTIPS_TIP"] = ""
L["OPT_SELECTSOUND"] = "缺少成就提醒音效"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE"] = "裝備魚竿時不提示釣魚成就"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP"] = "裝備魚竿時不聲音提示釣魚成就"
L["OPT_SELECTSOUND_CHECKCOMBAT"] = "戰鬥對象正確時不提示擊殺成就"
L["OPT_SELECTSOUND_CHECKCOMBAT_TIP"] = "正在與成就所需要擊殺的生物戰鬥時，不要播放提醒音效。"
L["OPT_SELECTSOUND_TIP"] = "在發現一個需要完成的成就提示時播出提示音效"
L["OPT_SELECTSOUND_TIP2"] = "這個聲音每15秒只會出現1次"
L["OPT_SHOWID"] = "顯示成就ID"
L["OPT_SHOWPROGRESS"] = "顯示進度"
L["OPT_SHOWPROGRESS_OTHER"] = "比較其他人的進度連結"
L["OPT_SHOWPROGRESS_OTHER_TIP"] = "在別人的成就訊息連結說明中顯示自己的進度."
L["OPT_SHOWPROGRESS_TIP"] = "在提示說明中顯示成就進度."
L["OPT_STARTTOAST_BONUS"] = "顯示今天的獎勵事件"
L["OPT_STARTTOAST_BONUS_TIP"] = "進入遊戲時顯示今天的獎勵事件彈出通知。"
L["OPT_STARTTOAST_DUNGEON"] = "顯示今天的地城事件"
L["OPT_STARTTOAST_DUNGEON_TIP"] = "進入遊戲時顯示今天的地城事件彈出通知。"
L["OPT_STARTTOAST_HOLIDAY"] = "顯示今天的節慶"
L["OPT_STARTTOAST_HOLIDAY_TIP"] = "進入遊戲時顯示顯示今天的節慶彈出通知。"
L["OPT_STARTTOAST_MICROHOLIDAY"] = "顯示今天的小型節慶"
L["OPT_STARTTOAST_MICROHOLIDAY_TIP"] = "進入遊戲時顯示今天的小型節慶彈出通知。"
L["OPT_STARTTOAST_ONLYCLICKFADE"] = "需要滑鼠點擊來隱藏通知"
L["OPT_STARTTOAST_ONLYCLICKFADE_TIP"] = "彈出通知不會自動消失除非使用滑鼠左鍵或右鍵點擊。 (停用時，滑鼠游標指向通知然後移開便會消失。)"
L["OPT_STARTTOAST_TIMEFADE"] = "不要自動隱藏"
L["OPT_STARTTOAST_TIMEFADE_TIP"] = "避免尚未使用滑鼠指向或點擊的彈出通知在幾秒後隱藏。"
L["OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING"] = "標示未烹飪食譜來完成成就"
L["OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING_TIP"] = "如果Overachiever_Trade模組啟用，那麼成就圖示顯示在你需要烹飪的食譜旁邊為了獲得一些成就。如果設定被勾選，那麼這些圖示會顯示在未被烹飪食譜旁邊即使相關成就已經完成。"
L["OPT_TURKEYLURKEYTIPS"] = "提示是否需要使用火雞獵槍"
L["OPT_TURKEYLURKEYTIPS_TIP"] = "如果成就尚未完成，在玩家的提示訊息中提示你是否需要對他使用火雞獵槍。"
L["OPT_UI_HOLIDAYNOTICE"] = "節慶事件開始時顯示提醒通知"
L["OPT_UI_HOLIDAYNOTICE_SUGGESTIONSTABONLY"] = "只顯示於建議標籤頁面"
L["OPT_UI_HOLIDAYNOTICE_TIP"] = "如果今天有節慶事件 (例如 啤酒節 或 暗月馬戲團)，成就介面旁會顯示提醒通知的圖形。點一下通知圖形顯示這個事件的成就，滑鼠指向時會顯示更多詳細說明。"
L["OPT_UI_HOLIDAYNOTICE_TIP2"] = "|cffffffff需要載入標籤頁模組和建議標籤頁面。|r"
L["OPT_UI_PROGRESSIFOTHERCOMPLETED"] = "滑鼠提示中顯示當前角色的數量進度"
L["OPT_UI_PROGRESSIFOTHERCOMPLETED_TIP"] = "滑鼠指向以數量為主的成就 (例如 \"獲得10個坐騎\") 若是由其他角色完成，當前的角色尚未完成，仍要顯示當前角色的進度。"
L["OPT_UI_REQUIREDFORMETATIP"] = "顯示其他需要此成就來完成的提示"
L["OPT_UI_REQUIREDFORMETATIP_TIP"] = "當游標位於一個成就，需要獲得的另一項成就，顯示成就樹名稱。"
L["OPT_UI_SERIESTIP"] = "顯示系列成就的提示"
L["OPT_UI_SERIESTIP_TIP"] = "當滑鼠指向一個系列成就時，顯示系列中其他成就的名字和與目前成就的關係"
L["OPT_WELLREADTIPS"] = "提示書本是否閱讀過"
L["OPT_WELLREADTIPS_TIP"] = "增加書本提示說明."
L["OPTPANEL_REMINDERTOOLTIPS"] = "滑鼠提示提醒"
--Translation missing 
-- L["OVERACHIEVER_INSTALLED_MSG"] = ""
--Translation missing 
-- L["OVERACHIEVER_INSTALLED_TOAST"] = ""
--Translation missing 
-- L["OVERACHIEVER_UPDATED_MSG"] = ""
--Translation missing 
-- L["OVERACHIEVER_UPDATED_TOAST"] = ""
L["PROGRESS"] = "進度"
L["PROGRESSIFOTHERCOMPLETED"] = "%s的進度"
--Translation missing 
-- L["RECENTREMINDERCRITERIA"] = ""
L["REQUIREDFORMETATIP"] = "需要："
L["SERIESTIP"] = "系列成就:"
--Translation missing 
-- L["SOUND_AGGRO_PULLED"] = ""
--Translation missing 
-- L["SOUND_AGGRO_WARNING"] = ""
L["SOUND_ALARM1"] = "鬧鈴聲 1"
L["SOUND_ALARM2"] = "鬧鈴聲 2"
L["SOUND_ALARM3"] = "鬧鈴聲 3"
L["SOUND_BELL_ALLIANCE"] = "提示音效 - 聯盟"
L["SOUND_BELL_AUCTION"] = "拍賣場音效"
L["SOUND_BELL_BOATARRIVED"] = "提示音效 - 船進港時"
L["SOUND_BELL_HORDE"] = "提示音效 - 部落"
L["SOUND_BELL_KARA"] = "卡拉贊音效"
L["SOUND_BELL_MELLOW"] = "柔和的鈴聲"
L["SOUND_BELL_NIGHTELF"] = "提示音效 - 夜精靈"
--Translation missing 
-- L["SOUND_BGTIMER"] = ""
L["SOUND_DING_AUCTION"] = "拍賣場音效"
L["SOUND_DRUMHIT"] = "擊鼓聲"
L["SOUND_ENTERQUEUE"] = "進入佇列"
--Translation missing 
-- L["SOUND_GARRISON_INVASION"] = ""
--Translation missing 
-- L["SOUND_GLYPH_CREATE_MAJOR"] = ""
--Translation missing 
-- L["SOUND_GLYPH_CREATE_MINOR"] = ""
--Translation missing 
-- L["SOUND_GLYPH_DESTROY_MAJOR"] = ""
--Translation missing 
-- L["SOUND_GLYPH_DESTROY_MINOR"] = ""
L["SOUND_GONG_TROLL"] = "銅鑼音效"
L["SOUND_HEARTHBIND"] = "爐石束縛"
L["SOUND_MAP_PING"] = "點擊地圖音效"
--Translation missing 
-- L["SOUND_MEDAL_EXPIRES"] = ""
L["SOUND_SIMON_DING"] = "賽門音效"
L["SOUND_SIMON_STARTGAME"] = "賽門遊戲開始音效"
L["SOUND_SIMON_STARTLEVEL"] = "賽門等級開始音效"
L["SOUND_YAR"] = "Yarrrr音效"
L["STARTTOAST_EVENT"] = "今日正在舉行"
--Translation missing 
-- L["WILDPET"] = ""
L["YOURPROGRESS"] = "你的進度"


function iclllocaleui()

ralldifscenario = "事件"
	arallbuttonmaint = "區域列表"
	arallbuttontak = "戰術"
		areachatlist1 = "團隊"
	areachatlist2 = "團隊警报"
	areachatlist3 = "官員"
	areachatlist4 = "隊伍"
	areachatlist5 = "公會"
	areachatlist6 = "說"
	areachatlist7 = "大喊"
	areachatlist8 = "僅自己"
ralltitle2				= "這個模塊當你進入副本時會通知在|cff00ff00當前區域|r的相關成就。它也可以在你選擇首領為目標時提示任何一個成就的條件。附：'|cffff0000插件不會追蹤|r'意味著插件無法追蹤當前成就並且如果成就失敗也不會通知你，'|cffff0000不是來自首領|r' - 成就的條件不是擊殺首領，它可能是一些物件或其他的東西。在當前框體中你可以查看當前區域中所有的小隊可用成就。"
ralltxt1				= "它當你進入副本時通知："
ralltxt2				= "只是未完成的成就"
ralltxt3				= "全部成就，包括已完成的"
ralltxt4				= "只是“英雄/團隊的榮耀”的所需未完成成就"
ralltxt5				= "只是“英雄/團隊的榮耀”的所需成就，包括已完成的"
ralltxt6				= "全版本 - 我所需的成就，包括普通/英雄首領的擊殺等"
ralltxt7				= "它當你選擇首領為目標時通知："
ralltxt8				= "只是未完成的成就"
ralltxt9				= "全部成就，包括已完成的"
ralltxt10				= "只是“英雄/團隊的榮耀”的所需未完成成就"
ralltxt11				= "只是“英雄/團隊的榮耀”的所需成就，包括已完成的"
ralltxt12				= "全版本 - 我所需的成就，包括普通/英雄首領的擊殺等"
ralltxton				= "（啟用）"
ralltxtoff				= "（禁用）"
rallzonenotfound			= "在數據庫中沒有發現當前區域。"
rallachiverepl1				= "未完成的成就"
rallachiverepl2				= "你已經完成了在這個區域中的所有成就。"
rallachiverepl3				= "您現在的區域不是一個團隊副本或英雄地下城。"
rallachiverepl4				= "全部成就列表"
rallachiverepl5				= "數據庫中未找到此區域的小隊成就。"
rallachiverepl6				= "成就追蹤已禁用。"
rallachiverepl7				= "發現超過10個以上的成就（|cff00ff00%s|r）。在插件選項窗口中列出全部的可用成就（/achr - 區域列表）"
rallachiverepl8				= "在“英雄/團隊的榮耀”中未完成的成就。"
rallachiverepl9				= "您已經完成了此區域“英雄/團隊的榮耀”中的所有成就。"
rallachiverepl10			= "全部“英雄/團隊的榮耀”所需的成就列表"
rallachiverepl11			= "“英雄/團隊的榮耀”所需的成就在此區域未找到。"
rallachiverepl12			= "全部未完成的成就列表"
rallachiverepl13			= "未完成的成就"
rallachiverepl14			= "全部的成就列表"
rallachiverepl15			= "沒有在當前首領設置選項中發現成就。"
rallachiverepl16			= "在“英雄/團隊的榮耀”中未完成的成就"
rallachiverepl17			= "全部“英雄/團隊的榮耀”所需的成就列表"
rallachiverepl18			= "全部未完成的成就列表"
rallnoaddontrack			= "插件不會追蹤"
rallnotfromboss				= "不是來自首領"
rallmenutxt1				= "    在當前區域中的可用成就列表"
rallachdonel1				= "完成"
rallachdonel2				= "未完成"
rallsend				= "發送"
rallwhisper				= "密語："
rallmenutxt2				= "    所選區域的成就列表"
rallbutton2				= "選擇其他區域"
ralltitle3				= "這個模塊在選定區域中顯示可用的成就。你可以發送這些信息到聊天頻道。"
ralltxt13				= "全版本 - 此區域的全部成就"
rallbutton3				= "<<< 返回設置"
rallmanualtxt1				= "版本："
rallmanualtxt2				= "難度："
rallmanualtxt3				= "區域："
rallachiverepl19			= "全部列表中的所有成就"
ralltooltiptxt				= "顯示提示"
ralltooltiptxt2				= "RA：找到%s成就"
ralltooltiptxt21			= "RA：找到的成就"
ralltooltiptxt3				= "更多信息：/raida"
rallchatshowboss			= "顯示在聊天頻道"
rallmenutxt3				= "    小隊成就戰術"
ralltitle33				= "'戰術：/raida'在聊天頻道顯示成就的戰術可能會造成困難。在這裏你可以看到所有的戰術，如果你是首次進入地下城它會非常有用。你可以編輯文本在聊天頻道發送。所有更改將使用於所有人物。\n附1：請將您的戰術或意見發送給我，讓這個插件可以幫助更多的人！\n附2：在簡體中文本地化中發現大量錯誤？請通過Curse的項目頁面寫郵件給我來糾正他們！"
ralltactictext1				= "選擇的成就："
ralltactictext2				= "需要戰術"
ralltactictext3				= "戰術：/raida"
ralluilooktactic1			= "顯示戰術"
rallnotfoundachiv1			= "沒有發現未完成的成就"
rallnotfoundachiv2			= "沒有成就"
ralltacticbutsave1			= "應用更改"
ralltacticbutsave2			= "恢復默認戰術"
ralluilooktactic3			= "|cffff0000無戰術|r，這個成就可能很容易通過描述理解。如果你想|cff00ff00添加自己的戰術 - 在這裏輸入文本|r"
ralluilooktactic4			= "更改保存成功。"
ralluilooktactic5			= "戰術"
ralldifparty				= "隊伍"
ralldifraid				= "團隊"
ralldefaulttacticmain1			= "當可以擊殺首領時插件會在聊天頻道通知你！"
ralldefaulttacticmain2			= "註意：你的寵物或圖騰可能會造成這個成就失敗！"
ralldefaulttacticmain3			= "成就失敗將保存副本ID，並且在那一天你不能重置它"
rallachievekologarnhp1			= "80萬 - 1百萬"
rallachievekologarnhp2			= "3百萬 - 4百萬"
rallglory = "榮耀"

ralldefaulttactic1			= "在開始時整個街道約有85個僵屍，所以你需要：\n1.殺死1號首領。\n2.1.將2號首領拖到市政廳的大門口（並不是讓你把它帶到裏面，只是把他帶到附近的步驟）。\n3.2.給它一兩分鐘時間直到你看到僵屍重生，然後殺了他。\n4.3.和阿薩斯對話，然後清理市政廳，殺死3號首領，並再次和阿薩斯交談讓他打開書櫃。\n5.1到2個DPS會回到你殺死2號首領的地方，其他隊員繼續向前走\n6.同時在這兩個位置開始殺死僵屍直到你獲得成就。"
ralldefaulttactic2			= "僅停留在樓梯上並殺死小怪。諾沃司的護盾降下之後不會有更多的小怪刷新了並且你會和他交戰。所以再也不需要你註意樓梯上的小怪了。"
ralldefaulttactic3			= "描述：有時首領會對50碼範圍內的敵人造成傷害。每個受到該傷害的敵人都會使首領堆疊1層'吞噬'效果。\n戰術：全力輸出首領。"
ralldefaulttactic4			= "在首領戰鬥過程中殺死必要數量的恐龍。"
ralldefaulttactic5			= "在他上到平臺並封鎖門之前和首領開戰。"
ralldefaulttactic6			= "不要讓蛇攻擊某個人很長一段時間！殺死他們或者迅速的全力輸出首領。"
ralldefaulttactic7			= "你必須打斷所有施放的'變形'法术，施法時間會隨著他的血量降低而加快。"
ralldefaulttactic8			= "為了獲得埃克殘渣的減益效果，你需要被埃克正面錐形範圍的技能擊中：埃克噴吐。在那之後在沒有死亡的情況下殺死最後的首領。"
ralldefaulttactic9			= "事實上，刺穿法術不會對威脅值最高的目標施放，所以你可能需要2個坦克。所有隊伍玩家都受到刺穿之後擊殺首領。"
ralldefaulttactic10			= "首領在50%開始召喚軟泥並在25%停止。等待那些小軟泥變成你需要殺死的那些鐵淤泥。"
ralldefaulttactic11			= "極寒冰霜每2-3秒堆疊一次。你可以使用的薩鋼來阻擋首領的視線或者驅散它或者非常迅速的全力輸出首領。"
ralldefaulttactic12			= "你必須在你的全部隊員沒有被任何掉落的冰柱擊中的情況下通過第三個首領之前的冰隧道。\n你可以看到他們即將在那裏落下是因為他落下約5秒之前會出現一個藍色的圓圈。"
ralldefaulttactic13			= "你已經清理完了最後的巷子在瑪爾加尼斯的前面，你進入了一個區域看起來不像是被天災占領過的。有2條路，你可以選擇向右走到瑪爾加尼斯或者你可以向左走。恆龍墮落者是在左邊，如果你的計時器上仍然有時間。"
ralldefaulttactic14			= "描述：每30秒左右，首領將你的隊伍成員之一作為目標施放一個通道法術並生成一個腐化的殘缺之魂，他應該做的事情是跑的離首領盡可能的遠，因為當那些殘缺之魂生成他們就會開始向布朗吉姆移動，並且當他們接觸到首領時消失。當首領的血量低於35%時他會傳送到房間的中心並停止移動。\n戰術：在輸出他之前在他的平臺周圍風箏他那是正確的，並等待直到全部的4個靈魂殘片都生成，然後迅速的全力輸出他。腐化的殘缺之魂可以被減速。"
ralldefaulttactic15			= "你必須輪流打斷施放的每個'魅影衝擊'。"
ralldefaulttactic16			= "在戰鬥中首領每45秒進入一次免疫狀態，等待並在沒有摧毀混沌裂隙的情況下殺死他（註意範圍傷害技能）。"
ralldefaulttactic17			= "個人成就。劇寒每2秒在玩家身上疊加一層。移動來移除這個效果。如果你站著超過5秒沒有移動 - 你會讓你的成就失敗。註意，凱瑞史卓莎有另一個將玩家凍結10秒的技能，驅散它。"
ralldefaulttactic18			= "描述：第二個首領是隨機的，它將會是銀白告解者帕爾璀絲或『純淨者』埃卓克。帕爾璀絲在戰鬥中召喚的只是25個回憶中的1個。"
ralldefaulttactic19			= "描述：'制裁之錘' - 擊暈一名敵人，使其更易受到公正之錘的傷害，並且在6秒內無法移動或攻擊。\n'公正之錘' - 擲出一把錘子攻擊敵人造成14000點神聖傷害。若目標未受到制裁之錘的影響，錘子將會被接住並且丟回給施法者。\n戰術：輸出首領至25000血量並等待直到有人被他擊暈，驅散那擊暈並且玩家的技能藍上會只出現1個法術'反擲一柄錘子'，使用它！"
ralldefaulttactic20			= "當他開始施放食屍鬼爆炸時殺死食屍鬼或者風箏走首領。"
ralldefaulttactic21			= "'冰霜之墓' - 將目標困在寒冰障壁中。只要殺死首領而不用擊碎冰霜之墓，首領將會對隨機玩家施放。"
ralldefaulttactic22			= "首領附近有2個天譴巨怪，你需要他們中的其中1個來完成成就。首領在50%時會開始施放'劍之儀式'，你要在劍之儀式爆炸擊中他之後殺死天災巨人。"
ralldefaulttactic23			= "要殺死古拉夫你要拔出3根魚叉同時使用魚叉炮。"
ralldefaulttactic24			= "如果你殺首領不夠迅速 - 他會在自己身上施放'災禍'，你不能在首領存在這個效果的情況下受到傷害。只要在他施放這個之前迅速的全力輸出首領。"
ralldefaulttactic25			= "在他們正試圖與首領合併時迅速殺死膿液水珠。"
ralldefaulttactic26			= "防禦控制水晶是位於墻壁上的，不要點擊它們並且不要讓小怪破壞監獄的封印。"
ralldefaulttactic27			= "當你每次參與這個地下城，你會遇見的只是存在的6個中的其中2個首領。"
ralldefaulttactic28			= "如果安卡哈守護者靠近首領 - 首領將變得免疫所有傷害，只需要風箏首領召喚的安卡哈守護者並迅速殺死首領。"
ralldefaulttactic29			= "有3平臺畢亞格林將軍他會在那裏停下並且獲得間歇電能。在他獲得間歇電能的同時與他開戰。"
ralldefaulttactic30			= "首領有時會擊打渥克瀚的鐵砧，創造出2個熔岩魔像。在他創造4個魔像之前殺死他。"
ralldefaulttactic31			= "在第二階段（空中）奧妮克希亞會施放深呼吸，遠離能夠受到她深呼吸的方向（她將通過整個房間的對角線），如果你的輸出使她的血掉的足夠迅速 - 她不會施放這個法術。"
ralldefaulttactic32			= "奧妮克希亞在65%進入第二階段，當她離開地面時你有10秒的時間跑入洞穴內迫使孵化出幼龍。我們可以慢慢殺死他們，但是他們孵化很迅速。所有人聚集起來後使用群體傷害技能殺死他們。"
ralldefaulttactic33			= "『穿刺者』戈莫克會對玩家投擲狗頭人奴隸。不要將他們中的%s個殺死。沒有範圍技能，沒有寵物，沒有任何形式的濺射傷害。讓他們一直活著經過蟄猛巨蟲的戰鬥，當冰嚎死亡時仍然活著來獲得的成就。"
ralldefaulttactic34			= "首領將周期性的下潛（只有當他>35%血量時）並產生無法避免的甲蟲群。刷新的甲蟲群使用盡可能多的坦克同時坦克他們。沒有範圍技能，沒有寵物，沒有任何形式的濺射傷害。當越來越多的甲蟲群刷新出來，請保持這些甲蟲群活著通過第二次下潛。當第三次下潛時，所有小組聚集起來後使用群體傷害技能殺死他們。在第三次下潛期間墻壁附近會生成的更多數量的甲蟲群，你會有30秒的時間來殺死他們。你不用殺死首領來取得成就。"
ralldefaulttactic35			= "這是一個個人成就。你必須避免熔岩打擊，而不是火墻。熔岩打擊是一個對範圍目標傷害的技能，在戰鬥中將它查找出來！或者在戰鬥開始時死亡將會獲得它:)"
ralldefaulttactic36			= "在第二階段期間（首領到達50%以後）將會出現一些奧核領主，當他們中的其中1個死亡後會留下一個飛行圓盤，你需要占用它並且對永恆之裔造成最後的致命一擊。"
ralldefaulttactic37			= "有兩種方法獲得這個成就：1.不要殺死信奉者（沒有寵物，沒有範圍技能，沒有任何形式的濺射傷害。）2.從距離首領15碼以上的地方殺死信奉者。"
ralldefaulttactic38			= "描述：泰迪斯會施放'兩極移形'：對周圍所有敵方目標設置一個負級效應或正級效應。與身邊玩家擁有同級效應的玩家可使彼此造成的傷害提高。與身邊玩家擁有不同級效應的玩家將對周圍其他團隊成員造成傷害並且成就失敗。\n戰術：團隊分成2個區域（+ 和 -），極性轉化之後跑向那個區域取決於你新的減益效果。"
ralldefaulttactic39			= "拉出憎惡體擊殺直到插件告訴我們已經殺死足夠的數量。"
ralldefaulttactic40			= "在戰鬥中首領將會對玩家施放穿刺（10人1個和25人3個），必須非常迅速的擊殺他們。"
ralldefaulttactic41			= "主坦克拉住所有參戰的怪物，除了副坦克拉住已變形的參戰的怪物，不斷的風箏他們之外。不用對參戰的怪物造成傷害，不用對首領造成傷害。當所有5種參戰的怪物我們都至少有一個時，對首領造成傷害來開始第2階段。參戰的怪物都必須存活直到首領死亡所以還是不要對他們造成傷害，即使在第2階段。5個參戰的怪物是：教派狂熱者，畸形狂熱者，復生的狂熱者，教派追隨者，復生的追隨者。（亢奮的追隨者不計入這個成就，所以把他們全部殺死！）"
ralldefaulttactic42			= "非常容易的戰鬥。每個單獨的人請確保沒有登陸過敵方炮艦超過兩次，不要再一次登陸中派遣太多的人。"
ralldefaulttactic43			= "氣體孢子將產生3次，然後首領會使用一次範圍傷害技能移除所有堆疊的層數。為了堆疊一層的25%的暗影抗性，你需要站在一個具有孢子的人附近直到他爆炸。獲得兩層堆疊，但不能獲得三層。"
ralldefaulttactic44			= "首領會隨機在一個玩家身上施放疾病。不要驅散它，並且當它消失時，它會生成一個小軟泥。盡量保持小軟泥怪遠離其他所有的小軟泥怪。如果兩個小軟泥怪彼此靠近，它們將融合為一個大軟泥怪。如果它融合了超過5個小軟泥怪那麽大軟泥怪將會爆炸並且成就失敗。所以請快速殺死首領並確保不合並小軟泥怪。"
ralldefaulttactic45			= "一個人將會變成一個醜陋的大怪物（畸變的憎惡體）並吞食軟泥獲得能量。只要這個人一直都不使用'反芻軟泥'並且我們獲得勝利。不能驅散這個怪物身上的疾病。"
ralldefaulttactic46			= "有3種情況（由每個被增強的首領所造成）這可能導致你失去這個成就。\n\n瓦拉納爾：強力震擊漩渦。當他施放他時，你必須迅速分散開彼此相鄰以避免多人同時被擊飛。\n\n泰爾達朗：地獄烈焰之球。當這被施放時，成為它目標的玩家需要逃跑。\n\n凱雷希斯：強力暗影長矛。你的凱雷塞斯坦克要在任何時候都堆疊4層的暗影共鳴減益效果。"
ralldefaulttactic47			= "獲取該成就需要確保每次生成的%s個傳送門都有人進入。只要所有的都被占用他不管是誰占用了他們。雖然當治療占用他們時是最好的。插件將不會在英雄難度追蹤。"
ralldefaulttactic48			= "'秘能連擊' - 每6秒以秘法能量衝擊周圍的所有敵人，每堆疊一次效果可使其受到的所有魔法傷害提高10%。要重置堆疊的層數你必須使用冰霜之墓來阻擋首領的視線。這對坦克來說是很難的，他們的輪換相當復雜。或者在她<35%血量後的35秒內殺死她。"
ralldefaulttactic49			= "這個成就必須在首領到達70%之前完成，所以在這個階段中不用對首領造成傷害。副坦克將所有參戰的怪物拉住，應該沒有其他人在附近的任何位置。不用對參戰的怪物造成傷害。唯一一個會獲得亡域瘟疫的應該是副坦克，如果他獲得了那麽驅散他，直到它回到了參戰的怪物身上。如果其他人以未知方式獲得了亡域瘟疫，在驅散它之前他們應該靠近參戰的怪物。插件將在堆疊30層時宣布，然後繼續進行正常的戰鬥！"
ralldefaulttactic50			= "邪惡靈魂出現在第三階段（<40%）。當他們貼近玩家時他們會爆炸，所以每個人都應該從他們附近跑開。所有遠程DPS在範圍內盡可能快的殺死他們。"
ralldefaulttactic51			= "這個成就能夠單獨完成。你可以拉出許多黑暗符文守護者並殺死他們，使用遊戲的成就追蹤器監視它。"
ralldefaulttactic52			= "個人成就。石毀車的乘客可以被彈射到烈焰戰輪上，在那裏他們可以殺死防禦炮塔，你必須造成最後的致命一擊來獲得成就。"
ralldefaulttactic53			= "玩家可以從石毀車彈射到烈焰戰輪上來除去它的炮塔。除去所有炮塔來激活回路過載，那麽烈焰戰輪昏迷，使他受到的傷害提高50%並清除全部堆疊的速度提升效果。這個成就要求團隊忽略這個攻城機械師的技能。"
ralldefaulttactic54			= "'熔渣之盆' - 隨機衝向一名敵方目標並抓住對方，將其丟進施法者的熔渣之盆。該目標將無法攻擊施法者且每秒受到0點火焰傷害，持續10秒。主坦克是不會遭受這個技能的。"
ralldefaulttactic55			= "參戰的鐵之傀儡站在伊格尼司'灼燒'留下的火焰上可以獲得受熱效果。一旦熾熱堆疊至10層，鐵之傀儡會獲得熔化效果，持續20秒。如果在這段時間內將他們風箏到一個水池裏，他們將結束熔化效果而被15秒的脆裂替代。用一個單體超過5000或者更高的傷害的技能處理脆裂的鐵之傀儡將它擊碎，引發一次爆炸。最後一步是在5秒的時間內致使2個或更多的鐵之傀儡這樣做將會給予這個成就。"
ralldefaulttactic56			= "使用單體目標傷害技能攻擊（避免DOT效果）並把所有的黑暗符文守護者削減至不少於15000血量。地面階段結束之前面對銳鱗，他將會直接在他面前的區域使用烈焰龍息。所有的統計數字不會重置。"
ralldefaulttactic57			= "在2次地面階段內使首領血量到達50%。"
ralldefaulttactic58			= "成就的描述不是正確的，很難理解是什麽使他失敗的。"
ralldefaulttactic59			= "在普通難度中請不要讓任何XS-013廢料機器人靠近XT-002拆解者並使其獲得治療。每隔25%血量，這些機器人會在心臟暴露階段時產生。他們無視仇恨並不斷朝著拆解者移動。廢料機器人可以被減速和定身。"
ralldefaulttactic60			= "每隔25%血量，XT-002拆解者會心臟暴露並產生額外的怪物，其中包括一些XE-321炸彈機器人和許多XS-013廢料機器人它將朝著XT-002拆解者移動。當XE-321炸彈機器人被殺害時，他們的爆炸會對他們附近的一切都造成傷害。"
ralldefaulttactic61			= "要求玩家當鐵之議會最後一個首領被殺害時受到鐵靴精鍊藥劑效果的影響。鐵靴精鍊藥劑可以在風暴群山的歐拉特·酒膽（部落）或洛克·銳頦（聯盟）處購買。"
ralldefaulttactic62			= "所有人都站在近戰範圍，除了3個特別指派的人，他們將風箏集束目光。"
ralldefaulttactic63			= "殺死手臂並等待他們重生。不要對首領造成任何傷害。"
ralldefaulttactic64			= "輸出首領至%s血量，同時殺死雙臂。"
ralldefaulttactic65			= "戰鬥開始1分鐘後將召喚出野性防禦者，堆疊有8層的野性精華。它可以以1層堆疊的代價復活自己，所以這個成就需要殺死野性防禦者9次。最後一次復活之後準備擊殺首領，激怒將要接近。"
ralldefaulttactic66			= "個人成就。無論你站在那裏風暴威能的效果會在一個玩家身上存在30秒，但暖適之火和星光似乎是有隨即位置的界限，你必須全部獲得那3種效果。"
ralldefaulttactic67			= "破壞所有閃霜救出那些困在其中NPC"
ralldefaulttactic68			= "所有團隊成員必須站在雪堆上避免每一個閃霜。他們會在冰柱倒在地上後生成。"
ralldefaulttactic69			= "不允許任何一個團隊成員堆疊刺骨之寒超過2層以上的情況下殺死霍迪爾。隨著時間的推移整個團隊堆疊刺骨之寒的層數在增加，並且隨著時間的推移每堆疊一層都會造成傷害。移動或靠近參戰法師召喚的暖適之火會降低堆疊的層數。近距離的凍結可以群體驅散並且可以通過移動來清除堆疊的層數避免閃霜時變得更難以應對。"
ralldefaulttactic70			= "你有3分鐘的時間在他打碎他的珍貯箱之前殺死首領。"
ralldefaulttactic71			= "一旦團隊完成了提出的挑戰並且激活了索林姆，他每隔15秒就會施放閃電充能。它似乎是一個錐形的攻擊，源於索林姆對競技場周圍的球體施放的一道閃電。"
ralldefaulttactic72			= "團隊中的小組通過提出挑戰後會遇到這兩種怪物。但是一旦你殺死首領所有的團隊成員將獲得這個成就。"
ralldefaulttactic73			= "黑暗符文戰爭使者 - NPC是在第一階段中產生的，他的敏銳光環會給予'光環'效果。必須將這個NPC'精神控制'給隊伍提供這個光環效果並在這時擊敗索林姆。光環的半徑是40碼。"
ralldefaulttactic74			= "將會有6波小怪參與戰鬥。殺死5波然後在至少還有一波存活的情況下全力輸出首領。"
ralldefaulttactic75			= "整個團隊必須避開來自第1第4階段的環罩地雷，第2第4階段的火箭攻擊和第3階段的炸彈機器人爆炸。這個成就可以通過累計完成，因此請避開所有的炸彈機器人將那個條件完成，並考慮下周團隊側重於環罩地雷或火箭攻擊。"
ralldefaulttactic76			= "第3階段的其中一個突襲機器人必須保留並存活到第4階段。在第4階段中，彌米倫在某個位置再次施放致命的火箭攻擊，在這之前的3秒可以見到法術預警。風箏突襲機器人進入這塊小區域中。"
ralldefaulttactic77			= "困難模式。不要殺死任何薩鋼蒸汽，等待他們轉換成薩隆聚惡體，在殺了它之後 - 擊敗首領。"
ralldefaulttactic78			= "在尤格薩倫的第2階段遇到薩拉時使用/親吻表情。宏：\n/目標 薩拉\n/親吻"
ralldefaulttactic79			= "第2階段過程中，將會在尤格薩倫旁邊打開傳送門。當你進入後，你會經歷3個幻想的其中一個。"
ralldefaulttactic80			= "你開始戰鬥時有100%的理智，當被他的技能擊中時下降。戰鬥過程中，將生成理智之井，當你站在他們的附近隨著時間的推移你的理智會得到恢復（只有當你請求芙蕾雅幫助你時）。當一個人的理智到達0%，他們會被尤格薩倫精神控制直到他們中的其中一個死亡。"
ralldefaulttactic81			= "當崩陷之星死亡時會形成黑洞。這個成就是指風箏活体星座，使他們同時進入黑洞來關閉它。"
ralldefaulttactic82			= "每次笨重的歐弗對一個玩家使用他的沖鋒技能，礦坑老鼠會隨機數量的出現在撞擊木材堆的玩家周圍。統計的數量不會被重置，所以你可以一點一點積累。"
ralldefaulttactic83			= "你需要避免收割者原型機在清理小怪過程中受到任何傷害（可能是錯誤）並且於首領戰鬥中獲得這個成就（收割者原型機是免疫火焰傷害的 - 清理首領戰鬥中的小怪）。"
ralldefaulttactic84			= "個人成就。躲避所有首領在第二階段中施放的火焰障壁。"
ralldefaulttactic85			= "在首領每次'窒息術'讀條之後他會治療，立即中斷他的'暫緩死刑'。"
ralldefaulttactic86			= "痛苦的軍官（不是首領）會施放'穢邪活化' - 打斷他施放的所有穢邪活化。"
ralldefaulttactic87			= "當仆從參與戰鬥後 - 使其中一個進入噴泉裏被殺死。獲取這個成就不需要殺死首領。"
ralldefaulttactic88			= "不要殺死不屈的巨獸，直到你在第3階段獲得潮汐奔騰的效果。"
ralldefaulttactic89			= "讓暮光狂熱者1個1個的進化，並且你可以盡可能快的殺死他們（在他們殺死你們的坦克之前）。如果你們沒有阻擋一條射線他們就會得到進化。"
ralldefaulttactic90			= "個人成就。當首領施放'靜滯之握'時跳起 - 這樣你就不會被他的技能纏住，取得這個成就最好的方式就是整個戰鬥過程中都跳起。"
ralldefaulttactic91			= "為了讓他受到影響，你必須殺死一個靠近他的惡性穴居怪。註意：'莫德古得的詛咒' - 會使造成的傷害提高100%"
ralldefaulttactic92			= "所有隊員都將獲得成就。在副本中有5個以上的寶珠，你必須得到的僅為其中5個。例如，上述的其中2個在第2個首領的平臺上，得到他們 - 你必須在首領戰鬥中利用旋風。"
ralldefaulttactic93			= "當你在50%進入'靈魂世界'時，會生成一個黑暗先驅者。每隔幾秒鐘，將產生一個靈魂碎片向黑暗先驅者移動並在靠近時治療它。讓他們移動到火焰路徑上轉化為燃燒之魂。殺死3個時你會獲得成就而不是殺死首領！"
ralldefaulttactic94			= "在你第一次進行這個成就時你只能完成其中一半，而另外一半需要在下一次完成。如果你想被咬（或不想被咬）那麽現在說出來。我們需要更多的傷害輸出，使較少的人會被咬。"
end




elseif (locale == "zhCN") then  -- Simplified Chinese
-- Thanks to user Miste(晨光麦) at wowinterface.com and yeah-chen and chrisccc at curse.com for many of these translations:
L["ACH_ANGLER_COMPLETE"] = "已钓过"
--Translation missing 
-- L["ACH_ANGLER_COUNT"] = ""
L["ACH_ANGLER_INCOMPLETE"] = "未钓过"
L["ACH_BUNNYMAKER_COMPLETE"] = "已使用过春季花束"
L["ACH_BUNNYMAKER_INCOMPLETE"] = "需要使用春季花束"
L["ACH_CHECKYOURHEAD_COMPLETE"] = "已使用过沉重的南瓜灯"
L["ACH_CHECKYOURHEAD_INCOMPLETE"] = "需要使用沉重的南瓜灯"
L["ACH_CONSUME_91_COMPLETE"] = "已经获得1000%的满足感"
L["ACH_CONSUME_91_INCOMPLETE"] = "一次吃掉91块曲奇！"
L["ACH_CONSUME_COMPLETE"] = "已使用过"
L["ACH_CONSUME_INCOMPLETE"] = "需要使用"
L["ACH_CONSUME_INCOMPLETE_EXTRA"] = "未使用过"
L["ACH_FISHSCHOOL_FORMAT"] = "群"
L["ACH_FISTFULOFLOVE_COMPLETE"] = "已使用过一堆玫瑰花瓣"
L["ACH_FISTFULOFLOVE_INCOMPLETE"] = "需要使用一堆玫瑰花瓣"
L["ACH_LETITSNOW_COMPLETE"] = "已使用过一捧雪花"
L["ACH_LETITSNOW_INCOMPLETE"] = "需要使用一捧雪花"
L["ACH_LOVECRITTERS_COMPLETE"] = "已 /爱 过"
L["ACH_LOVECRITTERS_INCOMPLETE"] = "需要 /爱"
L["ACH_TURKEYLURKEY_COMPLETE"] = "已使用过火鸡枪"
L["ACH_TURKEYLURKEY_INCOMPLETE"] = "需要使用火鸡枪"
L["ACH_WELLREAD_COMPLETE"] = "已读过"
L["ACH_WELLREAD_INCOMPLETE"] = "未读过"
L["BINDING_NAME_OVERACHIEVER_TAB_SEARCH"] = "打开搜索标签"
L["BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS"] = "打开建议标签"
L["BINDING_NAME_OVERACHIEVER_TAB_WATCH"] = "打开监视标签"
L["COMPLETEDATE"] = "完成于 %3$d-%2$02d-%1$02d"
L["CRITTER"] = "小动物"
L["HOLIDAY_BREWFEST"] = "美酒节"
L["HOLIDAY_CHILDRENSWEEK"] = "儿童周"
L["HOLIDAY_DARKMOONFAIRE"] = "暗月马戏团"
L["HOLIDAY_DAYOFTHEDEAD"] = "悼念日"
L["HOLIDAY_HALLOWSEND"] = "万圣节"
L["HOLIDAY_LOVEISINTHEAIR"] = "情人节"
L["HOLIDAY_LUNARFESTIVAL"] = "春节"
L["HOLIDAY_MIDSUMMER"] = "仲夏火焰节"
L["HOLIDAY_MIDSUMMER_SHORT"] = "仲夏"
L["HOLIDAY_NOBLEGARDEN"] = "复活节"
L["HOLIDAY_PIGRIMSBOUNTY"] = "感恩节"
L["HOLIDAY_PIRATESDAY"] = "海盗节"
L["HOLIDAY_WINTERVEIL"] = "冬幕节盛会"
L["HOLIDAY_WINTERVEIL_SHORT"] = "冬幕节"
L["INCOMPLETE"] = "未完成"
L["KILL_COMPLETE"] = "已经击杀"
L["KILL_INCOMPLETE"] = "需要击杀"
L["MSG_ACHNOTFOUND"] = "找不到该成就。"
L["MSG_CRITERIAPROGRESS"] = "|cff7eff00成就进度:|r %s (%s)"
L["MSG_INVALIDID"] = "无效输入：没有此成就ID。"
L["MSG_NAMENOTFOUND"] = "找不到含有 \"|cffffffff%s|r\" 的成就。"
L["MSG_NUMFOUNDLIST"] = "另外找到%s项成就："
L["MSG_ONEFOUND"] = "找到1项成就："
L["MSG_OPENINGTO"] = "开启："
L["MULTI_NEED"] = "%s (还需要 %s 成就)"
L["OPT_ACHUNKNOWN"] = "<未知>"
L["OPT_ANGLERTIPS"] = "提示渔点是否钓过"
L["OPT_ANGLERTIPS_TIP"] = "提示渔点是否钓过。"
--Translation missing 
-- L["OPT_ANGLERTIPS_TIP_ALWAYS"] = ""
L["OPT_AUTOTRACK_CRITERIATOAST"] = "自动追踪奖杯的\"成就进度\""
L["OPT_AUTOTRACK_CRITERIATOAST_TIP"] = "当奖杯的\"成就进度\"出现时，自动追踪该成就(假如允许追踪的话)."
L["OPT_AUTOTRACKEXPLORE"] = "自动追踪探索成就"
L["OPT_AUTOTRACKEXPLORE_COMPLETED"] = "包括已完成的成就"
L["OPT_AUTOTRACKEXPLORE_TIP"] = "转换地图时自动追踪该区域探索成就。"
L["OPT_AUTOTRACKTIMED"] = "自动追踪计时成就"
L["OPT_AUTOTRACKTIMED_BG"] = "自动追踪战场成就"
L["OPT_AUTOTRACKTIMED_TIP"] = "自动在计时成就开始时显示时限。"
L["OPT_AUTOTRACKTIMED_TIP_BG"] = "当战场开始时，自动追踪成就完成所需的时间(如果它还没被完成的话)。|n|n该成就追踪会在离开战场后停止。"
L["OPT_BUNNYMAKERTIPS"] = "提示是否需要使用春季花束"
L["OPT_BUNNYMAKERTIPS_TIP"] = "提示是否需要使用春季花束。"
L["OPT_CHECKYOURHEADTIPS"] = "提示是否需要使用沉重的南瓜灯"
L["OPT_CHECKYOURHEADTIPS_TIP"] = "提示是否需要使用沉重的南瓜灯。"
L["OPT_CONSUMEITEMTIPS"] = "提示食物是否吃过"
L["OPT_CONSUMEITEMTIPS_TIP"] = "增加食物提示说明。"
L["OPT_CONSUMEITEMTIPS_TIP2"] = "如果你的等级不足以食用这个食物时，将不做提示。"
L["OPT_CONSUMEITEMTIPS_WHENCOMPLETE"] = "完成后继续提示"
L["OPT_CRITERIATOAST_CHATLOG"] = "添加到聊天记录"
L["OPT_CRITERIATOAST_CHATLOG_TIP"] = "当\"成就进度\"的奖杯出现时，链接到成就和显示完成方式在聊天记录中。"
L["OPT_CRITERIATOAST_SUGGEST"] = "添加到最近的提醒 (建议)"
L["OPT_CRITERIATOAST_SUGGEST_TIP"] = "当\"成就进度\"的奖杯出现时， 临时添加成就的建议标签作为一个\"最近的提醒\"。"
L["OPT_CRITTERTIPS"] = "提示小动物是否被 /爱 过"
L["OPT_CRITTERTIPS_TIP"] = "增加小动物提示说明。"
L["OPT_DRAGGABLE"] = "解锁"
L["OPT_DRAGSAVE"] = "记住位置"
L["OPT_FISTFULOFLOVETIPS"] = "提示是否需要使用一堆玫瑰花瓣"
L["OPT_FISTFULOFLOVETIPS_TIP"] = "提示是否需要使用一堆玫瑰花瓣。"
L["OPT_KILLCREATURETIPS"] = "新增需要杀死的怪物"
L["OPT_KILLCREATURETIPS_TIP"] = "新增需要杀死的怪物提示（不包括小动物）。"
L["OPT_KILLCREATURETIPS_TIP2"] = "Note: At startup (or when this is option is enabled), every achievement is scanned to find unit IDs. Not all achievements provide such IDs. Most do, but the tooltips of creatures which are the criteria of those that don't won't be altered by this option."
L["OPT_LABEL_ACHFIVE"] = "\"%s,\" \"%s,\"|n\"%s,\" \"%s\"|n\"%s\""
L["OPT_LABEL_ACHFOUR"] = "\"%s\"、\"%s\"、|n\"%s\"、\"%s\""
L["OPT_LABEL_ACHSEVEN"] = "\"%s,\" \"%s,\"|n\"%s,\" \"%s\"|n\"%s,\" \"%s,\" \"%s\""
L["OPT_LABEL_ACHSIX"] = "\"%s,\" \"%s,\"|n\"%s,\" \"%s\"|n\"%s,\" \"%s\""
L["OPT_LABEL_ACHTHREE"] = "\"%s\"、\"%s\"和|n\"%s\""
L["OPT_LABEL_ACHTWO"] = "\"%s\"和\"%s\""
L["OPT_LABEL_CRITERIATOAST"] = "进度反馈 (非跟踪)"
L["OPT_LABEL_DRAENORANGLER"] = "\"%s\" 子成就"
L["OPT_LABEL_MAINUI"] = "主成就界面修改"
L["OPT_LABEL_NEEDTOKILL"] = "击杀怪物成就（\"%s\"、\"%s\"及其它）"
L["OPT_LABEL_SEASONALACHS"] = "节日成就"
L["OPT_LABEL_STARTTOAST"] = "节日/事件庆典"
L["OPT_LABEL_TOOLTIPS"] = "成就提示和链接"
L["OPT_LABEL_TRACKING"] = "成就追踪"
L["OPT_LABEL_TRADESKILLUI"] = "专业技能窗口修改"
L["OPT_LETITSNOWTIPS"] = "提示是否需要使用一捧雪花"
L["OPT_LETITSNOWTIPS_TIP"] = "提示是否需要使用一捧雪花。"
L["OPT_PESTCONTROLTIPS"] = "提示是否需要击杀害虫"
L["OPT_PESTCONTROLTIPS_TIP"] = "提示是否需要击杀害虫。"
L["OPT_SATISFIEDTIPS"] = "提示是否需要吃曲奇"
L["OPT_SATISFIEDTIPS_TIP"] = "提示是否需要连续吃91块曲奇。"
L["OPT_SELECTSOUND"] = "未完成成就提示音效"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE"] = "装备鱼竿时不提示钓鱼成就"
L["OPT_SELECTSOUND_ANGLERCHECKPOLE_TIP"] = "装备鱼竿时不声音提示钓鱼成就。"
L["OPT_SELECTSOUND_CHECKCOMBAT"] = "额外击杀提示， 假如在与生物战斗中"
L["OPT_SELECTSOUND_CHECKCOMBAT_TIP"] = "不要在战斗中击杀特定的怪物时播放提醒声音。"
L["OPT_SELECTSOUND_TIP"] = "在发现一个需要完成的成就时播放提示音。"
L["OPT_SELECTSOUND_TIP2"] = "每15秒此音效只会出现一次。"
L["OPT_SHOWID"] = "显示成就ID"
L["OPT_SHOWPROGRESS"] = "显示进度"
L["OPT_SHOWPROGRESS_OTHER"] = "与其他人的进度链接进行比较"
L["OPT_SHOWPROGRESS_OTHER_TIP"] = "在別人的成就链接说明中显示自己的进度。"
L["OPT_SHOWPROGRESS_TIP"] = "在提示说明中显示成就进度。"
L["OPT_STARTTOAST_BONUS"] = "显示今日奖励事件"
--Translation missing 
-- L["OPT_STARTTOAST_BONUS_TIP"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_DUNGEON"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_DUNGEON_TIP"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_HOLIDAY"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_HOLIDAY_TIP"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_MICROHOLIDAY"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_MICROHOLIDAY_TIP"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_ONLYCLICKFADE"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_ONLYCLICKFADE_TIP"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_TIMEFADE"] = ""
--Translation missing 
-- L["OPT_STARTTOAST_TIMEFADE_TIP"] = ""
L["OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING"] = "已完成的烹饪成就仍然提示"
L["OPT_TRADESKILL_SHOWCOMPLETEDACH_COOKING_TIP"] = "即使烹饪成就已完成，仍然在技能旁显示提示图标。"
L["OPT_TURKEYLURKEYTIPS"] = "提示是否需要使用火鸡枪"
L["OPT_TURKEYLURKEYTIPS_TIP"] = "提示是否需要使用火鸡枪。"
L["OPT_UI_HOLIDAYNOTICE"] = "如果节日事件是进行中的则显示通知"
L["OPT_UI_HOLIDAYNOTICE_SUGGESTIONSTABONLY"] = "只限于tab建议"
--Translation missing 
-- L["OPT_UI_HOLIDAYNOTICE_TIP"] = ""
L["OPT_UI_HOLIDAYNOTICE_TIP2"] = "|cffffffffTab建议是必须的tab模块.|r"
L["OPT_UI_PROGRESSIFOTHERCOMPLETED"] = "数量进度会显示在鼠标提示上，假如完成另一个"
--Translation missing 
-- L["OPT_UI_PROGRESSIFOTHERCOMPLETED_TIP"] = ""
L["OPT_UI_REQUIREDFORMETATIP"] = "提示成就树"
L["OPT_UI_REQUIREDFORMETATIP_TIP"] = "当鼠标滑过一个需要先决条件的成就时，显示成就树的名称。"
L["OPT_UI_SERIESTIP"] = "提示系列成就"
L["OPT_UI_SERIESTIP_TIP"] = "当鼠标滑过一个系列成就时，显示系列中其他成就的名字和与当前成就的关系。"
L["OPT_WELLREADTIPS"] = "提示书本是否读过"
L["OPT_WELLREADTIPS_TIP"] = "增加书本提示说明。"
L["OPTPANEL_REMINDERTOOLTIPS"] = "工具提示"
L["OVERACHIEVER_INSTALLED_MSG"] = "|cff7eff00Overachiever|r v%s 已安装."
L["OVERACHIEVER_INSTALLED_TOAST"] = "OVERACHIEVER 已安装!"
L["OVERACHIEVER_UPDATED_MSG"] = "|cff7eff00Overachiever|r 需要更新到 v%s."
L["OVERACHIEVER_UPDATED_TOAST"] = "OVERACHIEVER 更新完毕!"
L["PROGRESS"] = "进度"
L["PROGRESSIFOTHERCOMPLETED"] = "%s的进度:"
L["RECENTREMINDERCRITERIA"] = "最近发现的目标:"
L["REQUIREDFORMETATIP"] = "需要："
L["SERIESTIP"] = "系列成就："
L["SOUND_AGGRO_PULLED"] = "激活注意"
L["SOUND_AGGRO_WARNING"] = "激活警告"
L["SOUND_ALARM1"] = "闹铃声1"
L["SOUND_ALARM2"] = "闹铃声2"
L["SOUND_ALARM3"] = "闹铃声3"
L["SOUND_BELL_ALLIANCE"] = "钟声 - 联盟"
L["SOUND_BELL_AUCTION"] = "铃声 - 拍卖行"
L["SOUND_BELL_BOATARRIVED"] = "钟声 - 船只到港"
L["SOUND_BELL_HORDE"] = "钟声 - 部落"
L["SOUND_BELL_KARA"] = "钟声 - 卡拉赞"
L["SOUND_BELL_MELLOW"] = "圆润的钟声"
L["SOUND_BELL_NIGHTELF"] = "钟声 - 暗夜精灵"
L["SOUND_BGTIMER"] = "战场计时器"
L["SOUND_DING_AUCTION"] = "拍卖行 - 叮"
L["SOUND_DRUMHIT"] = "击鼓声"
L["SOUND_ENTERQUEUE"] = "进入队列声"
L["SOUND_GARRISON_INVASION"] = "要塞入侵警报"
L["SOUND_GLYPH_CREATE_MAJOR"] = "大雕文创建"
L["SOUND_GLYPH_CREATE_MINOR"] = "小雕文创建"
L["SOUND_GLYPH_DESTROY_MAJOR"] = "大雕文摧毁"
L["SOUND_GLYPH_DESTROY_MINOR"] = "小雕文摧毁"
L["SOUND_GONG_TROLL"] = "锣声 - 巨魔"
L["SOUND_HEARTHBIND"] = "炉石绑定声"
L["SOUND_MAP_PING"] = "小地图信号声"
L["SOUND_MEDAL_EXPIRES"] = "奖牌到期"
L["SOUND_SIMON_DING"] = "叮（奥格瑞拉小游戏）"
L["SOUND_SIMON_STARTGAME"] = "游戏开始（奥格瑞拉小游戏）"
L["SOUND_SIMON_STARTLEVEL"] = "升级（奥格瑞拉小游戏）"
L["SOUND_YAR"] = "啊啊啊啊啊……"
L["STARTTOAST_EVENT"] = "今日所发生的事情"
L["WILDPET"] = "小动物"
L["YOURPROGRESS"] = "你的进度"
function iclllocaleui()

ralldifscenario="场景战役"
	arallbuttonmaint = "区域列表"
	arallbuttontak = "战术"
  areachatlist1 = "团队"
	areachatlist2 = "团队通知"
	areachatlist3 = "官员"
	areachatlist4 = "队伍"
	areachatlist5 = "公会"
	areachatlist6 = "说"
	areachatlist7 = "大喊"
	areachatlist8 = "仅自己"
ralltitle2				= "这个模块当你进入副本时会通知在|cff00ff00当前区域|r的相关成就。它也可以在你选择首领为目标时提示任何一个成就的条件。附：'|cffff0000插件不会追踪|r'意味着插件无法追踪当前成就并且如果成就失败也不会通知你，'|cffff0000不是来自首领|r' - 成就的条件不是击杀首领，它可能是一些物件或其他的东西。在当前框体中你可以查看当前区域中所有的小队可用成就。"
ralltxt1				= "它当你进入副本时通知："
ralltxt2				= "只是未完成的成就"
ralltxt3				= "全部成就，包括已完成的"
ralltxt4				= "只是“英雄/团队的荣耀”的所需未完成成就"
ralltxt5				= "只是“英雄/团队的荣耀”的所需成就，包括已完成的"
ralltxt6				= "全版本 - 我所需的成就，包括普通/英雄首领的击杀等"
ralltxt7				= "它当你选择首领为目标时通知："
ralltxt8				= "只是未完成的成就"
ralltxt9				= "全部成就，包括已完成的"
ralltxt10				= "只是“英雄/团队的荣耀”的所需未完成成就"
ralltxt11				= "只是“英雄/团队的荣耀”的所需成就，包括已完成的"
ralltxt12				= "全版本 - 我所需的成就，包括普通/英雄首领的击杀等"
ralltxton				= "（启用）"
ralltxtoff				= "（禁用）"
rallzonenotfound			= "在数据库中没有发现当前区域。"
rallachiverepl1				= "未完成的成就"
rallachiverepl2				= "你已经完成了在这个区域中的所有成就。"
rallachiverepl3				= "您现在的区域不是一个团队副本或英雄地下城。"
rallachiverepl4				= "全部成就列表"
rallachiverepl5				= "数据库中未找到此区域的小队成就。"
rallachiverepl6				= "成就追踪已禁用。"
rallachiverepl7				= "发现超过10个以上的成就（|cff00ff00%s|r）。在插件选项窗口中列出全部的可用成就（/achr - 区域列表）"
rallachiverepl8				= "在“英雄/团队的荣耀”中未完成的成就。"
rallachiverepl9				= "您已经完成了此区域“英雄/团队的荣耀”中的所有成就。"
rallachiverepl10			= "全部“英雄/团队的荣耀”所需的成就列表"
rallachiverepl11			= "“英雄/团队的荣耀”所需的成就在此区域未找到。"
rallachiverepl12			= "全部未完成的成就列表"
rallachiverepl13			= "未完成的成就"
rallachiverepl14			= "全部的成就列表"
rallachiverepl15			= "没有在当前首领设置选项中发现成就。"
rallachiverepl16			= "在“英雄/团队的荣耀”中未完成的成就"
rallachiverepl17			= "全部“英雄/团队的荣耀”所需的成就列表"
rallachiverepl18			= "全部未完成的成就列表"
rallnoaddontrack			= "插件不会追踪"
rallnotfromboss				= "不是来自首领"
rallmenutxt1				= "    在当前区域中的可用成就列表"
rallachdonel1				= "完成"
rallachdonel2				= "未完成"
rallsend				= "发送"
rallwhisper				= "密语："
rallmenutxt2				= "    所选区域的成就列表"
rallbutton2				= "选择其他区域"
ralltitle3				= "这个模块在选定区域中显示可用的成就。你可以发送这些信息到聊天频道。"
ralltxt13				= "全版本 - 此区域的全部成就"
rallbutton3				= "<<< 返回设置"
rallmanualtxt1				= "版本："
rallmanualtxt2				= "难度："
rallmanualtxt3				= "区域："
rallachiverepl19			= "全部列表中的所有成就"
ralltooltiptxt				= "显示提示"
ralltooltiptxt2				= "RA：找到%s成就"
ralltooltiptxt21			= "RA：找到的成就"
ralltooltiptxt3				= "更多信息：/raida"
rallchatshowboss			= "显示在聊天频道"
rallmenutxt3				= "    小队成就战术"
ralltitle33				= "'战术：/raida'在聊天频道显示成就的战术可能会造成困难。在这里你可以看到所有的战术，如果你是首次进入地下城它会非常有用。你可以编辑文本在聊天频道发送。所有更改将使用于所有人物。\n附1：请将您的战术或意见发送给我，让这个插件可以帮助更多的人！\n附2：在简体中文本地化中发现大量错误？请通过Curse的项目页面写邮件给我来纠正他们！"
ralltactictext1				= "选择的成就："
ralltactictext2				= "需要战术"
ralltactictext3				= "战术：/raida"
ralluilooktactic1			= "显示战术"
rallnotfoundachiv1			= "没有发现未完成的成就"
rallnotfoundachiv2			= "没有成就"
ralltacticbutsave1			= "应用更改"
ralltacticbutsave2			= "恢复默认战术"
ralluilooktactic3			= "|cffff0000无战术|r，这个成就可能很容易通过描述理解。如果你想|cff00ff00添加自己的战术 - 在这里输入文本|r"
ralluilooktactic4			= "更改保存成功。"
ralluilooktactic5			= "战术"
ralldifparty				= "队伍"
ralldifraid				= "团队"
ralldefaulttacticmain1			= "当可以击杀首领时插件会在聊天频道通知你！"
ralldefaulttacticmain2			= "注意：你的宠物或图腾可能会造成这个成就失败！"
ralldefaulttacticmain3			= "成就失败将保存副本ID，并且在那一天你不能重置它"
rallachievekologarnhp1			= "80万 - 1百万"
rallachievekologarnhp2			= "3百万 - 4百万"
rallglory = "荣耀"

ralldefaulttactic1			= "在开始时整个街道约有85个僵尸，所以你需要：\n1.杀死1号首领\n2.1.将2号首领拖到市政厅的大门口（并不是让你把它带到里面，只是把他带到附近的步骤）。\n3.2.给它一两分钟时间直到你看到僵尸重生，然后杀了他。\n4.3.和阿尔萨斯对话，然后清理市政厅，杀死3号首领，并再次和阿尔萨斯交谈让他打开书柜。\n5.1到2个DPS会回到你杀死2号首领的地方，其他队员继续向前走\n6.同时在这两个位置开始杀死僵尸直到你获得成就。"
ralldefaulttactic2			= "仅停留在楼梯上并杀死小怪。诺沃斯的护盾降下之后不会有更多的小怪刷新了并且你会和他交战。所以再也不需要你注意楼梯上的小怪了。"
ralldefaulttactic3			= "描述：有时首领会对50码范围内的敌人造成伤害。每个受到该伤害的敌人都会使首领堆叠1层'吞噬'效果。\n战术：全力输出首领。"
ralldefaulttactic4			= "在首领战斗过程中杀死必要数量的恐龙。"
ralldefaulttactic5			= "在他上到平台并封锁门之前和首领开战。"
ralldefaulttactic6			= "不要让蛇攻击某个人很长一段时间！杀死他们或者只迅速的全力输出首领。"
ralldefaulttactic7			= "你必须打断所有施放的'变形'法术，施法时间会随着他的血量降低而加快。"
ralldefaulttactic8			= "为了获得野性残渣的减益效果，你需要被伊克正面锥形范围的技能击中：伊克的唾液。在那之后在没有死亡的情况下杀死最后的首领。"
ralldefaulttactic9			= "事实上，穿刺法术不会对威胁值最高的目标施放，所以你可能需要2个坦克。所有队伍玩家都受到穿刺之后击杀首领。"
ralldefaulttactic10			= "首领在50%开始召唤软泥并在25%停止。等待那些小软泥变成你需要杀死的那些铁淤泥。"
ralldefaulttactic11			= "永冻每2-3秒堆叠一次。你可以使用的萨隆邪铁来阻挡首领的视线或者驱散它或者非常迅速的全力输出首领。"
ralldefaulttactic12			= "你必须在你的全部队员没有被任何掉落的冰柱击中的情况下通过第三个首领之前的冰隧道。\n你可以看到他们即将在那里落下是因为他落下约5秒之前会出现一个蓝色的圆圈。"
ralldefaulttactic13			= "你已经清理完了最后的巷子在玛尔加尼斯的前面，你进入了一个区域看起来不像是被天灾占领过的。有2条路，你可以选择向右走到玛尔加尼斯或者你可以向左走。永恒腐蚀者是在左边，如果你的计时器上仍然有时间。"
ralldefaulttactic14			= "描述：每30秒左右，首领将你的队伍成员之一作为目标施放一个通道法术并生成一个腐蚀的灵魂残片，他应该做的事情是跑的离首领尽可能的远，因为当那些灵魂残片生成他们就会开始向布朗吉姆移动，并且当他们接触到首领时消失。当首领的血量低于35%时他会传送到房间的中心并停止移动。\n战术：在输出他之前在他的平台周围风筝他那是正确的，并等待直到全部的4个灵魂残片都生成，然后迅速的全力输出他。腐蚀的灵魂残片可以被减速。"
ralldefaulttactic15			= "你必须轮流打断施放的每个'幽灵冲击'。"
ralldefaulttactic16			= "在战斗中首领每45秒进入一次免疫状态，等待并在没有摧毁混乱裂隙的情况下杀死他（注意范围伤害技能）。"
ralldefaulttactic17			= "个人成就。极度冰寒每2秒在玩家身上叠加一层。移动来移除这个效果。如果你站着超过5秒没有移动 - 你会让你的成就失败。注意，克莉斯塔萨有另一个将玩家冻结10秒的技能，驱散它。"
ralldefaulttactic18			= "描述：第二个首领是随机的，它将会是银色神官帕尔崔丝或纯洁者耶德瑞克。帕尔崔丝在战斗中召唤的只是25个回忆中的1个。"
ralldefaulttactic19			= "描述：'制裁之锤' - 击晕敌人，使其更易受到'正义之锤'的伤害，并在6秒内无法移动或攻击。\n'正义之锤' - 投掷一柄战锤，对敌人造成14000点神圣伤害。如果目标不受'制裁之锤'的效果影响，则此正义之锤会被接住并掷回施法者。\n战术：输出首领至25000血量并等待直到有人被他击晕，驱散那击晕并且玩家的技能蓝上会只出现1个法术'反掷一柄锤子'，使用它！"
ralldefaulttactic20			= "当他开始施放食尸鬼爆炸时杀死食尸鬼或者风筝走首领。"
ralldefaulttactic21			= "'冰霜墓穴' - 将目标困在寒冰障壁中。只要杀死首领而不用击碎冰霜墓穴，首领将会对随机玩家施放。"
ralldefaulttactic22			= "首领附近有2个天灾巨人，你需要他们中的其中1个来完成成就。首领在50%时会开始施放'利剑仪祭'，你要在利剑仪祭爆炸击中他之后杀死天灾巨人。"
ralldefaulttactic23			= "要杀死格拉乌弗你要拔出3根鱼叉同时使用鱼叉炮。"
ralldefaulttactic24			= "如果你杀首领不够迅速 - 他会在自己身上施放'灾祸'，你不能在首领存在这个效果的情况下受到伤害。只要在他施放这个之前迅速的全力输出首领。"
ralldefaulttactic25			= "在它们正试图与首领合并时迅速杀死水泡。"
ralldefaulttactic26			= "防御控制水晶是位于墙壁上的，不要点击它们并且不要让小怪破坏监狱的封印。"
ralldefaulttactic27			= "当你每次参与这个地下城，你会遇见的只是存在的6个中的其中2个首领。"
ralldefaulttactic28			= "如果安卡哈守护者靠近首领 - 首领将变得免疫所有伤害，只需要风筝首领召唤的安卡哈守护者并迅速杀死首领。"
ralldefaulttactic29			= "有3平台比亚格里将军他会在那里停下并且获得临时电荷。在他获得临时电荷的同时与他开战。"
ralldefaulttactic30			= "首领有时会打击沃尔坎之砧，创造出2个熔岩魔像。在他创造4个魔像之前杀死他。"
ralldefaulttactic31			= "在第二阶段（空中）奥妮克希亚会施放深呼吸，远离能够受到她深呼吸的方向（她将通过整个房间的对角线），如果你的输出使她的血掉的足够迅速 - 她不会施放这个法术。"
ralldefaulttactic32			= "奥妮克希亚在65%进入第二阶段，当她离开地面时你有10秒的时间跑入洞穴内迫使孵化出雏龙。我们可以慢慢杀死他们，但是他们孵化很迅速。所有人聚集起来后使用群体伤害技能杀死他们。"
ralldefaulttactic33			= "穿刺者戈莫克会对玩家投掷狗头人奴隶。不要将他们中的%s个杀死。没有范围技能，没有宠物，没有任何形式的溅射伤害。让他们一直活着经过蛰猛巨虫的战斗，当冰吼死亡时仍然活着来获得的成就。"
ralldefaulttactic34			= "首领将周期性的下潜（只有当他>35%血量时）并产生无法避免的虫群甲虫。刷新的虫群甲虫使用尽可能多的坦克同时坦克他们。没有范围技能，没有宠物，没有任何形式的溅射伤害。当越来越多的虫群甲虫刷新出来，请保持这些虫群甲虫活着通过第二次下潜。当第三次下潜时，所有小组聚集起来后使用群体伤害技能杀死他们。在第三次下潜期间墙壁附近会生成的更多数量的虫群甲虫你有30秒的时间来杀死他们。你不用杀死首领来取得成就。"
ralldefaulttactic35			= "这是一个个人成就。你必须避免熔岩打击，而不是火墙。熔岩打击是一个对范围目标伤害的技能，在战斗中将它查找出来！或者在战斗开始时死亡将会获得它:)"
ralldefaulttactic36			= "在第二阶段期间（首领到达50%以后）将会出现一些魔枢领主，当他们中的其中1个死亡后会留下一个悬浮之碟，你需要占用它并且对永恒子嗣造成最后的致命一击。"
ralldefaulttactic37			= "有两种方法获得这个成就：1.不要杀死膜拜者（没有宠物，没有范围技能，没有任何形式的溅射伤害。）2.从距离首领15码以上的地方杀死膜拜者。"
ralldefaulttactic38			= "描述：塔迪乌斯会施放'极性转化'：在附近所有敌方目标身上施放负能量电荷或正能量电荷（减益效果）。当携带相同电荷的玩家相互靠近时，其每次攻击所造成的伤害均得到提高。当携带相反电荷的玩家相互靠近时，即会对附近的团队成员造成伤害并且成就失败。\n战术：团队分成2个区域（+ 和 -），极性转化之后跑向那个区域取决于你新的减益效果。"
ralldefaulttactic39			= "拉出憎恶击杀直到插件告诉我们已经杀死足够的数量。"
ralldefaulttactic40			= "在战斗中首领将会对玩家施放穿刺（10人1个和25人3个），必须非常迅速的击杀他们。"
ralldefaulttactic41			= "主坦克拉住所有参战的怪物，除了副坦克拉住已变形的参战的怪物，不断的风筝他们之外。不用对参战的怪物造成伤害，不用对首领造成伤害。当所有5种参战的怪物我们都至少有一个时，对首领造成伤害来开始第2阶段。参战的怪物都必须存活直到首领死亡所以还是不要对他们造成伤害，即使在第2阶段。5个参战的怪物是：教派狂热者，畸形狂热者，复生的狂热者，教派追随者，复生的追随者。（亢奋的追随者不计入这个成就，所以把他们全部杀死！）"
ralldefaulttactic42			= "非常容易的战斗。每个单独的人请确保没有登陆过敌方炮舰超过两次，不要再一次登陆中派遣太多的人。"
ralldefaulttactic43			= "毒气孢子将产生3次，然后首领会使用一次范围伤害技能移除所有堆叠的层数。为了堆叠一层的25%的暗影抗性，你需要站在一个具有孢子的人附近直到他爆炸。获得两层堆叠，但不能获得三层。"
ralldefaulttactic44			= "首领会随机在一个玩家身上施放疾病。不要驱散它，并且当它消失时，它会生成一个小软泥。尽量保持小软泥怪远离其他所有的小软泥怪。如果两个小软泥怪彼此靠近，它们将融合为一个大软泥怪。如果它融合了超过5个小软泥怪那么大软泥怪将会爆炸并且成就失败。所以请快速杀死首领并确保不合并小软泥怪。"
ralldefaulttactic45			= "一个人将会变成一个丑陋的大怪物（畸变的憎恶）并吞食软泥获得能量。只要这个人一直都不使用'回流软泥'并且我们获得胜利。不能驱散这个怪物身上的疾病。"
ralldefaulttactic46			= "有3种情况（由每个被增强的首领所造成）这可能导致你失去这个成就。\n\n瓦拉纳：强能震荡涡流。当他施放他时，你必须迅速分散开彼此相邻以避免多人同时被击飞。\n\n塔达拉姆：强能烈焰之球。当这被施放时，成为它目标的玩家需要逃跑。\n\n凯雷塞斯：强能影枪。你的凯雷塞斯坦克要在任何时候都堆叠4层的暗影共鸣减益效果。"
ralldefaulttactic47			= "获取该成就需要确保每次生成的%s个传送门都有人进入。只要所有的都被占用他不管是谁占用了他们。虽然当治疗占用他们时是最好的。插件将不会在英雄难度追踪。"
ralldefaulttactic48			= "'秘法打击' - 每6秒使用一次魔法打击附近所有的敌人，每叠加一层魔法效果会使受到的魔法伤害提高10%。要重置堆叠的层数你必须使用冰霜之墓来阻挡首领的视线。这对坦克来说是很难的，他们的轮换相当复杂。或者在她<35%血量后的35秒内杀死她。"
ralldefaulttactic49			= "这个成就必须在首领到达70%之前完成，所以在这个阶段中不用对首领造成伤害。副坦克将所有参战的怪物拉住，应该没有其他人在附近的任何位置。不用对参战的怪物造成伤害。唯一一个会获得死疽的应该是副坦克，如果他获得了那么驱散他，直到它回到了参战的怪物身上。如果其他人以未知方式获得了死疽，在驱散它之前他们应该靠近参战的怪物。插件将在堆叠30层时宣布，然后继续进行正常的战斗！"
ralldefaulttactic50			= "卑劣的灵魂出现在第三阶段（<40%）。当他们贴近玩家时他们会爆炸，所以每个人都应该从他们附近跑开。所有远程DPS在范围内尽可能快的杀死他们。"
ralldefaulttactic51			= "这个成就能够单独完成。你可以拉出许多钢铸防御者并杀死他们，使用游戏的成就追踪器监视它。"
ralldefaulttactic52			= "个人成就。攻城车的乘客可以被弹射到烈焰巨兽上，在那里他们可以杀死防御炮塔，你必须造成最后的致命一击来获得成就。"
ralldefaulttactic53			= "玩家可以从攻城车弹射到烈焰巨兽上来除去它的炮塔。除去所有炮塔来激活回路过载，那么烈焰巨兽昏迷，使他受到的伤害提高50%并清除全部堆叠的速度提升效果。这个成就要求团队忽略这个攻城机械师的技能。"
ralldefaulttactic54			= "'熔渣炉' - 随即冲锋并抓住一个随机的敌方目标，扔进施法者的熔渣炉中。该目标每秒受到4500点火焰伤害持续10秒。主坦克是不会遭受这个技能的。"
ralldefaulttactic55			= "参战的铁铸像站在伊格尼斯'灼烧'留下的火焰上可以获得加热效果。一旦高热堆叠至10层，铁铸像会获得熔化效果，持续20秒。如果在这段时间内将他们风筝到一个水池里，他们将结束熔化效果而被15秒的脆弱替代。用一个单体超过5000或者更高的伤害的技能处理脆弱的铁铸像将它击碎，引发一次爆炸。最后一步是在5秒的时间内致使2个或更多的铁铸像这样做将会给予这个成就。"
ralldefaulttactic56			= "使用单体目标伤害技能攻击（避免DOT效果）并把所有的黑暗符文守护者削减至不少于15000血量。地面阶段结束之前面对锋鳞，他将会直接在他面前的区域使用火息術。所有的统计数字不会重置。"
ralldefaulttactic57			= "在2次地面阶段内使首领血量到达50%。"
ralldefaulttactic58			= "成就的描述不是正确的，很难理解是什么使他失败的。"
ralldefaulttactic59			= "在普通难度中请不要让任何XS-013废料机器人靠近XT-002拆解者并使其获得治疗。每隔25%血量，这些机器人会在心脏暴露阶段时产生。他们无视仇恨并不断朝着拆解者移动。废料机器人可以被减速和定身。"
ralldefaulttactic60			= "每隔25%血量，XT-002拆解者会心脏暴露并产生额外的怪物，其中包括一些XE-321爆破机器人和许多XS-013废料机器人它将朝着XT-002拆解者移动。当XE-321爆破机器人被杀害时，他们的爆炸会对他们附近的一切都造成伤害。"
ralldefaulttactic61			= "要求玩家当钢铁议会最后一个首领被杀害时受到铁靴烈酒效果的影响。铁靴烈酒可以在风暴峭壁的奥鲁特·埃雷古（部落）或洛尔克·锐须（联盟）处购买。"
ralldefaulttactic62			= "所有人都站在近战范围，除了3个特别指派的人，他们将风筝聚焦视线。"
ralldefaulttactic63			= "杀死手臂并等待他们重生。不要对首领造成任何伤害。"
ralldefaulttactic64			= "输出首领至%s血量，同时杀死双臂。"
ralldefaulttactic65			= "战斗开始1分钟后将召唤出野性防御者，堆叠有8层的野性精华。他可以以1层堆叠的代价复活自己，所以这个成就需要杀死野性防御者9次。最后一次复活之后准备击杀首领，激怒将要接近。"
ralldefaulttactic66			= "个人成就。无论你站在那里风暴之力的效果会在一个玩家身上存在30秒，但温暖的火焰和星光似乎是有随即位置的界限，你必须全部获得那3种效果。"
ralldefaulttactic67			= "破坏所有快速冻结救出那些困在其中NPC"
ralldefaulttactic68			= "所有团队成员必须站在雪堆上避免每一个快速冻结。他们会在冰柱倒在地上后生成。"
ralldefaulttactic69			= "不允许任何一个团队成员堆叠刺骨之寒超过2层以上的情况下杀死霍迪尔。随着时间的推移整个团队堆叠刺骨之寒的层数在增加，并且随着时间的推移每堆叠一层都会造成伤害。移动或靠近参战法师召唤的温暖的火焰会降低堆叠的层数。近距离的冻结可以群体驱散并且可以通过移动来清除堆叠的层数避免快速冻结时变得更难以应对。"
ralldefaulttactic70			= "你有3分钟的时间在他打碎他的珍贵宝箱之前杀死首领。"
ralldefaulttactic71			= "一旦团队完成了提出的挑战并且激活了托里姆，他每隔15秒就会施放闪电充能。它似乎是一个锥形的攻击，源于托里姆对竞技场周围的球体施放的一道闪电。"
ralldefaulttactic72			= "团队中的小组通过提出挑战后会遇到这两种怪物。但是一旦你杀死首领所有的团队成员将获得这个成就。"
ralldefaulttactic73			= "黑暗符文战争使者 - NPC是在第一阶段中产生的，他的敏锐光环会给予'光环'效果。必须将这个NPC'精神控制'给队伍提供这个光环效果并在这时击败托里姆。光环的半径是40码。"
ralldefaulttactic74			= "将会有6波小怪参与战斗。杀死5波然后在至少还有一波存活的情况下全力输出首领。"
ralldefaulttactic75			= "整个团队必须避开来自第1第4阶段的感应地雷，第2第4阶段的火箭打击和第3阶段的炸弹机器人爆炸。这个成就可以通过累计完成，因此请避开所有的炸弹机器人将那个条件完成，并考虑下周团队侧重于感应地雷或火箭打击。"
ralldefaulttactic76			= "第3阶段的其中一个突击机器人必须保留并存活到第4阶段。在第4阶段中，米米尔隆在某个位置再次施放致命的火箭打击，在这之前的3秒可以见到法术预警。风筝突击机器人进入这块小区域中。"
ralldefaulttactic77			= "困难模式。不要杀死任何萨隆邪铁蒸汽，等待他们转换成萨隆邪铁畸体，在杀了他之后 - 击败首领。"
ralldefaulttactic78			= "在尤格萨隆的第2阶段遇到萨拉时使用/亲吻表情。宏：\n/目标 萨拉\n/亲吻"
ralldefaulttactic79			= "第2阶段过程中，将会在尤格萨隆旁边打开传送门。当你进入后，你会经历3个幻想的其中一个。"
ralldefaulttactic80			= "你开始战斗时有100%的理智，当被他的技能击中时下降。战斗过程中，将生成理智之井，当你站在他们的附近随着时间的推移你的理智会得到恢复（只有当你请求弗蕾亚帮助你时）。当一个人的理智到达0%，他们会被尤格萨隆精神控制直到他们中的其中一个死亡。"
ralldefaulttactic81			= "当坍缩星死亡时会形成黑洞。这个成就是指风筝有生命的星座，使他们同时进入黑洞来关闭它。"
ralldefaulttactic82			= "每次伐木场巨怪对一个玩家使用他的冲锋技能，矿井鼠会随机数量的出现在撞击木材堆的玩家周围。统计的数量不会被重置，所以你可以一点一点积累。"
ralldefaulttactic83			= "你需要避免死神原型机在清理小怪过程中受到任何伤害（可能是错误）并且于首领战斗中获得这个成就（死神原型机是免疫火焰伤害的 - 清理首领战斗中的小怪）。"
ralldefaulttactic84			= "个人成就。躲避所有首领在第二阶段中施放的火墙。"
ralldefaulttactic85			= "在首领每次'窒息'读条之后他会治疗，立即中断他的'怜悯治疗'。"
ralldefaulttactic86			= "痛苦的文官（不是首领）会施放'邪恶增强' - 打断他施放的所有邪恶增强。"
ralldefaulttactic87			= "当仆从参与战斗后 - 使其中一个进入喷泉里被杀死。获取这个成就不需要杀死首领。"
ralldefaulttactic88			= "不要杀死顽强的巨兽，直到你在第3阶段获得海潮涌动的效果。"
ralldefaulttactic89			= "让狂热者1个1个的进化，并且你可以尽可能快的杀死他们（在他们杀死你们的坦克之前）。如果你们没有阻挡一条射线他们就会得到进化。"
ralldefaulttactic90			= "个人成就。当首领施放'静电缠握'时跳起 - 这样你就不会被他的技能缠握，取得这个成就最好的方式就是整个战斗过程中都跳起。"
ralldefaulttactic91			= "为了让他受到影响，你必须杀死一个靠近他的恶毒的穴居人。注意：'莫德古德的怨念' - 会使造成的伤害提高100%"
ralldefaulttactic92			= "所有队员都将获得成就。在副本中有5个以上的宝珠，你必须得到的仅为其中5个。例如，上述的其中2个在第2个首领的平台上，得到他们 - 你必须在首领战斗中利用旋风。"
ralldefaulttactic93			= "当你在50%进入'灵魂世界'时，会生成一个黑暗先驱。每隔几秒钟，将产生一个灵魂碎片向黑暗先驱移动并在靠近时治疗它。让他们移动到火焰路径上转化为燃烧的灵魂。杀死3个时你会获得成就而不是杀死首领！"
ralldefaulttactic94			= "在你第一次进行这个成就时你只能完成其中一半，而另外一半需要在下一次完成。如果你想被咬（或不想被咬）那么现在说出来。我们需要更多的伤害输出，使较少的人会被咬。"
end

end

BINDING_HEADER_OVERACHIEVER = GetAddOnMetadata("Overachiever", "Title")
BINDING_NAME_OVERACHIEVER_TAB_SEARCH = L.BINDING_NAME_OVERACHIEVER_TAB_SEARCH;
BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS = L.BINDING_NAME_OVERACHIEVER_TAB_SUGGESTIONS;
BINDING_NAME_OVERACHIEVER_TAB_WATCH = L.BINDING_NAME_OVERACHIEVER_TAB_WATCH;