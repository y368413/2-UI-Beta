local _, ns = ...
local M, R, U, I = unpack(ns)
local cr, cg, cb = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b

M.UIParent = CreateFrame("Frame", "MaoRuiParent", UIParent)
M.UIParent:SetFrameLevel(UIParent:GetFrameLevel())
M.UIParent:SetAllPoints()
M.UIParent.origHeight = M.UIParent:GetHeight()

-- Gradient Frame
function M:CreateGF(w, h, o, r, g, b, a1, a2)
	self:SetSize(w, h)
	self:SetFrameStrata("BACKGROUND")
	local gf = self:CreateTexture(nil, "BACKGROUND")
	gf:SetAllPoints()
	gf:SetTexture(I.normTex)
	gf:SetGradientAlpha(o, r, g, b, a1, r, g, b, a2)
end

-- Create Backdrop
function M:CreateBD(a)
	self:SetBackdrop({
		bgFile = I.bdTex, edgeFile = I.bdTex, edgeSize = 1.2,
	})
	self:SetBackdropColor(0, 0, 0, a or .5)
	self:SetBackdropBorderColor(0, 0, 0)
end

-- Create Shadow
function M:CreateSD(m, s)
	if self.Shadow then return end

	local frame = self
	if self:GetObjectType() == "Texture" then frame = self:GetParent() end
	local lvl = frame:GetFrameLevel()
	if not m then m, s = 2, 3 end

	self.Shadow = CreateFrame("Frame", nil, frame)
	self.Shadow:SetPoint("TOPLEFT", self, -m, m)
	self.Shadow:SetPoint("BOTTOMRIGHT", self, m, -m)
	self.Shadow:SetBackdrop({edgeFile = I.glowTex, edgeSize = s})
	self.Shadow:SetBackdropBorderColor(0, 0, 0, 1)
	self.Shadow:SetFrameLevel(lvl == 0 and 0 or lvl - 1)

	return self.Shadow
end

-- Create Background
function M:CreateBG(offset)
	local frame = self
	if self:GetObjectType() == "Texture" then frame = self:GetParent() end
	offset = offset or 1.2
	local lvl = frame:GetFrameLevel()

	local bg = CreateFrame("Frame", nil, frame)
	bg:SetPoint("TOPLEFT", self, -offset, offset)
	bg:SetPoint("BOTTOMRIGHT", self, offset, -offset)
	bg:SetFrameLevel(lvl == 0 and 0 or lvl - 1)
	return bg
end

-- Create Skin
function M:CreateTex()
	if self.Tex then return end

	local frame = self
	if self:GetObjectType() == "Texture" then frame = self:GetParent() end

	self.Tex = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
	self.Tex:SetAllPoints(self)
	self.Tex:SetTexture(I.bgTex, true, true)
	self.Tex:SetHorizTile(true)
	self.Tex:SetVertTile(true)
	self.Tex:SetBlendMode("ADD")
end

-- Frame Text
function M:CreateFS(size, text, classcolor, anchor, x, y)
	local fs = self:CreateFontString(nil, "OVERLAY")
	fs:SetFont(I.Font[1], size, I.Font[3])
	fs:SetText(text)
	fs:SetWordWrap(false)
	if classcolor then fs:SetTextColor(cr, cg, cb) end
	if anchor and x and y then
		fs:SetPoint(anchor, x, y)
	else
		fs:SetPoint("CENTER", 1, 0)
	end
	return fs
end

-- Frame Text (横)
function M:CreateFSC(size, text, classcolor, anchor, x, y)
	local fs = self:CreateFontString(nil, "OVERLAY")
	fs:SetFont("Interface\\AddOns\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", size, I.Font[3])
	fs:SetText(text)
	fs:SetWordWrap(false)
	if classcolor then fs:SetTextColor(cr, cg, cb) end
	if anchor and x and y then
		fs:SetPoint(anchor, x, y)
	else
		fs:SetPoint("CENTER", 1, 0)
	end
	return fs
