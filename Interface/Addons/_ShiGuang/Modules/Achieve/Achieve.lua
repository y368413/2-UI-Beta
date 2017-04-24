local M, R, U, I = unpack(select(2, ...))
-- All this code is not by me but it is (well written as usual) by Phanx :)
local tooltip = CreateFrame("GameTooltip", "AchievementsCompareTooltip", UIParent, "GameTooltipTemplate")
tooltip:EnableMouse(true)
tooltip:SetToplevel(true)
tooltip:SetMovable(true)
tooltip:SetScale(0.8) --MaoRUISettingDB["Settings"]["GUIScale"]
tooltip:SetFrameStrata("TOOLTIP")
tooltip:Hide()
tooltip:SetSize(128, 64)
tooltip:SetPoint("BOTTOMLEFT", 21, 210)
tooltip:SetPadding(16, 0)
tooltip:RegisterForDrag("LeftButton")
tooltip:SetScript("OnDragStart", tooltip.StartMoving)
tooltip:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	ValidateFramePosition(self)
end)

GameTooltip_OnLoad(tooltip)
tinsert(UISpecialFrames, "AchievementsCompareTooltip")

local close = CreateFrame("Button", nil, tooltip)
close:SetSize(32, 32)
close:SetPoint("TOPRIGHT", 1, 0)
close:SetScript("OnClick", function() HideUIPanel(tooltip) end)
close:SetNormalTexture([[Interface\Buttons\UI-Panel-MinimizeButton-Up]])
close:SetPushedTexture([[Interface\Buttons\UI-Panel-MinimizeButton-Down]])
close:SetHighlightTexture([[Interface\Buttons\UI-Panel-MinimizeButton-Highlight]])
close:GetHighlightTexture():SetBlendMode("ADD")
tooltip.closeButton = close

hooksecurefunc(ItemRefTooltip, "SetHyperlink", function(ItemRefTooltip, link)
	local linkType, id = strsplit(":", link)
	if linkType == "achievement" then
		local achievementLink = GetAchievementLink(id)
		ShowUIPanel(tooltip)
		if not tooltip:IsShown() then
			tooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
		end
		tooltip:SetHyperlink(achievementLink)
	end
end)

------------------------------------------------------------------------------- Auto screenshot when achieved
local function TakeScreen(delay, func, ...)
	local waitTable = {}
	local waitFrame = CreateFrame("Frame", nil, UIParent)
	waitFrame:SetScript("OnUpdate", function(self, elapse)
		local count = #waitTable
		local i = 1
		while (i <= count) do
			local waitRecord = tremove(waitTable, i)
			local d = tremove(waitRecord, 1)
			local f = tremove(waitRecord, 1)
			local p = tremove(waitRecord, 1)
			if (d > elapse) then
				tinsert(waitTable, i, {d-elapse, f, p})
				i = i + 1
			else
				count = count - 1
				f(unpack(p))
			end
		end
	end)
	tinsert(waitTable, {delay, func, {...}})
end
local AchScreen = CreateFrame("Frame") 
AchScreen:RegisterEvent("ACHIEVEMENT_EARNED") 
AchScreen:SetScript("OnEvent", function()
  if not MaoRUISettingDB["Misc"]["AchievementPrintScreen"] then self:UnregisterAllEvents() return end
    TakeScreen(1, Screenshot)
end)