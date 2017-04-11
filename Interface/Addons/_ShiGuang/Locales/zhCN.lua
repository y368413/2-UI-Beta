local _, _, U, _ = unpack(select(2, ...))
if GetLocale() == "zhCN" then
  HEADSLOT = "头";
  NECKSLOT  = "颈";
  SHOULDERSLOT = "肩";
  CHESTSLOT = "胸";
  WAISTSLOT = "腰";
  LEGSSLOT = "腿";
  WRISTSLOT = "腕"; 
  HANDSSLOT = "手";
  FEETSLOT = "鞋";
  FINGER0SLOT = "戒指";
  FINGER1SLOT = "戒指";
  BACKSLOT = "披风";
  STAT_MOVEMENT_SPEED = "速度";
  --CHAT_GUILD_GET = "|Hchannel:GUILD|h[公会]|h %s: "
  --CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官员]|h %s: "  
  --CHAT_RAID_GET = "|Hchannel:RAID|h[团队]|h %s: "
  CHAT_RAID_WARNING_GET = "[通知] %s：";
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[团长]|h %s：";
  --CHAT_PARTY_GET = "|Hchannel:PARTY|h[队伍]|h %s: "
  --CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[队长]|h %s: "
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向导]|h %s:";
  --CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|h[副本]|h %s: "
  CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|h[领袖]|h %s：";

ACHIEVEMENT_BROADCAST = "%s获得%s!"
HEALTH_LOW = "<<<生命危急>>>";
CURRENTLY_EQUIPPED = "|cffffff9a-当前装备-|r";     --"|cffffff9a★★★★"..CURRENTLY_EQUIPPED.."★★★★|r"
ITEM_BIND_QUEST = "|cffff2020★任务物品|r";
ITEM_LEVEL = "|cff00ffff物品等级: %d|r"; -- Blue color
--ITEM_CREATED_BY = ""	-- No creator name
--ITEM_SOCKETABLE = ""	-- No gem info line
EMPTY_SOCKET_RED = "|cffFF4040红|r";
EMPTY_SOCKET_YELLOW = "|cffffff40黄|r";
EMPTY_SOCKET_BLUE = "|cff6060ff蓝|r";
TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN = "|cffFF4040你尚未收藏过此外观|r";
TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN = "|cff6060ff你拥有此外观，但不是来自此物品|r";

WORLD_CHANNEL = "世界频道";
WORLD_CHANNEL_NAME = "大脚世界频道";

DANWEI_WAN = "%.1f万";
DANWEI_YI = "%.1f亿";

Announcer_Sap = ">>>被闷棍<<<";
Announcer_RocketPP = "漏油!!!救命啊~";
Announcer_Purgatory = "要死啦要死啦~";
Announcer_Interrupted = "打断→";
Announcer_Disperse = "驱散→";
Announcer_Stole = "偷取→";
Announcer_SpellIDnof = "<法术链接(ID)没有找到>";

STRENGTH = "力量";
AGILITY = "敏捷";
STAMINA = "耐力";
VERSATILITY = "全能";
MULTISTRIKE = "溅射";
BONUSARMOR = "额外护甲";
ARMOR = "护甲";
HASTE = "急速";
MASTERY = "精通";
CRIT = "爆击";
INTELLECT = "智力";
SPIRIT = "精神";	
REPAIR_COST = "修理：";

Chatbar_ChatMiniMizeButtonText = "缩";
Chatbar_rollText = "骰";
Chatbar_StatReport = "报";
Chatbar_ChannelYell = "喊";
Chatbar_ChannelSay = "说";
Chatbar_ChannelParty = "队";
Chatbar_ChannelRaidWarns = "通";
Chatbar_ChannelRaid = "团";
Chatbar_ChannelBattleGround = "副";
Chatbar_ChannelGuild = "公";
Chatbar_EmoteCallButtonText = "圖";

