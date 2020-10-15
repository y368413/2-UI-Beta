ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[
we try to organise the BFA WQ Achievements in some "generic" fashion, but there are different types of combinations of
criteria:
Case 1
	OneTime + Possible WQ(s)
	
	Can be done during a OneTimeQuest or while any of the possible WQs is up; OneTimeQuest may be nil
Case 2
	Criteria = WQs
	
	The criteria of these achievements are worldquest IDs. You must complete all
	of them to earn the achievement.
Case 3
	Criteria = some WQs
	
	like 3, but the Achievement has other Criteria that are not WQs
Case 4
	Incursion
	
	the criteria are MapIDs where you still have to finish an Incursion
	
while 2+3 are very similar, the output conditions are very different

Update:
There is no difference in the output function between 2+3; the only possible difference would be
if checking all criteria as completed would set the Ach-Link to completed and my output-function
does not do that.
2+3 merged,
4 renamed 3

Update2:
Sabertron is actually more complicated than i thought. The final Criteria (red) can only be completed
while NONE of the WQs are up.
Instead of defining a new number for it i will make a specialised function for this achievement.

]]

local super = Templates.UIButtonChatModule
Modules.BFAWQAchievements = super:new()
local this = Modules.BFAWQAchievements

this.Name = "[BFA] Worldquest-Achievements"

