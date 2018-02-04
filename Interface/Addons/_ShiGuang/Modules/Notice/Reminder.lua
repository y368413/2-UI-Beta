local M, R, U, I = unpack(select(2, ...))

----SonicReputation by 小刺猬(updata for 7.2 by 灰原哀709@NGA)
local rep = {};
local extraRep = {};  --额外声望
local C_Reputation_IsFactionParagon = C_Reputation.IsFactionParagon

function createMessage(msg)
  local info = ChatTypeInfo["COMBAT_FACTION_CHANGE"];
	for j = 1, 4, 1 do
    local chatfrm = getglobal("ChatFrame"..j);
    for k,v in pairs(chatfrm.messageTypeList) do
      if v == "COMBAT_FACTION_CHANGE" then
        chatfrm:AddMessage(msg, info.r, info.g, info.b, info.id);
        break;
      end
    end
  end
end
function initExtraRep(factionID, name)
  local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID);
  if not extraRep[name] then
		extraRep[name] = currentValue % threshold
		if hasRewardPending then
      extraRep[name] = extraRep[name] + threshold
    end
    if extraRep[name] > threshold and (not hasRewardPending) then
      extraRep[name] = extraRep[name] - threshold
    end
	end
end

local SonicReputation = CreateFrame("Frame");
SonicReputation:RegisterEvent("UPDATE_FACTION");
SonicReputation:SetScript("OnEvent", function()
	local numFactions = GetNumFactions(self);
	for i = 1, numFactions, 1 do
		local name, _, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID = GetFactionInfo(i);
		local min, max, value = 0;
		--7.2额外声望
		if barValue >= 42000 then
      if C_Reputation_IsFactionParagon(factionID) then
        initExtraRep(factionID,name)
        local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
        min, max = 0, threshold
        value = currentValue % threshold
        if hasRewardPending then 
          value = value + threshold
        end
        local extraChange = value - extraRep[name];
        if(extraChange > 0) then 
          extraRep[name] = value
          local extra_msg = string.format("%s: %+d (%d/%d)", name, extraChange, value, threshold)
          createMessage(extra_msg);
        end
      end
    elseif name and (not isHeader) or (hasRep) then
      if not rep[name] then
        rep[name] = barValue;
      end
      local change = barValue - rep[name];
      if (change > 0) then
        rep[name] = barValue
				local msg = string.format("%s: %+d (%d/%d)", name, change, barValue - barMin, barMax - barMin);
        createMessage(msg)
      end
    end
	end
end);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", function() return true; end);
--------------------nReputation--------------------------------------------------------------------
-- Proccess tracking changes. Will ignore guild and anything set to inactive.
local SetWatched = function(newFaction)
    if running then return end
    running = true
    local i = 1
    local wasCollapsed = {}
    local watchedFaction = select(1,GetWatchedFactionInfo())
    while i <= GetNumFactions() do
        local name, _, _, _, _, _, _, _, isHeader, isCollapsed, _, _, _, _, _, _ = GetFactionInfo(i)
        if isHeader then
            if name == FACTION_INACTIVE then break end
            if isCollapsed then
                ExpandFactionHeader(i)
                wasCollapsed[name] = true
            end
        end
        if (name == newFaction) then
            if (watchedFaction ~= newFaction) then
                SetWatchedFactionIndex(i)
            end
            break
        end
        i = i + 1
    end
    i = 1
    while i <= GetNumFactions() do
        local name, _, _, _, _, _, _, _, isHeader, isCollapsed, _, _, _, _, _, _ = GetFactionInfo(i)
        if isHeader and not isCollapsed and wasCollapsed[name] then
            CollapseFactionHeader(i)
            wasCollapsed[name] = nil
        end
        i = i + 1
    end
    running = nil