ChatFilter_You = "你";
ChatFilter_Space = ", ";
ChatFilter_Channel = "大脚世界频道";
ChatFilter_QuestReport = "任务进度%s?[:：]";
ChatFilter_Achievement = "%s获得成就%s!";
ChatFilter_LearnSpell = "▲学会技能: %s";
ChatFilter_UnlearnSpell = "▼遗忘技能: %s";
ChatFilter_FriendlistFull = "好友列表已满，已关闭过滤小号功能，如需再次打开，请在腾出空位后输入/cf level开启。";

InboxMailBag_Advanced = "进阶";
InboxMailBag_ADVANCED_MODE_DESC = "启用进阶模式。显示您信箱更多的讯息，并且能很好的挽回大笔的金钱。";
InboxMailBag_ADVANCED_MODE_DISABLED = "|cff00ff96InboxMailbag: 进阶模式|r 关闭";
InboxMailBag_ADVANCED_MODE_ENABLED = "|cff00ff96InboxMailbag: 进阶模式|r 启用";
InboxMailBag_BAGNAME = "邮包";
InboxMailBag_DELETED = "%s 从 %s |cff20FF20 将删除于 %d |4日:日; 后|r";
InboxMailBag_DELETED_1 = "%s 从 %s |cffFF2020 将删除于 %s 后|r";
InboxMailBag_DELETED_7 = "%s 从 %s |cffFF6020 将删除于 %d |4日:日; 后|r";
InboxMailBag_FRAMENAME = "|cffFFFFFF[邮件]|r信箱包裹";
InboxMailBag_Group_Stacks = "群组堆叠";
InboxMailBag_MAIL_DEFAULT = "预设为邮包";
InboxMailBag_MAIL_DEFAULT_DESC = "启用此选项会导致信箱最初打开的是邮包，而非一般%s";
InboxMailBag_MAIL_DEFAULT_DISABLED = "|cff00ff96InboxMailbag: 信箱预设为|r %s";
InboxMailBag_MAIL_DEFAULT_ENABLED = "|cff00ff96InboxMailbag: 信箱预设为|r 信箱邮包";
InboxMailBag_QUALITY_COLOR_MODE_DESC = "启用可由物品的边框显示物品的品质";
InboxMailBag_Quality_Colors = "品质着色";
InboxMailBag_QUALITY_COLORS_MODE_DISABLED = "|cff00ff96InboxMailbag: 品质着色|r 关闭";
InboxMailBag_QUALITY_COLORS_MODE_ENABLED = "|cff00ff96InboxMailbag: 品质着色|r 启用";
InboxMailBag_RETURNED = "%s 从 %s |cff20FF20 将返回于 %d |4日:日; 后|r";
InboxMailBag_RETURNED_1 = "%s 从 %s |cffFF2020 将返回于 %s 后|r";
InboxMailBag_RETURNED_7 = "%s 从 %s |cffFFA020 将返回于 %d |4日:日; 后|r";
InboxMailBag_TOTAL = "总计讯息: %d";
InboxMailBag_TOTAL_MORE = "总计讯息: %d (%d)";

