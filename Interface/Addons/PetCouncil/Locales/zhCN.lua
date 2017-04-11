-----------------------------------------------
-- zhCN.lua
--
-- Abin
-- 2012/12/18
-----------------------------------------------

if GetLocale() ~= "zhCN" then return end

local _, addon = ...

addon.L = {
	["title"] = "宠物议会",
	["unnamed"] = "<未命名队伍>",
	["rename"] = "重命名",
	["team completed"] = "队伍|cff00ff00\"%s\"|r选取成功。",
	["tooltip list double click"] = "双击：选择这个队伍",
	["tooltip list shift click"] = "Shift-点击：发送3个链接到聊天框",
	["tooltip add"] = "把当前宠物组合保存为一个新队伍。",
	["tooltip update"] = "用当前宠物组合更新选定的队伍。",
	["tooltip delete"] = "删除选定的队伍。",
	["tooltip rename"] = "重命名选定的队伍。",
	["tooltip up"] = "将选定的队伍上移，按住SHIFT键可移到顶部。",
	["tooltip down"] = "将选定的队伍下移，按住SHIFT键可移到底部。",
	["rename prompt"] = "为你的队伍起个名字：",
	["alternative pets"] = "允许选用替补宠物",
	["tooltip alternative pets"] = "如果选中，插件会在主力宠物血量不足时自动选取符合条件（相同类型、等级、攻击、速度和技能）的同类宠物替补上场。",
	["alt message"] = "已选取%s替补%s|cffff0000（血量%d%%）|r。",
	["low health message"] = "%s生命值较低|cffff0000（血量%d%%）|r。",
	["team starts"] = "开始选取队伍|cff00ff00\"%s\"|r ...",
	["team failed"] = "|cffff0000队伍选取失败。|r",
	["ignore text"] = "Ctrl-点击：忽略这个栏位",
	["any pet"] = "任意宠物",
	["any pet desc"] = "PetCouncil不会更改位于这个栏位上的宠物。",
}