local M, R, U, I = unpack(select(2, ...))
-------------------------------------------
-----     SpellAnnouncer+AuraSpell     ----
-------------------------------------------
local SpellFrameA = CreateFrame("Frame")
-- 模式设置
local SoloMode = false		-- 单人模式,开启后当单独一人时会使用 说 通报...
local WaringMode = true	  -- 警报模式,开启后不管在什么队伍都会使用 说 通报...

local AuraList = {
	-- 此处填写需要自动喊话的BUFF/DEBUFF...请按规格填写...三个List中的法术ID不能相同...
	[  6770] = Announcer_Sap,
	[ 94794] = Announcer_RocketPP,
	--[ 81162] = "即将挂掉,请治疗猛刷!",
	[116888] = Announcer_Purgatory,
}
local SoundList = {
	-- 此处填写需要播放音效的技能...请按规格填写...三个List中的法术ID不能相同...
	--PlaySoundFile("Sound\\Creature\\ShadeOfAran\\AranAggro01.wav" , "Master")			  求求你们不要这样我的儿子，已经疯了		
  --PlaySoundFile("Sound\\Creature\\ElderIronbranch\\UR_Ironbranch_Aggro01.wav", "Master")	     凡人不许进入这里
  --PlaySoundFile("Sound\\Creature\\XT002Deconstructor\\UR_XT002_Special01.wav", "Master")     不不不，不要这样
  --PlaySoundFile("Sound\\Creature\\Hodir\\UR_Hodir_Aggro01.wav", "Master")         擅闯此地就要付出代价
  --PlaySoundFile("Interface\\addons\\_ShiGuang\\Media\\beep.ogg", "Master")  哔哔
  
	[42650] = "Sound\\Creature\\LordMarrowgar\\IC_Marrowgar_Aggro01.ogg",  --大军-ICC老一台词
	[12042] = "Sound\\creature\\GlubtokBoth\\VO_DM_GlubtokBoth_Spell03.ogg",  --奥术强化-台词
	[55233] = "Sound\\creature\\PrinceKeleseth\\KelesethAggro.ogg",  --吸血鬼之血
	[1856] = "Sound\\Creature\\Illidan\\VO_WOE_Illidan_BossCloak_01.ogg",    --消失-伊利丹台词
	[605] = "Sound\\Creature\\JammalanTheProphet\\JammalanTheProphetCharm01.ogg",    --牧师统御意志-台词
	[73325] = "Sound\\Creature\\HeadlessHorseman\\Horseman_Beckon_01.ogg",    --施放信仰飞跃-台词
	[6262] = "Sound\\Creature\\Illidan\\VO_WOE_Illidan_Recovery_01.ogg",    --吃糖-我的力量恢复了
	[114049] = "Sound\\creature\\GlubtokBoth\\VO_DM_GlubtokBoth_Death01.ogg",    --升腾-台词
	[114018] = "Sound\\Creature\\Illidan\\VO_WOE_Illidan_Cloak_01.ogg",    --潜伏帷幕播放回到阴影里去
	[5484] = "Sound\\Creature\\LeiShui\\VO_TES_SPIRIT_SPELL_GETAWAY_02.ogg",    --雷施 别靠近我
	[8122] = "Sound\\Creature\\LeiShui\\VO_TES_SPIRIT_SPELL_GETAWAY_02.ogg",    --雷施 别靠近我
	[108921] = "Sound\\Creature\\LeiShui\\VO_TES_SPIRIT_SPELL_GETAWAY_01.ogg",    --雷施 滚开
	[5782] = "Sound\\Creature\\LeiShui\\VO_TES_SPIRIT_SPELL_GETAWAY_01.ogg",    --雷施 滚开
	--[6948] = "Sound\\Creature\\LeiShui\\VO_TES_SPIRIT_SPELL_HIDE_02.ogg",    --雷施 再也不想看见你
	--[103958] = "Sound\\Creature\\Illidan\\VO_WOE_Illidan_Mannoroth_17.ogg",    --恶魔变形-伊利丹台词
	--[81700] = "Sound\\Creature\\SelimFireheart\\SelimEmpowered.ogg",    --天使长-音效台词
	--[31884] = "Sound\\Creature\\SelimFireheart\\SelimEmpowered.ogg",    --复仇之怒-音效台词
	--[42650] = "Sound\\Creature\\HeadlessHorseman\\Horseman_Special_01.ogg",  --大军-无头骑士台词
}
local MessageList = {
	-- 此处填写需要自动喊话的技能...请按规格填写...三个List中的法术ID不能相同...
	--[48743] = "老子儿子都吃了，你还不奶我一口!",
}

