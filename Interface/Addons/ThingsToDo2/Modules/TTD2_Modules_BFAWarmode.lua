ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
Achievement + quest checks related to BFA Warmode
]]

local super = Templates.UIButtonChatModule
Modules.BFAWarmode = super:new()
local this = Modules.BFAWarmode

this.Name = "[BFA] Warmode"
this.MapCacheData =
{
	[895] =		--Tiragarde
	{
		DQID = 55347,
		WPs =
		{
			[1] = {X = 0.7479, Y = 0.4444},
			[2] = {X = 0.7900, Y = 0.3700},
			[3] = {X = 0.8300, Y = 0.3600}
		}
	},
	[896] =		--Drustvar
	{
		DQID = 55375,
		WPs =
		{
			[1] = {X = 0.2967, Y = 0.4102},
			[2] = {X = 0.3380, Y = 0.4930},
			[3] = {X = 0.3370, Y = 0.4075},
			[4] = {X = 0.3000, Y = 0.3300}
		}
	},
	[942] =		--Stormsong
	{
		DQID = 55388,
		WPs =
		{
			[1] = {X = 0.4663, Y = 0.5657},
			[2] = {X = 0.4362, Y = 0.4825},
			[3] = {X = 0.4000, Y = 0.6200}
		}
	},
	[862] =		--Zuldazar
	{
		DQID = 55391,
		WPs =
		{
			[1] = {X = 0.7065, Y = 0.3750},
			[2] = {X = 0.7962, Y = 0.5142},
			[3] = {X = 0.8100, Y = 0.5500}
		}
	},
	[863] =		--Nazmir
	{
		DQID = 55387,
		WPs =
		{
			[1] = {X = 0.6011, Y = 0.1011},
			[2] = {X = 0.6869, Y = 0.1305},
			[3] = {X = 0.7889, Y = 0.1863}
		}
	},
	[864] =		--Voldun
	{
		DQID = 55389,
		WPs =
		{
			[1] = {X = 0.3360, Y = 0.4530},
			[2] = {X = 0.3860, Y = 0.5700},
			[3] = {X = 0.3600, Y = 0.5000}
		}
	}
}

function this:Initialise()

	local Faction = TTD2.Tools.Unit.PlayerFaction	
	local AchievementData =
	{
		[Faction.Neutral] =
		{
			[13317] = --Supplied and Ready
			{
				Type = 2,
				CriteriaMapIDs	=
				{
					[43931] = 896,	--drustvar
					[43932] = 863,	--nazmir
					[43933] = 942,	--stormsong
					[43934] = 895,	--tiragarde
					[43935]	= 864,	--voldun
					[43936] = 862	--zuldazar
				}
			}
		},
		[Faction.Alliance] =
		{
			[13402] = --Frontline Slayer(Alliance)
			{
				Type = 1
			},
			[13387] = --Frontline Veteran(Alliance)
			{
				Type = 3,
				CriteriaMapIDs	=
				{
					[44016] = 895,	--tiragarde
					[44017] = 942,	--stormsong
					[44018] = 896,	--drustvar
					[44019]	= 864,	--voldun
					[44020] = 863,	--nazmir
					[44021] = 862	--zuldazar
				}
			}
		},
		[Faction.Horde] =
		{
			[13403] = --Frontline Slayer(Horde)
			{
				Type = 1
			},
			[13388] = --Frontline Veteran(Horde)
			{
				Type = 3,
				CriteriaMapIDs	=
				{
					[44022] = 895,	--tiragarde
					[44023] = 863,	--nazmir
					[44024]	= 864,	--voldun
					[44025] = 862,	--zuldazar
					[44026] = 896,	--drustvar
					[44027] = 942	--stormsong
				}
			}
		}
	}
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	local function TransferData(Source)
		self.AchievementData = self.AchievementData or {}
		for AchID, AchData in pairs(Source) do
			if(self.AchievementData[AchID] ~= nil) then
				TTD2.Tools.Chat.Error("BFAWarmode:Initialise(), unexpected achievement-id collision: "..AchID)
			end
			
			self.AchievementData[AchID] = {}
			local CData = self.AchievementData[AchID]
			CData.Type				= AchData.Type
			CData.CriteriaMapIDs	= AchData.CriteriaMapIDs
		end
	end
	
	--create achievement table for current character
	TransferData(AchievementData[Faction.Neutral])
	TransferData(AchievementData[MyFaction])
		
	for AchID,AchData in pairs(self.AchievementData) do
		TTD2.Tools.Achievement:AddByID(AchID)
	end
	
	for MapID, CacheData in pairs(self.MapCacheData) do
		TTD2.Tools.Quest:AddByID(CacheData.DQID)
	end
	
	return
end

function this:PrepareData()
	self:Init()
	
	self.IncursionMapID = TTD2.Tools.Incursion:GetIncursionMapID()
	
	for AchID,AchData in pairs(self.AchievementData) do
		TTD2.Tools.Achievement:UpdateByID(AchID)
	end
	
	for MapID, CacheData in pairs(self.MapCacheData) do
		TTD2.Tools.Quest:UpdateByID(CacheData.DQID)
	end
	
	return
end

function this:Output_1()
	self:Init()
	
	--[[
	this type does not have criteria and all we need to update is the doable state
	]]
	
	if(self.IncursionMapID ~= nil) then
		self.Current.CriteriaToDo = true
	end
	
	return
