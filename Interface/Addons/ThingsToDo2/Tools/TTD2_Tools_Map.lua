ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
]]

local super = Templates.Base
Tools.Map = super:new()
local this = Tools.Map

this.ContinentType = 2

--[[
this.CosmicID = 946
this.ContinentIDs =
{
	12,		--Kalimdor
	13,		--Eastern Kingdoms
	101,	--Outland
	113,	--Northrend
	424,	--Pandaria
	572,	--Draenor
	619,	--Die veheerte Inseln
	905,	--Argus
	875,	--Zandalar
	876,	--Kul'tiras
	948,	--Mahlstrom
	1355,	--Nazjatar; wrongly uses mapType = 3 as of 8.2 - 27/06/19
}
]]

function this:GetInfoByID(ID)
	
	local MapInfo = C_Map.GetMapInfo(ID)
	
	if(MapInfo == nil) then
		Tools.Chat:Error("trying to access details on invalid MapID: "..ID)
		return
	end
	
	local Info =
	{
		Name		= MapInfo.name,
		Type		= MapInfo.mapType,
		ID			= MapInfo.mapID,
		ParentID	= MapInfo.parentMapID
	}
	
	--at this point we can do some corrections
	if(ID == 1355) then	--Nazjatar uses wrong MapType as of 8.2; 27/06/2019
		Info.Type = self.ContinentType
	end
	
	return Info
end

function this:GetNameByID(ID)
	return self:GetInfoByID(ID).Name
end

function this:GetTypeByID(ID)
	return self:GetInfoByID(ID).Type
end

function this:GetParentIDByID(ID)
	return self:GetInfoByID(ID).ParentID
end

function this:GetContinentIDByID(ID)

	local CurrentInfo = self:GetInfoByID(ID)
	
	if(CurrentInfo.Type < self.ContinentType) then
		return nil
	elseif(CurrentInfo.Type == self.ContinentType) then
		return ID
	else
		while(CurrentInfo.Type > self.ContinentType) do
			CurrentInfo = self:GetInfoByID(CurrentInfo.ParentID)
		end
		return CurrentInfo.ID
	end
end

function this:GetCurrentMapID()
	
	local MapID = C_Map.GetBestMapForUnit(Tools.Unit.PlayerUnit)
	return MapID
end

function this:GetCurrentMapName()
	return self:GetNameByID(self:GetCurrentMapID())
end

function this:IsSameContinent(MapA, MapB)
	
	if(MapB == nil) then
		MapB = self:GetCurrentMapID()
	end
	
	--most obvious case
	if(MapA == MapB) then
		return true
	end
	
	--all "continents" are mapType = 2
	--so to find out if two maps are on the same continent we simply have to go up their parents until
	--Type 2 and compare those
	
	local ContinentA = self:GetContinentIDByID(MapA)
	local ContinentB = self:GetContinentIDByID(MapB)
	
	--print(ContinentA, ContinentB)
	--print(MapA, MapB)
	
	return (ContinentA == ContinentB)
end

function this:GetCurrentContinentID()	
	return self:GetContinentIDByID(self:GetCurrentMapID())
end

function this:GetCurrentContinentName()	
	return self:GetNameByID(self:GetCurrentContinentID())
end

function this:GetMapGenealogy(MapID, Delimiter)
	if(Delimiter == nil) then
		Delimiter = " >> "
	end
	
	local CurrentInfo = self:GetInfoByID(MapID)
	
	if(CurrentInfo.Type <= self.ContinentType) then
		return self:GetNameByID(MapID)
	end
	
	local Index = 0
	local GenealogyReversed = {}
	while(CurrentInfo.Type > self.ContinentType) do	--using this condition will not actually add the continent name to the table!
		Index = Index+1
		GenealogyReversed[Index] = CurrentInfo.Name
		CurrentInfo = self:GetInfoByID(CurrentInfo.ParentID)
	end
	
	Genealogy = CurrentInfo.Name	--use the (not included in table!) continent as initialisation for the string
	
	while(Index > 0) do
		Genealogy = Genealogy..Delimiter..GenealogyReversed[Index]
		Index = Index-1
	end
	
	return Genealogy
end

function this:GetPlayerMapPosition(MapID)
	local playerpos = C_Map.GetPlayerMapPosition(MapID, Tools.Unit.PlayerUnit)
	
	--[[
	it is possible that the player is not actually visible on the requested map. In some cases, this is simply an error by the caller,
	like asking for the coordination on a map on a different continent than the player currently is. Those cases must be degbugged.
	
	Then there are the cases of maps that technically belong to a continent but are not really "on" it physically.
	These cases are harder to debug.
	It is only true for small special maps, like the SW portal room or some Legion OrderHalls.
	For these cases, the caller should simply "expect" that the player may not have a valid "continent position"
	]]
	if(playerpos == nil) then
		return nil
	end
	return { PosX = playerpos.x, PosY = playerpos.y }
end

function this:GetAllChildrenTypes(RootMapID, Recursive, Types)
	local Children = C_Map.GetMapChildrenInfo(RootMapID, Types, Recursive)
	local IDTypeResults = {}
	
	for _, MapInfo in pairs(Children) do
		IDTypeResults[MapInfo.mapID] = MapInfo.mapType
		if(MapInfo.mapID == 1355) then
			IDTypeResults[MapInfo.mapID] = self.ContinentType	--see GetContinentIDByID() for explanation
		end
	end
	
	return IDTypeResults
end