DEX_FontList = {
	"Fonts\\ARHei.TTF",
	"Fonts\\ARKai_C.TTF",
	"Fonts\\ARKai_T.TTF",
};
DEX_TXT_CRUSH = "碾压!";
DEX_TXT_DISPELLED = "驱散! ";
DEX_TXT_STOLEN = "偷取! ";
DEX_TXT_REFLECT = " 反弹! ";
DEX_TXT_CRIT = "暴击! ";
DEX_TXT_INTERUPT = "打断! ";
DEX_MAIN_OPTION = "DamageEx";
DEX_BUTTON_RESET_TIP = "恢复预设值";
DEX_PREVIEW_LABEL = "拖动我 改变伤害文字 位置";
DEXColorMode_T = "颜色模式";
DEXOptionsDropDown = {"单色","双色","渐变色"};
DEXOptionsFrameCheckButtons = {
	["DEX_Enable"] = { title = "启用", tooltipText = "启用攻击伤害显示器"},
	["DEX_ShowWithMess"] = { title = "以战斗讯息方式显示", tooltipText = "以战斗讯息方式显示所有伤害资讯"},
	["DEX_ShowSpellName"] = { title = "显示技能名", tooltipText = "在伤害数值边显示造成此次伤害的技能名"},
	["DEX_ShowNameOnCrit"] = { title = "当暴击才显示", tooltipText = "只有在致命一击时才显示技能名"},
	["DEX_ShowNameOnMiss"] = { title = "当未击中时才显示", tooltipText = "只有在技能未击中、被抵抗等才显示技能名"},
	["DEX_ShowInterruptCrit"] = { title = "暴击方式显示打断", tooltipText = "暴击方式显示打断"},
	["DEX_ShowCurrentOnly"] = { title = "只显示选中目标数值", tooltipText = "只显示当前选中目标的伤害和治疗，非当前选中目标则不显示"},
	["DEX_ShowDamagePeriodic"] = { title = "显示持续伤害", tooltipText = "显示持续攻击的伤害"},
	["DEX_ShowDamageShield"] = { title = "显示反弹伤害", tooltipText = "显示你对敌人伤害的反弹量"},
	["DEX_ShowDamageHealth"] = { title = "显示治疗量", tooltipText = "显示对目标的实际治疗和过量治疗"},
	["DEX_ShowDamagePet"] = { title = "显示宠物伤害", tooltipText = "显示宠物对目标的伤害，含图腾"},
	["DEX_ShowBlockNumber"] = { title = "显示被格挡的伤害", tooltipText = "以xxx-xx方式显示对目标的伤害被格挡、抵抗等的数值"},
	["DEX_ShowDamageWoW"] = { title = "显示系统默认伤害", tooltipText = "显示系统原有的伤害"},
	["DEX_ShowOwnHealth"] = { title = "显示自身治疗", tooltipText = "等目标为自己时也显示治疗量"},
	["DEX_UniteSpell"] = { title = "合并瞬间多次同技能伤害", tooltipText = "如风怒武器、毁伤等瞬间对同一目标造成多次伤害的技能将被合并为一个伤害显示"},
	["DEX_NumberFormat"] = { title = "显示分隔符", tooltipText = "是否显示千分位伤害数字分隔符"},	
	["DEX_NumberFormat"] = { title = "万进制显示", tooltipText = "是否以万为单位显示"},	
	["DEX_ShowSpellIcon"] = { title = "显示技能图标", tooltipText = "是否显示技能图标，选中则替换显示技能名称"},
	["DEX_ShowInterrupt"] = { title = "是否显示中断", tooltipText = "是否显示中断提示"},	
	["DEX_ShowOverHeal"] = { title = "是否显示过量治疗", tooltipText = "是否显示过量治疗，关闭则不提示"},		
};
DEXOptionsFrameSliders = {
	["DEX_Font"] = {  title = "字型 ", minText="字型1", maxText="字型3", tooltipText = "设置文字字型"},
	["DEX_FontSize"] = {  title = "文字大小 ", minText="小", maxText="大", tooltipText = "设置文字的大小"},
	["DEX_OutLine"] = {  title = "字型描边 ", minText="无", maxText="粗", tooltipText = "设置文字的描边效果"},
	["DEX_Speed"] = {  title = "文字移动速度 ", minText="慢", maxText="快", tooltipText = "设置文字的移动速度"},
	["DEX_LOGLINE"] = {  title = "讯息最大条目 ", minText="5", maxText="20", tooltipText = "设置讯息最大显示条目数"},
	["DEX_LOGTIME"] = {  title = "讯息停留时间 ", minText="5秒", maxText="1分钟", tooltipText = "设置讯息文字停留时间"},
};
DEXOptionsColorPickerEx = {
	["DEX_ColorNormal"] = { title = "物理伤害颜色"},
	["DEX_ColorSkill"] = { title = "技能伤害颜色"},
	["DEX_ColorPeriodic"] = { title = "持续伤害颜色"},
	["DEX_ColorHealth"] = { title = "治疗颜色"},
	["DEX_ColorPet"] = { title = "宠物伤害颜色"},
	["DEX_ColorSpec"] = { title = "打断、驱散等颜色"},
	["DEX_ColorMana"] = { title = "法力伤害颜色"},
};

