local modName, core = ...
core.Helper = {}

local Config = core.Config
local Helper = core.Helper

local function formatText(color, text)
    return string.format("|cff%s%s|r", color, text)
end

function Helper:Print(...)
    local addonPrefix = formatText(Config.colors.PRINT_COLOR_ADDON_NAME_RGB, modName .. ":")
    DEFAULT_CHAT_FRAME:AddMessage(string.join(" ", addonPrefix, tostringall(...)))
end

function Helper:PrintDefault(text)
    local textColor = Config.colors.PRINT_COLOR_TEXT_RGB
    local defaultFormatText = formatText(textColor, text)
    Helper:Print(defaultFormatText)
end

function Helper:PrintCommand(command, description)
    local commandColor = Config.colors.PRINT_COLOR_ADDON_COMMAND_RGB
    local commandFormatText = formatText(commandColor, command)
    local textColor = Config.colors.PRINT_COLOR_TEXT_RGB
    local defaultFormatDescription = formatText(textColor, description)
    Helper:Print(commandFormatText .. defaultFormatDescription)
end

function Helper:Log(...)
    if Config.log then
        Helper:Print(...)
    end
end

function Helper:ForEach(input, filterFunc)
    if (type(filterFunc) ~= "function") then
        return nil
    end
    for key, value in pairs(input) do
        filterFunc(value, key)
    end
end

function Helper:PrintTable(table)
    Helper:ForEach(table, print)
end

function Helper:GetFirstOrDefault(input, filterFunc)
    if (type(filterFunc) ~= "function") then
        return nil
    end
    for key, value in pairs(input) do
        if filterFunc(value, key) == true then
            return value
        end
    end
    return nil
end

function Helper:Filter(input, filterFunc)
    if (type(filterFunc) ~= "function") then
        return nil
    end
    local outputArray = {}
    for key, value in pairs(input) do
        if filterFunc(value, key) == true then
            table.insert(outputArray, value)
        end
    end
    return outputArray
end

function Helper:IsNilOrEmpty(inputStr)
    if (inputStr == nil) then
        return true
    end
    local trimmed = inputStr:gsub("^%s*(.-)%s*$", "%1")
    return #trimmed == 0
end
