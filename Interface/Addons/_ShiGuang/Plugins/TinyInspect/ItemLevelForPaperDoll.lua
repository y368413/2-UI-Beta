
-------------------------------------
-- 查看面板信息 Author: M
-------------------------------------

local LibSchedule = LibStub:GetLibrary("LibSchedule.7000")
local LibItemInfo = LibStub:GetLibrary("LibItemInfo.7000")

local OutsideLevelString = true

local function ShowPaperDollItemLevel(self, unit)
    local id = self:GetID()
    if (id == 4 or id > 17) then return end
    if (not self.levelString) then
        local fontAdjust = GetLocale():sub(1,2) == "zh" and 0 or -3
        self.levelString = self:CreateFontString(nil, "OVERLAY")
        self.levelString:SetFont(STANDARD_TEXT_FONT, 14+fontAdjust, "OUTLINE")
        self.levelString:SetPoint("TOP")
        self.levelString:SetTextColor(1, 0.82, 0)
        if (OutsideLevelString) then
            self.levelString:ClearAllPoints()
            if (id <= 5 or id == 9 or id == 15) then
                self.levelString:SetPoint("LEFT", self, "RIGHT", 3, 6)
            elseif (id == 16) then
                self.levelString:SetPoint("RIGHT", self, "LEFT", -3, 8)
            elseif (id == 17) then
                self.levelString:SetPoint("LEFT", self, "RIGHT", 3, 8)
            else
                self.levelString:SetPoint("RIGHT", self, "LEFT", -3, 6)
            end
        end
    end
    local result
    if (unit and self.hasItem) then
        local unknownCount, level, _, link, quality = LibItemInfo:GetUnitItemInfo(unit, id)
        if (level > 0 and quality) then
            --if (OutsideLevelString) then
            --local r, g, b = GetItemQualityColor(quality)
            --self.levelString:SetTextColor(r, g, b)
            --end
            self.levelString:SetText(level)
            result = true
        end
    else
        self.levelString:SetText("")
        result = true
    end
    
    if (id == 16 or id == 17) then
        local _, mlevel, _, _, mquality = LibItemInfo:GetUnitItemInfo(unit, 16)
        local _, olevel, _, _, oquality = LibItemInfo:GetUnitItemInfo(unit, 17)
        if (mlevel > 0 and olevel > 0 and (mquality == 6 or oquality == 6)) then
            self.levelString:SetText(max(mlevel, olevel))
        end
    end

    return result
end

hooksecurefunc("PaperDollItemSlotButton_Update", function(self)
    ShowPaperDollItemLevel(self, "player")
end)

local frame = CreateFrame("Frame", nil, UIParent)
frame:RegisterEvent("INSPECT_READY")
frame:SetScript("OnEvent", function(self, event, arg1)
    if (event == "INSPECT_READY" and InspectFrame and InspectFrame.unit and UnitGUID(InspectFrame.unit) == arg1) then
        for _, button in ipairs({
              InspectHeadSlot,InspectNeckSlot,InspectShoulderSlot,InspectBackSlot,InspectChestSlot,InspectWristSlot,
              InspectHandsSlot,InspectWaistSlot,InspectLegsSlot,InspectFeetSlot,InspectFinger0Slot,InspectFinger1Slot,
              InspectTrinket0Slot,InspectTrinket1Slot,InspectMainHandSlot,InspectSecondaryHandSlot
            }) do
            LibSchedule:AddTask({
                button    = button,
                identity  = button:GetName(),
                elasped   = 1,
                expired   = GetTime() + 4,
                onStart   = function(self)
                    if (self.button.levelString) then
                        self.button.levelString:SetText("")
                    end
                end,
                onExecute = function(self)
                    if (not InspectFrame.unit) then return end
                    return ShowPaperDollItemLevel(self.button, InspectFrame.unit)
                end,
            })
        end
    end
end)

-- ALT --
if (EquipmentFlyout_DisplayButton) then
    local function ShowEquipmentFlyoutItemLevel(self, level)
        if (not self.levelString) then
            local fontAdjust = GetLocale():sub(1,2) == "zh" and 0 or -3
            self.levelString = self:CreateFontString(nil, "OVERLAY")
            self.levelString:SetFont(STANDARD_TEXT_FONT, 14+fontAdjust, "OUTLINE")
            self.levelString:SetPoint("TOP")
            self.levelString:SetTextColor(1, 0.82, 0)
        end
        if (level > 0) then
            self.levelString:SetText(level)
        else
            self.levelString:SetText("")
        end
    end
    hooksecurefunc("EquipmentFlyout_DisplayButton", function(button, paperDollItemSlot)
        local location = button.location
        if (not location) then return end
        local player, bank, bags, voidStorage, slot, bag, tab, voidSlot = EquipmentManager_UnpackLocation(location)
        if (not player and not bank and not bags and not voidStorage) then return end
        if (voidStorage) then return end
        local ItemLink, level
        if (bags) then
            ItemLink = GetContainerItemLink(bag, slot)
        else
            ItemLink = GetInventoryItemLink("player", slot)
        end
        level = select(2, LibItemInfo:GetItemInfo(ItemLink))
        ShowEquipmentFlyoutItemLevel(button, level)
    end)
end