end
-- Reads faction change line and sets watched reputation.
local listener = CreateFrame("Frame")
listener:SetScript("OnEvent", function(self, event, ...)
    local arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11 = ...
    local pattern_standing_inc = string.gsub(string.gsub(FACTION_STANDING_INCREASED, "(%%s)", "(.+)"), "(%%d)", "(%%d+)")
    if ( event == "CHAT_MSG_COMBAT_FACTION_CHANGE" ) then
        local s1, e1, faction, amount = string.find(arg1, pattern_standing_inc)
        if ( s1 ~= nil and amount ~= nil ) then
            if ( faction ~= GUILD ) then
                SetWatched(faction)
            end
        end
    end
end)
-- Listen for faction change events.
listener:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
-----------------------------------ExaltedPlus------------------------------------------
local buln,rpt,f=BreakUpLargeNumbers,ReputationParagonTooltip,CreateFrame("frame") f.c=FACTION_BAR_COLORS
function f.update(_,id,v)
	for k in ReputationFrame.paragonFramesPool:EnumerateActive() do if k.factionID then
		id=k.factionID if not f[id] then f[id]={} end f[id].fr=k
		v,f[id].m,_,f[id].rw=C_Reputation.GetFactionParagonInfo(id)
		f[id].t=f[id].rw and math.modf(v/f[id].m)-1 or math.modf(v/f[id].m)
		f[id].v=mod(v,f[id].m)
	end end f.rfv=ReputationFrame:IsVisible()
end
f:SetScript("OnUpdate",function(s,e)
	if not s.a then s.a=0.3 end if s.b then s.a=s.a-e else s.a=s.a+e end
	if s.a>=1 then s.a=1 s.b=true elseif s.a<=0.3 then s.a=0.3 s.b=false end
	if s.rfv then for i=1,NUM_FACTIONS_DISPLAYED do
		if s[i] then _G["ReputationBar"..i.."ReputationBar"]:SetStatusBarColor(f.c[8].r,f.c[8].g,f.c[8].b,s.a) end
	end end
	if s.wrw then ReputationWatchBar.StatusBar:SetStatusBarColor(f.c[8].r,f.c[8].g,f.c[8].b,s.a) end
end)
hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward",function(tt,t) f.update()
	if tt==rpt.ItemTooltip and rpt.factionID and f[rpt.factionID] and f[rpt.factionID].t then
		t=format(ARCHAEOLOGY_COMPLETION,f[rpt.factionID].t)
		rpt:AddLine(t) tt.Tooltip:AddLine("\n") tt.Tooltip:Show()
		for i=1,rpt:NumLines() do if _G[rpt:GetName().."TextLeft"..i]:GetText()==t then
			_G[rpt:GetName().."TextLeft"..i]:SetPoint("BOTTOMLEFT",0,-70)
		end end
	end
end)
hooksecurefunc("MainMenuBar_UpdateExperienceBars",function(_,n,r,id) f.update()
	if ReputationWatchBar:IsShown() then
		n,r,_,_,_,id=GetWatchedFactionInfo()
		if f[id] and f[id].rw then
			ReputationWatchBar.OverlayFrame.Text:SetText(n.." "..f[id].v.." / "..f[id].m)
			ReputationWatchBar.StatusBar:SetAnimatedValues(f[id].v,0,f[id].m,r) f.wrw=true
		elseif id then
			r=(GetFriendshipReputation(id)) and 5 or r f.wrw=nil
			ReputationWatchBar.StatusBar:SetStatusBarColor(f.c[r].r,f.c[r].g,f.c[r].b,1)
		end
	end
end)
hooksecurefunc("ReputationFrame_Update",function(_,id,x,bar,row) f.update()
	for i=1,NUM_FACTIONS_DISPLAYED do
		_,_,_,_,_,_,_,_,_,_,_,_,_,id=GetFactionInfo(ReputationListScrollFrame.offset+i)
		if f[id] and f[id].fr then
			f[i]=f[id].rw or nil
			bar=_G["ReputationBar"..i.."ReputationBar"] row=_G["ReputationBar"..i]
			bar:SetMinMaxValues(0,f[id].m) bar:SetValue(f[id].v)
			row.rolloverText=" "..format(REPUTATION_PROGRESS_FORMAT,buln(f[id].v),buln(f[id].m))
			f[id].fr.Check:SetShown(false) f[id].fr.Glow:SetShown(false)
			f[id].fr.Highlight:SetShown(false) f[id].fr.Icon:SetAlpha(f[i] and 1 or 0.3)
		else f[i]=nil end
	end
end)
------------ SpellOverlayTimer v1.15.2 by DarkStarX, modified by nj55top @ 2012-11-17     ---------
local SAO = {}
local nextUpdate = 0.2
local activeNum = 0
local OverlayRemap = { [88843] = 19615, [93426] = 91342, [60349] = 53817, [79808] = -1, [126084] = 44544, }--[5143] = 79808,--[126084] = 112965,
local useIcon = False
local iconSize = 48  --64
local iconGap = 8

