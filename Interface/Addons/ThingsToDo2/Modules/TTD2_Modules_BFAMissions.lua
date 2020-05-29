ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
this module checks if one of the available table missions is still missing for the achievement to complete all of them once.
]]

local super = TTD2.Templates.UIButtonChatModule
Modules.BFAMissions = super:new()
local this = Modules.BFAMissions

this.Name = "[BFA] Table-Missions"

function this:Initialise()

	self.AchCritToMissionID =
	{
		[12867] = 
		{
			[41096] = 1929,
			[41097] = 1923,
			[41098] = 1934,
			[41099] = 1935,
			[41100] = 1879,
			[41101] = 1959,
			[41102] = 1937,
			[41103] = 1936,
			[41104] = 1943,
			[41105] = 1951,
			[41106] = 1944,
			[41107] = 1955,
			[41108] = 1956
		},
		[12869] =
		{
			[41163] = 1921,
			[41164] = 1922,
			[41165] = 1927,
			[41166] = 1928,
			[41167] = 1932,
			[41168] = 1933,
			[41169] = 1941,
			[41170] = 1942,
			[41171] = 1946,
			[41172] = 1949,
			[41173] = 1950,
			[41174] = 1952,
			[41175] = 1953
		},
		[12870] =
		{
			[41202] = 1919,
			[41203] = 1920,
			[41204] = 1925,
			[41205] = 1926,
			[41206] = 1930,
			[41207] = 1931,
			[41208] = 1938,
			[41209] = 1939,
			[41210] = 1940,
			[41211] = 1945,
			[41212] = 1947,
			[41213] = 1948,
			[41214] = 1954
		},
		[12896] =
		{
			[41140] = 1885,
			[41141] = 1886,
			[41139] = 1890,
			[41142] = 1891,
			[41143] = 1896,
			[41144] = 1897,
			[41145] = 1898,
			[41146] = 1899,
			[41147] = 1905,
			[41148] = 1906,
			[41149] = 1913,
			[41150] = 1917,
			[41151] = 1918
		},
		[12898] =
		{
			[41176] = 1883,
			[41177] = 1884,
			[41178] = 1888,
			[41179] = 1889,
			[41180] = 1894,
			[41181] = 1895,
			[41182] = 1903,
			[41183] = 1904,
			[41184] = 1909,
			[41185] = 1911,
			[41186] = 1912,
			[41187] = 1914,
			[41188] = 1915
		},
		[12899] =
		{
			[41189] = 1858,
			[41190] = 1866,
			[41191] = 1882,
			[41192] = 1887,
			[41193] = 1892,
			[41194] = 1893,
			[41195] = 1900,
			[41196] = 1901,
			[41197] = 1902,
			[41198] = 1907,
			[41199] = 1908,
			[41200] = 1910,
			[41201] = 1916
		}
	}
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	self.AchievementIDs = {}
	if(MyFaction == TTD2.Tools.Unit.PlayerFaction.Alliance) then
		self.AchievementIDs[1] = 12896
		self.AchievementIDs[2] = 12898
		self.AchievementIDs[3] = 12899
	elseif(MyFaction == TTD2.Tools.Unit.PlayerFaction.Horde) then
		self.AchievementIDs[1] = 12867
		self.AchievementIDs[2] = 12869
		self.AchievementIDs[3] = 12870
	end
	
	--if the player is neither alliance nor horde, the achievement table will be empty and no missions will be checked
	
	for _,ID in pairs(self.AchievementIDs) do
		TTD2.Tools.Achievement:AddByID(ID)
	end
	
	return
end

function this:GetAvailableMissionByID(MissionID)
	self:Init()
	
	for _,Mission in pairs(self.AllMissions) do
		if(Mission.ID == MissionID) then
			return Mission
		end
	end
	
	return nil
end

function this:CreateOutput()
	self:Init()
	
	for _,ID in pairs(self.AchievementIDs) do
		TTD2.Tools.Achievement:UpdateByID(ID)
	end
	
	TTD2.Tools.Garrison:UpdateMissionsBFA()
	self.AllMissions = TTD2.Tools.Garrison:GetMissionsBFA()	

	local Out = TTD2.Tools.Output
	
	--test if this character has access to missions
	if(self.AllMissions == nil) then
		return
	end
	
	for _,AchID in pairs(self.AchievementIDs) do
		local AchData = TTD2.Tools.Achievement:GetByID(AchID)
		
		--write a placeholder ach-link that may be updated later
		local AchLinkLine = nil
		AchLinkLine = Out:AddLine(Out.Status.Completed, AchData.Link)
		
		local AnyCritDone = false
		local AnyCritToDo = false
		for CritID,CritData in pairs(AchData.CriteriaByID) do
			if(CritData.IsCompleted == true) then
				Out:AddLine(Out.Status.Completed, CritData.Name, AchLinkLine)
			else
				--check if this mission is up
				local Mission = self:GetAvailableMissionByID(self.AchCritToMissionID[AchID][CritID])
				if(Mission == nil) then
					Out:AddLine(Out.Status.Done, CritData.Name, AchLinkLine)
					AnyCritDone = true
				else
					Out:AddLine(Out.Status.ToDo, Mission.Name, AchLinkLine)
					AnyCritToDo = true
				end
			end
		end
		
		--now update the achLink; todo supersedes done, done supersedes completed, completed was already set as placeholder
		if(AnyCritToDo == true) then
			Out:ChangeLine(AchLinkLine, Out.Status.ToDo)
		elseif(AnyCritDone == true) then
			Out:ChangeLine(AchLinkLine, Out.Status.Done)
		end
	end
end
