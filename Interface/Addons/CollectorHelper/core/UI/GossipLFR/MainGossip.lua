local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}

-- ============================================================================
-- Set lockdown data
-- ============================================================================
function CollectorHelper:GenerateLockDownData()
    for i = 1, GetNumSavedInstances() do
        local _, _, _, difficultyId, locked, _, _, isRaid, _, _, numEncounters, _, _, instanceId = GetSavedInstanceInfo(
            i)
        if (isRaid and (difficultyId == 7 or difficultyId == 17) and locked) then
            self.db.lockDownData[instanceId] = {}
            for j = 1, numEncounters do
                local _, _, killed = GetSavedInstanceEncounterInfo(i, j)
                self.db.lockDownData[instanceId][j] = killed
            end
        end
    end
end

-- ============================================================================
-- Check npc gossipID
-- ============================================================================
function CollectorHelper:GossipLfr()
    self.db.lockDownData = {}
    self:GenerateLockDownData()

    local info = UnitGUID("target")
    if not info then return end

    local _, _, _, _, _, npc_id, _ = strsplit("-", info)
    local lfrNpc = self.db.gossipData[npc_id]
    if not lfrNpc then
        local children = { GossipFrame.GreetingPanel.ScrollBox.ScrollTarget:GetChildren() }
        for _, child in ipairs(children) do
            if child.CH then
                child.CH:Hide()
            end
        end
        return
    end
    self:UpdateLfrGossip(lfrNpc)
end

-- ============================================================================
-- Update gossipData
-- ============================================================================
function CollectorHelper:UpdateLfrGossip(lfrNpc)
    local children = { GossipFrame.GreetingPanel.ScrollBox.ScrollTarget:GetChildren() }
    local yOffsetAdjustment = -19 -- Height adjustment for each child
    local firstY = nil
    local currentYOffset = 0

    for _, child in ipairs(children) do
        local data = child.GetData and child:GetData()
        if data and data.info and data.info.gossipOptionID then
            local gossipRef = lfrNpc[data.info.gossipOptionID]
            if gossipRef then
                local lfrG = self.db.lfrData[gossipRef.raidID]
                if lfrG then
                    local wing = lfrG.wings[gossipRef.wingID]
                    if wing then
                        self.gossipUpdate = true
                        local lockDownInstance = self.db.lockDownData[gossipRef.raidID]

                        local totalBosses = #wing.bosses
                        local killed = 0
                        local bossTooltipLines = {}
                        for _, bossInfo in ipairs(wing.bosses) do
                            local killedState = lockDownInstance and lockDownInstance[bossInfo.index]
                            if killedState then
                                killed = killed + 1
                                table.insert(bossTooltipLines, self:textCFormat(COLORS.red, bossInfo.bossName))
                            else
                                table.insert(bossTooltipLines, bossInfo.bossName)
                            end
                        end

                        local prefix = "[" .. killed .. "/" .. totalBosses .. "]"
                        local displayText = prefix .. " " .. wing.name

                        local stateCol = false;
                        local collectedRefState = lfrCollected[gossipRef.raidID]
                        if collectedRefState then
                            stateCol = collectedRefState["wings"][gossipRef.wingID]
                        end

                        if killed > 0 and totalBosses > killed and stateCol == false then
                            displayText = self:textCFormat(COLORS.yellow, displayText)
                        end

                        if child.Icon and totalBosses == killed then
                            child.Icon:SetTexture(130751)
                            if stateCol == false then
                                displayText = self:textCFormat(COLORS.green, displayText)
                            end
                        end
                        if stateCol == true then
                            displayText = self:textCFormat(COLORS.red, displayText)
                        end
                        child:SetText(displayText)
                        child:SetHeight(16)

                        if child.CH == nil then
                            local mActionFrame = self:frameBuilder({
                                frameName = nil,
                                parent = child,
                                width = 50,
                                height = 16,
                                point = {
                                    pos = "BOTTOMRIGHT",
                                    x = 0,
                                    y = 0,
                                }
                            })
                            mActionFrame:SetBackdropColor(0, 0, 0, 0)
                            mActionFrame:SetBackdropBorderColor(0, 0, 0, 0)
                            local aBtn = self:buttonBuilder({
                                buttonName = nil,
                                parent = mActionFrame,
                                text = "TC/UW",
                                width = 45,
                                height = 16,
                                point = {
                                    pos = "BOTTOMLEFT",
                                    x = 0,
                                    y = 0,
                                }
                            })

                            aBtn:SetScript("OnEnter", function()
                                if self.gossipUpdate then
                                    GameTooltip:SetOwner(GossipFrame, "ANCHOR_RIGHT", 0, -34)
                                    GameTooltip:SetText("Toggle Completed/Unmark Wing", 1, 1, 1)
                                    GameTooltip:AddLine(
                                        "This allows you to mark a raid wing as completed or unmark it, providing better visual tracking of your collection",
                                        nil, nil, nil, true)
                                    GameTooltip:AddLine(
                                        self:textCFormat(COLORS.red, "Red") ..
                                        " option text color will mark the completed state", nil, nil, nil, true)
                                    GameTooltip:Show()
                                end
                            end)
                            aBtn:SetScript("OnLeave", function()
                                if self.gossipUpdate then
                                    GameTooltip:Hide()
                                end
                            end)
                            child.CH = mActionFrame;
                            child.Btn = aBtn;
                        else
                            child.CH:Show()
                        end

                        -- change btn refs for new gossip
                        child.Btn:SetScript("OnClick", function(_, button)
                            if button == "LeftButton" then
                                local collectedRef = lfrCollected[gossipRef.raidID]
                                if collectedRef then
                                    local state = collectedRef["wings"][gossipRef.wingID]
                                    collectedRef["wings"][gossipRef.wingID] = not state
                                    CollectorHelper:UpdateLfrGossip(lfrNpc)
                                end
                            end
                        end)

                        -- Adjust yOffset based on the first element with gossipOptionID
                        if not firstY then
                            firstY = select(5, child:GetPoint(1))
                        else
                            local currentX = select(4, child:GetPoint(1))
                            currentYOffset = currentYOffset + yOffsetAdjustment
                            child:SetPoint("TOPLEFT", currentX, firstY + currentYOffset)
                        end


                        child:SetScript("OnEnter", function()
                            if self.gossipUpdate then
                                GameTooltip:SetOwner(GossipFrame, "ANCHOR_RIGHT", 0, -34)
                                GameTooltip:SetText("Wing State", 1, 1, 1)
                                for _, line in ipairs(bossTooltipLines) do
                                    GameTooltip:AddLine(line, nil, nil, nil, true)
                                end
                                GameTooltip:Show()
                            end
                        end)
                        child:SetScript("OnLeave", function()
                            if self.gossipUpdate then
                                GameTooltip:Hide()
                            end
                        end)
                    end
                end
            end
        end
    end
end
