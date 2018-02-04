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

  CHAT_GUILD_GET = "|Hchannel:GUILD|h[公会]|h%s:";
  CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官员]|h%s:";
  CHAT_RAID_GET = "|Hchannel:RAID|h[团队]|h%s:";
  CHAT_RAID_WARNING_GET = "[通知]%s:";
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[团长]|h%s:";
  CHAT_PARTY_GET = "|Hchannel:PARTY|h[队伍]|h%s:";
  CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[队长]|h%s:";
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向导]|h%s:";
  CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE|h[副本]|h%s:";
  CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE|h[领袖]|h%s:";
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

ACHIEVEMENT_BROADCAST = "%s获得%s!";
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

DANWEI_WAN = "万";
DANWEI_YI = "亿";

----------------Title----------------------
CHAT_WHISPERPOP_TITLE="|cff777777[聊天]|r密语管理";
GEAR_DELETEEMPTYMAILS_TITLE="|cffFFFFFF[邮件]|r删除空邮件";
GEAR_MOLINARI_TITLE="|cff8080ff[专业]|r分解研磨";
NOTICE_INCENTIVEPROGRAM_PANEL_TITLE="|cff8080ff[提醒]|r随机奖励";
NOTICE_INCENTIVEPROGRAM_TITLE="(|cFF69CCF0随机T和N奖励提醒|r)";
LOOT_ANNOUNCERBUTTON_TITLE="拾取通报团队";
CurrencyTracking_TITLE = "|cFF00FF00[信息]|r货币追踪";
RelicInspector_TITLE = "|cff8080ff[提示]|r圣物属性";
Savedinstances_TITLE = "|c00FF68CC[小号]|r管理助手";
QuestNotifier_TITLE = "|cff0080ff[任务]|r任务通报";
----------------Charms----------------------
CHARMS_BUY_STACK="你确定购买|cffff0000一组|r下列物品吗？";
CHARMS_NAKEDIZE="脱光光" ;
CHARMS_TARGET="目标";
CHARMS_MALE="男性";
CHARMS_FEMALE="女性";
CHARMS_HUMAN="人类";
CHARMS_ORC="兽人";
CHARMS_DWARF="矮人";
CHARMS_NIGHTELF="暗夜精灵";
CHARMS_SCOURGE="亡灵";
CHARMS_TAUREN="牛头人";
CHARMS_GNOME="侏儒";
CHARMS_TROLL="巨魔";
CHARMS_GOBLIN="地精";
CHARMS_BLOODELF="血精灵";
CHARMS_DRAENEI="德莱尼";
CHARMS_WORGEN="狼人";
CHARMS_PANDAREN="熊猫人";
CHARMS_EXTEND="全都延长";
----------------Gear----------------------
GEAR_AHHELPER_AUTOSELL="-- |cFF00DDFFAlt+右键 |r直接上货/出价--";
MAIL_RECEIVELETTERS="收信";
MAIL_RECEIVECOINS="收G";
MAIL_DELETEEMPTYMAILS="删空邮件";
MAIL_OPENMAILBOX=" - 你得先打开收件箱啊~";
MOLINARI_BLACKLIST="黑名单";
MOLINARI_DRAGTOADD="將物品拖曳到下方的視窗內，加入到忽略清單。";
MOLINARI_POTENTIALLYpotentially="請將要避免不小心被處理掉的物品加入忽略清單。";
MOLINARI_REMOVEITEM="點一下右鍵移除物品";
NOMICAKES_POTENTIAL="潜在的食谱";
SUBSPEC_NEWSET="[新配置]";
SUBSPEC_LEFTSHIFT="左移";
SUBSPEC_RIGHTSHIFT="右移";
SUBSPEC_NEWPROFILENAME="输入新的配置文件名称";
TRAINALL_ALLLEARN="全 学";
----------------Loot----------------------
PLH_LONG_ADDON_NAME = "|cff02F78E[装备]|r交易助手";
PLH_AUTHOR_NAME = 'Author:Madone-Zul\'Jin';
PLH_ADDON_NOTE = "拾取装备可交易提示助手";
PLH_INCLUDE_BOEITEM = "包含<装绑>物品";
PLH_SPEC_ONLY = "只适配当前专精";
PLH_NOTIFY_GROUPS = "通报到队伍/团队";
PLH_COORDINATE_ROLL = "发起R点需求 (有A才行)";
PLH_MANAGE_ROLLS = "需求装备的人密团长 <交易> 或 <交易 [装备链接]> 來R。";
PLH_NO_LOWLEVEL = "不包含低等级角色";
PLH_SHOW_INRAID = "在团框中显示可交易的装备";
PLH_THANKS_ALL = "感谢所有愿意把装备分享给最需要的人的玩家！\n毕竟要有爱，哪来那么多魔兽争霸。";
----------------Map----------------------
FOGLIGHT_HYBIRD = "混合";
FOGLIGHT_DISABLE = "禁用";
FOGLIGHT_ALL = "全地貌";
FOGLIGHT_NONE = "无地貌";
MAPTREASURES_SHOW = "显示宝藏";
MINIMAP_MENU_BARSTYLE = "动作条样式";
MINIMAP_MENU_KEYBIND = "按键绑定";
MINIMAP_MENU_QUESTBUTTON = "任务按钮";
MINIMAP_MENU_SPECIALBUTTON = "特殊按钮";
MINIMAP_MENU_AURACONFIG = "技能监控";
MINIMAP_MENU_AURADIY = "  --自添加技能";
MINIMAP_MENU_CONTROLNOTICE = "控制提示";
MINIMAP_MENU_CASTBAR = "施法条";
MINIMAP_MENU_ONOFF = "开 关";
MINIMAP_MENU_Click = "点击施法";
MINIMAP_MENU_DAMAGESTYLE = "伤害显示";
MINIMAP_MENU_GRIDTOOL = "网格工具";
MINIMAP_MENU_lOOTHELPER = "求装助手";
MINIMAP_MENU_DISTANCE = "距离助手";
MINIMAP_MENU_COMBOPOINTS = "简易连击点";
MINIMAP_MENU_COMPAREITEMS = "对比装备";
MINIMAP_MENU_SWITCHUF = "头像切换";
MINIMAP_MENU_AFKSCREEN = "屏保(AFK)";
MINIMAP_MENU_CHECKFOODSSS = "吃喝检查";
MINIMAP_MENU_QUSETIONANSWER = "常见问题";
MINIMAP_MENU_UISETTING = "设置";
MINIMAP_MENU_MORE = "    更多设置...";
----------------Notice----------------------
COMBATNOTIFICATIONINFO_INFO_WOWTIME_TIP = "即将在15分钟内开始";
COMBATNOTIFICATIONINFO_need = " 有奖励包包了!";
COMBATNOTIFICATIONINFO_Tank = "|cffA52A00<坦克>|r";
COMBATNOTIFICATIONINFO_Healer = "|cff009300<治疗>|r";
COMBATNOTIFICATIONINFO_DPS = "|cffEE3A8C<输出>|r";
COMBATNOTIFICATIONINFO_combat_enter = "- 进 入 战 斗 -";
COMBATNOTIFICATIONINFO_combat_leav = "- 离 开 战 斗 -";
COMBATNOTIFICATIONINFO_Tank_G = "<坦克>";
COMBATNOTIFICATIONINFO_Healer_G = "<治疗>";
COMBATNOTIFICATIONINFO_DPS_G = "<输出>";
COMBATNOTIFICATIONINFO_CLICK = "<%s> → %s... 点门拉人！";
COMBATNOTIFICATIONINFO_NOFOOD = "木吃甜点: ";
COMBATNOTIFICATIONINFO_NOFLASK = "木喝合剂: ";
COMBATNOTIFICATIONINFO_NORUNE = "木吃符文: ";
COMBATNOTIFICATIONINFO_ALLBUFFED = "已获得所有增益!妥妥的了~";
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
INCENTIVEPROGRAM_TOOLTIP_IGNORE_LFR = "所有的副本都已经打过就不再提醒或显示统计，但仍然存在于左键菜单中。";
INCENTIVEPROGRAM_TOOLTIP_HIDE_ALWAYS = "总是隐藏框架。此功能适用于数据中转。输入/ip撤销。";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_1 = "你可以在 http://www.wowhead.com/sounds 找到音乐ID。当你找到后，该音乐的ID在IE的地址栏中，如 (i.e. http://www.wowhead.com/sound=47615/ui-groupfinderreceiveapplication)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_2 = "你可以在 http://www.wowhead.com/sounds 找到音乐ID。.当你找到后，该音乐的ID在IE的地址栏中，如 (i.e. http://www.wowhead.com/sound=18019/ui-bnettoast)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_REPEATS = "音效播放的次数";
INCENTIVEPROGRAM_TOOLTIP_CYCLE_COUNT = "当新的提醒出现时，三个硬币图案旋转的次数";
INCENTIVEPROGRAM_TOOLTIP_CONTINUOUSLY_CYCLE = "当新的提醒出现时，将不停地旋转硬币图案";
INCENTIVEPROGRAM_CHANNEL = "声音通道选择:";
INCENTIVEPROGRAM_CHANNEL_DISC="这是默认使用的通道。";
INCENTIVEPROGRAM_MUSIC = "音乐";
INCENTIVEPROGRAM_SOUND_ID = "音效ID";
INCENTIVEPROGRAM_REPEATS = "重复";
INCENTIVEPROGRAM_AMBIENCE = "环境音";
INCENTIVEPROGRAM_MASTER="主通道";
INCENTIVEPROGRAM_MASTER_DISC="即使音乐音效被关闭，也可以通过主通道进行播放。";
INCENTIVEPROGRAM_ALERT_PING = "警报铃声";
INCENTIVEPROGRAM_TOAST_PING = "烤面包叮声";
INCENTIVEPROGRAM_TEST = "测试";
INCENTIVEPROGRAM_ANIM_CYCLES = "循环";
INCENTIVEPROGRAM_CONTINUOUSLY_CYCLE = "不断循环";
INCENTIVEPROGRAM_RESET_POSITION = "重置设置";
REMINDER_BAGS_SPACE = "背包空间剩余  ";
BARRELSOEASY_NO_GROUP = "啊噢.你在队伍里会导致欢乐桶插件抽风";
BARRELSOEASY_NO_GROUPS = "Sorry，在队伍你会导致每次点击欢乐桶后，标记都会因为刷新而消失.";
BARRELSOEASY_START_FIRST = "请开始第一轮,小桶子运动完才能开始标记。";
----------------Role----------------------
PVPPP_KILL_MSG = "荣誉击杀:%s/%s";
PVPPP_KILL_AVG = "过去的一小时中一共获取了 %s 个荣誉击杀";
----------------UFs----------------------
UFRAMESTYLE_BLINKHEALTHTEXT_ANCHOR = "左键-拖动位置\n右键-锁定位置";

