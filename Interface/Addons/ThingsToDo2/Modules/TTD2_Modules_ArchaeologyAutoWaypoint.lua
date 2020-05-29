if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
]]

local super = TTD2.Templates.EventModule
TTD2.Modules.ArchaeologyAutoWaypoint = super:new()
local this = TTD2.Modules.ArchaeologyAutoWaypoint

--[[
the purpose of this module is to produce a tomtom-waypoint to the next digsite on the current continent
]]

this.Name = "[Archaeology] AutoWaypoint"
this.Events = { ["ARTIFACT_DIGSITE_COMPLETE"] = true, ["RESEARCH_ARTIFACT_DIG_SITE_UPDATED"] = true }
this.DigsiteCompleted = false

function this:EventCondition()
	if(TTD2.Tools.SavedData:GetCharacterSetting("ArchaeologyAutoWaypoint") == true) then
		return true
	end
	
	return false
end

function this:ReceiveEvent(Event, Data)
	if(Event == "ARTIFACT_DIGSITE_COMPLETE") then
		self.DigsiteCompleted = true
	elseif(Event == "RESEARCH_ARTIFACT_DIG_SITE_UPDATED") then
		--only act if there was a digsite completed by us
		if(self.DigsiteCompleted == true) then
			self:AddWaypointToClosestDigsite()
			self.DigsiteCompleted = false
		end
	end
end

function this:AddWaypointToClosestDigsite()
	
	--first check if TomTom is active
	if(TTD2.Tools.TomTom:IsActive() == false) then
		return
	end
	
	--now lets find out where we are
	local ContinentID = TTD2.Tools.Map:GetCurrentContinentID()
	local ContinentName = TTD2.Tools.Map:GetCurrentContinentName()
	local PlayerPos = TTD2.Tools.Map:GetPlayerMapPosition(ContinentID)
	
	if(PlayerPos == nil) then
		--the player was in some mini-instance-map and did not actually have coordinates on his continent
		--we can assume some default location (.5/.5), but thw waypoint will still not be visible. That is a TomTom thing, though
		--if we did the calculation based on default values and added a waypoint the player did not receive an arrow for, it would be really hard to actually point the arrow to this waypoint once we are outside; so it's better to abort.
		TTD2.Tools.Chat:Warning("Your current position is not visible on your current continent map; toggle the option again when you are outside to get a waypoint added.")
		return
	end
	
	--next, search for digsites on our current continent only
	local Digsites = TTD2.Tools.Archaeology:GetDigSitesForMap(ContinentID)
	
	--if there are no digsites on this continent...
	if(TTD2.Tools.Table:IsEmpty(Digsites) == true) then
		return
	end
	
	--find closest digsite
	local MinDistance = 2.0	--since map coords are between 0 and 1 the greatest possible distance is sqrt(2). If we init with 2 any possible distance has to be smaller
	local ClosestDigsite = nil	
	
	for k,v in pairs(Digsites) do		
		local DistanceX = v.Position.PosX - PlayerPos.PosX
		local DistanceY = v.Position.PosY - PlayerPos.PosY
		local Distance = math.sqrt(DistanceX^2 + DistanceY^2)
		if(Distance < MinDistance) then
			MinDistance = Distance
			ClosestDigsite = v
		end
	end
	
	--there is a problem with placing waypoints on the continental map; so what we are going to do now is try and find this specific digsite on the "highest" map of the tree which the current continent is the root of
	local AllChildrenMapIDTypes = TTD2.Tools.Map:GetAllChildrenTypes(ContinentID, true)
	local BestMatchID = ContinentID
	local BestMatchType = TTD2.Tools.Map.ContinentType
	local BestMatchDigsite = ClosestDigsite
	local BestMatchCenterDistance = 1.0 --the greatest possible distance from the center of a map (while still on the map) is sqrt(0.5^2+0.5^2), which is ~0.7
	for ChildMapID,ChildMapType in pairs(AllChildrenMapIDTypes) do
		local ChildDigsites = TTD2.Tools.Archaeology:GetDigSitesForMap(ChildMapID)
		for k, v in pairs(ChildDigsites) do
			if(v.ResearchSiteID == ClosestDigsite.ResearchSiteID) then
				if(BestMatchType < ChildMapType) then
					BestMatchID = ChildMapID
					BestMatchType = ChildMapType
					BestMatchDigsite = v
					BestMatchCenterDistance = math.sqrt((v.Position.PosX-0.5)^2 + (v.Position.PosY-0.5)^2)
				elseif(BestMatchType == ChildMapType) then
					--if a waypoint exists on two maps, we should take the one which is closer to the center of the map
					--in these cases the waypoint is usually visible at the very edge of one map, but this region overlaps with the next map, so technically speaking it is not reachable in the game, as the player will already be on the next map when venturing there
					--"closer to the center" means we will in fact calculate the distance to (0.5/0.5) and compare that
					local ChildCenterDistance = math.sqrt((v.Position.PosX-0.5)^2 + (v.Position.PosY-0.5)^2)
					if(ChildCenterDistance < BestMatchCenterDistance) then
						--this is a better match, swap
						BestMatchID = ChildMapID
						BestMatchType = ChildMapType
						BestMatchDigsite = v
						BestMatchCenterDistance = ChildCenterDistance
					end
				end
			end
		end
	end
	
	TTD2.Tools.TomTom:AddWaypoint(BestMatchID,BestMatchDigsite.Position.PosX,BestMatchDigsite.Position.PosY,BestMatchDigsite.Name)
	
	--print a little confirmation message
	print(TTD2.Tools.Chat:GetColoredAddonTitle()..": "..TTD2.Tools.Chat:Yellow(self.Name)..": "..TTD2.Tools.TomTom:CreateLink(BestMatchID,BestMatchDigsite.Position.PosX,BestMatchDigsite.Position.PosY,BestMatchDigsite.Name))
	
	return
