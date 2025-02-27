local addonName, L = ...

local hearthstonesLoaded = false

function L.ToyJunkie:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("ToyJunkieDB", L.defaults, true)
    L.ToyJunkie:ConfigurationInitialize(self)

    if(JunkieDebug) then --Debug command
        LVar = L
    end

    local ldb = LibStub:GetLibrary("LibDataBroker-1.1")
    ---@diagnostic disable-next-line: missing-fields
    local dataObj = ldb:NewDataObject(addonName, {
        type = "data source",
        icon = "454046",
        label = "Toy Junkie",
        OnClick = function(obj, button)
            if (button == "LeftButton") then
                L.ToyboxFrame:Toggle()
            elseif (button == "RightButton") then
                Settings.OpenToCategory(L.catID)
            end
        end
    })
    L.ToyJunkie.Icon:Register(addonName, dataObj, self.db.profile.minimap)

    self:RegisterChatCommand("tj", "TJCommand")
    self:RegisterChatCommand("toyjunkie", "TJCommand")
end

function L.ToyJunkie:OnEnable()
    self:RegisterEvent("TOYS_UPDATED")
    self:RegisterEvent("PLAYER_REGEN_DISABLED")
    self:RegisterEvent("PLAYER_REGEN_ENABLED")

    if (#L.ToyJunkie.db.profile.boxes < 1) then
        L.ToyJunkie.db.profile.selectedToybox = nil
        L.ToyJunkie.db.profile.toyboxShown = false
    end

    if (L.ToyJunkie.db.profile.addonCompartment) then
        L.ToyJunkie.Icon:AddButtonToCompartment(addonName)
    end

    if(L.ToyJunkie.db.profile.minimap.hide) then
        L.ToyJunkie.Icon:Hide(addonName)
    else
        L.ToyJunkie.Icon:Show(addonName)
    end

    if(L.ToyJunkie.db.profile.minimap.lock) then
        L.ToyJunkie.Icon:Lock(addonName)
    else
        L.ToyJunkie.Icon:Unlock(addonName)
    end

    if(L.ToyJunkie.db.profile.addonCompartment) then
        L.ToyJunkie.Icon:AddButtonToCompartment(addonName)
    else
        L.ToyJunkie.Icon:RemoveButtonFromCompartment(addonName)
    end

    L.ToyboxFrame:UpdatePosition()
    L.ToyboxFrame:SelectNewRandomToy()
end

function L.ToyJunkie:TJCommand(msg)
    if (not msg or msg:trim() == "") then
        L.ToyboxFrame:Toggle()
    else
        local cmd = {}
        for word in msg:gmatch("%S+") do table.insert(cmd, word) end
        if(cmd[1]:lower() == "box") then
            local search = table.concat(cmd, " ", 2)
            if(not search or search:trim() == "") then
                self:Print("Command 'box' requires a parameter to search for a toybox.")
                self:Print("Example: /tj box Hearthstones")
            else
                local box = L:GetToyBoxIdByName(search)
                if(box ~= nil) then
                    L.ToyJunkie.db.profile.selectedToybox = L.ToyJunkie.db.profile.boxes[box].name
                    L.ToyboxFrame:UpdateToyboxDisplay()
                    L.ToyboxFrame:UpdateToyButtons()
                    if(not L.ToyboxFrame:IsShown()) then
                        L.ToyboxFrame:Toggle()
                    end
                else
                    self:Print("Toybox '" .. search .."' not found.")
                end
            end
        elseif(cmd[1]:lower() == "clean") then
            for k, boxes in pairs(L.ToyJunkie.db.profile.boxes) do
                local tempToys = {}
                for i, toy in pairs(L.ToyJunkie.db.profile.boxes[k].toys) do
                    table.insert(tempToys, toy)
                end
                L.ToyJunkie.db.profile.boxes[k].toys = tempToys
            end
        elseif(cmd[1]:lower() == "help") then
            self:Print("/tj --without a parameter will toggle the toy box window")
            self:Print("/tj box _name_ --will open the toybox to the toybox with the matching name")
            self:print("/tj clean --will attempt to clean up the toys in your toyboxes if you get a nil error when selecting a toybox")
        else
            self:Print("Command '" .. cmd[1] .. "' not found.")
            self:Print("/tj without a parameter will toggle the toy box window")
            self:Print("/tj box _name_ will open the toybox to the toybox with the matching name")
            self:print("/tj clean --will attempt to clean up the toys in your toyboxes if you get a nil error when selecting a toybox")
        end
    end
end

function L.ToyJunkie:TJBoxCommand(msg)
    self:Print(L.ToyJunkie.db.profile.selectedToybox)

    local found = L:GetToyBoxIdByName(msg)
    if(found ~= nil) then
        L.ToyJunkie.db.profile.selectedToybox = msg
        L.ToyboxFrame:UpdateToyboxDisplay()
        L.ToyboxFrame:UpdateToyButtons()
        if(not L.ToyboxFrame:IsShown()) then
            L.ToyboxFrame:Toggle()
        end
    else
        self:Print("No toybox found by that name.")
    end
end

function L.ToyJunkie:TOYS_UPDATED()
    if (L.AttachedFrame ~= nil and ToyBox ~= nil) then
        if (not L.AttachedFrame.isAttached) then
            L.AttachedFrame:SetFrame()
        end
    end
    L.AttachedFrame.ScrollFrame.listView:Refresh()
    if (L.ToyJunkie.db.profile.toyboxShown) then
        L.ToyboxFrame:Toggle(true, "OPEN")
    end

    if(not hearthstonesLoaded) then
        C_Timer.After(2, function()
            L.ToyboxFrame:SelectNewRandomHearthstone()
            hearthstonesLoaded = true
        end)
    end
end

function L.ToyJunkie:PLAYER_REGEN_DISABLED()
    L.isInCombat = true
    L.ToyboxFrame:Toggle(true, "CLOSE")
end

function L.ToyJunkie:PLAYER_REGEN_ENABLED()
    L.isInCombat = false
    if (L.ToyJunkie.db.profile.toyboxShown) then
        L.ToyboxFrame:Toggle(true, "OPEN")
    end
end

CollectionsJournal:HookScript("OnHide", function()
    if(L.ToyJunkie_DragBackdrop ~= nil) then
        L.ToyJunkie_DragBackdrop:Hide()
    end
end)


-- Binding settings --
BINDING_HEADER_HTOYJUNKIE = "ToyJunkie Keybindings"
_G["BINDING_NAME_CLICK ToyJunkie_ToyboxFrame_RandomHearthstoneButton:LeftButton"] = "Use Random Hearthstone"
_G["BINDING_NAME_CLICK ToyJunkie_ToyboxFrame_RandomToyButton:LeftButton"] = "Use Random Toy from current toybox"
