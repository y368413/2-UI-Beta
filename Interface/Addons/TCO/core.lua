-- Currencies that are warbound --
local currencyIDs = {
    [3093] = {id=3093, name="Nerub-ar Finery"}, -- WW
    [3089] = {id=3089, name="Residual Memories"}, -- WW PP
    [3056] = {id=3056, name="Kej"}, -- WW
    [3055] = {id=3055, name="Mereldar Derby Mark"}, -- WW
    [2815] = {id=2815, name="Resonance Crystals"},
    [2803] = {id=2803, name="Undercoin"},
    [2657] = {id=2657, name="Mysterious Fragment"},
    [2594] = {id=2594, name="Paracausal Flakes"},
    [2588] = {id=2588, name="Riders of Azeroth Badge"},
    [2118] = {id=2118, name="Elemental Overflow"},
    [2009] = {id=2009, name="Cosmic Flux"},
    [2003] = {id=2003, name="Dragon Isles Supplies"},
    [1979] = {id=1979, name="Cyphers of the First Ones"},
    [1931] = {id=1931, name="Cataloged Research"},
    [1906] = {id=1906, name="Soul Cinders"},
    [1885] = {id=1885, name="Grateful Offering"},
    [1828] = {id=1828, name="Soul Ash"},
    [1820] = {id=1820, name="Infused Ruby"},
    [1792] = {id=1792, name="Honor"},
    [1717] = {id=1717, name="7th Legion Service Medal"},
    [1716] = {id=1716, name="Honorbound Service Medal"},
    [1710] = {id=1710, name="Seafarer's Dubloon"},
    [1560] = {id=1560, name="War Resources"},
    [1379] = {id=1379, name="Trial of Style Token"},
    [1275] = {id=1275, name="Curious Coin"},
    [1226] = {id=1226, name="Nethershard"},
    [1166] = {id=1166, name="Timewarped Badge"},
    [777] = {id=777, name="Timeless Coin"},
    [515] = {id=515, name="Darkmoon Prize Ticket"},
    [241] = {id=241, name="Champion's Seal"}
}
-- sort currencies so they would appear by IDs
local sortedCurrencyIDsKeys = {}
for k in pairs(currencyIDs) do table.insert(sortedCurrencyIDsKeys, k) end
-- reverse sort so newest currency is at top
table.sort(sortedCurrencyIDsKeys, function(a,b) return a > b end)
local testCurrencies = {
    residualMemories = {id=3089, name="Residual Memories"},
    darkmoonPrizeTicket = {id=515, name="Darkmoon Prize Ticket"},
    seventhLegionServiceMedal = {id=1717, name="7th Legion Service Medal"},
    seafarersDubloon = {id=1710, name="Seafarer's Dubloon"},
    warResources = {id=1560, name="War Resources"}
}

-- Create the main addon frame
local CurrencySummaryFrame = CreateFrame("Frame", "CurrencySummaryFrame", UIParent, "BackdropTemplate")
CurrencySummaryFrame:ClearAllPoints()
CurrencySummaryFrame:SetSize(300, 1)
-- SetPoint for placement to the right of TokenFrame
CurrencySummaryFrame:SetPoint("TOPLEFT", "TokenFrame", "TOPRIGHT")
CurrencySummaryFrame:Hide()

