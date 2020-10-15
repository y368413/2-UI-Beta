ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Frames = TTD2.Frames or {}
local Frames = TTD2.Frames

--[[
specialisation of the generic template.
]]

local super = Templates.MinimapButton
Frames.MinimapButton = super:new()
local this = Frames.MinimapButton

function this:GetButtonAngle()
	return TTD2.Tools.SavedData:GetCharacterValue("MinimapPosition")
end

function this:SetButtonAngle(ButtonAngle)
	TTD2.Tools.SavedData:GetCharacterValue("MinimapPosition", ButtonAngle)
end

function this:Create()

	self.FrameName = "TTD2_MinimapButton"
	self.FrameTooltipText = TTD2.Tools.Chat:GetColoredAddonTitle()
	self.ButtonScriptFunction = Frames.Main.Toggle
	self.ButtonScriptObject = Frames.Main
	self.ButtonScriptNoDefaultParameters = true --disable the default parameters because Toggle() has its own default parameter
	
	super.Create(self)
end

function this:Update()
	if(TTD2.Tools.SavedData:GetCharacterSetting("HideMinimapButton") == true) then
		if(self.Frame ~= nil and self.Frame:IsVisible()) then
			self.Frame:Hide()
		end
	else
		if(self.Frame == nil) then
			self:Create()
		end
		
		if(self.Frame:IsVisible() == false) then
			self.Frame:Show()
		end
	end
end