local SAOF = SpellActivationOverlayFrame

local function SAO_GetTimeLeft(spellID, onwho)
	local i = 1
	local name, _, icon, count, _, _, buff_expiretime, _, _, _, buff_spellid = UnitBuff(onwho, i)
	while name do
		i = i + 1
		if buff_spellid == spellID then
			return floor(buff_expiretime-GetTime()), name, count, icon
		end
		name, _, icon, count, _, _, buff_expiretime, _, _, _, buff_spellid = UnitBuff(onwho, i)
	end
	return false, false
end

local function SAO_CreateTimeText(self, isCount)
	local name = isCount and self.spellID .. "Count" or self.spellID .. "Timeleft"
	local timerText = self:CreateFontString(self.spellID, "ARTWORK", "CombatTextFont")
	timerText:SetTextColor(1, 0, 0, 1)
	timerText:SetTextHeight(24)
	return timerText
end

local function SAOTimer_OnUpdate(self, elapsed)
	nextUpdate = nextUpdate - elapsed
	if nextUpdate > 0 then return end
	local timeleft, spellname, count = SAO_GetTimeLeft(self.spellID, self.checkwho)
	if timeleft and timeleft < 0 then timeleft = 0 end
	if timeleft then
		spellname = useIcon and "" or format("|cff3366ff%s|r ", spellname)
		self.text:SetText(timeleft.." s")
		--self.text:SetText(spellname..timeleft.." s")
	else
		self.text:SetText("")
	end
	if count and count > 1 then
		self.count:SetText(count)
	else
		self.count:SetText("")
	end
	nextUpdate = 0.2
end

function SAO_ShowTimer(...)
	local self, spellID, texturePath, position = ...
	--local icon = GetSpellTexture(spellID)
	local overlay = SpellActivationOverlay_GetOverlay(self, spellID, position)
	if OverlayRemap[spellID] then spellID = OverlayRemap[spellID] end
	local checkwho = "player"
	local spellname, timeleft, count, icon = SAO_GetTimeLeft(spellID, checkwho)
	if timeleft == false then
		checkwho = "pet"
		spellname, timeleft, count, icon  = SAO_GetTimeLeft(spellID, checkwho)
	end
	if timeleft == false then return end

	if not SAO[spellID] then
		SAO[spellID] = {}
		SAO[spellID].timer = CreateFrame("frame", spellID)
		SAO[spellID].timer.spellID = spellID
		SAO[spellID].timer.checkwho = checkwho
		SAO[spellID].timer.text = SAO_CreateTimeText(SAO[spellID].timer)
		SAO[spellID].timer.count = SAO_CreateTimeText(SAO[spellID].timer, true)
		SAO[spellID].timer:Hide()
		SAO[spellID].position = position
		SAO[spellID].active = false
	end
	if not SAO[spellID].active then
		activeNum = activeNum + 1
		SAO[spellID].active = true
		SAO[spellID].timer:Show()
		SAO[spellID].timer:SetScript("OnUpdate", SAOTimer_OnUpdate)
	end
	SAO[spellID].timer.text:ClearAllPoints()
	if useIcon and icon then
		overlay.texture:SetTexture(icon)
		overlay:SetSize(iconSize, iconSize)
		overlay:ClearAllPoints()
		overlay:SetPoint("TOP", SAOF, "BOTTOM", ( activeNum - 1 ) * ( iconSize + iconGap ), 0)
		SAO[spellID].timer.text:SetPoint("TOP", overlay, "BOTTOM")
	elseif SAO[spellID].position ~= position then
		SAO[spellID].timer.text:SetPoint("CENTER", overlay, "TOP", 135, 0)
	else
		SAO[spellID].timer.text:SetPoint("CENTER", overlay, "TOP")
	end
