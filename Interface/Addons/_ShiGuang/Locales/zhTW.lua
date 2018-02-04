local _, _, U, _ = unpack(select(2, ...))
if GetLocale() == "zhTW" then
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

  CHAT_GUILD_GET = "|Hchannel:GUILD|h[公會]|h %s:";
  CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官員]|h %s:"  ;
  CHAT_RAID_GET = "|Hchannel:RAID|h[團隊]|h %s:";
  CHAT_RAID_WARNING_GET = "[通知] %s:";
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[團長]|h %s:";
  CHAT_PARTY_GET = "|Hchannel:PARTY|h[隊伍]|h %s:";
  CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[隊長]|h %s:";
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向導]|h %s:";
  CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE|h[副本]|h %s:";
  CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE|h[向導]|h %s:";
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

ACHIEVEMENT_BROADCAST = "%s獲得%s!";
HEALTH_LOW = "<<<生命危急>>>";
CURRENTLY_EQUIPPED = "|cffffff9a-當前裝備-|r";     --"|cffffff9a★★★★"..CURRENTLY_EQUIPPED.."★★★★|r"
ITEM_BIND_QUEST = "|cffff2020★任務物品|r";
ITEM_LEVEL = "|cff00ffff物品等級: %d|r"; -- Blue color
--ITEM_CREATED_BY = ""	-- No creator name
--ITEM_SOCKETABLE = ""	-- No gem info line
EMPTY_SOCKET_RED = "|cffFF4040紅|r";
EMPTY_SOCKET_YELLOW = "|cffffff40黃|r";
EMPTY_SOCKET_BLUE = "|cff6060ff藍|r";
TRANSMOGRIFY_TOOLTIP_APPEARANCE_UNKNOWN = "|cffFF4040你尚未收藏過此外觀|r";
TRANSMOGRIFY_TOOLTIP_ITEM_UNKNOWN_APPEARANCE_KNOWN = "|cff6060ff你擁有此外觀，但不是來自此物品|r";

WORLD_CHANNEL = "世界頻道";
WORLD_CHANNEL_NAME = "世界頻道";

Welcome_loginChatText1 = "<<<-------------- 有你們的魔獸，才是世界 ----";
Welcome_loginChatText2 = "|cFFBF00FFMao|r|cFF00DDFFR|r|cffff8800 UI|r|cff3399ff By Shiguang + TuTu v.180121|r";
Welcome_loginChatText3 = "|cff02F78E大大大的感謝|r|cffC495DDSiweia|r|cff02F78E大大,向他學到了好多.|r";
Welcome_loginChatText4 = "-------  v2.3.0 For 7.3.5  --------------->>>";
Welcome_SmallText1 = "[ 微美化介面 ]";
Welcome_SmallText2 = "[ 全職業適用無障礙 ]";
Welcome_SmallText3 = "[ 開袋即食 輕優化 無需設置 ]";
Welcome_SmallText4 = "[ 插件每月21日UI官網 準時更新發佈 ]";
Welcome_Large1 = "[ V 2.3.0 ]";
Welcome_Large2 = "[ Hi Legion 7.3.5 ]";
Welcome_Large3 = "[ 右鍵小地圖便捷設置 ]";
Welcome_Large4 = "[ 系統自帶功能，插件有針對性刪減 ]";
Welcome_Large5 = "更多內容詳見官網· · ·";

DANWEI_WAN = "萬";
DANWEI_YI = "億";

