-- 想看能不能给BlizzMove打污染补丁，但作者使用了匿名表，目前没有办法。
local function event_deal(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if IsAddOnLoaded("BlizzMove") and _G.BlizzMoveAPI then

            function BlizzMoveAPI:RegisterFrames(framesTable)

                for frameName, frameData in pairs(framesTable) do
            
                    if not BlizzMove:ValidateFrame(frameName, frameData) then
            
                        BlizzMove:DebugPrint("Invalid frame data provided for frame: '", frameName, "'.");
                        return false;
            
                    end
            
                    BlizzMove:RegisterFrame(nil, frameName, frameData, true);
            
                end
            
                if BlizzMove.initialized then
            
                    BlizzMove.Config:RegisterOptions();
            
                end
            
            end

        end
    end
end

local temp = CreateFrame("Frame")
temp:RegisterEvent("PLAYER_LOGIN")
temp:SetScript("OnEvent", event_deal)