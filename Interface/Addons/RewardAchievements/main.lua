local modName, core = ...
core.Main = {}

local Localization = core.Localization
local Config = core.Config
local Helper = core.Helper
local Cache = core.Cache
local Main = core.Main

local function isAchievementValid(id)
    local categoryId = GetAchievementCategory(id)
    local categoryNum = GetCategoryNumAchievements(categoryId)
    for j = 1, categoryNum do
        local categoryAchievementId = GetAchievementInfo(categoryId, j)
        if (not categoryAchievementId) then
            return false
        end
        if (id == categoryAchievementId) then
            return true
        else
            local nextID = GetNextAchievement(categoryAchievementId)
            if (id == nextID) then
                return true
            end
            while (nextID) do
                if (id == nextID) then
                    return true
                end
                nextID = GetNextAchievement(nextID)
            end
        end
    end
    return false
end

local function validateAchivements(achievementIds)
    local validAchievements, nonValidAchievements = {}, {}

    for key, value in pairs(achievementIds) do
        if isAchievementValid(value) then
            table.insert(validAchievements, value)
        else
            table.insert(nonValidAchievements, value)
        end
    end

    return validAchievements, nonValidAchievements
end

local function updateCache()
    local achievementIds = Cache:GetRewards(true)
    local validAchievementsIds, nonValidAchievementsIds = validateAchivements(achievementIds)

    Helper:PrintDefault(Localization.FOUND_VALID_ACHIEVEMENTS .. #validAchievementsIds)
    Helper:PrintDefault(Localization.FOUND_NONVALID_ACHIEVEMENTS .. #nonValidAchievementsIds)

    Cache:SetValid(validAchievementsIds)
    Cache:SetNonValid(nonValidAchievementsIds)
    Cache:ResetFilters()
end

function Main:InitCache()
    Cache:ValidateVersion()
    if ((not Cache:GetValid()) or (not Cache:GetNonValid())) then
        updateCache()
    end
end

function Main:UpdateCache()
    updateCache()
end

local function printLink(id)
    Helper:Print(GetAchievementLink(id))
end

function Main:ShowRewardAchievements()
    Helper:ForEach(Cache:GetRewards(), printLink)
end
