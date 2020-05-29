ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[

]]

local super = Templates.Frame
Templates.InsecureActionButton = super:new()
local this = Templates.InsecureActionButton

function this:Create()

	self.FrameType		= self.FrameType or "Button"
	self.FrameTemplate	= self.FrameTemplate or "InsecureActionButtonTemplate, UIPanelButtonTemplate"

	super.Create(self)
	
	self.ButtonAnchor	= self.ButtonAnchor or "TOPLEFT"
	self.ButtonPosX		= self.ButtonPosX or 0
	self.ButtonPosY		= self.ButtonPosY or 0
	self.ButtonSizeX	= self.ButtonSizeX or 250
	self.ButtonSizeY	= self.ButtonSizeY or 50
	
	self.Frame:SetSize(self.ButtonSizeX, self.ButtonSizeY)
	self:UpdateButtonPosition()
end

function this:UpdateButtonPosition()
	self.Frame:ClearAllPoints()
	self.Frame:SetPoint(self.ButtonAnchor, self.ButtonPosX, self.ButtonPosY)
end

function this:UpdateButtonParent()
	self.Frame:SetParent(self.FrameParent)
	self:UpdateButtonPosition()
end

function this:UpdateButtonText()
	self.Frame:SetText(self.ButtonText)
end
