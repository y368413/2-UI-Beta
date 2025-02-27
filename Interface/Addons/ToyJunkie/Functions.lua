local addonName, L = ...

-- Icon size enumeration
function L:GetIconSize()
    return L.ToyJunkie.db.profile.toyBoxFrame.iconSize, L.ToyJunkie.db.profile.toyBoxFrame.iconSize
end

function L:GetIconMargin()
    return L.ToyJunkie.db.profile.toyBoxFrame.iconSize / 6
end

function L:CountTable(table)
    local count = 0
    for i,v in pairs(table) do
        count = count + 1
    end
    return count
end

--check if item on cursor is a toy
function L:CursorHasToy()
    if (GetCursorInfo()) then
        local itemType, id = GetCursorInfo()
        if(itemType == "item") then
            if(id) then
                if (C_ToyBox.GetToyInfo(id)) then
                    return true
                end
            end
        end
    end
    return false
end

function L:CursorOnTopHalf(element)
    local _, y = GetCursorPosition()
    local scale = element:GetEffectiveScale()
    local _, cy = element:GetCenter()

    if (y / scale > cy) then
        return true
    end
    return false
end

function L:GetUsableHearthstones()
    local hearthstones = {}
    for k, hsID in pairs(L.HearthstoneIds) do
        if(PlayerHasToy(hsID) and C_ToyBox.IsToyUsable(hsID)) then
            table.insert(hearthstones, hsID)
        end
    end
    return hearthstones
end

function L:GetBackdropColorByToyboxId(id)
    if (L.ToyJunkie.db.profile.boxes[id] ~= nil) then
        if (L.ToyJunkie.db.profile.boxes[id].toyColor ~= nil) then
            return L.ToyJunkie.db.profile.boxes[id].toyColor.red,
                L.ToyJunkie.db.profile.boxes[id].toyColor.green,
                L.ToyJunkie.db.profile.boxes[id].toyColor.blue,
                L.ToyJunkie.db.profile.boxes[id].toyColor.alpha
        end
    end
    return 0, 1, 0, .25
end

function L:IsToyboxNameDuplicate(name, checkCase, ignore)
    checkCase = checkCase or false
    for _, box in pairs(L.ToyJunkie.db.profile.boxes) do
        if (box.name ~= ignore) then
            if (not checkCase) then
                if (string.lower(box.name) == string.lower(name)) then
                    return true
                end
            else
                if (box.name == name) then
                    return true
                end
            end
        end
    end
    return false
end

function L:GetToyboxId(toybox) -- toybox can be from the profile boxes or from list element toy box
    for k, v in pairs(L.ToyJunkie.db.profile.boxes) do
        if (v.name == toybox.name) then
            return k
        end
    end
    return nil
end

function L:GetToyBoxIdByName(name)
    for k, v in pairs(L.ToyJunkie.db.profile.boxes) do
        if (string.lower(v.name) == string.lower(name)) then
            return k
        end
    end
    return nil
end

function L:GetToyIndex(toyId, toyboxId)
    for k, v in pairs(L.ToyJunkie.db.profile.boxes[toyboxId].toys) do
        if (v == toyId) then
            return k
        end
    end
end

function L:strStart(String, Start)
    return strsub(String, 1, string.len(Start)) == Start
end

function L:strContains(str, searchText)
    local contains = true
    local searchTerms = L:searchSplit(searchText)
    for key, searchTerm in pairs(searchTerms) do
        if (not string.find(string.lower(str), searchTerm)) then
            contains = false
        end
    end
    return contains
end

function L:searchSplit(inputstr, sep)
    sep = sep or '%s'
    local t = {}
    for field, s in string.gmatch(inputstr, "([^" .. sep .. "]*)(" .. sep .. "?)") do
        table.insert(t, string.lower(field))
        if s == "" then
            return t
        end
    end
end

function L:AddToy(toyId, toyboxId, index)
    for key, id in pairs(L.ToyJunkie.db.profile.boxes[toyboxId].toys) do
        if (id == toyId) then
            UIErrorsFrame:AddExternalErrorMessage("That toy is already in this toy box.")
            return
        end
    end
    if (index ~= nil) then
        table.insert(L.ToyJunkie.db.profile.boxes[toyboxId].toys, index, toyId)
    else
        table.insert(L.ToyJunkie.db.profile.boxes[toyboxId].toys, toyId)
    end

    if (L.ToyboxFrame:IsShown()) then
        L.ToyboxFrame:UpdateToyButtons()
        L.ToyboxFrame:SelectNewRandomToy()
    end
end

