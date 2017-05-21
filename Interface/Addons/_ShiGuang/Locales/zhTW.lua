local _, _, U, _ = unpack(select(2, ...))
if GetLocale() == "zhTW" then
  --CHAT_GUILD_GET = "|Hchannel:GUILD|h[公會]|h %s: "
  --CHAT_OFFICER_GET = "|Hchannel:OFFICER|h[官員]|h %s: "  
  --CHAT_RAID_GET = "|Hchannel:RAID|h[團隊]|h %s: "
  CHAT_RAID_WARNING_GET = "[通知] %s: "
  CHAT_RAID_LEADER_GET = "|Hchannel:RAID|h[團長]|h %s: "
  --CHAT_PARTY_GET = "|Hchannel:PARTY|h[隊伍]|h %s: "
  --CHAT_PARTY_LEADER_GET =  "|Hchannel:PARTY|h[隊長]|h %s: "
  CHAT_PARTY_GUIDE_GET =  "|Hchannel:PARTY|h[向導]|h %s: "
  --CHAT_INSTANCE_CHAT_GET = "|Hchannel:INSTANCE_CHAT|h[副本]|h %s: "
  CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:INSTANCE_CHAT|h[向導]|h %s: "

ACHIEVEMENT_BROADCAST = "%s获得%s!"
WORLD_CHANNEL = "世界頻道"
WORLD_CHANNEL_NAME = "世界頻道"

DANWEI_WAN = "%.1f萬";
DANWEI_YI = "%.1f億";

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
BONUSARMOR = "额外護甲";
ARMOR = "護甲";
HASTE = "加速";
MASTERY = "精通";
CRIT = "致命一擊";
INTELLECT = "智力";
SPIRIT = "精神";	
REPAIR_COST = "修理：";

Chatbar_ChatMiniMizeButtonText = "缩";
Chatbar_rollText = "R";
Chatbar_StatReport = "報";
Chatbar_ChannelYell = "喊";
Chatbar_ChannelSay = "說";
Chatbar_ChannelParty = "隊";
Chatbar_ChannelRaidWarns = "通";
Chatbar_ChannelRaid = "團";
Chatbar_ChannelBattleGround = "副";
Chatbar_ChannelGuild = "公";
Chatbar_EmoteCallButtonText = "圖";

ChatFilter_You = "你";
ChatFilter_Space = ", ";
ChatFilter_Channel = "大腳世界頻道";
ChatFilter_QuestReport = "任務進度%s?[:：]";
ChatFilter_Achievement = "%s獲得成就%s!";
ChatFilter_LearnSpell = "▲學會技能: %s";
ChatFilter_UnlearnSpell = "▼遺忘技能: %s";
ChatFilter_FriendlistFull = "好友列表已滿，已關閉過濾小號功能，如需再次打開，請在騰出空位後輸入/cf level開啓。";

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
}
DEX_TXT_CRUSH = "碾壓!"
DEX_TXT_DISPELLED = "驅散! "
DEX_TXT_STOLEN = "偷取! "
DEX_TXT_REFLECT = " 反彈! "
DEX_TXT_CRIT = "暴擊! ";
DEX_TXT_INTERUPT = "打斷! ";
DEX_MAIN_OPTION = "DamageEx";
DEX_BUTTON_RESET_TIP = "恢復預設值";
DEX_PREVIEW_LABEL = "拖動我改*變*文字位置";
DEXColorMode_T = "顏色模式"
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
	["DEX_NumberFormat"] = { title = "顯示分隔符", tooltipText = "是否顯示千分位傷害數字分隔符"},
	["DEX_NumberFormat"] = { title = "万进制显示", tooltipText = "是否以万为单位显示"},	
	["DEX_ShowSpellIcon"] = { title = "顯示技能圖標", tooltipText = "是否顯示技能圖標，選中則替換顯示技能名稱"},		
	["DEX_ShowInterrupt"] = { title = "是否顯示中斷", tooltipText = "是否顯示中斷提示"},	
	["DEX_ShowOverHeal"] = { title = "是否顯示過量治療", tooltipText = "是否顯示過量治療，關閉則不顯示"},				
}
DEXOptionsFrameSliders = {
	["DEX_Font"] = {  title = "字型 ", minText="字型1", maxText="字型3", tooltipText = "設置文字字型"},
	["DEX_FontSize"] = {  title = "文字大小 ", minText="小", maxText="大", tooltipText = "設置文字的大小"},
	["DEX_OutLine"] = {  title = "字型描邊 ", minText="無", maxText="粗", tooltipText = "設置文字的描邊效果"},
	["DEX_Speed"] = {  title = "文字移動速度 ", minText="慢", maxText="快", tooltipText = "設置文字的移動速度"},
	["DEX_LOGLINE"] = {  title = "訊息最大條目 ", minText="5條", maxText="20條", tooltipText = "設置訊息最大顯示條目數"},
	["DEX_LOGTIME"] = {  title = "訊息停留時間 ", minText="5秒", maxText="1分鐘", tooltipText = "設置訊息文字停留時間"},
}
DEXOptionsColorPickerEx = {
	["DEX_ColorNormal"] = { title = "物理傷害顏色"},
	["DEX_ColorSkill"] = { title = "技能傷害顏色"},
	["DEX_ColorPeriodic"] = { title = "持續傷害顏色"},
	["DEX_ColorHealth"] = { title = "治療顏色"},
	["DEX_ColorPet"] = { title = "寵物傷害顏色"},
	["DEX_ColorSpec"] = { title = "中斷,驅散等顏色"},
	["DEX_ColorMana"] = { title = "法力傷害顏色"},
}

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

