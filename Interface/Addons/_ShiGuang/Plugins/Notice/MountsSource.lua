--## Version: 1.0 ## Author: HopeAsd(“∂ Ò Ú@∞£µ¬»¯¿≠-CN)
local bootFrame = CreateFrame("frame")
bootFrame.mounts = {}
bootFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
bootFrame.bootFlag = false

function bootFrame:isCollected(spell)
    local index = self.mounts[spell].index
    local isCollected = select(11, C_MountJournal.GetMountInfoByID(index))
    return isCollected
end

function bootFrame:GetOrCreateMountTable(spell)
    if not self.mounts[spell] then
        local index = C_MountJournal.GetMountFromSpell(spell)
        if index then
            local _, mSpell, _, _, _, sourceType =
                C_MountJournal.GetMountInfoByID(index)
            if spell == mSpell then
                local _, _, source = C_MountJournal.GetMountInfoExtraByID(index)
                self.mounts[spell] = {source = source, index = index}
            end
            return self.mounts[spell]
        end
        return nil
    end
    return self.mounts[spell]
end

function addLine(self, source, isCollectedText, type, noadd)
    for i = 1, self:NumLines() do
        local line = _G[self:GetName() .. "TextLeft" .. i]
        if not line then break end
        local text = line:GetText()
        if text and text == type then return end
    end
    if not noadd then self:AddLine(" ") end
    self:AddDoubleLine(type,isCollectedText)
    self:AddLine(source, 1, 1, 1)
    self:Show()
end

function bootFrame:boot()
    if not self.bootFlag then
        local boot = self
        hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...)
            local id = select(10, UnitAura(...))
            if not id then return end
            local tab = boot:GetOrCreateMountTable(id)
            if not tab then return end
            addLine(self, tab.source,
                    boot:isCollected(id) and COLLECTED or NOT_COLLECTED, SOURCE)
            self:Show()
        end)
        self.bootFlag = true
    end
end

bootFrame:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        self:boot()
        self:UnregisterEvent("PLAYER_ENTERING_WORLD")
    end
end)
