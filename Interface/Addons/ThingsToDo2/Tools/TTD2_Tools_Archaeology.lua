if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

local super = TTD2.Templates.Base
TTD2.Tools.Archaeology = super:new()
local this = TTD2.Tools.Archaeology

function this:GetDigSitesForMap(MapID)
	local digsites = C_ResearchInfo.GetDigSitesForMap(MapID)
	local Digsites = {}
	for k,digsite in pairs(digsites) do
		Digsites[k] =
		{
			SiteID		= digsite.researchSiteID,
			Position	= { PosX = digsite.position.x, PosY = digsite.position.y },
			Name		= digsite.name
		}
	end
	
	return Digsites
end