GRIDCLICKSETS_MENUNAME = "點擊施法設置"
GRIDCLICKSETS_MENUTIP = "設置血條按鈕的點擊動作, 例如施法, 協助等."
GRIDCLICKSETS_TITLE = "點擊施法設置"
GRIDCLICKSETS_LOCKWARNING = "戰鬥中無法設置按鈕屬性, 設置已保存, 脫離戰鬥后自動生效。"
GRIDCLICKSETS_SET = "团框點擊施法已更新設置。"
GRIDCLICKSETS_SET_WHEEL_UP = "上滾"
GRIDCLICKSETS_SET_WHEEL_DOWN = "下滾"
GRIDCLICKSETS_SET_RESET_WARNING = "當前專精的設置將全部重置且無法恢復！"

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
QN_Quest       = "任務";
QN_Progress    = "進度";
QN_Complete    = "已完成!";
QN_Accept      = "接受任務";
	
	--Titles
	EnhancedChatFilter_MainFilter = "總開關"
	EnhancedChatFilter_MinimapIcon = "小地圖圖標"
--Minimap Tooltips
	EnhancedChatFilter_ClickToOpenConfig = "點擊打開配置介面"
--Common in tab
	EnhancedChatFilter_ClearUp = "清空"
	EnhancedChatFilter_DoYouWantToClear = "你确定要清空%s么？"
--General
	EnhancedChatFilter_General = "常规"
	EnhancedChatFilter_DND = "'忙碌'玩家"
	EnhancedChatFilter_DNDfilterTooltip = "过滤'忙碌'玩家及其自动回复"
	EnhancedChatFilter_Achievement = "成就刷屏"
	EnhancedChatFilter_AchievementFilterTooltip = "合并显示多个玩家获得同一成就"
	EnhancedChatFilter_RaidAlert = "團隊警報"
	EnhancedChatFilter_RaidAlertFilterTooltip = "过滤各类技能/打断喊话提示"
	EnhancedChatFilter_QuestReport = "任務組隊"
	EnhancedChatFilter_QuestReportFilterTooltip = "过滤各类组队任务喊话提醒"
	EnhancedChatFilter_SpecSpell = "天赋技能"
	EnhancedChatFilter_SpecSpellFilterTooltip = "如果你已满级则过滤你及宠物的技能/天赋学习信息"
	EnhancedChatFilter_MonsterSay = "怪物说话"
	EnhancedChatFilter_MonsterSayFilterTooltip = "用一个重复过滤器减少聊天框内怪物说话的刷屏。该选项不会影响怪物施放技能时的喊话，但可能屏蔽掉有用的任务提醒。"
	EnhancedChatFilter_RepeatOptions = "重复信息设置"
	EnhancedChatFilter_chatLinesLimit = "重复信息缓存行数"
	EnhancedChatFilter_chatLinesLimitTooltips = "重复信息的行数设定。请根据聊天频道的聊天量调整数值。增加数值会提高内存占用。设为0以关闭重复过滤。默认值20"
	EnhancedChatFilter_MultiLines = "多行喊话过滤"
	EnhancedChatFilter_MultiLinesTooltip = "重复过滤器现在也会过滤同一个人在短时间内的多行信息，这有助于减少各类宏的刷屏但同时也会过滤掉诸如dps统计的各插件通告"
	EnhancedChatFilter_AlsoFilterGroup = "同时过滤小队团队"
	EnhancedChatFilter_AlsoFilterGroupTooltips = "过滤器现在也会过滤小队团队中的发言，启用后你可能错过团队中有用的信息"
	EnhancedChatFilter_EnableAdvancedConfig = "启用高级选项"
	EnhancedChatFilter_AdvancedWarningText = "不要随意更改任何你不清楚的设置，不然你很有可能会把ECF玩坏！如果你只是点着玩请取消。如果你已经知道危险性，请继续..."
	EnhancedChatFilter_WhisperWhitelistMode = "密語白名單模式"
	EnhancedChatFilter_WhisperWhitelistModeTooltip = "除了工会、团队、小队、好友发送的密语外，只允许你发送过密语的对方才能对你发起密语|n|cffE2252D慎用！"
	EnhancedChatFilter_Aggressive = "额外过滤器"
	EnhancedChatFilter_AggressiveTooltip = "一些会极大提高过滤效果和|cffE2252D误伤机率|r的过滤器集合，默认不开启。"
