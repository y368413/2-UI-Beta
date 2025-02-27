local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

function CollectorHelper:CreateGeneralOptions()
    local generalOptions = {
        type = "group",
        childGroups = "tree",
        name = "Collector Helper Options",
        args = {
            instructions = {
                type = "description",
                name =
                "These options allow you to toggle various options that have been removed from the game in Legion.",
                fontSize = "medium",
                order = 1,
            },
            header = {
                type = "header",
                name = "",
                order = 2,
            },
            -------------------------------------------------
            showCostFrame = {
                type = "toggle",
                name = "Show Merchant Extension",
                desc = "Toggle main frame on marchant gossip",
                get = function()
                    return settings.showCostFrame
                end,
                set = function(_, value)
                    settings.showCostFrame = value
                    if settings.showCostFrame == false then
                        self.merchantFrameCost:Hide()
                    else
                        self.merchantFrameCost:Show()
                    end
                end,
                width = "full",
                order = 3,
            },
            ----------------------------------------------------
            hideMerchantOwned = {
                type = "toggle",
                name = "Hide Merchant Owned Items",
                desc = "Toggle Merchant Owned from merchant view",
                get = function()
                    return settings.hideMerchantOwned
                end,
                set = function(_, value)
                    settings.hideMerchantOwned = value
                end,
                width = "full",
                order = 4,
            },
            -------------------------------------------------
            autoShowNews = {
                type = "toggle",
                name = "Auto show news",
                desc = "Auto show news on new version",
                get = function()
                    return settings.autoShowNews
                end,
                set = function(_, value)
                    settings.autoShowNews = value
                end,
                width = "full",
                order = 5,
            },
            -------------------------------------------------
        }
    }
    return generalOptions
end
