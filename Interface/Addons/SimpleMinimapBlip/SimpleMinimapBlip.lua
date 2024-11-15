local atlasPath = "Interface\\AddOns\\SimpleMinimapBlip\\SimpleMinimapBlip.blp"
local isEnabled = true

local function updateBlipTexture()
    if isEnabled then
        Minimap:SetBlipTexture(atlasPath)
    else
        -- Reset to default texture, replace with the actual default path if known
        Minimap:SetBlipTexture("Interface\\Minimap\\ObjectIconsAtlas.blp")
    end
end

local function eventHandler(self, event, ...)
    updateBlipTexture()
end

local function setBlipTexture(state)
    if state == "on" then
        isEnabled = true
        print("|cff00ff00SimpleMinimapBlip: Enabled|r")  -- Green color
    elseif state == "off" then
        isEnabled = false
        print("|cffff0000SimpleMinimapBlip: Disabled|r")  -- Red color
    else
        print("Usage: /smb on | off")
        return
    end
    updateBlipTexture()
end

-- Register the event
local minimapBlipsFrame = CreateFrame("Frame", "MinimapBlipsFrame")
minimapBlipsFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
minimapBlipsFrame:SetScript("OnEvent", eventHandler)

-- Slash commands to enable or disable the feature
SLASH_SIMPLEMINIMAPBLIP1 = "/smb"
SlashCmdList["SIMPLEMINIMAPBLIP"] = function(msg)
    setBlipTexture(strtrim(string.lower(msg)))
end