----------------Title----------------------
CHAT_WHISPERPOP_TITLE="|cff777777[聊天]|r密語管理";
GEAR_DELETEEMPTYMAILS_TITLE="|cffFFFFFF[郵件]|r刪除空郵件";
GEAR_MOLINARI_TITLE="|cff8080ff[專業]|r分解研磨";
NOTICE_INCENTIVEPROGRAM_PANEL_TITLE="|cff8080ff[提醒]|r隨機獎勵";
NOTICE_INCENTIVEPROGRAM_TITLE="(|cFF69CCF0隨機T和N獎勵提醒|r)";
LOOT_ANNOUNCERBUTTON_TITLE="拾取通報團隊";
CurrencyTracking_TITLE = "|cFF00FF00[信息]|r通貨追蹤";
RelicInspector_TITLE = "|cff8080ff[提示]|r聖物屬性";
Savedinstances_TITLE = "|c00FF68CC[小号]|r管理助手";
QuestNotifier_TITLE = "|cff0080ff[任务]|r任务通报";
----------------Charms----------------------
CHARMS_BUY_STACK="你確定購買|cffff0000一組|r下列物品嗎？";
CHARMS_NAKEDIZE="脫光光" ;
CHARMS_TARGET="目標";
CHARMS_MALE="男性";
CHARMS_FEMALE="女性";
CHARMS_HUMAN="人類";
CHARMS_ORC="獸人";
CHARMS_DWARF="矮人";
CHARMS_NIGHTELF="暗夜精靈";
CHARMS_SCOURGE="亡靈";
CHARMS_TAUREN="牛頭人";
CHARMS_GNOME="侏儒";
CHARMS_TROLL="巨魔";
CHARMS_GOBLIN="地精";
CHARMS_BLOODELF="血精靈";
CHARMS_DRAENEI="德萊尼";
CHARMS_WORGEN="狼人";
CHARMS_PANDAREN="熊貓人";
CHARMS_EXTEND="全都延長";
----------------Gear----------------------
GEAR_AHHELPER_AUTOSELL="-- |cFF00DDFFAlt+右鍵 |r直接上貨/出價--";
MAIL_RECEIVELETTERS="收信";
MAIL_RECEIVECOINS="收G";
MAIL_DELETEEMPTYMAILS="刪空郵件";
MAIL_OPENMAILBOX=" - 你得先打開收件箱啊~";
MOLINARI_BLACKLIST="黑名單";
MOLINARI_DRAGTOADD="將物品拖曳到下方的視窗內，加入到忽略清單。";
MOLINARI_POTENTIALLYpotentially="請將要避免不小心被處理掉的物品加入忽略清單。";
MOLINARI_REMOVEITEM="點一下右鍵移除物品";
NOMICAKES_POTENTIAL="潛在的食譜";
SUBSPEC_NEWSET="[新配置]";
SUBSPEC_LEFTSHIFT="左移";
SUBSPEC_RIGHTSHIFT="右移";
SUBSPEC_NEWPROFILENAME="輸入新的設定檔名稱";
TRAINALL_ALLLEARN="全 學";
----------------Loot----------------------
PLH_LONG_ADDON_NAME = "|cff02F78E[裝備]|r交易助手";
PLH_AUTHOR_NAME = 'Author:Madone-Zul\'Jin';
PLH_ADDON_NOTE = "拾取裝備可交易提示助手";
PLH_INCLUDE_BOEITEM = "包含<裝綁>物品";
PLH_SPEC_ONLY = "只適配當前專精";
PLH_NOTIFY_GROUPS = "通報到隊伍/團隊";
PLH_COORDINATE_ROLL = "發起R點需求 (有A才行)";
PLH_MANAGE_ROLLS = "需求裝備的人密團長 <交易> 或 <交易 [裝備連結]> 來R。";
PLH_NO_LOWLEVEL = "不包含低等級角色";
PLH_SHOW_INRAID = "在團框中顯示可交易的裝備";
PLH_THANKS_ALL = "感謝所有願意把裝備分享給最需要的人的玩家！\n畢竟要有愛，哪來那麼多魔獸爭霸。";
----------------Map----------------------
FOGLIGHT_HYBIRD = "混合";
FOGLIGHT_DISABLE = "禁用";
FOGLIGHT_ALL = "全地貌";
FOGLIGHT_NONE = "無地貌";
MAPTREASURES_SHOW = "顯示寶藏";
MINIMAP_MENU_BARSTYLE = "動作條樣式";
MINIMAP_MENU_KEYBIND = "按键绑定";
MINIMAP_MENU_QUESTBUTTON = "任務按鈕";
MINIMAP_MENU_SPECIALBUTTON = "特殊按鈕";
MINIMAP_MENU_AURACONFIG = "技能監控";
MINIMAP_MENU_AURADIY = "  --自添加技能";
MINIMAP_MENU_CONTROLNOTICE = "控制提示";
MINIMAP_MENU_CASTBAR = "施法條";
MINIMAP_MENU_ONOFF = "開 關";
MINIMAP_MENU_Click = "点击施法";
MINIMAP_MENU_DAMAGESTYLE = "傷害顯示";
MINIMAP_MENU_GRIDTOOL = "網格工具";
MINIMAP_MENU_lOOTHELPER = "求裝助手";
MINIMAP_MENU_DISTANCE = "距離助手";
MINIMAP_MENU_COMBOPOINTS = "简易连击点";
MINIMAP_MENU_COMPAREITEMS = "對比裝備";
MINIMAP_MENU_SWITCHUF = "頭像切換";
MINIMAP_MENU_AFKSCREEN = "屏保(AFK)";
MINIMAP_MENU_CHECKFOODSSS = "吃喝檢查";
MINIMAP_MENU_QUSETIONANSWER = "常見問題";
MINIMAP_MENU_UISETTING = "設置";
MINIMAP_MENU_MORE = "    更多設置...";
----------------Notice----------------------
COMBATNOTIFICATIONINFO_INFO_WOWTIME_TIP = "即將在15分鐘內開始";
COMBATNOTIFICATIONINFO_need = " 有獎勵包包了!";
COMBATNOTIFICATIONINFO_Tank = "|cffA52A00<坦克>|r";
COMBATNOTIFICATIONINFO_Healer = "|cff009300<治療>|r";
COMBATNOTIFICATIONINFO_DPS = "|cffEE3A8C<輸出>|r";
COMBATNOTIFICATIONINFO_combat_enter = "- 進 入 戰 鬥 -";
COMBATNOTIFICATIONINFO_combat_leav = "- 離 開 戰 鬥 -"	;
COMBATNOTIFICATIONINFO_Tank_G = "<坦克>";
COMBATNOTIFICATIONINFO_Healer_G = "<治療>";
COMBATNOTIFICATIONINFO_DPS_G = "<輸出>";
COMBATNOTIFICATIONINFO_CLICK = "<%s> 正在開啟 %s... 請點擊！";
COMBATNOTIFICATIONINFO_NOFOOD = "缺少食物Buff: ";
COMBATNOTIFICATIONINFO_NOFLASK = "缺少精煉藥劑: ";
COMBATNOTIFICATIONINFO_NORUNE = "缺少符文: ";
COMBATNOTIFICATIONINFO_ALLBUFFED = "已獲得所有增益!";
INCENTIVEPROGRAM_ROLES = "職責";
INCENTIVEPROGRAM_IGNORED = "忽略";
INCENTIVEPROGRAM_NO_IGNORED = "沒有忽略的副本";
INCENTIVEPROGRAM_SETTINGS = "設置";
INCENTIVEPROGRAM_HIDE_IN_PARTY = "有隊伍就不顯示了";
INCENTIVEPROGRAM_HIDE_ALWAYS = "隱藏";
INCENTIVEPROGRAM_HIDE_EMPTY = "沒有需求時候隱藏";
INCENTIVEPROGRAM_ALERT = "有新的獎勵時候提醒我";
INCENTIVEPROGRAM_ALERT_TOAST = "使用全域提醒框";
INCENTIVEPROGRAM_IGNORE_COMPLETED_LFR = "隱藏已經打過的本";
INCENTIVEPROGRAM_IGNORE = "忽略";
INCENTIVEPROGRAM_UNIGNORE = "沒有忽略的隨機副本";  
INCENTIVEPROGRAM_JOIN_QUEUE = "加入隨機隊伍佇列";
INCENTIVEPROGRAM_TOOLTIP_IGNORE_LFR = "所有的副本都已經打過就不再提醒或顯示統計，但仍然存在于左鍵功能表中。";
INCENTIVEPROGRAM_TOOLTIP_HIDE_ALWAYS = "總是隱藏框架。此功能適用於資料中轉。輸入/ip撤銷。";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_1 = "你可以在 http://www.wowhead.com/sounds 找到音樂ID。當你找到後，該音樂的ID在IE的地址欄中，如 (i.e. http://www.wowhead.com/sound=47615/ui-groupfinderreceiveapplication)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_ID_2 = "你可以在 http://www.wowhead.com/sounds 找到音樂ID。.當你找到後，該音樂的ID在IE的地址欄中，如 (i.e. http://www.wowhead.com/sound=18019/ui-bnettoast)";
INCENTIVEPROGRAM_TOOLTIP_SOUND_REPEATS = "音效播放的次數";
INCENTIVEPROGRAM_TOOLTIP_CYCLE_COUNT = "當新的提醒出現時，三個硬幣圖案旋轉的次數";
INCENTIVEPROGRAM_TOOLTIP_CONTINUOUSLY_CYCLE = "當新的提醒出現時，將不停地旋轉硬幣圖案";
INCENTIVEPROGRAM_CHANNEL = "聲音通道選擇:";
INCENTIVEPROGRAM_CHANNEL_DISC="這是默認使用的通道。";
INCENTIVEPROGRAM_MUSIC = "音樂";
INCENTIVEPROGRAM_SOUND_ID = "音效ID";
INCENTIVEPROGRAM_REPEATS = "重複";
INCENTIVEPROGRAM_AMBIENCE = "環境音";
INCENTIVEPROGRAM_MASTER="主通道";
INCENTIVEPROGRAM_MASTER_DISC="即使音樂音效被關閉，也可以通過主通道進行播放。";
INCENTIVEPROGRAM_ALERT_PING = "警報鈴聲";
INCENTIVEPROGRAM_TOAST_PING = "烤麵包叮聲";
INCENTIVEPROGRAM_TEST = "測試";
INCENTIVEPROGRAM_ANIM_CYCLES = "迴圈";
INCENTIVEPROGRAM_CONTINUOUSLY_CYCLE = "不斷迴圈";
INCENTIVEPROGRAM_RESET_POSITION = "重置設置";
REMINDER_BAGS_SPACE = "背包空間剩餘  ";
BARRELSOEASY_NO_GROUP = "啊噢.你在隊伍裡會導致歡樂桶外掛程式抽風";
BARRELSOEASY_NO_GROUPS = "Sorry，在隊伍你會導致每次點擊歡樂桶後，標記都會因為刷新而消失.";
BARRELSOEASY_START_FIRST = "請開始第一輪,小桶子運動完才能開始標記。";
----------------Role----------------------
PVPPP_KILL_MSG = "榮譽擊殺:%s/%s";
PVPPP_KILL_AVG = "過去的一小時中一共獲取了 %s 個榮譽擊殺";
----------------UFs----------------------
UFRAMESTYLE_BLINKHEALTHTEXT_ANCHOR = "左鍵-拖動位置\n右鍵-鎖定位置";