IEQUIP_OPEN = "打开装备管理器";
IEQUIP_QUICKSTRIP = "一键脱光";
IEQUIP_GEARSET = "套装[|cffffffff%d|r] - |T%s:22|t|cff00ff00%s|r";
IEQUIP_STRIPSET = "已脱下套装|cff00ff00[%d]|r中的|cff00ff00%d|r件，穿回请点击原套装按钮";
IEQUIP_STRIP = "已脱下当前着装中的|cff00ff00%d|r件，请手动换回原装备或选择某套装";
IEQUIP_WEARSET = "装备了套装[|cff00ff00%d|r] - |T%s:12:12:0:0|t|cff00ff00%s|r";
IEQUIP_CHANGED = "改动了当前套装|cff00ff00[%d]|r - |T%s:12:12:0:0|t|cff00ff00%s|r";
IEQUIP_NOTASET = "当前着装不再定义为套装";
IEQUIP_MANAGER = "开";
IEQUIP_SYMBOL = "0";

GRIDCLICKSETS_MENUNAME = "点击施法设置";
GRIDCLICKSETS_MENUTIP = "设置血条按钮的点击动作, 例如施法, 协助等.";
GRIDCLICKSETS_TITLE = "点击施法设置";
GRIDCLICKSETS_LOCKWARNING = "战斗中无法设置按钮属性, 设置已保存, 脱离战斗后自动生效。";
GRIDCLICKSETS_SET = "团框点击施法已更新设置。";
GRIDCLICKSETS_SET_WHEEL_UP = "上滚";
GRIDCLICKSETS_SET_WHEEL_DOWN = "下滚";
GRIDCLICKSETS_SET_RESET_WARNING = "当前专精的设置将全部重置且无法恢复！";

xMerchant_Tobrowseitemtooltipstoo = "对物品详细提示信息也进行搜索";

	QN_Title    = "|cff0080ff[任务]|r任务通报功能设置";
	QN_Switch   = "|CFF00FF00通告功能 打开/关闭|r";
	QN_InstanceMode = "|CFFFF7D00在副本中时通报|r";
	QN_RaidMode = "|CFFFF7D00在团队中时通报|r";
	QN_PartyMode= "|CFF30A0C8在小队中时通报|r";
	QN_SoloMode = "单人的时候通报(慎用,老说话BL/LM老远看到来揍你)";
	QN_Sound    = "|CFF00FF00完成时播放提示音|r";
	QN_Debug    = "|CFF00F000任务进度彩色提示|r(|CF000FFF0仅自己可见,组队时此选项自动失效|r)" ;
	QN_NoDetail = "|CFF00FFFF不通报详细进度|r";
	QN_CompleteX = "|CFF00F000任务追踪自动移除已完成任务|r";
	QN_Quest       = "任务";
	QN_Progress    = "进度";
	QN_Complete    = "已完成!";
	QN_Accept      = "接受任务";
	
--Titles
	EnhancedChatFilter_MainFilter = "总开关"
	EnhancedChatFilter_MinimapIcon = "小地图图标"
--Minimap Tooltips
	EnhancedChatFilter_ClickToOpenConfig = "点击打开配置界面"
--Common in tab
	EnhancedChatFilter_ClearUp = "清空"
	EnhancedChatFilter_DoYouWantToClear = "你确定要清空%s么？"
