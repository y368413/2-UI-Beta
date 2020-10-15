if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
]]

local super = TTD2.Templates.EventModule
TTD2.Modules.BFAHorrificVisionTracker = super:new()
local this = TTD2.Modules.BFAHorrificVisionTracker

--[[
this module displays a small info-frame whenever a HV is entered telling the player how many crystals+chests have been collected in each sub-area.
the information is displayed in the frame's tooltip, to save screen-space.

currently this module uses two look-up tables: ConstantData and SessionData. ConstantData contains all names requested from the server and computed locations. SesseionData is simply an array of booleans flagging if objects have been interacted with, linking to ConstantData by ID.
The advantage of this duality is that we can easily discard and reset SessionData and only query names etc. from the server when necessary. It may seem oblivious to have two different tables, though.
]]

this.Name = "[BFA] Horrific Vision Tracker"
this.Events = { ["PLAYER_ENTERING_WORLD"] = true, ["UNIT_SPELLCAST_SUCCEEDED"] = true }

local AllowedDistance	= 0.03
--if the distance between the Unit and an Object is smaller than this, the Unit is assumed to have interacted with this Object
--tested: AllowedDistance >0.0333 WILL produce wrong results in Orgrimmar

local PlayerUnit		= TTD2.Tools.Unit.PlayerUnit
local ConstantData		= nil
local SessionData		= nil
local Frame				= nil

function this:Initialise()

	--store some constants
	ConstantData =
	{
		SpellIDs =
		{
			NZothSanityDrain	= 287769,
			OpenChest			= 306608,
			CollectCrystal		= 143394,
			ClearSightRanks		=
			{
				[1] = 307519,
				[2] = 312628,
				[3] = 312629
			}
		},
		
		MapIDs =
		{
			[1] = 1469, --Orgrimmar
			[2] = 1470	--Stormwind
		},
		
		CurrentMap = 0 --while this LOOKS like SessionData, it is not. This ID identifies the map for which ConstantData has been generated
	}
	
	return
end