----------------BRP----------------------
BRP_Description="使用 /brp 解鎖和鎖定位置，同時 /brp 也可復位位置。";
BRP_AlwaysShow="總是展開戰利品列表";
BRP_FillDirection="戰利品清單排序方式";

U["Lock UIScale"] = "鎖定推薦UI縮放值"
U["Lock Chat"] = "鎖定聊天視窗設置"
U["Minimap Clock"] = "小地圖時間"
U["Setup UIScale"] = "調整UI縮放"
U["PlayerFrame Scale"] = "頭像縮放"
U["Map Scale"] = "世界地圖縮放"
U["Map Coords"] = "顯示世界地圖座標"
U["Enable Reminder"] = "啟用職業技能缺失提示"
U["Enable Familiar"] = "啟用職業監控-FS"
U["Enable Stagger"] = "啟用職業監控-WST"
U["Enable Statue"] = "啟用職業監控-雕像"
U["Enable Totems"] = "啟用職業監控-SM"
U["Destroy Totems"] = "左鍵點擊摧毀圖騰"
U["Enable Marksman"] = "啟用職業監控-LR"
U["Enable BloodyHell"] = "啟用職業監控-DK"
U["kAutoOpen"] = "自動打開寶箱"
U["QuickQueue"] = "自動確認排本職責"
U["AutoConfirmRoll"] = "自動Roll"
U["Enable Nameplate"] = "啟用姓名板(血條)"
U["Max Auras"] = "最大法術圖示數"
U["Auras Size"] = "法術圖示大小"
U["Nameplate InsideView"] = "已接觸姓名板停留視野內"
U["Tank Mode"] = "T仇恨染色樣式"
U["Auras Border"] = "顯示技能類型染色邊框"
U["Friendly CC"] = "友方玩家職業染色"
U["Hostile CC"] = "敵對玩家職業染色"
U["PlayerPlate Aura"] = "顯示玩家姓名板法術"
U["NP Width"] = "姓名板長度"
U["NP Height"] = "姓名板寬度"
U["Nameplate MinAlpha"] = "姓名板最小透明度"
U["Faster Loot"] = "自動拾取加速"
U["Mail Tool"] = "啟用郵件增強"
U["Hide Error"] = "戰鬥中遮罩紅字錯誤"
U["SoloInfo"] = "單刷難度提醒"
U["Rare Alert"] = "稀有 or 寶藏提示"
U["Alert In Chat"] = "同時通報在聊天框"
U["Easy Focus"] = "啟用Shift+左鍵快速焦點"
U["No Talking"] = "幹掉NPC BB的框"
U["Hide Bossbanner"] = "關閉副本掉落通知提示"
U["FriendGroups"] = "好友分組功能"
U["Whisper Invite"] = "啟用密語自動邀請"
U["Guild Invite Only"] = "只邀請公會成員"
U["Whisper Keyword"] = "密語關鍵字(空格隔開)"
U["Enable AuraWatch"] = "啟用技能監視"
U["AuraWatch Tooltip"] = "顯示技能監視滑鼠提示框"
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
	U["Mail"] = "郵件"
	U["No Mail"] = ""
 	U["Bags"] = "背包"
	U["Total"] = "總計"
	U["Used"] = "使用"
	U["CurrencyPanel"] = "貨幣面板"
	U["AutoSell Junk"] = "自動販售垃圾(Ctrl)"
	U["Selljunk Calculate"] = "背包中待售灰色物品总计"
	U["Your vendor trash has been sold and you earned"] = "背包中的灰色物品售出獲得"
	U["D"] = "耐久"
	U["Low Durability"] = "你的裝備耐久度過低！"
	U["PlayerPanel"] = "角色面板"
	U["AutoRepair"] = "自動修理(右鍵)"
	U["Repair cost covered by G-Bank"] = "修理使用了公會銀行"
	U["Repair cost"] = "修理花費"
	U["Go farm newbie"] = "新手去賺錢先吧"
	U["none"] = "無"
	U["My Coordinate"] = "我的坐標"

	U["Friends list:"] = "好友列表:"
	U["Friends"] = "好友"
	U["Earned:"] = "獲得:"
	U["Spent:"] = "花費:"
	U["Deficit:"] = "虧損:"
	U["Profit:"] = "盈利:"
	U["Session"] = "本次登錄"
	U["Server"] = "伺服器"
	U["Character"] = "當前角色"
	
	U["Guild"] = "工會"
	U["No Guild"] = "沒人要"
	U["Current"] = "目前"
	U["Daily"] = "今天"
	U["Sorting"] = "排序"
	U["Sorting by:"] = "排序方式:"
	U["Excessive"] = "公会在线成员过多,仅显示部分"
	
	U["Hidden"] = "隱藏"
	U["Shift"] = "Shift展開"
	U["Default UI Memory Usage:"] = "系統插件資源耗用:"
	U["Total Memory Usage:"] = "總資源耗用:"
	U["Garbage collected"] = "釋放內存"
	U["ManulCollect"] = "整理內存"
	U["AutoCollect"] = "自動整理內存(右鍵)"

	U["No Talents"] = "無天賦"
	U["Active Talent"] = "當前天賦 : "
	U["Talent"] = "天賦 : "
	U["Primary Talent"] = "主天賦 : "
	U["Secondary Talent"] = "副天賦 : "
	
	U["My Position"] = "我的位置"
	U["System"] = "系統"
	U["Home"] = "本地"
	U["Latency"] = "延遲"
	U["CPU Usage"] = "顯示CPU占比(右鍵)"
	U["Toggle CPU Usage"] = "你需要重载界面来启用这个功能。"
	U["Reload UI(on)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重載介面之後查看插件的CPU佔用，請重載介面！"
	U["Reload UI(off)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重載介面之後隱藏插件的CPU佔用顯示模塊，請重載介面！"
	U["BossInfo"] = "世界首領"
	U["Are you sure to reset the gold count?"] = "你確定要重置金幣統計嗎？"
	U["year"] = "年"
	U["day"] = "日"
	U["WoW"] = "<魔獸世界>"
	U["BN"] = "<戰網好友>"
	U["SpecPanel"] = "天賦面板"
	U["Change Spec"] = "切換專精(左键)"
	U["Change Loot"] = "切換拾取專精(右鍵)"
	U["Reset Gold"] = "重置統計(右键)"
	U["BN Info"] = "發送戰網通告"
	U["Toggle Calendar"] = "行事曆(左鍵)"
	U["Toggle Clock"] = "時鐘(右鍵)"
	U["WorldMap"] = "打開地圖"
	U["Send My Pos"] = "發送我的位置(右键)"
	U["Show Menus"] = "便捷菜單(右键)"
	U["Show Friends"] = "好友面板"
	U["No Online"] = "當前沒有好友在綫"
	U["NotInGuild"] = "你當前沒有加入公會"
	U["LookForGuild"] = "公會搜尋器"
	U["Hide Members"] = "在綫成員過多, %d人已隱藏"
	U["Show Guild"] = "公會面板"
	U["Unknown"] = "地點獲取失敗"
	U["Timewarped"] = "時光扭曲徽章獎勵"
	U["Mean One"] = "冬幕节日常"
	U["Deathtalon"] = "死爪"
	U["Terrorfist"] = "泰羅菲斯特"
	U["Doomroller"] = "末日之輪"
	U["Vengeance"] = "維金斯"
	U["Tanaan"] = "塔南森林"
	U["Platinum Invasion"] = "要塞入侵 - 白金"
	U["Gold Invasion"] = "要塞入侵 - 黄金"
	U["Silver Invasion"] = "要塞入侵 - 白銀"
	U["Bronze Invasion"] = "要塞入侵 - 青銅"
	U["Blingtron"] = "布林顿每日礼包"
  U["Legion Invasion"] = "军团突袭"
  U["Next Invasion"] = "下一次突袭"
  U["Search Invasion Group"] = "搜索侵入点队伍"

Announcer_Sap = ">>>被悶棍<<<";
Announcer_RocketPP = "漏油!!!救命啊~";
Announcer_Purgatory = "要死啦 要死啦~";
Announcer_Interrupted = "打斷→";
Announcer_Disperse = "驅散→";
Announcer_Stole = "偷取→";
Announcer_SpellIDnof = "<法術鏈接(ID)沒有找到>";
	
STRENGTH = "力量";
AGILITY = "敏捷";
STAMINA = "耐力";
VERSATILITY = "全能";
MULTISTRIKE = "雙擊";
BONUSARMOR = "額外護甲";
ARMOR = "護甲";
HASTE = "加速";
MASTERY = "精通";
CRIT = "致命一擊";
INTELLECT = "智力";
SPIRIT = "精神";	
REPAIR_COST = "修理：";


  ACP_AddonControlPanel = "插件管理";
			ACP_SomeprotectedaddonsarenloadedReloadnow = "ACP: 部分受保護的插件沒有被載入。現在重載介面?";
			ACP_ActiveEmbeds = "運行中的程式集";
			ACP_AddOns = "插件";
			ACP_Addonnotvalid = "無效的插件: <%s>";
			ACP_AddonsLoaded = "插件清單[%s]已載入。";
			ACP_Addonsrenamedto = "插件清單[%s]重新命名為[%s]。";
			ACP_AddonsSaved = "插件清單[%s]存檔完畢。";
			ACP_AddonsUnloaded = "插件清單[%s]已卸載。";
			ACP_Addtocurrentselection = "新增到現在的選擇";
			ACP_Author = "作者";
			ACP_ClicktoenableprotectmodeProtectedaddonswillnotbedisabled = "點擊啟用保護模式。受保護的插件";
			ACP_Close = "關閉";
			ACP_Default = "預設";
			ACP_Dependencies = "依賴插件";
			ACP_DisableAll = "全部停用";
			ACP_DisabledonreloadUI = "重載介面後停用";
			ACP_Embeds = "函數庫";
			ACP_EnableAll = "全部啟用";
			ACP_EnablingyourUI = "*** 啟用<%s>，%s你的使用者介面 ***";
			ACP_Enterthenewnamefor = "替[%s]重新取名:";
			ACP_Load = "載入";
			ACP_LoadableOnDemand = "可隨需求載入";
			ACP_Loaded = "已載入";
			ACP_Loadedondemand = "隨需求載入。";
			ACP_LoDChildEnableisnow = "隨需求載入子插件: %s";
			ACP_MemoryUsage = "記憶體用量";
			ACP_Noinformationavailable = "無可用的資訊。";
			ACP_Recursive = "遞迴";
			ACP_RecursiveEnableisnow = "遞迴載入插件: %s";
			ACP_Reload = "重載";
			ACP_ReloadUI = "重載介面";
			ACP_ReloadyourUserInterface = "重載你的使用者介面?";
			ACP_Removefromcurrentselection = "從現在的選擇中移除";
			ACP_Rename = "重新命名";
			ACP_ResurseToolTip = "當啟用一個插件時，嘗試啟用此插件所依賴的插件。";
			ACP_Save = "存檔";
			ACP_Savethecurrentaddonlistto = "儲存目前的插件清單為[%s]?";
			ACP_Set = "設定:";
			ACP_Sets = "設定";
			ACP_Status = "狀態";
			ACP_UnknownAddonRequired = "*** 需要未知的插件<%s> ***";
			ACP_UseSHIFTtooverridethecurrentenablingofdependanciesbehaviour = "使用Shift鍵來重寫目前啟用的依賴行為。";
			ACP_Version = "版本";
			ACP_whenperformingareloadui = "重載介面後不會被停用";

    
Chatbar_ChatMiniMizeButtonText = "縮";
Chatbar_rollText = "骰";
Chatbar_StatReport = "報";
Chatbar_ChannelYell = "喊";
Chatbar_ChannelSay = "說";
Chatbar_ChannelParty = "隊";
Chatbar_ChannelRaidWarns = "通";
Chatbar_ChannelRaid = "團";
Chatbar_ChannelBattleGround = "副";
Chatbar_ChannelGuild = "公";
Chatbar_EmoteCallButtonText = "圖";

InboxMailBag_Advanced = "進階";
InboxMailBag_ADVANCED_MODE_DESC = "啟用進階模式。顯示您信箱更多的訊息，並且能很好的挽回大筆的金錢。";
InboxMailBag_ADVANCED_MODE_DISABLED = "|cff00ff96InboxMailbag: 進階模式|r 關閉";
InboxMailBag_ADVANCED_MODE_ENABLED = "|cff00ff96InboxMailbag: 進階模式|r 啟用";
InboxMailBag_BAGNAME = "郵包";
InboxMailBag_DELETED = "%s 從 %s |cff20FF20 將刪除於 %d |4日:日; 後|r";
InboxMailBag_DELETED_1 = "%s 從 %s |cffFF2020 將刪除於 %s 後|r";
InboxMailBag_DELETED_7 = "%s 從 %s |cffFF6020 將刪除於 %d |4日:日; 後|r";
InboxMailBag_FRAMENAME = "|cffFFFFFF[郵件]|r信箱包裹";
InboxMailBag_Group_Stacks = "群組堆疊";
InboxMailBag_MAIL_DEFAULT = "預設為郵包";
InboxMailBag_MAIL_DEFAULT_DESC = "啟用此選項會導致信箱最初打開的是郵包，而非一般%s";
InboxMailBag_MAIL_DEFAULT_DISABLED = "|cff00ff96InboxMailbag: 信箱預設為|r %s";
InboxMailBag_MAIL_DEFAULT_ENABLED = "|cff00ff96InboxMailbag: 信箱預設為|r 信箱郵包";
InboxMailBag_QUALITY_COLOR_MODE_DESC = "啟用可由物品的邊框顯示物品的品質";
InboxMailBag_Quality_Colors = "品質著色";
InboxMailBag_QUALITY_COLORS_MODE_DISABLED = "|cff00ff96InboxMailbag: 品質著色|r 關閉";
InboxMailBag_QUALITY_COLORS_MODE_ENABLED = "|cff00ff96InboxMailbag: 品質著色|r 啟用";
InboxMailBag_RETURNED = "%s 從 %s |cff20FF20 將返回於 %d |4日:日; 後|r";
InboxMailBag_RETURNED_1 = "%s 從 %s |cffFF2020 將返回於 %s 後|r";
InboxMailBag_RETURNED_7 = "%s 從 %s |cffFFA020 將返回於 %d |4日:日; 後|r";
InboxMailBag_TOTAL = "總計訊息: %d";
InboxMailBag_TOTAL_MORE = "總計訊息: %d (%d)";

DEX_FontList = {
	"Fonts\\bLEI00D.TTF",
	"Fonts\\bKAI00M.TTF",
	"Fonts\\bHEI00M.TTF",
};
DEX_TXT_CRUSH = "碾壓!";
DEX_TXT_DISPELLED = "驅散! ";
DEX_TXT_STOLEN = "偷取! ";
DEX_TXT_REFLECT = " 反彈! ";
DEX_TXT_CRIT = "暴擊! ";
DEX_TXT_INTERUPT = "打斷! ";
DEX_MAIN_OPTION = "DamageEx";
DEX_BUTTON_RESET_TIP = "恢復預設值";
DEX_PREVIEW_LABEL = "拖動我改*變*文字位置";
DEXColorMode_T = "顏色模式";
DEXOptionsDropDown = {"單色","雙色","漸變色"};
DEXOptionsFrameCheckButtons = {
	["DEX_Enable"] = { title = "開啟", tooltipText = "開啟攻擊傷害顯示器"},
	["DEX_ShowWithMess"] = { title = "以戰鬥訊息方式顯示", tooltipText = "以戰鬥訊息方式顯示所有傷害資訊"},
	["DEX_ShowSpellName"] = { title = "顯示技能名", tooltipText = "在傷害數值邊顯示造成此次傷害的技能名"},
	["DEX_ShowNameOnCrit"] = { title = "當暴擊才顯示", tooltipText = "只有在致命一擊時才顯示技能名"},
	["DEX_ShowNameOnMiss"] = { title = "當未擊中等才顯示", tooltipText = "只有在技能未擊中，被抵抗等才顯示技能名"},
	["DEX_ShowInterruptCrit"] = { title = "暴擊方式顯示中斷", tooltipText = "暴擊方式顯示中斷"},
	["DEX_ShowCurrentOnly"] = { title = "只顯示當前選中目標的數值", tooltipText = "只顯示當前選中目標的傷害和治療,非當前選中目標則不顯示"},
	["DEX_ShowDamagePeriodic"] = { title = "顯示持續傷害", tooltipText = "顯示持續攻擊的傷害"},
	["DEX_ShowDamageShield"] = { title = "顯示反彈傷害", tooltipText = "顯示你對敵人傷害的反射量"},
	["DEX_ShowDamageHealth"] = { title = "顯示治療量", tooltipText = "顯示對目標的實際治療量和過量治療"},
	["DEX_ShowDamagePet"] = { title = "顯示寵物傷害", tooltipText = "顯示寵物對目標的傷害，含圖騰"},
	["DEX_ShowBlockNumber"] = { title = "顯示被格檔的傷害", tooltipText = "以xxx-xx方式顯示對目標的傷害被格檔、抵抗的數值"},
	["DEX_ShowDamageWoW"] = { title = "顯示系統默認傷害", tooltipText = "顯示系統原有的傷害"},
	["DEX_ShowOwnHealth"] = { title = "顯示自身治療", tooltipText = "當目標為自己的時候也顯示治療量"},
	["DEX_UniteSpell"] = { title = "合併瞬間多次同技能傷害", tooltipText = "如風怒武器,毀傷等瞬間對同一目標造成多次傷害的技能將被合併為一個傷害顯示"},
	["DEX_NumberFormat"] = { title = "顯示分隔符號", tooltipText = "是否顯示千分位傷害數字分隔符號"},
	["DEX_NumberFormat"] = { title = "萬進制顯示", tooltipText = "是否以萬為單位顯示"},	
	["DEX_ShowSpellIcon"] = { title = "顯示技能圖標", tooltipText = "是否顯示技能圖標，選中則替換顯示技能名稱"},		
	["DEX_ShowInterrupt"] = { title = "是否顯示中斷", tooltipText = "是否顯示中斷提示"},	
	["DEX_ShowOverHeal"] = { title = "是否顯示過量治療", tooltipText = "是否顯示過量治療，關閉則不顯示"},				
};
DEXOptionsFrameSliders = {
	["DEX_Font"] = {  title = "字型 ", minText="字型1", maxText="字型3", tooltipText = "設置文字字型"},
	["DEX_FontSize"] = {  title = "文字大小 ", minText="小", maxText="大", tooltipText = "設置文字的大小"},
	["DEX_OutLine"] = {  title = "字型描邊 ", minText="無", maxText="粗", tooltipText = "設置文字的描邊效果"},
	["DEX_Speed"] = {  title = "文字移動速度 ", minText="慢", maxText="快", tooltipText = "設置文字的移動速度"},
	["DEX_LOGLINE"] = {  title = "訊息最大條目 ", minText="5條", maxText="20條", tooltipText = "設置訊息最大顯示條目數"},
	["DEX_LOGTIME"] = {  title = "訊息停留時間 ", minText="5秒", maxText="1分鐘", tooltipText = "設置訊息文字停留時間"},
};
DEXOptionsColorPickerEx = {
	["DEX_ColorNormal"] = { title = "物理傷害顏色"},
	["DEX_ColorSkill"] = { title = "技能傷害顏色"},
	["DEX_ColorPeriodic"] = { title = "持續傷害顏色"},
	["DEX_ColorHealth"] = { title = "治療顏色"},
	["DEX_ColorPet"] = { title = "寵物傷害顏色"},
	["DEX_ColorSpec"] = { title = "中斷,驅散等顏色"},
	["DEX_ColorMana"] = { title = "法力傷害顏色"},
};

IEQUIP_OPEN = "打開裝備管理器";
IEQUIP_QUICKSTRIP = "一鍵脫光";
IEQUIP_GEARSET = "套裝[|cffffffff%d|r] - |T%s:22|t|cff00ff00%s|r";
IEQUIP_STRIPSET = "已脫下套裝|cff00ff00[%d]|r中的|cff00ff00%d|r件，穿回請點擊原套裝按鈕";
IEQUIP_STRIP = "已脫下當前著裝中的|cff00ff00%d|r件，請手動換回原裝備或選擇某套裝";
IEQUIP_WEARSET = "裝備了套裝[|cff00ff00%d|r] - |T%s:12:12:0:0|t|cff00ff00%s|r";
IEQUIP_CHANGED = "改動了當前套裝|cff00ff00[%d]|r - |T%s:12:12:0:0|t|cff00ff00%s|r";
IEQUIP_NOTASET = "當前著裝不再定義為套裝";
IEQUIP_MANAGER = "開";
IEQUIP_SYMBOL = "0";

GRIDCLICKSETS_MENUNAME = "點擊施法設置";
GRIDCLICKSETS_MENUTIP = "設置血條按鈕的點擊動作, 例如施法, 協助等.";
GRIDCLICKSETS_TITLE = "點擊施法設置";
GRIDCLICKSETS_LOCKWARNING = "戰鬥中無法設置按鈕屬性, 設置已保存, 脫離戰鬥後自動生效。";
GRIDCLICKSETS_SET = "團框點擊施法已更新設置。";
GRIDCLICKSETS_SET_WHEEL_UP = "上滾";
GRIDCLICKSETS_SET_WHEEL_DOWN = "下滾";
GRIDCLICKSETS_SET_RESET_WARNING = "當前專精的設置將全部重置且無法恢復！";

xMerchant_Tobrowseitemtooltipstoo = "對物品詳細提示訊息也進行檢索";

QN_Title    = "|cff0080ff[任務]|r任務通報功能設置";
QN_Switch   = "|CFF00FF00通告功能 打開/關閉|r";
QN_InstanceMode = "|CFFFF7D00在副本中時通報|r";
QN_RaidMode = "|CFFFF7D00在團隊中時通報|r";
QN_PartyMode= "|CFF30A0C8在小隊中時通報|r";
QN_SoloMode = "單人的時候通報(慎用,老說話BL/LM老遠看到來揍你)";
QN_Sound    = "|CFF00FF00完成時播放提示音|r";
QN_Debug    = "|CFF00F000任務進度彩色提示|r(|CF000FFF0僅自己可見,組隊時此選項自動失效|r)" ;
QN_NoDetail = "|CFF00FFFF不通報詳細進度|r";
QN_CompleteX = "|CFF00F000任務追蹤自動移除已完成任務|r";
QN_Colon       = "：";
QN_Quest       = "任務";
QN_Progress    = "進度";
QN_Complete    = "已完成!";
QN_Accept      = "接受任務";

	
	WHISPERPOP_LOCALE = {
		["title"] = "|cffC495DD[聊天|r密語管理",
		["tip tooltip"] = "拖拽左鍵以移動此提示圖標，點擊左鍵打開密語管理主框體。",
		["no new messages"] = "沒有未閱讀消息",
		["new messages from"] = "未閱讀消息來自: ",
		["receive only"] = "僅顯示接收到的消息",
		["sound notifying"] = "聲音提示",
		["time"] = "顯示時間標簽",
		["receive only tooltip"] = "如果選中，外發的消息將不會顯示在列表中。",
		["sound notifying tooltip"] = "如果選中，每次接收到新消息時將發出聲音提示。",
		["time tooltip"] = "如果選中，時間標簽將被添加到每一行消息文字前面。",
		["delete messages"] = "刪除所有消息",
		["delete messages tooltip"] = "點擊刪除所有現有的消息。",
		["keep messages"] = "保留歷史記錄",
		["keep messages tooltip"] = "保留一天內消息 \n|cffff3333嚴重警告：因密語記錄可打開魔獸存檔隨意查看，因此請不要在網吧等公共環境開啟此項，以免資訊洩露。|r",
		["toggle frame"] = "    打開/關閉密語框體",
	};
	
	CurrencyTracking_ADDON_NOTES = "追蹤所有獲取的通貨，並顯示在遊戲畫面上";
	CurrencyTracking_OPTIONS = "選項";
	CurrencyTracking_DISPLAYSETTINGS = "顯示設定";
	CurrencyTracking_OPT_SHOWONSCREEN = "在遊戲畫面上顯示通貨資訊";
	CurrencyTracking_SHOWTOOLTIP = "顯示提示";
	CurrencyTracking_SHOWTOOLTIPINFO = "顯示所有貨幣資訊提示";
	CurrencyTracking_SHOW_MONEY = "顯示現金資訊";
	CurrencyTracking_ENABLE_SHOW_MONEY_WITH_CURRENCIES = "啟用後顯示貨幣資訊提示和貨幣總金額。";
	CurrencyTracking_SHOW_ICON = "僅顯示圖示";
	CurrencyTracking_SHOW_ICON = "僅顯示貨幣或道具的圖示，不顯示金額";
	CurrencyTracking_RESET_POSITION = "重設位置";
	CurrencyTracking_RESET_SCREEN_POSITION = "重設遊戲畫面窗格的位置.";
	CurrencyTracking_BREAKUP_NUMBERS = "千分號";
	CurrencyTracking_OPT_BREAKUP_NUMBERS = "將數字加上當地語系化千分號";
	CurrencyTracking_HIDEZERO = "隱藏未獲取的貨幣";
  CurrencyTracking_AUTOHIDEITEMS = "自動隱藏數值為0的貨幣和道具";
	CurrencyTracking_ICON_FIRST = "圖示優先";
	CurrencyTracking_OPT_ICON_PRIORTO_NUMBER = "先顯示通貨圖示再顯示其數量";
	CurrencyTracking_OPT_ALWAYS_LOCK = "永遠鎖定通貨資訊視窗";
	CurrencyTracking_OPT_ALWAYS_LOCK_TIP = "啟用則將不僅限於戰鬥中才鎖定。停用則僅會於戰鬥中才鎖定。";
	CurrencyTracking_OPT_HIDE_IN_PETBATTLE = "宠物对战时隐藏";
  CurrencyTracking_OPT_AUTO_HIDE_IN_PETBATTLE = "在宠物对战开始后自动隐藏框体";
	-- Scale and Transparency
  CurrencyTracking_SCALE_TRANSPARENCY = "大小與透明度";
  CurrencyTracking_ON_SCREEN_FRAME = "遊戲畫面窗格";
  CurrencyTracking_TOOLTIP = "提示訊息";
  CurrencyTracking_SCALE = "大小";
  CurrencyTracking_TRANSPARENCY = "透明度";
  CurrencyTracking_BACKGROUND = "背景";
  CurrencyTracking_OPT_BGTRANSPARENCY = "通貨資訊的背景透明度";
  -- Others
  CurrencyTracking_MAXITEMS = "Max items per row";
  CurrencyTracking_MAXITEMSINFO = "Set the maximum number of items to be displayed per row. Set to 0 to allow unlimited items on one single row.";
  CurrencyTracking_CURRENCY_TO_TRACK = "在遊戲畫面上要追蹤的通貨:";
  CurrencyTracking_TRACKED_CURRENCY = "追蹤的通貨";
  CurrencyTracking_TRACKED_ITEMS = "追蹤的物品";
  CurrencyTracking_PROFILE_OPTIONS = "設定檔選項";
	

	TinyInspectL = {
    ShowItemBorder              = "物品直角邊框",
    EnableItemLevel             = "物品等級顯示",
    ShowColoredItemLevelString  = "裝等文字隨物品品質",
    ShowItemSlotString          = "顯示物品部位文字",
    ShowInspectAngularBorder    = "觀察面板直角邊框",
    ShowInspectColoredLabel     = "觀察面板高亮橙裝武器標簽",
    ShowCharacterItemSheet      = "顯示玩家自己裝備列表",
    ShowOwnFrameWhenInspecting  = "觀察同時顯示自己裝備列表",
    ShowItemStats               = "顯示裝備屬性統計",
    DisplayPercentageStats      = "裝備屬性換算成百分比數值",
    EnablePartyItemLevel        = "小隊隊友裝等",
    SendPartyItemLevelToSelf    = "發送隊友裝等到自己面板",
    SendPartyItemLevelToParty   = "發送隊友裝等到隊伍頻道",
    ShowPartySpecialization     = "顯示隊友天賦文字",
    EnableRaidItemLevel         = "團隊成員裝等",
    EnableMouseItemLevel        = "鼠標目標裝等",
    EnableMouseSpecialization   = "顯示鼠標天賦",
    EnableMouseWeaponLevel      = "顯示武器等級",
    Bag                         = "背包",
    Bank                        = "銀行",
    Merchant                    = "商人",
    Trade                       = "交易",
    Auction                     = "拍賣行",
    AltEquipment                = "ALT換裝",
    GuildBank                   = "公會銀行",
    GuildNews                   = "公會新聞",
    PaperDoll                   = "人物面板",
    Chat                        = "聊天",
    ["general.mask"]                        = "頂部遮罩",
    ["general.statusbarText"]               = "HP文字",
    ["general.background"]                  = "背景顔色",
    ["general.borderColor"]                 = "邊框顔色",
    ["general.scale"]                       = "框架縮放",
    ["general.borderSize"]                  = "邊框大小",
    ["general.statusbarHeight"]             = "HP高度",
    ["general.borderCorner"]                = "邊框樣式",
    ["general.bgfile"]                      = "背景材質",
    ["general.statusbarPosition"]           = "HP位置",
    ["general.statusbarOffsetX"]            = "HP位置X邊距",
    ["general.statusbarOffsetY"]            = "HP位置Y偏移",
    ["general.statusbarFontSize"]           = "HP文字大小",
    ["general.statusbarFont"]               = "HP文字字體",
    ["general.statusbarFontFlag"]           = "HP字體描邊",
    ["general.statusbarTexture"]            = "HP背景材質",
    ["general.statusbarColor"]              = "HP顔色",
    ["general.anchor.position"]             = "框架錨點",
    ["general.anchor.returnInCombat"]       = "戰鬥時復位",
    ["general.anchor.returnOnUnitFrame"]    = "UnitFrame上時復位",
    ["general.alwaysShowIdInfo"]            = "始終顯示id信息(關閉後按住alt/shift顯示)",
    ["general.skinMoreFrames"]              = "樣式應用於更多框架 |cffcccc33(重載生效)|r",
    
    ["item.coloredItemBorder"]              = "物品邊框染色",
    ["item.showItemIcon"]                   = "顯示物品圖標",
    ["quest.coloredQuestBorder"]            = "任務邊框染色",
    
    ["unit.player.anchor.position"]         = "框架錨點",
    ["unit.player.anchor.returnInCombat"]   = "戰鬥時復位",
    ["unit.player.anchor.returnOnUnitFrame"] = "UnitFrame上時復位",
    ["unit.player.background"]              = "背景染色",
    ["unit.player.coloredBorder"]           = "邊框染色",
    ["unit.player.showTarget"]              = "顯示目標",
    ["unit.player.showTargetBy"]            = "顯示被關注",
    ["unit.player.showModel"]               = "顯示模型",
    ["unit.player.grayForDead"]             = "死亡目標灰度染色",
    ["unit.player.elements.roleIcon"]       = "角色圖標",
    ["unit.player.elements.raidIcon"]       = "標記圖標",
    ["unit.player.elements.pvpIcon"]        = "PVP狀態",
    ["unit.player.elements.factionIcon"]    = "陣營圖標",
    ["unit.player.elements.classIcon"]      = "職業圖標",
    ["unit.player.elements.title"]          = "頭銜",
    ["unit.player.elements.name"]           = "名稱",
    ["unit.player.elements.realm"]          = "伺服器",
    ["unit.player.elements.statusAFK"]      = "AFK",
    ["unit.player.elements.statusDND"]      = "DND",
    ["unit.player.elements.statusDC"]       = "OFFLINE",
    ["unit.player.elements.guildName"]      = "公會名稱",
    ["unit.player.elements.guildIndex"]     = "公會階級數字",
    ["unit.player.elements.guildRank"]      = "公會階級名稱",
    ["unit.player.elements.guildRealm"]     = "公會伺服器",
    ["unit.player.elements.levelValue"]     = "等級",
    ["unit.player.elements.factionName"]    = "陣營",
    ["unit.player.elements.gender"]         = "性別",
    ["unit.player.elements.raceName"]       = "種族",
    ["unit.player.elements.className"]      = "職業",
    ["unit.player.elements.isPlayer"]       = "玩家",
    ["unit.player.elements.role"]           = "角色",
    ["unit.player.elements.moveSpeed"]      = "移動速度",
    ["unit.player.elements.zone"]           = "地區",
    
    ["unit.npc.anchor.position"]            = "框架錨點",
    ["unit.npc.anchor.returnInCombat"]      = "戰鬥時復位",
    ["unit.npc.anchor.returnOnUnitFrame"]   = "UnitFrame上時復位",
    ["unit.npc.background"]                 = "背景染色",
    ["unit.npc.coloredBorder"]              = "邊框染色",
    ["unit.npc.showTarget"]                 = "顯示目標",
    ["unit.npc.showTargetBy"]               = "顯示被關注數",
    ["unit.npc.grayForDead"]                = "死亡目標灰度染色",
    ["unit.npc.elements.raidIcon"]          = "標記圖標",
    ["unit.npc.elements.classIcon"]         = "職業圖標",
    ["unit.npc.elements.questIcon"]         = "任務圖標",
    ["unit.npc.elements.npcTitle"]          = "頭銜",
    ["unit.npc.elements.name"]              = "名稱",
    ["unit.npc.elements.levelValue"]        = "等級",
    ["unit.npc.elements.classifBoss"]       = "首領",
    ["unit.npc.elements.classifElite"]      = "精英",
    ["unit.npc.elements.classifRare"]       = "稀有",
    ["unit.npc.elements.creature"]          = "類型",
    ["unit.npc.elements.reactionName"]      = "聲望",
    ["unit.npc.elements.moveSpeed"]         = "移動速度",
    
    ["spell.background"]                    = "背景顔色",
    ["spell.borderColor"]                   = "邊框顔色",
    ["spell.showIcon"]                      = "法術圖標",
    
    ["dropdown.inherit"]        = "|cffffee00繼承全域|r",
    ["dropdown.default"]        = "|cffaaaaaa系統默認|r",
    ["dropdown.angular"]        = "直角邊框",
    ["dropdown.bottom"]         = "底部",
    ["dropdown.top"]            = "頂部",
    ["dropdown.auto"]           = "智能匹配",
    ["dropdown.smooth"]         = "百分比動態",
    ["dropdown.cursorRight"]    = "鼠標右側",
    ["dropdown.cursor"]         = "|cff33ccff鼠標|r",
    ["dropdown.static"]         = "|cff33ccff固定位置|r",
    ["dropdown.class"]          = "職業染色",
    ["dropdown.level"]          = "等差染色",
    ["dropdown.reaction"]       = "聲望染色",
    ["dropdown.itemQuality"]    = "物品品質染色",
    ["dropdown.selection"]      = "類型染色",
    ["dropdown.faction"]        = "陣營染色",
    ["dropdown.dark"]           = "深黑",
    ["dropdown.alpha"]          = "透明",
    ["dropdown.gradual"]        = "漸變",
    ["dropdown.rock"]           = "岩石",
    ["dropdown.marble"]         = "大理石",

    ["dropdown.none"]           = "|cffaaaaaa(無)|r",
    ["dropdown.reaction5"]      = "聲望友好以上",
    ["dropdown.reaction6"]      = "聲望尊敬以上",
    ["dropdown.inraid"]         = "團隊時",
    ["dropdown.incombat"]       = "戰鬥中",
    ["dropdown.inpvp"]          = "戰場裏",
    ["dropdown.inarena"]        = "競技場",
    ["dropdown.ininstance"]     = "副本時",
    ["dropdown.samerealm"]      = "同伺服",
    ["dropdown.samecrossrealm"]     = "同跨伺服",
    ["dropdown.not reaction5"]      = "|cffff3333非|r聲望友好以上",
    ["dropdown.not reaction6"]      = "|cffff3333非|r聲望尊敬以上",
    ["dropdown.not inraid"]         = "|cffff3333非|r團隊時",
    ["dropdown.not incombat"]       = "|cffff3333非|r戰鬥中",
    ["dropdown.not inpvp"]          = "|cffff3333非|r戰場裏",
    ["dropdown.not inarena"]        = "|cffff3333非|r競技場",
    ["dropdown.not ininstance"]     = "|cffff3333非|r副本時",
    ["dropdown.not samerealm"]      = "|cffff3333非|r同伺服",
    ["dropdown.not samecrossrealm"]  = "|cffff3333非|r同跨伺服",
    
    ["headerFont"]        = "標頭字體",
    ["headerFontSize"]    = "標頭字體大小",
    ["headerFontFlag"]    = "標頭字體描邊",
    ["bodyFont"]          = "內容字體",
    ["bodyFontSize"]      = "內容字體大小",
    ["bodyFontFlag"]      = "內容字體描邊",
    
    ["Anchor"]   = "錨點器",
    
    ["TargetBy"] = "被關注",
  };
BINDING_NAME_InspectRaidFrame = "顯示團隊觀察面板"
end
