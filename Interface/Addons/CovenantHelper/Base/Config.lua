local addonName, addon = ...
local E, L = unpack(_G[addonName])
local Module = E:NewModule('Config')
E.Config = Module

local ADDON_CONFIG_VERION = 1

function Module:GetValue(keys)
    local node = E.DB.profile
    if not node then
        return nil
    end

    if type(keys) == "table" then
        for _, v in ipairs(keys) do
            if not node[v] then
                return nil
            end

            node = node[v]
        end

        return node
    else
        return node[keys]
    end
end

function Module:SetValue(keys, newvalue)
    local node = E.DB.profile
    if not node then
        return nil
    end

    if type(keys) == "table" then
        if #keys == 1 then
            node[keys[1]] = newvalue
        else
            for i = 1, #keys - 1 do
                local v = keys[i]
                if not node[v] then
                    node[v] = {}
                end
                node = node[v]
            end
            node[keys[#keys]] = newvalue
        end
    else
        node[keys] = newvalue
    end
end

function Module:GetDefaultConfiguration()
    local LibSharedMedia = LibStub("LibSharedMedia-3.0")
    local DEFAULT_FONT_NAME = LibSharedMedia:GetDefault("font")
    return {
        profile = {
            enable = true,
            --version = ADDON_CONFIG_VERION,
            fontname = DEFAULT_FONT_NAME,
            fontSize = E.DEFAULT_FONT_SIZE,
			fontOutline = E.DEFAULT_FONT_OUTLINE,
            fontShadow = E.DEFAULT_FONT_SHADOW,
            displayTime = E.DEFAULT_DISPLAY_TIME,
            delayTime = E.DEFAULT_DISPLAY_DELAY_TIME,
        }
    }
end

function Module:MigrateConfiguration()
    local version = self:GetValue({"Version"}) or ADDON_CONFIG_VERION
    if version ~= ADDON_CONFIG_VERION then
        
    end

    self:SetValue({"Version"}, ADDON_CONFIG_VERION)
end

function Module:OnInitialize()
    self:MigrateConfiguration()
end