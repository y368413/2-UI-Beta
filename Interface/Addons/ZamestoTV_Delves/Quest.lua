-- Create a frame to handle events
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("ZONE_CHANGED")
frame:RegisterEvent("QUEST_LOG_UPDATE")

-- Create the quest status display frame
local questFrame = CreateFrame("Frame", "DelversQuestTrackerFrame", UIParent, "DialogBoxFrame")
questFrame:SetSize(400, 300)
questFrame:SetPoint("CENTER")
questFrame:SetMovable(true)
questFrame:EnableMouse(true)
questFrame:RegisterForDrag("LeftButton")
questFrame:SetScript("OnDragStart", questFrame.StartMoving)
questFrame:SetScript("OnDragStop", questFrame.StopMovingOrSizing)
questFrame:Hide() -- Hide the frame by default

-- Set textures for the frame
questFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
})

-- Create a scrollable text area for quest status
local scrollFrame = CreateFrame("ScrollFrame", nil, questFrame, "UIPanelScrollFrameTemplate")
scrollFrame:SetPoint("TOPLEFT", 10, -30)
scrollFrame:SetPoint("BOTTOMRIGHT", -30, 10)

local scrollChild = CreateFrame("Frame")
scrollFrame:SetScrollChild(scrollChild)
scrollChild:SetSize(380, 280)

local questStatusText = scrollChild:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
questStatusText:SetPoint("TOPLEFT")
questStatusText:SetSize(380, 280)
questStatusText:SetJustifyH("LEFT")
questStatusText:SetJustifyV("TOP")

-- Function to check if the player is in a raid or dungeon
local function IsInRaidOrDungeon()
    local _, instanceType = IsInInstance()
    return instanceType == "raid" or instanceType == "dungeon"
end

-- Function to generate quest status text
local function GenerateQuestStatusText()
    -- List of quest IDs and names grouped by zone
    local zones = {
        ["Isle of Dorn"] = {
            {id = 85648, name = "Delver's Call: Earthcrawl Mines"},
            {id = 83759, name = "Delver's Call: Kriegval's Rest"},
            {id = 83758, name = "Delver's Call: Fungal Folly"},
        },
        ["Hallowfall"] = {
            {id = 83768, name = "Delver's Call: The Skittering Breach"},
            {id = 85664, name = "Delver's Call: Nightfall Sanctum"},
            {id = 83767, name = "Delver's Call: The Sinkhole"},
            {id = 83769, name = "Delver's Call: Mycomancer Cavern"},
        },
        ["The Ringing Deeps"] = {
            {id = 85649, name = "Delver's Call: The Waterworks"},
            {id = 83766, name = "Delver's Call: The Dread Pit"},
        },
        ["Azj-Kahet"] = {
            {id = 83770, name = "Delver's Call: The Spiral Weave"},
            {id = 83771, name = "Delver's Call: Tak'Rethan Abyss"},
            {id = 85667, name = "Delver's Call: The Underkeep"},
        }
    }

    local questStatusText = ""

    -- Check if each quest is completed and build a multi-line string
    for zone, quests in pairs(zones) do
        questStatusText = questStatusText .. "|cffffcc00" .. zone .. "|r:\n" -- Yellow for zone names
        for _, quest in ipairs(quests) do
            if C_QuestLog.IsQuestFlaggedCompleted(quest.id) then
                questStatusText = questStatusText .. "• " .. quest.name .. ": |cff00ff00Completed|r\n" -- Green for completed
            else
                questStatusText = questStatusText .. "• " .. quest.name .. ": |cffff0000Not Completed|r\n" -- Red for not completed
            end
        end
        questStatusText = questStatusText .. "\n" -- Add a newline for separation between zones
    end

    return questStatusText
end

-- Function to update the quest status display
local function UpdateQuestStatusDisplay()
    if not IsInRaidOrDungeon() then
        local statusText = GenerateQuestStatusText()
        questStatusText:SetText(statusText)
        scrollFrame:UpdateScrollChildRect()
    end
end

-- Event handler
frame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" or event == "ZONE_CHANGED" or event == "QUEST_LOG_UPDATE" then
        UpdateQuestStatusDisplay()
    end
end)

-- Slash command to toggle the quest frame
SLASH_DELVERSQUESTTRACKER1 = "/dqt"
SlashCmdList["DELVERSQUESTTRACKER"] = function()
    if questFrame:IsShown() then
        questFrame:Hide()
    else
        UpdateQuestStatusDisplay()
        questFrame:Show()
    end
end