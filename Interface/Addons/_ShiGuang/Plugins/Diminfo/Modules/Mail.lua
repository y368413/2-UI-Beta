local addon, ns = ...
local cfg = ns.cfg

if cfg.Mail == true then
    local Stat = CreateFrame("Frame", nil, UIParent)
    Stat:EnableMouse(false)
    Stat:SetHitRectInsets(0, 0, 0, -10)

    local Text  = Stat:CreateFontString(nil, "OVERLAY")
    Text:SetFont(unpack(cfg.Fonts))
    Text:SetShadowColor(0, 0, 0)
    Text:SetShadowOffset(1, -1)
    Text:SetPoint(unpack(cfg.MailPoint))
	Stat:SetAllPoints(Text)

	Stat:SetScript("OnUpdate", function()
		Text:SetText(cfg.ColorClass and (HasNewMail() and "|cff00FF00"..infoL["New"]..infoL["Mail"].."|r" or infoL["No Mail"].."|r") or HasNewMail() and "|cff00FF00"..infoL["New"]..infoL["Mail"].."|r" or infoL["No Mail"])
	end)
end