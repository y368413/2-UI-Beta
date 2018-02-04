local NextLimit = { 100, 500, 1000, 5000, 10000, 25000, 50000, 100000,250000,500000,1000000 }
local GetNextLimit = function(kills)
	for i =1, #NextLimit do
		if kills < NextLimit[i] then
			return NextLimit[i]
		elseif kills >= NextLimit[#NextLimit] then
			return
		end
	end
end
local oldKills = GetPVPLifetimeStats()
UIErrorsFrame:SetScript("OnUpdate",function(self,elapsed)
	self.nextUpdate = 0 + elapsed
	if self.nextUpdate > 1 then
		local newTime = GetTime()
		local newKills = GetPVPLifetimeStats()
		if newKills > oldKills then
			self:AddMessage(string.format(PVPPP_KILL_MSG, newKills, GetNextLimit(newKills)),1,1,0,1)
			oldKills = newKills
		elseif newKills == NextLimit[#NextLimit] then
			self:SetScript("OnUpdate",nil)
		end
		self.nextUpdate = 0
	end
end)
----------------------------------------------------------- KillingBlows---------------------------------------------------------
local KB_FILTER_ENEMY = bit.bor(
	COMBATLOG_OBJECT_AFFILIATION_PARTY,
	COMBATLOG_OBJECT_AFFILIATION_RAID,
	COMBATLOG_OBJECT_AFFILIATION_OUTSIDER,
	COMBATLOG_OBJECT_REACTION_NEUTRAL,
	COMBATLOG_OBJECT_REACTION_HOSTILE,
	COMBATLOG_OBJECT_CONTROL_PLAYER,
	COMBATLOG_OBJECT_TYPE_PLAYER
)
---------------------------------------------------------
local Killmsg = CreateFrame("MessageFrame", "KilledItMessageFrame", UIParent)
Killmsg:SetWidth(512);
Killmsg:SetHeight(200);
Killmsg:SetPoint("TOP", 0, -200, "CENTER", 0, 200);
Killmsg:SetHeight(44)
Killmsg:SetInsertMode("TOP")
Killmsg:SetFrameStrata("HIGH")
Killmsg:SetTimeVisible(1.0)
Killmsg:SetFadeDuration(0.7)
Killmsg:SetScale(1.1)
Killmsg:SetFont(STANDARD_TEXT_FONT, 30, "OUTLINE")

local KillingBlowsOnEvent = function(self, event, ...)
	if (event == "VARIABLES_LOADED") then self:UnregisterEvent("VARIABLES_LOADED")
	elseif (event == "COMBAT_LOG_EVENT_UNFILTERED") then
		local _, cmbEvent, _, sGUID, _, _, _, _, _, dFlag = select(1, ...)
		if (cmbEvent == "PARTY_KILL") then
			if (sGUID == UnitGUID("player") and CombatLog_Object_IsA(dFlag, KB_FILTER_ENEMY)) then
					PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\Sonar.ogg")
					Killmsg:AddMessage("KILLING BLOW!", 1, 0, 0)
				end
			end
		end
	end
---------------------------------------------------------
local KillingBlows = CreateFrame("Frame") --Frame, nil, UIParent
KillingBlows:RegisterEvent("VARIABLES_LOADED")
KillingBlows:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
KillingBlows:SetScript("OnEvent", KillingBlowsOnEvent)