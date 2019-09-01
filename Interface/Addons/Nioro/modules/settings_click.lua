local addonName = GetAddOnMetadata(..., 'Title')
local addon = LibStub('AceAddon-3.0'):GetAddon(addonName)
local L = LibStub("AceLocale-3.0"):GetLocale(addonName, false)
local Click = addon:NewModule('SettingsClick')
local Actions = addon:GetModule('Actions')
local Utils = addon:GetModule('Utils')

local separatorGenerator = function (order)
    return { name = '\n' ,type = 'description', order = order }
end

local click = {
    click = {
        name = L.SETTINGS_CLICK_NAME,
        type = 'group',
        order = 2,
        args = {
            resizeHander = {
                name = L.SETTINGS_CLICK_HANDER,
                type = 'header',
                order = 1,
            },
        },
    },
}

function Click:get()
    return click
end

function Click:OnInitialize()
end