end

--temporal
function TTD2_StoreAllDigsitesGlobal()
	--this.private.Validate()
	
	local ContinentIDs =
	{
		--Kalimdor
		12,
		--Eastern Kingdoms
		13,
		--Outland
		101,
		--Northrend
		113,
		--Pandaria
		424,
		--Draenor
		572,
		--Broken Isles
		619,
		--Zandalar
		875,
		--Kul'Tiras
		876
	}
	
	if(TTD2_AccountData == nil) then
		TTD2_AccountData = {}
	end
	if(TTD2_AccountData.digsites == nil) then
		TTD2_AccountData.digsites = {}
	end
	
	local Locale = GetLocale()
	
	for _,ContinentID in pairs(ContinentIDs) do
	
		local ContinentName = ttd2.lib.map.GetNameByID(ContinentID)
		
		if(TTD2_AccountData.digsites[ContinentID] == nil) then
			TTD2_AccountData.digsites[ContinentID] = {}
		end
		local ContinentData = TTD2_AccountData.digsites[ContinentID]
		ContinentData["Name_"..Locale] = ContinentName
		
		local Digsites = lib.archaeology.GetDigSitesForMap(ContinentID)
		local NumDigsites = lib.table.getNumEntries(Digsites)
		
		print("Storing "..NumDigsites.." digsites for "..ContinentName)
		
		for _,Digsite in pairs(Digsites) do
			if(ContinentData[Digsite.researchSiteID] == nil) then
				ContinentData[Digsite.researchSiteID] = {}
			end
			
			ContinentData[Digsite.researchSiteID]["Name_"..Locale] = Digsite.name
			if(ContinentData[Digsite.researchSiteID]["Race"] == nil) then
				ContinentData[Digsite.researchSiteID]["Race"] = "UNKNOWN"
			end
		end
	end
	
	return
end