----------------BRP----------------------
BRP_Description="使用 /brp 解锁和锁定位置，同时 /brp 也可复位位置。";
BRP_AlwaysShow="总是展开战利品列表";
BRP_FillDirection="战利品清单排序方式";

U["Lock UIScale"] = "锁定推荐UI缩放值"
U["Lock Chat"] = "锁定聊天窗口设置"
U["Minimap Clock"] = "小地图时间"
U["Setup UIScale"] = "调整UI缩放"
U["PlayerFrame Scale"] = "头像缩放"
U["Map Scale"] = "世界地图缩放"
U["Map Coords"] = "显示世界地图坐标"
U["Enable Reminder"] = "启用职业技能缺失提示"
U["Enable Familiar"] = "启用职业监控-FS"
U["Enable Stagger"] = "启用职业监控-WST"
U["Enable Statue"] = "启用职业监控-雕像"
U["Enable Totems"] = "启用职业监控-SM"
U["Destroy Totems"] = "左键点击摧毁图腾"
U["Enable Marksman"] = "启用职业监控-LR"
U["Enable BloodyHell"] = "启用职业监控-DK"
U["kAutoOpen"] = "自动打开宝箱"
U["QuickQueue"] = "自动确认排本职责"
U["AutoConfirmRoll"] = "自动Roll"
U["Enable Nameplate"] = "启用姓名板(血条)"
U["Max Auras"] = "最大法术图标数"
U["Auras Size"] = "法术图标大小"
U["Nameplate InsideView"] = "已接触姓名板停留视野内"
U["Tank Mode"] = "T仇恨染色样式"
U["Auras Border"] = "显示技能类型染色边框"
U["Friendly CC"] = "友方玩家职业染色"
U["Hostile CC"] = "敌对玩家职业染色"
U["PlayerPlate Aura"] = "显示玩家姓名板法术"
U["NP Width"] = "姓名板长度"
U["NP Height"] = "姓名板宽度"
U["Nameplate MinAlpha"] = "姓名板最小透明度"
U["Faster Loot"] = "自动拾取加速"
U["Mail Tool"] = "启用邮件增强"
U["Hide Error"] = "战斗中屏蔽红字错误"
U["SoloInfo"] = "单刷难度提醒"
U["Rare Alert"] = "稀有 or 宝藏提示"
U["Alert In Chat"] = "同时通报在聊天框"
U["Easy Focus"] = "启用Shift+左键快速焦点"
U["No Talking"] = "干掉NPC BB的框"
U["Hide Bossbanner"] = "关闭副本掉落通知提示"
U["FriendGroups"] = "好友分组功能"
U["Whisper Invite"] = "启用密语自动邀请"
U["Guild Invite Only"] = "只邀请公会成员"
U["Whisper Keyword"] = "密语关键词(空格隔开)"
U["Enable AuraWatch"] = "启用技能监视"
U["AuraWatch Tooltip"] = "显示技能监视鼠标提示框"
U["Enable Actionbar"] = "启用动作条"
U["Actionbar Style"] = "动作条样式"
U["Bar4 Fade"] = "渐隐右侧动作条1"
U["Bar5 Fade"] = "渐隐右侧动作条2"
U["Actionbar Hotkey"] = "快捷键"
U["Actionbar Macro"] = "宏名称"
U["Actionbar Item Counts"] = "物品堆叠计算"
U["Show Cooldown"] = "技能冷却"
U["Decimal Cooldown"] = "冷却低于3秒时显示小数点"
U["ClassColor BG"] = "技能栏边框职业染色"


	U["NFG"] = "不使用公修"
	U["New"] = "新"
	U["Mail"] = "邮件"
	U["No Mail"] = ""
 	U["Bags"] = "背包"
	U["Total"] = "总计"
	U["Used"] = "使用"
	U["CurrencyPanel"] = "货币面板"
	U["AutoSell Junk"] = "自动出售垃圾(Ctrl)"
	U["Selljunk Calculate"] = "背包中待售灰色物品总计"
	U["Your vendor trash has been sold and you earned"] = "你通过捡破烂赚了"
	U["D"] = "耐久"
	U["Low Durability"] = "你的装备耐久度过低！"
	U["PlayerPanel"] = "角色面板"
	U["AutoRepair"] = "自动修理(右键)"
	U["Repair cost covered by G-Bank"] = "你偷偷用了公会修理"
	U["Repair cost"] = "修理花费"
	U["Go farm newbie"] = "菜鸟连装备都修不起,快去farm吧"
	U["none"] = "无"
	U["My Coordinate"] = "我的坐标"

	U["Friends list:"] = "好友列表:"
	U["Friends"] = "好友"
	U["Earned:"] = "获得:"
	U["Spent:"] = "花费:"
	U["Deficit:"] = "亏损:"
	U["Profit:"] = "盈利:"
	U["Session"] = "本次登录"
	U["Server"] = "服务器"
	U["Character"] = "当前角色"
	
	U["Guild"] = "公会"
	U["No Guild"] = "没人要"
	U["Current"] = "目前"
	U["Daily"] = "今天"
	U["Sorting"] = "排序"
	U["Sorting by:"] = "排序方式:"
	U["Excessive"] = "公会在线成员过多,仅显示部分"

	U["Hidden"] = "隐藏"
	U["Shift"] = "Shift展开"	
	U["Default UI Memory Usage:"] = "系统插件内存:"
	U["Total Memory Usage:"] = "总内存使用:"
	U["Garbage collected"] = "释放內存"
	U["ManulCollect"] = "整理内存"
	U["AutoCollect"] = "自动整理内存(右键)"
	U["My Position"] = "我的位置"
	U["System"] = "系統"
	U["Home"] = "本地延迟"
	U["Latency"] = "世界延迟"
	U["CPU Usage"] = "显示CPU占比(右键)"
	U["Toggle CPU Usage"] = "你需要重载界面来启用这个功能。"
	U["Reload UI(on)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重载界面之后查看插件的CPU占用，请重载界面！"
	U["Reload UI(off)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重载界面之后隐藏插件的CPU占用显示模块，请重载界面！"
	U["Are you sure to reset the gold count?"] = "你想要重置[战网全部角色]金币统计吗？"
	U["WoW"] = "<魔兽世界>"
	U["BN"] = "<战网好友>"
	U["SpecPanel"] = "天赋面板"
	U["Change Spec"] = "切换专精(左键)"
	U["Change Loot"] = "切换拾取专精(右键)"
	U["Reset Gold"] = "重置统计(右键)"
	U["BN Info"] = "发送战网通告"
	U["Toggle Calendar"] = "日历"
	U["Toggle Clock"] = "时钟"
	U["WorldMap"] = "打开地图"
	U["Send My Pos"] = "发送位置"
	U["Show Menus"] = "快捷菜单(右键)"
	U["Show Friends"] = "好友面板"
	U["No Online"] = "当前没有好友在线"
	U["NotInGuild"] = "你当前没有加入公会"
	U["LookForGuild"] = "公会查找器"
	U["Hide Members"] = "在线成员过多, %d人已隐藏"
	U["Show Guild"] = "公会面板"
	U["Unknown"] = "地点获取失败"
	U["Timewarped"] = "时空扭曲徽章奖励"
	U["Mean One"] = "冬幕节日常"
	U["Deathtalon"] = "死爪"
	U["Terrorfist"] = "泰罗菲斯特"
	U["Doomroller"] = "末日之轮"
	U["Vengeance"] = "维金斯"
	U["Tanaan"] = "塔纳安丛林"
	U["Platinum Invasion"] = "要塞入侵 - 白金"
	U["Gold Invasion"] = "要塞入侵 - 黄金"
	U["Silver Invasion"] = "要塞入侵 - 白银"
	U["Bronze Invasion"] = "要塞入侵 - 青铜"
	U["Blingtron"] = "布林顿每日礼包"
  U["Legion Invasion"] = "军团突袭"
  U["Next Invasion"] = "下一次突袭"
  U["Search Invasion Group"] = "搜索侵入点队伍"

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


  ACP_AddonControlPanel = "插件管理";
			ACP_SomeprotectedaddonsarenloadedReloadnow = "ACP：部分受保护插件没有被加载。现在重载插件么？";
			ACP_ActiveEmbeds = "单独使用";
			ACP_AddOns = "插件";
			ACP_Addonnotvalid = "无效的插件：<%s>";
			ACP_AddonsLoaded = "插件设置[%s]已加载。";
			ACP_Addonsrenamedto = "插件设置[%s]已改名为[%s]。";
			ACP_AddonsSaved = "插件设置[%s]已保存。";
			ACP_AddonsUnloaded = "插件设置[%s]已卸载。";
			ACP_Addtocurrentselection = "添加当前选择";
			ACP_Author = "作者";
			ACP_ClicktoenableprotectmodeProtectedaddonswillnotbedisabled = "点击启用保护模式。受保护插件不会被禁用。";
			ACP_Close = "关闭";
			ACP_Default = "默认";
			ACP_Dependencies = "依赖";
			ACP_DisableAll = "全部禁用";
			ACP_DisabledonreloadUI = "重载插件后禁用";
			ACP_Embeds = "内置";
			ACP_EnableAll = "全部启用";
			ACP_EnablingyourUI = "*** 启用 <%s>，%s 你的插件 ***";
			ACP_Enterthenewnamefor = "输入[%s]的新名字：";
			ACP_Load = "已加载";
			ACP_LoadableOnDemand = "需要时加载";
			ACP_Loaded = "已载入";
			ACP_Loadedondemand = "需要时加载";
			ACP_LoDChildEnableisnow = "需要时加载的子插件：%s";
			ACP_MemoryUsage = "内存占用";
			ACP_Noinformationavailable = "无可用信息.";
			ACP_Recursive = "递归";
			ACP_RecursiveEnableisnow = "递归加载的插件：%s";
			ACP_Reload = "重载";
			ACP_ReloadUI = "重载插件";
			ACP_ReloadyourUserInterface = "重载插件？";
			ACP_Removefromcurrentselection = "移除当前选择";
			ACP_Rename = "重命名";
			ACP_ResurseToolTip = "当启用一个插件时，尝试启用此插件所依赖的插件。";
			ACP_Save = "保存";
			ACP_Savethecurrentaddonlistto = "保存当前插件设置为[%s]？";
			ACP_Set = "配置： ";
			ACP_Sets = "配置";
			ACP_Status = "状态";
			ACP_UnknownAddonRequired = "*** 需要未知插件 <%s> ***";
			ACP_UseSHIFTtooverridethecurrentenablingofdependanciesbehaviour = "使用 Shift 键无视目前的递归设定。";
			ACP_Version = "版本";
			ACP_whenperformingareloadui = "重载插件时.";

    
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
	QN_Colon       = "：";
	QN_Quest       = "任务";
	QN_Progress    = "进度";
	QN_Complete    = "已完成!";
	QN_Accept      = "接受任务";
	
	
	WHISPERPOP_LOCALE = {
		["title"] = "|cffC495DD[聊天]|r密语管理",
		["tip tooltip"] = "拖拽左键以移动此提示图标，点击左键打开密语管理主框体。",
		["no new messages"] = "没有未阅读消息",
		["new messages from"] = "未阅读消息来自: ",
		["receive only"] = "仅显示接收到的消息",
		["sound notifying"] = "声音提示",
		["time"] = "显示时间标签",
		["receive only tooltip"] = "如果选中，外发的消息将不会显示在列表中。",
		["sound notifying tooltip"] = "如果选中，每次接收到新消息时将发出声音提示。",
		["time tooltip"] = "如果选中，时间标签将被添加到每一行消息文字前面。",
		["delete messages"] = "删除所有消息",
		["delete messages tooltip"] = "点击删除所有现有的消息。",
		["keep messages"] = "保留历史记录",
		["keep messages tooltip"] = "保留一天以内的消息，而且同帐号的各个角色均可查看。\n \n|cffff3333严重警告：因密语记录可以打开魔兽存档随意查看，因此请不要在网吧等公共环境开启此选项，以免信息泄漏。|r",
		["toggle frame"] = "    打开/关闭密语框体",
	};
	
	CurrencyTracking_ADDON_NOTES = "追踪所有获取的货币，并显示在游戏画面上";
	CurrencyTracking_OPTIONS = "选项";
	CurrencyTracking_DISPLAYSETTINGS = "显示设定";
	CurrencyTracking_OPT_SHOWONSCREEN = "在游戏画面上显示通货信息";
	CurrencyTracking_SHOWTOOLTIP = "显示提示";
	CurrencyTracking_SHOWTOOLTIPINFO = "显示所有货币信息提示";
	CurrencyTracking_SHOW_MONEY = "在游戏画面上显示现金信息";
	CurrencyTracking_ENABLE_SHOW_MONEY_WITH_CURRENCIES = "启用后显示货币信息提示和货币总金额。";
	CurrencyTracking_SHOW_ICON = "仅显示图标";
	CurrencyTracking_SHOW_ICON = "仅显示货币或道具的图标，不显示金额";
	CurrencyTracking_RESET_POSITION = "重置位置";
	CurrencyTracking_RESET_SCREEN_POSITION = "重置框体在界面的显示位置。";
	CurrencyTracking_BREAKUP_NUMBERS = "千分号";
	CurrencyTracking_OPT_BREAKUP_NUMBERS = "将数字加上本地化千分号。";
	CurrencyTracking_HIDEZERO = "隐藏未获取的货币";
  CurrencyTracking_AUTOHIDEITEMS = "自动隐藏数值为0的货币和道具";
	CurrencyTracking_ICON_FIRST = "图标前置";
	CurrencyTracking_OPT_ICON_PRIORTO_NUMBER = "先显示通货图标再显示其数量";
	CurrencyTracking_OPT_ALWAYS_LOCK = "永远锁定通货信息窗口";
	CurrencyTracking_OPT_ALWAYS_LOCK_TIP = "启用则将不仅限于战斗中才锁定。停用则仅会于战斗中才锁定。";
	CurrencyTracking_OPT_HIDE_IN_PETBATTLE = "宠物对战时隐藏";
  CurrencyTracking_OPT_AUTO_HIDE_IN_PETBATTLE = "在宠物对战开始后自动隐藏框体";
	-- Scale and Transparency
  CurrencyTracking_SCALE_TRANSPARENCY = "大小和透明度";
  CurrencyTracking_ON_SCREEN_FRAME = "显示框体";
  CurrencyTracking_TOOLTIP = "鼠标提示";
  CurrencyTracking_SCALE = "大小";
  CurrencyTracking_TRANSPARENCY = "透明度";
  CurrencyTracking_BACKGROUND = "背景";
  CurrencyTracking_OPT_BGTRANSPARENCY = "通货信息的背景透明度";
  -- Others
  CurrencyTracking_MAXITEMS = "每行最大项目数";
  CurrencyTracking_MAXITEMSINFO = "设置每行显示的最大项目数量。设置为0则为无数量限制。";
  CurrencyTracking_CURRENCY_TO_TRACK = "在游戏画面上要追踪的通货：";
  CurrencyTracking_TRACKED_CURRENCY = "追踪的货币";
  CurrencyTracking_TRACKED_ITEMS = "追踪的物品";
  CurrencyTracking_PROFILE_OPTIONS = "设定选项";

	TinyInspectL = {
    ShowItemBorder              = "物品直角边框",
    EnableItemLevel             = "物品等级显示",
    ShowColoredItemLevelString  = "装等文字随物品品质",
    ShowItemSlotString          = "显示物品部位文字",
    ShowInspectAngularBorder    = "观察面板直角边框",
    ShowInspectColoredLabel     = "观察面板高亮橙装武器标签",
    ShowCharacterItemSheet      = "显示玩家自己装备列表",
    ShowOwnFrameWhenInspecting  = "观察同时显示自己装备列表",
    ShowItemStats               = "显示装备属性统计",
    DisplayPercentageStats      = "装备属性换算成百分比数值",
    EnablePartyItemLevel        = "开启小队队友装等",
    SendPartyItemLevelToSelf    = "发送队友装等到自己面板",
    SendPartyItemLevelToParty   = "发送队友装等到队伍频道",
    ShowPartySpecialization     = "显示队友天赋文字",
    EnableRaidItemLevel         = "开启团队装等",
    EnableMouseItemLevel        = "开启鼠标装等",
    EnableMouseSpecialization   = "显示鼠标天赋",
    EnableMouseWeaponLevel      = "显示武器等级",
    Bag                         = "背包",
    Bank                        = "银行",
    Merchant                    = "商人",
    Trade                       = "交易",
    Auction                     = "拍卖行",
    AltEquipment                = "ALT换装",
    GuildBank                   = "公会银行",
    GuildNews                   = "公会新闻",
    PaperDoll                   = "人物面板",
    Chat                        = "聊天",
    ["general.mask"]                        = "顶部遮罩",
    ["general.statusbarText"]               = "HP文字",
    ["general.background"]                  = "背景颜色",
    ["general.borderColor"]                 = "边框颜色",
    ["general.scale"]                       = "框架缩放",
    ["general.borderSize"]                  = "边框大小",
    ["general.statusbarHeight"]             = "HP高度",
    ["general.borderCorner"]                = "边框样式",
    ["general.bgfile"]                      = "背景材质",
    ["general.statusbarPosition"]           = "HP位置",
    ["general.statusbarOffsetX"]            = "HP位置X边距",
    ["general.statusbarOffsetY"]            = "HP位置Y偏移",
    ["general.statusbarFontSize"]           = "HP文字大小",
    ["general.statusbarFont"]               = "HP文字字體",
    ["general.statusbarFontFlag"]           = "HP字体描边",
    ["general.statusbarTexture"]            = "HP背景材质",
    ["general.statusbarColor"]              = "HP颜色",
    ["general.anchor.position"]             = "框架锚点",
    ["general.anchor.returnInCombat"]       = "战斗时复位",
    ["general.anchor.returnOnUnitFrame"]    = "UnitFrame上时复位",
    ["general.alwaysShowIdInfo"]            = "始终显示id信息(关闭后按住alt/shift显示)",
    ["general.skinMoreFrames"]              = "样式应用于更多框架 |cffcccc33(重载生效)|r",
    
    ["item.coloredItemBorder"]              = "物品边框染色",
    ["item.showItemIcon"]                   = "显示物品图标",
    ["quest.coloredQuestBorder"]            = "任务边框染色",
    
    ["unit.player.anchor.position"]         = "框架锚点",
    ["unit.player.anchor.returnInCombat"]   = "战斗时复位",
    ["unit.player.anchor.returnOnUnitFrame"] = "UnitFrame上时复位",
    ["unit.player.background"]              = "背景染色",
    ["unit.player.coloredBorder"]           = "边框染色",
    ["unit.player.showTarget"]              = "显示目标",
    ["unit.player.showTargetBy"]            = "显示被关注",
    ["unit.player.showModel"]               = "显示模型",
    ["unit.player.grayForDead"]             = "死亡目标灰度染色",
    ["unit.player.elements.roleIcon"]       = "角色图标",
    ["unit.player.elements.raidIcon"]       = "标记图标",
    ["unit.player.elements.pvpIcon"]        = "PVP状态",
    ["unit.player.elements.factionIcon"]    = "阵营图标",
    ["unit.player.elements.classIcon"]      = "职业图标",
    ["unit.player.elements.title"]          = "头衔",
    ["unit.player.elements.name"]           = "名称",
    ["unit.player.elements.realm"]          = "服务器",
    ["unit.player.elements.statusAFK"]      = "AFK",
    ["unit.player.elements.statusDND"]      = "DND",
    ["unit.player.elements.statusDC"]       = "OFFLINE",
    ["unit.player.elements.guildName"]      = "公会名称",
    ["unit.player.elements.guildIndex"]     = "公会阶级数字",
    ["unit.player.elements.guildRank"]      = "公会阶级名称",
    ["unit.player.elements.guildRealm"]     = "公会服务器",
    ["unit.player.elements.levelValue"]     = "等级",
    ["unit.player.elements.factionName"]    = "阵营",
    ["unit.player.elements.gender"]         = "性别",
    ["unit.player.elements.raceName"]       = "种族",
    ["unit.player.elements.className"]      = "职业",
    ["unit.player.elements.isPlayer"]       = "玩家",
    ["unit.player.elements.role"]           = "角色",
    ["unit.player.elements.moveSpeed"]      = "移动速度",
    ["unit.player.elements.zone"]           = "地区",
    
    ["unit.npc.anchor.position"]            = "框架锚点",
    ["unit.npc.anchor.returnInCombat"]      = "战斗时复位",
    ["unit.npc.anchor.returnOnUnitFrame"]   = "UnitFrame上时复位",
    ["unit.npc.background"]                 = "背景染色",
    ["unit.npc.coloredBorder"]              = "边框染色",
    ["unit.npc.showTarget"]                 = "显示目标",
    ["unit.npc.showTargetBy"]               = "显示被关注数",
    ["unit.npc.grayForDead"]                = "死亡目标灰度染色",
    ["unit.npc.elements.raidIcon"]          = "标记图标",
    ["unit.npc.elements.classIcon"]         = "职业图标",
    ["unit.npc.elements.questIcon"]         = "任务图标",
    ["unit.npc.elements.npcTitle"]          = "头衔",
    ["unit.npc.elements.name"]              = "名称",
    ["unit.npc.elements.levelValue"]        = "等级",
    ["unit.npc.elements.classifBoss"]       = "首领",
    ["unit.npc.elements.classifElite"]      = "精英",
    ["unit.npc.elements.classifRare"]       = "稀有",
    ["unit.npc.elements.creature"]          = "类型",
    ["unit.npc.elements.reactionName"]      = "声望",
    ["unit.npc.elements.moveSpeed"]         = "移动速度",
    
    ["spell.background"]                    = "背景顔色",
    ["spell.borderColor"]                   = "边框颜色",
    ["spell.showIcon"]                      = "法术图标",
    
    ["dropdown.inherit"]        = "|cffffee00继承全局|r",
    ["dropdown.default"]        = "|cffaaaaaa系统默认|r",
    ["dropdown.angular"]        = "直角边框",
    ["dropdown.bottom"]         = "底部",
    ["dropdown.top"]            = "顶部",
    ["dropdown.auto"]           = "智能匹配",
    ["dropdown.smooth"]         = "百分比动态",
    ["dropdown.cursorRight"]    = "鼠标右侧",
    ["dropdown.cursor"]         = "|cff33ccff鼠标|r",
    ["dropdown.static"]         = "|cff33ccff固定位置|r",
    ["dropdown.class"]          = "职业染色",
    ["dropdown.level"]          = "等差染色",
    ["dropdown.reaction"]       = "声望染色",
    ["dropdown.itemQuality"]    = "物品品质染色",
    ["dropdown.selection"]      = "类型染色",
    ["dropdown.faction"]        = "阵营染色",
    ["dropdown.dark"]           = "深黑",
    ["dropdown.alpha"]          = "透明",
    ["dropdown.gradual"]        = "渐变",
    ["dropdown.rock"]           = "岩石",
    ["dropdown.marble"]         = "大理石",

    ["dropdown.none"]           = "|cffaaaaaa(无)|r",
    ["dropdown.reaction5"]      = "声望友好以上",
    ["dropdown.reaction6"]      = "声望尊敬以上",
    ["dropdown.inraid"]         = "团队时",
    ["dropdown.incombat"]       = "战斗中",
    ["dropdown.inpvp"]          = "战场里",
    ["dropdown.inarena"]        = "竞技场",
    ["dropdown.ininstance"]     = "副本时",
    ["dropdown.samerealm"]      = "同服务器",
    ["dropdown.samecrossrealm"]     = "同跨服务器",
    ["dropdown.not reaction5"]      = "|cffff3333非|r声望友好以上",
    ["dropdown.not reaction6"]      = "|cffff3333非|r声望尊敬以上",
    ["dropdown.not inraid"]         = "|cffff3333非|r团队时",
    ["dropdown.not incombat"]       = "|cffff3333非|r战斗中",
    ["dropdown.not inpvp"]          = "|cffff3333非|r战场里",
    ["dropdown.not inarena"]        = "|cffff3333非|r竞技场",
    ["dropdown.not ininstance"]     = "|cffff3333非|r副本时",
    ["dropdown.not samerealm"]      = "|cffff3333非|r同服务器",
    ["dropdown.not samecrossrealm"]  = "|cffff3333非|r同跨服务器",
    
    ["headerFont"]        = "标头字体",
    ["headerFontSize"]    = "标头字体大小",
    ["headerFontFlag"]    = "标头字体描边",
    ["bodyFont"]          = "内容字体",
    ["bodyFontSize"]      = "内容字体大小",
    ["bodyFontFlag"]      = "内容字体描边",
    
    ["Anchor"]   = "锚点器",
    
    ["TargetBy"] = "被关注",
  };
BINDING_NAME_InspectRaidFrame = "显示团队观察面板"
end
