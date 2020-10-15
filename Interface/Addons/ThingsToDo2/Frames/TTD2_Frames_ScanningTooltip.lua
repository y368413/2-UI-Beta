ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates	= TTD2.Templates

TTD2.Frames = TTD2.Frames or {}
local Frames = TTD2.Frames

--[[
the scanningTooltip frame used to get information about items and quests not otherwise
available from the API.

Update:
Found out that calling ClearLines() > SetHyperlink() does NOT properly cause the client to ask the server
for data. It does display cached data, but does NOT query the server.
To make sure the tooltip will query the server, you have to call SetOwner() > SetHyperlink(). ClearLines() is
not necessary as SetOwner() will clear the tooltip.
Also, it seems as if Frame:IsShwon() can be used to test if the tooltip is ready.
]]

local super = Templates.Frame
Frames.ScanningTooltip = super:new()
local this = Frames.ScanningTooltip

function this:Create()

	self.FrameType = "GameTooltip"
	self.FrameName = "TTD2_ScanningTooltip"
	self.FrameTemplate = "GameTooltipTemplate"
	
	super.Create(self)
	
	--self.Frame:SetOwner(WorldFrame, "ANCHOR_NONE")
	
	return
end

--[[
function this:ClearLines()
	if(self.Frame == nil) then
		self:Create()
	end
	
	self.Frame:ClearLines()
	return
end
]]

function this:SetHyperlink(Text)
	if(self.Frame == nil) then
		self:Create()
	end
	
	self.Frame:SetOwner(WorldFrame, "ANCHOR_NONE")
	self.Frame:SetHyperlink(Text)
	return
end

function this:GetRegionText()
	if(self.Frame == nil) then
		self:Create()
	end
	
	if(self.Frame:IsShown() ~= true) then
		return nil
	end
	
	--print("S1")
	
	local Regions = { self.Frame:GetRegions() }
	if((Regions == nil) or (Regions[1] == nil) or (TTD2.Tools.Table:GetNumEntries(Regions) == 0)) then --tooltips with zero lines are considered incomplete
		return nil
	end
	
	--print("S2")
	
	local RegionText = {}
	
	for _, Region in ipairs(Regions) do
		if(Region ~= nil and Region:GetObjectType() == "FontString") then
			local Text = Region:GetText()
			--print(Text)
			if(Text ~= nil) then
				TTD2.Tools.Table:Append(RegionText, Text)
			end
		end
	end
	
	if(TTD2.Tools.Table:GetNumEntries(RegionText) == 0) then --zero lines is still considered incomplete
		return nil
	end
	
	--print("S3")
	
	return RegionText
end
