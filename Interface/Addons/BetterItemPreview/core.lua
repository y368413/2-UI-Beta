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

    local originalDressUpLink = DressUpLink
    DressUpLink = function(link)
        --This just checks if it's a recipe, and if so, extracts the link for the item it creates and resends that to this function.
        ----If the resulting item isn't previewable, this will still do whatever it normally would've done in that case.
        if (select(12,GetItemInfo(link))) == 9 then
            local linkID = link:match("item:([0-9]+)")
            local newLink = select(2,GetItemInfo((select(2,LibStub("LibRecipes-3.0"):GetRecipeInfo(linkID)))))
            return DressUpLink(newLink)
        end
        return link and (DressUpItemLink(link) or DressUpBattlePetLink(link) or DressUpMountLink(link));
    end

    local originalHandleModifiedItemClick = HandleModifiedItemClick
    --HandleModifiedItemClick = function(link, itemLocation, ...)
    HandleModifiedItemClick = function(link, itemLocation)

        if (select(12,GetItemInfo(link))) == 9 then
            local linkID = link:match("item:([0-9]+)")
            local newLink = select(2,GetItemInfo((select(2,LibStub("LibRecipes-3.0"):GetRecipeInfo(linkID)))))
            return HandleModifiedItemClick(newLink)
        end

        local showReal = false
        local inspect = nil

        if (IsShiftKeyDown() and not self.db.profile.reverse) or (not IsShiftKeyDown() and self.db.profile.reverse) then
            showReal = true
        end

		--I can't figure out what garbage MogIt is sending to this handler, but this appears to take care of that oddity
		if tonumber(itemLocation) ~= nil then
			itemLocation = nil
		end

        if (InspectFrame and InspectFrame.unit and itemLocation == nil) then
            local slotID = C_Transmog.GetSlotForInventoryType( C_Item.GetItemInventoryTypeByID( link ) + 1 )
            local inspectInfo = C_TransmogCollection.GetInspectItemTransmogInfoList()[slotID]
            if inspectInfo then
                inspect = (select(6,C_TransmogCollection.GetAppearanceSourceInfo(inspectInfo.appearanceID)))
            end
        end
            
        if inspect and showReal then
            link = inspect
            itemLocation = nil
        elseif showReal then
            itemLocation = nil
        end
            
        if IsModifiedClick("DRESSUP") and C_Item.IsDressableItemByID(link) then
            return DressUpItemLocation(itemLocation) or DressUpItemLink(link) or DressUpBattlePet(link) or DressUpMount(link)
        else
            originalHandleModifiedItemClick(link,itemLocation)
        end
    end

end

