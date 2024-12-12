SLASH_ZYGORWAY1 = "/zygorway"
SLASH_ZYGORWAY2 = "/zw"
SLASH_ZYGORWAY3 = "/way"
SLASH_ZYGORWAY4 = "/tway"
SLASH_CLEARWAY1 = "/clearway"

local function GetMapIDByName(zoneName)
    -- Check for region names separated by a colon
    local baseZone, subZone = strsplit(":", zoneName)
    if subZone then
        zoneName = subZone
    else
        zoneName = baseZone
    end
    
    for i = 1, 1000 do  -- Assuming there won't be more than 1000 maps
        local mapInfo = C_Map.GetMapInfo(i)
        if mapInfo and mapInfo.name == zoneName then
            return i
        end
    end
    return nil
end

local function SetZygorWaypoint(msg)
    local zone, x, y, title
    
    -- Try to match the format: <zone> <x> <y> <title>
    zone, x, y, title = msg:match("^(.-)%s+(%d+%.?%d*)%s+(%d+%.?%d*)%s*(.*)$")
    
    if not x or not y then
        -- If the first pattern didn't match, try to match the format: <x> <y> <title>
        x, y, title = msg:match("^(%d+%.?%d*)%s+(%d+%.?%d*)%s*(.*)$")
        zone = C_Map.GetMapInfo(C_Map.GetBestMapForUnit("player")).name
    end

    x = tonumber(x)
    y = tonumber(y)

    if x and y and zone then
        if ZGV and ZGV.Pointer then
            local mapID = GetMapIDByName(zone)
            if mapID then
                ZGV.Pointer:SetWaypoint(mapID, x/100, y/100, {title=title})
                print("Zygor waypoint set to: " .. zone .. " (" .. x .. ", " .. y .. ") " .. (title and ("- " .. title) or ""))
            else
                print("Error: Invalid zone name '" .. zone .. "'.")
            end
        else
            print("Error: Zygor Guide Viewer not loaded.")
        end
    else
        print("Usage: /way <zone> <x> <y> <title> or /way <x> <y> for current zone")
    end
end

local function ClearZygorWaypoints()
    if ZGV and ZGV.Pointer then
        ZGV.Pointer:ClearWaypoints()
        print("Zygor waypoints cleared.")
    else
        print("Error: Zygor Guide Viewer not loaded.")
    end
end

SlashCmdList["ZYGORWAY"] = SetZygorWaypoint
SlashCmdList["CLEARWAY"] = ClearZygorWaypoints
