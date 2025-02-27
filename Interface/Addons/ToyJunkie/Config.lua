local addonName, L = ...

L.ToyJunkie = LibStub("AceAddon-3.0"):NewAddon("ToyJunkie","AceConsole-3.0", "AceEvent-3.0", "AceHook-3.0")
L.ToyJunkie.Icon = LibStub("LibDBIcon-1.0")

local AC = LibStub("AceConfig-3.0")
local ACD = LibStub("AceConfigDialog-3.0")

---------------------
-- Local variables --
---------------------

L.isInCombat = false

------------------------------
-- Default Profile Settings --
------------------------------

L.defaults = {
    profile = {
        isAttachedWindowHidden = true,
        selectedToybox = nil,
        minimap = {
            hide = false,
            lock = false
        },
        toyBoxFrame = {
            locked = false,
            location = {
                point = "TOPLEFT",
                relativePoint = "TOPLEFT",
                offsetX = 21,
                offsetY = -18,
            },
            width = 194,
            height = 204,
            iconSize = 48,
            isSideBarShown = true,
            isShown = false
        },
        addonCompartment = true,
        boxes = {
            
        }
    }
}

local options = {
    name = "ToyJunkie",
    handler = L.ToyJunkie,
    type = "group",
    args = {
        minimap = {
            order = 2,
            type = "group",
            name = "Minimap Button",
            inline = true,
            args = {
                button = {
                    type = "toggle",
                    name = "Show Button",
                    desc = "Show/Hide minimap button",
                    order = 2,
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.minimap.hide = not val
                        if(L.ToyJunkie.db.profile.minimap.hide) then
                            L.ToyJunkie.Icon:Hide(addonName)
                        else
                            L.ToyJunkie.Icon:Show(addonName)
                        end
                    end),
                    get = (function(info)
                        return not L.ToyJunkie.db.profile.minimap.hide
                    end)
                },
                lock = {
                    type = "toggle",
                    name = "Lock Button",
                    desc = "Lock/unlock minimap button in place",
                    order = 3,
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.minimap.lock = val
                        if(L.ToyJunkie.db.profile.minimap.lock) then
                            L.ToyJunkie.Icon:Lock(addonName)
                        else
                            L.ToyJunkie.Icon:Unlock(addonName)
                        end
                    end),
                    get = (function(info)
                        return L.ToyJunkie.db.profile.minimap.lock
                    end)
                },
                compartment = {
                    type = "toggle",
                    name = "Addon Compartment",
                    desc = "Show ToyJunkie in addon compartment",
                    order = 4,
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.addonCompartment = val
                        if(L.ToyJunkie.db.profile.addonCompartment) then
                            L.ToyJunkie.Icon:AddButtonToCompartment(addonName)
                        else
                            L.ToyJunkie.Icon:RemoveButtonFromCompartment(addonName)
                        end
                    end),
                    get = (function(info)
                        return L.ToyJunkie.db.profile.addonCompartment
                    end)
                }
            }
        },
        toyboxSettings = {
            type = "group",
            name = "Toybox Settings",
            inline = true,
            order = 1,
            args = {
                iconSize = {
                    type = "range",
                    order = 1,
                    min = 16,
                    max = 48,
                    softMin = 16,
                    softMax = 48,
                    name = "Toy Icon Size",
                    step = 1,
                    get = (function(info) 
                        return L.ToyJunkie.db.profile.toyBoxFrame.iconSize
                    end),
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.toyBoxFrame.iconSize = val
                        L.ToyboxFrame:UpdateToyButtons()
                        L.ToyboxFrame:UpdateBounds()
                    end)
                }--[[,
                spacer = {
                    type = "header",
                    order = 2,
                    name = ""
                },
                frameOpacity = {
                    type = "range",
                    name = "Toybox Opacity",
                    order = 3,
                    min = 0,
                    max = 1,
                    softMin = 0,
                    softMax = 1,
                    isPercent = true,
                    step = .01,
                    get = (function(info) 
                        return L.ToyJunkie.db.profile.toyBoxFrame.opacity
                    end),
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.toyBoxFrame.opacity = val
                        L.ToyboxFrame:SetAlpha(val)
                    end)
                },
                mouseOverOpacity = {
                    type = "range",
                    name = "Toybox Mouseover Opacity",
                    order = 4,
                    min = 0,
                    max = 1,
                    softMin = 0,
                    softMax = 1,
                    isPercent = true,
                    step = .01,
                    get = (function(info) 
                        return L.ToyJunkie.db.profile.toyBoxFrame.mouseOverOpacity
                    end),
                    set = (function(info, val)
                        L.ToyJunkie.db.profile.toyBoxFrame.mouseOverOpacity = val
                    end)
                }]]
            }
        }
    }
}

function L.ToyJunkie:ConfigurationInitialize(self)
    AC:RegisterOptionsTable("ToyJunkie_options", options)
    self.optionFrame, L.catID = ACD:AddToBlizOptions("ToyJunkie_options", "ToyJunkie")

    local profiles = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
    AC:RegisterOptionsTable("ToyJunkie", profiles)
    ACD:AddToBlizOptions("ToyJunkie", "Profiles", "ToyJunkie")
end

--[[ 
    settings: 
        displaySize = 1-Compact, 2-Normal, 3-Special?
        showTooltips = true/false
            (Possible option to hold shift to show tooltips)
        minimap button = hide - true/false, lock - true/false
            (Message to mention about LDB addon)
        addonCompartment = true/false
        profiles = button to open profiles in addonsettings

        134400 130724
]]
