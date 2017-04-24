local M, R, U, I = unpack(select(2, ...))

local tab = I.ReminderBuffs[I.MyClass]
if not tab then tab = {} end
local function OnEvent(self)
	if UnitLevel("player") < 10 then return end
	local group = tab[self.id]
	if not group.spells and not group.stance then return end
	if not GetActiveSpecGroup() then return end
	if group.level and UnitLevel("player") < group.level then return end

	self.icon:SetTexture(nil)
	self:Hide()
	if group.negate_spells then
		for buff, value in pairs(group.negate_spells) do
			if value == true then
				local name = GetSpellInfo(buff)
				if (name and UnitBuff("player", name)) then
					return
				end
			end
		end
	end

	if group.spells then
		for buff, value in pairs(group.spells) do
			if value == true then
				local usable, nomana = IsUsableSpell(buff)
				if (usable or nomana) then
					self.icon:SetTexture(GetSpellTexture(buff))
					break
				end
			end
		end
	end

	local role = group.role
	local tree = group.tree
	local requirespell = group.requirespell
	local combat = group.combat
	local personal = group.personal
	local instance = group.instance
	local pvp = group.pvp
	local reversecheck = group.reversecheck
	local negate_reversecheck = group.negate_reversecheck
	local rolepass, treepass, combatpass, instancepass, pvppass, requirepass
	local inInstance, instanceType = IsInInstance()

	if role and role ~= I.Role then
		rolepass = false
	else
		rolepass = true
	end

	if tree and tree ~= GetSpecialization() then
		treepass = false
	else
		treepass = true
	end

	if requirespell and not IsPlayerSpell(requirespell) then
		requirepass = false
	else
		requirepass = true
	end

	if combat and UnitAffectingCombat("player") then
		combatpass = true
	else
		combatpass = false
	end

	if instance and inInstance and (instanceType == "scenario" or instanceType == "party" or instanceType == "raid") then
		instancepass = true
	else
		instancepass = false
	end

	if pvp and (instanceType == "arena" or instanceType == "pvp" or GetZonePVPInfo() == "combat") then
		pvppass = true
	else
		pvppass = false
	end

	if not instance and not pvp then
		instancepass = true
		pvppass = true
	end
	--Prevent user error
	if reversecheck ~= nil and (role == nil and tree == nil) then reversecheck = nil end

	if group.spells then
		if treepass and rolepass and requirepass and (combatpass or instancepass or pvppass) and not (UnitInVehicle("player") and self.icon:GetTexture()) then	
			for buff, value in pairs(group.spells) do
				if value == true then
					local name = GetSpellInfo(buff)
					local _, _, icon, _, _, _, _, unitCaster, _, _, _ = UnitBuff("player", name)
					if personal and personal == true then
						if (name and icon and unitCaster == "player") then
							self:Hide()
							return
						end
					else
						if (name and icon) then
							self:Hide()
							return
						end
					end
				end
			end
			self:Show()
			M.CreateFS(self, 14, "缺少".." "..self.id, true, "BOTTOM", 0, -18)
		elseif (combatpass or instancepass or pvppass) and reversecheck and not (UnitInVehicle("player") and self.icon:GetTexture()) then
			if negate_reversecheck and negate_reversecheck == GetSpecialization() then self:Hide() return end
			for buff, value in pairs(group.spells) do
				if value == true then
					local name = GetSpellInfo(buff)
					local _, _, icon, _, _, _, _, unitCaster, _, _, _ = UnitBuff("player", name)
					if (name and icon and unitCaster == "player") then
						self:Show()
						M.CreateFS(self, 14, CANCEL.." "..self.id, true, "BOTTOM", 0, -18)
						return
					end	
				end
			end
		end
	end
end

local i = 0
for groupName, _ in pairs(tab) do
	i = i + 1
	local frame = CreateFrame("Frame", "ReminderFrame"..i, UIParent)
	frame:SetSize(42,42)
	frame:SetPoint("CENTER", UIParent, "CENTER", -220, 130)
	frame:SetFrameLevel(1)
	frame.id = groupName
	frame.icon = frame:CreateTexture(nil, "OVERLAY")
	frame.icon:SetTexCoord(unpack(I.TexCoord))
	frame.icon:SetAllPoints()
	frame:Hide()
	M.CreateSD(frame, 4, 4)

	frame:RegisterUnitEvent("UNIT_AURA", "player")
	frame:RegisterEvent("PLAYER_TALENT_UPDATE")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	frame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	frame:RegisterEvent("UNIT_ENTERING_VEHICLE")
	frame:RegisterEvent("UNIT_ENTERED_VEHICLE")
	frame:RegisterEvent("UNIT_EXITING_VEHICLE")
	frame:RegisterEvent("UNIT_EXITED_VEHICLE")
	frame:SetScript("OnEvent", function(self)
		if not MaoRUISettingDB["Auras"]["Reminder"] then return end
		OnEvent(self)
	end)
	frame:SetScript("OnUpdate", function(self, elapsed)
		if not self.icon:GetTexture() then
			self:Hide()
		end
	end)
	frame:SetScript("OnShow", function(self)
		if not self.icon:GetTexture() then
			self:Hide()
		end
	end)
end

