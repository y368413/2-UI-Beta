
-- Register Addon Table --
-------------------------- 
	local Addon = HyperframePlusAddon           -- Addon Table (Table)
    local AddonName = Addon.AddonName           -- Addon Name (String)
    local AddonFileName = Addon.AddonFileName   -- Addon File Name (String)

-- Truncate Text --
------------------- 
    local function TruncateTextWithColor(label, labelColor, text, textColor, maxLength)
        if #text > maxLength then
            return labelColor .. label .. "|r" .. textColor .. text:sub(1, maxLength) .. "..." .. "|r"
        else
            return labelColor .. label .. "|r" .. textColor .. text .. "|r"
        end
    end

    local function TruncateText(text, maxLength)
        if #text > maxLength then
            return text:sub(1, maxLength) .. "..."
        else
            return text
        end
    end

-- Remove Trailing Zeros --
--------------------------- 
    local function removeTrailingZeros(value)
        local numberValue = tonumber(value)
        if not numberValue then
            return value
        end

        local formatted = string.format("%.10f", numberValue)
        formatted = formatted:match("(.-)%.?0*$")
        return formatted
    end

-- Category Names --
-------------------- 
    local CategoryNames = { 
        [0] = "Debug",
        [1] = "Graphics",
        [2] = "Console",
        [3] = "Combat",
        [4] = "Game",
        [5] = "Default",
        [6] = "Net",
        [7] = "Sound",
        [8] = "GM",
        [9] = "None",
    }

