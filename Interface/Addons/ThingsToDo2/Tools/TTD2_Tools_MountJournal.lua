ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
interface to the mount-journal API
]]

local super = Templates.Collection
Tools.MountJournal = super:new()
local this = Tools.MountJournal

function this:UpdateByID(ID)

	local Mount = self:GetByID(ID)
	
	local MountInfo = { C_MountJournal.GetMountInfoByID(ID) }
	Mount.Name			= MountInfo[1]
	Mount.Faction		= MountInfo[9]
	Mount.IsCollected	= MountInfo[11]
end