----SonicReputation
local rep = {};
local function SR_Update()
	local numFactions = GetNumFactions(self);
	for i = 1, numFactions, 1 do
		local name, _, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild = GetFactionInfo(i);
		if name and (not isHeader) or (hasRep) then
			if not rep[name] then
				rep[name] = barValue;
			end
			
			local change = barValue - rep[name];
			if (change > 0) then
				rep[name] = barValue;
				local msg = string.format("%s: %+d (%d/%d)", name, change, barValue - barMin, barMax - barMin);
				
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
		end
	end
end
local SonicReputation = CreateFrame("Frame");
SonicReputation:RegisterEvent("UPDATE_FACTION");
SonicReputation:SetScript("OnEvent", SR_Update);
ChatFrame_AddMessageEventFilter("CHAT_MSG_COMBAT_FACTION_CHANGE", function() return true; end);
--------------ExaltedPlus
local rpt,f=ReputationParagonTooltip,CreateFrame('frame') f.a=0
f:RegisterEvent('QUEST_LOG_UPDATE') f:RegisterEvent('UPDATE_FACTION')
f:SetScript('OnEvent',function()
	for k in ReputationFrame.paragonFramesPool:EnumerateActive() do if k.factionID then
		local id,n=k.factionID,GetFactionInfoByID(k.factionID) f[n]=k
		if not f[id] or f[id].n~=n then f[id]={n=n,v=C_Reputation.GetFactionParagonInfo(id)} end
	end end
end)
f:SetScript('OnUpdate',function(s,e)
	if s.b then s.a=s.a-e else s.a=s.a+e end
	if s.a>=1 then s.a=1 s.b=true elseif s.a<=0 then s.a=0 s.b=false end
	if ReputationFrame:IsVisible() then for i=1,NUM_FACTIONS_DISPLAYED do
		if s[i] then _G['ReputationBar'..i..'ReputationBar']:SetStatusBarColor(0,1,0,s.a) end
	end end
	if s.w then ReputationWatchBar.StatusBar:SetStatusBarColor(0,1,0,s.a) end
end)
ChatFrame_AddMessageEventFilter('CHAT_MSG_COMBAT_FACTION_CHANGE',function(_,_,msg,...)
	local n,id,v=strmatch(msg,gsub(FACTION_STANDING_INCREASED_GENERIC,"%%%d?$?s","(.+)"))
	if f[n] then
		id,v=f[n].factionID,C_Reputation.GetFactionParagonInfo(f[n].factionID)
		if f[id] then if v-f[id].v~=0 then f[id].d=v-f[id].v f[id].v=v end
		msg=format(FACTION_STANDING_INCREASED,n.." +",f[id].d) end
	end
	return false,msg,...
end)
hooksecurefunc('EmbeddedItemTooltip_SetItemByQuestReward',function(t)
	if t==rpt.ItemTooltip and rpt.factionID and f[rpt.factionID] and f[rpt.factionID].c then
		local c=format(ARCHAEOLOGY_COMPLETION,f[rpt.factionID].c)
		rpt:AddLine(c) t.Tooltip:AddLine('\n') t.Tooltip:Show()
		for i=1,rpt:NumLines() do if _G[rpt:GetName()..'TextLeft'..i]:GetText()==c then
			_G[rpt:GetName()..'TextLeft'..i]:SetPoint('BOTTOMLEFT',0,-70)
		end end
	end
end)
hooksecurefunc('MainMenuBar_UpdateExperienceBars',function()
	local n,r,_,m,v,id,c=GetWatchedFactionInfo()
	if n and id and ReputationWatchBar:IsShown() then
		if (GetFriendshipReputation(id)) then r=5 end c=FACTION_BAR_COLORS[r]
		v,m,_,f.w=C_Reputation.GetFactionParagonInfo(id)
		if v and m then ReputationWatchBar.StatusBar:SetAnimatedValues(f.w and mod(v,m)+m or mod(v,m),0,m,r)
		ReputationWatchBar.OverlayFrame.Text:SetText(n.." "..(f.w and mod(v,m)+m or mod(v,m)).." / "..m) end
		if not f.w then ReputationWatchBar.StatusBar:SetStatusBarColor(c.r,c.g,c.b,1) end
	end
end)
hooksecurefunc('ReputationFrame_Update',function()
	for i=1,NUM_FACTIONS_DISPLAYED do
		local n,x,r,_,m,v,row,bar,_,_,_,_,_,id=GetFactionInfo(ReputationListScrollFrame.offset+i)
		if id and f[n] and f[id] then
			v,m,_,f[i]=C_Reputation.GetFactionParagonInfo(id)
			f[id].c=f[i] and math.modf(v/m)-1 or math.modf(v/m) v=f[i] and mod(v,m)+m or mod(v,m)
			x=f[i] and CONTRIBUTION_REWARD_TOOLTIP_TITLE or GetText("FACTION_STANDING_LABEL"..r,(UnitSex('player'))).." +"
			f[n].Check:SetShown(false)f[n].Glow:SetShown(false)f[n].Highlight:SetShown(false)f[n].Icon:SetAlpha(f[i] and 1 or .4)
			row=_G['ReputationBar'..i] row.rolloverText=' '..format(REPUTATION_PROGRESS_FORMAT,v,m) row.standingText=x
			bar=_G['ReputationBar'..i..'ReputationBar'] bar:SetMinMaxValues(0,m) bar:SetValue(v)
			_G['ReputationBar'..i..'ReputationBarFactionStanding']:SetText(x)
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
		PlaySound("ReadyCheck", "Master")
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
      UIErrorsFrame:AddMessage("背包空间只剩  "..BSCSpace.."  格了.",1,0,0,5)
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