function this:LoadConstantMapData(MapID)

	--complete the ConstantData table only once, unless the map has changed; this could happen when running HVs during weekly reset without reloading
	if(ConstantData.CurrentMap == MapID) then
		return
	end
	
	ConstantData.MapData = nil
	
	--only load the data for the map available this week
	if(MapID == 1469) then
		ConstantData.MapData =
		{
			Areas =
			{
				[1] = { ID = 6144, ClearSightRank = 1, NumChests = 3 },	--Org: Grommash Hold
				[2] = { ID = 6122, ClearSightRank = 2, NumChests = 2 },	--Org: The Valley of Spirits
				[3] = { ID = 6123, ClearSightRank = 2, NumChests = 2 },	--Org: The Drag
				[4] = { ID = 6124, ClearSightRank = 3, NumChests = 2 },	--Org: The Valley of Honor
				[5] = { ID = 6125, ClearSightRank = 3, NumChests = 2 }	--Org: The Valley of Wisdom
			},
			Chests =
			{
				[01] = { Area = 1, X = 0.4690, Y = 0.7489, v = true },
				[02] = { Area = 1, X = 0.4827, Y = 0.6559, v = true },
				[03] = { Area = 1, X = 0.4820, Y = 0.7765, v = true },
				[04] = { Area = 1, X = 0.4952, Y = 0.7685, v = true },
				[05] = { Area = 1, X = 0.5059, Y = 0.7076, v = true },
				[06] = { Area = 1, X = 0.5296, Y = 0.7707, v = true },
				
				[07] = { Area = 2, X = 0.3243, Y = 0.6909, v = true },
				[08] = { Area = 2, X = 0.3472, Y = 0.6325, v = true },
				[09] = { Area = 2, X = 0.3493, Y = 0.7546, v = true },
				[10] = { Area = 2, X = 0.3558, Y = 0.6925, v = true },
				[11] = { Area = 2, X = 0.3576, Y = 0.7889, v = true },
				[12] = { Area = 2, X = 0.3752, Y = 0.8493, v = true },
				[13] = { Area = 2, X = 0.3938, Y = 0.8038, v = true },
				
				[14] = { Area = 3, X = 0.5691, Y = 0.5817, v = true },
				[15] = { Area = 3, X = 0.5711, Y = 0.6273, v = true },
				[16] = { Area = 3, X = 0.5741, Y = 0.5645, v = true },
				[17] = { Area = 3, X = 0.5755, Y = 0.4961, v = true },
				[18] = { Area = 3, X = 0.6020, Y = 0.5635, v = true },
				[19] = { Area = 3, X = 0.6076, Y = 0.5802, v = true },
				[20] = { Area = 3, X = 0.6098, Y = 0.5254, v = true },
				
				[21] = { Area = 4, X = 0.6628, Y = 0.3141, v = true },
				[22] = { Area = 4, X = 0.6676, Y = 0.3928, v = true },
				[23] = { Area = 4, X = 0.6916, Y = 0.4858, v = true },
				[24] = { Area = 4, X = 0.6938, Y = 0.4573, v = true },
				
				[25] = { Area = 5, X = 0.3946, Y = 0.4724, v = true },
				[26] = { Area = 5, X = 0.4120, Y = 0.4992, v = true },
				[27] = { Area = 5, X = 0.4206, Y = 0.4971, v = false },
				[28] = { Area = 5, X = 0.4520, Y = 0.5351, v = true },
				[29] = { Area = 5, X = 0.4689, Y = 0.5115, v = true },
				[30] = { Area = 5, X = 0.4844, Y = 0.4899, v = true },
				[31] = { Area = 5, X = 0.4886, Y = 0.4614, v = true },
				
				[32] = { Area = 1, X = 0.5394, Y = 0.7036, v = true, IsCrystalChest = true }
			},
			Crystals =
			{
				[01] = { Area = 1, X = 0.4866, Y = 0.8399, v = true },
				[02] = { Area = 1, X = 0.4918, Y = 0.6898, v = true },
				[03] = { Area = 1, X = 0.5360, Y = 0.8172, v = true },
				
				[04] = { Area = 2, X = 0.3336, Y = 0.6602, v = true },
				[05] = { Area = 2, X = 0.3532, Y = 0.6927, v = true },
				[06] = { Area = 2, X = 0.3697, Y = 0.8425, v = true },
				[07] = { Area = 2, X = 0.3863, Y = 0.8087, v = true },
				
				[08] = { Area = 3, X = 0.5783, Y = 0.5858, v = true },
				[09] = { Area = 3, X = 0.5740, Y = 0.6545, v = true },
				[10] = { Area = 3, X = 0.5797, Y = 0.4882, v = true },
				[11] = { Area = 3, X = 0.6040, Y = 0.5545, v = true },
				
				[12] = { Area = 4, X = 0.6373, Y = 0.3064, v = true },
				[13] = { Area = 4, X = 0.6580, Y = 0.5083, v = true },
				[14] = { Area = 4, X = 0.6728, Y = 0.3735, v = true },
				[15] = { Area = 4, X = 0.6813, Y = 0.4261, v = true },
				
				[16] = { Area = 5, X = 0.3905, Y = 0.5030, v = true },
				[17] = { Area = 5, X = 0.4189, Y = 0.4491, v = true },
				[18] = { Area = 5, X = 0.4836, Y = 0.4377, v = true },
				[19] = { Area = 5, X = 0.5114, Y = 0.4460, v = true }
			}
		}
	elseif(MapID == 1470) then
		ConstantData.MapData =
		{
			Areas =
			{
				[1] = { ID = 6176, ClearSightRank = 1, NumChests = 3 },	--SW: Cathedral
				[2] = { ID = 6172, ClearSightRank = 2, NumChests = 2 },	--SW: The Dwarven District
				[3] = { ID = 6173, ClearSightRank = 2, NumChests = 2 },	--SW: Trade District	
				[4] = { ID = 6174, ClearSightRank = 3, NumChests = 2 },	--SW: Old Town
				[5] = { ID = 6175, ClearSightRank = 3, NumChests = 2 }	--SW: The Mage Quarter
			},
			Chests =
			{
				[01] = { Area = 1, X = 0.5195, Y = 0.5785, v = true },
				[02] = { Area = 1, X = 0.5449, Y = 0.5942, v = true },
				[03] = { Area = 1, X = 0.5510, Y = 0.5031, v = true },
				[04] = { Area = 1, X = 0.5589, Y = 0.5262, v = true },
				[05] = { Area = 1, X = 0.5705, Y = 0.4973, v = true },
				
				[06] = { Area = 2, X = 0.6056, Y = 0.3405, v = true },
				[07] = { Area = 2, X = 0.6253, Y = 0.2947, v = true },
				[08] = { Area = 2, X = 0.6340, Y = 0.4203, v = true },
				[09] = { Area = 2, X = 0.6627, Y = 0.3405, v = true },
				[10] = { Area = 2, X = 0.6669, Y = 0.4423, v = true },
				
				[11] = { Area = 3, X = 0.6118, Y = 0.7547, v = true },
				[12] = { Area = 3, X = 0.6193, Y = 0.6658, v = true },
				[13] = { Area = 3, X = 0.6366, Y = 0.7453, v = true },
				[14] = { Area = 3, X = 0.6672, Y = 0.7030, v = true },
				
				[15] = { Area = 4, X = 0.7255, Y = 0.6219, v = true },
				[16] = { Area = 4, X = 0.7358, Y = 0.5622, v = true },
				[17] = { Area = 4, X = 0.7528, Y = 0.6478, v = true },
				[18] = { Area = 4, X = 0.7645, Y = 0.5376, v = true },
				
				[19] = { Area = 5, X = 0.4300, Y = 0.8319, v = true },
				[20] = { Area = 5, X = 0.4467, Y = 0.8699, v = true },
				[21] = { Area = 5, X = 0.4748, Y = 0.8890, v = true },
				[22] = { Area = 5, X = 0.5015, Y = 0.9002, v = true },
				[23] = { Area = 5, X = 0.5444, Y = 0.8540, v = true },
				
				[24] = { Area = 1, X = 0.5751, Y = 0.4833, v = true, IsCrystalChest = true },
			},
			Crystals =
			{
				[01] = { Area = 1, X = 0.5282, Y = 0.5205, v = true },
				[02] = { Area = 1, X = 0.5456, Y = 0.5980, v = true },
				[03] = { Area = 1, X = 0.5856, Y = 0.5519, v = true },
				
				[04] = { Area = 2, X = 0.6248, Y = 0.3687, v = true },
				[05] = { Area = 2, X = 0.6277, Y = 0.4222, v = true },
				[06] = { Area = 2, X = 0.6465, Y = 0.3100, v = true },
				[07] = { Area = 2, X = 0.6724, Y = 0.4507, v = true },
				
				[08] = { Area = 3, X = 0.6084, Y = 0.6835, v = true },
				[09] = { Area = 3, X = 0.6201, Y = 0.7719, v = true },
				[10] = { Area = 3, X = 0.6676, Y = 0.7648, v = true },
				[11] = { Area = 3, X = 0.6908, Y = 0.7340, v = true },
				
				[12] = { Area = 4, X = 0.7479, Y = 0.5927, v = true },
				[13] = { Area = 4, X = 0.7667, Y = 0.5260, v = true },
				[14] = { Area = 4, X = 0.7562, Y = 0.6502, v = true },
				[15] = { Area = 4, X = 0.7654, Y = 0.6837, v = true },
				
				[16] = { Area = 5, X = 0.4427, Y = 0.8834, v = true },
				[17] = { Area = 5, X = 0.4725, Y = 0.8201, v = true },
				[18] = { Area = 5, X = 0.4763, Y = 0.8939, v = true },
				[19] = { Area = 5, X = 0.5235, Y = 0.8291, v = true }
			}
		}
	else
		TTD2.Tools.Chat:Error("invalid MapID passed to "..self.Name..": "..MapID..".\nexpected 1469 or 1470.")
	end
	
	--now fill in localized names for the areas and create 2DVectors for all collectibles
	for Index, Data in ipairs(ConstantData.MapData.Areas) do
		local AreaPOIInfo = C_AreaPoiInfo.GetAreaPOIInfo(MapID, Data.ID)
		Data.Name = "[area:"..Data.ID.."]" --default fallback in case of DC or other mid-vision interruptions
		if(AreaPOIInfo ~= nil) then
			Data.Name = AreaPOIInfo.name
		end
	end
	
	for Index, Data in ipairs(ConstantData.MapData.Chests) do
		Data.VectorPos = CreateVector2D(Data.X, Data.Y)
	end
	
	for Index, Data in ipairs(ConstantData.MapData.Crystals) do
		Data.VectorPos = CreateVector2D(Data.X, Data.Y)
	end
	
	ConstantData.CurrentMap = MapID
	
	if(Frame == nil) then
		Frame = TTD2.Frames.HorrificVisionTracker
		Frame:Create()
	end
	
	Frame:SetConstantData(ConstantData)
	
	return
