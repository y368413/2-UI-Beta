--------------------------------------- 人物面板信息 Author: M-------------------------------------

local function copyTable(tab)
	local copy = {}
	for k, v in pairs(tab) do
        copy[k] = (type(v) == "table") and copyTable(v) or v
	end
	return copy
end

--Copy Data
local StatData = copyTable(PAPERDOLL_STATINFO)

--Add Category
StatData.ItemLevelFrame = {
    category   = true,
    frame      = CharacterStatsPane.ItemLevelFrame,
    updateFunc = function(statFrame, unit)
        local avgItemLevel, avgItemLevelEquipped = GetAverageItemLevel()
        if (avgItemLevel == avgItemLevelEquipped) then
            PaperDollFrame_SetLabelAndText(statFrame, STAT_AVERAGE_ITEM_LEVEL, format("%.1f",avgItemLevelEquipped), false, avgItemLevelEquipped)
        else
            PaperDollFrame_SetLabelAndText(statFrame, STAT_AVERAGE_ITEM_LEVEL, format("%.1f / %.1f",avgItemLevelEquipped,avgItemLevel), false, avgItemLevelEquipped)
        end
        statFrame:Show()
    end
}
StatData.AttributesCategory = {
    category = true,
    frame = CharacterStatsPane.AttributesCategory,
    updateFunc = function() end
}
StatData.EnhancementsCategory = {
    category = true,
    frame = CharacterStatsPane.EnhancementsCategory,
    updateFunc = function() end
}

--Add GCD
StatData.GCD = {
    updateFunc = function(statFrame, unit)
        local haste = GetHaste()
        local gcd = max(0.75, 1.5 * 100 / (100+haste))
        PaperDollFrame_SetLabelAndText(statFrame, "GCD", format("%.2fs",gcd), false, gcd)
    end
}

--[[Add RepairCost
StatData.REPAIR_COST = {
    updateFunc = function(statFrame, unit)
        if (not statFrame.scanTooltip) then
            statFrame.scanTooltip = CreateFrame("GameTooltip", "StatRepairCostTooltip", statFrame, "GameTooltipTemplate")
            statFrame.scanTooltip:SetOwner(statFrame, "ANCHOR_NONE")
            statFrame.MoneyFrame = CreateFrame("Frame", "StatRepairCostMoneyFrame", statFrame, "TooltipMoneyFrameTemplate")
            MoneyFrame_SetType(statFrame.MoneyFrame, "TOOLTIP")
            --statFrame.MoneyFrame:SetScale(0.9)
            statFrame.MoneyFrame:SetPoint("RIGHT", 6, -1)
        end
        local totalCost = 0
        local _, repairCost
        for _, index in ipairs({1,3,5,6,7,8,9,10,16,17}) do
            statFrame.scanTooltip:ClearLines()
            _, _, repairCost = statFrame.scanTooltip:SetInventoryItem(unit, index)
            if (repairCost and repairCost > 0) then
                totalCost = totalCost + repairCost
            end
        end
        statFrame.Label:SetText(REPAIR_COST)
        MoneyFrame_Update(statFrame.MoneyFrame, totalCost)
    end
}]]


--Set Shown Data
local ShownData = {
    "ItemLevelFrame",
    
    "AttributesCategory",
        "ALTERNATEMANA", "STRENGTH", "AGILITY", "INTELLECT", "STAMINA",
        "ARMOR", "DODGE", "PARRY", "BLOCK", "MOVESPEED",
        "GCD", --"REPAIR_COST", "HEALTH", "POWER", 
        
    "EnhancementsCategory",
        "CRITCHANCE", "HASTE", "MASTERY", "VERSATILITY", "LIFESTEAL", "AVOIDANCE",
        "ATTACK_DAMAGE", "ATTACK_AP", "RUNE_REGEN", "ATTACK_ATTACKSPEED", --"SPELLPOWER", "FOCUS_REGEN", "ENERGY_REGEN", "MANAREGEN",
}

