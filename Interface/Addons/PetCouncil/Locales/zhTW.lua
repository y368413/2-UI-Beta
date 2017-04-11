-----------------------------------------------
-- zhTW.lua
--
-- Abin
-- 2012/12/18
-----------------------------------------------

if GetLocale() ~= "zhTW" then return end

local _, addon = ...

addon.L = {
	["title"] = "寵物議會",
	["unnamed"] = "<未命名隊伍>",
	["rename"] = "重命名",
	["team completed"] = "隊伍|cff00ff00\"%s\"|r選取成功。",
	["tooltip list double click"] = "雙擊：選擇這個隊伍",
	["tooltip list shift click"] = "Shift-點擊：發送3個鏈接到聊天框",
	["tooltip add"] = "把當前寵物組合保存為一個新隊伍。",
	["tooltip update"] = "用當前寵物組合更新選定的隊伍。",
	["tooltip delete"] = "刪除選定的隊伍。",
	["tooltip rename"] = "重命名選定的隊伍。",
	["tooltip up"] = "將選定的隊伍上移，按住SHIFT鍵可移到頂部。",
	["tooltip down"] = "將選定的隊伍下移，按住SHIFT鍵可移到底部。",
	["rename prompt"] = "為你的隊伍起個名字：",
	["alternative pets"] = "允許選用替補寵物",
	["tooltip alternative pets"] = "如果選中，插件會在主力寵物血量不足時自動選取符合條件（相同類型、等級、攻擊、速度和技能）的同類寵物替補上場。",
	["alt message"] = "已選取%s替補%s|cffff0000（血量%d%%）|r。",
	["low health message"] = "%s生命值較低|cffff0000（血量%d%%）|r。",
	["team starts"] = "開始選取隊伍|cff00ff00\"%s\"|r ...",
	["team failed"] = "|cffff0000隊伍選取失敗。|r",
	["ignore text"] = "Ctrl-點擊：忽略這個欄位",
	["any pet"] = "任意寵物",
	["any pet desc"] = "PetCouncil不會更改位於這個欄位上的寵物。",
}