function this:Initialise()
	
	local Faction = TTD2.Tools.Unit.PlayerFaction	
	local AchievementData =
	{
		[Faction.Neutral] =
		{
			[13054] = --Sabertron Assemble
			{
				--Type = special
				CriteriaWQIDs	=
				{
					[41421] = 51977,	--yellow
					[41422] = 51978,	--orange
					[41423] = 51976,	--green
					[41424] = 51974		--copper
				},
				RedCriteria = { ID = 41420, MapID = 942, PosX = 0.3388, PosY = 0.3188 }
			},
			[12940] = --Adventurer of Stormsong Valley
			{
				Type = 2,
				CriteriaWQIDs = { [41841] = 52299 }
			},
			[13690] = --Nazjatarget Eliminated
			{
				Type = 2,
				CriteriaWQIDs =
				{
					[45504] = 55897,	--Szun, Breaker of Slaves
					[45505] = 55895,	--Frozen Winds of Zhiela
					[45506] = 55894,	--Zoko, Her Iron Defender
					[45507] = 55898,	--Tempest-Speaker Shalan'ali
					[45508] = 55899,	--Starseeker of the Shirakess
					[45509] = 55893,	--Azanz, the Slitherblade
					[45510] = 55896,	--Undana, Chilling Assassin
					[45511] = 55900,	--Kassar, Wielder of Dark Blades
					[45512] = 55886,	--The Zanj'ir Brutalizer
					[45513] = 55891,	--Champion Aldrantiss, Defender of Her Kingdom
					[45514] = 55887,	--Champion Alzana, Arrow of Thunder
					[45515] = 55892,	--Champion Eldanar, Shield of Her Glory
					[45516] = 55889,	--Champion Kyx'zhul the Deepspeaker
					[45517] = 55888,	--Champion Qalina, Spear of Ice
					[45518] = 55890		--Champion Vyz'olgo the Mind-Taker
				}
			},
			[13764] = --Puzzle Performer
			{
				Type = 2,
				CriteriaWQIDs =
				{
					[45847] = 56025,	--Easy Leylocked Chest
					[45848] = 56024,	--Medium Leylocked Chest
					[45849] = 56023,	--Hard Leylocked Chest
					[45850] = 56022,	--Hard Runelocked Chest: Yellow
					[45851] = 56021,	--Hard Runelocked Chest: Red
					[45852] = 56020,	--Hard Runelocked Chest: Purple
					[45853] = 56019,	--Hard Runelocked Chest: Orange
					[45854] = 56018,	--Hard Runelocked Chest: Green
					[45855] = 56017,	--Hard Runelocked Chest: Blue
					[45856] = 56016,	--Medium Runelocked Chest: Yellow
					[45857] = 56015,	--Medium Runelocked Chest: Red
					[45858] = 56014,	--Medium Runelocked Chest: Purple
					[45859] = 56013,	--Medium Runelocked Chest: Orange
					[45860] = 56012,	--Medium Runelocked Chest: Green
					[45861] = 56011,	--Medium Runelocked Chest: Blue
					[45862] = 56010,	--Easy Runelocked Chest: Blue
					[45863] = 56009,	--Easy Runelocked Chest: Purple
					[45864] = 56008,	--Easy Runelocked Chest: Yellow
					[45865] = 56007,	--Easy Runelocked Chest: Red
					[45866] = 56006,	--Easy Runelocked Chest: Orange
					[45867] = 56003		--Easy Runelocked Chest: Green
				}
			}
		},
		[Faction.Alliance] =
		{
			[13023] = --It's Really Getting Out of Hand
			{
				Type = 1,
				WQIDs = { 51127 }
			},
			[13035] = --By de Power of de Loa!
			{
				Type = 1,
				WQIDs = { 51178 }
			},
			[13059] = --Drag Race
			{
				Type = 1,
				OTQID = 48088,
				WQIDs = { 53346 }
			},
			[13060] = --Kul Runnings
			{
				Type = 2,
				CriteriaWQIDs	=
				{
					[41764] = 49994,
					[41766] = 53188,
					[41768] = 53189
				}
			},
			[13026] = --7th Legion Spycatcher
			{
				Type = 1,
				WQIDs = { 50899 }
			},
			[13042] = --About To Break
			{
				Type = 1,
				OTQID = 53099,
				WQIDs = { 53106, 53107, 53108 },
			},
			[13050] = --Bless the Rains Down in Freehold
			{
				Type = 1,
				OTQID = 49403,
				WQIDs = { 52159 },
				CriteriaWPs =
				{
					[41662] = { MapID = 895, PosX = 0.7615, PosY = 0.8460 },	--Banana Hoard
					[41663] = { MapID = 895, PosX = 0.7338, PosY = 0.8392 },	--Sweete's Feast
					[41664] = { MapID = 895, PosX = 0.7505, PosY = 0.8294 },	--Cart o' Cutlasses
					[41665] = { MapID = 895, PosX = 0.7669, PosY = 0.8180 }		--Blacktooth Brew
				}
			},
			[13283] = --Frontline Warrior(Incursion)
			{
				Type = 3,
				CriteriaMapIDs	=
				{
					[43630] = 895,	--tiragarde
					[43680] = 942,	--stormsong
					[43637] = 896,	--drustvar
					[43681]	= 864,	--voldun
					[43682] = 863,	--nazmir
					[43683] = 862	--zuldazar
				}
			},
			[13426] = --Come On and Slam(Incursion)
			{
				Type = 1,
				WQIDs = { 54512 }
			},
			[13440] = --Pushing the Payload(Incursion)
			{
				Type = 1,
				WQIDs = { 54498 }
			},
			[13285] = --Upright Citizens(Incursion)
			{
				--no type intended, special
				WQIDs = { 53704 },
				CriteriaWPs =
				{
					[43718] = { MapID = 1161, PosX = 0.7234, PosY = 0.6903 },	--Russel the Bard recruited
					[43719] = { MapID = 1161, PosX = 0.7227, PosY = 0.6164 },	--Flynn Fairwind recruited
					[43720] = { MapID = 1161, PosX = 0.6679, PosY = 0.6415 }	--Leeroy Jenkins recruited
				}
			},
			[13512] = --Master Calligrapher(Alliance)
			{
				Type = 2,
				CriteriaWQIDs	=
				{
					[44853] = 55340,	--circle
					[44854] = 55264,	--square
					[44855] = 55341		--triangle
				}
			}
		},
		[Faction.Horde] =
		{
			[13023] = --It's Really Getting Out of Hand
			{
				Type = 1,
				WQIDs = { 50559 }
			},
			[13025] = --Zandalari Spycatcher
			{
				Type = 1,
				WQIDs = { 50717 }
			},
			[13009] = --Adept Sandfisher
			{
				Type = 1,
				WQIDs = { 51173 }
			},
			[13021] = --A Most Efficient Apocalypse
			{
				Type = 1,
				WQIDs = { 50665 }
			},
			[13022] = --Revenge is Best Served Speedily
			{
				Type = 1,
				WQIDs = { 50786 }
			},
			[13041] = --Hungry, Hungry Ranishu
			{
				Type = 1,
				OTQID = 51991,
				WQIDs = { 52798 }
			},
			[13014] = --Vorrik's Champion
			{
				Type = 2,
				CriteriaWQIDs	=
				{
					[41356] = 51975,
					[41357] = 51983
				}
			},
			[13035] = --By de Power of de Loa!
			{
				Type = 1,
				WQIDs = { 51232 }
			},
			[13042] = --About To Break
			{
				Type = 1,
				OTQID = 53099,
				WQIDs = { 53343, 53344, 53345 }
			},
			[13050] = --Bless the Rains Down in Freehold
			{
				Type = 1,
				WQIDs = { 53196 },
				CriteriaWPs =
				{
					[41662] = { MapID = 895, PosX = 0.7615, PosY = 0.8460 },	--Banana Hoard
					[41663] = { MapID = 895, PosX = 0.7338, PosY = 0.8392 },	--Sweete's Feast
					[41664] = { MapID = 895, PosX = 0.7505, PosY = 0.8294 },	--Cart o' Cutlasses
					[41665] = { MapID = 895, PosX = 0.7669, PosY = 0.8180 }		--Blacktooth Brew
				}
			},
			[13284] = --Frontline Warrior(Incursion)
			{
				Type = 3,
				CriteriaMapIDs	=
				{
					[43642] = 895,	--tiragarde
					[43688] = 942,	--stormsong
					[43687] = 896,	--drustvar
					[43685]	= 864,	--voldun
					[43684] = 863,	--nazmir
					[43686] = 862	--zuldazar
				}
			},
			[13441] = --Pushing the Payload(Incursion)
			{
				Type = 1,
				WQIDs = { 54505 }
			},
			[13435] = --Doomsoul Surprise(Incursion)
			{
				Type = 1,
				WQIDs = { 54689 }
			},
			[13437] = --Scavenge like a Vulpera(Incursion)
			{
				Type = 1,
				WQIDs = { 54415 }
			},
			[13512] = --Master Calligrapher(Horde)
			{
				Type = 2,
				CriteriaWQIDs	=
				{
					[44853] = 55342,	--circle
					[44854] = 55343,	--square
					[44855] = 55344		--triangle
				}
			}
		}
	}
	
	
	local MyFaction = TTD2.Tools.Unit:GetPlayerFaction()
	local function TransferData(Source)
		self.AchievementData = self.AchievementData or {}
		for AchID, AchData in pairs(Source) do
			if(self.AchievementData[AchID] ~= nil) then
				TTD2.Tools.Chat.Error("BFAWQAchievements:Initialise(), unexpected achievement-id collision: "..AchID)
			end
			
			self.AchievementData[AchID] = AchData
		end
	end
	
	--create achievement table for current character
	TransferData(AchievementData[Faction.Neutral])
	TransferData(AchievementData[MyFaction])
		
	for AchID,AchData in pairs(self.AchievementData) do
		TTD2.Tools.Achievement:AddByID(AchID)
		if(AchData.OTQID ~= nil) then
			TTD2.Tools.Quest:AddByID(AchData.OTQID)
		end
	end
	
	return
