local M, R, U, I = unpack(select(2, ...))
local cr, cg, cb = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b

M.UIParent = CreateFrame("Frame", "MaoRuiParent", UIParent)
M.UIParent:SetFrameLevel(UIParent:GetFrameLevel())
M.UIParent:SetAllPoints()
M.UIParent.origHeight = M.UIParent:GetHeight()

-- Gradient Frame
M.CreateGF = function(f, w, h, o, r, g, b, a1, a2)
	f:SetSize(w, h)
	f:SetFrameStrata("BACKGROUND")
	local gf = f:CreateTexture(nil, "BACKGROUND")
	gf:SetAllPoints()
	gf:SetTexture(I.normTex)
	gf:SetVertexColor(r, g, b)
	gf:SetGradientAlpha(o, r, g, b, a1, r, g, b, a2)
end

-- Create Backdrop
M.CreateBD = function(f, a, s)
	f:SetBackdrop({
		bgFile = I.bdTex, edgeFile = I.glowTex, edgeSize = s or 3,
		insets = {left = s or 3, right = s or 3, top = s or 3, bottom = s or 3},
	})
	f:SetBackdropColor(0, 0, 0, a or .85)
	f:SetBackdropBorderColor(0, 0, 0)
end

-- Create Shadow
M.CreateSD = function(f, m, s)
	if f.Shadow then return end
	local frame = f
	if f:GetObjectType() == "Texture" then frame = f:GetParent() end
	local lvl = frame:GetFrameLevel()

	f.Shadow = CreateFrame("Frame", nil, frame)
	f.Shadow:SetPoint("TOPLEFT", f, -m, m)
	f.Shadow:SetPoint("BOTTOMRIGHT", f, m, -m)
	f.Shadow:SetBackdrop({
		edgeFile = I.glowTex, edgeSize = s })
	f.Shadow:SetBackdropBorderColor(0, 0, 0, 1)
	f.Shadow:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	return f.Shadow
end

-- Create Background
M.CreateBG = function(f, m)
	local frame = f
	if f:GetObjectType() == "Texture" then frame = f:GetParent() end
	local offset = m
	if not m then offset = 1.2 end
	local lvl = frame:GetFrameLevel()

	local bg = CreateFrame("Frame", nil, frame)
	bg:SetPoint("TOPLEFT", f, -offset, offset)
	bg:SetPoint("BOTTOMRIGHT", f, offset, -offset)
	bg:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	return bg
end

-- Create Skin
M.CreateTex = function(f)
	if f.Tex then return end
	local frame = f
	if f:GetObjectType() == "Texture" then frame = f:GetParent() end

	f.Tex = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
	f.Tex:SetAllPoints()
	f.Tex:SetTexture(I.bgTex, true, true)
	f.Tex:SetHorizTile(true)
	f.Tex:SetVertTile(true)
	f.Tex:SetBlendMode("ADD")
end

-- Frame Text (横)
M.CreateFS = function(f, size, text, classcolor, anchor, x, y)
	local fs = f:CreateFontString(nil, "OVERLAY")
	fs:SetFont(I.Font[1], size, I.Font[3])
	fs:SetText(text)
	fs:SetWordWrap(false)
	if classcolor then
		fs:SetTextColor(cr, cg, cb)
	end
	if anchor and x and y then
		fs:SetPoint(anchor, x, y)
	else
		fs:SetPoint("CENTER", 1, 0)
	end
	return fs
end

-- Frame Text (横)
M.CreateFSC = function(f, size, text, classcolor, anchor, x, y)
	local fs = f:CreateFontString(nil, "OVERLAY")
	fs:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", size, I.Font[3])
	fs:SetText(text)
	fs:SetWordWrap(false)
	if classcolor then
		fs:SetTextColor(cr, cg, cb)
	end
	if anchor and x and y then
		fs:SetPoint(anchor, x, y)
	else
		fs:SetPoint("CENTER", 1, 0)
	end
	return fs
end

-- GameTooltip
M.CreateGT = function(f, anchor, text, color)
	f:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, anchor)
		GameTooltip:ClearLines()
		if color == "class" then
			GameTooltip:AddLine(text, cr, cg, cb)
		elseif color == "system" then
			GameTooltip:AddLine(text, 1, .8, 0)
		else
			GameTooltip:AddLine(text, 1, 1, 1)
		end
		GameTooltip:Show()
	end)
	f:SetScript("OnLeave", GameTooltip_Hide)
end

