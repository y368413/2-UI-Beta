-- Configure 配置页面
local _, ns = ...
local _, R = unpack(ns)

-- BUFF/DEBUFF相关
R.Auras = {
	IconSize		= 32,											-- BUFF图标大小
	IconsPerRow		= 16,										-- BUFF每行个数
	Spacing			= 6,											-- BUFF图标间距
	BHPos			= {"CENTER", UIParent, "CENTER", 0, -200},		    -- 血DK助手默认位置
	StaggerPos		= {"CENTER", UIParent, "CENTER", 0, -290},		-- 坦僧工具默认位置
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -260},		  -- 图腾助手默认位置
	HunterToolPos		= {"CENTER", UIParent, "CENTER", 0, -310},	-- 射击猎助手默认位置
	StatuePos		= {"BOTTOMLEFT", UIParent, 520, 260},			      -- 武僧雕像默认位置
	EnergyPos	= {"CENTER", UIParent, "CENTER", 0, -195},		    -- 职业能量条默认位置
	ComboPointPos	= {'BOTTOM', UIParent, "CENTER", 8, -210},
	WarlockPowerPos	= {'BOTTOM', UIParent, "CENTER", 0, -210},
	PaladinPowerPos	= {'BOTTOM', UIParent, "CENTER", 0, -180},
	RunePos	= {'BOTTOM', UIParent, "CENTER", 0, -200},
	MonkHarmonyPos	= {'BOTTOM', UIParent, "CENTER", 90, -190},
	MonkStaggerPos	= {'BOTTOM', UIParent, "CENTER", 0, -190},
	MageArcaneChargesPos	= {'BOTTOM', UIParent, "CENTER", 0, -200},
	
  -- 技能监控各组初始位置
	DrogPos	      = {"CENTER", UIParent, "TOP", -380, -43},	        -- 药水分组
	ClassBarPos	  = {"CENTER", UIParent, "CENTER", -102.5, -260},	    -- 药水分组
	AbsorbPos	    = {"CENTER", UIParent, "CENTER",-110, -80},	      -- 药水分组
	ShieldPos	    = {"CENTER", UIParent, "CENTER",90, -80},	        -- 药水分组
	EnchantPos		= {"RIGHT", UIParent, "CENTER", -190, -150},	    -- 附魔及饰品分组
	SpecialPos		= {"RIGHT", UIParent, "CENTER", -240, -155},	    -- 玩家重要光环分组
	WarningPos		= {"LEFT", UIParent, "CENTER", 190, -150},		    -- 目标重要光环分组
	PlayerAuraPos	= {"RIGHT", UIParent, "CENTER", -360, -160},	    -- 玩家光环分组
	TargetAuraPos   = {"LEFT", UIParent, "CENTER", 240, -155},		    -- 目标光环分组
	FocusPos	    = {"LEFT", UIParent, "CENTER", 360, -160},		    -- 焦点光环分组
	RaidBuffPos		= {"CENTER", UIParent, "CENTER", -120, 200},		-- 团队增益分组
	RaidDebuffPos	= {"CENTER", UIParent, "CENTER", 120, 200},			-- 团队减益分组
	CDPos		    = {"RIGHT", UIParent, "CENTER", -400, -220},	    -- 冷却计时分组
	InternalPos		= {"TOP", UIParent, "CENTER", -430, -250},	        -- 法术内置冷却分组
}

-- 小地图
R.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", 0, 0},	-- 小地图位置
}

-- 鼠标提示框
R.Tooltips = {
	TipPos 	= {"BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -55, 210},		-- 鼠标提示框默认位置
}

-- 信息条
R.Infobar = {
	Spec			= true,												-- 天赋专精
	SpecPos			= {"topleft", UIParent,"topleft",0, 0},				-- 天赋专精位置
	Time			= true,												-- 时间信息
	TimePos			= {"topleft", UIParent, "topleft", 25, 2},			-- 时间信息位置	
	Guild	 		= true,												-- 公会信息
	GuildPos 		= {"topleft", UIParent, "topleft", 100, -3},			-- 公会信息位置
	Friends 		= true,												-- 好友模块
	FriendsPos 		= {"topleft", UIParent, "topleft", 135, -3},		-- 好友模块位置
	Durability		= true,												-- 耐久度
	DurabilityPos	= {"topleft", UIParent, "topleft", 185, -3},		-- 耐久度位置
	System			= true,												-- 帧数/延迟
	SystemPos		= {"topleft", UIParent, "topleft", 225, -3},		-- 帧数/延迟位置
	Memory			= true,												-- 内存占用
	MemoryPos		= {"topleft", UIParent, "topleft", 320, -3},		-- 内存占用位置
	MaxAddOns		= 21,												-- 插件信息显示数量
  Bags            = true,
  BagsPos         = {"topleft", UIParent, "topleft", 375, -4},
	Gold			= true,												-- 金币信息
	GoldPos			= {"bottomright", Minimap, "bottomright", 0, 3}, 	    -- 金币信息位置
	Location		= true,												-- 区域信息
	LocationPos		= {"top", UIParent,"top", 0, -3},					-- 区域信息位置
	
	Fonts			= {STANDARD_TEXT_FONT, 12, "OUTLINE"},				-- 字体
	TimeFonts       = {"Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 24, "outline"},
	TTFonts         = {STANDARD_TEXT_FONT, 18, "outline"},
}

		ShiGuangDB = ShiGuangDB or {}