function L:CheckIfToyExistsInToybox(toyId, toyboxId)
    for key, id in pairs(L.ToyJunkie.db.profile.boxes[toyboxId].toys) do
        if (id == toyId) then
            UIErrorsFrame:AddExternalErrorMessage("That toy is already in the target toy box.")
            return true
        end
    end
    return false
end

function L:GetToyButton(id)
    for k, v in pairs(L.ToyboxFrame.ToyButtonHolderFrame.Buttons) do
        if (v.num == id) then
            return v
        end
    end
end

---------------------------
-- Reusable Context Menu --
---------------------------

function L:CreateContextMenu(menu)
    local dropdownName = "$parent_" .. menu.name .. "_dropdown"
    local items = menu.items or {}
    local title = menu.title

    local dropdown = CreateFrame("Frame", dropdownName, _G["$parent"], "UIDropDownMenuTemplate")

    UIDropDownMenu_Initialize(dropdown, function(self, level, _)
        local info = UIDropDownMenu_CreateInfo()
        if (title ~= nil) then
            info.text = title
            info.isTitle = true
            info.notCheckable = true
            UIDropDownMenu_AddButton(info)
        end

        for key, value in pairs(items) do
            if (value.separator) then
                UIDropDownMenu_AddSeparator()
            else
                info = UIDropDownMenu_CreateInfo()
                info.text = value.text
                info.notCheckable = true
                info.func = value.func
                info.icon = value.icon
                info.colorCode = value.color
                info.tooltipTitle = value.tooltipTitle
                info.tooltipText = value.tooltipText
                info.tooltipWarning = value.tooltipWarning
                info.tooltipOnButton = true
                UIDropDownMenu_AddButton(info)
            end
        end
    end, "MENU")

    return dropdown
end

-------------------------
-- Toy button template --
-------------------------
function L:CreateToyButton()
    local button = CreateFrame("Button", nil, L.ToyboxFrame.ToyButtonHolderFrame.ScrollChild, "SecureActionButtonTemplate")
    button:SetSize(L:GetIconSize())
    button:RegisterForClicks("AnyUp", "AnyDown")
    button:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
    button.Cooldown = CreateFrame("Cooldown", nil, button, "CooldownFrameTemplate")
    button.Cooldown:SetAllPoints()
    button.Cooldown:Hide()
    button:SetScript("OnEvent", function(self, event)
        if(event == "SPELL_UPDATE_COOLDOWN") then
            if(self.id ~= nil) then
                local start, duration, enable = C_Item.GetItemCooldown(self.id)
                if(start > 0) then
                    CooldownFrame_Set(self.Cooldown, start, duration, enable)
                end
            end
        end
    end)

    button:HookScript("OnEnter", function(self)
        if(self.id ~= nil) then
            GameTooltip:SetOwner(self, "ANCHOR_TOP")
            local _, toyName = C_ToyBox.GetToyInfo(self.id)
            GameTooltip:AddLine(toyName)
            GameTooltip:Show()
        end
    end)
    button:HookScript("OnLeave", function(self)
        if(self.id ~= nil) then
            GameTooltip:Hide()
        end
    end)
    button.id = nil
    button:Hide()

    function button:UpdateButton(toyId)
        if(toyId) then
            local _, _, toyIcon = C_ToyBox.GetToyInfo(toyId)
            if(toyIcon == nil) then
                toyIcon = 134400
            end

            button.id = toyId
            button:SetNormalTexture(toyIcon)
            button:SetAttribute("type1", "toy")
            button:SetAttribute("toy1", toyId)
            button:RegisterEvent("SPELL_UPDATE_COOLDOWN")
            button:CheckCooldown()
            button:SetSize(L:GetIconSize())
        end
    end

    function button:RemoveButton()
        button.id = nil
        button:Hide()
    end

    function button:CheckCooldown()
        if(button.id ~= nil and button:IsShown()) then
            local start, duration, enable = C_Item.GetItemCooldown(button.id)
            if (start > 0) then
                CooldownFrame_Set(button.Cooldown, start, duration, enable)
            else
                button.Cooldown:Hide()
            end
        end
    end

    return button
end

function L:CheckAllCooldowns()
    if(L.ToyboxFrame.ToyButtons ~= nil) then
        for k, v in pairs(L.ToyboxFrame.ToyButtons) do
            if(v.id  ~= nil) then
                v:CheckCooldown()
            end
        end
    end
end

function L:GetNumOfActiveButtons()
    if(L.ToyboxFrame.ToyButtons == nil) then
        return 0
    end
    local count = 0
    for k, v in pairs(L.ToyboxFrame.ToyButtons) do
        if(v.id ~= nil) then
            count = count + 1
        end
    end
    return count
end