end

function this:OutputCriteriaWPs(OverrideMissingWaypointStatus)
	self:Init()
	
	if(self.Current.AchData.CriteriaWPs == nil) then
		return
	end
	
	for CritID, WP in pairs(self.Current.AchData.CriteriaWPs) do
		local Status = OverrideMissingWaypointStatus or self.Out.Status.ToDo
		if(self.Current.AchInfo.CriteriaByID[CritID].IsCompleted == true) then
			Status = self.Out.Status.Completed
		end
		local Text = TTD2.Tools.TomTom:CreateLink(WP.MapID, WP.PosX, WP.PosY, self.Current.AchInfo.CriteriaByID[CritID].Name)
		self.Out:AddLine(Status, Text, AchLinkLine)
	end
end

function this:Output_1(OverrideMissingWaypointStatus)
	self:Init()
	
	--[[
	for these achievements there is only ONE criteria, which may either be done during a one-time-quest
	(may be nil) or one/several WQs.
	There may also be a WaypointTable mapping a waypoint to each crteria
	]]

	local AnythingToDo = false
	
	--first check the WQs
	for _,WQID in pairs(self.Current.AchData.WQIDs) do
		TTD2.Tools.ComplexChat:AddWQStatusLine(
			WQID,
			self.Current.AchLinkLine)
		if(TTD2.Tools.WorldQuest:IsActiveByID(WQID) == true) then
			self.Current.CriteriaToDo = true
		end
	end
	
	--try one-time-quest now
	if(self.Current.AchData.OTQID ~= nil) then
		local OTQInfo = TTD2.Tools.Quest:GetByID(self.Current.AchData.OTQID)
		if(OTQInfo.IsCompleted == false) then
			self.Current.CriteriaToDo = true
			self.Out:AddLine(
				self.Out.Status.ToDo,
				"Doable while on/before completing regular Quest: "..OTQInfo.Link,
				self.Current.AchLinkLine)
		else
			self.Out:AddLine(
				self.Out.Status.Done,
				"Regular Quest completed: "..OTQInfo.Link,
				self.Current.AchLinkLine)
		end
	end
	
	if(self.Current.CriteriaToDo == true) then
		--print waypoints if available
		self:OutputCriteriaWPs()
	else
		--no WQ up, so the incomplete WPs will use "done"
		OverrideMissingWaypointStatus = OverrideMissingWaypointStatus or self.Out.Status.Done
		self:OutputCriteriaWPs(
			OverrideMissingWaypointStatus)
	end