end

function this:Output_2()
	self:Init()
	
	--[[
	the criteria of these achievements are Incursion MapIDs.
	
	for this achievement you need to collect a supply crate in each zone; the crates are valuable to collect later again as well.
	therefore we will check the daily lockout quest for them and if they still can be collected, we will print the objective with
	"Rare" status AND print TomTom liks for the possible spawn points.
	]]
	
	self.Current.AchToDoStatus = self.Out.Status.Rare
	
	for CritID, MapID in pairs(self.Current.AchData.CriteriaMapIDs) do
		local CritInfo = self.Current.AchInfo.CriteriaByID[CritID]
		local Status = self.Out.Status.Done
		
		local DependentLine = self.Current.AchLinkLine
		local PrintWPs = false
		
		if(MapID == self.IncursionMapID) then
			if(CritInfo.IsCompleted == true) then
				--we already collected this cache once, but maybe we can do so again?
				local QuestInfo = TTD2.Tools.Quest:GetByID(self.MapCacheData[self.IncursionMapID].DQID)
				if(QuestInfo.IsCompleted == true) then
					--we collected this cache today, there is nothing more to do
					Status = self.Out.Status.Completed
				else
					--we can try and collect the cache now!
					Status = self.Out.Status.Rare
					DependentLine = nil
					PrintWPs = true
				end
			else
				--since we never collected the cache the daily is unimportant
				Status = self.Out.Status.Rare
				PrintWPs = true
				self.Current.CriteriaToDo = true
			end
		end
		
		local SecretCacheText = "Loot the Secret Supply Chest in "..TTD2.Tools.Map:GetNameByID(MapID)
		local CacheLine = self.Out:AddLine(Status, SecretCacheText, DependentLine)
		if(PrintWPs == true) then
			for Index, WP in ipairs(self.MapCacheData[MapID].WPs) do
				self.Out:AddLine(Status, TTD2.Tools.TomTom:CreateLink(MapID, WP.X, WP.Y, "Possible Cache location #"..Index), CacheLine)
			end
		end
		
	end
	
	return
end

function this:Output_3()
	self:Init()
	
	--[[
	the criteria of these achievements are Incursion MapIDs.
	]]
	
	for CritID, MapID in pairs(self.Current.AchData.CriteriaMapIDs) do
		local CritInfo = self.Current.AchInfo.CriteriaByID[CritID]
		local Status = self.Out.Status.Done
		if(CritInfo.IsCompleted == true) then
			Status = self.Out.Status.Completed
		else
			if(MapID == self.IncursionMapID) then
				self.Current.CriteriaToDo = true
				Status = self.Out.Status.ToDo
			end
		end
		self.Out:AddLine(Status, TTD2.Tools.Map:GetNameByID(MapID)..": "..CritInfo.Name, self.Current.AchLinkLine)
	end
	
	return
end

function this:CreateOutput()
	self:Init()
	
	if(TTD2.Tools.Warmode:IsWarmodeTracked() == false) then
		return
	end
	
	self.Out = TTD2.Tools.Output
	
	local WarmodeWarningLine = nil
	if(TTD2.Tools.Warmode:IsWarmodeActive() == false) then
		WarmodeWarningLine = self.Out:AddLine(self.Out.Status.Ignored, TTD2.Tools.Chat:Red("WARNING")..": you must enable Warmode to complete any of these tasks!")
	end
	
	local TimeLeftLine = nil
	if(self.IncursionMapID ~= nil) then
		local TimeLeftMinutes = TTD2.Tools.Incursion:GetTimeLeftMinutes()
		TimeLeftLine = self.Out:AddLine(self.Out.Status.Ignored, TTD2.Tools.Map:GetNameByID(self.IncursionMapID).." "..TTD2.Tools.ComplexChat:CreateTimeLeftHoursStringFromTimeLeftMinutes(TimeLeftMinutes))
	end
	
	--check the achievement(s)
	self.Current = self.Current or {}
	for AchID, AchData in pairs(self.AchievementData) do
		self.Current.AchID			= AchID
		self.Current.AchData		= AchData
		self.Current.AchInfo		= TTD2.Tools.Achievement:GetByID(AchID)
		self.Current.AchLinkLine	= self.Out:AddLine(self.Out.Status.Completed, self.Current.AchInfo.Link)
		self.Current.AchToDoStatus	= self.Out.Status.ToDo
		
		self.Current.CriteriaToDo	= false
		
		local Function = AchData.Type or AchID		
		Function = "Output_"..Function
		self[Function](self)
		
		if(self.Current.AchInfo.IsCompleted == false) then
			if(self.Current.CriteriaToDo == false) then
				self.Out:ChangeLine(self.Current.AchLinkLine, self.Out.Status.Done)
			else
				self.Out:ChangeLine(self.Current.AchLinkLine, self.Current.AchToDoStatus)
			end
		end		
	end
	
	--if there was any content added, make the WarmodeWarningLine and TimeRemainingLine visible
	if(self.Out:GetNumVisibleLines() > 0) then
		if(WarmodeWarningLine ~= nil) then
			self.Out:ChangeLine(WarmodeWarningLine, self.Out.Status.ToDo)
		end
		
		if(TimeLeftLine ~= nil) then
			self.Out:ChangeLine(TimeLeftLine, self.Out.Status.ToDo)
		end
	end
	
	return
end
