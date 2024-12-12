local addonName, ZGV = ...
local COLOR_TIP_MOUSE = "|cffddff00"
local COLOR_TIP_HINT = "|cff99ff00"
local COLOR_TIP = "|cff00ff00"
local COLOR_SUG_GUIDE = "|cffffcc40"
local DIR = "Interface\\AddOns\\" .. addonName
local SHIFTCLICK = "<<Shift Click>>"

if GetLocale() ~= "zhCN" then return end

ZygorGuidesViewer_L("Main", "zhCN", function()
	return {
		MainFont = [[Fonts\arkai_t.TTF]],
		MainFontBold = [[Fonts\arkai_t.TTF]],
		name = "|cfffe6100Zygor Guides Viewer|r",
		zgname = "|cfffe6100Zygor Guides|r",
		name_plain = "Zygor Guides Viewer",
		-----------------------------------------------------------------------------------------------------------------
		-- step goals ---------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------
		["stepgoal_abandon"] = "放弃 %s 以及其他任务",
		["stepgoal_accept"] = "接受 %s",
		["stepgoal_accept_done"] = "接受 %s",
		["stepgoal_achieve"] = "获得 '%s' 成就",
		["stepgoal_achievesub"] = "完成 '%s' 为了成就 '%s'",
		["stepgoal_achievetext"] = "为了完成这个成就，你需要 %s",
		--stepgoal_activepet
		["stepgoal_appearance"] = "获取 %s 外观",
		["stepgoal_appearance_done"] = "获得 %s 外观",
		["stepgoal_arrive"] = "抵达 %s", -- used by stepgoal fly, unused
		["stepgoal_at"] = "同样在 %s",
		["stepgoal_at_suff"] = " (%s)", -- used by goal:GetText to show coordinates
		["stepgoal_avoid"] = "避免 %s",
		["stepgoal_buy #"] = "购买 %s %s",
		["stepgoal_buy #_done"] = "买到 %s %s",
		["stepgoal_buy"] = "购买 %s",
		["stepgoal_buy_done"] = "买到 %s",
		["stepgoal_cast"] = "施法 %s",
		["stepgoal_extraaction"] = "施法 %s",
		["stepgoal_click"] = "点击 %s",
		["stepgoal_click_done"] = "点击 %s",
		["stepgoal_clicknpc"] = "点击 %s",
		["stepgoal_clicknpc_done"] = "点击 %s",
		["stepgoal_collect #"] = "收集 %s %s",
		["stepgoal_collect #_done"] = "收集到 %s %s",
		["stepgoal_collect"] = "收集 %s",
		["stepgoal_collect_done"] = "收集到 %s",
		--stepgoal_condition
		["stepgoal_confirm"] = "点击继续",
		--stepgoal_count
		--stepgoal_countremains
		["stepgoal_craft #"] = "制作 %s %s",
		["stepgoal_craft #_done"] = "制作 %s %s",
		["stepgoal_craft"] = "制作 %s",
		["stepgoal_craft_done"] = "制作 %s",
		["stepgoal_create #"] = "制造 %d %s",
		["stepgoal_create"] = "制造 %s",
		--stepgoal_debugvar
		["stepgoal_ding"] = "到达等级 %s",
		["stepgoal_ding_brief"] = "到达等级 %s",
		["stepgoal_earn #"] = "赚取 %s %s",
		["stepgoal_earn #_done"] = "赚得 %s %s",
		["stepgoal_earn_done"] = "赚得 %s %s",
		["stepgoal_equipped"] = "装备 %s",
		--stepgoal_extraaction
		["stepgoal_farm #"] = "采集 %s %s",
		["stepgoal_farm #_done"] = "采得 %s %s",
		["stepgoal_farm"] = "采集 %s",
		["stepgoal_farm_done"] = "采得 %s",
		["stepgoal_ferry"] = "发现 %s 码头",
		["stepgoal_fly"] = "飞往 %s",
		--stepgoal_follower
		["stepgoal_fpath"] = "发现 %s 飞行路径",
		["stepgoal_fpath_done"] = "发现 %s 码头",
		["stepgoal_fpath_done"] = "发现 %s 飞行路径",
		["stepgoal_get #"] = "收集 %s %s",
		["stepgoal_get #_done"] = "收集到 %s %s",
		["stepgoal_get"] = "收集 %s",
		["stepgoal_get_done"] = "收集到 %s",
		["stepgoal_get_bank"] = " |cffffbbbb(%s 在银行)|r",
		["stepgoal_getrune"] = "收集 %s 符文",
		["stepgoal_goal #"] = "%s %s",
		["stepgoal_goal #_done"] = "完成: %s %s",
		["stepgoal_goal"] = "%s",
		["stepgoal_goal_done"] = "完成: %s",
		["stepgoal_goldcollect #"] = "收集 %s %s", -- no cap and > 0
		["stepgoal_goldcollect #_done"] = "收集到 %s %s", -- cap > 0.
		["stepgoal_goldcollect"] = "收集 %s", -- no cap and 0
		["stepgoal_goldcollect_done"] = "收集到 %s", -- cap and cap = 1 or 0
		["stepgoal_goldtracker"] = "预计赚取金币: %s",
		--stepgoal_goto
		["stepgoal_go to"] = "前往 %s", -- used by stepgoal goto
		["stepgoal_go to_leave"] = "离开 %s", -- used by stepgoal goto
		["stepgoal_gotonpc"] = "找到附近的 %s",
		["stepgoal_havebuff"] = "获得 Buff/Debuff '%s'",
		["stepgoal_havebuilding_active"] = "完成 %s 等级 %s",
		["stepgoal_havebuilding_building"] = "建造 %s 等级 %s",
		["stepgoal_havebuilding_ready"] = "等待 %s 等级 %s 建造完成",
		["stepgoal_hearth to"] = "炉石传送至 %s", -- used by stepgoal hearth
		["stepgoal_home"] = "设置 %s 为你的家",
		["stepgoal_image"] = "点击这里查看图片",
		--stepgoal_info
		["stepgoal_invehicle"] = "进入载具",
		--stepgoal_itemname
		["stepgoal_itemset"] = "获取 %s %s",
		["stepgoal_itemset_done"] = "获得 %s %s",
		["stepgoal_itemset_item"] = "获取 %s 外观",
		["stepgoal_itemset_item_done"] = "获得 %s 外观",
		["stepgoal_kill #"] = "击杀 %s %s",
		["stepgoal_kill #_done"] = "完成击杀 %s %s",
		["stepgoal_kill"] = "击杀 %s",
		["stepgoal_kill_done"] = "完成击杀 %s",
		["stepgoal_killboss"] = "败北 %s",
		["stepgoal_killboss_done"] = "败北 %s",
		["stepgoal_bosshp"] = "降低 %s 到 %d%% HP",
		["stepgoal_learn"] = "学习 %s",
		["stepgoal_learnmount"] = "获取 %s 座骑",
		["stepgoal_learnpet"] = "获取 %s 宠物",
		--stepgoal_learnpetspell
		["stepgoal_learnspell"] = "学习 %s 技能",
		["stepgoal_level"] = "到达等级 %s",
		["stepgoal_level_brief"] = "到达等级 %s",
		["stepgoal_level_exp"] = "到达等级 %s 且 %s XP",
		["stepgoal_level_exp_brief"] = "到达等级 %s 且 %s XP",
		["stepgoal_level_kill"] = " (%s 击杀)",
		["stepgoal_level_kills"] = " (%s 击杀)",
		["stepgoal_loadguide"] = "点击加载%s|cffff8032\"%s\"|r 向导",
		--stepgoal_nexttab
		--stepgoal_noautoaccept
		["stepgoal_nobuff"] = "丢失 Buff/Debuff '%s'",
		["stepgoal_noquest"] = "确保 %s 不再提供任何任务, 或者点击这里",
		--stepgoal_notinsticky
		["stepgoal_offtaxi"] = "抵达飞行点",
		--stepgoal_oncomplete
		["stepgoal_ontaxi"] = "从飞行点出发",
		["stepgoal_outvehicle"] = "离开载具",
		["stepgoal_perform_alchemy"] = "制造 %s %s",
		["stepgoal_perform_first aid"] = "制造 %s %s",
		["stepgoal_perform_enchanting"] = "施法 %s %s",
		["stepgoal_perform_blacksmithing"] = "锻造 %s %s",
		["stepgoal_perform_engineering"] = "构建 %s %s",
		["stepgoal_perform_tailoring"] = "缝制 %s %s",
		["stepgoal_perform_leatherworking"] = "缝制 %s %s",
		["stepgoal_perform_mining"] = "执行 %s %s",
		["stepgoal_perform_inscription"] = "铭刻 %s %s",
		["stepgoal_perform_cooking"] = "烹饪 %s %s",
		["stepgoal_perform_jewelcrafting"] = "加工 %s %s",
		["stepgoal_petaction"] = "使用宠物攻击 %s",
		["stepgoal_petlevel"] = "训练 %s 宠物到等级 %s",
		["stepgoal_phase"] = "您已到达本向导目前可完成内容的终点。在暴雪再次更新解锁更多内容之前，超过此点的游戏内容将被封锁，无法进入。",
		["stepgoal_phase_done"] = "阶段解锁。继续向导。",
		--stepgoal_petding
		--stepgoal_petspecies
		--stepgoal_playerchoice
		["stepgoal_playertitle"] = "获得 '%s' 头衔",
		--stepgoal_polish
		--stepgoal_q
		--stepgoal_quest
		--stepgoal_questchoice
		["stepgoal_rep"] = "到达 %s 与 %s",
		["stepgoal_collectrep_done"] = "收集了足够的 %s 达到 %s 与 %s",
		["stepgoal_collectrep"] = "收集 %s %s 达到 %s 与 %s",

		--stepgoal_scenariobonus
		--stepgoal_scenarioend
		["stepgoal_scenariogoal #"] = "%s: %s",
		["stepgoal_scenariogoal #_done"] = "完成: %s %s",
		["stepgoal_scenariogoal"] = "%s",
		["stepgoal_scenariogoal_done"] = "完成: %s",
		["stepgoal_scenariogoal_unknown #"] = "完成 %d 个场景目标",
		["stepgoal_scenariogoal_unknown"] = "完成一个场景目标",
		["stepgoal_scenariostage"] = "完成场景阶段 %d",
		["stepgoal_scenariostage_done"] = "场景阶段 %d 完成",
		["stepgoal_scenariostage_named"] = "完成阶段 %d: %s",
		["stepgoal_scenariostart"] = "开始 %s 场景战役",
		["stepgoal_scenariostart_unknown"] = "开始场景战役",
		["stepgoal_skill"] = "达到 %s 等级 %s",
		["stepgoal_skillmax"] = "学习 %s 专业",
		["stepgoal_skillmax2"] = "学习 %s 技能", -- pre bfa wording, not used
		["stepgoal_specialtalent"] = "学习 %s 技能 从 %s 那里。",
		["stepgoal_specialtalentactive"] = "激活 %s 技能 从 %s 那里。",
		--stepgoal_subzone
		["stepgoal_talk to"] = "与 %s 交谈", -- used by talk, talknpcs
		["stepgoal_talk to nearest"] = "与最近的 %s 交谈", --alternative talknpcs text
		["stepgoal_visit_city"] = "前往最近的 %s",
		["stepgoal_:"] = ": %s",
		["stepgoal_talk to_done"] = "结束对话 %s", -- used by talk, talknpcs
		["stepgoal_visit_city"] = "前往最近的 %s",
		["stepgoal_toy"] = "Obtain %s Toy",
		["stepgoal_toy_done"] = "Obtained %s Toy",
		["stepgoal_trash #"] = "%1$s (%2$s)",
		["stepgoal_trash"] = "%1$s",
		["stepgoal_turn in"] = "完成 %s",
		["stepgoal_turn in_done"] = "完成 %s",
		["stepgoal_unequipped"] = "卸下 %s",
		["stepgoal_use"] = "使用 %s",
		["stepgoal_userune"] = "铭刻 %s 符文",
		["stepgoal_vendor"] = "拜访 %s的 店铺",
		["stepgoal_vendor_done"] = "已拜访 %s的 店铺",
		--stepgoal_walk
		--stepgoal_webheader
		--stepgoal_webimage
		--stepgoal_webinfo
		--stepgoal_worldquestqueue
		--stepgoal_zombiewalk

		-----------------------------------------------------------------------------------------------------------------
		-- options ---------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------


		opt_group_cover = "可执行文件",
		opt_execconfig = "Standalone Config",
		opt_options = "Show settings",
		opt_profiler = "Profiler (caution!)",
		opt_debug = "Debug mode",
		opt_debugflag = "Set debug flags",
		opt_debugflags = "Set debug flags",
		opt_show = "Show viewer",
		opt_hide = "Hide viewer",
		opt_detectpet = "Detect pet",
		opt_way = "Set a destination waypoint",
		opt_questid = "Search by quest id",
		opt_tabs_icon = "Use icons in tabs",
		opt_briefopentime = "Brief expansion delay",
		opt_briefclosetime = "Brief collapse delay",
		--opt_dispmodepri
		opt_share_masterslave = "与 Zygor Basic 用户共享指南步骤",
		opt_share_masterslave_none = "Disabled",
		opt_share_masterslave_master = "Master (shares)",
		opt_share_masterslave_slave = "Slave (receives)",
		opt_enable_vendor_tools = "启用商人工具",
		opt_showgreyvalue = "显示灰色物品的价值",
		opt_autobuyframe = "购买前确认",
		opt_im_prefer_repair = "仅寻找修理商店",
		opt_autotrackquests = "Automatically track guide quests [DEBUG]",
		opt_audiocues = "声音方向提示",
		opt_minimapzoom = "自动小地图缩放",
		--opt_share_target

		opt_group_display = "指示器",
		opt_enable_viewer = "启用",
		opt_windowlocked = "锁定",
		opt_hidetracker = "隐藏目标跟踪器",
		opt_hidetracker_desc = "当 Zygor 可见时隐藏 WoW 任务目标跟踪器",
		opt_hideexptracker = "隐藏经验条",
		opt_hideexptracker_desc = "当 Zygor 可见时隐藏 WoW 经验条，并设置为显示 exp 进度条",
		opt_skinstyle = "皮肤:",
		opt_opacitytoggle = "启用透明度",
		opt_opacity = "指示器不透明度",
		opt_opacity_low = "Low",
		opt_opacity_high = "High",
		opt_opacitymenu = "菜单不透明度",
		opt_opacity_low = "Low",
		opt_opacity_high = "High",
		opt_framescale_s = "大小:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_fontsize_s = "字体大小:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_resizeup = "翻转指示器",
		opt_hideincombat = "战斗中隐藏",
		opt_hideincombat_desc = "如果屏幕过于拥挤，进入战斗时隐藏所有引导窗口。",
		opt_hidebarincombat = "在战斗中隐藏操作栏",
		opt_repositionviewer = "与商人窗口交互时保持指示器可见",
		opt_repositionviewer_desc = "在与商人窗口交互时保持指示器可见，向导会指示您打开这些窗口",
		opt_progress = "显示进度条",
		opt_showmapbutton = "显示小地图图标",
		opt_resetwindow = "重置窗口",
		opt_widgets = "小组件",
		opt_widgetfloatopacity = "小组件不透明度",
		opt_widgetfloatscale_s = "小组件大小",

		opt_group_stepdisplay = "步骤显示",
		opt_showcountsteps = "最大显示步骤数量:",
		opt_showcountsteps_all = "全部",
		opt_fixedheight = "启用手动调整步长",
		opt_vendorshow = "调过售卖步骤",
		opt_showinlinetravel = "显示旅行路线",
		opt_stepdisplay_dungeon = "地下城",
		opt_showallroles = "展示所有角色的攻略",
		opt_showallroles_desc = "显示所有角色（DPS、坦克、治疗）的副本首领策略，而不仅仅是你的角色策略。",
		opt_showallroles_descwarnnone = "|cffffa500Note:|r |cffffdd88 你当前没有分配到小队角色，现在切换此选项不会有明显效果。",
		opt_showallroles = "展示所有角色的攻略",
		opt_showallroles_desc = "显示所有角色（DPS、坦克、治疗）的副本首领策略，而不仅仅是你的角色策略。",

		opt_group_share = "同步与分享",
		opt_sync_enabled = "Enable Sync & Share features",
		opt_sync_snap = "Sync party progress",
		opt_share_masterslave = "Share guide step with Zygor Basic users",
		opt_share_masterslave_none = "Disabled",
		opt_share_masterslave_master = "Master (shares)",
		opt_share_masterslave_slave = "Slave (receives)",

		opt_group_automation = "自动化",
		opt_header_automation_quests = "任务",
		opt_autoacceptturnin = "自动交接任务",
		opt_autoacceptturninall = "所有任务",
		opt_autoacceptturninall = "所有任务",
		opt_autoacceptturninall_desc = "自动交接遇到的任何任务，即使不按照向导进行。",
		opt_header_automation_travel = "旅行",
		opt_autotaxi = "自动选择建议的飞行路线",
		opt_header_automation_inventory = "背包",
		opt_autobuy = "自动购买向导物品",
		opt_showgreysellbutton = "启用 “售卖垃圾” 按钮",
		opt_autosell = "自动出售灰色物品",
		opt_autosellother = "建议我可以安全出售给供应商的物品。",
		opt_autorepair = "自动修理",
		opt_autorepair_ownonly = "自我修理",
		opt_autorepair_ownandguild = "优先自我修理",
		opt_autorepair_guildandown = "优先公会修理",
		opt_autorepair_manual = "不要自动修理",
		opt_autorepair_notinguild =
		"You are not currently in a guild.\nGuild repairs will not work, but you can still auto-repair using your own money.",
		opt_autorepair_nopermission =
		"Your current guild rank does not allow guild repairs.\nYou can still auto-repair using your own money.",
		opt_header_others = "其他",
		opt_autoskipcutscenes = "自动跳过场景",
		opt_autogossip = "自动选择对话框选项",

		opt_group_actionbuttons = "动作按钮",
		opt_enable_actionbuttons = "启用动作按钮",
		opt_enable_actionbar = "启用动作条",
		opt_actionbar_scale_s = "按钮缩放",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_actionbar_types_title = "按钮样式：",
		opt_actionbar_quest = "任务行动",
		opt_actionbar_talk = "与NPC对话",
		opt_actionbar_kill = "击杀敌对",
		opt_actionbar_trash = "从背包中删除最便宜的商品",
		opt_targetonclick = "使用操作按钮选择 NPC 时为其添加团队标记",

		opt_group_travelsystem = "航点箭头",
		opt_arrowshow = "启用",
		opt_arrowfreeze = "锁定",
		opt_arrowalpha = "不透明度",
		opt_arrowscale_s = "大小:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_arrowfontsize_s = "箭头文本大小:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_arrowoutline = "为箭头文本添加轮廓",
		opt_arrowskin = "箭头样式",
		opt_arrowskinselect = "箭头样式",
		opt_arrowunit = "距离单位",
		opt_travelsystem_enable_title = "旅行系统",
		opt_pathfinding = "启用旅行系统",
		opt_travelmethods_title = "旅行方法",
		opt_travelavoidportals = "Avoid portals",
		opt_travelusehs = "使用炉石",
		opt_traveluseitems = "使用物品",
		opt_travelusespells = "使用技能",
		opt_travelprefertaxi = "首选飞行路线",
		opt_pathfinding_comfort = "首选大路",
		opt_pathfinding_comfort_desc = "旅行更喜欢用户互动较少的方式，而不是必须主动控制角色的方式。关闭此功能后，将不惜一切代价提高速度。",
		--opt_pathfinding_comfort = "Travel comfort preference",
		--opt_pathfinding_comfort_speed = "Speed",
		--opt_pathfinding_comfort_comfort = "Comfort",

		-- Travel Settings ---------------------------------------------------------------------------------------------------
		opt_travelmode = "旅行模式",
		opt_travelmode_1 = "直达",
		opt_travelmode_1_desc = "这将禁用所有特殊旅行模式，直接前往目的地。",
		opt_travelmode_2 = "简单",
		opt_travelmode_2_desc = "这将限制旅行系统仅使用飞行、船只、列车、飞艇、选择的传送门/物品，并在可用时优先选择这些旅行方式。",
		opt_travelmode_3 = "高级",
		opt_travelmode_3_desc = "这将尝试使用所有可用的旅行方式以最快的方式到达目的地。这可能意味着直接骑乘坐骑飞往那里或使用看似奇怪的路线。仅推荐给高级用户。",
		opt_travelmode_4 = "自定义",
		opt_travelmode_4_desc = "手动混合和匹配旅行选项以创建自己的自定义预设。",
		opt_travelprefertaxi = "优先使用飞行路径",
		opt_travelprefertaxi_desc = "",
		opt_travelprefertaxi_pathfinding_comfort = "尝试使用单次旅行",
		opt_travelprefertaxi_pathfinding_comfort_desc = "",



		opt_group_maps = "地图",
		opt_maps_general_title = "地图增强",
		opt_maplines_enabled = "启用追踪",
		opt_maplines = "追踪样式：",
		opt_maplines_ants = "追踪",
		opt_maplines_solid = "实线",
		opt_maps_world_title = "世界地图增强",
		opt_foglight = "显示整个地图",
		opt_mapicons = "显示地图标记",
		opt_poienabled = "显示兴趣点",
		opt_poisize = "兴趣点大小",
		opt_framescale_s_small = "Small",
		opt_framescale_s_normal = "Normal",
		opt_framescale_s_large = "Large",
		opt_poialphatoggle = "启用图标透明度",
		opt_poishow = "兴趣点类型：",
		opt_poishow_rare = "Rare spawns",
		opt_poishow_rare = "Rare spawns",
		opt_poishow_rare_desc = "",
		opt_poishow_treasure = "宝箱",
		opt_poishow_treasure = "宝箱",
		opt_poishow_treasure_desc = "",
		-- Points of Interest & World Quests ---------------------------------------------------------------------------------------------------
		opt_poitype = "兴趣点显示模式:",
		opt_poitype_quick = "快速访问",
		opt_poitype_complete = "完成主义模式",
		opt_worldquestenable = "启用 Zygor 世界任务规划器",
		opt_worldquestlocal = "优先完成当前区域的世界任务",
		opt_worldquestlocal_desc = "所有排队的世界任务将在当前区域完成后才会转到下一个区域。",
		opt_worldquestmap = "点击世界任务图标时加载世界任务指南",
		opt_maps_taxi_title = "航行地图",
		opt_highlighttaxi = "高亮建议的航行路径",
		opt_maps_dungeon_title = "地下城地图增强",
		opt_preview = "启用 Zygor 地下城地图",
		opt_preview_desc = "在地下城中使用地图预览。\n由于插件限制无法在地下城内使用路线箭头，因此显示可自定义的地图以帮助导航。",
		opt_preview_scale = "缩放:",
		opt_preview_scale_small = "小",
		opt_preview_scale_normal = "中",
		opt_preview_scale_full = "全",
		opt_preview_alpha = "透明度:",
		opt_preview_alpha_low = "低",
		opt_preview_alpha_normal = "中",
		opt_preview_alpha_high = "高",
		opt_preview_duration = "预览持续时间:",
		opt_preview_duration_perm = "无持续时间",
		opt_preview_duration_3 = "3秒",
		opt_preview_duration_5 = "5秒",
		opt_preview_duration_10 = "10秒",
		opt_preview_control = "预览控制:",
		opt_preview_control_manual = "手动",
		opt_preview_control_step = "每步自动激活",
		opt_preview_control_stepnc = "每步自动激活，战斗中隐藏",

		opt_group_gear = "装备",
		opt_gear_title = "装备顾问",
		opt_autogear = "启用装备古顾问",
		opt_autogear_max = "在满级角色上禁用装备顾问",
		opt_questitemselector = "高亮推荐的任务奖励",
		opt_autoselectitem = "自动选择任务奖励",
		opt_autoselectitem_desc = "建议的奖励已为你选择。你仍需点击“完成任务”，或者在自动化选项中启用自动交任务。",
		opt_autogear_keepheirlooms = "不要替换传家宝物品",
		opt_autogearauto = "自动装备建议的装备升级",
		opt_itemscore_tooltips = "启用 Zygor 物品评分工具提示",
		opt_itemscore_tooltips_azerite = "显示艾泽里特能量信息",
		opt_gear_sources = "装备查找器：",
		opt_gear_sources_dungeons = "副本来源",
		--opt_gear_1 -- uses blizzard system strings
		--opt_gear_2  -- uses blizzard system strings
		--opt_gear_23 -- uses blizzard system strings
		--opt_gear_24 -- uses blizzard system strings
		opt_gear_23_plus = "史诗+升级等级",
		opt_gear_sources_raids = "团队副本来源",
		--opt_gear_17 -- uses blizzard system strings
		--opt_gear_14 -- uses blizzard system strings
		--opt_gear_15 -- uses blizzard system strings
		--opt_gear_16 -- uses blizzard system strings
		opt_clearnotupgrades = "清除已拒绝的物品",
		opt_itemscore_ae_clearednotupgrade = "已清除之前未升级的物品。", -- printed message
		opt_markupgrades = "在背包中高亮显示升级物品",
		opt_upgradebest = "Type",
		opt_upgradeslot = "Slot",
		opt_upgrademarker = "Style",
		opt_autogearpopup = "显示新升级的弹出提示",
		opt_badupgradehotkey = "使用快捷键报告错误的升级建议",
		opt_hotkey1 = "第一个键",
		opt_hotkey2 = "第二个键（可选）",
		opt_hotclick = "点击",

		opt_group_itemscore = "物品评分",
		opt_itemscore_warning = "在这里，您可以调整 “装备顾问 ”用于建议物品升级的属性权重。",
		opt_gear_score_class = "职业",
		--opt_gear_selected_class -- displayed as empty string
		opt_gear_score_spec = "专业",
		-- Gear Options ---------------------------------------------------------------------------------------------------
		opt_gear_maxGem = "镶嵌空槽:",
		opt_gear_maxGem_desc = "Zygor 将使用最佳宝石评分空槽。选择要使用的最高宝石质量。",
		opt_gearshowallstats = "显示所有属性",
		opt_gearimport = "处理数据用于 %s %s",
		opt_gearexport = "导出",
		opt_gear_score_offspec = "为此专精评分副专精物品",
		opt_gear_custom_active = "您正在使用自定义设置",
		opt_gear_select_set_active = "您正在使用 %s 作为您的活动构建",
		opt_gear_select_set_inactive = "点击以选择 %s 作为您的活动构建",

		-- Goldguide-View ---------------------------------------------------------------------------------------------------
		opt_group_gold = "地精向导",
		opt_goldimport = "导入",
		opt_gold_format = "金币显示格式：",
		opt_gold_format_desc = "更改 Zygor 指南插件中金币和拍卖部分的显示方式。",
		opt_gold_auctions_title = "拍卖行工具",
		opt_auction_enable = "启用拍卖行工具",
		opt_autoscan = "打开拍卖面板时自动扫描",
		opt_quickscan = "启用快速扫描（小心）",
		opt_quickscan_desc = "通过排除战宠和装备变体来减少扫描时间。",
		opt_quickscan_warning = "警告：您正在使用快速扫描方法。\n这会减少扫描时间，但会排除战宠和装备变体。",
		opt_auction_autoshow_tab = "打开拍卖行面板时默认显示 Zygor 卖出标签。",
		opt_smartstack = "启用智能堆叠",
		opt_gold_ahscanintensity = "拍卖扫描速度：",
		opt_gold_ahscanintensity_desc = "扫描过于频繁可能会使游戏服务器过载。\n如果您在扫描时遇到断线问题，请降低此值。\n您的扫描速度将变慢，但不易断线。",
		opt_gold_ahscanintensity_low = "慢",
		opt_gold_ahscanintensity_default = "正常",
		opt_gold_ahscanintensity_high = "快",
		opt_gold_reset_hidden = "重置拍卖工具隐藏的项目",
		opt_gold_tooltips_show = "启用金币指南物品提示",
		opt_gold_tooltips_out = "提示显示模式：",
		opt_gold_tooltips_out_desc = "Zygor 可以在物品提示中显示额外的信息。使用此设置更改显示的信息量。",
		opt_gold_tooltips_out_none = "无",
		opt_gold_tooltips_out_simple = "简单",
		opt_gold_tooltips_out_dynamic = "动态",
		opt_gold_tooltips_out_full = "完整",

		-- Notification Options ---------------------------------------------------------------------------------------------------
		opt_group_notification = "通知",
		opt_nc_enable = "启用通知系统",
		opt_nc_size = "通知大小",
		opt_nc_duration = "通知持续时间",
		opt_nc_position = "通知位置",
		opt_nc_right = "右侧",
		opt_nc_left = "左侧",
		opt_nc_lastpos = "用户定位",
		opt_nc_showall = "显示高级设置",

		opt_nc_types = "通知类型",
		opt_nc_dungeon = "副本指南建议",
		opt_nc_gear = "装备建议",
		opt_nc_gear_max = "在最大等级角色上禁用装备建议",
		opt_nc_monk = "僧侣日常重置",
		opt_nc_pet = "生物探测器",
		opt_nc_skills = "职业技能提醒",
		opt_nc_welcome = "欢迎消息",
		opt_nc_general = "最新更新",
		opt_nc_orientation = "启动方向提醒",
		opt_nc_dailyquest = "每日任务重置",
		opt_nc_worldquest = "每周任务重置",
		opt_nc_creatures = "生物探测器",
		opt_nc_events = "季节性事件",
		opt_nc_riding = "骑术技能",
		opt_nc_cutscenes = "跳过的过场动画和电影",

		opt_nc_skillstitle = "职业技能提醒设置",
		opt_nc_size_compact = "紧凑",
		opt_nc_size_detailed = "详细",

		opt_group_notify = "在详细视图中，通知我以下内容：",
		opt_nc_skills_optional = "可选技能",
		opt_nc_skills_future = "未来技能",

		opt_nc_skillstriggertitle = "职业技能提醒触发器",
		opt_nc_skills_login = "登录时",
		opt_nc_skills_level = "获得新等级时",
		opt_nc_skills_town = "进入主城时",
		opt_nc_skills_trainer = "与职业训练师交谈时",
		opt_nc_skills_dist = "靠近职业训练师时",
		opt_nc_skills_clear = "清除已阻止的技能",

		opt_nc_sendtonc = "将所有通知发送到通知中心",
		opt_nc_markseen = "将所有通知标记为已查看",
		opt_nc_hidewhenclosed = "关闭查看器时隐藏通知",


		-- Notification Options ---------------------------------------------------------------------------------------------------
		opt_nc_duration_desc = "设置消息显示时间，直到消息渐隐。注意：所有消息将被存储在通知中心，无论设置如何。",
		opt_nc_sendtonc_desc = "这将禁用所有吐司和其他弹出窗口显示，并将它们直接发送到通知中心以便稍后查看。",
		opt_nc_markseen_desc = "这将把所有收到的通知标记为已查看，并且在通知发送到通知中心时不会在 Zygor 按钮周围添加橙色圆圈。",
		opt_nc_size_desc = "更改吐司消息中显示的详细信息量。在紧凑模式下，您只会看到基本的吐司描述。在详细模式下，您会看到附加提示和更多详细信息。",
		opt_nc_welcome_desc = "首次使用时出现的欢迎消息。",
		opt_nc_general_desc = "在版本更新时出现的消息，当重要更新已完成时。",
		opt_nc_orientation_desc = "当您缺少提高 Zygor 性能所需的数据时出现的消息。",
		opt_nc_dailyquest_desc = "当每日任务重置时通知您的消息。",
		opt_nc_worldquest_desc = "当每周任务重置时通知您的消息。",
		opt_nc_events_desc = "当新的季节性事件开始时通知您的消息。",


		opt_group_extras = "额外内容",
		opt_chat_title = "聊天",
		opt_noisy = "显示 Zygor 聊天窗口消息",
		opt_analyzereps = "Show detailed reputation gains",
		opt_petbattleframe = "Enable Pet Battle Info Panel",
		opt_talenton = "启用天赋推荐",
		opt_beta_use_chains = "[BETA] Use quest chains",
		opt_showbagspace = "Show free bags space",
		opt_showbagspace_desc = "Show counter with free and total bag space over the backpack icon",
		opt_ratings = "Enable guide rating",
		opt_mouseovermarkers = "Show Zygor target markers on mouse over",

		opt_group_talentsystem = "天赋推荐",
		-- rest is pulled from L("zta")

		opt_group_profile = "配置文件",
		opt_profile_description =
		"Profiles allow you to save your Zygor addon settings and have different or the same settings across multiple characters. Profiles are automatically updated when changes are made.",
		opt_profile_current = "当前配置文件: ",
		opt_profile_default = "Use this profile on all characters",
		opt_profile_reset = "重置",
		opt_profile_manage = "管理配置文件：",
		--opt_newprofiletext
		opt_newprofile = "新建配置文件",
		--opt_deleteprofiletext
		opt_deleteprofile = "删除配置文件",
		opt_wipe_settings = "清除设置",
		opt_wipe_settings_desc2 =
		"Completely clear out Zygor Guides' settings, for all characters on this account.|n|cffff8800Warning: this operation is permanent.|r|n|cffddff00Hold |cffffff00Shift|r when clicking the button to confirm.",
		opt_wipe_settings_desc =
		"Completely clear out Zygor Guides' settings, for all characters on this account.|n|cffff8800Warning: this operation is permanent.|r|n|cff00ff00Hold |cff88ff00Shift|r when clicking the button to confirm.",
		opt_widgetsbackup = "备份和还原小组件设置",
		opt_widgetsimport = "还原",
		opt_widgetsexport = "备份",

		opt_group_about = "关于",
		opt_about_desc1 = "Zygor Guides Viewer",
		opt_about_desc2 = "© 2022 Zygor Guides © 暧昧的呓语@NGA.CN 汉化",
		opt_about_desc3 = "All Rights Reserved",
		opt_about_desc4 = "Version %s.",
		opt_tech_support_header = "技术支持",
		opt_tech_support =
		"如需帮助，请联系 |cffff8800zygorguides.com/support|r |n汉化问题，请联系|cffff8800bbs.nga.cn/read.php?tid=34474648|r",
		opt_report = "创建错误报告",
		opt_mv_enabled = "Enable Model Viewer",
		opt_mv_rotation = "Rotate models",
		opt_mv_slideshow = "Slide show",
		opt_mv_reset = "Reset windows",

		-----------------------------------------------------------------------------------------------------------------
		-- code files ---------------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------
		-- Achievement ---------------------------------------------------------------------------------------------------
		achieveframe_button = "|cffffff00点击|cff00ff00 加载 '|cffffff00%s|cff00ff00' 成就向导.",

		-- Actionbar
		actionbar_trash = "按住 Shift 键销毁：|n|cff9d9d9d%d %s|r worth %s|n右键跳过此项目|n",
		actionbar_trash_more_header = "|n更多可删除项目：|n",
		actionbar_trash_more = "|cff9d9d9d%d %s|r  - %s|n",
		actionbar_trash_destroying = "销毁所选项目",
		actionbar_trash_nothing = "未找到要删除的项目",

		-- Auctiontools-View ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide_short = "该领域无趋势数据。",
		gold_app_no_scan_data_short = "目前价格未知。",
		gold_app_no_servertrends_short = "该领域无趋势数据。 ",
		gold_app_old_scan_data_short = "扫描",
		gold_app_old_servertrends_short = "趋势数据已过时 (%s). ",

		-- BugReport ---------------------------------------------------------------------------------------------------
		bugreport_bugtype = "选择错误类型",
		bugreport_button_save = "保存报告",
		bugreport_button_view = "查看",
		bugreport_description = "请尽可能详细描述您遇到的问题。",
		bugreport_header = "糟糕……发生错误了吗？",
		bugreport_info = "如果可以重现问题，请详细描述需要采取的步骤。",
		bugreport_step_message = "请告诉我们您对该步骤的任何错误、问题或建议。",
		bugreport_step_message_addon = "请描述您遇到的问题，并提供如何重现问题的相关信息。",
		bugreport_step_message_gear = "请解释为何认为 %s 的评分不准确。",
		bugreport_step_submit = "提交",
		bugreport_step_title = "用户反馈",
		bugreport_step_tooltip = "报告您遇到的指南或插件问题。",
		bugreport_step_tooltip2 = "|cff00ff00反馈将通过 Zygor 客户端在您登出时上传。|r",
		bugreport_step_type = "请选择反馈类型：",
		bugreport_step_default = "|cff959d95点击选择一个值。",
		bugreport_step_component = "请选择组件：",
		bugreport_step_comp_guideviewer = "指南查看器",
		bugreport_step_comp_share = "分享功能",
		bugreport_step_comp_guidemenu = "指南菜单",
		bugreport_step_comp_featured = "精选部分",
		bugreport_step_comp_widgets = "小工具",
		bugreport_step_comp_travel = "旅行路线",
		bugreport_step_comp_findNPC = "寻找 NPC/物体",
		bugreport_step_comp_notifications = "通知",
		bugreport_step_comp_gearsuggestion = "装备建议",
		bugreport_step_comp_gearfinder = "装备查找器",
		bugreport_step_comp_auctiontools = "拍卖行工具",
		bugreport_step_comp_poi = "兴趣点",
		bugreport_step_comp_talentadvisor = "天赋顾问",
		bugreport_step_comp_settings = "设置",
		bugreport_step_comp_other = "其他",
		bugreport_step_severity = "告诉我们问题的严重程度：",
		bugreport_step_severity0 = "|cff959d95点击选择问题的最准确描述。",
		bugreport_step_severity1 = "问题导致整个功能无法正常工作。",
		bugreport_step_severity2 = "问题导致某些功能无法正常工作，但可以绕过。",
		bugreport_step_severity3 = "问题较小，不影响使用。",
		bugreport_step_nofeed = "|cffff8888请在输入框中提供反馈。",
		bugreport_step_nocomponent = "|cffff8888请选择组件。",
		bugreport_step_noseverity = "|cffff8888请选择问题的严重程度。",
		bugreport_step_addoninfo = "|cffff8888请添加缺失的信息。",
		report_noauthor = "|cffff8888(无可用地址)|r",
		report_notitle = "|cffff8888(无名称的指南)|r",

		-- CreatureDetector ---------------------------------------------------------------------------------------------------
		detector_tooltip_click = "<<Click>> 打开相应的指南。",
		detector_tooltip_hunter_click = "<<Click>> 打开指南列表。",
		notifcenter_pet_text = "|c%s%s|r 被检测到。",
		notifcenter_pet_title = "生物探测器",
		report_nomount_dialog =
		"|cffff8888Zygor 指南坐骑探测器|r\n\n该玩家未骑乘坐骑，或我们无法识别他们使用的坐骑。\n\n您可以通过对玩家进行“扫描”并将其报告给我们来帮助改进指南。\n\n确定目标正在骑乘坐骑吗？",
		report_nopet_dialog = "|cffff8888Zygor 指南宠物探测器|r\n\n目标不是宠物，或我们无法识别你所选择的宠物。\n\n您可以通过报告该宠物来帮助我们改进指南。\n\n确定目标是宠物吗？",
		notifcenter_mount_detected = "|c%s%s|r 被检测到。",
		notifcenter_pet_detected = "|c%s%s|r 被检测到。\n|cffc4c4c4您已经拥有这个宠物。",
		notifcenter_new_unit_detected = "|c%s%s|r 被检测到。",
		notifcenter_guideload = "您已完成此指南。仍然加载吗？",
		notifcenter_guideload2 = "您已收集到 |c%s%s|r。\n\n仍然想加载此指南吗？",
		notifcenter_guideload3 = "|c%s%s|r 被检测到。\n\n仍然想加载此指南吗？",
		notifcenter_alreadyhas_load = "加载",
		notifcenter_alreadyhas_ignore = "忽略",
		mountframe_button = "|cffffff00点击|cff00ff00加载获得“|cffffff00%s|cff00ff00”坐骑的指南。",

		notifcenter_cd_creature_title = "%s 被检测到",
		notifcenter_cd_hunterpet_text = "点击打开获取指南。",
		notifcenter_cd_hunterpet_owned = "|n|cffc4c4c4您已经拥有这个猎人宠物。",

		notifcenter_cd_pet_text = "点击打开获取指南。",
		notifcenter_cd_pet_owned = "|n|cffc4c4c4您已经拥有这个宠物。",

		notifcenter_cd_mount_text = "点击打开获取指南。",
		notifcenter_cd_mount_owned = "|n|cffc4c4c4您已经拥有这个坐骑。",


		-- CreatureViewer ---------------------------------------------------------------------------------------------------
		model_viewer_no_model = "No model",
		tooltip_modelviewer_default_desc = "|cffffff00Right-Click|cff00ff00 to return the viewer to the default position",
		tooltip_modelviewer_lock_desc = "|cffffff00Click|cff00ff00 to lock viewer relatively to main frame",
		tooltip_modelviewer_locked = "Model Viewer is Locked",
		tooltip_modelviewer_unlock_desc = "|cffffff00Click|cff00ff00 to move viewer",
		tooltip_modelviewer_unlocked = "Model Viewer is Unlocked",

		-- ErrorLogger ---------------------------------------------------------------------------------------------------
		static_caption = "|TInterface\\Addons\\" .. addonName .. "\\Skins\\zygorlogo:25:100|t\n \n",
		static_error =
		"Oh no! ZygorGuides have crashed!\n\nIt's strongly recommended to generate a bug report now, and copy and paste it manually onto the zygorguides.com forum.\n\nWould you like to generate the report?",

		-- Functions  ---------------------------------------------------------------------------------------------------
		cinematic_cancelled = "Cinematic auto-skipped.\n(You can change this in Zygor Settings).",
		cinematic_cancelled_short = "Cinematic auto-skipped.",

		-- Floating Toasts
		toasts_creature_new = "|c%s%s|r |c%s%s|r detected.",
		toasts_creature_owned = "|c%s%s|r |c%s%s|r detected.\n|cffc4c4c4You already own this |c%s%s|r.",

		-- Goal ---------------------------------------------------------------------------------------------------
		completion_count = "(%s)",
		completion_ding = "(%s%%)",
		completion_goal = "(%s/%s)",
		completion_level = "(%s%%%s)",
		completion_petding = "(%s%%)",
		completion_rep = "(%s)",
		coords = "%d,%d",
		goalshare_brand = "Zygor's Dungeon and Raid Tips:",
		grind_popup_text = "We add these to try to keep you at a good level to:\n |T" ..
			DIR ..
			"\\Skins\\white:8:8:0:-5:8:8:0:8:0:8:254:97:0|t    Be able to |cfffe6100accept new quests|cffffffff.\n |T" ..
			DIR ..
			"\\Skins\\white:8:8:0:-5:8:8:0:8:0:8:254:97:0|t    |cfffe6100Comfortably|cffffffff kill higher level enemies.\nYou can treat these as |cfffe6100optional|cffffffff and skip them, if you wish, but you may encounter difficulties later in the guide.\nIf that happens, grind at that point, or (if possible) run some dungeons to catch up with the guide.",
		grind_popup_title = "This is a |cfffe6100grind step|cffffffff.",
		map_coords = "%s %d,%d",
		players_garrison_1 = "%s's Outpost",
		players_garrison_2 = "%s's Fort",
		players_garrison_3 = "%s's Garrison",
		questtitle = "'%s'",
		questtitle_part = "'%s' (part %s)",



		-- Goldguide-Auctions ---------------------------------------------------------------------------------------------------
		--[[
		type_armor = C_Item.GetItemClassInfo(Enum.ItemClass.Armor),
		type_consumable = C_Item.GetItemClassInfo(Enum.ItemClass.Consumable) or "Consumable",
		type_trade_goods = C_Item.GetItemClassInfo(Enum.ItemClass.Tradegoods),
		type_weapon = C_Item.GetItemClassInfo(Enum.ItemClass.Weapon),
	--]]

		-- Goldguide-Core ---------------------------------------------------------------------------------------------------
		gold_auctions_error_noresults = "未找到有利可图的拍卖。",
		gold_crafting_error_noprofessions = "你没有学习任何制造专业。\n你需要学习炼金术、锻造、工程学、铭文学、\n珠宝加工、裁缝或制皮。",
		gold_crafting_error_noresults = "没有找到可盈利的制造物品。",
		gold_crafting_error_recipesnotcached = "没有找到你的专业配方。\n请打开专业技能窗口。",
		gold_farming_error_noitemtype = "未找到适合你等级的 %s 可采集物品。",
		gold_farming_error_noresults = "未找到适合你等级的可采集物品。",
		gold_gathering_error_all_noprofessions = "你没有学习任何采集专业。\n\n你需要学习剥皮、草药学、钓鱼或采矿。",
		gold_gathering_error_one_noresults = "未找到 %s 的可盈利采集路线。",
		gold_gathering_error_one_noskillin = "你没有学习 %s。",
		gold_gathering_error_one_noskillin_skills = "\n\n你的采集专业为：%s",
		gold_gathering_error_one_nothing = "未找到适合你当前专业的可盈利采集路线。\n\n你的采集专业为：%s",
		gold_gathering_error_prof = "%s (%d)",
		gold_gathering_no_results = "你不满足本部分的要求。\n你需要学习一个采集专业：剥皮、草药学和/或采矿。",
		gold_general_open_window1 = "\n如果你已经掌握，请打开该技能的专业窗口",
		gold_general_open_window2 = "\n如果你掌握更多，请打开相应的专业窗口",

		-- Goldguide-Help ---------------------------------------------------------------------------------------------------
		gold_12_header = "05 ) Browsing the guide list",
		gold_12_sum =
		"You can also view more details by hovering over any of the item in the list. This will show you all the farmable items and calculations used to rank each guide. Try it now, then click the Next button when you're ready to proceed.",
		gold_13_header = "05-2) Select a guide",
		gold_13_sum =
		"To select a guide you want to use click the orange guide picker button, or double click the entire row to load the guide. Go ahead and select a guide from the list now to continue.",
		gold_14_header = "6) Follow the guide instructions",
		gold_1_header = "01) Talk to an Auctioneer",
		gold_1_sum =
		"The first thing you need to do is scan the auction house so you have the latest pricing data. We've just set a waypoint for you, so follow the arrow to be taken to the nearest Auctioneer, then speak with them and select Sell tab to begin the scanning process.",
		gold_3_header = "03) Open the Gold Guide Menu",
		gold_3_sum = "You can bring up the Gold Guide menu by clicking this gold button here. Go ahead and try it now!",
		gold_4_header = "04 ) Browsing the guide list",
		gold_4_sum =
		"This section will show you all the items you can farm with several columns of information to help you choose the best one. Lets take a look at how to read each column:",
		gold_appraisebutton_header = "02) Scan the Auction House",
		gold_appraisebutton_sum =
		"If Quick Scan is not available at the moment (Scan button is grayed out), you can use Appraise function to update prices of all items listed inn Inventory tab.",
		gold_auc_add_header = "05-2) Select the item",
		gold_auc_add_sum =
		"To select the investment you want to use click the orange guide picker button, or double click the entire row to add the item to Auction Tools Shopping List. Go ahead and select an item from the list now to continue.",
		gold_auc_amt_header = "4c) Amount",
		gold_auc_amt_sum = "The Amount column shows how many items will you be buying.",
		gold_auc_browse_header = "05 ) Browsing the guide list",
		gold_auc_browse_sum =
		"You can also view more details by hovering over any of the item in the list. This will show you the details of all auctions you will need to buy out, and the profit you can make after selling items after each buyout step.",
		gold_auc_cost_header = "4d) Cost",
		gold_auc_cost_sum = "The Cost column shows how much gold will you be spending to buy out needed auctions.",
		gold_auc_filter_header = "4h) Filter",
		gold_auc_filter_sum = "You can control what type of items are shown in the list using the Filter drop down.",
		gold_auc_gain_header = "4f) Gain",
		gold_auc_gain_sum = "The Gain column shows percentage of profit you will make on that investment.",
		gold_auc_mode_header = "4g) Mode",
		gold_auc_mode_sum =
		"You can switch between three different modes of display: Easy, Advanced and Expert. In Easy Mode, only best investments are shown. Advanced mode shows all good investments. In expert mode, all investments that have a chance to turn profitable are displayed.",
		gold_auc_profit_header = "4e) Profit",
		gold_auc_profit_sum =
		"The Profit column shows how much profit will you make after selling bought out items using our suggested price.",
		gold_auc_status_header = "4b) Status",
		gold_auc_status_sum =
		"The Status column shows projected risk of this investment. \n |cff00ff00Green dot|cffffffff - Great investment.\n |cffffff00Yellow dot|cffffffff - Good investment.\n |cffff0000Red dot|cffffffff - Risky investment.\n",
		gold_auc_title_header = "4a) Item",
		gold_auc_title_sum = "The Item column shows which item you will be investing in.",
		gold_basic_1_header = "01) Always make sure your guide is up to date",
		gold_basic_1_sum =
		"Every realm (server) in World of Warcraft has a unique and ever changing economy. In order for Zygor's Gold and Auctions guide to work properly it needs to see how your servers market changes over time.  This information is gathered by Zygor outside of the game and is delivered to you via the Zygor Guides Client. Make sure you've configured your servers in the client options under WoW Gold Guide.",
		gold_basic_2_header = "02) Perform a fresh scan before using the guide",
		gold_basic_2_sum =
		"In addition to keeping your guides updated via the Zygor Guides Client you will also need to perform a fresh scan of your servers auction house to make sure you have current pricing information. To do this, simply talk to any Auctioneer in the game and Zygor's auto-scan feature should start scanning your server. You can also manually scan the server by pressing the Scan button on the Auction Tools.",
		gold_basic_3_header = "03) Select a gold making method",
		gold_basic_3_sum =
		"Once your guides are up to date and you've performed a recent scan you're ready to go. To access the Gold Guide go to the Guide Selection Menu and select Gold. This will bring up the Gold Guide Menu which has 5 different ways you can make gold. Under each method there will be a list of guides available to you displayed along with important data to help you choose the best guide. Click the Load guide button once you've made your decision.",
		gold_basic_4_header = "04) Complete the required gold making activities and profit!",
		gold_basic_4_sum =
		"Once the guide has loaded simply follow the instructions displayed on the Guide Viewer to begin making gold. Every guide will require you to perform different tasks like completing quests, or buying/farming/crafting items to sell on the Auction House, but in the end, permitting you've followed these instructions, you should make a profit.|n|nNote: Although Zygor's Gold and Auctions guide is pretty reliable and should make you money most of the time the WoW marketplace is an unpredictable place which means occasionally some items might expire before selling (especially using Expert mode or the more advanced methods). It's important to remain patient and remember that you might just need to relist your items to get them to sell. Also, all estimated values shown are based on the rates of a level 90 character.",
		gold_basic_5_header = "05) Go forth and build your wealth",
		gold_basic_5_sum =
		"Congratulations! You now know enough to begin using Zygor's Gold and Auctions guide. Click exit to go back to the tutorial index and begin learning how to use the various gold making methods and tools found in Zygor's Gold and Auctions guide.",
		gold_crafting_cost_header = "4c) Crafting cost",
		gold_crafting_cost_sum =
		"The Crafting cost column shows the lowest calculated cost of crafting this item using components bought on AH, and farmed when component is not buyable.",
		gold_crafting_mode_header = "4e) Mode",
		gold_crafting_mode_sum =
		"You can switch between two different modes of display: Easy and Expert. In Easy Mode, only items that you can craft right now, using components bought on Auction House are shown. Crafts that you do not know the recipe for are hidden, as well as any items with components not available on auction house. If you would like these items to be included you should use Expert Mode.",
		gold_crafting_profit_header = "4d) Profit",
		gold_crafting_profit_sum = "The Profit column displays estimated profit when created item is sold on AH.",
		gold_crafting_rows_header = "05 ) Browsing the guide list",
		gold_crafting_mode_sum =
		"You can switch between two different modes of display: Easy and Expert. In Easy Mode, only items that you can craft right now, using components bought on Auction House are shown. Crafts that you do not know the recipe for are hidden, as well as any items with components not available on auction house. If you would like these items to be included you should use Expert Mode.",
		gold_crafting_status_header = "4b) Status",
		gold_crafting_status_sum =
		"The Status column shows the status of selected craft. \n |cffffff00Yellow dot|cffffffff - You do not know the recipe to craft this item.\n |cffff0000Red dot|cffffffff - Not all components for this item are available at AH at this time.\n |cff00ff00Green dot|cffffffff - You know the recipe, and can buy all components on AH right now.\n",
		gold_crafting_title_header = "4a) Item name",
		gold_crafting_title_sum = "The Item name column shows which item you will be making.",
		gold_est_header = "4f) Estimated gold",
		gold_est_sum =
		"The Limit column shows an adjusted estimate of the gold that can be earned farming this item when demand is lower than the hourly drop rate. Generally, this is the max amount of the item you can safely farm before you risk flooding the market.",
		gold_farming_14_sum =
		"Now follow the instructions displayed on the Guide Viewer below. This will lead you to the best location in the game to farm the desired item/s. As you collect items the guide will show you the estimated amount of gold you are earning in real time. When you're done farming click the link at the bottom of the step to be taken to the nearest Auctioneer where you can use the built in Auction Tools to post your items.\n\nThis completes the Farming walkthrough.\n\nClick here to view the Auction Tools walkthrough.",
		gold_filter_header = "4h) Filter",
		gold_filter_sum = "You can control what type of items are shown in the list using the Filter drop down.",
		gold_gathering_14_sum =
		"Now follow the instructions displayed on the Guide Viewer below. This will lead you to the best location in the game to farm the desired item/s. As you collect items the guide will show you the estimated amount of gold you are earning in real time. When you're done farming click the link at the bottom of the step to be taken to the nearest Auctioneer where you can use the built in Auction Tools to post your items.\n\nThis completes the Gathering walkthrough.\n\nClick here to view the Auction Tools walkthrough.",
		gold_item_header = "4b) Item",
		gold_item_sum = "The Item column tells you the name of the item or items to be farmed in this guide.",
		gold_mode_header = "4g) Mode",
		gold_mode_sum =
		"You can switch between two different modes of display: Easy and Expert. In Easy Mode, all items with Low Demand will be hidden. Low Demand items can still be profitable, even most profitable, but might not sell as reliably or as quickly as higher Demand items. If you would like these items to be included you should use Expert Mode.",
		gold_no_header = "4a) No.",
		gold_no_sum =
		"The No. column shows you what number Zygor has ranked this item in terms of overall profitably. The items are listed in descending order with the most profitable items at the top.",
		gold_rate_header = "4d) Rate",
		gold_rate_sum =
		"The Gold column shows the estimated amount of gold that can be earned per hour when using this guide. This is determined by the multiplying the frequency of drops by the current market price of the items.\n\nNote: All values are based on the gathering rate of a level 90 character. ",
		gold_scanbutton_header = "02) Scan the Auction House",
		gold_scanbutton_sum =
		"If you disabled autoscanning, press Scan to update auction house data. When the scanning is complete click Next to continue.",
		gold_scantime_header = "02) Scan the Auction House",
		gold_scantime_sum =
		"This status of the scanning process will be shown at the bottom of the Auction Tools panel. Once the scan is complete it will show a timestamp allowing you to see when the last scan occured.",
		gold_time_header = "4e) Time",
		gold_time_sum = "The Time column shows estimated time you will spend running this guide.",
		gold_zone_header = "4c) Zone",
		gold_zone_sum = "The Zone column shows which area you will be visiting when using this guide.",

		-- Goldguide-View ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide = "你没有安装完整的金币指南。没有趋势数据可用。",
		gold_app_no_scan_data = "当前价格未知。请扫描拍卖行以收集数据。",
		gold_app_no_servertrends = "此服务器没有趋势数据。与拍卖师交谈并扫描以更新。",
		gold_app_old_scan_data = "与拍卖师交谈并扫描以更新。",
		gold_app_old_servertrends = "趋势数据已过期 (%s)。与拍卖师交谈并扫描以更新。",
		gold_clicktosort_asc = "点击排序： %s |cff44ff00(升序)",
		gold_clicktosort_desc = "点击排序： %s |cff44ff00(降序)",
		gold_expertmode_easylabel = "简单",
		gold_expertmode_easytooltip = "仅显示应快速售出的物品。",
		gold_expertmode_expertlabel = "专家",
		gold_expertmode_experttooltip = "显示快速和慢速售出的物品。\n你可能会有库存几天才能卖出。",
		gold_expertmode_generictooltip = "设置投资模式。",

		-- Guide ---------------------------------------------------------------------------------------------------
		guide_dungpop_tip = SHIFTCLICK .. " 屏蔽此地下城，不再建议。",
		guide_monkpop_tip = SHIFTCLICK .. " 屏蔽武僧日常任务，不再建议。",
		macro_acc = "账户标签",
		macro_both = "账户和角色标签",
		macro_char = "角色标签",
		macro_status_no = "未安装宏。",
		macro_status_yes = "宏已安装在 %s 下。",
		message_errorloading_brief = "|cffff4444错误|r 加载向导 |cffaaffaa%s|r",
		message_errorloading_critical = "|cffff4444严重错误|r 加载向导 |cffaaffaa%s|r\n错误: %s\n行: %d\n数据: %s",
		message_errorloading_full =
		"|cffff4444错误|r 加载向导 |cffaaffaa%s|r\n行: %s   步骤: %s\n代码:|cffffeeaa%s |cffff0000<=====|cffff8800 %s|r",
		notifcenter_dungeon_text = "加载地下城向导: %s%s|r",
		notifcenter_dungeon_title = "地下城向导",
		notifcenter_gen_popup_tooltip = "<<点击>> 重新打开此弹出窗口。",
		notifcenter_monk_text = "加载武僧向导: %s%s|r",
		notifcenter_monk_title = "武僧日常",
		notifcenter_mount_text = "坐骑训练可用",
		notifcenter_mount_title = "骑术训练",
		notifcenter_nextguide_text = "下一步推荐向导: %s%s|r",
		notifcenter_nextguide_title = "智能注入系统",
		notifcenter_previous_text = "是否返回到您之前使用的向导: %s",
		notifcenter_previous_title = "上一个向导",
		notifcenter_reload_text = "弹出窗口以重新加载向导",
		notifcenter_toast_dungeon = "此地下城有可用向导\n|cff861cb3%s|r",
		static_accept = "接受",
		static_badguide = "所选向导:\n|cffffee00%s|r\n 对于你的角色来说是 |cffffbbaaimproper|r\n|cffff6644%s|r\n\n你确定要加载它吗?",
		static_caption = "|TInterface\\Addons\\" .. addonName .. "\\Skins\\zygorlogo:25:100|t\n \n",
		static_loadguide = "是否加载以下向导:\n\n%s",
		static_loadmountguide = "你已经达到了获得 %s 骑术的等级。你想加载获取它的向导吗?",
		nc_loadmountguide = "%s 骑术可用。",
		static_nextguide = "你现在可以继续:\n\n%s",
		static_nextguide2 = "你现在可以继续:\n",
		static_nextguide_turnins = "让我先交任务",
		static_pandareload = "你想重新加载\n以查看所有向导吗?",

		pandariaremix_not_tuned =
		"这是该向导的正式版。MoP Remix 引入了可能影响该向导的更改。我们已将其提供给 Remix 用户，但你可能会遇到问题。我们的团队正在根据需要更新所有向导。\n点击确认",

		-- GuideMenu ---------------------------------------------------------------------------------------------------
		guidebeta = " (BETA)",
		guidedev = " |cffff0000(DEV)|r",
		guidedevpart = " |cffff0000(DEV parts)|r",
		guidehardcore = " |cfffe6100(Hardcore)|r",
		guidemenu_guidetooltips_loadguide = "Load Guide",
		guidemenu_guidetooltips_showquests = "Show guides for this quest",
		guidemenu_section_favourites = "收藏",
		guidemenu_section_recent = "最近",
		guidemenu_section_search = "搜索",
		guidemenu_section_search_results = "Search: %d results",
		guidemenu_section_search_titleresults = "Search '%s': %d result%s",
		guidemenu_section_search_noresults = "|cffA8A5A5Couldn't find what you were looking for?",
		guidemenu_section_search_request = "Request a guide for \"|c%s%s|r\"",
		guidemenu_section_search_submitted = "Guide request submitted.",
		guidemenu_section_search_submitted_chat = "Request submission saved for upload.",
		guidemenu_section_suggested = "建议",
		guidemenu_missing_message = "Zygor Elite guide.|nNot in trial.",

		-- GuideMenu-View ---------------------------------------------------------------------------------------------------
		guidemenu_guidetooltips_favourite = "收藏",
		guidemenu_guidetooltips_loadguide = "加载向导",
		guidemenu_missing_guide = "该向导丢失或您正在使用试用版",
		opt_gmcolorcode = "为图标加色以显示向导的难度/状态",
		opt_gmusecheck = "使用已完成向导的勾选图标。",
		opt_gmhidecompleted = "隐藏已完成和超出等级的向导。",
		opt_gmnumrecent = "显示的最近向导数量：",
		opt_gmstarsuggested = "为推荐向导使用星形图标",
		opt_gmsuggesttypes = "推荐以下类型的向导：",
		opt_gmsuggestleveling = "升级",
		opt_gmsuggestdungeons = "地下城",
		opt_gmsuggestdailies = "日常任务",
		opt_gmsuggestevents = "事件",
		opt_gmsuggestprofessions = "专业技能",
		opt_gmsuggestpets = "宠物/坐骑",
		opt_gmsuggestreputations = "声望",
		opt_gmsuggesttitles = "头衔",
		opt_gmsuggestachievements = "成就",
		guidemenu_missing_popup = "Zygor 精英向导|n不包含在试用版中。",

		-- InventoryManager ---------------------------------------------------------------------------------------------------
		notifcenter_inventory_manager_title = "库存管理器",
		im_ar_repairamount = "修理所有物品花费了 ",
		im_ar_guild = " 使用了公会银行的资金。",
		im_ar_cannotar = "无法自动修理。资金不足。",
		im_ar_cannotar2 = "无法自动修理。资金或公会银行资金不足。",
		im_ar_noguildrepairs = "无法自动修理。资金不足且你的公会权限不允许使用公会银行修理。",

		-- InventoryManager-ReminderPopup ---------------------------------------------------------------------------------------------------
		--notifcenter_inventory_manager_title

		-- Item-GearFinder ---------------------------------------------------------------------------------------------------
		frame_selectguide = "添加新向导标签",
		frame_selectguide_left = "<<左键单击>>: 打开向导选择窗口。",

		-- Item-Quest ---------------------------------------------------------------------------------------------------
		itemscore_questitem1 = "你想要装备",
		itemscore_questitem2 = "用于当前任务吗?",
		itemscore_questitem3 = "因为任务物品不再需要了吗?",
		notifcenter_gear_title = "装备升级已装备",
		--notifcenter_gen_popup_tooltip
		notifcenter_quest_text = "任务物品需要操作",

		-- Item-Upgrades ---------------------------------------------------------------------------------------------------
		itemscore_ae_accept = "装备",
		itemscore_ae_decline = "拒绝",
		itemscore_ae_equip = "装备了 %s",
		itemscore_ae_equip1 = " 你有新的升级物品：",
		itemscore_ae_equip2 = " 你有新的升级物品：",
		itemscore_ae_over = " 比 %s 更好",
		itemscore_ae_report_tip = SHIFTCLICK .. " 生成报告\n如果你认为该建议有误。",
		itemscore_ae_replaces = "替换",
		notifcenter_gear_equipped = "%s 装备到了 |cffffff00%s|r 槽位",
		notifcenter_gear_text = "新升级可用",
		notifcenter_gear_pop_one = "你有新的升级物品可用",
		notifcenter_gear_pop_many = "你有 %d 个升级物品可用",
		notifcenter_gear_pop_review = "点击查看。",
		notifcenter_gear_bags_one = "你有新的升级物品可用",
		notifcenter_gear_bags_many = "你有 %d 个新升级物品可用",
		notifcenter_gear_bags_review = "点击在背包中查看。",

		--notifcenter_gear_title
		--notifcenter_gen_popup_tooltip
		--zgname
		itemscore_alts_accept = "提醒我",
		itemscore_alts_decline = "忽略",
		itemscore_alts_itemfound = "为你的其他角色找到了升级物品：\n",


		-- Loot ---------------------------------------------------------------------------------------------------
		loot_autobuyframetext = "%s|n|n总费用 = %s|n这些物品是当前指南所需的。",
		loot_autobuynoroom = "没有足够的空间存放 %d 堆叠。",
		loot_autobuynostock = "%s x |cffffdd00%d|r 目前不可用。",
		loot_autobuynotavail = "|cffffee66 %s 此供应商处不可用或已售罄。",
		loot_autobuynotmoney = "%s 不使用金币购买。请自行购买。",
		loot_autobuypoor = "你没有足够的钱购买所有物品。需要 |cffffdd00%s|r。",
		loot_greyframe_maintext = "灰色物品的总价值",
		loot_sellgreybutton = "出售灰色物品",
		loot_sellgreys_sold = "已售出 %s x |cffffdd00%d|r 获得 |cffffdd00%s|r",
		loot_sellgreys_total = "总收入: %s",
		--notifcenter_gen_popup_tooltip
		notifcenter_loot_text = "Zygor 购物清单",

		-- MacroGuide ---------------------------------------------------------------------------------------------------
		macro_error_bars_full = "动作栏已满，请腾出一些空间。",
		macro_error_combat = "你正在战斗中，无法创建宏。",
		macro_error_overflow = "宏数量过多，请删除一些后重试。",
		macro_tooltip = COLOR_TIP_MOUSE .. "拖动|r 将其放到动作栏上|n" .. COLOR_TIP_MOUSE .. "点击|r 进行测试",

		-- MapCoords ---------------------------------------------------------------------------------------------------
		menu_map_poidisable = "禁用兴趣点系统",
		menu_map_poidisable_desc = "禁用在地图和小地图上查看兴趣点的功能。",
		menu_map_poienabled = "显示兴趣点",
		menu_map_poienabled_desc = "启用在地图和小地图上查看兴趣点的功能。",
		menu_map_poioptions = "显示兴趣点选项",
		menu_map_poishow = "兴趣点类型:",
		menu_map_poishow_achievement = "成就",
		menu_map_poishow_battlepet = "战斗宠物",
		menu_map_poishow_rare = "稀有刷新",
		menu_map_poishow_treasure = "宝藏",
		menu_map_poitype = "兴趣点显示模式:",
		menu_map_poitype_complete = "完美主义模式",
		menu_map_poitype_desc = "根据难以到达的程度过滤地图上的兴趣点。\n\n快速访问将仅显示可以快速轻松到达的兴趣点，而完美主义模式将显示所有兴趣点。",
		menu_map_poitype_quick = "快速访问",

		-- NotificationCenter ---------------------------------------------------------------------------------------------------
		notifcenter_no_entries = "你没有任何通知。",
		notifcenter_reset = "移除所有通知。",
		notifcenter_warning_notarget = "无目标。",
		notifcenter_warning_noskill = "所需技能不可用。",


		-- Parser ---------------------------------------------------------------------------------------------------
		coords = "%d,%d",

		-- PetBattle ---------------------------------------------------------------------------------------------------
		petframe_button = "|cffffff00Click|cff00ff00 to load the guide for the '|cffffff00%s|cff00ff00' pet.",
		static_caption = "|TInterface\\Addons\\" .. addonName .. "\\Skins\\zygorlogo:25:100|t\n \n",

		-- POI -------------------------------------------------------------------------------------------------------
		poi_load = "|cffffaa00Click to open guide|r",

		-- Pointer ---------------------------------------------------------------------------------------------------
		dist_km = "%.1f 千米",
		dist_m = "%d 米",
		dist_yd = "%d 码",
		pointer_arrow_itemcooldown = "等待 |cffaaff00%s|r  |cffffaa00%s|r 冷却完成",
		pointer_arrow_itemuse = "使用 |cffffaa00%s|r",
		pointer_arrow_noflightdata = "|cff88bbff(飞行点连接未知，正在尝试最佳路线。)|r",
		pointer_arrowmenu_arrowheader = "箭头选项",
		pointer_arrowmenu_findnearest = "追踪",
		pointer_arrowmenu_forcecomfort = "切换到舒适路线",
		pointer_arrowmenu_forcespeed = "切换到快速路线",

		pointer_arrowmenu_relaxed = "偏好轻松路线",
		pointer_arrowmenu_relaxed_desc = "优先选择用户交互较少的旅行方式，而非需要主动控制角色的方式。关闭此选项时，将不惜一切代价优先追求速度。",

		pointer_arrowmenu_freeze = "设为非互动模式",
		pointer_arrowmenu_freeze_desc = "你需要在 Zygor 选项界面的“导航”下，将其重新设置为互动模式。",
		pointer_arrowmenu_hide = "禁用箭头",
		pointer_arrowmenu_hide_desc = "你需要在 Zygor 选项界面的“导航”下重新启用它。",
		pointer_arrowmenu_options = "更多选项...",
		pointer_arrowmenu_removeway = "清除路径点",
		pointer_arrowmenu_reset = "重置路线设置",
		pointer_arrowmenu_route_destination = "%s %d,%d",
		pointer_arrowmenu_route_destination_guide = "(指南步骤路径点)",
		pointer_arrowmenu_route_destination_manual = "(自定义路径点)",
		pointer_arrowmenu_route_destinationtitle = "当前目的地:",
		pointer_arrowmenu_route_disable = "禁用旅行路线",
		pointer_arrowmenu_route_disable_desc = "使用直线路径指引。",
		pointer_arrowmenu_route_enable = "寻找最短旅行路线",
		pointer_arrowmenu_route_enable_desc = "自动寻找到达目的地的最短路线。",
		pointer_arrowmenu_route_est = "|cffccddee预计时间: |r%d:%02d",
		pointer_arrowmenu_route_node1 = "|cff8899aa%d. |cfff8fdff%s",
		pointer_arrowmenu_route_node = "|cff8899aa%d. |cffaabbcc%s",
		pointer_arrowmenu_route_retry = "重新检查路线",
		pointer_arrowmenu_route_retry_desc = "确保这是当前的最佳路线。",
		pointer_arrowmenu_route_stitle = "此路线的选项",
		pointer_arrowmenu_route_travelroutetitle = "旅行系统路线:",
		pointer_arrowmenu_scale = "缩放",
		pointer_arrowmenu_settings = "设置",
		pointer_arrowmenu_use_hearth = "使用炉石",
		pointer_arrowmenu_use_item_teleports = "使用传送物品",
		pointer_arrowmenu_use_mage_teleport = "使用传送法术",
		pointer_arrowmenu_report = "|cffff4330?   |cffffffff报告错误路线",
		pointer_arrowmenu_report2 = "报告错误路线",
		pointer_arrowmenu_report_desc = "如果您认为此路线不正确，请打开反馈菜单发送报告。",
		pointer_missing_taxi_data = "|cffeeeecc\n缺少飞行数据。打开飞行管理员的地图以获取更好的指引。",
		pointer_close_map = "(关闭地图)",
		pointer_corpselabel = "尸体",
		pointer_floors_default = "(在另一层)",

		pointer_preview_hide = "点击隐藏地图预览",
		pointer_preview_show = "点击显示地图预览",
		pointer_reequip_item = "为你装备了 %s。",
		waypoint_step = "步骤 %s",
		waypoint_tip_clearmanual = "<<Shift-click>>: 移除用户路径点",
		waypoint_tip_distance = "距离: %s",

		-- QuestAutoAccept ---------------------------------------------------------------------------------------------------
		autocomplete_turnin = "交付任务。",
		autocomplete_turnin_fail = "不会自动选择奖励。",

		-- QuestDB ---------------------------------------------------------------------------------------------------
		questframe_button = "|cffffff00点击|cff00ff00以查找任务 '|cffffff00%s|cff00ff00' 的指南。",
		sis_complete = " |cfffe6100SIS:|cffffffff 跳过已完成的步骤",
		sis_dialog_button_catchup_best = "找到指南中的最佳起点，并带我完成任何需要的前置任务。",
		sis_dialog_button_catchup_cancel = "取消当前任务追赶。",
		sis_dialog_button_catchup_curent = "仅带我完成当前指南需要的前置任务。",
		sis_dialog_button_cleanup = "放弃任何不再需要的升级任务。",
		sis_dialog_header = "智能注入系统",
		sis_dialog_subheader_catchup = "任务追赶",
		sis_dialog_subheader_cleanup = "任务清理",
		sis_irrelevant = " |cfffe6100SIS:|cffffffff 跳过无关步骤",
		sis_level = " |cfffe6100SIS:|cffffffff 完成所需的步骤目标",
		sis_progress = " |cfffe6100SIS:|cffffffff 完成正在进行的任务",
		sis_required = " |cfffe6100SIS:|cffffffff 必需的前置任务",
		sis_skipping = " |cfffe6100SIS:|cffffffff 跳过不需要的任务",
		sis_start = " |cfffe6100SIS:|cffffffff 建议的起点",

		-- QuestTracking ---------------------------------------------------------------------------------------------------
		static_abandonquests = "这些任务不会在当前指南中继续:\n\n%s\n你可以安全地在任务日志中放弃它们。",
		static_abandonquests_butabandon = "全部放弃",
		static_abandonquests_butignore = "忽略",
		static_abandonquests_none = "你的所有任务都是日常任务或当前指南有效任务。\n没有需要放弃的任务。",

		-- Scan ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide_tooltip = "你没有安装完整的金币指南。没有趋势数据可用。",
		gold_app_no_scan_data_tooltip = "当前价格未知。请扫描拍卖行以收集数据。",
		gold_app_no_servertrends_tooltip = "没有此服务器的趋势数据。与拍卖行拍卖师对话并扫描以更新。",
		gold_app_old_scan_data_tooltip = "与拍卖行拍卖师对话并扫描以更新。",
		gold_app_old_servertrends_tooltip = "趋势数据已过期 (%s)。与拍卖行拍卖师对话并扫描以更新。",
		gold_app_trend_tooltip = "趋势数据由拍卖行扫描生成。每日扫描可提高数据质量。",

		-- Skills ---------------------------------------------------------------------------------------------------
		notifcenter_skill_text = "%s 技能可用。",
		skills_more = "还有更多...",
		skills_mode_count = "还有 +%d 个",
		skills_new = "你有新的职业技能可用：",
		skills_nothing = "你没有新的职业技能可用。",
		skills_trainer = "寻找训练师",
		skills_trainer_pet = "寻找宠物训练师",
		skills_essential = "必要",
		skills_optional = "可选",
		skills_future = "未来",
		skills_hide = "- 隐藏额外技能",


		-- Notifications ---------------------------------------------------------------------------------------------------
		nc_toggleviewer = "切换指南窗口",
		nc_reset = "清除所有通知",
		nc_settings = "配置",
		notifcenter_generic_title = "其他",
		static_accept = "接受",
		static_decline = "拒绝",
		static_minimize_tip = "发送到通知中心。",
		static_settings_tip = "配置设置",

		-- Step ---------------------------------------------------------------------------------------------------
		goalshare_brand = "Zygor 的副本和团队提示：",

		-- Sync ---------------------------------------------------------------------------------------------------
		share_button_reinvite = "Reinvite",
		share_button_stop = "Stop",
		share_invite_master = "Do you want to start sharing the guide:|n|n|cffffee88%s|r|n|nwith your party?|n|n%s",
		share_invite_master_party_manyzygors =
		"Note: only %s in your party are using Zygor Guides and will be able to use your shared guide.",
		share_invite_master_party_onezygor =
		"Note: only %s in your party is using Zygor Guides and will be able to use your shared guide.",
		share_invite_master_stop_or_reinvite = "Do you want to reinvite %s,\n\nor to stop sharing your guide?",
		share_invite_master_stop_or_reinvite_with =
		"Do you want to reinvite %s,\n\nor to stop sharing your guide with %s?",
		share_invite_received =
		"|cffffff88%s|r would like to share the following guide with you:|n|n|cffffff88%s|r|n|nBy accepting, a new tab will open in which steps from this guide will be shared with you.",
		share_invite_slaveinitiated =
		"|cffffff88%s|r is sharing the following guide:|n|n|cffffff88%s|r|n|nDo you want to join?|n|nBy accepting, a new tab will open in which steps from this guide will be shared with you.",
		share_nowarnagain = "Don't warn me again.",
		share_party_and = " and ",
		share_party_comma = ", ",
		share_party_none = "none",
		share_tooltip_currentslaves = "|cffaaaaaaCurrent users: %s",
		share_tooltip_noparty = "|cffff4400(you're not in a party now.)|r",
		share_tooltip_nozygor = "|cffff4400(no-one else in your party is using Zygor Guides.)|r",
		share_tooltip_startmaster = "<<Click>>: share your guide with party members",
		share_tooltip_startslave = "<<Click>>: join a guide shared by |cffddff00%s|r",
		share_tooltip_stopmaster = "<<Click>>: stop sharing your guide",
		share_tooltip_stopmaster_or_reinvite = "<<Click>>: manage your sharing mode",
		share_tooltip_stopslave = "<<Click>>: stop using |cffddff00%s|r's shared guide",
		share_tooltip_title = "Guide Sharing",
		sync_ahead = "|cff88ff88%s: Ahead (%d)|r", -- name, count
		sync_behind = "|cffff8888%s: Behind (%d)|r", -- name, count

		-- Tabs ---------------------------------------------------------------------------------------------------
		frame_selectguide = "Add new guide tab",
		frame_selectguide_left = "<<Left-click>>: open the guide selection window.",
		tabs_guide_new = "点击 to open guide in new tab",
		tabs_guide_switch = "点击 to switch to tab with this guide",
		tabsmenu_new_guide = "Open a new guide",
		tabsmenu_suggested = "Suggested guides:",
		tabsmenu_recent = "Recent guides:",

		-- Tutorial ---------------------------------------------------------------------------------------------------
		guidetutorial_backbutton = "Back",
		guidetutorial_donebutton = "Done",
		guidetutorial_exit = "Exit",
		guidetutorial_next = "Next",
		guidetutorial_progresstip2 = "This will track your progress by how many steps there are in a guide.",
		guidetutorial_progresstip3 =
		"This will track your progress by how close you are to out-leveling the currently loaded guide and being told you can move on to the next guide.",
		guidetutorial_progresstiplevel = "Track By Level",
		guidetutorial_progresstipstep = "Track By Step",

		-- ViewerFrame ---------------------------------------------------------------------------------------------------
		frame_guide_complete = "恭喜！",
		frame_guide_progress = "指南进度: %d%%",

		frame_guide_step = "Step: %d/%d",
		frame_guide_stepscompleted = "Steps Completed: %d/%d",
		frame_guide_stepsprogress = "指南进度: %d%%",

		frame_guide_quests = "Quests: %d/%d",
		frame_guide_questscompleted = "Quests Completed: %d/%d",
		frame_guide_questsprogress = "指南进度: %d%%",

		frame_guide_exp = "经验: %d/%d",
		frame_guide_expcompleted = "经验: %d/%d",
		frame_guide_expprogress = "等级进度: %d%%",

		frame_helpbutton = "帮助",
		frame_helpbutton_desc = "<<Click>> 运行教程。",
		frame_minright = "<<Right-click>> 转到步骤",
		frame_reportbutton = "BUG提交",
		frame_reportbutton_desc = "<<Click>> 生成详细的错误或建议报告。",
		frame_settings = "选项",
		frame_settings1 = "<<Click>>: 设置选项",
		frame_settings2 = "<<Right-click>> 进入配置",
		frame_SISButton = "Smart Injection System",
		frame_stepnav_next = "下一步",
		frame_stepnav_next_click = "<<Click>>: 跳过",
		frame_stepnav_next_right = "<<Right-click>>: 快进到下一个未完成的步骤",
		frame_stepnav_nextquest = "下一步任务 %s",
		frame_stepnav_nextquest_click = "<<Click>>: 跳转到此任务的下一步",
		frame_stepnav_nextquest_right = "<<Right-click>>: 快进到此任务的下一个未完成的步骤",
		frame_stepnav_prev = "上一步",
		frame_stepnav_prev_click = "<<Click>>: 退一步",
		frame_stepnav_prev_ctrl = "<<Ctrl-click>>: 返回向导起点",
		frame_stepnav_prev_right = "<<Right-click>>: 倒退到最后一个未完成的步骤",
		menu_EnableTransparency = "启用透明度",
		menu_GuideMenu = "菜单",
		menu_Startup = "开启入门教程",
		menu_LockViewer = "锁定指示器",
		menu_QuestCleanup = "任务清理",
		menu_Reload = "重载",
		menu_Reset = "重置窗口",
		menu_Settings = "设置",
		menu_TravelLines = "显示旅行路线",
		menu_ShowSkills = "显示技能推荐",
		pointer_arrowmenu_findnearest = "追踪",
		step_level = "|cffaaccaaLevel: |cffcceecc%s|cffaaccaa|r ",
		step_num = "|cffaaaaaa%s|cff888888.|r ",
		stepbeta = "(Beta content)",
		stepdev = "(Dev content)",
		stepcollapsed = "(step collapsed)",
		stepreq = "(Only %s)",
		stepreqnot = "not %s",
		stepreqor = " or ",
		viewer_special_loading = "加载中...",
		viewer_special_select = "欢迎来到 Zygor Guides.\n|cfffe6100点击这里|r 来加载一个向导。",
		viewer_special_rate = "你已到达指南的末尾。 How would you rate the |c%s%s|r guide?",
		viewer_special_rateexp = "Please tell us your thoughts on this guide.",
		viewer_special_cancel = "取消",
		viewer_special_popup = "Please rate the |c%s%s|r guide.",
		viewer_special_rate_next = "你已到达指南的末尾。\n|cfffe6100点击|r to load the |c%s%s|r guide.",
		viewer_special_rate_menu = "你已到达指南的末尾。\n|cfffe6100点击这里|r to load a guide.",
		viewer_special_scorecheck = "Please rate the guide before submitting feedback",
		viewer_special_badscore = "|cfffe6100Please tell us how we could improve this guide.",
		viewer_special_toggle = "Don't show this dialog again",
		viewer_special_senttopopup = "你已到达指南的末尾。\nStep content sent to popup.",
		viewer_special_cancelled_rate = "你已到达指南的末尾。\n\n|cfffe6100点击这里|r to rate this guide.",
		viewer_special_cancelled_next = "|cfffe6100点击这里|r to load the next suggested guide ( |c%s%s|r ).",
		viewer_special_cancelled_menu = "|cfffe6100点击|r to load a guide.",
		viewer_special_endguide = "你已到达指南的末尾。",
		viewer_special_selectfirst = "Please select a rating first.",
		viewer_special_amazing = "Good",
		viewer_special_average = "Okay",
		viewer_special_bad = "Bad",

		-- Whowhere
		whowhere_walks = "(walks around this area)",

		-- WorldQuests ---------------------------------------------------------------------------------------------------
		tabs_world_quest_new = "点击此处打开该世界任务的指南",
		wqp_col_FACTION = "FACTION",
		wqp_col_NAME = "NAME",
		wqp_col_REWARDS = "REWARDS",
		wqp_col_TIME = "TIME",
		wqp_col_ZONE = "ZONE",
		wqp_filter_Faction = "Faction",
		wqp_filter_Reward = "Reward",
		wqp_filter_Type = "Type",
		wqp_no_guide = "A guide for this World Quest\nhas not been added yet.",
		wqp_only_selected = "Show only selected",
		wqp_quests_selected = "%d Quests Selected",
		wqp_showing_queue = "No quests in this zone. Showing your queue.",
		wqp_start_queue = "Start queued quests",

		-- ZygorGuidesViewer ---------------------------------------------------------------------------------------------------
		binding_next = "下一步",
		binding_prev = "上一步",
		binding_togglewindow = "显示指示器窗口",
		binding_waypoint_next = "Cycle multiple waypoints",
		binding_waypoint_prev = "Cycle multiple waypoints backwards",
		dialog_endguide = "You've reached the end of the current guide.",
		dialog_nextguide =
		"You've reached the end of the current guide.\n\nThe next guide is:\n|cffff8800%s|r\n\nWould you like to proceed?",
		dialog_endtrial = "You've reached the end of the trial.",
		guide_notloaded = "|cff0000ff- none loaded -",
		guide_notselected = "- 选择一个向导 -",
		guidepicker_achievements = "成就",
		guidepicker_dalies = "日常",
		guidepicker_dungeon = "地下城",
		guidepicker_events = "事件",
		guidepicker_gear = "装备",
		guidepicker_gold = "金币",
		guidepicker_leveling = "升级",
		guidepicker_loremaster = "博学大师",
		guidepicker_macros = "宏",
		guidepicker_pets = "宠物与座骑",
		guidepicker_professions = "专业",
		guidepicker_recent = "最近：",
		guidepicker_reps = "声望",
		guidepicker_searchresults = "搜索结果：",
		guidepicker_suggested = "建议的向导",
		guidepicker_titles = "头衔",
		loading_guides = "|c888888ff(加载向导： %d%%)",
		menu_last_entry = "%s |cffaaaaaastep|r %d",
		message_errorloading_brief = "|cffff4444Error|r loading guide |cffaaffaa%s|r",
		message_errorloading_full =
		"|cffff4444Error|r loading guide |cffaaffaa%s|r\nline: %s   step: %s\ncode:|cffffeeaa%s |cffff0000<=====|cffff8800 %s|r",
		message_loadedguide = "激活向导 |cffaaffaa%s|r",
		message_missingguide = "|cffff4444Missing|r guide: |cffaaffaa%s|r",
		qmenu_border_restore = "Switch to full mode",
		qmenu_border_restore_desc = "Switch to \"Full Mode\", showing guide window controls.",
		qmenu_close = "- 取消 -",
		qmenu_goal = "目标: %s",
		qmenu_goal_complete = "标记完成",
		qmenu_goal_complete_desc = "点击将此目标标记为完成（或未完成）。|n|cff998800如果插件无法正确检测完成状态，请使用此功能。",
		qmenu_goal_creature = "View creature",
		qmenu_goal_creature_data = "View creature: %s",
		qmenu_goal_creature_desc = "See how '%s' looks like.",
		qmenu_goal_waypoint = "路径: %s, %.1f;%.1f",
		qmenu_goal_waypoint_desc = "点击以将航点设置到这些坐标。",
		qmenu_quest = "任务: %s",
		qmenu_quest_complete = "完成",
		qmenu_quest_complete_desc = "点击将此任务标记为未完成。此状态将在你下线之前记住，或者服务器发送更新后的完成列表时更新。",
		qmenu_quest_complete_in_desc = "手动将此任务标记为完成。此状态将在你下线之前记住，或者服务器发送更新后的完成列表时更新。",
		qmenu_quest_complete_in_tip = "这个任务未完成。",
		qmenu_quest_complete_tip = "任务已完成",
		qmenu_quest_info = "显示任务链",
		qmenu_quest_info_desc =
		"Display quest chain information and the level to which this quest belongs.|n|cffaaaaaaShift-click|cff998800 to view in text-copy mode.",
		qmenu_quest_lightheaded = "View quest in LightHeaded",
		qmenu_quest_lightheaded_desc =
		"View detailed quest information in the LightHeaded addon.|n|cffaaaaaaShift-click|cff998800 to view in text-copy mode.",
		qmenu_quest_openlog = "打开任务日志",
		qmenu_quest_openlog_desc = "在任务日志中打开任务描述。",
		qmenu_quest_openmap = "在地图上显示任务",
		qmenu_quest_openmap_desc = "在地图上显示任务的位置。",
		qmenu_quest_watched = "Watch quest",
		qmenu_quest_watched_desc = "切换使用内置任务目标追踪器来监视此任务。",
		qmenu_share_allgrouproles = "分享本步骤的提示",
		qmenu_shareto = "分享提示到：",
		qmenu_shareto_party = "/party",
		qmenu_shareto_raid = "/raid",
		qmenu_shareto_say = "/say",
		qmenu_step = "步骤 %s (等级 %s)",
		qmenu_step_skip = "跳过",
		qmenu_step_skip_desc = "假设此步骤已完成，则跳至下一步。",
		static_badguide =
		"The selected guide:\n|cffffee00%s|r\n is |cffffbbaaimproper|r for your character.\n|cffff6644%s|r\n\nDo you really want to load it?",
		static_caption = "|TInterface\\Addons\\" .. addonName .. "\\Skins\\zygorlogo:25:100|t\n \n",
		static_help = "Help and tutorial system|ncoming soon.",
		static_sis =
		"|cffffff88Smart Injection System|r|n|nThis feature will attempt to find the best spot in the guides for you to start.|nIt will reset your dynamic progress settings, load the starting guide for level 1 of your race/class, and start skipping forward until it finds quests worth completing.|n|nIf your character is high-level, you'll mostly see the guide zip past |cff88ff88green|r (completed) or |cff88aaffblue|r (low-level) steps.|n|nIf it stops at a seemingly low-level quest, it's usually a good idea to trust the guide and complete the quest, as it might start a long chain reaching to your level.|n|nIt might stop at flight path pickups, it's up to you to verify if they're really unknown to your character.|n|nSo... Ready for the ride?",
		welcome_guides = "%d 向导已加载",
		tooltip_waypoint = COLOR_TIP_MOUSE .. "点击|r" .. COLOR_TIP .. " 设置路径: |cffffaa00%s|r",
		tooltip_waypoint_coords = "Location: |cffffaa00%s|r",

		-- ZygorMapIcon ---------------------------------------------------------------------------------------------------
		minimap_tooltip = COLOR_TIP_MOUSE ..
			"(Left-Click)|r Notifications|n" .. COLOR_TIP_MOUSE .. "(Right-Click)|r Toggle Viewer",
		minimap_tooltip_ex1 = COLOR_TIP_MOUSE .. "Ctrl+Alt+Right-click|r to start profiling|n",
		minimap_tooltip_ex2 = COLOR_TIP_MOUSE .. "Ctrl+Alt+Right-click|r to stop profiling|n",


		-- Home screen widgets ---------------------------------------------------------------------------------------------------
		widgets_menu_configon = "进入配置模式",
		widgets_menu_configoff = "退出配置模式",
		widgets_menu_remove = "移除所有主屏幕小部件",
		widgets_menu_removefree = "移除所有游戏小部件",
		widgets_menu_lockfree = "锁定游戏小部件",
		widgets_menu_unlockfree = "解锁游戏小部件",
		widgets_menu_exitadd = "取消",

		widget_uncapped = "无限制",
		widget_capped_general = "%s/%s",
		widget_capped_weekly = "每周 %s/%s",

		widget_renown_name = "盟约声望",
		widget_renown_description = "显示当前和最大声望等级",
		widget_renown_header = "盟约声望：",
		widget_renown_format = "%s/%s",

		widget_valor_name = "勇气点",
		widget_valor_description = "显示当前和最大勇气点",
		widget_valor_header = "勇气点：",
		widget_valor_format = "%s/%s",

		widget_conquest_name = "征服点",
		widget_conquest_description = "显示当前和最大征服点",
		widget_conquest_header = "征服点：",
		widget_conquest_format = "%s/%s",

		widget_dailyreset_name = "每日重置",
		widget_dailyreset_description = "显示每日重置时间",
		widget_dailyreset_header = "每日重置在：",

		widget_weeklyreset_name = "每周重置",
		widget_weeklyreset_description = "显示每周重置时间",
		widget_weeklyreset_header = "每周重置在：",

		widget_mythicplus_name = "史诗+副本词缀",
		widget_mythicplus_description = "显示当前的史诗+副本词缀",
		widget_mythicplus_header = "史诗+副本词缀：",

		widget_callings_name = "盟约召唤",
		widget_callings_description = "显示当前的盟约召唤",
		widget_callings_header = "盟约召唤：",
		widget_callings_empty = "没有活动的召唤。",

		widget_worldevents_name = "世界事件",
		widget_worldevents_description = "显示正在进行的世界事件",
		widget_worldevents_header = "世界事件：",
		widget_worldevents_empty = "没有正在进行的世界事件。",

		widget_token_name = "魔兽世界代币价格",
		widget_token_description = "显示当前魔兽世界代币价格和过去3个月的变化。",
		widget_token_header = "魔兽世界代币价格：",
		widget_token_popup_current = "当前价格：%s",
		widget_token_popup_low = "最低价格：%s",
		widget_token_popup_high = "最高价格：%s",
		widget_token_popup_history = "价格历史（90天）",

		widget_worldbosses_name = "世界首领",
		widget_worldbosses_description = "显示活动的世界首领",
		widget_worldbosses_header = "世界首领：",
		widget_worldbosses_empty = "没有活动的世界首领。",

		widget_assaults_name = "盟约攻城战",
		widget_assaults_description = "显示活动的盟约攻城战",
		widget_assaults_header = "盟约攻城战",
		widget_assaults_empty = "没有活动的攻城战",
		widget_assaults_locked = "你还没有解锁攻城战",
		widget_assaults_complete = "%s 攻城战完成",
		widget_assaults_next = "下一个攻城战在 %s",
		widget_assaults_remains = "%s 剩余",

		widget_guidesuggest_name = "推荐指南",
		widget_guidesuggest_description = "显示为你推荐的指南。",
		widget_guidesuggest_header = "推荐指南",
		widget_guidesuggest_empty = "没有推荐指南",

		widget_guidehistory_name = "指南历史",
		widget_guidehistory_description = "显示最近使用的5个指南",
		widget_guidehistory_header = "指南历史",
		widget_guidehistory_empty = "指南历史为空",

		widget_timeplayed_name = "等级追踪器",
		widget_timeplayed_description = "显示每个等级的游戏时间",
		widget_timeplayed_header = "等级追踪器",
		widget_timeplayed_line = "|cffaaaaaa等级 %s：|r %s",
		widget_timeplayed_unknown = "|cffaaaaaa等级 %s：|r 未知",
		widget_timeplayed_notyet = "|cffaaaaaa等级 %s：|r",
		widget_timeplayed_total = "|cffaaaaaa总计到等级 %s：|r %s",
		widget_timeplayed_played = "|cffaaaaaa总游戏时间：|r %s",

		widget_bank_name = "银行",
		widget_bank_description = "显示当前角色和其他角色的银行内容",
		widget_bank_header = "玩家银行",
		widget_bank_header_detailed = "银行内容为 %s",
		widget_bank_bankbag = "%d 格 %s (%d 空位)",
		widget_bank_bankbag_owner = "%s 的 %d 格 %s (%d 空位)",
		widget_bank_bankitem = "%d %s",
		widget_bank_space = "%d 格，%d 空位",
		widget_bank_nodata = "无数据\n访问你的银行以更新",
		widget_bank_allcharsfaction = "所有 %s %s 角色",
		widget_bank_allchars = "所有 %s 角色",

		widget_zygormessage_name = "Zygor 公告",
		widget_zygormessage_description = "显示有关 Zygor 的新闻和更新",
		widget_zygormessage_header = "Zygor 公告",

		widget_notablequests_name = "重要任务",
		widget_notablequests_description = "显示值得特别关注的世界任务",
		widget_notablequests_header = "重要任务：",
		widget_notablequests_empty = "没有重要任务活动。",

		widget_gold_name = "金币追踪器",
		widget_gold_description = "显示你的金币收入和支出。",
		widget_gold_header = "金币追踪器",
		widget_gold_startmoney = "起始金币：%s",
		widget_gold_spent = "金币支出：%s",
		widget_gold_gain = "金币收入：%s",
		widget_gold_now = "当前金币：%s",
		widget_gold_today_startmoney = "起始：%s",
		widget_gold_today_spent = "支出：%s",
		widget_gold_today_gain = "收入：%s",
		widget_gold_today_now = "当前：%s",
		widget_gold_today = "今天",
		widget_gold_week = "上周",
		widget_gold_month = "上月",
		widget_gold_year = "去年",
		widget_gold_todaychange = "今天的收入：",
		widget_gold_weekchange = "每周收入：",

		widget_dragonbane_name = "龙杀堡垒",
		widget_dragonbane_description = "显示龙杀堡垒状态",
		widget_dragonbane_empty = "堡垒攻城战未激活",
		widget_dragonbane_timer = "下一次攻城在：",
		widget_dragonbane_locked = "你还没有解锁龙杀堡垒。",

		widget_grandhunt_name = "大猎杀",
		widget_grandhunt_description = "显示大猎杀的位置和时间",
		widget_grandhunt_empty = "没有大猎杀",
		widget_grandhunt_noparty = "没有狩猎小队",
		widget_grandhunt_generic = "狩猎小队",
		widget_grandhunt_locked = "你还没有解锁大猎杀。",

		widget_feast_name = "社区盛宴",
		widget_feast_description = "显示社区盛宴状态",
		widget_feast_next = "下一次盛宴在：",
		widget_feast_locked = "你还没有解锁社区盛宴。",

		widget_dragonrace_name = "龙骑赛",
		widget_dragonrace_description = "显示多人龙骑赛状态",
		widget_dragonrace_locked = "你还没有解锁龙骑赛。",


		-----------------------------------------------------------------------------------------------------------------
		-- itemscore patterns -------------------------------------------------------------------------------------------
		-----------------------------------------------------------------------------------------------------------------
		SPELL_DAMAGE_DONE_HOLY = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL1_CAP"]),
		SPELL_DAMAGE_DONE_FIRE = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL2_CAP"]),
		SPELL_DAMAGE_DONE_NATURE = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL3_CAP"]),
		SPELL_DAMAGE_DONE_FROST = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL4_CAP"]),
		SPELL_DAMAGE_DONE_SHADOW = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL5_CAP"]),
		SPELL_DAMAGE_DONE_ARCANE = ("提高%s法术和效果所造成的伤害，最多([0-9]+)点。"):format(_G["SPELL_SCHOOL6_CAP"]),

		SPELL_DAMAGE_DONE_HOLY2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL1_CAP"])) .. " ([+-]+)([0-9]+)",
		SPELL_DAMAGE_DONE_FIRE2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL2_CAP"])) .. " ([+-]+)([0-9]+)",
		SPELL_DAMAGE_DONE_NATURE2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL3_CAP"])) .. " ([+-]+)([0-9]+)",
		SPELL_DAMAGE_DONE_FROST2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL4_CAP"])) .. " ([+-]+)([0-9]+)",
		SPELL_DAMAGE_DONE_SHADOW2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL5_CAP"])) .. " ([+-]+)([0-9]+)",
		SPELL_DAMAGE_DONE_ARCANE2 = (SINGLE_DAMAGE_TEMPLATE:format(_G["SPELL_SCHOOL6_CAP"])) .. " ([+-]+)([0-9]+)",

		SPELL_DAMAGE_DONE_HOLY3 = ("([+-]+)([0-9]+) %s%s"):format(SPELL_SCHOOL1_CAP, STAT_SPELLDAMAGE),
		SPELL_DAMAGE_DONE_FIRE3 = ("([+-]+)([0-9]+) %s%s"):format(SPELL_SCHOOL2_CAP, STAT_SPELLDAMAGE),
		SPELL_DAMAGE_DONE_NATURE3 = ("([+-]+)([0-9]+) %s%s"):format(SPELL_SCHOOL3_CAP, STAT_SPELLDAMAGE),
		SPELL_DAMAGE_DONE_FROST3 = ("([+-]+)([0-9]+) %s%s"):format(SPELL_SCHOOL4_CAP, STAT_SPELLDAMAGE),
		SPELL_DAMAGE_DONE_SHADOW3 = "([+-]+)([0-9]+) 暗影法術傷害",
		SPELL_DAMAGE_DONE_ARCANE3 = ("([+-]+)([0-9]+) %s%s"):format(SPELL_SCHOOL6_CAP, STAT_SPELLDAMAGE),

		BLOCK = "使你的格挡等级提高([0-9]+)。",
		BLOCK2 = "使你用盾牌格挡攻击的几率提高([0-9]+)%%。",
		CRIT = "使你的爆击等级提高([0-9]+)。",
		CRIT2 = "使你造成爆击的几率提高([0-9]+)%%。",
		CRIT_SPELL = "使你的法术爆击等级提高([0-9]+)。",
		DEFENSE_SKILL = "防御技能提高13点。",
		DODGE = "使你躲闪攻击的几率提高([0-9]+)%%。",
		FERAL_ATTACK_POWER = "在猎豹、熊或巨熊形态下的攻击强度提高154点。",
		HIT = "使你的命中等级提高([0-9]+)。",
		HIT_SPELL = "使你的法术命中等级提高([0-9]+)。",
		HIT_SPELL2 = "使你的法术击中敌人的几率提高([0-9]+)%%。",
		PARRY = "使你招架攻击的几率提高([0-9]+)%%。",
		SPELL_HEAL_DAMAGE = "提高所有法术和魔法效果所造成的伤害和治疗效果，最多([0-9]+)点。",
		SPELL_PENETRATION = "使你的法术穿透提高([0-9]+)。",
		SPELL_PENETRATION2 = "使你的法术目标的魔法抗性降低([0-9]+)点。",


	}
end)
