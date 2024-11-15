
--- @type VendorCurrency_API
local _, VendorCurrency_API = ...;

VendorCurrency_API.MerchantData = {};

function VendorCurrency_API.MerchantData:GetAllCurrencies()
    local allCurrencies = {};
    local currencies = {};
    local itemCurrencies = {};
    local cache = {};

    for i=1, GetMerchantNumItems(), 1 do
        local numUniqueItems = GetMerchantItemCostInfo(i);

        if numUniqueItems ~= 0 then
            for x=1, numUniqueItems, 1 do
                local itemTexture, itemValue, itemLink, currencyName = GetMerchantItemCostItem(i, x);

                if itemLink and not currencyName then
                    if not tContains(cache, itemLink) then
                        local tbl = {
                            link = itemLink,
                            texture = itemTexture,
                            value = itemValue
                        };
                        tinsert(itemCurrencies, tbl);
                        tinsert(cache, itemLink);
                    end
                elseif currencyName and not itemLink then
                    if not tContains(cache, currencyName) then
                        local tbl = {
                            name = currencyName,
                            texture = itemTexture,
                            value = itemValue
                        };
                        tinsert(currencies, tbl);
                        tinsert(cache, currencyName);
                    end
                end
            end
        end
    end

    if #currencies > 0 then
        allCurrencies["generic"] = currencies;
    end

    if #itemCurrencies > 0 then
        allCurrencies["item"] = itemCurrencies;
    end

    if not allCurrencies.item and not allCurrencies.generic then
        return nil;
    end

    return allCurrencies;
end