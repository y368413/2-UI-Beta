ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
adds 2 flags used by the event-dispatcher
]]

local super = Templates.Initialised
Templates.EventModule = super:new()
local this = Templates.EventModule

this.IsEventModule = true
this.IsRegistered = false