end

function SAO_HideTimer(...)
	local self, spellID = ...
	if OverlayRemap[spellID] then spellID = OverlayRemap[spellID] end
	if not SAO[spellID] or not SAO[spellID].active then return end
	activeNum = activeNum - 1
	SAO[spellID].active = false
	SAO[spellID].timer:Hide()
	SAO[spellID].timer:SetScript("OnUpdate", nil)
end

hooksecurefunc("SpellActivationOverlay_ShowOverlay", SAO_ShowTimer)
hooksecurefunc("SpellActivationOverlay_HideOverlays", SAO_HideTimer)


-- tracker of important buffs by nj55top
local classBuffs = {							-- DIY to track more buffs you want
	--["DRUID"] = {
		[69369] = { texture = "FURY_OF_STORMRAGE", position = "TOP", showing = false, active = false },
		[208628] = { texture = "Slice_and_Dice", position = "TOP", showing = false, active = false },  --DH 势如破竹
		--[132403] = { texture = "Impact", position = "TOP", showing = false, active = false },  --QS 正义盾击
	--},
		--[172106] = { texture = "Blood_Surge", position = "TOP", showing = false, active = false },  --灵狐(6.2移除)
}
local pathFORMAT = "TEXTURES\\SPELLACTIVATIONOVERLAYS\\%s.BLP"

local Tracker = CreateFrame("FRAME")
Tracker:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, ...) end end)
Tracker:RegisterUnitEvent("UNIT_AURA", "player")

function Tracker:UNIT_AURA(unit)
	--if unit ~= "player" or not classBuffs[class] then return end
	if unit ~= "player" then return end

	local i = 1
	local name, _, icon, _, _, _, _, _, _, _, id = UnitAura(unit, i, "HELPFUL")
	while name do
		local buff = classBuffs[id]  --classBuffs[class][id]
		if buff then
			if not buff.active then
				local path = format(pathFORMAT, buff.texture)
				local position = buff.position
				SpellActivationOverlay_ShowOverlay(SAOF, id, path, position, 1, 255, 255, 255)
				buff.active = true
			end
			buff.showing = true
		end
		i = i + 1
		name, _, icon, _, _, _, _, _, _, _, id = UnitAura(unit, i, "HELPFUL")
	end

	for index, value in pairs(classBuffs) do   --classBuffs[class]
		if not value.showing and value.active then
			SpellActivationOverlay_HideOverlays(SAOF, index)
			value.active = false
		end
		value.showing = false
	end
end


-- adjust LossOfControlFrame by nj55top

local showAbilityName = true
function LoCF_AdjustDisplay(self)
	self.blackBg:SetAlpha(0)
	self.RedLineTop:SetAlpha(0)
	self.RedLineBottom:SetAlpha(0)
--	self.Icon:SetSize(iconSize, iconSize)
	self.Icon:ClearAllPoints()
	self.TimeLeft.NumberText:ClearAllPoints()
	if useIcon or useBuffIcon then
		self.Icon:SetPoint("TOP", SAOF, "BOTTOM", -(iconSize + iconGap), 21)
		self.TimeLeft.NumberText:SetPoint("TOPLEFT", self.Icon, "BOTTOMLEFT")
	else
		self.Icon:SetPoint("TOP", SAOF, "BOTTOM", 0, 21)
		self.TimeLeft.NumberText:SetPoint("LEFT", self.Icon, "RIGHT")
	end
