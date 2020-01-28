local _, ns = ...
local M, R, U, I = unpack(ns)
local MISC = M:GetModule("Misc")

local format, gsub, strsplit = string.format, string.gsub, string.split
local pairs, tonumber, wipe, select = pairs, tonumber, wipe, select
local GetInstanceInfo, GetAtlasInfo, PlaySound = GetInstanceInfo, GetAtlasInfo, PlaySound
local IsPartyLFG, IsInRaid, IsInGroup, IsInInstance, IsInGuild = IsPartyLFG, IsInRaid, IsInGroup, IsInInstance, IsInGuild
local UnitInRaid, UnitInParty, SendChatMessage = UnitInRaid, UnitInParty, SendChatMessage
local UnitName, Ambiguate, GetTime = UnitName, Ambiguate, GetTime
local GetSpellLink, GetSpellInfo = GetSpellLink, GetSpellInfo
local C_VignetteInfo_GetVignetteInfo = C_VignetteInfo.GetVignetteInfo
local C_ChatInfo_SendAddonMessage = C_ChatInfo.SendAddonMessage
local C_ChatInfo_RegisterAddonMessagePrefix = C_ChatInfo.RegisterAddonMessagePrefix
local C_MythicPlus_GetCurrentAffixes = C_MythicPlus.GetCurrentAffixes

function MISC:AddAlerts()
	self:SoloInfo()
	self:RareAlert()
	self:InterruptAlert()
	--self:VersionCheck()
	--self:ExplosiveAlert()
	self:PlacedItemAlert()
	self:UunatAlert()
end

--[[
	SoloInfo是一个告知你当前副本难度的小工具，防止我有时候单刷时进错难度了。
	instList左侧是副本ID，你可以使用"/getid"命令来获取当前副本的ID；右侧的是副本难度，常用的一般是：2为5H，4为25普通，6为25H。
]]
local soloInfo
local instList = {
	[556] = 2,		-- H塞塔克大厅，乌鸦
	[575] = 2,		-- H乌特加德之巅，蓝龙
	[585] = 2,		-- H魔导师平台，白鸡
	[631] = 6,		-- 25H冰冠堡垒，无敌
	[1205] = 16,	-- M黑石，裂蹄牛
	[1448] = 16,	-- M地狱火，魔钢
	[1651] = 23,	-- M卡拉赞，新午夜
}

function MISC:SoloInfo_Create()
	if soloInfo then soloInfo:Show() return end

	soloInfo = CreateFrame("Frame", nil, UIParent)
	soloInfo:SetPoint("CENTER", 0, 120)
	soloInfo:SetSize(150, 70)
	M.SetBD(soloInfo)

	soloInfo.Text = M.CreateFS(soloInfo, 14, "")
	soloInfo.Text:SetWordWrap(true)
	soloInfo:SetScript("OnMouseUp", function() soloInfo:Hide() end)
end

function MISC:SoloInfo_Update()
	local name, instType, diffID, diffName, _, _, _, instID = GetInstanceInfo()

	if instType ~= "none" and diffID ~= 24 and instList[instID] and instList[instID] ~= diffID then
		MISC:SoloInfo_Create()
		soloInfo.Text:SetText(I.InfoColor..name..I.MyColor.."\n( "..diffName.." )\n\n"..I.InfoColor.."^-^")
	else
		if soloInfo then soloInfo:Hide() end
	end
end

function MISC:SoloInfo()
	if MaoRUIPerDB["Misc"]["SoloInfo"] then
		self:SoloInfo_Update()
		M:RegisterEvent("UPDATE_INSTANCE_INFO", self.SoloInfo_Update)
		M:RegisterEvent("PLAYER_DIFFICULTY_CHANGED", self.SoloInfo_Update)
	else
		if soloInfo then soloInfo:Hide() end
		M:UnregisterEvent("UPDATE_INSTANCE_INFO", self.SoloInfo_Update)
		M:UnregisterEvent("PLAYER_DIFFICULTY_CHANGED", self.SoloInfo_Update)
	end
end

--[[
	发现稀有/事件时的通报插件
]]
local cache = {}
local isIgnored = {
	[1153] = true,	-- 部落要塞
	[1159] = true,	-- 联盟要塞
	[1803] = true,	-- 涌泉海滩
	[1876] = true,	-- 部落激流堡
	[1943] = true,	-- 联盟激流堡
	[2111] = true,	-- 黑海岸前线
}