------------ VIEWS----------
local StatScrollFrame = CreateFrame("ScrollFrame", nil, CharacterFrameInsetRight, "UIPanelScrollFrameTemplate")
StatScrollFrame:SetPoint("TOPLEFT", CharacterFrameInsetRight, "TOPLEFT", 3, -4)
StatScrollFrame:SetPoint("BOTTOMRIGHT", CharacterFrameInsetRight, "BOTTOMRIGHT", -3, 2)
StatScrollFrame.ScrollBar:Hide()
StatScrollFrame.ScrollBar:ClearAllPoints()
StatScrollFrame.ScrollBar:SetPoint("TOPLEFT", StatScrollFrame, "TOPRIGHT", -16, -16)
StatScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", StatScrollFrame, "BOTTOMRIGHT", -16, 16)
StatScrollFrame:HookScript("OnScrollRangeChanged", function(self, xrange, yrange)
    self.ScrollBar:SetShown(floor(yrange) ~= 0)
end)

local StatFrame = CreateFrame("Frame", nil, StatScrollFrame)
StatFrame:SetWidth(197)
StatFrame:SetPoint("TOPLEFT")
StatFrame.AnchorFrame = CreateFrame("Frame", nil, StatFrame)
StatFrame.AnchorFrame:SetSize(StatFrame:GetWidth(), 2)
StatFrame.AnchorFrame:SetPoint("TOPLEFT")
StatScrollFrame:SetScrollChild(StatFrame)

CharacterStatsPane.ItemLevelFrame:SetParent(StatFrame)
CharacterStatsPane.AttributesCategory:SetParent(StatFrame)
CharacterStatsPane.EnhancementsCategory:SetParent(StatFrame)
CharacterStatsPane.ItemLevelFrame.Value:SetFont(CharacterStatsPane.ItemLevelFrame.Value:GetFont(), 21, "OUTLINE")
CharacterStatsPane.ItemLevelFrame.Value:SetPoint("CENTER",CharacterStatsPane.ItemLevelFrame.Background, "CENTER", 0, 0)

local function UpdateStatFrameWidth(width)
    for _, key in ipairs(ShownData) do
        if (StatData[key]) then
            StatData[key].frame:SetWidth(width)
            if (StatData[key].frame.Background) then
                StatData[key].frame.Background:SetWidth(width)
            end
        end
    end
end

local function ShowCharacterStats(unit)
    local stat
    local count, height = 0, 4
    local lastAnchor = StatFrame.AnchorFrame
    for _, key in ipairs(ShownData) do
        stat = StatData[key]
        if (stat) then
            if (not stat.frame) then
                if (stat.category) then
                    stat.frame = CreateFrame("FRAME", nil, StatFrame, "CharacterStatFrameCategoryTemplate")
                else
                    stat.frame = CreateFrame("FRAME", nil, StatFrame, "CharacterStatFrameTemplate")
                end
            end
            stat.updateFunc(stat.frame, unit)
            if (stat.frame.numericValue == 0 or stat.frame.tooltip2 == STAT_NO_BENEFIT_TOOLTIP) then
                stat.frame:Hide()
            end
            if (stat.frame:IsShown()) then
                stat.frame:ClearAllPoints()
                stat.frame:SetPoint("TOPLEFT", lastAnchor, "BOTTOMLEFT", 0, 0)
                if (stat.category) then
                    count = 0
                else
                    stat.frame.Background:SetShown((count%2) ~= 0)
                    count = count + 1
                end
                lastAnchor = stat.frame
                height = height + stat.frame:GetHeight()
            end
        end
    end
    height = floor(height)
    StatFrame:SetHeight(height)
    UpdateStatFrameWidth(height > 353 and 180 or 197)
end

CharacterStatsPane:HookScript("OnShow", function(self)
    self:Hide()
    StatScrollFrame:Show()
end)

hooksecurefunc("PaperDollFrame_UpdateStats", function() ShowCharacterStats("player") end)

hooksecurefunc("PaperDollFrame_SetSidebar", function(self, index)
    if (PaperDollFrame.currentSideBar and PaperDollFrame.currentSideBar:GetName() == "CharacterStatsPane") then
        StatScrollFrame:Show()
    else
        StatScrollFrame:Hide()
    end
end)

