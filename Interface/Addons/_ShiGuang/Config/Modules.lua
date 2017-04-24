-- Configure 配置页面
local _, R, _, _ = unpack(select(2, ...))


-- BUFF/DEBUFF相关
R.Auras = {
	IconSize		= 32,											-- BUFF图标大小
	IconsPerRow		= 16,											-- BUFF每行个数
	Spacing			= 6,											-- BUFF图标间距
	BHPos			= {"CENTER", UIParent, "CENTER", 0, -260},		-- 血DK助手默认位置
	StaggerPos		= {"CENTER", UIParent, "CENTER", 0, -290},		-- 坦僧工具默认位置
	TotemsPos		= {"CENTER", UIParent, "CENTER", 0, -260},		-- 图腾助手默认位置
	MarksmanPos		= {"CENTER", UIParent, "CENTER", 0, -310},		-- 射击猎助手默认位置
	StatuePos		= {"BOTTOMLEFT", UIParent, 520, 260},			-- 武僧雕像默认位置
}



-- 小地图
R.Minimap = {
	Pos				= {"TOPRIGHT", UIParent, "TOPRIGHT", 0, 0},	-- 小地图位置
}
