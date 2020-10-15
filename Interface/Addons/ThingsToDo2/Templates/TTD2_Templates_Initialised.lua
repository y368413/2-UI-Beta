ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
Initialised adds a short way of calling an initialiser one-time. Just add a :Initialise() method to your
class and add self:Init() or self:Init() in all other methods that require the initialisation to
be completed.

Important: Initialise() should always call super.Initialise(self) to make sure all base classes are
initialised as well.
]]

local super = TTD2.Templates.Base
TTD2.Templates.Initialised = super:new()
local this = TTD2.Templates.Initialised

function this:Init()
	if(self.Initialised == nil) then
		self:Initialise()
		self.Initialised = true
	end
end
