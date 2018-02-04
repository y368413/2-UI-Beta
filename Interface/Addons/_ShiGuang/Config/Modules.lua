-- Configure 配置页面
local _, R, _, _ = unpack(select(2, ...))

-- BUFF/DEBUFF相关
R.Auras = {
	IconSize		= 32,											-- BUFF图标大小
	IconsPerRow		= 16,											-- BUFF每行个数
	Spacing			= 6,											-- BUFF图标间距
	BHPos			= {"CENTER", UIParent, "CENTER", 0, -200},		-- 血DK助手默认位置
	StaggerPos		= {"CENTER", UIParent, "CENTER", 0, -290},		-- 坦僧工具默认位置
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -260},		-- 图腾助手默认位置
	MarksmanPos		= {"CENTER", UIParent, "CENTER", 0, -310},		-- 射击猎助手默认位置
	StatuePos		= {"BOTTOMLEFT", UIParent, 520, 260},			-- 武僧雕像默认位置
	EnergyBarPos		= {"CENTER", UIParent, "CENTER", 0, -195},			-- 职业能量条默认位置
}

-- 小地图
R.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", 0, 0},	-- 小地图位置
}


ShiGuangDB = {
	DisplayInfo = 54860,		--74504   --71057 	--68323   --35908   --65636
	["Switch"]		= true,  --通告功能 打开/关闭
	["Instance"]	= true,	 --在副本中时通报				
	["Raid"]		= false,    --在团队中时通报
	["Party"]		= true,    --在小队中时通报
	["Solo"]		= false,   --单人时候通报
	["Sound"]		= true,    --完成时播放提示音
	["Debug"]		= true,   --任务进度彩色提示
	["NoDetail"]	= true,  --不通报详细进度
	["CompleteX"]	= false, --自动移除追踪面板中已完成的任务
	["AddonSet"] = {
		{ "_ShiGuang","Combuctor",
			["name"] = "极简", }, -- [1]
		{ "_ShiGuang","Combuctor","Gladius","PVPMaster","Skada","WhisperMaster",
			["name"] = "PVP", }, -- [2]
		{ "AngryKeystones","AngryWorldQuests","Combuctor","GarrisonMaster","Skada","WhisperMaster","DBM-Core","DBM-TrialofValor","DBM-Nighthold","DBM-BrokenIsles","DBM-EmeraldNightmare","DBM-Party-Legion","DBM-StatusBarTimers","DBM-DefaultSkin","DBM-Archaeology","DBM-GUI","DBM-PvP","DBM-WorldEvents","DBM-VPYike","DBM-Brawlers","DBM-DMF","DBM-ProvingGrounds","DBM-GarrisonInvasions","DBM-Party-Cataclysm","DBM-Party-MoP","DBM-SiegeOfOrgrimmarV2","DBM-Scenario-MoP","DBM-HeartofFear","DBM-TerraceofEndlessSpring","DBM-Pandaria","DBM-ThroneofThunder","DBM-MogushanVaults","DBM-HellfireCitadel","DBM-Party-BC","DBM-Party-WoD","DBM-Draenor","DBM-Highmaul","DBM-BlackrockFoundry","DBM-Party-WotLK",
			["name"] = "初始", }, -- [3]
	},
}