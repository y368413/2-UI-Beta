
local function ElvUI_Support()
    local E = ElvUI[1];
    local S = E:GetModule("Skins"); -- 皮肤模块
    if E.private.skins.blizzard.enable and E.private.skins.blizzard.friends then
        WhoFrameColumnHeader5:StripTextures()
        WhoFrameColumnHeader6:StripTextures()
    end
    S:HandleTab(_G['FriendsFrameTab5'])
end

local function event_Handler(self, event, ...)
    if event == "PLAYER_LOGIN" and IsAddOnLoaded("ElvUI") then
        ElvUI_Support()
    end
end


local Listener = CreateFrame('Frame', nil)
Listener:RegisterEvent("PLAYER_LOGIN")
Listener:SetScript('OnEvent', event_Handler)