-- 默认信息
function ShowSpellLink(SpellID)
	local spellLink = GetSpellLink(SpellID or 0) or Announcer_SpellIDnof
	DEFAULT_CHAT_FRAME:AddMessage(spellLink)
end

local function SpellAnnouncerOnEvent(self, event, ...)
if not MaoRUISettingDB["Misc"]["Interrupt"] then return end
local ZoneInfo = select(2, IsInInstance())
if (event == "PLAYER_LOGIN") then
		self:UnregisterEvent("PLAYER_LOGIN")
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")	
elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
		local EventType, SourceGUID, SourceName, DestGUID, DestName, SpellID, ExtraskillID = select(2, ...), select(4, ...), select(5, ...), select(8, ...), select(9, ...), select(12, ...), select(15, ...)
		--local _, eventType, _, sourceGUID, _, _, _, _, destName, _, _, sourceID, _, _, spellID, spellName, spellSchool = ...
	if ZoneInfo == "pvp" or UnitInBattleground("player") then end
	if SourceName == UnitName("player") then
			if EventType == "SPELL_INTERRUPT" then Message = (Announcer_Interrupted .. GetSpellLink(ExtraskillID))
			   if MaoRUISettingDB["Misc"]["InterruptSound"] then
				 PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\ShutupFool.ogg", "Master")
				 end
			elseif EventType == "SPELL_DISPEL" then Message = (Announcer_Disperse .. GetSpellLink(ExtraskillID))
			elseif EventType == "SPELL_STOLEN" then Message = (Announcer_Stole .. GetSpellLink(ExtraskillID))
			end
			if EventType == "SPELL_INTERRUPT" or EventType == "SPELL_DISPEL" or EventType == "SPELL_STOLEN" then 
            if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance() then 
               if ZoneInfo == "raid" or ZoneInfo == "party" or ZoneInfo == nil then 
                  if WaringMode == true then  SendChatMessage(Message, "SAY")  else  SendChatMessage(Message, "INSTANCE_CHAT")  end 
               end 
            else 
               if IsInRaid() == true then 
                  if WaringMode == true then SendChatMessage(Message, "SAY")  else  SendChatMessage(Message, "RAID")  end 
               elseif GetNumSubgroupMembers() ~= nil and GetNumSubgroupMembers() > 0 then 
                  --if WaringMode == true then SendChatMessage(Message, "SAY")  else  SendChatMessage(Message, "PARTY")  end
                  if WaringMode == true then SendChatMessage(Message, "PARTY") else SendChatMessage(Message, "SAY") end 
               elseif ZoneInfo == "none" then 
                  if SoloMode == true then  SendChatMessage(Message, "SAY") end 
               end 
            end 
         end
		  if EventType == "SPELL_AURA_APPLIED" and DestGUID == UnitGUID("player") and AuraList[SpellId] then
			local Message = (">>> "..GetSpellLink(SpellId).." → "..AuraList[SpellId].." <<<")
			if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance() then
				if ZoneInfo == "raid" or ZoneInfo == "party" or ZoneInfo == nil then
					if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "INSTANCE_CHAT") end
				end
			else
				if IsInRaid() == true then
					if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "RAID") end
				elseif GetNumSubgroupMembers() ~= nil and GetNumSubgroupMembers() > 0 then
					--if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "PARTY") end
					if WaringMode == true then SendChatMessage(Message, "PARTY") else SendChatMessage(Message, "SAY") end
				elseif ZoneInfo == "none" then
					if SoloMode == true then SendChatMessage(Message, "SAY") end
				end
			end
		end
	  elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		  local unitID, _, _, _, spellID = ...
		  if unitID == "player" then
			if MessageList[spellID] then
				local Message = (">>> "..GetSpellLink(spellID).." → "..MessageList[spellID].." <<<")
				if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInInstance() then
					if ZoneInfo == "raid" or ZoneInfo == "party" or ZoneInfo == nil then
						if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "INSTANCE_CHAT") end
					end
				else
					if IsInRaid() == true then
						if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "RAID") end
					elseif GetNumSubgroupMembers() ~= nil and GetNumSubgroupMembers() > 0 then
						--if WaringMode == true then SendChatMessage(Message, "SAY") else SendChatMessage(Message, "PARTY") end
						if WaringMode == true then SendChatMessage(Message, "PARTY") else SendChatMessage(Message, "SAY") end
					elseif ZoneInfo == "none" then
						if SoloMode == true then SendChatMessage(Message, "SAY")
						end
					end
				end
			elseif SoundList[spellID] then
				PlaySoundFile(SoundList[spellID], "Master")
			end
		end
	end
 end