end

function this:EventCondition()
	self:Init()
	if(TTD2.Tools.SavedData:GetCharacterSetting("HorrificVisionTracker") == true) then
		
		--if this is toggled on while we are inside a HV, the frame should be retoggled!
		if(SessionData ~= nil) then
			Frame:Toggle(true)
		end
		
		return true
	end
	
	--if the frame was currently shown, hide it; do NOT erase sessiondata, maybe the user is just toggling the option to reset the frame
	if(SessionData ~= nil) then
		Frame:Toggle(false)
	end
	
	return false
end

function this:ReceiveEvent(Event, Unit, CastGUID, SpellID)
	self:Init()
	if(Event == "PLAYER_ENTERING_WORLD") then
		--this event is only used to reset the crystal+chest table; checking for MapID here can return anything
		SessionData = nil
		if(Frame ~= nil) then
			Frame:Toggle(false)
		end
	elseif(Event == "UNIT_SPELLCAST_SUCCEEDED") then
		if(Unit == PlayerUnit and SpellID == ConstantData.SpellIDs.NZothSanityDrain) then
			self:StartNewSession()
		elseif(SessionData ~= nil) then
			--the following spellcasts are only tracked inside a running vision; Sessiondata existing is our flag for that
			if(SpellID == ConstantData.SpellIDs.OpenChest) then
				self:ChestOpened(Unit)
			elseif(SpellID == ConstantData.SpellIDs.CollectCrystal) then
				self:CrystalCollected(Unit)
			end
		end
	end
	
	return
