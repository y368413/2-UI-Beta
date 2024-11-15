local eventFrame = CreateFrame("Frame")

local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
local function encode(data)
    return ((data:gsub('.', function(x)
        local r, b = '', x:byte()
        for i = 8, 1, -1 do
            r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
        end
        return r;
    end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0) end
        return b:sub(c + 1, c + 1)
    end) .. ({'', '==', '='})[#data % 3 + 1])
end

local function saveDetails()
    if _detalhes_database then
        WclBoxCharacter.Details = _detalhes_database
        WclBoxCharacter.DetailsTime = GetServerTime()
        WclBoxCharacter.DetailsAuthor = encode(UnitGUID("player"))
        WclBoxCharacter.DetailsAuthorName = encode(UnitName("player"))
        WclBoxCharacter.DetailsRealmName = encode(GetRealmName())
    end
end

eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_LOGOUT")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

eventFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        local name = UnitName("player")
        local _, class = UnitClass("player")
        local faction = UnitFactionGroup("player")
        local level = UnitLevel("player")
        local realmID = GetRealmID()
        local realmName = GetRealmName()
        local playerGUID = UnitGUID("player")
        local loginTime = time()
        local race = UnitRace("player")
        local gold = GetMoney()

        local key = playerGUID

        WclBoxGlobal = WclBoxGlobal or {}
        WclBoxCharacter = {}
        WclBoxGlobal[key] = {}
        WclBoxGlobal[key].name = name
        WclBoxGlobal[key].class = class
        WclBoxGlobal[key].faction = faction
        WclBoxGlobal[key].level = level
        WclBoxGlobal[key].realmID = realmID
        WclBoxGlobal[key].realmName = realmName
        WclBoxGlobal[key].playerGUID = playerGUID
        WclBoxGlobal[key].loginTime = loginTime
        WclBoxGlobal[key].race = race
        WclBoxGlobal[key].gold = gold

        WclBoxCharacter.name = name
        WclBoxCharacter.class = class
        WclBoxCharacter.faction = faction
        WclBoxCharacter.level = level
        WclBoxCharacter.realmID = realmID
        WclBoxCharacter.realmName = realmName
        WclBoxCharacter.playerGUID = playerGUID
        WclBoxCharacter.loginTime = loginTime
        WclBoxCharacter.race = race
        WclBoxCharacter.gold = gold

        -- Unregister the PLAYER_LOGIN event after handling it
        eventFrame:UnregisterEvent("PLAYER_LOGIN")
    elseif event == "PLAYER_LOGOUT" or event == "ZONE_CHANGED_NEW_AREA" or event == "PLAYER_ENTERING_WORLD" then
        saveDetails()
    end
end)
