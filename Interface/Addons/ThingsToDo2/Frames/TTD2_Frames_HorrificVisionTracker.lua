ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates	= TTD2.Templates

TTD2.Frames = TTD2.Frames or {}
local Frames = TTD2.Frames

local super = Templates.AddonFrame
Frames.HorrificVisionTracker = super:new()
local this = Frames.HorrificVisionTracker

--[[
this frame displays a small table of chests+crystals per zone in horrific visions; since there are 5 zones, this equals 5x2.
there should also be a field to show if the final crystal-chest was collected or not.
]]

local CD = nil
local SD = nil
local TalentMissingText = ERR_QUEST_FAILED_SPELL

function this:Create()
	
	self.FrameName = "TTD2_HorrificVisionTracker"
	self.FrameTitleText = TTD2.Tools.Chat:GetColoredAddonTitle().." HVT"

	self.AddonFrameSizeX		= 160
	self.AddonFrameSizeY		= 40
	
	self.FrameTooltipText = "Loading..."
	
	super.Create(self)
	
	return
end

function this:Toggle(ShowFrame)

	--the position of this frame should ALWAYS be reset to default when it is toggled on
	self.Frame:ClearAllPoints()
	self.Frame:SetPoint("CENTER", 0, 0)
	return super.Toggle(self, ShowFrame)
end

function this:SetConstantData(CDTable)

	CD = CDTable
	return
end

function this:SetSessionData(SDTable)

	SD = SDTable
	return
end

function this:UpdateTooltip()

	local Chat = TTD2.Tools.Chat

	if(CD == nil or SD == nil) then
		Chat:Error("trying to update HVT tooltip but necessary source tables are not set.")
		return
	end
	
	if(SD.LearnedClearSightRank == 0) then
		self.FrameTooltipText = TalentMissingText
		return
	end
	
	local Text = ""
	
	--1: loop over areas and tell how many out of how many chests and crystals we have
	for AreaIndex, AreaData in ipairs(CD.MapData.Areas) do
		Text = Text..AreaData.Name.."\n"
		if(SD.LearnedClearSightRank < AreaData.ClearSightRank) then
			Text = Text..Chat:White(TalentMissingText).."\n\n"
		else
			Text = Text..Chat:White("Chests: ")
			local CollectedChests = 0
			for ChestIndex, ChestData in ipairs(CD.MapData.Chests) do
				if(ChestData.Area == AreaIndex and SD.Chests[ChestIndex] == true) then
					CollectedChests = CollectedChests + 1
				end
			end
			
			local CollectedChestsText = CollectedChests.." / "..AreaData.NumChests
			if(CollectedChests < AreaData.NumChests) then
				Text = Text..Chat:Red(CollectedChestsText)
			else
				Text = Text..Chat:Green(CollectedChestsText)
			end
			Text = Text.."\n"..Chat:White("Crystals: ")
			local CollectedCrystals = 0
			for CrystalIndex, CrystalData in ipairs(CD.MapData.Crystals) do
				if(CrystalData.Area == AreaIndex and SD.Crystals[CrystalIndex] == true) then
					CollectedCrystals = CollectedCrystals + 1
				end
			end
			
			local CollectedCrystalsText = CollectedCrystals.." / 2"
			if(CollectedCrystals < 2) then
				Text = Text..Chat:Red(CollectedCrystalsText)
			else
				Text = Text..Chat:Green(CollectedCrystalsText)
			end
			Text = Text.."\n\n"
		end
	end
	
	--2: check crystalchest
	Text = Text.."CrystalChest: "
	if(SD.IsCrystalChestCollected == true) then
		Text = Text..Chat:Green("collected")
	else
		Text = Text..Chat:Red("not collected")
	end	
	
	self.FrameTooltipText = Text
	
	return
end
