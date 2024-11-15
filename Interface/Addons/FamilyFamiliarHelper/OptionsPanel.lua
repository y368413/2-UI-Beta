local _,ffh = ...

FamilyFamiliarHelperCheckButtonMixin = {}

function FamilyFamiliarHelperCheckButtonMixin:OnLoad()
    if self.label then
        self.Text:SetText(self.label)
        self:SetHitRectInsets(0,-4-(self.Text:GetStringWidth()),0,0)
    end
end

function FamilyFamiliarHelperCheckButtonMixin:OnEnter()
    self.Text:SetTextColor(1,1,1)
end

function FamilyFamiliarHelperCheckButtonMixin:OnLeave()
    self.Text:SetTextColor(1,0.82,0)
end

function FamilyFamiliarHelperCheckButtonMixin:OnClick()
    ffh.settings[self.var] = self:GetChecked()
    self:GetParent():Update()
    if self.var=="AutoShow" then
        if ffh.settings.AutoShow then
            ffh.frame:RegisterEvent("PLAYER_TARGET_CHANGED")
        else
            ffh.frame:UnregisterEvent("PLAYER_TARGET_CHANGED")
        end
    elseif self.var=="ShowMinimapButton" then
        FamilyFamiliarHelperMinimapButton:SetShown(ffh.settings[self.var])
    end
end

FamilyFamiliarHelperOptionsMixin = {}

function FamilyFamiliarHelperOptionsMixin:OnLoad()
    if select(4,GetBuildInfo())>=100000 then
        local category = Settings.RegisterCanvasLayoutCategory(self, "Family Familiar Helper")
        Settings.RegisterAddOnCategory(category)
    else
        self.name = "Family Familiar Helper"
        self.refresh = self.Update
        InterfaceOptions_AddCategory(self)
    end
end

function FamilyFamiliarHelperOptionsMixin:Update()
    for _,var in ipairs({"NoEscape","NoMove","AutoShow","JustOnce","NoAchievementTooltip","ShowMinimapButton"}) do
        self[var]:SetChecked(ffh.settings[var] and true or false)
    end
    if ffh.settings.AutoShow then
        self.JustOnce:Enable()
        self.JustOnce.Text:SetTextColor(1,0.82,0)
    else
        self.JustOnce:Disable()
        self.JustOnce.Text:SetTextColor(0.5,0.5,0.5)
    end
end