end

function this:Output_2()
	self:Init()
	
	--[[
	all of the criteria are worldquests and all of them have to be done to complete the achievement.
	the achievement may have more criteria than these WQs,  though, which do not concern us here.
	we will consider the status of the achievement as "ToDo" even if there is just one WQ up
	when multiple criteria are missing, even though strictly speaking this would be a "Done"
	status.
	we can use this output function for the sabertron one easily if we just return whether there
	are any WQs up at all. this information is not useful for this function itself, but it does not
	harm it either.
	]]
	
	
	local AnythingActive = false --we use this for the saberon achievement
	
	for CritID, WQID in pairs(self.Current.AchData.CriteriaWQIDs) do
		local WQActive = TTD2.Tools.WorldQuest:IsActiveByID(WQID)
		if(WQActive == true) then
			AnythingActive = true
		end
		local CritInfo = self.Current.AchInfo.CriteriaByID[CritID]
		if(CritInfo.IsCompleted == true) then
			self.Out:AddLine(
				self.Out.Status.Completed,
				CritInfo.Name,
				self.Current.AchLinkLine)
		else
			if(WQActive == true) then
				self.Current.CriteriaToDo = true
			end
			TTD2.Tools.ComplexChat:AddWQStatusLine(
				WQID,
				self.Current.AchLinkLine,
				CritInfo.Name)
		end
	end
	return AnythingActive
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
			if(MapID == TTD2.Tools.Incursion:GetIncursionMapID()) then
				self.Current.CriteriaToDo = true
				Status = self.Out.Status.ToDo
			end
		end
		self.Out:AddLine(Status, TTD2.Tools.Map:GetNameByID(MapID)..": "..CritInfo.Name, self.Current.AchLinkLine)
	end
end

function this:Output_13054() --Sabertron Assemble
	self:Init()
	
	--use the Type_2 output function to get output for the 5 WQ-only-colors
	local AnythingActive = self:Output_2()
	
	local CritData	= self.Current.AchData.RedCriteria
	local CritInfo	= self.Current.AchInfo.CriteriaByID[CritData.ID]
	local Text		= CritInfo.Name
	local Status	= self.Out.Status.Completed
	
	if(CritInfo.IsCompleted == false) then
		if(AnythingActive == true) then
			Status = self.Out.Status.Done
		else
			self.Current.CriteriaToDo = true
			Text = TTD2.Tools.TomTom:CreateLink(CritData.MapID, CritData.PosX, CritData.PosY, CritInfo.Name)
			Status = self.Out.Status.ToDo
		end
	end
	self.Out:AddLine(Status, Text, self.Current.AchLinkLine)
end

function this:Output_13285() --Upright Citizens
	self:Init()
	
	--the only change compared to Output_1() is using "rare" for the missing waypoint-criteria table entries
	self:Output_1(self.Out.Status.Rare)
end

function this:CreateOutput()
	self:Init()
	
	local MyLevel = TTD2.Tools.Unit:GetPlayerLevel()
	
	--nothing in this module is reachable before lvl 110
	if(MyLevel < 110) then
		return
	end
	
	--the panda
	if(self.AchievementData == nil) then
		return
	end
	
	for AchID,AchData in pairs(self.AchievementData) do
		TTD2.Tools.Achievement:UpdateByID(AchID)
		if(AchData.OTQID ~= nil) then
			TTD2.Tools.Quest:UpdateByID(AchData.OTQID)
		end
	end
	
	self.Out = TTD2.Tools.Output
	
	self.Current = self.Current or {}
	for AchID,AchData in pairs(self.AchievementData) do
		self.Current.AchID			= AchID
		self.Current.AchData		= AchData
		self.Current.AchInfo		= TTD2.Tools.Achievement:GetByID(AchID)
		self.Current.AchLinkLine	= self.Out:AddLine(self.Out.Status.Completed, self.Current.AchInfo.Link)
		
		self.Current.CriteriaToDo	= false
		
		local Function = AchData.Type or AchID		
		Function = "Output_"..Function
		self[Function](self)
		
		if(self.Current.AchInfo.IsCompleted == false) then
			if(self.Current.CriteriaToDo == false) then
				self.Out:ChangeLine(self.Current.AchLinkLine, self.Out.Status.Done)
			else
				self.Out:ChangeLine(self.Current.AchLinkLine, self.Out.Status.ToDo)
			end
		end
	end
end
