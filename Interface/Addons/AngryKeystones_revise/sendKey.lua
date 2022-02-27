local function send_Key()
    local keystoneMapID = C_MythicPlus.GetOwnedKeystoneChallengeMapID()
    local keystoneLevel = C_MythicPlus.GetOwnedKeystoneLevel()

    local message = "0"
    if keystoneLevel and keystoneMapID then
        message = string.format("%d:%d", keystoneMapID, keystoneLevel)
    end
    local data = message.."|".."PARTY"
    C_ChatInfo.SendAddonMessage("AngryKeystones", data, "PARTY", target) -- 将文本发送到指定的其它人的AngryKeystones插件
end

local function Addon_OnEvent(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if IsAddOnLoaded("AngryKeystones") then
            return
        end
        self:RegisterEvent("CHALLENGE_MODE_START") -- 挑战模式开始
        self:RegisterEvent("CHALLENGE_MODE_COMPLETED") -- 挑战模式完成
        self:RegisterEvent("GROUP_ROSTER_UPDATE") -- 团队成员更新
        self:RegisterEvent("CHALLENGE_MODE_MAPS_UPDATE", "CHALLENGE_MODE_UPDATED")
        self:RegisterEvent("CHALLENGE_MODE_LEADERS_UPDATE", "CHALLENGE_MODE_UPDATED")
        self:RegisterEvent("CHALLENGE_MODE_MEMBER_INFO_UPDATED", "CHALLENGE_MODE_UPDATED")

        send_Key()
    elseif event == "CHALLENGE_MODE_COMPLETED" or "GROUP_ROSTER_UPDATE" or "CHALLENGE_MODE_START" or "CHALLENGE_MODE_UPDATED" then
        send_Key()
    end
end

local Listener = CreateFrame('Frame') -- 用于监听事件的窗体
Listener:SetScript('OnEvent', Addon_OnEvent) -- 注册应对不同事件的脚本
Listener:RegisterEvent("PLAYER_LOGIN")