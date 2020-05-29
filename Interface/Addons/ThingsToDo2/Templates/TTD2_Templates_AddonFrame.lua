ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
adds common elements of Main+Options frame:
- sets template BasicFrameTemplate
- makes dragable
- sets title to
	self.FrameTitleText
- redirects close button to toggle method
]]

local super = Templates.ExtendedFrame
Templates.AddonFrame = super:new()
local this = Templates.AddonFrame

function this:Create()

	self.IsFrameDragable = true
	self.FrameParent = self.FrameParent or UIParent
	self.FrameTemplate = "BasicFrameTemplate"
	super.Create(self)
	
	self.Frame:SetSize(300, 600)
	
	if(self.FrameTitleText ~= nil) then
		self.Frame.TitleText:SetText(self.FrameTitleText)
	end
	
	--redirect close-button
	self.Frame.CloseButton:SetScript("OnClick", function()
		self:Toggle()
	end)
	
	self.AddonFrameResetAnchor	= self.AddonFrameResetAnchor or "TOPLEFT"
	self.AddonFrameResetPosX	= self.AddonFrameResetPosX or 0
	self.AddonFrameResetPosY	= self.AddonFrameResetPosY or 0
	
	self:ResetPosition()
end

function this:ResetPosition()
	self:Toggle(true) --make frame visible
	self.Frame:ClearAllPoints()
	self.Frame:SetPoint(self.AddonFrameResetAnchor, self.AddonFrameResetPosX, self.AddonFrameResetPosY)
end
