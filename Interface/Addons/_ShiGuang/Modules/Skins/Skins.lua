local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Skins")

function module:OnLogin()
	local cr, cg, cb = 0, 0, 0
	if MaoRUISettingDB["Skins"]["ClassLine"] then cr, cg, cb = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b end

	-- TOPLEFT
	local Tinfobar = CreateFrame("Frame", nil, UIParent)
	Tinfobar:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 0, -3)
	M.CreateGF(Tinfobar, 600, 15, "Horizontal", 0, 0, 0, .5, 0)
	local Tinfobar1 = CreateFrame("Frame", nil, Tinfobar)
	Tinfobar1:SetPoint("BOTTOM", Tinfobar, "TOP")
	M.CreateGF(Tinfobar1, 600, 1, "Horizontal", cr, cg, cb, .7, 0)
	local Tinfobar2 = CreateFrame("Frame", nil, Tinfobar)
	Tinfobar2:SetPoint("TOP", Tinfobar, "BOTTOM")
	M.CreateGF(Tinfobar2, 600, 1, "Horizontal", cr, cg, cb, .7, 0)
	-- BOTTOMLEFT
	local Linfobar = CreateFrame("Frame", nil, UIParent)
	Linfobar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 0, 3)
	M.CreateGF(Linfobar, 450, 18, "Horizontal", 0, 0, 0, .6, 0)
	local Linfobar1 = CreateFrame("Frame", nil, Linfobar)
	Linfobar1:SetPoint("BOTTOM", Linfobar, "TOP")
	M.CreateGF(Linfobar1, 450, 1, "Horizontal", cr, cg, cb, 0.6, 0)
	local Linfobar2 = CreateFrame("Frame", nil, Linfobar)
	Linfobar2:SetPoint("TOP", Linfobar, "BOTTOM")
	M.CreateGF(Linfobar2, 450, 1, "Horizontal", cr, cg, cb, .6, 0)
	-- BOTTOMRIGHT
	local Rinfobar = CreateFrame("Frame", nil, UIParent)
	Rinfobar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 3)
	M.CreateGF(Rinfobar, 450, 18, "Horizontal", 0, 0, 0, 0, .6)
	local Rinfobar1 = CreateFrame("Frame", nil, Rinfobar)
	Rinfobar1:SetPoint("BOTTOM", Rinfobar, "TOP")
	M.CreateGF(Rinfobar1, 450, 1, "Horizontal", cr, cg, cb, 0, .6)
	local Rinfobar2 = CreateFrame("Frame", nil, Rinfobar)
	Rinfobar2:SetPoint("TOP", Rinfobar, "BOTTOM")
	M.CreateGF(Rinfobar2, 450, 1, "Horizontal", cr, cg, cb, 0, .6)

	-- ACTIONBAR
	local basic = 94
	if MaoRUISettingDB["Actionbar"]["Styles"] == 4 then basic = 130 end

	if MaoRUISettingDB["Skins"]["BarLine"] then
		local MactionbarL = CreateFrame("Frame", nil, UIParent)
		MactionbarL:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOM", 0, 4)
		M.CreateGF(MactionbarL, 250, basic, "Horizontal", 0, 0, 0, 0, .5)
		local MactionbarL1 = CreateFrame("Frame", nil, MactionbarL)
		MactionbarL1:SetPoint("BOTTOMRIGHT", MactionbarL, "TOPRIGHT")
		M.CreateGF(MactionbarL1, 230, 1, "Horizontal", cr, cg, cb, 0, .7)
		RegisterStateDriver(MactionbarL, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show")

		local MactionbarR = CreateFrame("Frame", nil, UIParent)
		MactionbarR:SetPoint("BOTTOMLEFT", UIParent, "BOTTOM", 0, 4)
		M.CreateGF(MactionbarR, 250, basic, "Horizontal", 0, 0, 0, .5, 0)
		local MactionbarR1 = CreateFrame("Frame", nil, MactionbarR)
		MactionbarR1:SetPoint("BOTTOMLEFT", MactionbarR, "TOPLEFT")
		M.CreateGF(MactionbarR1, 230, 1, "Horizontal", cr, cg, cb, .7, 0)
		RegisterStateDriver(MactionbarR, "visibility", "[petbattle][overridebar][vehicleui][possessbar,@vehicle,exists] hide; show")

		-- OVERRIDEBAR
		local OverbarL = CreateFrame("Frame", nil, UIParent)
		OverbarL:SetPoint("BOTTOM", UIParent, "BOTTOM", -100, 4)
		M.CreateGF(OverbarL, 200, 57, "Horizontal", 0, 0, 0, 0, .5)
		local OverbarL1 = CreateFrame("Frame", nil, OverbarL)
		OverbarL1:SetPoint("BOTTOM", OverbarL, "TOP")
		M.CreateGF(OverbarL1, 200, 1, "Horizontal", cr, cg, cb, 0, .7)
		RegisterStateDriver(OverbarL, "visibility", "[petbattle]hide; [overridebar][vehicleui][possessbar,@vehicle,exists] show; hide")

		local OverbarR = CreateFrame("Frame", nil, UIParent)
		OverbarR:SetPoint("BOTTOM", UIParent, "BOTTOM", 100, 4)
		M.CreateGF(OverbarR, 200, 57, "Horizontal", 0, 0, 0, .5, 0)
		local OverbarR1 = CreateFrame("Frame", nil, OverbarR)
		OverbarR1:SetPoint("BOTTOM", OverbarR, "TOP")
		M.CreateGF(OverbarR1, 200, 1, "Horizontal", cr, cg, cb, .7, 0)
		RegisterStateDriver(OverbarR, "visibility", "[petbattle]hide; [overridebar][vehicleui][possessbar,@vehicle,exists] show; hide")
	end

	-- Add Skins
	self:QuestTracker()
	self:DBMSkin()
	self:CastBarSkin()
	self:QuestTrackerSkinTitle()
end

function module:LoadWithAddOn(addonName, value, func)
	MaoRUI:EventFrame({"ADDON_LOADED", "PLAYER_ENTERING_WORLD"}):SetScript("OnEvent", function(self, event, addon)
		if not MaoRUISettingDB["Skins"][value] then
			self:UnregisterAllEvents()
			return
		end

		if event == "PLAYER_ENTERING_WORLD" then
			if not IsAddOnLoaded(addonName) then
				self:UnregisterAllEvents()
				return
			end
			func()
			self:UnregisterEvent(event)
		elseif event == "ADDON_LOADED" and addon == addonName then
			func()
			self:UnregisterAllEvents()
		end
	end)
end