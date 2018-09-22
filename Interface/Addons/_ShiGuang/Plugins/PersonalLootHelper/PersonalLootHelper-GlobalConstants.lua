if GetLocale() == "zhCN" then
----------------Loot----------------------
PLH_LONG_ADDON_NAME = "|cff02F78E[装备]|r交易助手";
PLH_QUICK_GET = "自动跳过 给出/获取 确认选项";
PLH_ADDON_NOTE = "提示拾取裝備可交易";
PLH_INCLUDE_BOEITEM = "包含<装绑>物品";
PLH_CAN_LOOT_LIST = "显示谁可以使用我拾取到的无用装备";
PLH_SPEC_ONLY = "只适配当前专精";
PLH_NOTIFY_GROUPS = "通报到队伍/团队";
PLH_COORDINATE_ROLL = "发起R点需求 (有A才行)";
PLH_MANAGE_ROLLS = "需求装备的人密团长 <交易> 或 <交易 [装备链接]> 來R。";
PLH_NO_LOWLEVEL = "不包含低等级角色";
PLH_SHOW_INRAID = "在团框中显示可交易的装备";
PLH_ONLY_CAN_EQUIP = "如果这件战利品我能装备才提醒我";
PLH_ONLY_NOTICE = "仅提醒";
PLH_SHOW_TRANSMOG = "如果战利品没有提升但是可以幻化也提醒我";
PLH_ASK_ITEMS = "⬇ 自定义密语内容 (%item代替装备).";
PLH_PREFS_WHISPER_MESSAGE = "你好，这件装备 %item 有需求吗？如果你不需要，能否让给我呢?非常感谢！";
PLH_THANKS_ALL = "感谢所有愿意把装备分享给最需要的人的玩家！\n毕竟要有爱，哪来那么多魔兽争霸。";
elseif GetLocale() == "zhTW" then
----------------Loot----------------------
PLH_LONG_ADDON_NAME = "|cff02F78E[裝備]|r交易助手";
PLH_QUICK_GET = "自动跳过 给出/获取 确认选项";
PLH_ADDON_NOTE = "提示拾取裝備可交易";
PLH_INCLUDE_BOEITEM = "包含<裝綁>物品";
PLH_CAN_LOOT_LIST = "显示谁可以使用我拾取到的无用装备";
PLH_SPEC_ONLY = "只適配當前專精";
PLH_NOTIFY_GROUPS = "通報到隊伍/團隊";
PLH_COORDINATE_ROLL = "發起R點需求 (有A才行)";
PLH_MANAGE_ROLLS = "需求裝備的人密團長 <交易> 或 <交易 [裝備連結]> 來R。";
PLH_NO_LOWLEVEL = "不包含低等級角色";
PLH_SHOW_INRAID = "在團框中顯示可交易的裝備";
PLH_ONLY_CAN_EQUIP = "如果这件战利品我能装备才提醒我";
PLH_ONLY_NOTICE = "仅提醒";
PLH_SHOW_TRANSMOG = "如果战利品没有提升但是可以幻化也提醒我";
PLH_ASK_ITEMS = "⬇ 自定义密语内容 (%item代替装备).";
PLH_PREFS_WHISPER_MESSAGE = "你好，这件装备 %item 有需求吗？如果你不需要，能否让给我呢?非常感谢！";
PLH_THANKS_ALL = "感謝所有願意把裝備分享給最需要的人的玩家！\n畢竟要有愛，哪來那麼多魔獸爭霸。";
else
----------------Loot----------------------
PLH_LONG_ADDON_NAME = '|cff02F78E[Loot]|rPersonal Helper';
PLH_QUICK_GET = "Automatically skip confirmation when offering or requesting loot";
PLH_ADDON_NOTE = "Only prompt me to trade if loot is an ilvl upgrade for other players";
PLH_INCLUDE_BOEITEM = "Never prompt me to trade Bind on Equip loot";
PLH_CAN_LOOT_LIST = "Show me a list of who can use the loot";
PLH_SPEC_ONLY = "Evaluate based on current spec only";
PLH_NOTIFY_GROUPS = "Notify group (automatically disabled in LFR)";
PLH_COORDINATE_ROLL = "Coordinate rolls (group leaders or assistants only)";
PLH_MANAGE_ROLLS = "Manage loot rolls. Players can whisper the roll coordinator with <trade> or <trade [item]> to initiate rolls.";
PLH_NO_LOWLEVEL = "Exclude notifications if character is too low level to equip item";
PLH_SHOW_INRAID = "Show tradeable items in raid frames";
PLH_ONLY_CAN_EQUIP = "如果这件战利品我能装备才提醒我";
PLH_ONLY_NOTICE = "仅提醒";
PLH_SHOW_TRANSMOG = "如果战利品没有提升但是可以幻化也提醒我";
PLH_ASK_ITEMS = "Enter message to whisper when requesting loot from players who are not using PLH.\n You may include the looted item by using %item.";
PLH_PREFS_WHISPER_MESSAGE = "May I please have %item if you don't need it?";
PLH_THANKS_ALL = "Thank you to all of the players who trade loot to others who can use it! Your generosity is part of what makes the WoW community great.\nYou rock!!!";
end