end

-- GameTooltip
function M:AddTooltip(anchor, text, color)
	self:SetScript("OnEnter", function()
		GameTooltip:SetOwner(self, anchor)
		GameTooltip:ClearLines()
		if tonumber(text) then
			GameTooltip:SetSpellByID(text)
		else
			local r, g, b = 1, 1, 1
			if color == "class" then
				r, g, b = cr, cg, cb
			elseif color == "system" then
				r, g, b = 1, .8, 0
			end
			GameTooltip:AddLine(text, r, g, b)
		end
		GameTooltip:Show()
	end)
	self:SetScript("OnLeave", GameTooltip_Hide)
end

-- Button Color
function M:CreateBC(a)
	self:SetNormalTexture("")
	self:SetHighlightTexture("")
	self:SetPushedTexture("")
	self:SetDisabledTexture("")

	if self.Left then self.Left:SetAlpha(0) end
	if self.Middle then self.Middle:SetAlpha(0) end
	if self.Right then self.Right:SetAlpha(0) end
	if self.LeftSeparator then self.LeftSeparator:Hide() end
	if self.RightSeparator then self.RightSeparator:Hide() end

	self:SetScript("OnEnter", function()
		self:SetBackdropBorderColor(cr, cg, cb, 1)
	end)
	self:SetScript("OnLeave", function()
		self:SetBackdropBorderColor(0, 0, 0, 1)
	end)
	self:SetScript("OnMouseDown", function()
		self:SetBackdropColor(cr, cg, cb, a or .3)
	end)
	self:SetScript("OnMouseUp", function()
		self:SetBackdropColor(0, 0, 0, a or .3)
	end)
end

-- Checkbox
function M:CreateCB(a)
	self:SetNormalTexture("")
	self:SetPushedTexture("")
	self:SetHighlightTexture(I.bdTex)
	local hl = self:GetHighlightTexture()
	hl:SetPoint("TOPLEFT", 5, -5)
	hl:SetPoint("BOTTOMRIGHT", -5, 5)
	hl:SetVertexColor(cr, cg, cb, .25)

	local bd = M.CreateBG(self, -4)
	M.CreateBD(bd, a)

	local ch = self:GetCheckedTexture()
	ch:SetDesaturated(true)
	ch:SetVertexColor(cr, cg, cb)
end

-- Movable Frame
function M:CreateMF(parent)
	local frame = parent or self
	frame:SetMovable(true)
	frame:SetUserPlaced(true)
	frame:SetClampedToScreen(true)

	self:EnableMouse(true)
	self:RegisterForDrag("LeftButton")
	self:SetScript("OnDragStart", function() frame:StartMoving() end)
	self:SetScript("OnDragStop", function() frame:StopMovingOrSizing() end)
end

-- Icon Style
function M:CreateIF(mouse, cd)
	M.CreateSD(self, 3, 3)
	self.Icon = self:CreateTexture(nil, "ARTWORK")
	self.Icon:SetAllPoints()
	self.Icon:SetTexCoord(unpack(I.TexCoord))
	if mouse then
		self:EnableMouse(true)
		self.HL = self:CreateTexture(nil, "HIGHLIGHT")
		self.HL:SetColorTexture(1, 1, 1, .3)
		self.HL:SetAllPoints(self.Icon)
	end
	if cd then
		self.CD = CreateFrame("Cooldown", nil, self, "CooldownFrameTemplate")
		self.CD:SetAllPoints()
		self.CD:SetReverse(true)
	end
end

