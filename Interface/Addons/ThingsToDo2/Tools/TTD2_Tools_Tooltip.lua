ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
text access methods for the tooltip frame
]]

local super = Templates.Base
Tools.Tooltip = super:new()
local this = Tools.Tooltip

this.ItemNotReady	= RETRIEVING_ITEM_INFO
this.QuestNotReady	= RETRIEVING_DATA

function this:QueryItemByID(ItemID)

	--TTD2.Frames.ScanningTooltip:ClearLines()
	TTD2.Frames.ScanningTooltip:SetHyperlink("item:"..ItemID)
	
	self.QueryToken		= this.ItemNotReady
	self.TooltipReady	= false
	
	return
end

function this:QueryQuestByID(QuestID)
	
	--TTD2.Frames.ScanningTooltip:ClearLines()
	TTD2.Frames.ScanningTooltip:SetHyperlink("quest:"..QuestID)
	
	self.QueryToken   = this.QuestNotReady
	self.TooltipReady = false
	
	return
end

function this:QueryNPCByID(NPCID)

	--TTD2.Frames.ScanningTooltip:ClearLines()
	TTD2.Frames.ScanningTooltip:SetHyperlink(("unit:Creature-0-0-0-0-%d"):format(NPCID))
	
	self.QueryToken   = this.QuestNotReady --use questtoken for now
	self.TooltipReady = false
	
end

function this:IsReady()

	--[[
	a tooltip is considered ready when GetRegions() does not return nil and none of the text regions matches the queryToken
	once a tooltip reaches this point, GetRegions is no longer called on the frame and instead the content stored by this
	lib are used
	]]
	
	if(self.TooltipReady == true) then
		return true
	end
	
	if(self.QueryToken == nil) then
		--there was no search going on!
		Tools.Chat.Error("no query set for tooltip when :IsReady() was called.")
		return false
	end
	
	self.RegionText = TTD2.Frames.ScanningTooltip:GetRegionText()
	if(self.RegionText == nil) then
		return false
	end
	
	if(TTD2.Tools.Table:Contains(self.RegionText, self.QueryToken) == true) then
		return false
	end
	
	--the tooltip is complete!
	self.TooltipReady = true
	return true
end

function this:GetRegionText()
	
	if(self:IsReady() == false) then
		Tools.Chat.Error("trying to read lines from tooltip before ready.")
		return nil
	end
	
	return self.RegionText
end
