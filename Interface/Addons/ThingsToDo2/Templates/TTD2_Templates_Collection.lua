ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
this template descries the behaviour of simple "collection" classes that are based on 3 methods:
- AddByID()
- UpdateByID()
- GetByID()

only UpdateByID is always specific
]]

local super = Templates.Base
Templates.Collection = super:new()
local this = Templates.Collection

function this:ConstructLink(LinkType, ID, Name)

	if(Name == nil) then
		Name = LinkType..":"..ID
	end
	
	--TODO: currently level 110 is hardcoded, may be a problem later
	local LinkParts = {}
	LinkParts[1] = "\124cFFFFFF00\124H"
	LinkParts[2] = ":110\124h["
	LinkParts[3] = "]\124h\124r"
	
	return (LinkParts[1]..LinkType..":"..ID..LinkParts[2]..Name..LinkParts[3])
end

function this:AddByID(ID)

	self.InfoByID = self.InfoByID or {}
	
	--adding an ID multiple times must be allowed since different modules might do it
	self.InfoByID[ID] = self.InfoByID[ID] or {}
end

function this:GetByID(ID)
	
	if(self.InfoByID[ID] == nil) then
		TTD2.Tools.Chat:Error("trying to access CollectionID before adding it: "..ID)
	end
	
	return self.InfoByID[ID]
end