-- Statusbar
function M:CreateSB(spark, r, g, b)
	self:SetStatusBarTexture(I.normTex)
	if r and g and b then
		self:SetStatusBarColor(r, g, b)
	else
		self:SetStatusBarColor(cr, cg, cb)
	end
	M.CreateSD(self, 3, 3)
	self.BG = self:CreateTexture(nil, "BACKGROUND")
	self.BG:SetAllPoints()
	self.BG:SetTexture(I.normTex)
	self.BG:SetVertexColor(0, 0, 0, .5)
	M.CreateTex(self.BG)
	if spark then
		self.Spark = self:CreateTexture(nil, "OVERLAY")
		self.Spark:SetTexture(I.sparkTex)
		self.Spark:SetBlendMode("ADD")
		self.Spark:SetAlpha(.8)
		self.Spark:SetPoint("TOPLEFT", self:GetStatusBarTexture(), "TOPRIGHT", -10, 10)
		self.Spark:SetPoint("BOTTOMRIGHT", self:GetStatusBarTexture(), "BOTTOMRIGHT", 10, -10)
	end
end

-- StatusbarEnergy
function M.CreateSBC(f, spark, r, g, b)
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
function M.Numb(n)
	if MaoRUISettingDB["Settings"]["Format"] == 1 then
		if n >= 1e12 then
			return ("%.2ft"):format(n / 1e12)
		elseif n >= 1e9 then
			return ("%.2fb"):format(n / 1e9)
		elseif n >= 1e6 then
			return ("%.2fm"):format(n / 1e6)
		elseif n >= 1e3 then
			return ("%.1fk"):format(n / 1e3)
		else
			return ("%.0f"):format(n)
		end
	elseif MaoRUISettingDB["Settings"]["Format"] == 2 then
		if n >= 1e8 then
			return ("%.2f"..DANWEI_YI):format(n / 1e8)
		elseif n >= 1e4 then
			return ("%.1f"..DANWEI_WAN):format(n / 1e4)
		else
			return ("%.0f"):format(n)
		end
	else
		return ("%.0f"):format(n)
	end
end

-- Color code
function M.HexRGB(r, g, b)
	if r then
		if type(r) == "table" then
			if r.r then r, g, b = r.r, r.g, r.b else r, g, b = unpack(r) end
		end
		return ("|cff%02x%02x%02x"):format(r*255, g*255, b*255)
	end
end

function M.ClassColor(class)
	local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[class]
	if not color then return 1, 1, 1 end
	return color.r, color.g, color.b
end

function M.UnitColor(unit)
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
M.HiddenFrame = CreateFrame("Frame")
M.HiddenFrame:Hide()

function M:HideObject()
	if self.UnregisterAllEvents then
		self:UnregisterAllEvents()
		self:SetParent(M.HiddenFrame)
	else
		self.Show = self.Hide
	end
	self:Hide()
end

function M:StripTextures(kill)
	for i = 1, self:GetNumRegions() do
		local region = select(i, self:GetRegions())
		if region and region:GetObjectType() == "Texture" then
			if kill and type(kill) == "boolean" then
				M.HideObject(region)
			elseif region:GetDrawLayer() == kill then
				region:SetTexture(nil)
			elseif kill and type(kill) == "string" and region:GetTexture() ~= kill then
				region:SetTexture("")
			else
				region:SetTexture("")
			end
		end
	end
end

function M:Dummy()
	return
end

function M:HideOption()
	self:SetAlpha(0)
	self:SetScale(.0001)
end

-- Smoothy
local smoothing = {}
local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function()
	local limit = 30/GetFramerate()
	for bar, value in pairs(smoothing) do
		local cur = bar:GetValue()
		local new = cur + math.min((value-cur)/8, math.max(value-cur, limit))
		if new ~= new then
			new = value
		end
		bar:SetValue_(new)
		if cur == value or math.abs(new - value) < 1 then
			smoothing[bar] = nil
			bar:SetValue_(value)
		end
	end
end)

function M:SmoothBar()
	if not self.SetValue_ then
		self.SetValue_ = self.SetValue
		self.SetValue = function(_, value)
			if value ~= self:GetValue() or value == 0 then
				smoothing[self] = value
			else
				smoothing[self] = nil
				self:SetValue_(value)
			end
		end
	end
end