--BlackwordList
	EnhancedChatFilter_BlackwordList = "黑名单關鍵詞"
	EnhancedChatFilter_AddBlackWordTitle = "添加新黑名單關鍵詞"
	EnhancedChatFilter_IncludeAutofilteredWord = "%s包含會被自動過濾的字符，蔣忽略該關鍵詞！"
	EnhancedChatFilter_Regex = "正規"
	EnhancedChatFilter_RegexTooltip = "标记添加的关键词为正则表达式|n仅对该次添加的关键词有效"
	EnhancedChatFilter_LesserBlackWord = "次级关键词"
	EnhancedChatFilter_LesserBlackWordTooltip = "标记添加的关键词为次级关键词，仅对该次添加的关键词有效|n当一个信息匹配多个次级关键词时才会被屏蔽。|n|n你应该只在添加那些日常交流会用到，但你希望屏蔽的对方会大量同时使用的词汇时勾选。|n下列情况不建议勾选：各种利用异体字/同音字防屏蔽的词汇、单个汉字。"
	EnhancedChatFilter_LesserBlackwordList = "次级黑名单关键词"
	EnhancedChatFilter_LesserBlackWordThreshold = "次级关键词阈值"
	EnhancedChatFilter_LesserBlackWordThresholdTooltips = "过滤包含至少阈值数目的次级关键词的信息"
	EnhancedChatFilter_BlackList = "关键词列表"
	EnhancedChatFilter_StringIO = "字符串導入導出"
	EnhancedChatFilter_Import = "導入"
	EnhancedChatFilter_StringHashMismatch = "字符串校驗錯誤"
	EnhancedChatFilter_ImportSucceeded = "導入成功"
	EnhancedChatFilter_Export = "導出"
--LootFilter
	EnhancedChatFilter_LootFilter = "拾取过滤器"
	EnhancedChatFilter_AddItemWithID = "添加ID"
	EnhancedChatFilter_NotExists = "不存在"
	EnhancedChatFilter_LootFilterList = "拾取屏蔽列表"
	EnhancedChatFilter_LootQualityFilter = "拾取物品质量"
	EnhancedChatFilter_LootQualityFilterTooltips = "显示拾取物品所需要的最低质量，低于此质量的物品将被过滤"
--AchievementFilter
	EnhancedChatFilter_GotAchievement = "[%s]獲得了成就%s！"
	EnhancedChatFilter_And = "、"	
	
		
	CurrencyTracking_CT_TITLE = "通貨追蹤";
	CurrencyTracking_CT_ADDON_NOTES = "追蹤所有獲取的通貨，並顯示在遊戲畫面上";
	CurrencyTracking_CT_OPTIONS = "選項";
	CurrencyTracking_CT_OPT_SHOWONSCREEN = "在遊戲畫面上顯示通貨資訊";
	CurrencyTracking_CT_OPT_SCALE = "通貨資訊的大小比例";
	CurrencyTracking_CT_OPT_TRANSPARENCY = "通貨資訊的透明度";
	CurrencyTracking_CT_OPT_BGTRANSPARENCY = "通貨資訊的背景透明度";
	CurrencyTracking_CT_OPT_TOOLTIPTRANSPARENCY = "通貨資訊提示的透明度";
	CurrencyTracking_CT_OPT_TOOLTIPSCALE = "通貨資訊提示的大小比例";
	CurrencyTracking_CT_OPT_BREAKUPNUMBERS = "將數字加上本地化千分號"
	CurrencyTracking_CT_OPT_ICONPRIORTONUMBER = "先顯示通貨圖示再顯示其數量";
  CurrencyTracking_CT_OPT_ALWAYSLOCK = "永遠鎖定通貨資訊視窗";
  CurrencyTracking_CT_OPT_ALWAYSLOCK_TIP = "啟用則將不僅限於戰鬥中才鎖定。停用則僅會於戰鬥中才鎖定。";
	CurrencyTracking_CT_CURRENCY_TO_TRACK = "在遊戲畫面上要追蹤的通貨：";
	CurrencyTracking_CT_CAT_TRACKED_CURRENCY = "追蹤的通貨";
	
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
  };

end