-- Set frame background color and transparency
CurrencySummaryFrame:SetBackdrop({
    bgFile = "Interface\\Glues\\Common\\Glue-Tooltip-Background", 
    edgeFile = "Interface\\Glues\\Common\\Glue-Tooltip-Border", 
    tile = true,
	tileEdge = true,
	tileSize = 16,
	edgeSize = 16,
	insets = { left = 10, right = 5, top = 4, bottom = 9 },
})
CurrencySummaryFrame:SetBackdropColor(0.1, 0.1, 0.1, 0.7)
CurrencySummaryFrame:OnBackdropLoaded()
CurrencySummaryFrame.headerBar = CurrencySummaryFrame:CreateTexture(nil, "BACKGROUND")
CurrencySummaryFrame.headerBar:SetDrawLayer("BACKGROUND", 2)
CurrencySummaryFrame.headerBar:SetColorTexture(0.25,0.25,0.25,1)
CurrencySummaryFrame.headerBar:SetHeight(18)
CurrencySummaryFrame.headerBar:SetPoint("TOPLEFT", CurrencySummaryFrame, "TOPLEFT", 10, -5)
CurrencySummaryFrame.headerBar:SetPoint("RIGHT", CurrencySummaryFrame, "RIGHT", -5, 0)
CurrencySummaryFrame.headerBar:SetAlpha(0.8)
CurrencySummaryFrame.headerBar:Show()
CurrencySummaryFrame.footerBar = CurrencySummaryFrame:CreateTexture(nil, "BACKGROUND")
CurrencySummaryFrame.footerBar:SetDrawLayer("BACKGROUND", 2)
CurrencySummaryFrame.footerBar:SetColorTexture(0.25,0.25,0.25,1)
CurrencySummaryFrame.footerBar:SetHeight(17)
CurrencySummaryFrame.footerBar:SetPoint("BOTTOMLEFT", CurrencySummaryFrame, "BOTTOMLEFT", 10, 10)
CurrencySummaryFrame.footerBar:SetPoint("RIGHT", CurrencySummaryFrame, "RIGHT", -5, 0)
CurrencySummaryFrame.footerBar:SetAlpha(0.3)
CurrencySummaryFrame.footerBar:Show()
CurrencySummaryFrame.title = CurrencySummaryFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
CurrencySummaryFrame.title:SetPoint("TOP", CurrencySummaryFrame, "TOP", 0, -8)
CurrencySummaryFrame.title:SetText("Total transferable | Own currency")
local lineStartHeight = 20
local lineAmount = 0

-- Create a function to add new lines
local function CreateNewLine(parentFrame, titleText, contentText)
    local lineFrame = CreateFrame("Frame", nil, parentFrame)
    lineFrame:SetWidth(parentFrame:GetWidth() - 20)

    local arrow = lineFrame:CreateTexture(nil, "OVERLAY")
    arrow:SetSize(32, 16)
    arrow:SetPoint("TOPLEFT", -5, -(lineStartHeight-10))
    arrow:SetTexture("Interface\\Buttons\\UI-SortArrow")
    arrow:SetRotation(math.pi / 2)
    
    local title = lineFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 20, -lineStartHeight)
    title:SetText(titleText)
    title:SetJustifyH("LEFT")
    
    local content = lineFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    content:SetPoint("TOPLEFT", 40, -35)
    content:SetText(contentText)
    content:SetJustifyH("LEFT")
    content:SetWidth(lineFrame:GetWidth() - 10)
    content:SetWordWrap(true)
    
    content:Hide()
    
    local function ToggleContent()
        if content:IsShown() then
            content:Hide()
            lineFrame:SetHeight(25)
            arrow:SetRotation(math.pi / 2)
            arrow:SetPoint("TOPLEFT", -5, -(lineStartHeight-10))
        else
            content:Show()
            lineFrame:SetHeight(25 + content:GetStringHeight() + 5)
            -- because the chosen arrow is not centered, we need to reposition it as well as change the rotation, maybe
            arrow:SetPoint("TOPLEFT", 0, -(lineStartHeight+0))
            arrow:SetRotation(0)
        end
        -- parentFrame:AdjustHeight()
        parentFrame:AdjustHeightAndReposition()
    end
    
    arrow:SetScript("OnMouseDown", ToggleContent)
    title:SetScript("OnMouseDown", ToggleContent)
    
    lineFrame:SetHeight(25)
    return lineFrame
end

