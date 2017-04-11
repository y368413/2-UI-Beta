-- Author: Ketho (EU-Boulderfist)
-- License: Public Domain
--if IsAddOnLoaded("Blizzard_CUFProfiles") then
local RaidFadeMoreDB

local defaults = {
	minAlpha = .5,
	maxAlpha = 1,
	minBgAlpha = .6,
	maxBgAlpha = 1,
}

local group = {
	part = true, -- party, only check char 1 to 4
	raid = true,
}

local function CreateSlider(parent, point, relativeTo, relativePoint, x, y, label, option)
	-- slider
	local s = CreateFrame("Slider", nil, _G[parent], "CompactUnitFrameProfilesSliderTemplate")
	s:SetPoint(point, relativeTo, relativePoint, x, y)
	s.label:SetText(label)
	s.minLabel:SetText(0); s.maxLabel:SetText(1)
	s:SetValueStep(5); s:SetMinMaxValues(0, 100)
	s:SetObeyStepOnDrag(true)
	s:SetValue(RaidFadeMoreDB[option]*100)
	
	s:SetScript("OnValueChanged", function(self, value)
		local v = value/100
		RaidFadeMoreDB[option] = v
		s.curLabel:SetText(v)
	end)
	
	-- fontstring
	s.curLabel = s:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
	s.curLabel:SetPoint("TOP", s, "BOTTOM")
	s.curLabel:SetText(RaidFadeMoreDB[option])
	
	return s
end

local f = CreateFrame("Frame")

function f:OnEvent(event)
	
	if not ShiGuangDB.RaidFadeMore then
		ShiGuangDB.RaidFadeMore = CopyTable(defaults)
	end
	RaidFadeMoreDB = ShiGuangDB.RaidFadeMore
	
	local parent = "CompactUnitFrameProfilesProfileSelectorButton"
	local slider = CreateSlider(parent, "TOPLEFT", parent, "BOTTOMLEFT", 45, -15, "|cff71D5FF"..CHANGE_OPACITY.."|r", "minAlpha")
	local sliderBg = CreateSlider(parent, "TOPLEFT", slider, "BOTTOMLEFT", 0, -40, "|cff71D5FF"..BACKGROUND..CHANGE_OPACITY.."|r", "minBgAlpha")
	
	local header = CreateFrame("Frame", nil, _G[parent]):CreateFontString()
	header:SetPoint("TOPLEFT", parent, "TOPRIGHT", 45, 0)
	header:SetFontObject("GameFontNormal")
	header:SetText(NAME)
	
	-- FrameXML\CompactUnitFrame.lua
	hooksecurefunc("CompactUnitFrame_UpdateInRange", function(frame)
		if not group[strsub(frame.displayedUnit, 1, 4)] then return end -- ignore player, nameplates
		local inRange, checkedRange = UnitInRange(frame.displayedUnit)
		
		if checkedRange and not inRange then
			frame:SetAlpha(RaidFadeMoreDB.minAlpha)
			frame.background:SetAlpha(RaidFadeMoreDB.minBgAlpha)
		else
			frame:SetAlpha(RaidFadeMoreDB.maxAlpha)
			frame.background:SetAlpha(RaidFadeMoreDB.maxBgAlpha)
		end
	end)
	
	self:UnregisterEvent(event)
end

f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", f.OnEvent)
--end