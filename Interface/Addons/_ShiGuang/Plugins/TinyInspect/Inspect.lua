
-------------------------------------
-- 查看装备等级 Author: M
-------------------------------------

local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local slots = {
    { index = 1, name = HEADSLOT, },
    { index = 2, name = NECKSLOT, },
    { index = 3, name = SHOULDERSLOT, },
    { index = 5, name = CHESTSLOT, },
    { index = 6, name = WAISTSLOT, },
    { index = 7, name = LEGSSLOT, },
    { index = 8, name = FEETSLOT, },
    { index = 9, name = WRISTSLOT, },
    { index = 10, name = HANDSSLOT, },
    { index = 11, name = FINGER0SLOT, },
    { index = 12, name = FINGER1SLOT, },
    { index = 13, name = TRINKET0SLOT, },
    { index = 14, name = TRINKET1SLOT, },
    { index = 15, name = BACKSLOT, },
    { index = 16, name = MAINHANDSLOT, },
    { index = 17, name = SECONDARYHANDSLOT, },
}

--這裡可以修改字體
local ItemFont = "ChatFontNormal"  --"GameTooltipText"

local function GetInspectItemListFrame(parent)
    if (not parent.inspectFrame) then
        local backdrop = {
            bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
            edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
            tile     = true,
            tileSize = 8,
            edgeSize = 16,
            insets   = {left = 4, right = 4, top = 4, bottom = 4}
        }
        local frame = CreateFrame("Frame", nil, parent)
        frame:SetSize(160, 424)
        frame:SetPoint("TOPLEFT", parent, "TOPRIGHT", 0, 0)
        frame:SetBackdrop(backdrop)
        frame:SetBackdropColor(0, 0, 0)
        frame:SetBackdropBorderColor(1, 1, 1)
        frame.portrait = CreateFrame("Frame", nil, frame, "GarrisonFollowerPortraitTemplate")
        frame.portrait:SetPoint("TOPLEFT", frame, "TOPLEFT", 18, -16)
        frame.portrait:SetScale(0.8)
        frame.title = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLargeOutline")
        frame.title:SetPoint("TOPLEFT", frame, "TOPLEFT", 66, -18)
        frame.level = frame:CreateFontString(nil, "ARTWORK", ItemFont)
        frame.level:SetPoint("TOPLEFT", frame, "TOPLEFT", 66, -42)
        frame.level:SetFont(frame.level:GetFont(), 14, "THINOUTLINE")
        
        local itemframe
        local fontsize = GetLocale():sub(1,2) == "zh" and 12 or 9
        backdrop.edgeSize = 8
        backdrop.insets = {left = 1, right = 1, top = 1, bottom = 1}
        for i, v in ipairs(slots) do
            itemframe = CreateFrame("Button", nil, frame)
            itemframe:SetSize(120, 340/#slots)
            itemframe.index = v.index
            if (i == 1) then
                itemframe:SetPoint("TOPLEFT", frame, "TOPLEFT", 16, -70)
            else
                itemframe:SetPoint("TOPLEFT", frame["item"..(i-1)], "BOTTOMLEFT")
            end
            itemframe.label = CreateFrame("Frame", nil, itemframe)
            itemframe.label:SetSize(36, 16)
            itemframe.label:SetPoint("LEFT")
            itemframe.label:SetBackdrop(backdrop)
            itemframe.label:SetBackdropBorderColor(0, 0.8, 0.8, 0.4)
            itemframe.label:SetBackdropColor(0, 0.9, 0.9, 0.3)
            itemframe.label.text = itemframe.label:CreateFontString(nil, "ARTWORK")
            itemframe.label.text:SetFont(UNIT_NAME_FONT, fontsize, "OUTLINE")
            itemframe.label.text:SetSize(34, 14)
            itemframe.label.text:SetPoint("CENTER", 1, 0)
            itemframe.label.text:SetText(v.name)
            itemframe.label.text:SetTextColor(0, 1, 1, 0.9)
            itemframe.levelString = itemframe:CreateFontString(nil, "ARTWORK", ItemFont)
            itemframe.levelString:SetPoint("LEFT", itemframe.label, "RIGHT", 3, 0)
            itemframe.itemString = itemframe:CreateFontString(nil, "ARTWORK", ItemFont)
            itemframe.itemString:SetPoint("LEFT", itemframe.levelString, "RIGHT", 2, 0)
            itemframe:SetScript("OnEnter", function(self)
                self.label:SetBackdropColor(0, 0.9, 0.9, 1)
                if (self.link or (self.level and self.level > 0)) then
                    GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                    GameTooltip:SetInventoryItem(self:GetParent().unit, self.index)
                    GameTooltip:Show()
                end
            end)
            itemframe:SetScript("OnLeave", function(self)
                self.label:SetBackdropColor(0, 0.9, 0.9, 0.3)
                GameTooltip:Hide()
            end)
            itemframe:SetScript("OnClick", function(self)
                if (IsShiftKeyDown() and self.link) then
                    ChatEdit_InsertLink(self.link)
                end
            end)
            itemframe:SetScript("OnDoubleClick", function(self)
                if (self.link) then
                    ChatEdit_ActivateChat(ChatEdit_ChooseBoxForSend())
                    ChatEdit_InsertLink(self.link)
                end
            end)
            frame["item"..i] = itemframe
        end
        
        parent:HookScript("OnHide", function(self) frame:Hide() end)
        GearManagerDialogPopup:SetFrameLevel(frame:GetFrameLevel() + 10)
        parent.inspectFrame = frame
    end
    return parent.inspectFrame
end

local ItemLevelPattern = gsub(ITEM_LEVEL, "%%d", "%%.1f")  --"%%d"

function ShowInspectItemListFrame(unit, parent, itemLevel)
    if (not parent:IsShown()) then return end
    local frame = GetInspectItemListFrame(parent)
    local class = select(2, UnitClass(unit))
    local color = RAID_CLASS_COLORS[class] or NORMAL_FONT_COLOR
    frame.unit = unit
    frame:SetBackdropBorderColor(color.r, color.g, color.b)
    frame.portrait:SetLevel(UnitLevel(unit))
    frame.portrait.PortraitRingQuality:SetVertexColor(color.r, color.g, color.b)
    frame.portrait.LevelBorder:SetVertexColor(color.r, color.g, color.b)
    SetPortraitTexture(frame.portrait.Portrait, unit)
    frame.title:SetText(UnitName(unit))
    frame.title:SetTextColor(color.r, color.g, color.b)
    frame.level:SetText(format(ItemLevelPattern, itemLevel))
    frame.level:SetTextColor(1, 0.82, 0)
    local _, name, level, link, quality
    local itemframe, mframe, oframe
    local width = 160
    for i, v in ipairs(slots) do
        _, level, name, link, quality = LibItemInfo:GetUnitItemInfo(unit, v.index)
        itemframe = frame["item"..i]
        itemframe.name = name
        itemframe.link = link
        itemframe.level = level
        itemframe.quality = quality
        if (level > 0) then
            itemframe.levelString:SetText(format("%3s",level))
            itemframe.itemString:SetText(link or name)
        else
            itemframe.levelString:SetText(format("%3s",""))
            itemframe.itemString:SetText("")
        end
        itemframe.width = itemframe.itemString:GetWidth() + 64
        itemframe:SetWidth(itemframe.width)
        if (width < itemframe.width) then
            width = itemframe.width
        end
        if (v.index == 16) then
            mframe = itemframe
            mframe:SetAlpha(1)
        elseif (v.index == 17) then
            oframe = itemframe
            oframe:SetAlpha(1)
        end
    end
    if (mframe and mframe.quality == 6 and oframe and oframe.link) then
        level = max(mframe.level, oframe.level)
        mframe.levelString:SetText(format("%3s",level))
        oframe.levelString:SetText(format("%3s",level))
    elseif (mframe.level > 0 and oframe.level > 0 and (mframe.quality == 6 or oframe.quality == 6)) then
        level = max(mframe.level, oframe.level)
        mframe.levelString:SetText(format("%3s",level))
        oframe.levelString:SetText(format("%3s",level))
    end
    if (mframe and mframe.level <= 0) then
        mframe:SetAlpha(0.4)
    end
    if (oframe and oframe.level <= 0) then
        oframe:SetAlpha(0.4)
    end
    frame:SetWidth(width + 36)
    frame:Show()
    return frame
end

local function onStart(self)
    InspectFrame.progress:SetText("Reading...")
end

local function onTimeout(self)
    InspectFrame.progress:SetText("Failed")
end

local function onSuccess(self)
    InspectFrame.progress:SetText("")
end

local function onExecute(self)
    if (not InspectFrame.unit or self.identity ~= UnitGUID(InspectFrame.unit)) then return end
    local unknownCount, itemLevel = LibItemInfo:GetUnitItemLevel(InspectFrame.unit)
    if (unknownCount == 0) then
        onSuccess(self)
        local parent = ShowInspectItemListFrame(InspectFrame.unit, InspectFrame, itemLevel)
        if parent then

                local playerFrame = ShowInspectItemListFrame("player", parent, select(2,GetAverageItemLevel()))
                if (parent.statsFrame) then
                    parent.statsFrame:SetParent(playerFrame)
                end
            if (parent.statsFrame) then
                parent.statsFrame:SetParent(parent)
            end
        end
        if (parent and parent.statsFrame) then
            parent.statsFrame:SetPoint("TOPLEFT", parent.statsFrame:GetParent(), "TOPRIGHT", 0, -1)
        end

        LibSchedule:AwakeTask("Inspect.+Slot", true)
        return true
    end
end

local function AppendToBlizzardInspectUI()
    if (not InspectFrame.progress) then
        InspectFrame.progress = InspectPaperDollFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        InspectFrame.progress:SetPoint("RIGHT", InspectFrame.TitleText, "RIGHT", 48, -38)
        InspectFrame.progress:SetJustifyH("RIGHT")
        InspectFrame.progress:SetTextColor(0, 0.8, 0.8)
    end
    LibSchedule:AddTask({
        identity  = UnitGUID(InspectFrame.unit),
        timer     = 0.64,
        elasped   = 0.72,
        expired   = GetTime() + 4,
        onStart   = onStart,
        onTimeout = onTimeout,
        onExecute = onExecute,
    })
end

local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("UNIT_LEVEL")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("UNIT_INVENTORY_CHANGED")
frame:RegisterEvent("PLAYER_EQUIPMENT_CHANGED")
frame:SetScript("OnEvent", function(self, event, arg1)
    if (event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI") then
        hooksecurefunc("InspectFrame_UpdateTabs", function()
            if (not InspectFrame.unit) then return end
            AppendToBlizzardInspectUI()
        end)
        self:UnregisterEvent("ADDON_LOADED")
    elseif (event == "UNIT_INVENTORY_CHANGED") then
        if (InspectFrame and InspectFrame.unit and arg1 == InspectFrame.unit) then
            AppendToBlizzardInspectUI()
        end
    --elseif (event == "PLAYER_EQUIPMENT_CHANGED" and CharacterFrame:IsShown()) then
        --ShowInspectItemListFrame("player", PaperDollFrame, select(2,GetAverageItemLevel()))
    --elseif (event == "UNIT_LEVEL" and arg1 == "player" and CharacterFrame:IsShown()) then
        --ShowInspectItemListFrame("player", PaperDollFrame, select(2,GetAverageItemLevel()))
    end
end)

--PaperDollFrame:HookScript("OnShow", function(self)
    --ShowInspectItemListFrame("player", self, select(2,GetAverageItemLevel()))
--end)