-- Function to adjust frame height
function CurrencySummaryFrame:AdjustHeight()
    local totalHeight = 20
    for i, child in ipairs({self:GetChildren()}) do
        if child:IsShown() then
            totalHeight = totalHeight + child:GetHeight() - 8
        end
    end
    self:SetHeight(totalHeight)

    -- -- test for width
    -- local totalWidth = 70
    -- local currentMaxWidth = 0
    -- for i, child in ipairs({self:GetChildren()}) do
    --     if child:IsShown() then
    --         if currentMaxWidth < child:GetWidth() then
    --             currentMaxWidth = child:GetWidth()
    --         end
    --     end
    --     -- print(currentMaxWidth)
    -- end
    -- self:SetWidth(totalWidth + currentMaxWidth)
end


-- test Function to adjust frame height and reposition lines
function CurrencySummaryFrame:AdjustHeightAndReposition()
    local totalHeight = 20
    local previousLine
    for i, child in ipairs({self:GetChildren()}) do
        if child:IsShown() then
            if previousLine then
                child:SetPoint("TOPLEFT", previousLine, "BOTTOMLEFT", 0, 10)  -- topleft, previousline, bottomleft, 0, -5
            else
                child:SetPoint("TOPLEFT", self, "TOPLEFT", 10, -15) --topleft, self, topleft, 10, -10
            end
            totalHeight = totalHeight + (child:GetHeight() / 1.65)
            previousLine = child
        end
        totalHeight = totalHeight + (child:GetHeight() / 4)
    end
    CurrencySummaryFrame:AdjustHeight()
end

TokenFrame:HookScript("OnShow", function ()
    local lineNumber = 1
    local firstline = true
    for _, k in ipairs(sortedCurrencyIDsKeys) do
        local id = currencyIDs[k]['id']
        local name = currencyIDs[k]["name"]
        -- print(v.name)
        local totalCurrency = 0
        local characterlist = ""
        local accountCurrencyData = C_CurrencyInfo.FetchCurrencyDataFromAccountCharacters(id)
        local ownCharacter = C_CurrencyInfo.GetCurrencyInfo(id)
        if accountCurrencyData then
            for x, y in pairs(accountCurrencyData) do
                local characterName = y["characterName"]
                local quantity = y["quantity"]
                totalCurrency = totalCurrency + y["quantity"]
                characterlist = characterlist..""..characterName..": "..quantity.."\n"
            end
            -- print(totalCurrency)
            -- if the current character doesn't have the currency, it cannot be transfered. Blizzard bug or intended?
            -- local line
            -- if ownCharacter.quantity == 0 then
            --     line = CreateNewLine(CurrencySummaryFrame, name..": "..totalCurrency.." | "..ownCharacter.quantity.." - Cannot transfer", characterlist)
            -- else
            --     line = CreateNewLine(CurrencySummaryFrame, name..": "..totalCurrency.." | "..ownCharacter.quantity, characterlist)
            -- end
            local line = CreateNewLine(CurrencySummaryFrame, name..": "..totalCurrency.." | "..ownCharacter.quantity, characterlist)
            if firstline then
                line:SetPoint("TOPLEFT", CurrencySummaryFrame, "TOPLEFT", 10, -15)
            else
                line:SetPoint("TOPLEFT", CurrencySummaryFrame, "TOPLEFT", 10, lineNumber*-15)
            end
            line:Show()
            firstline = false
            lineNumber = lineNumber + 1
        -- else
        --     print("error with "..name)
        end
    end
    CurrencySummaryFrame:AdjustHeightAndReposition()
    CurrencySummaryFrame:AdjustHeight()
    CurrencySummaryFrame:Show()
end)

TokenFrame:HookScript("OnHide", function ()
    for i, child in ipairs({CurrencySummaryFrame:GetChildren()}) do
        child:Hide()
        child:SetParent(nil)
        child = nil
    end
    CurrencySummaryFrame:Hide()
end)

local function OnEvent()
    local tryLoading = C_CurrencyInfo.RequestCurrencyDataForAccountCharacters()
    CurrencySummaryFrame:UnregisterEvent("PLAYER_LOGIN")
end

CurrencySummaryFrame:RegisterEvent("PLAYER_LOGIN")
CurrencySummaryFrame:SetScript("OnEvent", OnEvent)

-- ACCOUNT_CHARACTER_CURRENCY_DATA_RECEIVED
