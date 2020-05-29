ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates	= TTD2.Templates

TTD2.Frames = TTD2.Frames or {}
local Frames = TTD2.Frames

local super = Templates.AddonFrame
Frames.Main = super:new()
local this = Frames.Main

--[[

]]

function this:Create()
	
	self.FrameName = "TTD2_Main"
	self.FrameTitleText = TTD2.Tools.Chat:GetColoredAddonTitle().." v"..GetAddOnMetadata("ThingsToDo2","Version")
	self.AddonFrameResetPosX	= 50
	self.AddonFrameResetPosY	= -100
	
	super.Create(self)
	
	--this Frame should close when pressing ESC
	tinsert(UISpecialFrames, self.FrameName)
	
	local Options = Templates.UIPanelButton:new()
	Options.ButtonText = "Options"
	Options.ButtonPosX = 25
	Options.ButtonPosY = -30
	Options.ButtonScriptFunction = Frames.Options.Toggle
	Options.ButtonScriptObject = Frames.Options
	Options.ButtonScriptNoDefaultParameters = true
	self:CreateChild(Options)
	
	local Refresh = Templates.UIPanelButton:new()
	Refresh.ButtonText = "Refresh Modules"
	Refresh.ButtonPosX = 25
	Refresh.ButtonPosY = -90
	Refresh.ButtonScriptFunction = self.RefreshModules
	Refresh.ButtonScriptObject = self
	Refresh.ButtonScriptFunctionRightButton = self.ResetIgnored
	Refresh.ButtonScriptObjectRightButton = self
	self:CreateChild(Refresh)
	
	self.ScrollFrame = Templates.ScrollableContentFrame:new()
	self.ScrollFrame.SpacingTop = 145
	self:CreateChild(self.ScrollFrame)
	
	return
end

function this:RefreshModules()
	self.ScrollFrame:ClearContentFrame()
	
	for _, Module in pairs(TTD2.Modules) do
		if(Module.IsUIModule == true) then
			Module:AddModuleButton(self.ScrollFrame)
		end
	end
	
	TTD2.Tools.EventDispatcher:CheckModules()
end

function this:ResetIgnored()
	for _, Module in pairs(TTD2.Modules) do
		if(Module.IsIgnored == true) then
			Module.IsIgnored = false
		end
	end
	
	self:RefreshModules()
end
