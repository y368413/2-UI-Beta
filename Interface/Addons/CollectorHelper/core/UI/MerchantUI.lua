local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}

-- =========================================================================
-- Main frame
-- =========================================================================
function CollectorHelper:InitMerchantUI()
    self.merchantFrameCost = self:frameBuilder({
        frameName = "CollectorHelper_Merchant",
        parent = MerchantFrame,
        width = 330,
        height = MerchantFrame:GetHeight(),
        point = {
            pos = "TOPRIGHT",
            x = 330,
            y = 0,
        }
    })

    local innerFrameTitle = self:frameBuilder({
        frameName = "CollectorHelper_MerchantTitle",
        parent = self.merchantFrameCost,
        width = 327,
        height = 25,
        point = {
            pos = "TOP",
            x = 0,
            y = -2,
        },
        bgColorR = 0.1176,
        bgColorG = 0.1176,
        bgColorB = 0.1176,
        bgAlpha = 1
    })

    self:fontBuilder({
        parent = innerFrameTitle,
        text = self:textCFormat(COLORS.yellow, "Currency Needed to Collect everything"),
        point = {
            pos = "CENTER",
            x = 0,
            y = 0,
        }
    })

    local innerFrame = self:frameBuilder({
        frameName = "CollectorHelper_MerchantInner",
        parent = self.merchantFrameCost,
        width = 327,
        height = 280,
        point = {
            pos = "TOP",
            x = 0,
            y = -27,
        },
        bgColorR = 0.1176,
        bgColorG = 0.1176,
        bgColorB = 0.1176,
        bgAlpha = 0.80
    })


    -- Completed message font
    self.merchantCost = self:fontBuilder({
        parent = innerFrame,
        text = self:textCFormat(COLORS.green, "You have everything on this merchant"),
        point = {
            pos = "CENTER",
            x = 0,
            y = 80,
        }
    })

    -- Scrollable content cost
    self.mainScrollableContent = self:CreateScrollableContent({
        parent = innerFrame,
        width = 280,
        height = 260,
        xpos = 0,
        point = {
            pos = "CENTER",
            x = -11,
            y = 0,
        }
    })

    -- ========================
    -- Section: Recipes
    -- ========================
    self.innerRecipeFrame = self:frameBuilder({
        frameName = "CollectorHelper_MerchantInnerRecipe",
        parent = self.merchantFrameCost,
        width = 327,
        height = 102,
        point = {
            pos = "TOP",
            x = 0,
            y = -307,
        },
        bgColorR = 0,
        bgColorG = 0,
        bgColorB = 0,
        bgAlpha = 0.251
    })

    -- ========================
    -- Section: Merchant Action buttons
    -- ========================

    local innerButtonFrame = self:frameBuilder({
        frameName = "CollectorHelper_MerchantInnerBtn0",
        parent = self.merchantFrameCost,
        width = 327,
        height = 33,
        point = {
            pos = "TOP",
            x = 0,
            y = -409,
        },
        bgColorR = 0.1176,
        bgColorG = 0.1176,
        bgColorB = 0.1176,
        bgAlpha = 1
    })

    self.buyAllButton = self:buttonBuilder({
        buttonName = "Collector_MBuyButton",
        parent = innerButtonFrame,
        text = "Buy All",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOMLEFT",
            x = 8,
            y = 6,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                for itemIndex, _ in pairs(self.db.itemIndexMap) do
                    local costInfo = GetMerchantItemCostInfo(itemIndex)
                    if costInfo == 0 or CanAffordMerchantItem(itemIndex) then
                        BuyMerchantItem(itemIndex, 1)
                    end
                end
            end
        end
    })

    self.toggleShowOwned = self:buttonBuilder({
        buttonName = "Collector_MSHButton",
        parent = innerButtonFrame,
        text = "Toggle owned",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOM",
            x = 0,
            y = 6,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                settings.hideMerchantOwned = not settings.hideMerchantOwned
                if settings.hideMerchantOwned == false then
                    self.forceShowMerchant = true
                end
                self:updateShop()
            end
        end
    })

    self:buttonBuilder({
        buttonName = "Collector_MAHListButton",
        parent = innerButtonFrame,
        text = "AH Track",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOMRIGHT",
            x = -8,
            y = 6,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                self.doAhTrack = true
                self:updateShop()
                self.ahFrame:Show()
                self.ahScrollableContent.UpdateRows(self.db.ahItems)
            end
        end
    })

    if settings.showCostFrame == false then
        self.merchantFrameCost:Hide()
    end

    self:buttonBuilder({
        buttonName = "Collector_MerchantToggle",
        parent = _G["MerchantFrameTab1"],
        text = "Toggle CH",
        width = 90,
        height = 25,
        point = {
            pos = "LEFT",
            x = 3,
            y = -28,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                if settings.showCostFrame then
                    self.merchantFrameCost:Hide()
                else
                    self.merchantFrameCost:Show()
                end
                settings.showCostFrame = not settings.showCostFrame
            end
        end
    })
    self:buttonBuilder({
        buttonName = "Collector_MerchantToggle",
        parent = _G["MerchantFrameTab1"],
        text = "Sync Recipe",
        width = 90,
        height = 25,
        point = {
            pos = "LEFT",
            x = 93,
            y = -28,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                self:ShowRecipeUI(true)
            end
        end
    })
end
