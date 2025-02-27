local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

function CollectorHelper:Init()
    self:InitMerchant()
    self:InitAHUI()
    self:InitLfrGossip()
    self:InitRecipeUI()
    self:InitNews()

    self:InitOptionsPanel()
    self:InitAutoSync()
end


-- ============================================================================
-- Auto sync new recipe data on learn
-- ============================================================================
function CollectorHelper:InitAutoSync()
    local recipeFrame = CreateFrame("Frame")
    recipeFrame:RegisterEvent("NEW_RECIPE_LEARNED")

    recipeFrame:SetScript("OnEvent", function(_, event, recipeID)
        if event == "NEW_RECIPE_LEARNED" then
            local info = C_TradeSkillUI.GetProfessionInfoByRecipeID(recipeID)
            if info ~= nil and info.parentProfessionName ~= nil then
                local player = CollectorHelper.player
                if player and recipeCollected[player] ~= nil then
                    local professionData = recipeCollected[player][info.parentProfessionName]
                    if professionData then
                        professionData["recipes"][recipeID] = true;

                        local currentTime = date("%Y-%m-%d %H:%M:%S")
                        professionData["lastSync"] = currentTime
                        local collectedRecipes = professionData["collected"]
                        collectedRecipes = collectedRecipes + 1
                        professionData["collected"] = collectedRecipes
                        CollectorHelper:ShowRecipeUI(false)
                    end
                end
            end
        end
    end)
end

-- ============================================================================
-- Merchant init
-- ============================================================================
function CollectorHelper:InitMerchant()
    self:InitMerchantUI()

    hooksecurefunc("MerchantFrame_Update", function() self:updateShop() end)
    MerchantNextPageButton:HookScript("OnClick", function() self:updateShop() end)
    MerchantPrevPageButton:HookScript("OnClick", function() self:updateShop() end)

    MerchantFrame:HookScript("OnShow", function()
        C_Timer.After(0.25, function()
            self:ShowRecipeUI(false)
        end)
    end)
end

-- ============================================================================
-- Lfr npc gossipUpdate
-- ============================================================================
function CollectorHelper:InitLfrGossip()
    GossipFrame:HookScript("OnShow", function()
        C_Timer.After(0.25, function()
            self:GossipLfr()
        end)
    end)

    GossipFrame:HookScript("OnHide", function()
        self.db.lockDownData = {}
        self.gossipUpdate = false
    end)
end
