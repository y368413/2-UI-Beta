-- Addon Name and Variables
local addonName, addonTable = ...
local DelveStoryStatus = CreateFrame("Frame")

-- Story achievements table
local storyAchievements = {
    [40525] = true,
    [40526] = true,
    [40527] = true,
    [40528] = true,
    [40529] = true,
    [40530] = true,
    [40531] = true,
    [40532] = true,
    [40533] = true,
    [40534] = true,
    [40535] = true,
    [40536] = true, 
}

-- Function to handle Gossip Show event
local function HandleGossipShow(...)
    local kit = ...
    if kit == "delves-difficulty-picker" then
        -- Process achievements
        for aid in pairs(storyAchievements) do
            local _, _, _, achievementCompleted = GetAchievementInfo(aid)
            for criteriaIndex = 1, GetAchievementNumCriteria(aid) do
                local storyName, _, criteriaCompleted = GetAchievementCriteriaInfo(aid, criteriaIndex)
                if storyName then
                    addonTable[storyName] = addonTable[storyName] or {}
                    addonTable[storyName].achievement = achievementCompleted
                    addonTable[storyName].criteria = criteriaCompleted
                end
            end
        end

        -- Variables for UI updates
        local progressText = STORY_PROGRESS
        local completeText = GOAL_COMPLETED
        local incompleteText = INCOMPLETE
        local achievementEarnedText = ACHIEVEMENT_UNLOCKED
        local achievementIncompleteText = SUMMARY_ACHIEVEMENT_INCOMPLETE

        local progressFormat = "\n\n|cnBATTLENET_FONT_COLOR:" .. progressText
        local checkIcon = ":|r\n|A:common-icon-checkmark:0:0|a |cn"
        local crossIcon = ":|r\n|A:common-icon-redx:0:0|a |cn"
        local styleComplete = checkIcon .. "GREEN_FONT_COLOR:" .. completeText .. "|r"
        local styleIncomplete = crossIcon .. "RED_FONT_COLOR:" .. incompleteText .. "|r"
        local achievementYes = "\n(|cnGREEN_FONT_COLOR:" .. achievementEarnedText .. "|r)"
        local achievementNo = "\n(|cnRED_FONT_COLOR:" .. achievementIncompleteText .. "|r)"

        local descriptionText = C_GossipInfo.GetCustomGossipDescriptionString()
        local activeStory = addonTable[(descriptionText or ""):match(":(.-)|")]

        if activeStory then
            local statusText = progressFormat .. (activeStory.criteria and styleComplete or styleIncomplete)
            local achievementText = activeStory.criteria and (activeStory.achievement and achievementYes or achievementNo) or ""

            DelvesDifficultyPickerFrame.Description:SetHeight(179)
            DelvesDifficultyPickerFrame.Description:SetText(descriptionText .. statusText .. achievementText)
        end
    end
end

-- Event Registration
DelveStoryStatus:RegisterEvent("GOSSIP_SHOW")
DelveStoryStatus:SetScript("OnEvent", function(_, event, ...)
    if event == "GOSSIP_SHOW" then
        HandleGossipShow(...)
    end
end)

-- Addon Initialization
function DelveStoryStatus:OnLoad()
    print("Delve Story Loaded!")
end

DelveStoryStatus:OnLoad()