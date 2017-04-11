local addon, ns = ...
local cfg = ns.cfg
local init = ns.init

if cfg.Bags == true then
    local Stat = CreateFrame("Frame", nil, UIParent)
    Stat:EnableMouse(true)
    Stat:SetHitRectInsets(0, 0, 0, -10)

    local Text  = Stat:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(cfg.Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(cfg.BagsPoint))

	local function OnEvent(self, event, ...)
		local free, total, used = 0, 0, 0
		for i = 0, NUM_BAG_SLOTS do
			free, total = free + GetContainerNumFreeSlots(i), total + GetContainerNumSlots(i)
		end
		used = total - free
		--Text:SetText(cfg.ColorClass and infoL["Bags"]..":"..init.Colored..free or  infoL["Bags"]..":"..free)
		Text:SetText(cfg.ColorClass and init.Colored..free or free)
		self:SetAllPoints(Text)
		Stat:SetScript("OnEnter", function()

			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, 6);
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, 1)
			GameTooltip:ClearLines()
			GameTooltip:AddLine(infoL["Bags"],0,.6,1)
			GameTooltip:AddLine(" ")
			GameTooltip:AddDoubleLine(infoL["Total"]..":",total,.6,.8,1, 1, 1, 1)
			GameTooltip:AddDoubleLine(infoL["Used"]..":",used,.6,.8,1, 1, 1, 1)
			--GameTooltip:AddDoubleLine(" ","--------------",1,1,1,0.5,0.5,0.5)
			GameTooltip:Show()
		end)
		Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
	end
          
    Stat:RegisterEvent("PLAYER_LOGIN")
    Stat:RegisterEvent("BAG_UPDATE")
    Stat:SetScript("OnEvent", OnEvent)
	Stat:SetScript("OnMouseDown", function(self,button)
			ToggleAllBags()
	end)
end