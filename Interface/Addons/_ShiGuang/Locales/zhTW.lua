local _, _, U, _ = unpack(select(2, ...))
if GetLocale() == "zhTW" then
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

DANWEI_WAN = "萬";
DANWEI_YI = "億";

----------------Title----------------------
CHAT_WHISPERPOP_TITLE="|cff777777[聊天]|r密語管理";
GEAR_DELETEEMPTYMAILS_TITLE="|cffFFFFFF[郵件]|r刪除空郵件";
GEAR_MOLINARI_TITLE="|cff8080ff[專業]|r分解研磨";
NOTICE_INCENTIVEPROGRAM_PANEL_TITLE="|cff8080ff[提醒]|r隨機獎勵";
NOTICE_INCENTIVEPROGRAM_TITLE="(|cFF69CCF0隨機T和N獎勵提醒|r)";
CurrencyTracking_TITLE = "|cFF00FF00[信息]|r通貨追蹤";
RelicInspector_TITLE = "|cff8080ff[提示]|r聖物屬性";
Savedinstances_TITLE = "|c00FF68CC[小号]|r管理助手";
QuestNotifier_TITLE = "|cff0080ff[任务]|r任务通报";
Boomkinator_TITLE = "|cff0080ff[输出]|r技能监控";
PORTALMAGETITLE = "|cff0080ff[法师]|r职业条";
FARMERTITLE = '|cff8080ff[拾取]|r拾取提示'
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
CHARMS_NIGHTBORNE="夜之子";
CHARMS_HIGHMOUNTAINTAUREN="至高岭牛头人";
CHARMS_VOIDELF="虚空精灵";
CHARMS_LIGHTFORGEDDRAENEI="光铸德莱尼";
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
MINIMAP_MENU_AURACONFIG = "界面调整";
MINIMAP_MENU_AURADIY = "  --自添加技能";
MINIMAP_MENU_CONTROLNOTICE = "控制提示";
MINIMAP_MENU_CASTBAR = "施法條";
MINIMAP_MENU_ONOFF = "開 關";
MINIMAP_MENU_Click = "点击施法";
MINIMAP_MENU_DAMAGESTYLE = "傷害顯示";
MINIMAP_MENU_INTERRUPT = "小队打断";
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
  -- Paku_Totems
  PakuTotems_TheSliverNorth = "碎枝林地(北)";
  PakuTotems_EastZanchul = "東贊樞爾";
  PakuTotems_TopofZanchul = "贊樞爾頂部";
  PakuTotems_TheSliverSouth = "碎枝林地(南)";
  PakuTotems_TerraceoftheChosen = "選民之台";
  PakuTotems_AltarofPaku = "帕庫祭壇";
  PakuTotems_TheGreatSealLedge = "巨擘封印";
  PakuTotems_TheGoldenThrone = "黃金王座";
  PakuTotems_BeastcallerInn = "馭獸師旅店(戰獸欄)";
  PakuTotems_GrandBazaar = "百商集市";
  PakuTotems_TerraceofCrafters = "工匠平臺";
  PakuTotems_WestZanchul = "西贊樞爾";
  PakuTotems_TheZocalo = "佐卡羅廣場";
