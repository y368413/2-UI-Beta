-- Config start
local anchor = "TOPLEFT"
local x, y = 410, -2
local width, height = 121, 14
local icon_size = 15
local font = GameFontHighlight:GetFont()
local font_size = 11
local font_style = nil
local backdrop_color = {0, 0, 0, 0.4}
local border_color = {0, 0, 0, 1}
local texture = "Interface\\TargetingFrame\\UI-StatusBar"
-- Config end

local sformat = string.format
local floor = math.floor
local Ressesbars = {}
local currentNumResses = 0
local charges = nil
local inBossCombat = nil

local backdrop = {
	bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
	edgeFile = [=[Interface\ChatFrame\ChatFrameBackground]=], edgeSize = 1,
	insets = {top = 0, left = 0, bottom = 0, right = 0},
}

local FormatTime = function(time)
	if time >= 60 then
		return sformat('%.2d:%.2d', floor(time / 60), time % 60)
	else
		return sformat('%.2d', time)
	end
end

local CreateFS = CreateFS or function(frame)
	local fstring = frame:CreateFontString(nil, 'OVERLAY', 'GameFontHighlight')
	fstring:SetFont(font, font_size, font_style)
	fstring:SetShadowColor(0, 0, 0, 1)
	fstring:SetShadowOffset(0.5, -0.5)
	return fstring
end

local CreateBG = CreateBG or function(parent)
	local bg = CreateFrame("Frame", nil, parent)
	bg:SetPoint("TOPLEFT", parent, "TOPLEFT", -1, 1)
	bg:SetPoint("BOTTOMRIGHT", parent, "BOTTOMRIGHT", 1, -1)
	bg:SetFrameStrata("LOW")
	bg:SetBackdrop(backdrop)
	bg:SetBackdropColor(unpack(backdrop_color))
	bg:SetBackdropBorderColor(unpack(border_color))
	return bg
end

local StopTimer = function(bar)
	bar:SetScript("OnUpdate", nil)
	bar:Hide()
	Ressesbars = {}
end

local UpdateCharges = function(bar)
	local curCharges, maxCharges, start, duration = GetSpellCharges(20484)
	if curCharges == maxCharges then
		bar.startTime = 0
		bar.endTime = GetTime()
	else
		bar.startTime = start
		bar.endTime = start + duration
	end
	if curCharges ~= currentNumResses then
		currentNumResses = curCharges
		bar.left:SetText(bar.name.." : "..currentNumResses)
	end
end

local BarUpdate = function(self, elapsed)
	local curTime = GetTime()
	if self.endTime < curTime then
		UpdateCharges(self)
	end
	self.status:SetValue(100 - (curTime - self.startTime) / (self.endTime - self.startTime) * 100)
	self.right:SetText(FormatTime(self.endTime - curTime))
end

local OnMouseDown = function(self, button)
	if button == "LeftButton" then
		SendChatMessage(sformat("战复剩: %d次 充能: %s", currentNumResses, self.right:GetText()), "YELL")
	elseif button == "RightButton" then
		StopTimer(self)
	end
end

local CreateBar = function()
	local bar = CreateFrame("Frame", nil, UIParent)
	bar:SetSize(width, height)
	bar:SetPoint(anchor, x, y)
	if UIMovableFrames then tinsert(UIMovableFrames, bar) end
	bar.status = CreateFrame("Statusbar", nil, bar)
	bar.icon = CreateFrame("button", nil, bar)
	bar.icon:SetSize(icon_size, icon_size)
	bar.icon:SetPoint("BOTTOMLEFT", 0, 0)
	bar.status:SetPoint("BOTTOMLEFT", bar.icon, "BOTTOMRIGHT", 5, 0)
	bar.status:SetPoint("BOTTOMRIGHT", 0, 0)
	bar.status:SetHeight(height)
	bar.status:SetStatusBarTexture(texture)
	bar.status:SetMinMaxValues(0, 100)
	bar.status:SetFrameLevel(bar:GetFrameLevel()-1)
	bar.left = CreateFS(bar)
	bar.left:SetPoint('LEFT', bar.status, 2, 1)
	bar.left:SetJustifyH('LEFT')
	bar.right = CreateFS(bar)
	bar.right:SetPoint('RIGHT', bar.status, -2, 1)
	bar.right:SetJustifyH('RIGHT')
	CreateBG(bar.icon)
	CreateBG(bar.status)
	return bar
end

local StartTimer = function(name, spellId)
	local spell, rank, icon = GetSpellInfo(spellId)
	--团队首领战中战复技能计时特殊处理
	if #Ressesbars then
		for _, v in pairs(Ressesbars) do
			UpdateCharges(v)
			return
		end
	end
	local bar = CreateBar()
	local color
	--初始化战复技能计时条
	local curCharges, _, start, duration = GetSpellCharges(20484)
	currentNumResses = curCharges
	bar.endTime = start + duration
	bar.left:SetText(name.." : "..curCharges)
	bar.right:SetText(FormatTime(duration))
	color = RAID_CLASS_COLORS["DRUID"]
	bar.startTime = start
	bar.name = name
	bar.spell = spell
	bar.spellId = spellId
	if icon and bar.icon then
		bar.icon:SetNormalTexture(icon)
		bar.icon:GetNormalTexture():SetTexCoord(0.07, 0.93, 0.07, 0.93)
	end
	bar:Show()
	bar.status:SetStatusBarColor(color.r, color.g, color.b)
	bar:SetScript("OnUpdate", BarUpdate)
	bar:EnableMouse(true)
	bar:SetScript("OnMouseDown", OnMouseDown)
	tinsert(Ressesbars, bar)
end

local OnEvent = function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED_NEW_AREA" then
		if select(2, IsInInstance()) == "raid" then
			self:RegisterEvent("SPELL_UPDATE_CHARGES")
		elseif select(3, IsInInstance()) == 8 then
			bar:Show()
		else
			self:UnregisterEvent("SPELL_UPDATE_CHARGES")
			charges = nil
			inBossCombat = nil
			currentNumResses = 0
			Ressesbars = {}
		end
	end
	if event == "SPELL_UPDATE_CHARGES" then
		charges = select(1, GetSpellCharges(20484))
		if charges then
			if not inBossCombat then
				inBossCombat = true
			end
			StartTimer("战复", 20484)
		elseif not charges and inBossCombat then
			inBossCombat = nil
			currentNumResses = 0
			if #Ressesbars then
				for _, v in pairs(Ressesbars) do
					StopTimer(v)
				end
			end
		end
	end
end

local addon = CreateFrame("frame")
addon:SetScript('OnEvent', OnEvent)
addon:RegisterEvent("PLAYER_ENTERING_WORLD")
addon:RegisterEvent("CHALLENGE_MODE_START")