--	self.TimeLeft.NumberText:SetTextHeight(fontSize)
--	self.TimeLeft.SecondsText:SetTextHeight(fontSize)
	self.TimeLeft.SecondsText:SetText("")
--	self.AbilityName:SetTextHeight(fontSize)
	self.AbilityName:ClearAllPoints()
	self.AbilityName:SetPoint("RIGHT", self.Icon, "LEFT")
	if not showAbilityName then self.AbilityName:SetText("") end
end

hooksecurefunc("LossOfControlFrame_SetUpDisplay", LoCF_AdjustDisplay)


------------------------------BattleResAlert---------------------------
local BattleResAlert = CreateFrame("Frame")

BattleResAlert:SetScript("OnEvent",function(a,b,c,event, d,e,sourceName, f,g,h,destName, i,j,spellId)
	if (((spellId == 95750) or (spellId == 20484) or (spellId == 113269)
	or (spellId == 61999) or (spellId == 126393))
	and (event == "SPELL_CAST_SUCCESS") and (destName == UnitName("player")))
	then
		DEFAULT_CHAT_FRAME:AddMessage("战复 "..sourceName..".")
		--PlaySound("ReadyCheck", "Master")
	end
end)
BattleResAlert:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")


------------------------------------------------------     HideFishingBobberTooltip     -----------------------------------------------------
local HideFishingBobberTooltip = CreateFrame("Frame")
HideFishingBobberTooltip:RegisterEvent("PLAYER_LOGIN")
HideFishingBobberTooltip:SetScript("OnEvent", function()
  GameTooltip:HookScript("OnShow", function()
    local tooltipText = GameTooltipTextLeft1
    if tooltipText and tooltipText:GetText() == ("鱼漂" or "魚漂" or "Fishing Bobber" or "Corcho de pesca") then
      GameTooltip:Hide()
    end
  end)
end)
------------------------------------------------------     重置副本提示     -----------------------------------------------------
local success = gsub(INSTANCE_RESET_SUCCESS, "%%s", "")
local failed = gsub(INSTANCE_RESET_FAILED, ".*%%s", "")
local fail_offline = gsub(INSTANCE_RESET_FAILED_OFFLINE, ".*%%s", "")
local fail_zone = gsub(INSTANCE_RESET_FAILED_ZONING, ".*%%s", "")

local function Echo(self, event, ...)
	local instance = ...

	if event == "CHAT_MSG_SYSTEM" then
		if UnitIsGroupLeader("player") and (strfind(instance, success) or strfind(instance, failed) or strfind(instance, fail_offline) or strfind(instance, fail_zone)) then
			SendChatMessage("  ^ - ^  "..instance, "PARTY")
		end
	end
end

local Echof = CreateFrame("Frame")
Echof:RegisterEvent("CHAT_MSG_SYSTEM")
Echof:SetScript("OnEvent", Echo)

---------------------[[ Bag Space Checker Created by BrknSoul on 17th January 2014 --]]
--Frame creation and event registration
local frameBSC=CreateFrame("FRAME")
local BSCSpace
frameBSC:RegisterEvent("BAG_UPDATE_DELAYED")
frameBSC:RegisterEvent("BAG_UPDATE")

--Event Handlers
function frameBSC:OnEvent(event,arg1)
	if event == "BAG_UPDATE_DELAYED" then
    BSCSpace = 0
    for i=0,NUM_BAG_SLOTS do 
      BSCSpace = BSCSpace + GetContainerNumFreeSlots(i)
    end
    if BSCSpace <= 8 then
      UIErrorsFrame:AddMessage(REMINDER_BAGS_SPACE..BSCSpace,1,0,0,5)
      PlaySoundFile("Sound/SPELLS/SPELL_Treasure_Goblin_Coin_Toss_09.OGG")
    end
  end
end
frameBSC:SetScript("OnEvent",frameBSC.OnEvent)


