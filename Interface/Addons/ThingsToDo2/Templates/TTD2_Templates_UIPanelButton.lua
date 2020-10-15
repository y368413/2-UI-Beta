ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
minor extension of ButtonFrame;adds the possibility to have distinct LeftButton and RightButton click handlers
the default click behaviour is redirected to LeftButton only!
]]

local super = Templates.ButtonFrame
Templates.UIPanelButton = super:new()
local this = Templates.UIPanelButton

function this:Create()

	self.FrameTemplate = self.FrameTemplate or "UIPanelButtonTemplate"

	super.Create(self)
	
	self.ButtonText		= self.ButtonText or "UIPanelButton"
	
	self.Frame:SetText(self.ButtonText)
	
	self.Frame:RegisterForClicks("LeftButtonUp", "RightButtonUp")
	
	self.ButtonScriptFunctionLeftButton = self.ButtonScriptFunction
	self.ButtonScriptObjectLeftButton = self.ButtonScriptObject
end

function this:OnButtonClick(Frame, Button, Down)
	self:TryToCall(
		self["ButtonScriptFunction"..Button],
		self["ButtonScriptObject"..Button],
		Frame,
		Button,
		Down)
end

function this:UpdateButtonText()

	self.Frame:SetText(self.ButtonText)
end
