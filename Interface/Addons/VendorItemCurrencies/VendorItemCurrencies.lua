
--- @class VendorCurrency_API
local VendorCurrency_API = select(2, ...);

---@param currencyButtons table<button>
---@return table<button>
function VendorCurrency_API.GetItemLocationsForOwnedItems(currencyButtons)
    local ownedItemButtons = {};
    ItemUtil.IteratePlayerInventory(function(itemLocation)
        local itemID = C_Item.GetItemID(itemLocation)
        local itemButton = currencyButtons[itemID];
        if itemButton then
            itemButton.LinkedItem:SetItemLocation(itemLocation);
            tinsert(ownedItemButtons, itemButton);
        end
    end)
    return ownedItemButtons;
end

---@return table
function VendorCurrency_API.GetMerchantFrame()
    return MerchantFrame;
end