end

SpellFrameA:SetScript("OnEvent", SpellAnnouncerOnEvent)
SpellFrameA:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
SpellFrameA:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")


--[[local SpellBackYell = CreateFrame("frame")
SpellBackYell:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
SpellBackYell:SetScript("OnEvent",function(_,_,_,a,_,_,d,_,_,_,c,_,_,e,_,_,b)
  if a=="SPELL_MISSED"and b=="REFLECT" then 
     SendChatMessage("["..c.."]反射了"..d.."的"..GetSpellLink(e),"yell")
  end;
end) ]]


--[[-----------------------------------------------------------------------------
Fatigue Warner                                            -- 虚弱提醒
-------------------------------------------------------------------------------]]
function FatigueWarner_OnUpdate(self) 
	local timer, value, maxvalue, scale, paused, label = GetMirrorTimerInfo(1) 
	if timer == "EXHAUSTION" then PlaySoundFile("Sound\\Creature\\BabyMurloc\\BabyMurlocA.wav", "Master") end 
	self:SetScript("OnUpdate", nil) 
end 
 
function FatigueWarner_OnEvent(self) self:SetScript("OnUpdate", FatigueWarner_OnUpdate) end 
	  
function FatigueWarner_Strip()
	local FatigueWarner_StripTable = {16, 17, 18, 5, 7, 1, 3, 10, 8, 6, 9}
	local start = 1
	local finish = table.getn(FatigueWarner_StripTable)

	for bag = 0, 4 do
		for slot=1, GetContainerNumSlots(bag) do
			if not GetContainerItemLink(bag, slot) then
				for i = start, finish do
					if GetInventoryItemLink("player", FatigueWarner_StripTable[i]) then
						PickupInventoryItem(FatigueWarner_StripTable[i])
						PickupContainerItem(bag, slot)
						start = i + 1
						break
					end
				end
			end
		end
	end
end

local FatigueWarnerFrame = CreateFrame("frame")
FatigueWarnerFrame:RegisterEvent("MIRROR_TIMER_START")
FatigueWarnerFrame:RegisterEvent("MIRROR_TIMER_STOP")
FatigueWarnerFrame:SetScript("OnEvent", FatigueWarner_OnEvent)

