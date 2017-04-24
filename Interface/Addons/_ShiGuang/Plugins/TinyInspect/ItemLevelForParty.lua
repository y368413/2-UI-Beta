--------------------------------------- 小隊隊友装备等级 Author: M-------------------------------------
local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local members, numMembers = {}, 0

--打印隊伍裝備等級
local function PrintPartyItemLevel()
    local color
    --DEFAULT_CHAT_FRAME:AddMessage(string.rep("-", 36), 1, 0.8, 0)
    for _, v in pairs(members) do
        color = RAID_CLASS_COLORS[v.class] or NORMAL_FONT_COLOR
        DEFAULT_CHAT_FRAME:AddMessage(format("<%s> %.1f |c%s%s|r", ITEM_LEVEL_ABBR, v.level, color.colorStr, v.name), 1, 0.8, 0)
    end
    --DEFAULT_CHAT_FRAME:AddMessage(string.rep("-", 36), 1, 0.8, 0)
end
--防止重復發送
local lastBroadcastTimer = 0
local function filter(self, event, msg, name, ...)
    if (string.find(msg, "<"..ITEM_LEVEL_ABBR..">")) then
        local uname = UnitName("player") .. "-" .. GetRealmName()
        if (name ~= uname) then
            lastBroadcastTimer = GetTime()
        end
    end
    return false, msg, name, ...
end
ChatFrame_AddMessageEventFilter("CHAT_MSG_PARTY", filter)
ChatFrame_AddMessageEventFilter("CHAT_MSG_INSTANCE_CHAT", filter)

--報告隊伍裝等
local function BroadcastItemLevelToParty()
    if (GetTime() - lastBroadcastTimer < 6) then
        return table.wipe(members)
    end
    local total = select(2, GetAverageItemLevel())
    local maxLevel, minLevel = total, total
    local count = 1
    local channel = IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and "INSTANCE_CHAT" or "PARTY"
    SendChatMessage(string.rep("-", 24), channel)
    SendChatMessage(format("<%s> %.1f %s", ITEM_LEVEL_ABBR, total, UnitName("player")), channel)
    for _, v in pairs(members) do
        total = total + v.level
        count = count + 1
        if (v.level > maxLevel) then
            maxLevel = v.level
        end
        if (v.level < minLevel) then
            minLevel = v.level
        end
        SendChatMessage(format("<%s> %.1f %s", ITEM_LEVEL_ABBR, v.level, v.name), channel)
    end
    SendChatMessage(string.rep("-", 24), channel)
end

--(隊列)讀取隊友裝備等級
function GetPartyItemLevel(id, final)
    local unit = "party" .. id
    local guid = UnitGUID(unit)
    if (not guid or not CanInspect(unit)) then return end
    NotifyInspect(unit)
    LibSchedule:AddTask({
        final     = final,
        unit      = unit,
        name      = UnitName(unit),
        class     = select(2,UnitClass(unit)),
        identity  = guid,
        elasped   = 0.6,
        expired   = GetTime() + 3,
        onTimeout = function(self) table.wipe(members) end,
        onExecute = function(self)
            local unknownCount, equippedLevel = LibItemInfo:GetUnitItemLevel(unit)
            if (unknownCount == 0 and equippedLevel > 0) then
                members[self.identity] = {name=self.name or UnitName(self.unit),class=self.class,level=equippedLevel}
                if (UnitExists("party"..(id+1))) then
                    GetPartyItemLevel(id+1, self.final)
                else
                    if (not self.final) then
                        C_Timer.After(3, function() GetPartyItemLevel(1, true) end) --2秒后再次重新獲取
                        return true
                    end
                        PrintPartyItemLevel() --僅自己看
                        --BroadcastItemLevelToParty() --隊頻報告
                    table.wipe(members)
                end
                return true
            end
        end,
    })
end

--隊友增加時才處理
local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("GROUP_ROSTER_UPDATE")
frame:SetScript("OnEvent", function(self, event, ...)
    if (event == "GROUP_ROSTER_UPDATE" and not IsInRaid()) then
        local numCurrent = GetNumSubgroupMembers()
        if (numCurrent ~= numMembers) then
            if (numCurrent > numMembers) then
                --隊伍成立瞬間,部分隊友顯示是離綫,所以要用Task模式
                LibSchedule:AddTask({
                    identity  = "AllUnitIsConnected",
                    elasped   = 1,
                    begined   = GetTime() + 2,
                    expired   = GetTime() + 12,
                    onExecute = function(self)
                        local done = true
                        for i = 1, numCurrent do
                            if (not UnitIsConnected("party"..i)) then
                                done = false
                                break
                            end
                        end
                        if (done) then
                            GetPartyItemLevel(1)
                            return true
                        end
                    end,
                })
            end
            numMembers = GetNumSubgroupMembers()
        end
    end
end)
