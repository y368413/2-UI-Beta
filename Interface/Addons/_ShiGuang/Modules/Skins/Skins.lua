local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:RegisterModule("Skins")
local cr, cg, cb = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b

function module:OnLogin()
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

	-- Add Skins
	self:QuestTracker()
	self:DBMSkin()
	self:CastBarSkin()
end

function module:LoadWithAddOn(addonName, value, func)
	MaoRUISettingDB:EventFrame({"ADDON_LOADED", "PLAYER_ENTERING_WORLD"}):SetScript("OnEvent", function(self, event, addon)
		if not NDuiDB["Skins"][value] then
			self:UnregisterAllEvents()
			return
		end

		if event == "PLAYER_ENTERING_WORLD" then
			if not IsAddOnLoaded(addonName) then
				self:UnregisterAllEvents()
				return
			end
			self:UnregisterEvent(event)
		elseif event == "ADDON_LOADED" and addon == addonName then
			func()
			self:UnregisterAllEvents()
		end
	end)
end