-- Slash command
SLASH_PLHCommand1 = '/plh'

-- Keys for the PLH_STATS saved variable array
PLH_ITEMS_REQUESTED					= 'PLH_ITEMS_REQUESTED'
PLH_ITEMS_RECEIVED					= 'PLH_ITEMS_RECEIVED'
PLH_ITEMS_OFFERED					= 'PLH_ITEMS_OFFERED'
PLH_ITEMS_GIVEN_AWAY				= 'PLH_ITEMS_GIVEN_AWAY'

-- Keys for the PLH_META saved variable array
PLH_SHOW_WHISPER_WARNING			= 'PLH_SHOW_WHISPER_WARNING'
PLH_LAST_SEEN_MESSAGE_VERSION		= 'PLH_LAST_SEEN_MESSAGE_VERSION'
PLH_LOOTED_ITEMS_FRAME_X			= 'PLH_LOOTED_ITEMS_FRAME_X'
PLH_LOOTED_ITEMS_FRAME_Y			= 'PLH_LOOTED_ITEMS_FRAME_Y'
PLH_LOOTED_ITEMS_FRAME_WIDTH		= 'PLH_LOOTED_ITEMS_FRAME_WIDTH'
PLH_LOOTED_ITEMS_FRAME_HEIGHT		= 'PLH_LOOTED_ITEMS_FRAME_HEIGHT'

-- Keys for the PLH_PREFS saved variable array
PLH_PREFS_SKIP_CONFIRMATION				= 'PLH_SKIP_CONFIRMATION'
PLH_PREFS_ONLY_OFFER_IF_UPGRADE			= 'PLH_ONLY_OFFER_IF_UPGRADE'
PLH_PREFS_NEVER_OFFER_BOE				= 'PLH_NEVER_OFFER_BOE'
PLH_PREFS_CURRENT_SPEC_ONLY				= 'PLH_CURRENT_SPEC_ONLY'
PLH_PREFS_ILVL_THRESHOLD				= 'PLH_ILVL_THRESHOLD'
PLH_PREFS_INCLUDE_XMOG					= 'PLH_INCLUDE_XMOG'
PLH_PREFS_SHOW_TRADEABLE_ALERT			= 'PLH_SHOW_TRADEABLE_ALERT'
PLH_PREFS_ANNOUNCE_TRADES				= 'PLH_ANNOUNCE_TRADES'

-- Default values for PLH_PREFS saved variable array
PLH_DEFAULT_PREFS = {
	[PLH_PREFS_SKIP_CONFIRMATION]		= false,
	[PLH_PREFS_ONLY_OFFER_IF_UPGRADE]	= true,
	[PLH_PREFS_NEVER_OFFER_BOE]			= false,
	[PLH_PREFS_CURRENT_SPEC_ONLY]		= false,
	[PLH_PREFS_ILVL_THRESHOLD]			= 0,
	[PLH_PREFS_INCLUDE_XMOG]			= true,
	[PLH_PREFS_WHISPER_MESSAGE]			= '你好，这件装备 %item 有需求吗？如果你不需要，能否让给我呢?非常感谢！',
	[PLH_PREFS_SHOW_TRADEABLE_ALERT]	= true,
	[PLH_PREFS_ANNOUNCE_TRADES]			= false
}

-- Roles
PLH_ROLE_AGILITY_DPS				= 'AGILITY_DPS'
PLH_ROLE_INTELLECT_DPS				= 'INTELLECT_DPS'
PLH_ROLE_STRENGTH_DPS				= 'STRENGTH_DPS'
PLH_ROLE_HEALER						= 'HEALER'
PLH_ROLE_TANK						= 'TANK'
PLH_ROLE_UNKNOWN					= 'UNKNOWN'