---------------- Hide errors in combat --------------
local erList = {
	[ERR_ABILITY_COOLDOWN] = true,
	[ERR_ATTACK_MOUNTED] = true,
	[ERR_BADATTACKFACING] = true,
	[ERR_BADATTACKPOS] = true,
	[ERR_ITEM_COOLDOWN] = true,
	[ERR_INVALID_ATTACK_TARGET] = true,      -- You cannot attack that target.
	[ERR_NO_ATTACK_TARGET] = true,
	[ERR_NOT_IN_COMBAT] = true,
	[ERR_OUT_OF_ENERGY] = true,
	[ERR_OUT_OF_FOCUS] = true,
	[ERR_OUT_OF_HEALTH] = true,
	[ERR_OUT_OF_MANA] = true,
	[ERR_OUT_OF_RAGE] = true,
	[ERR_OUT_OF_RANGE] = true,
	[ERR_OUT_OF_RUNES] = true,
	[ERR_OUT_OF_HOLY_POWER] = true,
	[ERR_OUT_OF_RUNIC_POWER] = true,
	[ERR_OUT_OF_SOUL_SHARDS] = true,
	[ERR_OUT_OF_ARCANE_CHARGES] = true,
	[ERR_OUT_OF_COMBO_POINTS] = true,
	[ERR_OUT_OF_CHI] = true,
	[ERR_OUT_OF_POWER_DISPLAY] = true,
	[ERR_SPELL_COOLDOWN] = true,
	[SPELL_FAILED_AFFECTING_COMBAT] = true,
	[ERR_ITEM_COOLDOWN] = true,
	[SPELL_FAILED_BAD_IMPLICIT_TARGETS] = true,
	[SPELL_FAILED_BAD_TARGETS] = true,
	[SPELL_FAILED_CASTER_AURASTATE] = true,
	[SPELL_FAILED_MOVING] = true,
	[SPELL_FAILED_NO_COMBO_POINTS] = true,
	[SPELL_FAILED_UNIT_NOT_INFRONT] = true,
	[SPELL_FAILED_NO_ENDURANCE] = true,      -- Not enough endurance
  [SPELL_FAILED_NOT_MOUNTED] = true,       -- You are mounted
  [SPELL_FAILED_NOT_ON_TAXI] = true,       -- You are in flight
	[SPELL_FAILED_SPELL_IN_PROGRESS] = true,
	[SPELL_FAILED_TARGET_AURASTATE] = true,
	[SPELL_FAILED_TARGETS_DEAD] = true,      -- Your target is dead.
	[SPELL_FAILED_TOO_CLOSE] = true,
	[ERR_NO_ATTACK_TARGET] = true,
}
MaoRUI:EventFrame("UI_ERROR_MESSAGE"):SetScript("OnEvent", function(self, event, _, error)
	if not MaoRUISettingDB["Misc"]["HideErrors"] then return end
	if InCombatLockdown() and erList[error] then
		UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
	else
		UIErrorsFrame:RegisterEvent("UI_ERROR_MESSAGE")
	end
end)

------------------------------------------------------------------------------AltTabLfgNotification
local AltTabLfgNotification, Flashevents = CreateFrame("Frame", "AltTabLfgNotification"), {};
------------------------------------------------------- start of events
-- party invite
function Flashevents:PARTY_INVITE_REQUEST(...) SendChatMessage("-- 你有组队邀请 --", "WHISPER", nil, UnitName("player")); end
function Flashevents:PARTY_INVITE_XREALM(...) SendChatMessage("-- 你有组队邀请 --", "WHISPER", nil, UnitName("player")); end
-- going to queue into lfg
function Flashevents:LFG_ROLE_CHECK_SHOW(...) SendChatMessage("-- 职责确认 --", "WHISPER", nil, UnitName("player")); end
-- lfg queue ready
function Flashevents:LFG_PROPOSAL_SHOW(...) SendChatMessage("-- 可以进本了 --", "WHISPER", nil, UnitName("player")); end
-- readycheck
function Flashevents:READY_CHECK(...) SendChatMessage("-- 就位确认 --", "WHISPER", nil, UnitName("player")); end
-- rolecheck
function Flashevents:ROLE_POLL_BEGIN(...) SendChatMessage("-- 职责确认 --", "WHISPER", nil, UnitName("player")); end
-- summon request
function Flashevents:CONFIRM_SUMMON(...) SendChatMessage("-- 有人拉你 --", "WHISPER", nil, UnitName("player")); end
-- resurrect request
function Flashevents:RESURRECT_REQUEST(...) SendChatMessage("-- 有人救你了 --", "WHISPER", nil, UnitName("player")); end
-- bg queue ready
function Flashevents:UPDATE_BATTLEFIELD_STATUS(...)
for i = 1, 10 do
	local bgstatus = GetBattlefieldStatus(i)
	if (bgstatus == "confirm") then SendChatMessage("-- 进本啦 --", "WHISPER", nil, UnitName("player")); end
