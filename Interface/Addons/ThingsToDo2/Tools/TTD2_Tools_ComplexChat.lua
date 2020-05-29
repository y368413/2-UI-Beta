ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
provides complex chat output that combines methods of different modules.
]]

local super = Templates.Base
Tools.ComplexChat = super:new()
local this = Tools.ComplexChat

function this:CreateTimeLeftHoursStringFromTimeLeftMinutes(TimeLeftMinutes)
	return "("..string.format(BLACK_MARKET_HOT_ITEM_TIME_LEFT,string.format(SPELL_DURATION_HOURS ,TimeLeftMinutes/60.0))..")"
end

function this:GetWQTomTomLink(WQID, ReplaceName)

	local Name = ReplaceName
	if(Name == nil) then
		Name = Tools.WorldQuest:GetNameByID(WQID)
	end
	local MapID, PosX, PosY = Tools.WorldQuest:GetLocationByID(WQID)
	--print("MapID: ", MapID, " PosX: ", PosX, " PosY: ", PosY)
	
	return Tools.TomTom:CreateLink(MapID,PosX,PosY,Name)
end

function this:GetWQStatusString(WQID, ReplaceName)
	
	local Name = ReplaceName
	if((Name == nil) and (WQID ~= nil)) then
		Name = Tools.WorldQuest:GetNameByID(WQID)
	end
	
	if((WQID ~= nil) and (Tools.WorldQuest:IsActiveByID(WQID) == true)) then
		return Tools.Chat:Yellow("WQ up: ")..self:GetWQTomTomLink(WQID, Name).." "..self:CreateTimeLeftHoursStringFromTimeLeftMinutes(Tools.WorldQuest:GetTimeLeftMinutesByID(WQID))
	else
	
		--we allow the user to substitute a name for the negative output. This is useful if we check several
		--WQIDs for a single achievement and none of them are up. In that case, it is more readable to print
		--the negative Message using the achievement criteria instead of listing each individual inactive quest
		return Tools.Chat:Red("WQ not up: ")..Name
	end
end

function this:AddWQStatusLine(WQID, DependencyLine, ReplaceName)
	
	local Out = Tools.Output
	local Status = Out.Status.Done
	
	if(Tools.WorldQuest:IsActiveByID(WQID) == true) then
		Status = Out.Status.ToDo
	end
	
	Out:AddLine(Status, self:GetWQStatusString(WQID, ReplaceName), DependencyLine)
end
