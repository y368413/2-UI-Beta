local addon, ns = ...
local cfg = ns.cfg

if cfg.Coords == true then
    local Stat = CreateFrame("Frame", nil, UIParent)
    Stat:EnableMouse(true)
    Stat:SetHitRectInsets(0, 0, 0, -10)

    local Text  = Stat:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(cfg.Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(cfg.CoordsPoint))
	Stat:SetAllPoints(Text)
	
	local coordX, coordY = 0, 0
	--local function formatCoords() return format("%.1f,%.1f", coordX*100, coordY*100) end
	local function formatCoords() return format("%d,%d", coordX*100, coordY*100) end
	
	Stat:SetScript("OnUpdate", function()
		coordX, coordY = GetPlayerMapPosition("player")
		Text:SetText(formatCoords())
	end)
	Stat:SetScript("OnMousedown", function(_,btn)
		if btn == "LeftButton" then
			ToggleFrame(WorldMapFrame)
		else
			ChatFrame_OpenChat(format("%s: %s",infoL["My Coordinate"],formatCoords()), chatFrame)
		end
	end)
end