-- CVar Viewer --
----------------- 
    function Addon.CreateUI()

        if HFP_CVarViewerFrame then
            return
        end

        Addon:DumpCVars()

        local frame = CreateFrame("Frame", "HFP_CVarViewerFrame", UIParent, "BasicFrameTemplateWithInset")
        frame:SetSize(1000, 600)
        frame:SetPoint("CENTER")
        frame:SetFrameLevel(9997)
        frame:SetMovable(true)
        frame:EnableMouse(true)
        frame:EnableKeyboard(true)

        -- tinsert(UISpecialFrames, "HFP_CVarViewerFrame")

        frame:RegisterForDrag("LeftButton")
        frame:SetScript("OnDragStart", function(self, button)
	        self:StartMoving()
        end)
        frame:SetScript("OnDragStop", function(self)
	        self:StopMovingOrSizing()
        end)

        frame.title = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        frame.title:SetPoint("CENTER", frame.TitleBg, "CENTER", 0, -1)
        frame.title:SetText(Addon.p .. "Hyperframe CVar Viewer")

        local searchBox = CreateFrame("EditBox", nil, frame, "InputBoxTemplate")
        searchBox:SetSize(948, 20)
        searchBox:SetPoint("TOP", frame, "TOP", -9, -32)
        searchBox:SetAutoFocus(false)
        searchBox:SetText("Search...")

        searchBox:SetScript("OnEnter", function(self)
	        GameTooltip:SetOwner(self, "ANCHOR_TOPRIGHT", 0, 5)
	        GameTooltip:SetText(Addon.ly .. "Search Filters\n\n" .. 
                Addon.b .. "Keyword\n" .. Addon.w .. "Returns all console variables that contain the keyword in their \nname, category, or description.\n\n" ..
                Addon.b .. "NotDefault\n" .. Addon.w .. "Returns all console variables that are not set to their default \nvalue."
                )
        end)
        searchBox:SetScript("OnLeave", GameTooltip_Hide)

        local scrollFrame = CreateFrame("ScrollFrame", nil, frame, "UIPanelScrollFrameTemplate")
        scrollFrame:SetPoint("TOPLEFT", 10, -62)
        scrollFrame:SetPoint("BOTTOMRIGHT", -34, 8)

        local content = CreateFrame("Frame", nil, scrollFrame)
        content:SetSize(940, 1)
        scrollFrame:SetScrollChild(content)

        local elementCache = {}

        local function RefreshScrollFrame(filterText)
            for _, element in ipairs(elementCache) do
                element:Hide()
            end

            local sortedKeys = {}
            for command, info in pairs(Addon.CVars) do
                local categoryName = CategoryNames[info.category] or ""
                local description = info.description or ""
                local defaultValue = C_CVar.GetCVarDefault(command) or ""
                local currentValue = C_CVar.GetCVar(command) or ""

                if filterText and filterText:lower() == "notdefault" then
                    if currentValue ~= defaultValue then
                        table.insert(sortedKeys, command)
                    end
                else
                    if not filterText
                        or command:lower():find(filterText:lower())
                        or defaultValue:lower():find(filterText:lower())
                        or categoryName:lower():find(filterText:lower())
                        or description:lower():find(filterText:lower())
                    then
                        table.insert(sortedKeys, command)
                    end
                end
            end

            table.sort(sortedKeys, function(a, b)
                return a:lower() < b:lower()
            end)

            local yOffset = 0
            for _, command in ipairs(sortedKeys) do
                local info = Addon.CVars[command]
                local categoryName = CategoryNames[info.category] or ""
                local description = info.description or ""
                local defaultValue = C_CVar.GetCVarDefault(command) or ""
                local currentValue = C_CVar.GetCVar(command) or ""
                local isNotDefault = currentValue ~= defaultValue

                local commandText = elementCache[#elementCache + 1] or content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                commandText:SetPoint("TOPLEFT", 10, yOffset)
                commandText:SetText(Addon.ly .. TruncateText(command, 35))
                commandText:SetJustifyH("LEFT")
                commandText:Show()

                commandText:SetScript("OnEnter", function()
                    GameTooltip:SetOwner(commandText, "ANCHOR_CURSOR_RIGHT")
                    GameTooltip:AddLine(Addon.ly .. command, 1, 1, 1)
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine(Addon.b .. "Category: " .. Addon.w .. categoryName)
                    GameTooltip:AddLine(Addon.b .. "Default Value: " .. Addon.w .. (info.defaultValue or ""))
                    GameTooltip:AddLine(Addon.b .. "Current Value: " .. Addon.w .. (info.currentValue or ""))
                    GameTooltip:AddLine(Addon.b .. "Command Type: " .. Addon.w .. (info.commandType or ""))
                    GameTooltip:AddLine(Addon.b .. "Script Parameters: " .. Addon.w .. (info.scriptParameters or ""))
                    GameTooltip:AddLine(Addon.b .. "Script Contents: " .. Addon.w .. (info.scriptContents or ""))
                    GameTooltip:AddLine(" ")
                    GameTooltip:AddLine(Addon.r .. "Click to Copy (CTRL + C)")
                    GameTooltip:Show()
                end)
                commandText:SetScript("OnLeave", GameTooltip_Hide)

                local categoryText = elementCache[#elementCache + 1] or content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                categoryText:SetPoint("TOPLEFT", 399, yOffset)
                categoryText:SetText(Addon.b .. "Category: " .. Addon.w .. categoryName)
                categoryText:SetJustifyH("LEFT")
                categoryText:Show()

                local defaultValueText = elementCache[#elementCache + 1] or content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                defaultValueText:SetPoint("TOPLEFT", 250, yOffset)
                local cleanedDefaultValue = removeTrailingZeros(defaultValue)
                local truncatedDefaultValue = TruncateTextWithColor("Default: ", Addon.b, cleanedDefaultValue, Addon.w, 14)
                defaultValueText:SetText(truncatedDefaultValue)
                defaultValueText:SetJustifyH("LEFT")
                defaultValueText:Show()

                local descriptionText = elementCache[#elementCache + 1] or content:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
                descriptionText:SetPoint("TOPLEFT", 550, yOffset)
                local truncatedDescription = TruncateTextWithColor("Description: ", Addon.b, description, Addon.w, 34)
                descriptionText:SetText(truncatedDescription)
                descriptionText:SetJustifyH("LEFT")
                descriptionText:Show()

                descriptionText:SetScript("OnEnter", function()
                    if not description:match("%S") then return end

                    GameTooltip:SetOwner(descriptionText, "ANCHOR_CURSOR_RIGHT")
                    GameTooltip:AddLine(Addon.b .. "Description", 1, 1, 1)
                    GameTooltip:AddLine(Addon.w .. description, 1, 1, 1, true)
                    GameTooltip:Show()
                end)
                descriptionText:SetScript("OnLeave", GameTooltip_Hide)

                local inputBox = elementCache[#elementCache + 1] or CreateFrame("EditBox", nil, content, "InputBoxTemplate")
                inputBox:SetSize(100, 20)
                inputBox:SetPoint("TOPLEFT", 852, yOffset)

                local value = C_CVar.GetCVar(command)
                local defaultValue = C_CVar.GetCVarDefault(command)
                local cleanedValue = removeTrailingZeros(value)
                local cleanedDefaultValue = removeTrailingZeros(defaultValue)

                if cleanedValue ~= cleanedDefaultValue then
                    cleanedValue = Addon.r .. cleanedValue
                end

                inputBox:SetText(cleanedValue or "")
                inputBox:SetCursorPosition(0)
                inputBox:SetAutoFocus(false)
                inputBox:SetJustifyH("CENTER")
                inputBox:Show()

                local valueSaved = false

                inputBox:SetScript("OnEnterPressed", function(self)
                    local newValue = self:GetText()

                    local strippedValue = newValue
                        :gsub("\124c%x%x%x%x%x%x%x%x", "")
                        :gsub("\124cn[%a_]+:", "")
                        :gsub("\124r", "")

                    local previousValue = C_CVar.GetCVar(command)

                    if strippedValue == "" or not strippedValue:match("%S") then
                        strippedValue = ""
                        inputBox:SetText("")
                        C_CVar.SetCVar(command, "")
                        valueSaved = true
                    else
                        C_CVar.SetCVar(command, strippedValue)
                        valueSaved = true
                    end

                    C_Timer.After(0.25, function()
                        local newValue = C_CVar.GetCVar(command)

                        if newValue == previousValue then
                            inputBox:SetText(previousValue)
                            print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: " .. Addon.r .. "Failed to update |c00ffffff" .. command .. Addon.r .. " due to invalid input.")
                        else
                            local displayValue = (newValue == "" and "Empty") or newValue
                            print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: Updated |c00ffffff" .. command .. "|c00ffff00 to |c00ffffff" .. displayValue .. "|c00ffff00.")
                        end

                        local cleanedNewValue = removeTrailingZeros(C_CVar.GetCVar(command))
                        local cleanedDefaultValue = removeTrailingZeros(C_CVar.GetCVarDefault(command))

                        if cleanedNewValue == cleanedDefaultValue then
                            inputBox:SetText(Addon.w .. cleanedNewValue)
                        else
                            inputBox:SetText(Addon.r .. cleanedNewValue)
                        end
                    end)

                    inputBox:ClearFocus()
                end)

                inputBox:SetScript("OnEditFocusGained", function()
                    Addon.editBoxPlaceHolder = inputBox:GetText()
                    valueSaved = false
                end)

                inputBox:SetScript("OnEditFocusLost", function()
                    local value = inputBox:GetText()

                    if valueSaved then
                        return
                    end

                    if value == "" or value:match("^%s*$") then
                        inputBox:SetText(Addon.editBoxPlaceHolder)
                    elseif value ~= Addon.editBoxPlaceHolder then
                        inputBox:SetText(Addon.editBoxPlaceHolder)
                        print("|c00ffff00[|cffdd70ddHyperframe|c00ffff00]: You must press the " .. Addon.w .. "Enter" .. "|c00ffff00 key to save the " .. Addon.w .. command .. "|c00ffff00 setting.")
                    end
                end)

                table.insert(elementCache, commandText)
                table.insert(elementCache, categoryText)
                table.insert(elementCache, defaultValueText)
                table.insert(elementCache, descriptionText)
                table.insert(elementCache, inputBox)

                yOffset = yOffset - 25
            end

            content:SetHeight(math.abs(yOffset))
        end

        local clearButton = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
        clearButton:SetSize(20, 20)
        clearButton:SetPoint("LEFT", searchBox, "RIGHT", 4, 0)
        clearButton:SetFrameLevel(9999)
        clearButton:SetScript("OnClick", function()
            searchBox:SetText("Search...")
            RefreshScrollFrame(nil)
        end)

        searchBox:SetScript("OnTextChanged", function(self)
            local text = self:GetText()
            if text == "" or text == "Search..." then
                RefreshScrollFrame(nil)
            else
                RefreshScrollFrame(text)
            end
        end)

        frame:SetScript("OnHide", function(self)
            frame = nil
            Addon.CVars = {}
            elementCache = {}
            HFP_CVarViewerFrame = nil
            collectgarbage()
        end)

        frame:SetScript("OnKeyDown", function(self, key)
            if key == "ESCAPE" then
                self:Hide()
            end
        end)

        RefreshScrollFrame(nil)

        frame:Show()

    end