BIP = LibStub("AceAddon-3.0"):NewAddon("Better Item Preview")

--BIP_EVENTS = CreateFrame("Frame","BIPEVENTS")
--BIP_EVENTS:RegisterEvent("ADDON_LOADED")

--function BIP_EVENTS:OnEvent(event, ...)
--    arg1 = ...
--    if event == "ADDON_LOADED" and arg1 == "Blizzard_InspectUI" then
--        InspectPaperDollItemSlotButton_OnClick_Backup = InspectPaperDollItemSlotButton_OnClick
--        InspectPaperDollItemSlotButton_OnClick = function(self,button)
--            local itemLink = GetInventoryItemLink(InspectFrame.unit, self:GetID());
--            local itemLocation = ItemLocation:CreateFromEquipmentSlot(self:GetID());
--            local itemListItem= C_TransmogCollection.GetInspectItemTransmogInfoList()[self:GetID()]
--            if itemLink and IsModifiedClick("EXPANDITEM") then
--                local _, _, classID = UnitClass(InspectFrame.unit);
--                if C_AzeriteEmpoweredItem.IsAzeriteEmpoweredItemByID(itemLink) then
--                    local azeritePowerIDs = C_PaperDollInfo.GetInspectAzeriteItemEmpoweredChoices(InspectFrame.unit, self:GetID());
--                    OpenAzeriteEmpoweredItemUIFromLink(itemLink, classID, azeritePowerIDs);
--                    return;
--                end
--            end
--            HandleModifiedItemClick(GetInventoryItemLink(InspectFrame.unit, self:GetID()),itemLocation,itemListItem);
--        end
--        self:UnregisterEvent("ADDON_LOADED")
--    end
--end

--BIP_EVENTS:SetScript("OnEvent",BIP_EVENTS.OnEvent)

BIP.typeSlotRef = {
    [13] = 16,
    [14] = 17,
    [15] = 16,
    [16] = 15,
    [17] = 16,
    [20] = 5,
    [21] = 16,
    [22] = 16,
    [23] = 17,
    [25] = 16,
    [26] = 16,
}

function BIP:OnInitialize()
    local defaults = {
        profile = {
            reverse = false,
        },
    }

    self.db = LibStub("AceDB-3.0"):New("BetterItemPreview", defaults, true)

    local options = {
        type = "group",
        args = {
            reverse = {
                name = "Reverse Functionality",
                desc = "Reverses the Ctrl+Click and Ctrl+Shift+Click Behavior",
                type = "toggle",
                descStyle = "inline",
                width = "full",
                get = function(info) return self.db.profile.reverse or false; end,
                set = function(info,val) self.db.profile.reverse = val; end,
            },
        },
    }

    local profileOptions = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)

    LibStub("AceConfig-3.0"):RegisterOptionsTable("Better Item Preview", {type="group",args={}})
    LibStub("AceConfig-3.0"):RegisterOptionsTable("Better Item Preview Options", options)
    LibStub("AceConfig-3.0"):RegisterOptionsTable("Better Item Preview Profiles", profileOptions)

    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Better Item Preview", "Better Item Preview", nil)
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Better Item Preview Options", "Options", "Better Item Preview")
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions("Better Item Preview Profiles", "Profiles", "Better Item Preview")


    local originalHandleModifiedItemClick = HandleModifiedItemClick
    --HandleModifiedItemClick = function(link, itemLocation, ...)
    HandleModifiedItemClick = function(link, itemLocation)
        local showReal = false
        local inspect = nil

        if (IsShiftKeyDown() and not self.db.profile.reverse) or (not IsShiftKeyDown() and self.db.profile.reverse) then
            showReal = true
        end

		--I can't figure out what garbage MogIt is sending to this handler, but this appears to take care of that oddity
		if tonumber(itemLocation) ~= nil then
			itemLocation = nil
		end

        if(InspectFrame and InspectFrame.unit and not showReal and not itemLocation) then
            local slotID = C_Item.GetItemInventoryTypeByID(link)
            slotID = BIP.typeSlotRef[slotID] or slotID

            inspect = C_TransmogCollection.GetInspectItemTransmogInfoList()[slotID]
            itemLocation = ItemLocation:CreateFromEquipmentSlot(slotID);
        end

--        if inspect and showReal then
--            inspect = nil
--            itemLocation = nil
--        end

        if IsModifiedClick("DRESSUP") and C_Item.IsDressableItemByID(link) then
            if inspect and itemLocation and not showReal then
                return BIP:DressUpItemLocationReal(itemLocation,inspect) or DressUpItemLink(link) or DressUpBattlePet(link) or DressUpMount(link)
            elseif showReal and itemLocation then
                return BIP:DressUpItemLocationReal(itemLocation) or DressUpItemLink(link) or DressUpBattlePet(link) or DressUpMount(link)
            else
                return DressUpItemLocation(itemLocation) or DressUpItemLink(link) or DressUpBattlePet(link) or DressUpMount(link)
            end
        else
            originalHandleModifiedItemClick(link,itemLocation)
        end
    end

end

function BIP:DressUpItemLocationReal(itemLocation, ...)
    directAppearance = ...
    if( itemLocation and itemLocation:IsValid() ) then
        local itemTransmogInfo
        if directAppearance then
            itemTransmogInfo = directAppearance
        else
            itemTransmogInfo = C_Item.GetCurrentItemTransmogInfo(itemLocation);
            itemTransmogInfo:Clear()
        end
        -- non-equippable items won't have an appearanceID
        if itemTransmogInfo.appearanceID ~= Constants.Transmog.NoTransmogID then
            return DressUpItemTransmogInfo(itemTransmogInfo);
        end
    end
    return false;
end
