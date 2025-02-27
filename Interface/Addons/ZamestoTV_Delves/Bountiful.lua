local VladDelves = CreateFrame("Frame")
VladDelves:RegisterEvent("ADDON_LOADED")
VladDelves:RegisterEvent("PLAYER_REGEN_DISABLED")
VladDelves:RegisterEvent("PLAYER_REGEN_ENABLED")

local G = {
    DelveButtons = {},
    ExpansionMapID = 2274, -- Khaz Algar
    config = {
        onlyBountiful = true, -- Always show only Bountiful Delves
        prioBountiful = false, -- No need for prioritization since only Bountiful Delves are shown
        taintSafe = false
    }
}

function G.GetDelves()
    local dupe = {}
    local temp = {}
    local onlyBountiful = G.config.onlyBountiful
    local areas = C_Map.GetMapChildrenInfo(G.ExpansionMapID, Enum.UIMapType.Zone, true)
    for _, area in ipairs(areas) do
        local mapID = area.mapID
        local areaPOIs = C_AreaPoiInfo.GetDelvesForMap(mapID)
        for _, areaPoiID in ipairs(areaPOIs) do
            local poiInfo = C_AreaPoiInfo.GetAreaPOIInfo(mapID, areaPoiID)
            if poiInfo and poiInfo.atlasName and poiInfo.isPrimaryMapForPOI then
                if not dupe[poiInfo.name] then
                    dupe[poiInfo.name] = true
                    local bountiful = not not poiInfo.atlasName:find("bountiful")
                    if bountiful then
                        temp[#temp + 1] = {
                            bountiful = true,
                            atlas = poiInfo.atlasName,
                            name = poiInfo.name,
                            zone = area.name,
                            mapID = mapID,
                            areaPoiID = areaPoiID,
                        }
                    end
                end
            end
        end
    end
    table.sort(temp, function(a, b)
        return a.zone > b.zone or (a.zone == b.zone and a.name > b.name)
    end)
    return temp
end

local function OnDelveEnter(self)
    local delve = self.delve
    GameTooltip:SetOwner(self, "ANCHOR_TOPLEFT")
    GameTooltip:AddLine(format("|A:%s:0:0|a %s", delve.atlas, delve.name), 1, 1, 1, false)
    GameTooltip:AddLine(format("%s", delve.zone), 1, 1, 1, false)
    GameTooltip:Show()
end

local function OnDelveClick(self, button, down)
    if G.config.taintSafe then return end
    local delve = self.delve
    if not WorldMapFrame:IsShown() then
        WorldMapFrame:HandleUserActionOpenSelf()
    end
    WorldMapFrame:SetMapID(delve.mapID)
    if down then return end
    for pin in WorldMapFrame:EnumeratePinsByTemplate("DelveEntrancePinTemplate") do
        if delve.areaPoiID == pin.areaPoiID then
            pin:OnClick(button, down)
            break
        end
    end
end

function G.CreateDelveButton(frame, index)
    local maxPerRow = 4  -- Number of buttons per row
    local rowIndex = (index - 1) % maxPerRow
    local colIndex = math.floor((index - 1) / maxPerRow) % 2
    local yOffset = -colIndex * 30  -- Offset for second row
    local xOffset = rowIndex * 30   -- Horizontal spacing
    
    local button = CreateFrame("Button", nil, frame, "SecureActionButtonTemplate")
    button:SetPoint("TOPLEFT", frame, "TOPLEFT", xOffset, yOffset - 64)
    button:SetSize(24, 24)
    button:SetAttribute("type", "spell")
    button:SetAttribute("spell", "")
    button:RegisterForClicks("AnyUp", "AnyDown")
    button.Icon = button:CreateTexture(nil, "OVERLAY")
    button.Icon:SetAllPoints()
    button.Icon:SetAtlas("Dungeon")
    button:HookScript("OnLeave", GameTooltip_Hide)
    button:HookScript("OnEnter", OnDelveEnter)
    button:HookScript("OnClick", OnDelveClick)
    return button
end

function G.DelvesUpdate(self)
    if InCombatLockdown() then return end
    for _, button in pairs(G.DelveButtons) do
        button:Hide()
    end
    local delves = G.GetDelves()
    for i, delve in ipairs(delves) do
        local button = G.DelveButtons[i]
        if not button then
            button = G.CreateDelveButton(self, i)
            G.DelveButtons[i] = button
        end
        button.delve = delve
        button.Icon:SetAtlas(delve.atlas)
        button:Show()
    end
end

function G.DelvesInit()
    local panel = DelvesDashboardFrame.ButtonPanelLayoutFrame
    local frame = CreateFrame("Frame", nil, panel, "DelvesDashboardButtonPanelFrame")
    frame.layoutIndex = 3
    frame:SetWidth(120)
    frame.ButtonPanelBackground:Hide()
    frame.PanelTitle:SetText("Bountiful")
    frame.PanelDescription:SetText("")
    panel:HookScript("OnShow", function(...) G.DelvesUpdate(frame, ...) panel:Layout() end)
end

function G.TryLoad()
    if InCombatLockdown() then return end
    if DelvesDashboardFrame and not G.Delves then
        G.Delves = true
        G.DelvesInit()
    end
end

VladDelves:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        G.TryLoad()
    elseif event == "PLAYER_REGEN_DISABLED" or event == "PLAYER_REGEN_ENABLED" then
        G.TryLoad()
    end
end)