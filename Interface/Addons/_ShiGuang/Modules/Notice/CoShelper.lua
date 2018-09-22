local CoSannounce = true
SLASH_COSH1 = '/coshelper';
function SlashCmdList.COSH()
	if CoSannounce then CoSannounce = false print("CoS: 群星道具通告关闭")
	else CoSannounce = true print("CoS: 群星道具通告开启")
	end
end
local npccheck = {}
local NoMore = false
local tarIndex = 1
local function CoShelper(tooltip)
	if NoMore then if IsShiftKeyDown() ~= true then NoMore = false end return end
	local mapid,_ = C_Map.GetBestMapForUnit("player")
	local _,unit = tooltip:GetUnit()
	if unit == nil then return; end;
	if mapid == 1087 then
		local npcid = string.sub(UnitGUID(unit),-17,-12)
		local line = ""
		if npcid == "105117" then line = "炼金, 盗贼 [投毒杀死巡逻队长加多]" --庄严静夜合剂
		elseif npcid == "105157" then line = "工程, 地精, 侏儒 [关闭构造体卫兵]" --奥术能量管道
		elseif npcid == "106110" then line = "萨满, 剥皮, 铭文 [全队移动速度+30%]" --浸水的卷轴
		elseif npcid == "105160" then line = "恶魔猎手, 术士, 牧师, 圣骑士 [全队暴击率+10%]" --地狱火宝珠
		elseif npcid == "105340" then line = "德鲁伊, 草药学, 烹饪800 [全队急速+10%]" --急速之花
		elseif npcid == "106018" then line = "盗贼, 战士, 制皮 [引来一名小BOSS]" --集市货物
		elseif npcid == "106112" then line = "治疗专精, 裁缝, 急救800 [引来一名小BOSS]" --受伤的夜之子平民
		elseif npcid == "106113" then line = "珠宝, 采矿 [引来一名小BOSS]" --夜之子等身雕像
		elseif npcid == "105831" then line = "圣骑士, 牧师, 恶魔猎手 [全队受到伤害-10%]" --地狱火宝典
		elseif npcid == "105249" then line = "烹饪800, 熊猫人, 草药学 [全队血量上限+25%]" --夜影小食
		elseif npcid == "105215" then line = "猎人, 锻造 [制造陷阱杀死小boss]" --一堆垃圾
		elseif npcid == "106024" then line = "法师, 附魔, 暗夜精灵/血精灵 [全队伤害+10%]" --魔法灯笼
		elseif npcid == "106108" then line = "死亡骑士, 武僧 [全队每3秒回复2% HP和1% MP]" -- 星光玫瑰酒
		else return
		end
		tooltip:AddLine("CoS: "..line, 255/255, 106/255, 0/255, true)
		if npccheck[npcid] == nil then npccheck[npcid] = true end
		if (npccheck[npcid] or IsShiftKeyDown()) and CoSannounce==true then
			if IsInLFGDungeon() then SendChatMessage(GetUnitName(unit)..": "..line ,"INSTANCE_CHAT" ,nil ,"1");
			else SendChatMessage(GetUnitName(unit)..": "..line ,"PARTY" ,nil ,"1");
			end
			SetRaidTarget(unit, tarIndex)
			tarIndex=tarIndex+1
			if tarIndex == 9 then tarIndex = 1 end;
			npccheck[npcid] = false
			NoMore = true
		end
	end
 end
 GameTooltip:HookScript("OnTooltipSetUnit", CoShelper)
 local CoSdummyFrame=CreateFrame("FRAME");
 CoSdummyFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA");
 CoSdummyFrame:SetScript("OnEvent", function(_,event) if event == "ZONE_CHANGED_NEW_AREA" then npccheck = {} end end);