local addonName, L = ...



--The cursor can't be changed while over WorldFrame, so this frame acts as a backdrop beneath the UI
--so the cursor can remain an ITEM_CURSOR while dragging. (it also serves to capture clicks to drop
--the stuff off the cursor.)

--Remove comment next line for DEBUGGING
--L.ToyJunkie.DragBackdrop = CreateFrame("Button", "ToyJunkie_DragBackdrop", UIParent, "BackdropTemplate")

--Add comment next line for DEBUGGING
L.ToyJunkie.DragBackdrop = CreateFrame("Button", "ToyJunkie_DragBackdrop", UIParent)
L.ToyJunkie.DragBackdrop:SetFrameStrata("LOW")
L.ToyJunkie.DragBackdrop:SetFrameLevel(0)
L.ToyJunkie.DragBackdrop:SetAllPoints()


--Debug DragBackdrop
--[[
L.ToyJunkie.DragBackdrop:SetBackdrop({

    bgFile = "Interface/Buttons/WHITE8X8",
    edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
    edgeSize = 16,
    insets = { left = 3.2, right = 3.2, top = 3.2, bottom = 3.2 }
})
]]


L.ToyJunkie.DragBackdrop:Hide()
L.ToyJunkie.DragBackdrop:SetScript("OnShow", function(self)
    if(ToyBox:IsVisible()) then
        L.AttachedFrame.ScrollFrame.listView:RegisterEvent("GLOBAL_MOUSE_UP")
    else
        L.ToyJunkie.DragBackdrop:Hide()
    end
end)
L.ToyJunkie.DragBackdrop:SetScript("OnHide", function(self)
    L.AttachedFrame.ScrollFrame.listView:UnregisterEvent("GLOBAL_MOUSE_UP")
end)

L.ToyJunkie.DragHeader = CreateFrame("Frame", "ToyJunkie_DragHeaderFrame", L.ToyJunkie.DragBackdrop, "BackdropTemplate")
L.ToyJunkie.DragHeader:SetPoint("CENTER")
L.ToyJunkie.DragHeader:SetFrameStrata("TOOLTIP")
L.ToyJunkie.DragHeader:SetBackdrop(BACKDROP_TOAST_12_12)
L.ToyJunkie.DragHeader:SetSize(150,30)

L.ToyJunkie.DragHeader.Text = L.ToyJunkie.DragHeader:CreateFontString(nil, "OVERLAY", "GameFontWhite")
L.ToyJunkie.DragHeader.Text:SetText("")
L.ToyJunkie.DragHeader.Text:SetPoint("LEFT", 35, 0)
L.ToyJunkie.DragHeader.Text:SetPoint("RIGHT", -10, 0)
L.ToyJunkie.DragHeader.Text:SetJustifyH("LEFT")
L.ToyJunkie.DragHeader.Text:SetWordWrap(false)

L.ToyJunkie.DragHeader.Icon = L.ToyJunkie.DragHeader:CreateTexture(nil, "ARTWORK")
L.ToyJunkie.DragHeader.Icon:SetTexture(454046)
L.ToyJunkie.DragHeader.Icon:SetSize(18,18)
L.ToyJunkie.DragHeader.Icon:SetPoint("LEFT", 10, 0)

L.ToyJunkie.DragHeader:SetScript("OnUpdate", function(self, elapsed)
    if(self:IsShown()) then
        local x,y = GetCursorPosition()
        local scale = UIParent:GetEffectiveScale()
        self:ClearAllPoints()
        self:SetPoint("TOPLEFT", UIParent, "BOTTOMLEFT", x/scale, y/scale)
    end
end)

L.ToyJunkie.DragHeader:Hide()

L.ToyJunkie.DropLineFrame = CreateFrame("Frame", "ToyJunkie_DropFrame", UIParent)
L.ToyJunkie.DropLineFrame:SetFrameStrata("DIALOG")
L.ToyJunkie.DropLineFrame:SetHeight(1)
L.ToyJunkie.DropLineFrame:SetPoint("TOPLEFT", 10, -10)
L.ToyJunkie.DropLineFrame.texture = L.ToyJunkie.DropLineFrame:CreateTexture()
L.ToyJunkie.DropLineFrame.texture:SetTexture(130871)
L.ToyJunkie.DropLineFrame.texture:SetAllPoints()
L.ToyJunkie.DropLineFrame.texture:SetVertexColor(255, 215, 0, .65)
L.ToyJunkie.DropLineFrame:Hide()

function L.ToyJunkie.DropLineFrame:Display(element)
    self:ClearAllPoints()
    local _, y = GetCursorPosition()
    local scale = element:GetEffectiveScale()
    local _, cy = element:GetCenter()

    if(y / scale > cy) then
        self:SetPoint("TOPLEFT", element, 20, 1)
    else
        self:SetPoint("BOTTOMLEFT", element, 20, 0)
    end
    self:SetWidth(element:GetWidth() - 40)
    self:Show()
end
