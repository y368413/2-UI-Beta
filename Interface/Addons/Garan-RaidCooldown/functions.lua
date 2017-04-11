if not RDCD then return end
local RDCD = RDCD

local font = GameFontHighlight:GetFont()

RDCD.createtext = function(frame, layer, fontsize, flag, justifyh)
	local text = frame:CreateFontString(nil, layer)
	text:SetFont(font, fontsize, flag)
	text:SetJustifyH(justifyh)
	return text
end

RDCD.createborder = function(frame)
	if frame.style then return end
	frame.sd = CreateFrame("Frame", nil, frame)
	frame.sd:SetFrameLevel(frame:GetFrameLevel()-1)
	frame.sd:SetBackdrop({
		bgFile = "Interface\\Buttons\\WHITE8x8",
		edgeFile = "Interface\\AddOns\\Garan-RaidCooldown\\media\\glowtex",
		edgeSize = 3,
			insets = { left = 3, right = 3, top = 3, bottom = 3,}
		})
	frame.sd:SetPoint("TOPLEFT", frame, -3, 3)
	frame.sd:SetPoint("BOTTOMRIGHT", frame, 3, -3)
	frame.sd:SetBackdropColor(.15, .15, .15)
	frame.sd:SetBackdropBorderColor(0, 0, 0)
	frame.style = true
end

RDCD.FormatTime = function(time)
	if time >= 60 then
		return string.format('%.2d:%.2d', floor(time / 60), time % 60)
	else
		return string.format('%.2d', time)
	end
end

function RDCD:LockFrame()
	RDCD.frame:EnableMouse(false)
	RDCD.frame.sd:Hide()
end

function RDCD:UnlockFrame()
	RDCD.frame:EnableMouse(true)
	RDCD.frame.sd:Show()
end