--General
	EnhancedChatFilter_General = "常规"
	EnhancedChatFilter_DND = "'忙碌'玩家"
	EnhancedChatFilter_DNDfilterTooltip = "过滤'忙碌'玩家及其自动回复"
	EnhancedChatFilter_Achievement = "成就刷屏"
	EnhancedChatFilter_AchievementFilterTooltip = "合并显示多个玩家获得同一成就"
	EnhancedChatFilter_RaidAlert = "团队警报"
	EnhancedChatFilter_RaidAlertFilterTooltip = "过滤各类技能/打断喊话提示"
	EnhancedChatFilter_QuestReport = "任务组队"
	EnhancedChatFilter_QuestReportFilterTooltip = "过滤各类组队任务喊话提醒"
	EnhancedChatFilter_SpecSpell = "天赋技能"
	EnhancedChatFilter_SpecSpellFilterTooltip = "如果你已满级则过滤你及宠物的技能/天赋学习信息"
	EnhancedChatFilter_MonsterSay = "怪物说话"
	EnhancedChatFilter_MonsterSayFilterTooltip = "用一个重复过滤器减少聊天框内怪物说话的刷屏。该选项不会影响怪物施放技能时的喊话，但可能屏蔽掉有用的任务提醒。"
	EnhancedChatFilter_RepeatOptions = "重复信息设置"
	EnhancedChatFilter_chatLinesLimit = "重复信息缓存行数"
	EnhancedChatFilter_chatLinesLimitTooltips = "重复信息的行数设定。请根据聊天频道的聊天量调整数值。增加数值会提高内存占用。设为0以关闭重复过滤。默认值20。"
	EnhancedChatFilter_stringDifferenceLimit = "重复信息区分度"
	EnhancedChatFilter_stringDifferenceLimitTooltips = "重复信息判定标准，范围0%至100%。对于同一个人的发言，0%为只过滤完全相同的内容，100%为过滤任意内容。提高设定值会提高相似信息的过滤效果但会提高误处理几率。默认值10%"
	EnhancedChatFilter_MultiLines = "多行喊话过滤"
	EnhancedChatFilter_MultiLinesTooltip = "重复过滤器现在也会过滤同一个人在短时间内的多行信息，这有助于减少各类宏的刷屏但同时也会过滤掉诸如dps统计的各插件通告"
	EnhancedChatFilter_AlsoFilterGroup = "同时过滤小队团队"
	EnhancedChatFilter_AlsoFilterGroupTooltips = "过滤器现在也会过滤小队团队中的发言，启用后你可能错过团队中有用的信息"
	EnhancedChatFilter_UseWithCare = "危险设置"
	EnhancedChatFilter_EnableAdvancedConfig = "启用高级选项"
	EnhancedChatFilter_AdvancedWarningText = "不要随意更改任何你不清楚的设置，不然你很有可能会把ECF玩坏！如果你只是点着玩请取消。如果你已经知道危险性，请继续..."
	EnhancedChatFilter_WhisperWhitelistMode = "密语白名单模式"
	EnhancedChatFilter_WhisperWhitelistModeTooltip = "除了工会、团队、小队、好友发送的密语外，只允许你发送过密语的对方才能对你发起密语|n|cffE2252D慎用！"
	EnhancedChatFilter_Aggressive = "额外过滤器"
	EnhancedChatFilter_AggressiveTooltip = "一些会极大提高过滤效果和|cffE2252D误伤机率|r的过滤器集合，默认不开启。"