end

function this:StartNewSession()

	--if we already have SessionData, skip this entire call
	if(SessionData ~= nil) then
		return
	end

	--try to get current MapID
	local MapID = TTD2.Tools.Map:GetCurrentMapID()
	
	if(MapID == nil or TTD2.Tools.Table:Contains(ConstantData.MapIDs, MapID) == false) then
		--if this function is called while the current MapID is not a vision, we are still in the loading process. Just skip this and wait for the next tick.
		--it is also possible, that N'Zoths sanity drain might be used on other maps, so aborting here is really important
		return
	end
	
	--at this point we know we have a valid MapID and can proceed
	--determine learned ClearSightRank
	local LearnedClearSightRank = 0
	for Rank, SpellID in ipairs(ConstantData.SpellIDs.ClearSightRanks) do
		if(IsPlayerSpell(SpellID) == true) then
			LearnedClearSightRank = Rank
		end
	end

	--finish loading constants if necessary
	self:LoadConstantMapData(MapID)

	--now build the actual collectible session data
	SessionData =
	{
		LearnedClearSightRank = LearnedClearSightRank,
		Chests = {},
		Crystals = {}
	}
	
	--transfer ALL chest+crystal data; we will calculate the available amount based on ClearSightRank directly
	for Index, Data in ipairs(ConstantData.MapData.Chests) do
		if(Data.IsCrystalChest == true) then
			SessionData.IsCrystalChestCollected = false
		else
			--do not create an indexed field for the crystalchest; it has a speciakl flag outside the table
			SessionData.Chests[Index] = false
		end
	end
	
	for Index, Data in ipairs(ConstantData.MapData.Crystals) do
		SessionData.Crystals[Index] = false
	end
	
	Frame:Toggle(true)
	Frame:SetSessionData(SessionData)
	Frame:UpdateTooltip()
	
	return
end

function this:ChestOpened(Unit)

	local UnitPosition = C_Map.GetPlayerMapPosition(ConstantData.CurrentMap, Unit)
	local BestMatchIndex = self:FindBestMatchIndex(ConstantData.MapData.Chests, UnitPosition)
	
	if(BestMatchIndex == nil) then
		TTD2.Tools.Chat:Error("a chest was opened at coordinates that could not be matched to known chest locations.")
	else
		local BestMatchChest	= ConstantData.MapData.Chests[BestMatchIndex]
		local BestMatchArea		= ConstantData.MapData.Areas[BestMatchChest.Area]
		
		if(BestMatchChest.IsCrystalChest == true) then
			if(Unit == PlayerUnit) then
				SessionData.IsCrystalChestCollected = true
			else
				--this chest was opened by someone else
				if(SessionData.IsCrystalChestCollected == false and SessionData.LearnedClearSightRank >= BestMatchArea.ClearSightRank) then
					--if we have not opened it and can see it...add waypoint
					TTD2.Tools.TomTom:AddWaypoint(ConstantData.CurrentMap, BestMatchChest.X, BestMatchChest.Y, BestMatchArea.Name.." Chest#"..BestMatchIndex)
				end
			end		
		else
			if(Unit == PlayerUnit) then
				SessionData.Chests[BestMatchIndex] = true
			else
				--this chest was opened by someone else
				if(SessionData.Chests[BestMatchIndex] == false and SessionData.LearnedClearSightRank >= BestMatchArea.ClearSightRank) then
					--if we have not opened it and can see it...add waypoint
					TTD2.Tools.TomTom:AddWaypoint(ConstantData.CurrentMap, BestMatchChest.X, BestMatchChest.Y, BestMatchArea.Name.." Chest#"..BestMatchIndex)
				end
			end
		end
	end
	
	Frame:UpdateTooltip()
	
	return