function MISC:RareAlert_Update(id)
	if id and not cache[id] then
		local instType = select(2, GetInstanceInfo())
		local info = C_VignetteInfo_GetVignetteInfo(id)
		if not info then return end
		local filename, width, height, txLeft, txRight, txTop, txBottom = GetAtlasInfo(info.atlasName)
		if not filename then return end

		local atlasWidth = width/(txRight-txLeft)
		local atlasHeight = height/(txBottom-txTop)
		local tex = format("|T%s:%d:%d:0:0:%d:%d:%d:%d:%d:%d|t", filename, 0, 0, atlasWidth, atlasHeight, atlasWidth*txLeft, atlasWidth*txRight, atlasHeight*txTop, atlasHeight*txBottom)
			RaidNotice_AddMessage(RaidWarningFrame, "----------   "..tex..(info.name or "").."   ----------", ChatTypeInfo["RAID_WARNING"])
			if MaoRUIPerDB["Misc"]["AlertinChat"] then
			local currrentTime = "|cff00ff00["..date("%H:%M:%S").."]|r"
				print(currrentTime.." -> "..I.InfoColor.." → "..tex..(info.name or ""))
			end
		if not MaoRUIPerDB["Misc"]["RareAlertInWild"] or instType == "none" then
			PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\Dadongda.ogg", "Master")
		end

		cache[id] = true
	end

	if #cache > 666 then wipe(cache) end
end

function MISC:RareAlert_CheckInstance()
	local _, instanceType, _, _, maxPlayers, _, _, instID = GetInstanceInfo()
	if (instID and isIgnored[instID]) or (instanceType == "scenario" and (maxPlayers == 3 or maxPlayers == 6)) then
		M:UnregisterEvent("VIGNETTE_MINIMAP_UPDATED", MISC.RareAlert_Update)
	else
		M:RegisterEvent("VIGNETTE_MINIMAP_UPDATED", MISC.RareAlert_Update)
	end
end

function MISC:RareAlert()
	if MaoRUIPerDB["Misc"]["RareAlerter"] then
		self:RareAlert_CheckInstance()
		M:RegisterEvent("PLAYER_ENTERING_WORLD", self.RareAlert_CheckInstance)
	else
		wipe(cache)
		M:UnregisterEvent("VIGNETTE_MINIMAP_UPDATED", self.RareAlert_Update)
		M:UnregisterEvent("PLAYER_ENTERING_WORLD", self.RareAlert_CheckInstance)
	end
end

--[[
	闭上你的嘴！
	打断、偷取及驱散法术时的警报
]]
local function msgChannel()
	return IsPartyLFG() and "INSTANCE_CHAT" or IsInRaid() and "RAID" or "PARTY"
end

local infoType = {
	["SPELL_INTERRUPT"] = U["Interrupt"],
	["SPELL_STOLEN"] = U["Steal"],
	["SPELL_DISPEL"] = U["Dispel"],
	["SPELL_AURA_BROKEN_SPELL"] = U["BrokenSpell"],
}

local blackList = {
	[99] = true,		-- 夺魂咆哮
	[122] = true,		-- 冰霜新星
	[1776] = true,		-- 凿击
	[1784] = true,		-- 潜行
	[5246] = true,		-- 破胆怒吼
	[8122] = true,		-- 心灵尖啸
	[31661] = true,		-- 龙息术
	[33395] = true,		-- 冰冻术
	[64695] = true,		-- 陷地
	[82691] = true,		-- 冰霜之环
	[91807] = true,		-- 蹒跚冲锋
	[102359] = true,	-- 群体缠绕
	[105421] = true,	-- 盲目之光
	[115191] = true,	-- 潜行
	[157997] = true,	-- 寒冰新星
	[197214] = true,	-- 裂地术
	[198121] = true,	-- 冰霜撕咬
	[207167] = true,	-- 致盲冰雨
	[207685] = true,	-- 悲苦咒符
	[226943] = true,	-- 心灵炸弹
	[228600] = true,	-- 冰川尖刺
}

function MISC:IsAllyPet(sourceFlags)
	if I:IsMyPet(sourceFlags) or (not MaoRUIPerDB["Misc"]["OwnInterrupt"] and (sourceFlags == I.PartyPetFlags or sourceFlags == I.RaidPetFlags)) then
		return true
	end
end