M.CreateAT = function(f, anchor, value)
	f:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, anchor)
		GameTooltip:ClearLines()
		if type(value) == "string" then
			GameTooltip:SetUnitAura("player", value)
		else
			GameTooltip:SetSpellByID(value)
		end
		GameTooltip:Show()
	end)
	f:SetScript("OnLeave", GameTooltip_Hide)
end

-- Button Color
M.CreateBC = function(f, a)
	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetPushedTexture("")
	f:SetDisabledTexture("")

	if f.Left then f.Left:SetAlpha(0) end
	if f.Middle then f.Middle:SetAlpha(0) end
	if f.Right then f.Right:SetAlpha(0) end
	if f.LeftSeparator then f.LeftSeparator:Hide() end
	if f.RightSeparator then f.RightSeparator:Hide() end

	f:SetScript("OnEnter", function()
		f:SetBackdropBorderColor(cr, cg, cb, 1)
	end)
	f:SetScript("OnLeave", function()
		f:SetBackdropBorderColor(0, 0, 0, 1)
	end)
	f:SetScript("OnMouseDown", function()
		f:SetBackdropColor(cr, cg, cb, a or .3)
	end)
	f:SetScript("OnMouseUp", function()
		f:SetBackdropColor(0, 0, 0, a or .3)
	end)
end

-- Checkbox
M.CreateCB = function(f, a)
	f:SetNormalTexture("")
	f:SetPushedTexture("")
	f:SetHighlightTexture(I.bdTex)
	local hl = f:GetHighlightTexture()
	hl:SetPoint("TOPLEFT", 5, -5)
	hl:SetPoint("BOTTOMRIGHT", -5, 5)
	hl:SetVertexColor(cr, cg, cb, .2)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetPoint("TOPLEFT", 4, -4)
	bd:SetPoint("BOTTOMRIGHT", -4, 4)
	bd:SetFrameLevel(f:GetFrameLevel() - 1)
	M.CreateBD(bd, a, 2)

	local ch = f:GetCheckedTexture()
	ch:SetDesaturated(true)
	ch:SetVertexColor(cr, cg, cb)
end

-- Movable Frame
M.CreateMF = function(f, parent)
	local frame = parent or f
	frame:SetMovable(true)
	frame:SetUserPlaced(true)
	frame:SetClampedToScreen(true)
	f:EnableMouse(true)
	f:RegisterForDrag("LeftButton")
	f:SetScript("OnDragStart", function() frame:StartMoving() end)
	f:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
end

-- Icon Style
M.CreateIF = function(f, HL)
	M.CreateSD(f, 3, 3)
	f.Icon = f:CreateTexture(nil, "ARTWORK")
	f.Icon:SetAllPoints()
	f.Icon:SetTexCoord(unpack(I.TexCoord))
	f.CD = CreateFrame("Cooldown", nil, f, "CooldownFrameTemplate")
	f.CD:SetAllPoints()
	f.CD:SetReverse(true)
	if HL then
		f:EnableMouse(true)
		f.HL = f:CreateTexture(nil, "HIGHLIGHT")
		f.HL:SetColorTexture(1, 1, 1, .3)
		f.HL:SetAllPoints(f.Icon)
	end
end

-- Statusbar
M.CreateSB = function(f, spark, r, g, b)
	f:SetStatusBarTexture(I.normTex)
	if r and g and b then
		f:SetStatusBarColor(r, g, b)
	else
		f:SetStatusBarColor(cr, cg, cb)
	end
	M.CreateSD(f, 3, 3)
	f.BG = f:CreateTexture(nil, "BACKGROUND")
	f.BG:SetAllPoints()
	f.BG:SetTexture(I.normTex)
	f.BG:SetVertexColor(0, 0, 0, .5)
	M.CreateTex(f.BG)
	if spark then
		f.Spark = f:CreateTexture(nil, "OVERLAY")
		f.Spark:SetTexture(I.sparkTex)
		f.Spark:SetBlendMode("ADD")
		f.Spark:SetAlpha(.8)
		f.Spark:SetPoint("TOPLEFT", f:GetStatusBarTexture(), "TOPRIGHT", -10, 10)
		f.Spark:SetPoint("BOTTOMRIGHT", f:GetStatusBarTexture(), "BOTTOMRIGHT", 10, -10)
	end
end