end
end
-- tb/wg queue ready
function Flashevents:BATTLEFIELD_MGR_ENTRY_INVITE(...) SendChatMessage("BATTLEFIELD_MGR_ENTRY_INVITE", "WHISPER", nil, UnitName("player")); end
-- worldpvp--Add by y368413
function Flashevents:BFMGR_INVITED_TO_ENTER(...) SendChatMessage("*BFMGR_INVITED_TO_ENTER*", "WHISPER", nil, UnitName("player")); end
-- duel_request--Add by y368413
function Flashevents:DUEL_REQUESTED(...) SendChatMessage("-- 决斗 --", "WHISPER", nil, UnitName("player")); end
function Flashevents:PET_BATTLE_PVP_DUEL_REQUESTED(...) SendChatMessage("-- 宠物对决 --", "WHISPER", nil, UnitName("player")); end
-- summon--Add by y368413
function Flashevents:CONFIRM_SUMMON_STARTING_AREA(...) SendChatMessage("*CONFIRM_SUMMON_STARTING_AREA*", "WHISPER", nil, UnitName("player")); end
-- tarde--Add by y368413
function Flashevents:TRADE_WITH_QUESTION(...) SendChatMessage("*TRADE_WITH_QUESTION*", "WHISPER", nil, UnitName("player")); end
function Flashevents:TRADE_SHOW(...) SendChatMessage("-- 交易 --", "WHISPER", nil, UnitName("player")); end
--------------------------------------------------------------------------- end of events
AltTabLfgNotification:SetScript("OnEvent", function(self, event, ...)
 if not MaoRUISettingDB["Misc"]["AltTabLfgNotification"] then return end
 Flashevents[event](self, ...);
end);
for k, v in pairs(Flashevents) do AltTabLfgNotification:RegisterEvent(k);  end



--------------------------------------------------------------------------- BarrelsOEasy
local BarrelsFrame = CreateFrame("Frame");
local SkullMarker = 8;
local CurrentMarker = SkullMarker;
local UsedMarkers = {};
local IsOnWorldQuest = false;
local BarrelQuests = {[45068]=true,[45069]=true,[45070]=true,[45071]=true,[45072]=true,};

BarrelsFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
BarrelsFrame:RegisterEvent("QUEST_ACCEPTED");
BarrelsFrame:RegisterEvent("QUEST_REMOVED");

