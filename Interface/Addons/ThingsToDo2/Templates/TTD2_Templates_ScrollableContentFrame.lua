ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
This template combines the wow "MinimalScrollFrameTemplate" with a content frame and
implements some methods to easily clear/resize/add to the content frame.

it is somewhat debateable wheter the scrollframe or the contentframe should "be" objects of this class.
I will go with the scrollframe and offer methods to access the content frame.
]]

local super = Templates.Frame
Templates.ScrollableContentFrame = super:new()
local this = Templates.ScrollableContentFrame

function this:Create()
	
	self.FrameType = self.FrameType or "ScrollFrame"
	self.FrameTemplate = self.FrameTemplate or "MinimalScrollFrameTemplate"
	
	super.Create(self)
	
	self.ButtonSpacing = self.ButtonSpacing or 5
	self.ButtonDefaultHeight = self.ButtonDefaultHeight or 50
	
	self.SpacingLeft = self.SpacingLeft or 10
	self.SpacingRight = self.SpacingRight or 10
	self.SpacingTop = self.SpacingTop or 10
	self.SpacingBottom = self.SpacingBottom or 10
	
	self.Frame:SetPoint("TOPLEFT", self.FrameParent, "TOPLEFT", self.SpacingLeft, -self.SpacingTop)
	self.Frame:SetPoint("BOTTOMRIGHT", self.FrameParent, "BOTTOMRIGHT", -(self.SpacingRight+25), self.SpacingBottom)
	
	self.ContentFrame = CreateFrame("Frame", nil, self.Frame)
	self.ButtonObjects = {}
	self:ClearContentFrame()
	
	self.Frame:SetScrollChild(self.ContentFrame)
	
end

function this:ClearContentFrame()
	for ButtonObject, _ in pairs(self.ButtonObjects) do
		ButtonObject.Frame:Hide()
	end
	TTD2.Tools.Table:Clear(self.ButtonObjects)
	
	self.ContentHeight = 0
	self.ContentFrame:SetSize(self.Frame:GetWidth(),self.ContentHeight)
end

function this:AddButtonToContentFrame(ButtonObject)
	self.ContentHeight = self.ContentHeight + self.ButtonSpacing
	
	local ObjectHeight = self.ButtonDefaultHeight
	if(ButtonObject ~= nil) then
		ButtonObject.ButtonPosY = -self.ContentHeight
		if(ButtonObject.ButtonSizeY ~= nil) then
			ObjectHeight = ButtonObject.ButtonSizeY
		end
	end
			
	self.ContentHeight = self.ContentHeight + ObjectHeight
	self.ContentFrame:SetSize(self.Frame:GetWidth(),self.ContentHeight + self.ButtonSpacing)

	if(ButtonObject ~= nil) then
		if(ButtonObject.Frame == nil) then
			ButtonObject.FrameParent = self.ContentFrame
			ButtonObject:Create()
		else
			ButtonObject.FrameParent = self.ContentFrame
			ButtonObject:UpdateButtonParent()
			ButtonObject:Toggle(true)
		end
		self.ButtonObjects[ButtonObject] = true
	end
end

function this:GetNumButtons()
	return TTD2.Tools.Table:GetNumEntries(self.ButtonObjects)
end
