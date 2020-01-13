local Addon = LibStub("AceAddon-3.0"):GetAddon("Inventorian")
local Update = Addon.Item.prototype.Update

Addon.Item.prototype.IsUpgrade = function(self)
    return IsContainerItemAnUpgrade(self:GetBag(), self:GetID())
end

Addon.Item.prototype.UpdateUpgradeIcon = function(self)
    local context = self;
    local isUpgrade = self:IsUpgrade()
    if isUpgrade == nil then
        C_Timer.After(0.5, function ()
            Addon.Item.prototype.UpdateUpgradeIcon(context)
        end)
    else
        self.UpgradeIcon:SetShown(isUpgrade)
    end
end

-- Override the current Update function to call UpdateUpgradeIcon
Addon.Item.prototype.Update = function(self, ...)
    Update(self, ...)
    self:UpdateUpgradeIcon()
end
