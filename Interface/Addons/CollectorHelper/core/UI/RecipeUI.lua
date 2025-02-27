local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}

-- =========================================================================
-- Main frame
-- =========================================================================
function CollectorHelper:InitRecipeUI()
    self.recipeFrame = self:frameBuilder({
        frameName = "CollectorHelper_Recipes",
        parent = UIParent,
        width = 300,
        height = 400,
        point = {
            pos = "CENTER",
            x = 0,
            y = 0,
        },
        titleBuilder = {
            text = self:textCFormat(COLORS.yellow, "CollectorHelper Recipe sync"),
            point = {
                pos = "TOP",
                x = 0,
                y = -8,
            }
        }
    })

    -- Make the frame draggable
    self.recipeFrame:SetMovable(true)
    self.recipeFrame:EnableMouse(true)
    self.recipeFrame:RegisterForDrag("LeftButton")
    self.recipeFrame:SetScript("OnDragStart", self.recipeFrame.StartMoving)
    self.recipeFrame:SetScript("OnDragStop", self.recipeFrame.StopMovingOrSizing)

    -- Add a close button
    self:buttonBuilder({
        buttonName = "Collector_RecipeCloseButton",
        parent = self.recipeFrame,
        text = "Close",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOM",
            x = 0,
            y = 8,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                CollectorHelper.recipeFrame:Hide()
            end
        end
    })

    -- Function to generate profession buttons
    local function generateProfButton(yOffset, xOffset, iconSize, frame, showSync)
        local button = self:buttonBuilder({
            buttonName = "Collector_ProfButton_" .. yOffset,
            parent = frame,
            text = "",
            width = iconSize,
            height = iconSize,
            point = {
                pos = "Center",
                x = xOffset,
                y = yOffset,
            },
            onClickScript = function(self, button)
                if button == "LeftButton" then
                    if self.tradeSkillID then
                        --print("Opening TradeSkill ID:", self.tradeSkillID)
                        C_TradeSkillUI.OpenTradeSkill(self.tradeSkillID)
                    else
                        --print("No TradeSkillID set for this button.")
                    end

                    C_Timer.After(0.25, function()
                        -- Now, populate the recipes for this profession
                        local player = CollectorHelper.player
                        local professionName = self.name -- Get the profession name (e.g., Jewelcrafting)
                        if player and recipeCollected[player] ~= nil and professionName then
                            local professionData = recipeCollected[player][professionName]
                            if professionData then
                                -- Loop through all recipe IDs and update the profession data
                                local collectedRecipes = 0
                                local totalRecipes = 0
                                local currentTime = date("%Y-%m-%d %H:%M:%S") -- Get current time for lastSync

                                -- Reset the recipes table and count valid ones
                                professionData["recipes"] = {} -- Reset the recipes data

                                for _, id in pairs(C_TradeSkillUI.GetAllRecipeIDs()) do
                                    local recipeInfo = C_TradeSkillUI.GetRecipeInfo(id)
                                    if recipeInfo then
                                        -- Store the recipe ID and its learned status (true/false)
                                        if recipeInfo.learned then
                                            professionData["recipes"][recipeInfo.recipeID] = true
                                            collectedRecipes = collectedRecipes + 1
                                        else
                                            professionData["recipes"][recipeInfo.recipeID] = false
                                        end
                                        totalRecipes = totalRecipes + 1
                                    end
                                end

                                -- Update the profession's collected count and lastSync timestamp
                                professionData["collected"] = collectedRecipes
                                professionData["total"] = totalRecipes
                                professionData["lastSync"] = currentTime

                                -- Update the button text dynamically

                                if showSync then
                                    self.collectedText:SetText("Collected: " .. collectedRecipes .. " / " .. totalRecipes)
                                    self.lastSyncText:SetText("Last Sync: " .. currentTime)
                                else
                                    self.collectedText:SetText(collectedRecipes .. " / " .. totalRecipes)
                                end
                            end
                        end
                    end)
                end
            end
        })

        local texture = button:CreateTexture(nil, "ARTWORK")
        texture:SetAllPoints(button)
        texture:SetTexture(132764)
        button.icon = texture -- Store the texture as a property of the button

        -- Create the text for "Collected" and "Last Sync"
        local collectedText = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
        collectedText:SetPoint("TOP", button, "BOTTOM", 0, -2)
        collectedText:SetText("No profession")
        button.collectedText = collectedText

        if showSync then
            local lastSyncText = button:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            lastSyncText:SetPoint("TOP", collectedText, "BOTTOM", 0, -2)
            button.lastSyncText = lastSyncText
        end

        return button
    end

    -- Create and store buttons
    self.profButtons = {
        -- separated frame
        generateProfButton(125, 0, 64, self.recipeFrame, true),
        generateProfButton(25, 0, 64, self.recipeFrame, true),
        generateProfButton(-75, 0, 64, self.recipeFrame, true),

        -- merchant extension frame
        generateProfButton(2, -110, 60, self.innerRecipeFrame, false),
        generateProfButton(2, 0, 60, self.innerRecipeFrame, false),
        generateProfButton(2, 100, 60, self.innerRecipeFrame, false),
    }
    self.recipeFrame:Hide()
end

-- =========================================================================
-- Recipe frame show
-- =========================================================================
function CollectorHelper:ShowRecipeUI(doShowFrame)
    -- Nested function to update all profession buttons dynamically
    local function updateButtons(buttons)
        -- Retrieve current professions
        local prof1index, prof2index, _, _, cooking = GetProfessions()

        -- A table of profession indexes and corresponding buttons
        local professionData = {
            { prof1index, buttons[1] },
            { prof2index, buttons[2] },
            { cooking,    buttons[3] },
            { prof1index, buttons[4] },
            { prof2index, buttons[5] },
            { cooking,    buttons[6] },
        }

        -- Loop over each profession and update the corresponding button
        for _, data in ipairs(professionData) do
            local profIndex, button = unpack(data)
            if profIndex then
                local name, iconTexture, _, _, _, _, tradeSkillID = GetProfessionInfo(profIndex)

                -- Update the icon texture and tradeSkillID
                if iconTexture then
                    button.icon:SetTexture(iconTexture) -- Set the profession icon
                    button.tradeSkillID = tradeSkillID  -- Dynamically set tradeSkillID
                    button.name = name                  -- Store the profession name in the button
                else
                    button.icon:SetTexture(132764)
                    button.tradeSkillID = nil -- Clear tradeSkillID
                end

                -- Fetch the collected and lastSync data for the profession from recipeCollected[self.player]
                local player = self.player
                if player and recipeCollected[player] ~= nil then
                    local professionData = recipeCollected[player][name] -- Use the profession name here
                    if professionData then
                        local collected = professionData["collected"] or 0
                        local lastSync = professionData["lastSync"] or "Not available"
                        local totalRecipes = professionData["total"] or 0
                        -- Update the text under the button

                        if button.lastSyncText ~= nil then
                            button.collectedText:SetText("Collected: " .. collected .. " / " .. totalRecipes)
                            button.lastSyncText:SetText("Last Sync: " .. lastSync)
                        else
                            button.collectedText:SetText(collected .. " / " .. totalRecipes)
                        end
                    end
                end
            end
        end
    end

    if doShowFrame then
        self.recipeFrame:Show()
    end
    -- Update the buttons to reflect current profession data
    if self.profButtons then
        updateButtons(self.profButtons)
    end
end