-- StatusbarEnergy
M.CreateSBC = function(f, spark, r, g, b)
	f:SetStatusBarTexture(I.EnergyTex)
	if r and g and b then
		f:SetStatusBarColor(r, g, b)
	else
		f:SetStatusBarColor(cr, cg, cb)
	end
	M.CreateSD(f, 3, 3)
	f.BG = f:CreateTexture(nil, "BACKGROUND")
	f.BG:SetAllPoints()
	f.BG:SetTexture(I.EnergyTex)
	f.BG:SetVertexColor(0, 0, 0, .5)
	M.CreateTex(f.BG)
	if spark then
		f.Spark = f:CreateTexture(nil, "OVERLAY")
		f.Spark:SetTexture(I.sparkTex)
		f.Spark:SetBlendMode("ADD")
		f.Spark:SetAlpha(.8)
		f.Spark:SetPoint("TOPLEFT", f:GetStatusBarTexture(), "TOPRIGHT", -10, 10)
		f.Spark:SetPoint("BOTTOMRIGHT", f:GetStatusBarTexture(), "BOTTOMRIGHT", 10, -10)
	end
end

-- Numberize
M.Numb = function(n)
	if MaoRUISettingDB["Settings"]["Format"] == 1 then
		if n >= 1e9 then
			return ("%.2fb"):format(n / 1e9)
		elseif n >= 1e6 then
			return ("%.1fm"):format(n / 1e6)
		elseif n >= 1e3 then
			return ("%.1fk"):format(n / 1e3)
		else
			return ("%.0f"):format(n)
		end
	elseif MaoRUISettingDB["Settings"]["Format"] == 2 then
		if n >= 1e8 then
			return ("%0.1f"..DANWEI_YI):format(n / 1e8)
		elseif n >= 1e4 then
			return ("%0.1f"..DANWEI_WAN):format(n / 1e4)
		else
			return ("%.0f"):format(n)
		end
	else
		return ("%.0f"):format(n)
	end
end

-- Color code
M.HexRGB = function(r, g, b)
	if r then
		if (type(r) == "table") then
			if(r.r) then r, g, b = r.r, r.g, r.b else r, g, b = unpack(r) end
		end
		return ("|cff%02x%02x%02x"):format(r*255, g*255, b*255)
	end
end

M.ClassColor = function(class)
	local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
	if not color then return 1, 1, 1 end
	return color.r, color.g, color.b
end

M.UnitColor = function(unit)
	local r, g, b = 1, 1, 1
	if UnitIsPlayer(unit) then
		local _, class = UnitClass(unit)
		if class then
			r, g, b = M.ClassColor(class)
		end
	elseif UnitIsTapDenied(unit) then
		r, g, b = .6, .6, .6
	else
		local reaction = UnitReaction(unit, "player")
		if reaction then
			local color = FACTION_BAR_COLORS[reaction]
			r, g, b = color.r, color.g, color.b
		end
	end
	return r, g, b
end

-- Disable function
M.Dummy = function() end

-- Smoothy
local smoothing = {}
local function Smooth(self, value)
	if value ~= self:GetValue() or value == 0 then
		smoothing[self] = value
	else
		smoothing[self] = nil
	end
end
local SmoothUpdate = CreateFrame("Frame")
SmoothUpdate:SetScript("OnUpdate", function()
	local limit = 30/GetFramerate()
	for bar, value in pairs(smoothing) do
		local cur = bar:GetValue()
		local new = cur + math.min((value-cur)/8, math.max(value-cur, limit))
		if new ~= new then
			new = value
		end
		bar:SetValue_(new)
		if (cur == value or math.abs(new - value) < .01) then
			bar:SetValue_(value)
			smoothing[bar] = nil
		end
	end
end)
M.SmoothBar = function(bar)
	if not bar.SetValue_ then
		bar.SetValue_ = bar.SetValue
		bar.SetValue = Smooth
	end
end

-- Guild Check
M.UnitInGuild = function(unit)
	for i = 1, GetNumGuildMembers() do
		local name = GetGuildRosterInfo(i)
		if name and name == unit then
			return true
		end
	end
	return false
end

-- Timer Format
M.FormatTime = function(s)
	local day, hour, minute = 86400, 3600, 60
	if s >= day then
		return format("%d"..I.MyColor.."d", s/day), s % day
	elseif s >= hour then
		return format("%d"..I.MyColor.."h", s/hour), s % hour
	elseif s >= minute then
		return format("%d"..I.MyColor.."m", s/minute), s % minute
	elseif s < 3 then
		if MaoRUISettingDB["Actionbar"]["DecimalCD"] then
			return format("|cffff0000%.1f|r", s), s - format("%.1f", s)
		else
			return format("|cffff0000%d|r", s + .5), s - floor(s)
		end
	elseif s < 10 then
		return format("|cffffff00%d|r", s), s - floor(s)
	end
	return format("|cffcccc33%d|r", s), s - floor(s)
