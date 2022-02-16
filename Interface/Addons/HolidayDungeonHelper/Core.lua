local _, ns = ...
local Addon = ns.Addon
local L = ns.L

function Addon:QueueDungeon(dungeonID)
	if self.db.profile.allRoles then
		SetLFGRoles(true, true, true, true)
	end

	if not self.db.profile.autoQueue then return end

	if GetLFGMode(LE_LFG_CATEGORY_LFD) then
		Addon:Error(L["You are already in the queue"])
	else
		_G.LFDQueueFrame.type = dungeonID
		_G.LFDQueueFrameFindGroupButton:Click()
		Addon:Print(QUEUED_FOR_SHORT.." "..GetLFGDungeonInfo(dungeonID))
	end
end

function Addon:OnEnable()
	_G.LFGDungeonReadyDialog:HookScript("OnShow", function(self)
		if _G.LFGDungeonReadyPopup.dungeonID and Addon.dungeonID and (_G.LFGDungeonReadyPopup.dungeonID == Addon.dungeonID) then
			self.enterButton:Click()
		end
	end)

	self:RegisterEvent("LFG_UPDATE_RANDOM_INFO")
end

function Addon:LFG_UPDATE_RANDOM_INFO(event)
	for i = 1, GetNumRandomDungeons() do
		local id = GetLFGRandomDungeonInfo(i)
		if id and ns.HolidayDungeons[id] then
			self.dungeonID = id
			break
		end
	end

	local info = self.dungeonID and ns.HolidayDungeons[self.dungeonID]
	if info and self.db.profile[info.name] then
		local doneToday = GetLFGDungeonRewards(self.dungeonID)
		if not doneToday then
			local rewardID = select(6, GetLFGDungeonRewardInfo(self.dungeonID, 1))
			if rewardID and rewardID == info.rewardID then
				self:QueueDungeon(self.dungeonID)
				self:RegisterEvent("LFG_COMPLETION_REWARD")
			end
		end
	end

	self:UnregisterEvent(event)
end

function Addon:LFG_COMPLETION_REWARD(event)
	if self.db.profile.autoLeave then
		local delay = self.db.profile.autoLeaveDelay

		C_Timer.After(delay, function()
			C_PartyInfo.LeaveParty()
		end)
	end

	self:UnregisterEvent(event)
end