-- Guild Check
function M.UnitInGuild(unitName)
	if not unitName then return end
	for i = 1, GetNumGuildMembers() do
		local name = GetGuildRosterInfo(i)
		if name and Ambiguate(name, "none") == Ambiguate(unitName, "none") then
			return true
		end
	end
	return false
end

-- Timer Format
function M.FormatTime(s)
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
	else
		return format("|cffcccc33%d|r", s), s - floor(s)
	end
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
function M.CopyTable(source, target)
	for key, value in pairs(source) do
		if type(value) == "table" then
			if not target[key] then target[key] = {} end
			for k in pairs(value) do
				target[key][k] = value[k]
			end
		else
			target[key] = value
		end
	end
end

-- GUI APIs
function M:CreateButton(width, height, text, fontSize)
	local bu = CreateFrame("Button", nil, self)
	bu:SetSize(width, height)
	M.CreateBD(bu, .3)
	M.CreateBC(bu)
	bu.text = M.CreateFS(bu, fontSize or 14, text, true)

	return bu
end

function M:CreateCheckBox()
	local cb = CreateFrame("CheckButton", nil, self, "InterfaceOptionsCheckButtonTemplate")
	M.CreateCB(cb)

	cb.Type = "CheckBox"
	return cb
end

function M:CreateEditBox(width, height)
	local eb = CreateFrame("EditBox", nil, self)
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

function M:CreateDropDown(width, height, data)
	local dd = CreateFrame("Frame", nil, self)
	dd:SetSize(width, height)
	M.CreateBD(dd, .3)
	dd.Text = M.CreateFS(dd, 14, "")
	dd.options = {}

	local bu = CreateFrame("Button", nil, dd)
	bu:SetPoint("LEFT", dd, "RIGHT", -6, 2)
	bu:SetSize(21, 21)
	bu.Icon = bu:CreateTexture(nil, "ARTWORK")
	bu.Icon:SetAllPoints()
	bu.Icon:SetTexture(I.gearTex)
	--bu.Icon:SetTexCoord(0, .5, 0, .5)
	bu:SetHighlightTexture(I.gearTex)
	--bu:GetHighlightTexture():SetTexCoord(0, .5, 0, .5)
	local list = CreateFrame("Frame", nil, dd)
	list:SetPoint("TOP", dd, "BOTTOM")
	M.CreateBD(list, 1)
	bu:SetScript("OnShow", function() list:Hide() end)
	bu:SetScript("OnClick", function()
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
		ToggleFrame(list)
	end)
	dd.button = bu

	local opt, index = {}, 0
	local function optOnClick(self)
		PlaySound(SOUNDKIT.GS_TITLE_OPTION_OK)
		for i = 1, #opt do
			if self == opt[i] then
				opt[i]:SetBackdropColor(1, .8, 0, .3)
				opt[i].selected = true
			else
				opt[i]:SetBackdropColor(0, 0, 0, .3)
				opt[i].selected = false
			end
		end
		dd.Text:SetText(self.text)
		list:Hide()
	end
	local function optOnEnter(self)
		if self.selected then return end
		self:SetBackdropColor(1, 1, 1, .25)
	end
	local function optOnLeave(self)
		if self.selected then return end
		self:SetBackdropColor(0, 0, 0, .3)
	end

	for i, j in pairs(data) do
		opt[i] = CreateFrame("Button", nil, list)
		opt[i]:SetPoint("TOPLEFT", 4, -4 - (i-1)*(height+2))
		opt[i]:SetSize(width - 8, height)
		M.CreateBD(opt[i], .3)
		opt[i]:SetBackdropBorderColor(1, 1, 1, .2)
		M.CreateFS(opt[i], 14, j, false, "LEFT", 5, 0)
		opt[i].text = j
		opt[i]:SetScript("OnClick", optOnClick)
		opt[i]:SetScript("OnEnter", optOnEnter)
		opt[i]:SetScript("OnLeave", optOnLeave)

		dd.options[i] = opt[i]
		index = index + 1
	end
	list:SetSize(width, index*(height+2) + 6)

	dd.Type = "DropDown"
	return dd
end