----------------Loot----------------------
FARMER_Poor = "垃圾";
FARMER_Common = "普通";
FARMER_Uncommon = "优秀";
FARMER_Rare = "稀有";
FARMER_Epic = "精良";
FARMER_Legendary = "史诗";
FARMER_Artifact = "神器";
FARMER_Heirloom = "传说";
FARMER_WoWToken = "传家宝";
FARMER_ENABLEFASTAUTOLOOT = "快速拾取";
FARMER_HIDELOOTANDITEMROLLTOASTS = "隐藏拾取和roll点框";
FARMER_DONTDISPLAYITEMSINARENA = "战场中不显示拾取信息";
FARMER_SHOWTOTALCOUNTFORSTACKABLEITEMS = "显示堆叠道具总数";
FARMER_SHOWBAGCOUNTFORSTACKABLEITEMS = "显示堆叠道具背包数";
FARMER_SHOWITEMSBASEDONRARITY = "品质标准显示";
FARMER_MINIMUMRARITY = "可显示最低品质";
FARMER_ALWAYSSHOWFARMINGITEMS = "总是显示拾取物品";
FARMER_ALWAYSSHOWREAGENTS = "总是显示药剂";
FARMER_SHOWCURRENCIES = "显示货币";
FARMER_SHOWMONEY = "显示金钱";
FARMER_MOVEFRAME = "移动框架";
FARMER_RESETPOSITION = "重置位置";
FARMER_FONTSIZE = "字体大小";
FARMER_DISPLAYTIME = "显示持续时间";
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
CASTBARS_STYLE_TITLE = "|cff8000ff[菜单]|r施法条";
UFRAMESTYLE_BLINKHEALTHTEXT_ANCHOR = "左鍵-拖動位置\n右鍵-鎖定位置";
----------------BRP----------------------
BRP_Description="使用 /brp 解鎖和鎖定位置，同時 /brp 也可復位位置。";
BRP_AlwaysShow="總是展開戰利品列表";
BRP_FillDirection="戰利品清單排序方式";
----------------Shiguang----------------------
SHIGUANG_Loot="拾取";
SHIGUANG_Gets="獲得";
SHIGUANG_Refund="退款";

U["Lock UIScale"] = "鎖定推薦UI縮放值"
U["Lock Chat"] = "鎖定聊天視窗設置"
U["Minimap Clock"] = "小地圖時間"
U["Setup UIScale"] = "調整UI縮放"
U["Setup GUIScale"] = "设置面板缩放"
U["PlayerFrame Scale"] = "頭像縮放"
U["Map Scale"] = "世界地圖縮放"
U["Map Coords"] = "顯示世界地圖座標"
U["Map Reveal"] = "地图去迷雾"
U["Enable Reminder"] = "啟用職業技能缺失提示"

