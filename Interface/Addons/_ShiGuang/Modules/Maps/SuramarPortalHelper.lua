local SPH_MapTooltip
local portalMap = {}
local SuramarPortalHelperloaded = true
local falanaarPortal
local felsoulHoldPortal

local eventResponseFrame = CreateFrame("Frame", "Helper")
	eventResponseFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	eventResponseFrame:RegisterEvent("ADDON_LOADED");
	eventResponseFrame:RegisterEvent("WORLD_MAP_UPDATE")
	eventResponseFrame:RegisterEvent("WORLD_MAP_NAME_UPDATE")
	
	
	local function eventHandler(self, event, arg1 , arg2, arg3, arg4, arg5)
		if (event == "ADDON_LOADED") then
		  if SuramarPortalHelperloaded then
      SuramarPortalHelperloaded = false;
			SPH_MapTooltipSetup();
			SPH_createMap();
			end
		else
			local _, _, _, isMicroDungeon, microDungeonMapName = GetMapInfo()
			SPH_HideAllPortals()
			if GetCurrentMapAreaID() == 1033 and not isMicroDungeon then --Suramar 
				SPH_ShowPortals(true)
			elseif isMicroDungeon and (microDungeonMapName == "FalanaarTunnels" or microDungeonMapName == "法兰纳尔废墟") then
				SPH_ShowFalanaar(true)
			elseif isMicroDungeon and microDungeonMapName == "SuramarLegionScar" then
				SPH_ShowFelsoulHold(true)				
			end		
		end
	end
	
	eventResponseFrame:SetScript("OnEvent", eventHandler);
	
function SPH_createLoc(x, y, position, questId)
	local portal = CreateFrame("Frame", "Portal", WorldMapDetailFrame)

	portal.Texture = portal:CreateTexture()
    if questId and IsQuestFlaggedCompleted(questId) then
        portal.Texture:SetTexture("Interface\\MINIMAP\\Vehicle-AllianceMagePortal")
        portal:SetWidth(21)
        portal:SetHeight(21)
    else
        portal.Texture:SetTexture("Interface\\MINIMAP\\Vehicle-HordeMagePortal")  --Icons\\spell_arcane_teleportdarnassus
        portal:SetWidth(16)
        portal:SetHeight(16)
    end
	portal.Texture:SetAllPoints()
	portal:EnableMouse(true)
	portal:SetFrameStrata("TOOLTIP")
	portal:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel()+10)
		
	portal:SetPoint("CENTER", WorldMapDetailFrame, "TOPLEFT", (x / 100) * WorldMapDetailFrame:GetWidth(), (-y / 100) * WorldMapDetailFrame:GetHeight())

	
	portal:HookScript("OnEnter",
		function(pin, motion)
			SPH_MapTooltip:SetOwner(pin, "ANCHOR_RIGHT")
			SPH_MapTooltip:ClearLines()
			SPH_MapTooltip:AddLine(position)
			SPH_MapTooltip:Show()
		end
	)
	portal:HookScript("OnLeave",
		function()
			SPH_MapTooltip:Hide()
		end
	)	
	portal:Hide()
	return portal
end

function SPH_HideAllPortals()
	SPH_ShowPortals(false)
	SPH_ShowFalanaar(false)
	SPH_ShowFelsoulHold(false)	
end

function SPH_ShowPortals(bool)
	for i = 1, #portalMap do
		if bool then
			portalMap[i]:Show()
		else
			portalMap[i]:Hide()
		end
	end
end

function SPH_ShowFalanaar(bool)
	if bool then
		falanaarPortal:Show()
	else
		falanaarPortal:Hide()
	end
end

function SPH_ShowFelsoulHold(bool)
	if bool then
		felsoulHoldPortal:Show()
	else
		felsoulHoldPortal:Hide()
	end
end

function SPH_MapTooltipSetup()
	SPH_MapTooltip = CreateFrame("GameTooltip", "SPH_MapTooltip", WorldMapFrame, "GameTooltipTemplate")
	SPH_MapTooltip:SetFrameStrata("TOOLTIP")
	SPH_MapTooltip:SetFrameLevel(WorldMapDetailFrame:GetFrameLevel()+20)
end

function SPH_createMap()
	portalMap[#portalMap+1] = SPH_createLoc(30.8, 10.9, "o|cFFFF0000#|r ooo oo\no           oo",43808);
	portalMap[#portalMap+1] = SPH_createLoc(36.2, 47.1, "oo o|cFFFF0000#|ro oo\no           oo",40956);
	portalMap[#portalMap+1] = SPH_createLoc(21.5, 29.9, "|cFFFF0000#|ro ooo oo\no           oo",42230);
	portalMap[#portalMap+1] = SPH_createLoc(47.5, 82.0, "oo oo|cFFFF0000#|r oo\no            oo",42487);
	portalMap[#portalMap+1] = SPH_createLoc(64.0, 60.4, "oo ooo oo\no           |cFFFF0000#|ro",44084);
	portalMap[#portalMap+1] = SPH_createLoc(39.1, 76.3, "oo ooo oo\n|cFFFF0000#|r           oo",41575);
	portalMap[#portalMap+1] = SPH_createLoc(43.6, 79.1, "oo |cFFFF0000#|roo oo\no           oo",43811);
	portalMap[#portalMap+1] = SPH_createLoc(43.4, 60.7, "oo ooo |cFFFF0000#|ro\no            oo",43813);
	portalMap[#portalMap+1] = SPH_createLoc(42.2, 35.4, "oo ooo o|cFFFF0000#|r\no           oo",43809);
	portalMap[#portalMap+1] = SPH_createLoc(55.5, 69.4, "oo ooo oo\no          |cFFFF0000#|ro")
	falanaarPortal = SPH_createLoc(40.84, 13.44, "");
	felsoulHoldPortal = SPH_createLoc(53.64, 36.75, "");	
			portalMap[4] = SPH_createLoc(52.0, 78.75, "oo oo|cFFFF0000#|r oo\no           oo",42889);
end