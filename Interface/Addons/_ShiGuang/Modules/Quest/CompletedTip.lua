--Version: 1.0.0.70300    --Author: InvisiBill
local function onSetHyperlink(self, link)
    local type, id = string.match(link,"^(%a+):(%d+)")
    if not type or not id then return end
    if type == "quest" then
        if IsQuestFlaggedCompleted(id) then
            self:AddDoubleLine(AUCTION_CATEGORY_QUEST_ITEMS, GARRISON_MISSION_COMPLETE, 1, 0.82, 0, 0, 1, 0)
        else
            self:AddDoubleLine(AUCTION_CATEGORY_QUEST_ITEMS, INCOMPLETE , 1, 0.82, 0, 1, 0, 0)
        end
        self:Show()
    end
end

hooksecurefunc(ItemRefTooltip, "SetHyperlink", onSetHyperlink)
hooksecurefunc(GameTooltip, "SetHyperlink", onSetHyperlink)