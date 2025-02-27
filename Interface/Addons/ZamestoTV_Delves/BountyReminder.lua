-- Addon Name
local addonName = "BountyReminder"

-- Constants
local ITEM_ID = 227784
local SPELL_ID = 460831
local ICON_TEXTURE = 1064187
local TEXT = "Use Delver's Bounty!"

-- Frame for the icon and text
local frame = CreateFrame("Frame", nil, UIParent)
frame:SetSize(64, 64)
frame:SetPoint("CENTER", 0, 130)
frame:Hide()

local icon = frame:CreateTexture(nil, "ARTWORK")
icon:SetTexture(ICON_TEXTURE)
icon:SetAllPoints(frame)

local text = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
text:SetFont("Fonts\\FRIZQT__.TTF", 18, "OUTLINE")
text:SetText(TEXT)
text:SetPoint("BOTTOM", frame, "TOP", 0, 5)

-- Variables for frame movement
local isMoving = false
local frameOffsetX, frameOffsetY

-- Event Handlers
local function OnEvent(self, event, ...)
    if event == "BAG_UPDATE" then
        -- Check all bags for the item
        for bag = 0, NUM_BAG_SLOTS do
            for slot = 1, C_Container.GetContainerNumSlots(bag) do
                local itemLink = C_Container.GetContainerItemLink(bag, slot)
                if itemLink then
                    local _, _, itemId = string.find(itemLink, "item:(%d+):")
                    if tonumber(itemId) == ITEM_ID then
                        frame:Show()
                        return  -- Exit the function once the item is found
                    end
                end
            end
        end
        -- If the item is not found in any bag, hide the frame
        frame:Hide()
    elseif event == "UNIT_AURA" then
        local unit = ...
        if unit == "player" then
            local hasAura = C_UnitAuras.GetPlayerAuraBySpellID(SPELL_ID)
            if hasAura then
                frame:Hide()
            else
                -- Check if the item is still in bags to show the frame if necessary
                for bag = 0, NUM_BAG_SLOTS do
                    for slot = 1, C_Container.GetContainerNumSlots(bag) do
                        local itemLink = C_Container.GetContainerItemLink(bag, slot)
                        if itemLink then
                            local _, _, itemId = string.find(itemLink, "item:(%d+):")
                            if tonumber(itemId) == ITEM_ID then
                                frame:Show()
                                return
                            end
                        end
                    end
                end
            end
        end
    elseif event == "PLAYER_LOGIN" then
        -- Initialize the addon
        SLASH_BOUNTYREMINDER1 = "/bounty"
        SlashCmdList["BOUNTYREMINDER"] = function(input)
            if input == "on" then
                frame:RegisterEvent("BAG_UPDATE")
                frame:RegisterEvent("UNIT_AURA")
                print("Bounty Reminder: Enabled")
            elseif input == "off" then
                frame:UnregisterEvent("BAG_UPDATE")
                frame:UnregisterEvent("UNIT_AURA")
                frame:Hide()
                print("Bounty Reminder: Disabled")
            else
                print("Usage: /bounty on|off")
            end
        end
        
        -- Enable by default
        frame:RegisterEvent("BAG_UPDATE")
        frame:RegisterEvent("UNIT_AURA")
        
        -- Enable frame movement
        frame:EnableMouse(true)
        frame:SetMovable(true)
        frame:RegisterForDrag("LeftButton")
        
        frame:SetScript("OnDragStart", function(self, button)
            if button == "LeftButton" then
                isMoving = true
                frame:StartMoving()
                frameOffsetX = GetCursorPosition() - frame:GetLeft()
                frameOffsetY = GetCursorPosition() - frame:GetBottom()
            end
        end)
        
        frame:SetScript("OnDragStop", function(self)
            if isMoving then
                isMoving = false
                frame:StopMovingOrSizing()
            end
        end)
        
        print("Bounty Reminder: Enabled by default")
    end
end

-- Register Events
frame:SetScript("OnEvent", OnEvent)
frame:RegisterEvent("PLAYER_LOGIN")