function MISC:InterruptAlert_Update(...)
	if MaoRUIPerDB["Misc"]["AlertInInstance"] and (not IsInInstance() or IsPartyLFG()) then return end

	local _, eventType, _, sourceGUID, sourceName, sourceFlags, _, _, destName, _, _, spellID, _, _, extraskillID, _, _, auraType = ...
	if not sourceGUID or sourceName == destName then return end

	if UnitInRaid(sourceName) or UnitInParty(sourceName) or MISC:IsAllyPet(sourceFlags) then
		local infoText = infoType[eventType]
		if infoText and (IsPartyLFG() or IsInRaid()) then
			if infoText == U["BrokenSpell"] then
				if not MaoRUIPerDB["Misc"]["BrokenSpell"] then return end
				if auraType and auraType == AURA_TYPE_BUFF or blackList[spellID] then return end
				SendChatMessage(format(infoText, sourceName..GetSpellLink(extraskillID), destName..GetSpellLink(spellID)), "SAY")  --msgChannel()
			else
				if MaoRUIPerDB["Misc"]["OwnInterrupt"] and sourceName ~= I.MyName and not MISC:IsAllyPet(sourceFlags) then return end
				   if MaoRUIPerDB["Misc"]["InterruptSound"] then
				      PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\ShutupFool.ogg", "Master")
				   end
				 SendChatMessage(infoText .. GetSpellLink(extraskillID), "SAY")  --msgChannel()
			end
		end
	end
end

function MISC:InterruptAlert_CheckGroup()
	if IsInGroup() then
		M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	else
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	end
end

function MISC:InterruptAlert()
	if MaoRUIPerDB["Misc"]["Interrupt"] then
		self:InterruptAlert_CheckGroup()
		M:RegisterEvent("GROUP_LEFT", self.InterruptAlert_CheckGroup)
		M:RegisterEvent("GROUP_JOINED", self.InterruptAlert_CheckGroup)
	else
		M:UnregisterEvent("GROUP_LEFT", self.InterruptAlert_CheckGroup)
		M:UnregisterEvent("GROUP_JOINED", self.InterruptAlert_CheckGroup)
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.InterruptAlert_Update)
	end
end
--[[
	大米完成时，通报打球统计
]]
local eventList = {
	["SWING_DAMAGE"] = 13,
	["RANGE_DAMAGE"] = 16,
	["SPELL_DAMAGE"] = 16,
	["SPELL_PERIODIC_DAMAGE"] = 16,
	["SPELL_BUILDING_DAMAGE"] = 16,
}

function MISC:Explosive_Update(...)
	local _, eventType, _, _, sourceName, _, _, destGUID = ...
	local index = eventList[eventType]
	if index and M.GetNPCID(destGUID) == 120651 then
		local overkill = select(index, ...)
		if overkill and overkill > 0 then
			local name = strsplit("-", sourceName or UNKNOWN)
			local cache = MaoRUIPerDB["Misc"]["ExplosiveCache"]
			if not cache[name] then cache[name] = 0 end
			cache[name] = cache[name] + 1
		end
	end
end

local function startCount()
	wipe(MaoRUIPerDB["Misc"]["ExplosiveCache"])
	M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.Explosive_Update)
end

local function endCount()
	local text
	for name, count in pairs(MaoRUIPerDB["Misc"]["ExplosiveCache"]) do
		text = (text or U["ExplosiveCount"])..name.."("..count..") "
	end
	if text then SendChatMessage(text, "PARTY") end
	M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.Explosive_Update)
end

local function pauseCount()
	local name, _, instID = GetInstanceInfo()
	if name and instID == 8 then
		M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.Explosive_Update)
	else
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.Explosive_Update)
	end
end

function MISC.Explosive_CheckAffixes(event)
	local affixes = C_MythicPlus_GetCurrentAffixes()
	if not affixes then return end

	if affixes[3] and affixes[3].id == 13 then
		M:RegisterEvent("CHALLENGE_MODE_START", startCount)
		M:RegisterEvent("CHALLENGE_MODE_COMPLETED", endCount)
		M:RegisterEvent("PLAYER_ENTERING_WORLD", pauseCount)
	end
	M:UnregisterEvent("PLAYER_ENTERING_WORLD", MISC.Explosive_CheckAffixes)
end

