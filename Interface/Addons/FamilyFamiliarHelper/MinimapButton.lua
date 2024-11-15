local _,ffh = ...

FamilyFamiliarHelperMinimapButtonMixin = {}

function FamilyFamiliarHelperMinimapButtonMixin:Setup()
    self:Update()
    self:RegisterForDrag("LeftButton")
    self:SetFrameLevel(Minimap:GetFrameLevel()+2)
    if ffh.settings.ShowMinimapButton then
        self:Show()
    end
end

function FamilyFamiliarHelperMinimapButtonMixin:Update()
    local angle = ffh.settings.MinimapPosition or 116
    self:SetPoint("CENTER",Minimap,"CENTER",(105*cos(angle)),(105*sin(angle)))
end

function FamilyFamiliarHelperMinimapButtonMixin:OnEnter()
    local tooltip = FamilyFamiliarHelperTooltip
    tooltip:SetOwner(self,"ANCHOR_LEFT")
    tooltip:AddLine("\124cffffffffFamiliar Familiar Helper")
    tooltip:AddLine("Version "..C_AddOns.GetAddOnMetadata("FamilyFamiliarHelper","Version"))
    tooltip:Show()
end

function FamilyFamiliarHelperMinimapButtonMixin:OnLeave()
    FamilyFamiliarHelperTooltip:Hide()
end

function FamilyFamiliarHelperMinimapButtonMixin:OnMouseDown()
    self.Icon:SetPoint("CENTER",-1,-2)
    self.Icon:SetVertexColor(0.65,0.65,0.65)
end

function FamilyFamiliarHelperMinimapButtonMixin:OnMouseUp()
    self.Icon:SetPoint("CENTER")
    self.Icon:SetVertexColor(1,1,1)
end

function FamilyFamiliarHelperMinimapButtonMixin:OnClick()
    ffh.frame:Toggle()
end

function FamilyFamiliarHelperMinimapButtonMixin:OnDragStart()
    self:SetScript("OnUpdate",self.OnDragUpdate)
end

function FamilyFamiliarHelperMinimapButtonMixin:OnDragStop()
    self:OnMouseUp()
    self:SetScript("OnUpdate",nil)
end

function FamilyFamiliarHelperMinimapButtonMixin:OnDragUpdate()
	local x,y = GetCursorPosition()
	local scale = Minimap:GetEffectiveScale()
    local minX,minY = Minimap:GetCenter()
    ffh.settings.MinimapPosition = math.deg(math.atan2(y/scale-minY,x/scale-minX))
    self:Update()
end
