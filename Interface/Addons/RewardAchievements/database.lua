local modName, core = ...
core.Database = {}

local Localization = core.Localization
local Config = core.Config
local Helper = core.Helper
local Database = core.Database

local ALL_KEY = Config.DB_KEYS.ALL
local REWARDS_KEY = Config.DB_KEYS.REWARDS
local MOUNTS_KEY = Config.DB_KEYS.MOUNTS
local PETS_KEY = Config.DB_KEYS.PETS
local TITLES_KEY = Config.DB_KEYS.TITLES
local TOYS_KEY = Config.DB_KEYS.TOYS

local DatabaseCache = {
    ALL = nil,
    REWARDS = nil,
    MOUNTS = nil,
    PETS = nil,
    TITLES = nil,
    TOYS = nil
}

local function getCache(key)
    if (DatabaseCache[key]) then
        return DatabaseCache[key]
    end
    return nil
end

local function setCache(key, value)
    DatabaseCache[key] = value
end

local function getCacheOrSource(key, sourceFunc)
    local cache = getCache(key)
    if (cache) then
        Helper:Log("Get data from cache for " .. key)
        return cache
    end

    if (type(sourceFunc) ~= "function") then
        Helper:Log("Source function is not valid for " .. key)
        return nil
    end

    Helper:Log("Get data from source function for " .. key)
    local result = sourceFunc()
    setCache(key, result)

    return result
end

function Database:GetAllIds()
    local sourceFunc = function()
        local achievementIds = {}
        for i = Config.minAchievementId, Config.maxAchievementId do
            local id = GetAchievementInfo(i)
            if (id ~= nil) then
                table.insert(achievementIds, id)
            end
        end

        return achievementIds
    end

    return getCacheOrSource(ALL_KEY, sourceFunc)
end

function Database:GetAllRewardAchievementIds()
    local sourceFunc = function()
        local achievementIds = Database:GetAllIds()
        local filtered =
            Helper:Filter(
            achievementIds,
            function(id)
                local rewardText = select(11, GetAchievementInfo(id))
                return not Helper:IsNilOrEmpty(rewardText)
            end
        )

        return filtered
    end

    return getCacheOrSource(REWARDS_KEY, sourceFunc)
end

function Database:GetAllTitleAchievementIds()
    local sourceFunc = function()
        local achievementIds = Database:GetAllRewardAchievementIds()
        local filtered =
            Helper:Filter(
            achievementIds,
            function(id)
                local titleText = Localization.ACHIEVEMENT_TITLE_STRING
                local rewardText = select(11, GetAchievementInfo(id))
                return string.match(string.lower(rewardText), string.lower(titleText)) ~= nil
            end
        )

        return filtered
    end

    return getCacheOrSource(TITLES_KEY, sourceFunc)
end

function Database:GetAllPetAchievementIds()
    local sourceFunc = function()
        local achievementIds = Database:GetAllRewardAchievementIds()
        C_PetJournal.GetPetInfoByItemID(1)
        local filtered =
            Helper:Filter(
            achievementIds,
            function(id)
                local itemId = C_AchievementInfo.GetRewardItemID(id)
                if (not itemId) then
                    return false
                end
                local info = C_PetJournal.GetPetInfoByItemID(itemId)
                return info ~= nil
            end
        )
        return filtered
    end

    return getCacheOrSource(PETS_KEY, sourceFunc)
end

function Database:GetAllToyAchievementIds()
    local sourceFunc = function()
        local achievementIds = Database:GetAllRewardAchievementIds()
        local filtered =
            Helper:Filter(
            achievementIds,
            function(id)
                local itemId = C_AchievementInfo.GetRewardItemID(id)
                if (not itemId) then
                    return false
                end
                local info = C_ToyBox.GetToyInfo(itemId)
                return info ~= nil
            end
        )
        return filtered
    end

    return getCacheOrSource(TOYS_KEY, sourceFunc)
end

function Database:GetAllMountAchievementIds1()
    local sourceFunc = function()
        local achievementIds = Database:GetAllRewardAchievementIds()
        local filtered =
            Helper:Filter(
            achievementIds,
            function(id)
                local itemId = C_AchievementInfo.GetRewardItemID(id)
                if (not itemId) then
                    return false
                end
                local info = C_MountJournal.GetMountFromItem(itemId)
                return info ~= nil
            end
        )
        return filtered
    end

    return getCacheOrSource(MOUNTS_KEY, sourceFunc)
end

function Database:GetAllMountAchivementIds2(callback)
    local cache = getCache(MOUNTS_KEY)
    if (cache) then
        if (type(callback) == "function") then
            callback(cache)
        end
        return cache
    end

    local achievementIds = Database:GetAllRewardAchievementIds()
    local mountIds = C_MountJournal.GetMountIDs()
    local achievementWithMounts = {}

    local filter = function(achievId)
        local rewardText = select(11, GetAchievementInfo(achievId))
        local matchingMauntId =
            Helper:GetFirstOrDefault(
            mountIds,
            function(mountId)
                local name = C_MountJournal.GetMountInfoByID(mountId)
                if (Helper:IsNilOrEmpty(name)) then
                    return false
                end
                return string.match(string.lower(rewardText), string.lower(name)) ~= nil
            end
        )
        return matchingMauntId ~= nil
    end

    local chunkSize = 100
    local i = 1
    local function parseChunk()
        local indexStart = (i - 1) * chunkSize + 1
        local indexEnd = indexStart + chunkSize - 1
        local isLast = false
        if (indexEnd > #achievementIds) then
            indexEnd = #achievementIds
            isLast = true
        end
        Helper:Log("Parse reward achievements from " .. indexStart .. " to " .. indexEnd)
        for j = indexStart, indexEnd do
            local achievementId = achievementIds[j]
            if (filter(achievementId)) then
                tinsert(achievementWithMounts, achievementId)
            end
        end
        local percentage = math.floor(indexEnd * 100 / #achievementIds)
        Helper:Log(percentage .. "%")
        i = i + 1
        if (not isLast) then
            C_Timer.After(1, parseChunk)
        else
            Helper:Log("Found " .. #achievementWithMounts .. " achievements with mounts")
            setCache(MOUNTS_KEY, achievementWithMounts)
            if (type(callback) == "function") then
                callback(achievementWithMounts)
            end
        end
    end
    Helper:Log("Start looking for mount reward achievements")
    parseChunk()

    return getCache(MOUNTS_KEY)
end