function MISC:ExplosiveAlert()
	if MaoRUIPerDB["Misc"]["ExplosiveCount"] then
		self:Explosive_CheckAffixes()
		M:RegisterEvent("PLAYER_ENTERING_WORLD", self.Explosive_CheckAffixes)
	else
		M:UnregisterEvent("CHALLENGE_MODE_START", startCount)
		M:UnregisterEvent("CHALLENGE_MODE_COMPLETED", endCount)
		M:UnregisterEvent("PLAYER_ENTERING_WORLD", pauseCount)
		M:UnregisterEvent("PLAYER_ENTERING_WORLD", self.Explosive_CheckAffixes)
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", self.Explosive_Update)
	end
end

--[[
	放大餐时叫一叫
]]
local lastTime = 0
local itemList = {
	[226241] = true,	-- 宁神圣典
	[256230] = true,	-- 静心圣典
	[185709] = true,	-- 焦糖鱼宴
	[259409] = true,	-- 海帆盛宴
	[259410] = true,	-- 船长盛宴
	[276972] = true,	-- 秘法药锅
	[286050] = true,	-- 鲜血大餐
	[265116] = true,	-- 工程战复
}

function MISC:ItemAlert_Update(unit, _, spellID)
	if not MaoRUIPerDB["Misc"]["PlacedItemAlert"] then return end

	if (UnitInRaid(unit) or UnitInParty(unit)) and spellID and itemList[spellID] and lastTime ~= GetTime() then
		local who = UnitName(unit)
		local link = GetSpellLink(spellID)
		local name = GetSpellInfo(spellID)
		SendChatMessage(format(U["Place item"], who, link or name), msgChannel())

		lastTime = GetTime()
	end
end

function MISC:ItemAlert_CheckGroup()
	if IsInGroup() then
		M:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", MISC.ItemAlert_Update)
	else
		M:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED", MISC.ItemAlert_Update)
	end
end

function MISC:PlacedItemAlert()
	self:ItemAlert_CheckGroup()
	M:RegisterEvent("GROUP_LEFT", self.ItemAlert_CheckGroup)
	M:RegisterEvent("GROUP_JOINED", self.ItemAlert_CheckGroup)
end

-- 乌纳特踩圈通报
function MISC:UunatAlert_CheckAura()
	for i = 1, 16 do
		local name, _, _, _, _, _, _, _, _, spellID = UnitDebuff("player", i)
		if not name then break end
		if name and spellID == 284733 then
			return true
		end
	end
end

local uunatCache = {}
function MISC:UunatAlert_Update(...)
	local _, eventType, _, _, _, _, _, _, destName, _, _, spellID = ...
	if eventType == "SPELL_DAMAGE" and spellID == 285214 and not MISC:UunatAlert_CheckAura() then
		uunatCache[destName] = (uunatCache[destName] or 0) + 1
		SendChatMessage(format(U["UunatAlertString"], destName, uunatCache[destName]), msgChannel())
	end
end

local function resetCount()
	wipe(uunatCache)
end

function MISC:UunatAlert_CheckInstance()
	local instID = select(8, GetInstanceInfo())
	if instID == 2096 then
		M:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.UunatAlert_Update)
		M:RegisterEvent("ENCOUNTER_END", resetCount)
	else
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", MISC.UunatAlert_Update)
		M:UnregisterEvent("ENCOUNTER_END", resetCount)
	end
end

function MISC:UunatAlert()
	if MaoRUIPerDB["Misc"]["UunatAlert"] then
		self:UunatAlert_CheckInstance()
		M:RegisterEvent("PLAYER_ENTERING_WORLD", self.UunatAlert_CheckInstance)
	else
		wipe(uunatCache)
		M:UnregisterEvent("PLAYER_ENTERING_WORLD", self.UunatAlert_CheckInstance)
		M:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED", self.UunatAlert_Update)
		M:UnregisterEvent("ENCOUNTER_END", resetCount)
	end
end

--[[## Author: Nick Melancon  ## Version: 0.1
local JaniFailedBonusRoll = CreateFrame("FRAME");
JaniFailedBonusRoll:RegisterEvent("BONUS_ROLL_RESULT");
JaniFailedBonusRoll:SetScript("OnEvent", function(self, event, ...)
  if (self == "BONUS_ROLL_RESULT") then
    local rewardType = event;
    if rewardType == "currency" then
      PlaySoundFile("Sound\\Creature\\Jani\\VO_801_Jani_02_M.ogg", "Master")
    end
  end
end);]]