end

M.FormatBuffTime = function(button, time)
	if( time <= 0 ) then
		button:SetText("");
	elseif( time < 60 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c00FF0000%.1f|r", s);
	elseif( time < 600 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c00FF9B00%d:%02d|r", m, s);
	elseif( time <= 3600 ) then
		local d, h, m, s = ChatFrame_TimeBreakDown(time);
		button:SetFormattedText("|c0000FF00%dm|r", m);
	else
		button:SetText("|c0000FF001 h+|r");
	end
end

-- Table Backup
M.CopyTable = function(source, target)
	for key, value in pairs(source) do
		if type(value) == "table" then
			if not target[key] then target[key] = {} end
			for k, v in pairs(value) do
				target[key][k] = value[k]
			end
		else
			target[key] = value
		end
	end
end

-- GUI APIs
M.CreateButton = function(parent, width, height, text, fontSize)
	local bu = CreateFrame("Button", nil, parent)
	bu:SetSize(width, height)
	M.CreateBD(bu, .3)
	M.CreateBC(bu)
	M.CreateFS(bu, fontSize or 14, text, true)

	return bu
end

M.CreateCheckBox = function(parent)
	local cb = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
	M.CreateCB(cb)

	cb.Type = "CheckBox"
	return cb
end

M.CreateEditBox = function(parent, width, height)
	local eb = CreateFrame("EditBox", nil, parent)
	eb:SetSize(width, height)
	eb:SetAutoFocus(false)
	eb:SetTextInsets(10, 10, 0, 0)
	eb:SetFontObject(GameFontHighlight)
	M.CreateBD(eb, .3)
	eb:SetScript("OnEscapePressed", function()
		eb:ClearFocus()
	end)
	eb:SetScript("OnEnterPressed", function()
		eb:ClearFocus()
	end)

	eb.Type = "EditBox"
	return eb
end

M.CreateDropDown = function(parent, width, height, data)
	local dd = CreateFrame("Frame", nil, parent)
	dd:SetSize(width, height)
	M.CreateBD(dd, .3)
	dd.Text = M.CreateFS(dd, 14, "")
	dd.options = {}

	local bu = CreateFrame("Button", nil, dd)
	bu:SetPoint("LEFT", dd, "RIGHT", -6, 0)
	bu:SetSize(21, 21)
	bu.Icon = bu:CreateTexture(nil, "ARTWORK")
	bu.Icon:SetAllPoints()
	bu.Icon:SetTexture(I.gearTex)
	--bu.Icon:SetTexCoord(0, .5, 0, .5)
	bu:SetHighlightTexture(I.gearTex)
	--bu:GetHighlightTexture():SetTexCoord(0, .5, 0, .5)
	local list = CreateFrame("Frame", nil, dd)
	list:SetPoint("TOP", dd, "BOTTOM")
	M.CreateBD(list, .7)
	bu:SetScript("OnShow", function() list:Hide() end)
	bu:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
		ToggleFrame(list)
	end)
	dd.button = bu

	local opt, index = {}, 0
	for i, j in pairs(data) do
		opt[i] = CreateFrame("Button", nil, list)
		opt[i]:SetPoint("TOPLEFT", 5, -5 - (i-1)*height)
		opt[i]:SetSize(width - 10, height)
		M.CreateBD(opt[i], .3)
		M.CreateFS(opt[i], 14, j, false, "LEFT", 5, 0)
		opt[i]:SetScript("OnClick", function(self)
			PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
			for num = 1, #opt do
				if num == i then
					opt[num]:SetBackdropColor(1, .8, 0, .3)
					opt[num].selected = true
				else
					opt[num]:SetBackdropColor(0, 0, 0, .3)
					opt[num].selected = false
				end
			end
			dd.Text:SetText(j)
			list:Hide()
		end)
		opt[i]:SetScript("OnEnter", function(self)
			if self.selected then return end
			self:SetBackdropColor(1, 1, 1, .3)
		end)
		opt[i]:SetScript("OnLeave", function(self)
			if self.selected then return end
			self:SetBackdropColor(0, 0, 0, .3)
		end)

		dd.options[i] = opt[i]
		index = index + 1
	end
	list:SetSize(width, index*height + 10)

	dd.Type = "DropDown"
	return dd
end