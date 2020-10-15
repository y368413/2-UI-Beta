ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
children of this class are expected to implement "AsynchronousUpdateByID()" which returns true if all async data was
available and set, or false if the data was not available.

children should overload UpdateByID if they contain information that must always be updated and call super.UpdateByID(self, ID)
inside.
]]

local super = Templates.Collection
Templates.AsynchronousCollection = super:new()
local this = Templates.AsynchronousCollection

function this:UpdateIncomplete()
	
	for ID, Info in pairs(self.InfoByID) do
		if(Info.AsynchronousComplete ~= true) then
			Info.AsynchronousComplete = self:UpdateByID(ID)
		end
	end
end

function this:UpdateByID(ID)
	local Info = self:GetByID(ID)
	
	if(Info.AsynchronousComplete ~= true) then
		Info.AsynchronousComplete = self:AsynchronousUpdateByID(ID)
	end
end
