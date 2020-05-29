ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
adds all functionality missing from ButtonFrame to make a MinimapButton
]]

local super = Templates.ButtonFrame
Templates.MinimapButton = super:new()
local this = Templates.MinimapButton

function this:OnFrameDragStart()
	Templates.ExtendedFrame.OnFrameDragStart(self)
	self.Frame:SetScript("OnUpdate", function()
		self:UpdateMinimapButtonPosition()
		end)
	return
end

function this:OnFrameDragStop()
	Templates.ExtendedFrame.OnFrameDragStop(self)
	self.Frame:SetScript("OnUpdate", nil)
	self:UpdateMinimapButtonPosition()
end

function this:GetButtonAngle()
	return self.ButtonAngle
end

function this:SetButtonAngle(ButtonAngle)
	self.ButtonAngle = ButtonAngle
end

function this:Create()

	self.FrameParent		= Minimap
	self.IsFrameDragable	= true
	self.ButtonSizeX		= 33
	self.ButtonSizeY		= 33
	self:CalculateButtonPosFromAngle()
	
	super.Create(self)
	
	self.Frame:SetFrameStrata("MEDIUM")
	
	local Artwork = self.Frame:CreateTexture(nil, "ARTWORK")
	Artwork:SetSize(21,21)
	Artwork:SetPoint("TOPLEFT", 7, -6)
	Artwork:SetTexture("Interface\\AddOns\\ThingsToDo2\\ThingsToDo2.tga")
	
	local Overlay = self.Frame:CreateTexture(nil, "OVERLAY")
	Overlay:SetSize(56,56)
	Overlay:SetPoint("TOPLEFT")
	Overlay:SetTexture("Interface\\Minimap\\MiniMap-TrackingBorder")
	
	self.Frame:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
end

function this:CalculateAngleFromCursorPos()
	--calculates the angle between the cursor and the center of the minimap
	local CursorX, CursorY = GetCursorPosition()
	local MinX, MinY = Minimap:GetLeft(), Minimap:GetBottom()
	CursorX = MinX - CursorX / Minimap:GetEffectiveScale() + 70
	CursorY = CursorY / Minimap:GetEffectiveScale() - MinY - 70
	self:SetButtonAngle(math.deg(math.atan2(CursorY, CursorX)))
end

function this:CalculateButtonPosFromAngle()
	self.ButtonPosX = 52 - (80 * cos(self:GetButtonAngle()))
	self.ButtonPosY = (80 * sin(self:GetButtonAngle())) - 52
end

function this:UpdateMinimapButtonPosition()
	self:CalculateAngleFromCursorPos()
	self:CalculateButtonPosFromAngle()
	self:UpdateButtonPosition()
end
