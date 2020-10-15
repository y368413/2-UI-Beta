ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
The most basic frame in WoW is the one that describes all the parameters to CreateFrame:
	self.FrameType (default: "Frame")
	self.FrameName (default: nil)
	self.FrameParent (default: nil)
	self.FrameTemplate (default: nil)
	self.FrameID (default: nil)
]]

TTD2.Templates.Frame = Templates.Base:new()
local this = TTD2.Templates.Frame

function TTD2.Templates.Frame:Create()
	if(self.Frame ~= nil) then
		TTD2.Tools.Chat:Error("Trying to create existing frame.")
	end
	
	self.FrameType = self.FrameType or "Frame"
	
	self.Frame = CreateFrame(
		self.FrameType,
		self.FrameName,
		self.FrameParent,
		self.FrameTemplate,
		self.FrameID)
end