U["Enable Stagger"] = "啟用職業監控-WST"
U["Enable Statue"] = "啟用職業監控-雕像"
U["Enable BloodyHell"] = "啟用職業監控-DK"
U["Enable Totems"] = "啟用職業監控-SM"
U["Enable Familiar"] = "啟用職業監控-FS"
U["Enable Marksman"] = "啟用職業監控-LR"
U["Enable BlinkComboHelper"] = "启用浮动连击点"
U["Destroy Totems"] = "左鍵點擊摧毀圖騰"
U["WorldQusetRewardIcon"] = "大地图奖励图标"
U["Class EnergyBar"] = "职业能量条"
U["Class Recoure Center"] = "职业资源居中"
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
U["Yell Interrupt"] = "通报打断\偷取\驱散"
U["Interrupt Alarm"] = "打断音效"
U["Death Alarm"] = "!死亡爽翻天惨叫!"
U["Easy Focus"] = "啟用Shift+左鍵快速焦點"
U["No Talking"] = "幹掉NPC BB的框"
U["Numberize"] = "数字缩写格式"
U["Number Type1"] = "标准模式：b/m/k"
U["Number Type2"] = "中式：亿/万"
U["Number Type3"] = "显示具体数值"
U["Hide Bossbanner"] = "關閉副本掉落通知提示"
U["FriendGroups"] = "好友分組功能"
U["Whisper Invite"] = "啟用密語自動邀請"
U["Guild Invite Only"] = "只邀請公會成員"
U["Whisper Keyword"] = "密語關鍵字(空格隔開)"
U["Enable AuraWatch"] = "啟用技能監視"
U["AuraWatch Tooltip"] = "隐藏技能監視滑鼠提示框"
U["Achievement PrintScreen"] = "跳成就时候截图"
U["Spell Not Ready"] = "技能CD中提醒"
U["Doom Cooldown"] = "技能CD完成提示"
U["OmniCC"] = "技能栏CD计时数字"
U["WallpaperKit"] = "屏保"
U["xMerchant"] = "商人购买列表美化"
U["UFClassIcon"] = "使用职业头像"
U["UFPctText"] = "使用大血量百分比"
U["Enable Bags"] = "系统自带背包增强"
U["Chat Sticky"] = "启用密语粘滞"
U["Chat bg"] = "聊天框背景"
U["Chat tab bg"] = "聊天框标签背景"
U["QuestTrackerSkinTitle"] = "任务栏职业染色"
U["Auto Reagent Bank"] = "材料自动存银行"
U["Auto Mark"] = "自动标记 T N"
U["Enable Actionbar"] = "啟用動作條"
U["Actionbar Style"] = "動作條樣式"
U["Bar4 Fade"] = "漸隱右側動作條1"
U["Bar5 Fade"] = "漸隱右側動作條2"
U["Actionbar Hotkey"] = "快捷鍵"
U["Actionbar Macro"] = "宏名稱"
U["Actionbar Item Counts"] = "物品堆疊計算"
U["Show Cooldown"] = "技能冷卻"
U["Decimal Cooldown"] = "冷卻低於3秒時顯示小數點"
U["ClassColor BG"] = "技能欄邊框職業染色"
U["CombatHide"] = "战斗中隐藏鼠标提示"
U["TargetBy"] = "显示选中目标数"
U["Cursor"] = "提示框跟随鼠标"
U["QuestNotifier"] = "通报任务"
U["QuestSchedule"] = "通报任务进度"
U["Actionbar Scale"] = "技能栏缩放"
U["Tooltip Scale"] = "鼠标提示框缩放"

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
	U["Earned"] = "獲得:"
	U["Spent"] = "花費:"
	U["Deficit"] = "虧損:"
	U["Profit"] = "盈利:"
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
	U["My Position"] = "我的位置"
	U["System"] = "系統"
	U["Home"] = "本地"
	U["Latency"] = "延遲"
	U["CPU Usage"] = "顯示CPU占比(右鍵)"
	U["Toggle CPU Usage"] = "你需要重载界面来启用这个功能。"
	U["Reload UI(on)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重載介面之後查看插件的CPU佔用，請重載介面！"
	U["Reload UI(off)"] = "|cff777777dim|rinfo[|cff00ff00System|r]:你可以在重載介面之後隱藏插件的CPU佔用顯示模塊，請重載介面！"
	U["Are you sure to reset the gold count?"] = "你確定要重置金幣統計嗎？"
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

U["Config_Importing_ImportingCanUpdate"] = "導入可以更新現有比例"
U["Config_Importing_ImportingCanUpdate_Desc"] = "當導入具有相同名稱，職業和專精的比例作為預先存在的比例時，現有比例將使用新權值更新，而不是建立新比例。"
U["Config_Importing_ImportingCanUpdate_Desc_Clarification"] = "可以有多個具有相同名稱的比例，只要它們用於不同的專精或職業。"
U["Config_Importing_Title"] = "導入"
U["Config_Scales_Desc"] = "以下設置僅影響清單的預設比例。所有自訂比例將在每個職業列出。"
U["Config_Scales_OwnClassDefaultsOnly"] = "只列出自己職業的預設比例"
U["Config_Scales_OwnClassDefaultsOnly_Desc"] = "只列出你自己職業的預設比例，而非列出所有。"
U["Config_Scales_Title"] = "比例清單"
U["Config_SettingsSavedPerChar"] = [=[這裡所有設置都是每個角色分開儲存。
自訂比例則為所有角色共享。]=]
U["Config_WeightEditor_Desc"] = [=[以下設置只適用於顯示在比例權值編輯器的特質。
即使你停用了它們，如果它們在啟用比例中設置了權值，所有的艾澤萊特質仍會計算分數。]=]
U["Config_WeightEditor_ShowDefensive"] = "顯示防禦性特質"
U["Config_WeightEditor_ShowDefensive_Desc"] = "在比例權值編輯器中顯示通用與職業特定的防禦性特質。"
U["Config_WeightEditor_ShowProfession"] = "顯示專業技能專有特質"
U["Config_WeightEditor_ShowProfession_Desc"] = "在比例權值編輯器中顯示專業技能專有特質。這些特質只會出現在專業技能製作物品中。目前只有出現在工程學頭部裝備。"
U["Config_WeightEditor_ShowPvP"] = "顯示PvP專有特質"
U["Config_WeightEditor_ShowPvP_Desc"] = "在比例權值編輯器中顯示PvP專有特質。你只會看到自己的陣營特質，但對它們做的變動會反映到雙方陣營。"
U["Config_WeightEditor_ShowPvP_Desc_Import"] = [=[當導出生成的字串時，只包含你自己陣營的PvP特質，但它們可以與對立的陣營pvp-powerID互換。
當從一個陣營導入具有pvp特質的字串時，特質會將其權值鏡像導入到雙方陣營。]=]
U["Config_WeightEditor_ShowRole"] = "顯示角色類型專有特質"
U["Config_WeightEditor_ShowRole_Desc"] = "在比例權值編輯器中顯示角色類型專有特質。"
U["Config_WeightEditor_ShowRolesOnlyForOwnSpec"] = "只顯示我自己專精職責的角色類型專有特質"
U["Config_WeightEditor_ShowRolesOnlyForOwnSpec_Desc"] = "在比例權值編輯器中顯示共通與當前專精相關的角色類型專有特質。啟用此設置的話像是治療專有專精將會在傷害與坦克上隱藏等等。"
U["Config_WeightEditor_ShowZone"] = "顯示區域專有特質"
U["Config_WeightEditor_ShowZone_Desc"] = "在比例權值編輯器中顯示區域專有特質。這些特質只會出現在與特質相關特定區域中獲得的物品上。"
U["Config_WeightEditor_ShowZone_Desc_Proc"] = [=[正常區域專有特質可以在任何地方啟動/觸發，但團隊特質只會在與它們相關的團隊副本中進行(例如：奧杜爾特質只會在奧杜爾團隊副本中觸發)。
團隊特質在比例權值編輯器中的名稱旁標有星號(*)。]=]
U["Config_WeightEditor_Title"] = "比例權值編輯器"
U["CreatePopup_Desc"] = "建立新的比例。從下拉選單選擇職業與專精並輸入新比例的名稱然後按下 %1$s"
U["CreatePopup_Error_CreatedNewScale"] = "已建立新比例 \"%s\""
U["CreatePopup_Error_UnknownError"] = "錯誤：建立新比例“％s”出了點問題！"
U["CreatePopup_Title"] = "建立比例"
U["DefaultScaleName_Default"] = "預設"
U["DefaultScaleName_Defensive"] = "防禦性"
U["DefaultScaleName_Offensive"] = "攻擊性"
U["DeletePopup_DeletedDefaultScale"] = "刪除的比例正在使用中，恢復為您的職業和專精的預設選項！"
U["DeletePopup_DeletedScale"] = "已刪除比例 \"%s\""
U["DeletePopup_Desc"] = [=[正刪除比例 %1$s
按下 %2$s 以確認。
所有使用此專精比例的角色將恢復為預設比例。]=]
U["DeletePopup_Title"] = "刪除比例"
U["DeletePopup_Warning"] = "！ 這個動作是永久性的，無法逆轉！"
U["ExportPopup_Desc"] = [=[正導出比例 %1$s
按下 %2$sCtrl+C%3$s 來複製字串並且 %4$sCtrl+V%5$s 來貼上到某處]=]
U["ExportPopup_Title"] = "導出比例"
U["ImportPopup_CreatedNewScale"] = "導入新的比例 \"%s\""
U["ImportPopup_Desc"] = [=[正從字串導入比例
按下 %1$sCtrl+V%2$s 來貼上字串到編輯框並按下 %3$s]=]
U["ImportPopup_Error_MalformedString"] = "錯誤：導入的字串格式錯誤"
U["ImportPopup_Error_OldStringVersion"] = "錯誤：\"導入字串\" -版本太舊或是導入字串格式錯誤！"
U["ImportPopup_Title"] = "導入比例"
U["ImportPopup_UpdatedScale"] = "更新現有的比例 \"%s\""
U["ItemToolTip_AzeriteLevel"] = "艾澤萊等級: %1$d / %2$d"
U["PowersScoreString"] = "當前: %1$s/%2$s\n最大: %3$s\n等級: %4$s/%5$s"
U["PowersTitles_Class"] = "職業特質"
U["PowersTitles_Defensive"] = "防禦性特質"
U["PowersTitles_Profession"] = "專業技能特質"
U["PowersTitles_PvP"] = "PvP特質"
U["PowersTitles_Role"] = "角色類型特質"
U["PowersTitles_Zone"] = "團隊與區域特質"
U["RenamePopup_Desc"] = [=[正重新命名比例 %1$s
在編輯框中輸入新名稱並按下 %2$s]=]
U["RenamePopup_RenamedScale"] = "已重命名比例 \"%1$s\" 為 \"%2$s\""
U["RenamePopup_Title"] = "重命名比例"
U["ScaleName_Unknown"] = "未知"
U["ScaleName_Unnamed"] = "未命名"
U["ScalesList_CreateImportText"] = "建立新的 / 導入"
U["ScalesList_CustomGroupName"] = "自訂比例"
U["ScalesList_DefaultGroupName"] = "預設比例"
U["ScaleWeightEditor_Title"] = "%s 比例權值編輯器"
U["Slash_Command"] = "/azerite"
U["Slash_Error_Unkown"] = "錯誤：出了些問題了！"
U["Slash_RemindConfig"] = "到ESC -> 介面 -> 插件 -> %s來設置"
U["WeightEditor_CreateNewText"] = "建立新的"
U["WeightEditor_CurrentScale"] = "當前比例: %s"
U["WeightEditor_DeleteText"] = "刪除"
U["WeightEditor_EnableScaleText"] = "使用此比例"
U["WeightEditor_ExportText"] = "導出"
U["WeightEditor_ImportText"] = "導入"
U["WeightEditor_RenameText"] = "重命名"
U["WeightEditor_TooltipText"] = "在提示中顯示"
U["WeightEditor_VersionText"] = "版本 %s"
U["Weights"] = "自定义"

U["BTN_CHECK_ENCHANTS"] = "检查"
U["BTN_INVITE"] = "邀请"
U["UI_ITEMS_TITLE"] = ""
U["UI_GEMS_TITLE"] = "宝石"
U["UI_ENCHANTS_TITLE"] = "附魔"
U["ENCHANT_REPORT_HEADER"] = "|cff00FF00!!!|cffFFFFFF → %s (%d %s):" -- name, level, class
U["AVG_ITEM_LEVEL"] = "平均装等: %d (%d to %d)"
U["MISSING_ITEMS"] = "缺少装备:"
U["MISSING_GEMS"] = "无宝石:"
U["MISSING_ENCHANTS"] = "未附魔:"
U["LOW_ITEM_LEVEL"] = "过低装等:"
U["MISSING_BELT_BUCKLE"] = "Missing belt buckle?"
U["MISSING_BS_SOCKETS"] = "Missing blacksmith sockets (?):"
U["PROPER_GEMS"] = "均插了宝石."
U["PROPER_ENCHANTS"] = "均已附魔."
U["SCAN"] = "扫描..."
U["RESCAN"] = "再次扫描..."
U["SCAN_INCOMPLETE"] = "扫描结束，请稍后再试..."
U["INVSLOT_"..INVSLOT_HEAD] = "头部"
U["INVSLOT_"..INVSLOT_NECK] = "项链"
U["INVSLOT_"..INVSLOT_SHOULDER] = "肩膀"
U["INVSLOT_"..INVSLOT_BACK] = "披风"
U["INVSLOT_"..INVSLOT_CHEST] = "胸甲"
U["INVSLOT_"..INVSLOT_BODY] = "衬衣"
U["INVSLOT_"..INVSLOT_TABARD] = "战袍"
U["INVSLOT_"..INVSLOT_WRIST] = "护腕"
U["INVSLOT_"..INVSLOT_HAND] = "手甲"
U["INVSLOT_"..INVSLOT_WAIST] = "护腰"
U["INVSLOT_"..INVSLOT_LEGS] = "腿甲"
U["INVSLOT_"..INVSLOT_FEET] = "脚部"
U["INVSLOT_"..INVSLOT_FINGER1] = "戒指1"
U["INVSLOT_"..INVSLOT_FINGER2] = "戒指2"
U["INVSLOT_"..INVSLOT_TRINKET1] = "饰品1"
U["INVSLOT_"..INVSLOT_TRINKET2] = "饰品2"
U["INVSLOT_"..INVSLOT_MAINHAND] = "主手"
U["INVSLOT_"..INVSLOT_OFFHAND] = "副手"

U["Shield Wall"] = "盾牆"
U[" (auto)"] =  "(自动)"    
U[" (toggle)"] =  "(手动)"
U["Dodge"] = "閃躲"
U["Snare"] = "誘捕"
U["Tranq/Dispel"] = "寧神"
U["Mortal Wounds"] = "致死" 
-- exotic ABILITIES          
U["Water Walking"] = "水上行走"
U["Magic Resistance"] = "魔法抗性" 
U["Physical Resistance"] = "物理抗性"
U["Tanky"] = "坦克"
U["Thorns"] = "荊棘術"       
U["Heal"] = "治療術" 
U["Prowl"] = "潛行"    
U[" with Self-Heal"] = "  自我治療"
U["Reincarnation"] = "復生" 
U["Slowfall"] = "緩落術"   
U[" (ranged)"] = " 遠程"
U["Fast"] = "快"
U["Cannibalize"] = "食屍" 
-- MISC
U["Ferocity"] = "狂野"
U["Cunning"] = "狡詐"
U["Tenacity"] = "堅韌"
U["(Exotic)"] = "(野獸控制)"
-- leave an entry commented out to use the default (enUS) translation
U["Beast"] = "野獸"
U["Mechanical"] = "機械"
U["蜥蜴"] = "Basilisk"
U["蝙蝠"] = "Bat"
U["熊"] = "Bear"
U["甲蟲"] = "Beetle"
U["猛禽"] = "Bird of Prey"
U["野豬"] = "Boar"
U["食腐鳥"] = "Carrion Bird"
U["大貓"] = "Cat"
U["奇美拉"] = "Chimaera"
U["裂蹄"] = "Clefthoof"
U["熔核犬"] = "Core Hound"
U["螃蟹"] = "Crab"
U["鶴"] = "Crane"
U["鱷魚"] = "Crocolisk"
U["魔暴龍"] = "Devilsaur"
U["恐角龍"] = "Direhorn"
U["狗"] = "Dog"
U["龍鷹"] = "Dragonhawk"
U["羽鬃"] = "Feathermane"
U["狐狸"] = "Fox"
U["山羊"] = "Goat"
U["猩猩"] = "Gorilla"
U["多頭蛇"] = "Hydra"
U["土狼"] = "Hyena"
U["三葉蟲"] = "Krolusk" -- guess
U["蜥蜴"] = "Lizard"
U["機械"] = "Mechanical"
U["猴子"] = "Monkey"
U["蛾"] = "Moth"
U["虛空鰭刺"] = "Nether Ray"
U["玄牛"] = "Oxen"
U["翼手龍"] = "Pterrordax"
U["麒麟獸"] = "Quilen"
U["迅猛龍"] = "Raptor"
U["劫毀者"] = "Ravager"
U["河獸"] = "Riverbeast"
U["齧齒類"] = "Rodent"
U["鱗皮"] = "Scalehide"
U["蠍子"] = "Scorpid"
U["毒蛇"] = "Serpent"
U["岩蛛"] = "Shale Spider"
U["異種蟲族"] = "Silithid"
U["蜘蛛"] = "Spider"
U["靈獸"] = "Spirit Beast"
U["孢子蝙蝠"] = "Sporebat"
U["雄鹿"] = "Stag"
U["陸行鳥"] = "Tallstrider"
U["青蛙"] = "Toad"
U["海龜"] = "Turtle"
U["扭曲巡者"] = "Warp Stalker"
U["黃蜂"] = "Wasp"
U["水黽"] = "Water Strider"
U["風蛇"] = "Wind Serpent"
U["狼"] = "Wolf"
U["蟲"] = "Worm"

Announcer_Sap = ">>>被悶棍<<<";
Announcer_RocketPP = "漏油!!!救命啊~";
Announcer_Purgatory = "要死啦 要死啦~";
Announcer_Interrupted = "打斷→";
Announcer_Disperse = "驅散→";
Announcer_Stole = "偷取→";
Announcer_SpellIDnof = "<法術鏈接(ID)沒有找到>";
	
REPAIR_COST = "修理：";
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
	--["DEX_NumberFormat"] = { title = "顯示分隔符號", tooltipText = "是否顯示千分位傷害數字分隔符號"},
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
    ShowPluginGreenState        = "顯示綠字屬性前綴 |cffcccc33(重載生效)|r",
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
    Loot                        = "拾取",
  };
BINDING_NAME_InspectRaidFrame = "    顯示團隊觀察面板"
end