-----Saycast----------------
local function Initialize()
	local total = nil
	timerFrame = CreateFrame("Frame")
	timerFrame:SetScript("OnUpdate", function(self,elapsed)
		if not total then total = GetTime() elapsed = 0 end
		total = total + elapsed
		local x = self.timers
		while x and x.time <= total do
			SendChatMessage(x.msg, "SAY")
			x = x.next
		end
		self.timers = x
	end)
	timerFrame.queueChat = function(self,time,msg)
		local realTime = time + GetTime()
		local x = self.timers
		local last = x
		local t = {time = realTime, msg = msg}
		total = GetTime()
		if not x then self.timers = t return end
		while x and x.time <= realTime do
			last = x
			x = x.next
		end
		t.next = last.next
		last.next = t
	end
	eventFrame = CreateFrame("Frame")
	eventFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	eventFrame.playerName = UnitName("player")
	eventFrame:SetScript("OnEvent",function(self, event, ...)
	  if not MaoRUISettingDB["Misc"]["Saycast"] then return end
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, spellId = select(1, ...)
		if not self[spellId] then return end
		if type(self[spellId]) ~= "table" then return end
		local x = self[spellId][eventType]
		if x and sourceName == self.playerName then 
			local str = string.gsub(x.msg,"player", sourceName or "")
			str = string.gsub(str,"target", destName or "") 
			SendChatMessage(str,"SAY") 
			if x.w then SendChatMessage(x.w,"WHISPER",nil,x.wt)  end
			if x.queue then 
				local str = string.gsub(x.qmsg,"player", sourceName or "")
				str = string.gsub(str,"target", destName or "") 
				timerFrame:queueChat(x.queue,str)
			end
		end
	end)
end

local function RegisterSpell(spellId,castMsg,applicationMsg,fadeMsg,queueTime,queueMsg,requireMine,whisper,whisperTarget,start)
	eventFrame[spellId] = eventFrame[spellId] or {}
	if castMsg then eventFrame[spellId]["SPELL_CAST_SUCCESS"] = {msg = castMsg,queue = queueTime, qmsg = queueMsg,r = requireMine, w =whisper,wt = whisperTarget  } end
	if applicationMsg then eventFrame[spellId]["SPELL_AURA_APPLIED"] = {msg = applicationMsg, queue = queueTime, qmsg = queueMsg, r = requireMine } end
	if fadeMsg then eventFrame[spellId]["SPELL_AURA_REMOVED"] = {msg = fadeMsg, queue = queueTime, qmsg = queueMsg, r = requireMine } end
	if start then eventFrame[spellId]["SPELL_CAST_START"] = {msg = castMsg,queue = queueTime, qmsg = queueMsg,r = requireMine, w =whisper,wt = whisperTarget  } end
end

Initialize()

local tFrame = CreateFrame("Frame")
tFrame:RegisterUnitEvent("UNIT_SPELLCAST_START", "player")
--local lastTime = GetTime()
tFrame:SetScript("OnEvent",function(self, event, unit, spell, rank, lineID, spellId)

end)

--RegiserSpell(技能ID,"施放成功的喊话","效果开始的时候的喊话","效果结束时候的喊话",延时,"延时结束时的喊话",true)--如果不需要则用nil代替
RegisterSpell(62618,"<player> 真言术：障 已放，持续10秒",nil,nil,10,"<player> 真言术：障已消失", true)
RegisterSpell(64843,"<player> 神圣赞美诗",nil,"<player> 神圣赞美诗 结束",nil,nil, true)
RegisterSpell(64901,"<player> 希望圣歌",nil,"<player> 希望圣歌 结束",nil,nil, true)
RegisterSpell(33206,nil,"痛苦压制=> <target>，持续8秒","<target> 痛苦压制 已消失",nil,nil, true)
RegisterSpell(47788,nil,"守护之魂=> <target>，持续10秒","<target> 守护之魂 已消失",nil,nil, true)
RegisterSpell(108968,"<player> 已与 <target> 换血",nil,nil,nil,nil, true)
RegisterSpell(142723,"<player> 已与 <target> 换血",nil,nil,nil,nil, true)
RegisterSpell(32375,"已施放群体驱散",nil,nil,nil,nil, true)