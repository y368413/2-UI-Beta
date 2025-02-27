local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

CollectorHelper.units = {
    { threshold = 1e9, suffix = "B", format = "%.2f" }, -- Billions
    { threshold = 1e6, suffix = "M", format = "%.2f" }, -- Millions
    { threshold = 1e3, suffix = "K", format = "%.0f" }, -- Thousands
}

-- ============================================================================
-- Number format
-- ============================================================================
function CollectorHelper:formatNumber(val)
    local n = tonumber(val)
    if not n then return val end
    for _, unit in ipairs(self.units) do
        if n >= unit.threshold then
            return string.format(unit.format .. unit.suffix, n / unit.threshold)
        end
    end
    return tostring(n)
end

-- ============================================================================
-- Gold format
-- ============================================================================
function CollectorHelper:formatGoldAmount(text)
    local rn = text:match("(%d[%d,]*%d)")
    if not rn then
        return text
    end

    local ns = rn:gsub(",", "")
    local num = tonumber(ns)
    if not num then return text end

    local fm = self:formatNumber(num)
    local r = text:gsub(rn, fm)
    return r
end

-- ============================================================================
-- Text color format
-- ============================================================================
function CollectorHelper:textCFormat(color, text)
    return "\124cn" .. color .. ":" .. text .. "\124r"
end

-- ============================================================================
-- Item details
-- ============================================================================
function CollectorHelper:getItemDetails(itemInfo)
    C_Item.RequestLoadItemDataByID(itemInfo)
    local name, link, quality, _, _, type, itemSubType , _, equipLoc, _, _, _, _, bindType = C_Item.GetItemInfo(itemInfo)

    return {
        itemId = itemInfo,
        name = name,
        link = link,
        itemType = type,
        itemSubType = itemSubType,
        itemEquipLoc = equipLoc,
        bindType = bindType,
        itemQuality = quality
    }
end

-- ============================================================================
-- Row handle logic
-- ============================================================================

function CollectorHelper:CreateRow(index, item, data, params, scrollChild, UpdateRows)
    local row = CreateFrame("Frame", nil, scrollChild, "BackdropTemplate")
    row:SetSize(params.width, 20)
    row:SetPoint("TOPLEFT", params.xpos or 10, -(index - 1) * 22)

    row:SetBackdrop({
        bgFile = params.bgFile or "Interface\\Buttons\\WHITE8x8",
        edgeFile = params.edgeFile or "Interface\\Buttons\\WHITE8x8",
        tileEdge = false,
        edgeSize = params.edgeSize or 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    row:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
    row:SetBackdropBorderColor(0, 0, 0, 1)

    -- Create button with BackdropTemplate
    local btnP = CreateFrame("Button", nil, row, "BackdropTemplate")
    btnP:RegisterForClicks("LeftButtonDown", "RightButtonDown")
    btnP:SetWidth(params.width)
    btnP:SetHeight(20)
    btnP:SetPoint("CENTER", 0, 0)

    -- Add a default backdrop to the button
    btnP:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = false,
        tileSize = 1,
        edgeSize = 1,
        insets = { left = 1, right = 1, top = 1, bottom = 1 }
    })
    btnP:SetBackdropColor(0.102, 0.102, 0.102, 1)

    btnP:SetScript("OnEnter", function()
        row:SetBackdropColor(0.5, 0.5, 0.5, 1) -- Light gray highlight
    end)

    btnP:SetScript("OnLeave", function()
        row:SetBackdropColor(0.05, 0.05, 0.05, 0.95)
    end)

    btnP:HookScript("OnClick", function(_, button)
        if button == "LeftButton" then
            if item.linkItem then
                self:Print(item.linkItem)
            end
        end
    end)

    -- Skin for ElvUI
    pcall(function()
        local E = ElvUI[1]
        local S = E:GetModule("Skins")
        if E.private.skins.blizzard.enable and E.private.skins.blizzard.merchant then
            S:HandleButton(btnP)
        end
    end)

    local rowText = btnP:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    rowText:SetJustifyH("LEFT")
    rowText:SetPoint("LEFT", 2 , 0)
    rowText:SetText(item.display)

    -- Additional item details (percentage, quantity, clear button)
    if item.percentage then
        local btn = CreateFrame("Button", nil, btnP)
        btn:SetWidth(50)
        btn:SetHeight(20)
        btn:SetPoint("RIGHT", 0, 0)

        local percentage = btn:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        percentage:SetPoint("LEFT")
        percentage:SetText(string.format("%.2f%%", item.percentage))
    end

    if item.quantity then
        local btn = CreateFrame("Button", nil, btnP)
        btn:SetWidth(35)
        btn:SetHeight(20)
        btn:SetPoint("RIGHT", 0, 0)

        local quantity = btn:CreateFontString(nil, "ARTWORK", "GameFontNormal")
        quantity:SetPoint("LEFT")
        quantity:SetText(item.quantity)
    end

    if item.clear then
        local btn = CreateFrame("Button", nil, btnP)
        btn:SetWidth(20)
        btn:SetHeight(20)
        btn:SetPoint("LEFT", -20, 0)

        local clear = btn:CreateTexture(nil, "ARTWORK")
        clear:SetPoint("CENTER")
        clear:SetTexture("interface\\buttons\\ui-stopbutton")
        clear:SetSize(25, 25)

        btn:RegisterForClicks("LeftButtonUp", "RightButtonUp")

        btn:HookScript("OnClick", function(self, button)
            if button == "LeftButton" and IsAltKeyDown() then
                table.remove(data, index) -- Remove item from data at index
                UpdateRows(data)          -- Rebuild rows with updated data
            end
        end)

        btn:SetScript("OnEnter", function()
            btnP:SetBackdropColor(0.5, 0.5, 0.5, 1) -- Light gray highlight
            GameTooltip:SetOwner(params.parent, "ANCHOR_RIGHT", 0, -34)
            GameTooltip:SetText("Remove this item from AH shop list", 1, 1, 1)
            GameTooltip:AddLine("Alt + Click to remove", nil, nil, nil, true)
            GameTooltip:Show()
        end)

        btn:SetScript("OnLeave", function()
            btnP:SetBackdropColor(0.102, 0.102, 0.102, 1)
            GameTooltip:Hide()
        end)
    end

    return row
end


function CollectorHelper:CreateScrollableContent(params)
    local sf = CreateFrame("ScrollFrame", nil, params.parent, "UIPanelScrollFrameTemplate")
    sf:SetSize(params.xwidth or params.width, params.height)
    sf:SetPoint(params.point.pos, params.point.x, params.point.y)


    local sc = CreateFrame("Frame", nil, sf)
    sc:SetSize(params.xwidth or params.width, 1)
    sf:SetScrollChild(sc)

    local rows = {}

    local function updateScroll(data)
        sc:SetHeight(#data * 21) -- Adjust scroll height based on rows
        if sc:GetHeight() + 10 > sf:GetHeight() then
            sf.ScrollBar:Show()
        else
            sf.ScrollBar:Hide()
        end
    end

    local function UpdateRows(data)
        -- Clear existing rows
        for _, row in ipairs(rows) do
            row:Hide()
            row:SetParent(nil)
            row = nil
        end
        rows = {}

        -- Create new rows
        for i, item in ipairs(data) do
            rows[i] = self:CreateRow(i, item, data, params, sc, UpdateRows)
        end
        updateScroll(data)
    end

    return {
        scrollFrame = sf,
        UpdateRows = UpdateRows
    }
end

