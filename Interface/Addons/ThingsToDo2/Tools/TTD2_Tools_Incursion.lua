ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
methods + constants related to BFA incursions
]]

local super = Templates.Initialised
Tools.Incursion = super:new()
local this = Tools.Incursion

function this:Initialise()
	
	local MyFaction = Tools.Unit:GetPlayerFaction()
	if(MyFaction == Tools.Unit.PlayerFaction.Alliance) then
		self.IncursionZoneQuests =
		{
			[895] = { 53812, 54182, 53951, 53699, 53726, 53704, 53784, 52475, 53772 },	--tiragarde
			[942] = { 54647, 53804, 53768, 53771, 53717, 54266, 53706, 53724, 53753, 53712 },	--stormsong
			[896] = { 53714, 54143, 54662, 54665, 54449, 53867, 54507, 54089, 54666, 54471, 54488 },	--drustvar
			[864] = { 54245, 54272, 54638, 54254, 54574, 54127, 54188, 54555, 54786, 54014, 54554 },	--voldun
			[863] = { 54684, 54533, 54691, 54512, 54680, 54839, 54663, 54539, 54500, 54020 },	--nazmir
			[862] = { 54537, 54524, 54513, 54511, 54298, 54508, 54712, 54498, 54515, 54017 }	--zuldazar
		}
	elseif(MyFaction == Tools.Unit.PlayerFaction.Horde) then
		self.IncursionZoneQuests =
		{
			[895] = { 54257, 53808, 53950, 54119, 54268, 53759, 54112, 54091, 53713 },	--tiragarde
			[942] = { 54442, 53878, 53769, 54414, 54328, 54308, 54468, 54437, 53752, 54434 },	--stormsong
			[896] = { 54681, 54448, 54506, 54689, 54686, 54472, 54011, 54711 },	--drustvar
			[864] = { 54246, 54644, 54273, 54253, 54189, 54643, 54649, 54645, 54646, 54170, 54154, 54415 },	--voldun
			[863] = { 54664, 54699, 54502, 54697, 54671, 53886, 54707, 54538, 54534, 54503, 54700 },	--nazmir
			[862] = { 54016, 54516, 54527, 54505, 54162, 54535, 54532, 54522, 54685, 54701 }	--zuldazar
		}
	end
	
end

function this:GetTimeLeftMinutes()
	self:Init()
	
	--check if there is an active incursion stored
	if(Tools.SavedData:GetAccountValue("IncursionActive") == true) then
		--check if this stored incursion is still valid by comparing timestamps
		local CurrentTime = C_DateAndTime.GetServerTimeLocal()
		local IncursionEndTime = Tools.SavedData:GetAccountValue("IncursionEndTime")
		local IncursionMap = Tools.SavedData:GetAccountValue("IncursionMap")
		
		if(CurrentTime < IncursionEndTime) then
			return ((IncursionEndTime - CurrentTime)/60.0)
		else
			--this stored incursion is outdated, invalidate it
			Tools.SavedData:SetAccountValue("IncursionActive", false)
		end
	end
	
	return 0
end

function this:GetIncursionMapID()
	self:Init()
	
	--our faction/level is invalid
	if(self.IncursionZoneQuests == nil) then
		return nil
	end
	
	if(self:GetTimeLeftMinutes() > 0) then
		--the stored incursionmap ist still valid
		return Tools.SavedData:GetAccountValue("IncursionMap")
	end
	
	--perform a check based on currently available worldquests
	for MapID, WQIDs in pairs(self.IncursionZoneQuests) do
		for _,WQID in pairs(WQIDs) do
			if(Tools.WorldQuest:IsActiveByID(WQID) == true) then
				--store this incursion to account-data
				local CurrentTime = C_DateAndTime.GetServerTimeLocal()
				local IncursionEndTime = CurrentTime + (Tools.WorldQuest:GetTimeLeftMinutesByID(WQID)*60)
				Tools.SavedData:SetAccountValue("IncursionActive", true)
				Tools.SavedData:SetAccountValue("IncursionEndTime", IncursionEndTime)
				Tools.SavedData:SetAccountValue("IncursionMap", MapID)
				return MapID
			end
		end
	end
	
	return nil
end

