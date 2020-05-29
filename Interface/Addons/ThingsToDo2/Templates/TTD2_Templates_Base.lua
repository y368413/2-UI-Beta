ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
all the base does is provide the new constructor.
]]

Templates.Base = {}
local this = Templates.Base

function this:new(o)
	o = o or {}
	o.this = o
	setmetatable(o, self)
	self.__index = self
	return o
end