BarrelsFrame:SetScript("OnEvent", function(self,event,arg1,arg2)
	if event == "PLAYER_ENTERING_WORLD" then
		if BarrelsOEasyShowMessageCount == nil then
			BarrelsOEasyShowMessageCount = 0;
		end
		local questLogCount = GetNumQuestLogEntries();
		for i = 1, questLogCount do
			local title, _, _, _, _, _, _, questID  = GetQuestLogTitle(i);
			if BarrelQuests[questID] then
				self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
				CurrentMarker = SkullMarker;
				IsOnWorldQuest = true;				
			end
		end
	elseif event == "QUEST_ACCEPTED" then
		if (arg1 and BarrelQuests[arg1]) or (arg2 and BarrelQuests[arg2]) then
			IsOnWorldQuest = true;
			
			if IsInGroup() then
				RaidNotice_AddMessage(RaidWarningFrame, "啊噢.你在队伍里会导致欢乐桶插件抽风", ChatTypeInfo["SYSTEM"]);
				DEFAULT_CHAT_FRAME:AddMessage("Sorry，在队伍你会导致每次点击欢乐桶后，标记都会因为刷新而消失.", 1.0, 0.0, 0.0, ChatTypeInfo["RAID_WARNING"], 6);
			end
			
			if BarrelsOEasyShowMessageCount < 5 then
				RaidNotice_AddMessage(RaidWarningFrame, "请开始第一轮,小桶子运动完才能开始标记。", ChatTypeInfo["RAID_WARNING"])
				BarrelsOEasyShowMessageCount = BarrelsOEasyShowMessageCount + 1;
			end
			self:RegisterEvent("UPDATE_MOUSEOVER_UNIT");
			CurrentMarker = SkullMarker;
		end
	elseif event == "QUEST_REMOVED" then
		if (arg1 and BarrelQuests[arg1]) or (arg2 and BarrelQuests[arg2]) then
			IsOnWorldQuest = false;
			self:UnregisterEvent("UPDATE_MOUSEOVER_UNIT");
			CurrentMarker = SkullMarker;
		end
	elseif event == "UPDATE_MOUSEOVER_UNIT" then
		local guid = UnitGUID("mouseover");	
		if guid ~= nil then
			local _,_,_,_,_,id,_ = strsplit("-", guid)
			if id == "115947" then
				if not UsedMarkers[guid] then
					UsedMarkers[guid] = CurrentMarker;
					CurrentMarker = CurrentMarker - 1;
					if CurrentMarker == 0 then CurrentMarker = SkullMarker; end end
					if GetRaidTargetIndex("mouseover") ~= UsedMarkers[guid] then
					SetRaidTarget("mouseover", UsedMarkers[guid]);
				end
			end
		end
	end
end)

--  CtrlIndicator    Author: 图图   --用途: 用于检测Ctrl是否卡住,Ctrl按下4.5秒之后就会提示
UIParent:CreateTexture("CtrlIndicatorBG");
CtrlIndicatorBG:SetPoint("TOP", 18, -100);
CtrlIndicatorBG:SetAtlas("OBJFX-BarGlow", true)
UIParent:CreateFontString("CtrlIndicatorText", "OVERLAY");
CtrlIndicatorText:SetPoint("TOP", 15, -112);
CtrlIndicatorText:SetFont(STANDARD_TEXT_FONT, 21,"OUTLINE")
CtrlIndicatorText:SetText("|cffffffff亲，你的Ctrl可能卡啦！检查下输入法。|r")
local ctrlCnt = 0;
C_Timer.NewTicker(0.1, function()
    if(IsControlKeyDown())then
        ctrlCnt=ctrlCnt+1
    else    
        ctrlCnt = 0
        CtrlIndicatorText:Hide();
    end
    if ctrlCnt==45 then
        print("|cffff0000亲，你的Ctrl可能卡啦！检查下输入法。|r")
        CtrlIndicatorText:Show();
    end
    if ctrlCnt > 45 then
        CtrlIndicatorBG:SetAlpha(0.69+math.sin((ctrlCnt%20)/20*2*3.1415926535898)/3.3333333);
    else
        CtrlIndicatorBG:SetAlpha(0);
    end
end)

local CrazyCatLady = CreateFrame("Frame") 
CrazyCatLady:RegisterEvent("UNIT_AURA") 
CrazyCatLady:RegisterEvent("PLAYER_DEAD")
CrazyCatLady:RegisterEvent("PLAYER_UNGHOST")

CrazyCatLady:SetScript("OnEvent", function(self, event, ...) 
  if not MaoRUISettingDB["Misc"]["CrazyCatLady"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_DEAD" then
		PlaySoundFile("Sound/creature/Auriaya/UR_Auriaya_Death01.ogg", "Master")
	elseif event == "PLAYER_UNGHOST" then
		StopMusic()
	end
end)