end

function this:CrystalCollected(Unit)

	local UnitPosition = C_Map.GetPlayerMapPosition(ConstantData.CurrentMap, Unit)
	local BestMatchIndex = self:FindBestMatchIndex(ConstantData.MapData.Crystals, UnitPosition)
	
	if(BestMatchIndex == nil) then
		TTD2.Tools.Chat:Error("a crystal was collected at coordinates that could not be matched to known crystal locations.")
	else		
		SessionData.Crystals[BestMatchIndex] = true
	end
	
	Frame:UpdateTooltip()
	
	return
end

function this:FindBestMatchIndex(Objects, UnitPos)
	
	--start with greatest possible distance: sqrt(2)
	local CurrentDistance = 1.4142
	local CurrentBestMatch = nil
	
	for Index, ObjectData in ipairs(Objects) do
		local Distance = self:GetVectorDistance(ObjectData.VectorPos, UnitPos)
		if(Distance < CurrentDistance) then
			CurrentDistance = Distance
			CurrentBestMatch = Index
		end
	end
	
	
	
	
	--debug output
	local BestMatchObject	= Objects[CurrentBestMatch]
	local BestMatchArea		= ConstantData.MapData.Areas[BestMatchObject.Area]
	
	if(AllowedDistance < CurrentDistance) then
		TTD2.Tools.Chat:Error("matched object too far! ignoring match! NOTE: Ignore this message for the CrystalChest!")
		print("closest match found: object#"..CurrentBestMatch..", in area: "..BestMatchArea.Name)
		print("Given Unit-Position: ", UnitPos:GetXY())
		print("determined as best match: ", Objects[CurrentBestMatch].VectorPos:GetXY())
		print("distance: "..CurrentDistance)
		return nil
	end
	
	if(0.01 < CurrentDistance) then
		TTD2.Tools.Chat:Warning("matched object seems to have inaccurate coordinates!")
		print("closest match found: object#"..CurrentBestMatch..", in area: "..BestMatchArea.Name)
		print("Given Unit-Position: ", UnitPos:GetXY())
		print("determined as best match: ", Objects[CurrentBestMatch].VectorPos:GetXY())
		print("distance: "..CurrentDistance)
		--still return normally, this is only a warning!
	else
		--[[
		--distance <= 0.01; perfect
		print(TTD2.Tools.Chat:Green("matched object very close to unit position!"))
		print("closest match found: object#"..CurrentBestMatch..", in area: "..BestMatchArea.Name)
		print("Given Unit-Position: ", UnitPos:GetXY())
		print("determined as best match: ", Objects[CurrentBestMatch].VectorPos:GetXY())
		print("distance: "..CurrentDistance)
		--]]
	end
	
	--[[
	if(BestMatchObject.v ~= true) then
		TTD2.Tools.Chat:Debug("this object was not verified! please validate position!")
		TTD2.Tools.Chat:Debug("this object was not verified! please validate position!")
		TTD2.Tools.Chat:Debug("this object was not verified! please validate position!")
	end
	--]]
		
	return CurrentBestMatch
end

function this:FindFirstMatchIndex(Objects, UnitPos)

	for Index, ObjectData in ipairs(Objects) do
		if(self:IsCloseEnough(ObjectData.VectorPos, UnitPos) == true) then
			return Index
		end
	end
	
	return
end

function this:IsCloseEnough(VectorA, VectorB)

	if(self:GetVectorDistance(VectorA, VectorB) < AllowedDistance) then
		return true
	end
	
	return false
end

function this:GetVectorDistance(VectorA, VectorB)

	local DistanceVector = VectorB:Clone()
	DistanceVector:Subtract(VectorA)
	
	return DistanceVector:GetLength()
end