--BlackwordList
	EnhancedChatFilter_BlackwordList = "黑名单关键词"
	EnhancedChatFilter_AddBlackWordTitle = "添加新黑名单关键词"
	EnhancedChatFilter_IncludeAutofilteredWord = "%s包含会被自动过滤的字符，将忽略该关键词！"
	EnhancedChatFilter_Regex = "正则"
	EnhancedChatFilter_RegexTooltip = "标记添加的关键词为正则表达式，仅对该次添加的关键词有效"
	EnhancedChatFilter_LesserBlackWord = "次级关键词"
	EnhancedChatFilter_LesserBlackWordTooltip = "标记添加的关键词为次级关键词，仅对该次添加的关键词有效|n当一个信息匹配多个次级关键词时才会被屏蔽。|n|n你应该只在添加那些日常交流会用到，但你希望屏蔽的对方会大量同时使用的词汇时勾选。|n下列情况不建议勾选：各种利用异体字/同音字防屏蔽的词汇、单个汉字。"
	EnhancedChatFilter_LesserBlackwordList = "次级黑名单关键词"
	EnhancedChatFilter_LesserBlackWordThreshold = "次级关键词阈值"
	EnhancedChatFilter_LesserBlackWordThresholdTooltips = "过滤包含至少阈值数目的次级关键词的信息"
	EnhancedChatFilter_BlackList = "关键词列表"
	EnhancedChatFilter_StringIO = "字符串导入导出"
	EnhancedChatFilter_Import = "导入"
	EnhancedChatFilter_StringHashMismatch = "字符串校验错误"
	EnhancedChatFilter_ImportSucceeded = "导入成功"
	EnhancedChatFilter_Export = "导出"
--LootFilter
	EnhancedChatFilter_LootFilter = "拾取过滤器"
	EnhancedChatFilter_AddItemWithID = "添加ID"
	EnhancedChatFilter_NotExists = "不存在"
	EnhancedChatFilter_LootFilterList = "拾取屏蔽列表"
	EnhancedChatFilter_LootQualityFilter = "拾取物品质量"
	EnhancedChatFilter_LootQualityFilterTooltips = "显示拾取物品所需要的最低质量，低于此质量的物品将被过滤"
--FAQ
	EnhancedChatFilter_FAQ = "FAQ"
	EnhancedChatFilter_FAQText = [[这里列出常见的几个问题

1. 如何共享不同账号下的关键词列表和开关设置
    同一账户(如wow1)下的不同角色共享设置，不同账户的无法直接共享。
    你可以用字符串导入导出的方法复制关键词列表，然后人工进行设置。或者手动复制设置/设置硬链接。

2. 为何我添加关键词时总是会有"包含会被自动过滤的字符，将忽略该关键词！"这一错误？
    不要加入标点符号，这些字符会被自动忽略，只需要添加那些汉字。

3. 正则是什么？
    不知道的请不要用。不知道的请不要用。不知道的请不要用。
    如果你想学习请自行百度/谷歌。]]
--AchievementFilter
	EnhancedChatFilter_GotAchievement = "[%s]获得了成就%s！"
	EnhancedChatFilter_And = "、"	
	
		
	CurrencyTracking_CT_TITLE = "|cFF00FF00[信息]|r货币追踪";
	CurrencyTracking_CT_ADDON_NOTES = "追踪所有获取的货币，并显示在游戏画面上";
	CurrencyTracking_CT_OPTIONS = "选项";
	CurrencyTracking_CT_OPT_SHOWONSCREEN = "在游戏画面上显示货币信息";
	CurrencyTracking_CT_OPT_SCALE = "货币信息的大小比例";
	CurrencyTracking_CT_OPT_TRANSPARENCY = "货币信息的透明度";
	CurrencyTracking_CT_OPT_BGTRANSPARENCY = "货币信息的背景透明度";
	CurrencyTracking_CT_OPT_TOOLTIPTRANSPARENCY = "货币信息提示的透明度";
	CurrencyTracking_CT_OPT_TOOLTIPSCALE = "货币信息提示的大小比例";
	CurrencyTracking_CT_OPT_BREAKUPNUMBERS = "将数字加上本地化千分号";
	CurrencyTracking_CT_OPT_ICONPRIORTONUMBER = "先显示通货图标再显示其数量";
  CurrencyTracking_CT_OPT_ALWAYSLOCK = "永远锁定通货信息窗口";
  CurrencyTracking_CT_OPT_ALWAYSLOCK_TIP = "启用则将不仅限于战斗中才锁定。停用则仅会于战斗中才锁定。";
	CurrencyTracking_CT_CURRENCY_TO_TRACK = "在游戏画面上要追踪的货币：";
	CurrencyTracking_CT_CAT_TRACKED_CURRENCY = "追踪的货币";
end
