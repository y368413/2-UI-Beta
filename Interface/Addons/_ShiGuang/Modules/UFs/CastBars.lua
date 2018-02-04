--[[
AdiCastBar - customized unit cast bars
(c) 2009-2014 Adirelle (adirelle@gmail.com)
All rights reserved.
--]]

local addonName, AdiCastBar = ...

local Movable = LibStub('LibMovable-1.0')

if _G.AdiDebug then
	AdiCastBar.Debug = _G.AdiDebug:GetSink(addonName)
else
	function AdiCastBar.Debug() end
end

local function OnEvent(self, event, ...)
	return self[event](self, event, ...)
end

AdiCastBar.eventFrame = CreateFrame("Frame")
AdiCastBar.eventFrame:SetScript('OnEvent', OnEvent)

local abstractProto = setmetatable({ Debug = AdiCastBar.Debug }, getmetatable(AdiCastBar.eventFrame))
AdiCastBar.abstractMeta = { __index = abstractProto }

local db

function abstractProto:LM10_Enable()
	db.disabled[self.key] = nil
	self:OnEnable()
end

function abstractProto:LM10_Disable()
	db.disabled[self.key] = true
	self:OnDisable()
end

function abstractProto:LM10_IsEnabled()
	return not db.disabled[self.key]
end

function abstractProto:Initialize(key, width, height, label, from, anchor, to, xOffset, yOffset, ...)
	self.key = key
	self:Hide()
	self:SetScript('OnEvent', OnEvent)

	self:SetSize(width, height)
	self:SetPoint(from, anchor, to, xOffset, yOffset)

	db[key] = db[key] or {}
	Movable.RegisterMovable(addonName, self, db[key], label)

	self:InitializeWidget(width, height, ...)

	if self:LM10_IsEnabled() then
		self:OnEnable()
	end

	return self
end

AdiCastBar.eventFrame:RegisterEvent('ADDON_LOADED')
function AdiCastBar.eventFrame:ADDON_LOADED(_, name)
	if name ~= addonName then return end
	if MaoRUISettingDB["Skins"]["CastBar"] then return end
	self:UnregisterEvent('ADDON_LOADED')

	_G.AdiCastBarDB = _G.AdiCastBarDB or {}
	db = _G.AdiCastBarDB
	db.disabled = db.disabled or {}
	return AdiCastBar:SpawnAllBars()
end

_G.SLASH_ADICASTBAR1 = "/adicastbar"
_G.SLASH_ADICASTBAR2 = "/adicb"
SlashCmdList.ADICASTBAR = function()
	if Movable.IsLocked(addonName) then
		Movable.Unlock(addonName)
	else
		Movable.Lock(addonName)
	end
end


local _, AdiCastBar = ...

local _G = _G
local CastingBarFrame = _G.CastingBarFrame
local DebuffTypeColor = _G.DebuffTypeColor
local FocusFrameSpellBar = _G.FocusFrameSpellBar
local GetCVar = _G.GetCVar
local GetCVarBool = _G.GetCVarBool
local GetSpellInfo = _G.GetSpellInfo
local GetTalentInfo = _G.GetTalentInfo
local GetTime = _G.GetTime
local IsLoggedIn = _G.IsLoggedIn
local IsSpellKnown = _G.IsSpellKnown
local min = _G.min
local pairs = _G.pairs
local PetCastingBarFrame = _G.PetCastingBarFrame
local print = _G.print
local select = _G.select
local tonumber = _G.tonumber
local tostring = _G.tostring
local type = _G.type
local UnitCastingInfo = _G.UnitCastingInfo
local UnitChannelInfo = _G.UnitChannelInfo
local UnitDebuff = _G.UnitDebuff
local UnitHasVehicleUI = _G.UnitHasVehicleUI
local UnitIsPVP = _G.UnitIsPVP
local unpack = _G.unpack

local COLORS = {
	CAST = { 1.0, 0.7, 0.0 },
	CHANNEL = { 0.0, 1.0, 0.0 },
	INTERRUPTED = { 1.0, 0.0, 0.0 },
}

local GetTime = GetTime

local barProto = setmetatable({}, AdiCastBar.abstractMeta)
local barMeta = { __index = barProto }
AdiCastBar.castBarProto = barProto

function barProto:FadingOut()
	local now = GetTime()
	local alpha = self.fadeDuration - (now - self.endTime)
	if alpha > 0 then
		self:SetAlpha(min(alpha, 1.0))
	else
		self:SetScript('OnUpdate', nil)
		self:Hide()
	end
end

function barProto:FadeOut(failed)
	self:Debug('FadeOut', failed)
	if self.Latency then
		self.Latency:Hide()
	end
	self.Bar.Spark:Hide()
	if failed then
		self.Bar:SetStatusBarColor(unpack(COLORS.INTERRUPTED))
		self.fadeDuration = 1.5
	else
		self.Bar:SetValue(self.reversed and 0 or (self.endTime - self.startTime))
		self.fadeDuration = 1.0
	end
	self.endTime = GetTime()
	self.castId = nil
	self:SetScript('OnUpdate', self.FadingOut)
end

function barProto:TimerUpdate()
	local now = GetTime()
	if self.reversed then
		self.Bar:SetValue(self.endTime - now)
	else
		self.Bar:SetValue(now - self.startTime)
	end
	if now > self.endTime then
		return self:FadeOut()
	end
end

function barProto:SetNotInterruptible(notInterruptible)
	if notInterruptible then
		self.Border:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
		self.Shield:Show()
	else
		self.Border:SetBackdropBorderColor(0, 0, 0, 1)
		self.Shield:Hide()
	end
end

function barProto:SetTime(startTime, endTime, delayed)
	if not delayed or startTime - self.startTime < 1e-2 or self.tickPeriod then
		self.startTime = startTime
		self.delay = nil
	else
		self.delay = startTime - self.startTime
	end
	self.endTime = endTime

	local duration = endTime - startTime
	self.Bar:SetMinMaxValues(0, duration)
end

function barProto:StartCast(reversed, color, name, text, texture, startTime, endTime, notInterruptible, castId)
	local latency = self.Latency
	if latency and not reversed then
		local delay
		if GetCVarBool("reducedLagTolerance") then
			delay = tonumber(GetCVar("MaxSpellStartRecoveryOffset")) / 1000
		else
			delay = self.latency[name]
		end
		if delay then
			latency:ClearAllPoints()
			latency:SetPoint("RIGHT", self.Bar)
			latency:SetWidth(self.Bar:GetWidth() * min(delay / (endTime - startTime), 1.0))
			latency:Show()
		end
	end

	self.reversed = reversed
	self.castId = castId

	self.Bar:SetStatusBarColor(unpack(color))
	self.Bar.Spark:Show()

	text = name or text
	if text then
		self.Text:SetText(text)
		self.Text:Show()
	else
		self.Text:Hide()
	end

	if texture then
		self.Icon:SetTexture(texture)
		self.Icon:Show()
	else
		self.Icon:Hide()
	end

	self:SetTime(startTime, endTime)
	self:SetNotInterruptible(notInterruptible)

	self:SetAlpha(1.0)
	self:SetScript('OnUpdate', self.TimerUpdate)
	self:Show()
end

function barProto:UNIT_SPELLCAST_START(event, unit, spell, _, castId)
	local name, rank, text, texture, startTime, endTime, _, castId, notInterruptible = UnitCastingInfo(unit)
	self:Debug(event, unit, castId, rank, name, text, texture, startTime, endTime, castId, notInterruptible)
	self:LatencyEnd(event, unit, spell)
	return self:StartCast(false, COLORS.CAST, name, text, texture, startTime/1000, endTime/1000, notInterruptible, castId)
end

function barProto:UNIT_SPELLCAST_DELAYED(event, unit, _, _, castId)
	if castId ~= self.castId then return end
	local _, _, _, _, startTime, endTime = UnitCastingInfo(unit)
	self:Debug(event, unit, castId, startTime, endTime)
	return self:SetTime(startTime/1000, endTime/1000, true)
end

function barProto:UNIT_SPELLCAST_INTERRUPTIBLE(event, unit)
	if not self.castId then return end
	self:Debug(event, unit)
	return self:SetNotInterruptible(false)
end

function barProto:UNIT_SPELLCAST_NOT_INTERRUPTIBLE(event, unit)
	if not self.castId then return end
	self:Debug(event, unit)
	return self:SetNotInterruptible(true)
end

function barProto:UNIT_SPELLCAST_STOP(event, unit, _, _, castId)
	if castId ~= self.castId then return end
	self:Debug(event, unit, castId)
	return self:FadeOut()
end

function barProto:UNIT_SPELLCAST_INTERRUPTED(event, unit, _, _, castId)
	if castId ~= self.castId then return end
	self:Debug(event, unit, castId)
	return self:FadeOut(true)
end

barProto.UNIT_SPELLCAST_FAILED = barProto.UNIT_SPELLCAST_INTERRUPTED
barProto.UNIT_SPELLCAST_FAILED_QUIET = barProto.UNIT_SPELLCAST_INTERRUPTED

function barProto:UNIT_SPELLCAST_CHANNEL_START(event, unit, spell, _, _, spellID)
	local name, _, text, texture, startTime, endTime, _, notInterruptible = UnitChannelInfo(unit)
	self:Debug(event, unit, name, text, texture, startTime, endTime, notInterruptible)
	self:LatencyEnd(event, unit, spell)
	self:StartCast(true, COLORS.CHANNEL, name, text, texture, startTime/1000, endTime/1000, notInterruptible, "CHANNEL")
end

function barProto:UNIT_SPELLCAST_CHANNEL_UPDATE(event, unit)
	if self.castId ~= "CHANNEL" then return end
	local _, _, _, _, startTime, endTime = UnitChannelInfo(unit)
	self:Debug(event, unit, startTime, endTime)
	self:SetTime(startTime/1000, endTime/1000, true)
end

function barProto:UNIT_SPELLCAST_CHANNEL_STOP(event, unit)
	if self.castId ~= "CHANNEL" then return end
	self:Debug(event, unit)
	return self:FadeOut()
end

function barProto:UNIT_SPELLCAST_CHANNEL_INTERRUPTED(event, unit)
	if self.castId ~= "CHANNEL" then return end
	self:Debug(event, unit)
	return self:FadeOut(true)
end

local function GetActualUnit(unit)
	if unit == "player" then
		return UnitHasVehicleUI('player') and 'vehicle' or 'player'
	elseif unit == "pet" then
		return UnitHasVehicleUI('player') and 'player' or 'pet'
	else
		return unit
	end
end

function barProto:PLAYER_ENTERING_WORLD(event)
	local unit = self.unit
	if unit ~= GetActualUnit(self.realUnit) then
		self:OnDisable()
		self:OnEnable()
		return
	end
	self:Debug(event, unit, "casting:", UnitCastingInfo(unit), "channeling:", (UnitChannelInfo(unit)))
	if UnitCastingInfo(unit) then
		return self:UNIT_SPELLCAST_START(event, unit)
	elseif UnitChannelInfo(unit) then
		return self:UNIT_SPELLCAST_CHANNEL_START(event, unit)
	elseif self:IsShown() then
		self.castId = nil
		self:Hide()
	end
end

function barProto:UNIT_PET(event, unit)
	return self:PLAYER_ENTERING_WORLD(self, event)
end

function barProto:UNIT_SPELLCAST_SENT(event, unit, spell)
	self.latency[spell] = nil
	self.latencyStart[spell] = GetTime()
end

function barProto:LatencyEnd(event, unit, spell)
	if self.latency then
		local start = self.latencyStart[spell]
		if start then
			self.latency[spell] = GetTime() - start
			self.latencyStart[spell] = nil
		end
	end
end

function barProto:UNIT_ENTERED_VEHICLE(event, unit)
	if unit == "player" then
		return self:PLAYER_ENTERING_WORLD(event)
	end
end
barProto.UNIT_EXITED_VEHICLE = barProto.UNIT_ENTERED_VEHICLE

local function noop() end
local function DisableBlizzardFrame(frame)
	frame.RegisterEvent = noop
	frame.Show = noop
	frame:UnregisterAllEvents()
	frame:Hide()
end

function barProto:OnEnable()
	local unit = GetActualUnit(self.realUnit)
	self.unit = unit

	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	if self.realUnit == 'player' or self.realUnit == 'pet' then
		self:RegisterUnitEvent("UNIT_ENTERED_VEHICLE", "player")
		self:RegisterUnitEvent("UNIT_EXITED_VEHICLE", "player")
	end

	self:RegisterUnitEvent("UNIT_SPELLCAST_START", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_DELAYED", unit)
	self:RegisterUnitEvent('UNIT_SPELLCAST_INTERRUPTIBLE', unit)
	self:RegisterUnitEvent('UNIT_SPELLCAST_NOT_INTERRUPTIBLE', unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_STOP", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_FAILED", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_FAILED_QUIET", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_INTERRUPTED", unit)

	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_UPDATE", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", unit)
	self:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_INTERRUPTED", unit)

	if self.latency then
		self:RegisterUnitEvent("UNIT_SPELLCAST_SENT", unit)
	end

	if unit == "target" then
		self.PLAYER_TARGET_CHANGED = self.PLAYER_ENTERING_WORLD
		self:RegisterEvent("PLAYER_TARGET_CHANGED")

	elseif unit == "focus" then
		self.PLAYER_FOCUS_CHANGED = self.PLAYER_ENTERING_WORLD
		self:RegisterEvent("PLAYER_FOCUS_CHANGED")

	elseif self.realUnit == "pet" then
		self:RegisterUnitEvent("UNIT_PET", "player")
	end

	if IsLoggedIn() then
		self:PLAYER_ENTERING_WORLD('OnEnable')
	end
end

function barProto:OnDisable()
	self:UnregisterAllEvents()
	self:Hide()
end

function AdiCastBar:SpawnCastBar(unit, width, height, from, anchor, to, xOffset, yOffset)
	local bar = setmetatable(CreateFrame("Frame", "AdiCastBar_"..unit, UIParent), barMeta)

	bar.unit, bar.realUnit = unit, unit

	local withLatency = false
	if unit == "player" then
		withLatency = true
		bar.latency = {}
		bar.latencyStart = {}
		DisableBlizzardFrame(CastingBarFrame)
	elseif unit == "target" then
		DisableBlizzardFrame(TargetFrameSpellBar)
	elseif unit == "focus" then
		DisableBlizzardFrame(FocusFrameSpellBar)
	elseif unit == "pet" then
		DisableBlizzardFrame(PetCastingBarFrame)
	end

	return bar:Initialize(unit, width, height, unit.." casting bar", from, anchor, to, xOffset, yOffset, withLatency)
end


local GetSpellCooldown = _G.GetSpellCooldown
local GetSpellInfo = _G.GetSpellInfo
local GetTime = _G.GetTime
local print = _G.print
local UnitClass = _G.UnitClass

local spellId = 61304 -- Global Cooldown

local GetTime = GetTime
local GetSpellCooldown = GetSpellCooldown

local gcdProto = setmetatable({}, AdiCastBar.abstractMeta)
local gcdMeta = { __index = gcdProto }
AdiCastBar.gcdProto = gcdProto

function gcdProto:UpdateTimer()
	local now = GetTime()
	if now >= self.endTime then
		self:Hide()
	end
	self.Spark:SetPoint("CENTER", self, "LEFT", (now - self.startTime) * self:GetWidth() / self.duration, 0)
end

function gcdProto:SPELL_UPDATE_COOLDOWN(event)
	local start, duration, enable = GetSpellCooldown(spellId)
	if enable == 1 and start and duration > 0 and duration <= 1.5 then
		self.startTime = start
		self.duration = duration
		self.endTime = start + duration

		self:Show()
	elseif duration == 0 then
		self:Hide()
	end
end

gcdProto.PLAYER_ENTERING_WORLD = gcdProto.SPELL_UPDATE_COOLDOWN

function gcdProto:OnEnable()
	if not spellId then return end
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('SPELL_UPDATE_COOLDOWN')
	self:Hide()
	if IsLoggedIn() then
		self:SPELL_UPDATE_COOLDOWN("OnEnable")
	end
end

function gcdProto:OnDisable()
	self:UnregisterAllEvents()
	self:Hide()
end

function AdiCastBar:SpawnGCDBar(width, height, from, anchor, to, xOffset, yOffset)
	local bar = setmetatable(CreateFrame("Frame", "AdiCastBar_GCD", UIParent), gcdMeta)
	bar:SetScript('OnUpdate', bar.UpdateTimer)
	return bar:Initialize("gcd", width, height, "Global cooldown", from, anchor, to, xOffset, yOffset)
end

--[[
AdiCast Bar - customized unit cast bars
(c) 2009-2014 Adirelle (adirelle@gmail.com)
All rights reserved.
--]]


local _G = _G
local CreateFrame = _G.CreateFrame
local pairs = _G.pairs
local SlashCmdList = _G.SlashCmdList
local UIParent = _G.UIParent

local BAR_BACKDROP = {
	bgFile = [[Interface\Tooltips\UI-Tooltip-Background]],
	tile = true,
	tileSize = 16,
}

local BORDER_SIZE = 1
local BORDER_BACKDROP = {
	edgeFile = [[Interface\Addons\_ShiGuang\Media\Modules\Raid\solid.blp]],
	edgeSize = BORDER_SIZE,
}

local BAR_TEXTURE = [[Interface\TargetingFrame\UI-StatusBar]]
local FONT_PATH, FONT_SIZE, FONT_FLAGS = GameFontWhite:GetFont()

local DEFAULT_LSM_FONT = "ABF"
local DEFAULT_LSM_STATUSBAR = "BantoBar"

local RegisterFont, RegisterTexture
do
	local function UpdateFont(fs)
		fs:SetFont(FONT_PATH, FONT_SIZE, FONT_FLAGS)
		fs:SetShadowColor(0,0,0,0.5)
		fs:SetShadowOffset(1, -1)
	end

	local function UpdateTexture(tex)
		return (tex.SetStatusBarTexture or tex.SetTexture)(tex, BAR_TEXTURE)
	end

	local lsm = LibStub('LibSharedMedia-3.0', true)
	if lsm then
		BAR_TEXTURE = lsm:Fetch("statusbar", DEFAULT_LSM_STATUSBAR, true) or BAR_TEXTURE
		FONT_PATH = lsm:Fetch("statusbar", DEFAULT_LSM_FONT, true) or FONT_PATH

		local function LibSharedMedia_SetGlobal(widget, event, media, value)
			if media == "statusbar" then
				BAR_TEXTURE = lsm:Fetch(media, value)
				UpdateTexture(widget)
			end
			if media == "font" then
				FONT_PATH = lsm:Fetch(media, value)
				UpdateFont(widget)
			end
		end

		function RegisterTexture(tex)
			UpdateTexture(tex)
			lsm.RegisterCallback(tex, 'LibSharedMedia_SetGlobal', LibSharedMedia_SetGlobal)
		end

		function RegisterFont(fs)
			UpdateFont(fs)
			lsm.RegisterCallback(fs, 'LibSharedMedia_SetGlobal', LibSharedMedia_SetGlobal)
		end
	else
		RegisterTexture = UpdateTexture
		RegisterFont = UpdateFont
	end
end

local function OnBarValuesChange(bar)
	if not bar:IsShown() then return end
	local current, width, min, max = bar:GetValue(), bar:GetWidth(), bar:GetMinMaxValues()
	local delay = bar:GetParent().delay
	if delay then
		bar.TimeText:SetFormattedText("|cffff0000%+.2f|r %.2f/%.2f", delay, current-min, max-min)
	else
		bar.TimeText:SetFormattedText("%.2f / %.2f", current-min, max-min)
	end
	bar.Spark:SetPoint("CENTER", bar, "LEFT", width * (current-min) / (max-min), 0)
end

function AdiCastBar.castBarProto:InitializeWidget(width, height, withLatency)
	self:SetBackdrop(BAR_BACKDROP)
	self:SetBackdropColor(0, 0, 0, 1)
	self:SetBackdropBorderColor(0, 0, 0, 0)

	local border = CreateFrame("Frame", nil, self)
	border:SetWidth(width+BORDER_SIZE*2)
	border:SetHeight(height+BORDER_SIZE*2)
	border:SetPoint("CENTER")
	--border:SetBackdrop(BORDER_BACKDROP)
	border:SetBackdropColor(0, 0, 0, 0)
	border:SetBackdropBorderColor(0, 0, 0, 1)
	self.Border = border

	local icon = self:CreateTexture(nil, "ARTWORK")
	icon:SetWidth(height + 11)
	icon:SetHeight(height + 11)
	icon:SetPoint("BOTTOMLEFT")
	icon:SetTexCoord(5/64, 59/64, 5/64, 59/64)
	self.Icon = icon

	local shield = border:CreateTexture(nil, "OVERLAY")
	local shieldSize = height*64/12
	shield:SetWidth(shieldSize)
	shield:SetHeight(shieldSize)
	shield:SetPoint("TOPLEFT", icon, "TOPLEFT", -6/64*shieldSize, 16/64*shieldSize)
	shield:SetTexture([[Interface\CastingBar\UI-CastingBar-Arena-Shield]])
	self.Shield = shield

	local bar = CreateFrame("StatusBar", nil, self)
	RegisterTexture(bar)
	bar:SetPoint("BOTTOMLEFT", icon, "BOTTOMRIGHT", 2, 0)
	bar:SetPoint("TOPRIGHT", self)
	bar:SetScript('OnMinMaxChanged', OnBarValuesChange)
	bar:SetScript('OnValueChanged', OnBarValuesChange)
	bar:SetScript('OnShow', OnBarValuesChange)
	bar:SetFrameLevel(border:GetFrameLevel()+1)
	self.Bar = bar

	if withLatency then
		local latency = bar:CreateTexture(nil, "OVERLAY")
		latency:SetTexture(0.5, 0, 0, 0.5)
		latency:SetBlendMode("BLEND")
		latency:SetHeight(height)
		self.Latency = latency
	end

	local timeText = bar:CreateFontString(nil, "OVERLAY")
	RegisterFont(timeText)
	timeText:SetPoint("TOPRIGHT", bar, -2, 9)
	timeText:SetPoint("BOTTOMRIGHT", bar, -2, 9)
	timeText:SetJustifyH("RIGHT")
	timeText:SetJustifyV("MIDDLE")
	bar.TimeText = timeText

	local text = bar:CreateFontString(nil, "OVERLAY")
	RegisterFont(text)
	text:SetPoint("TOPLEFT", bar, 2, 9)
	text:SetPoint("BOTTOMLEFT", bar, 2, 9)
	text:SetPoint("RIGHT", timeText, "LEFT", -2, 0)
	text:SetJustifyH("LEFT")
	text:SetJustifyV("MIDDLE")
	self.Text = text

	local spark = bar:CreateTexture(nil, "OVERLAY")
	spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])
	spark:SetBlendMode('ADD')
	spark:SetWidth(16)
	spark:SetHeight(height*2.2)
	bar.Spark = spark
end

function AdiCastBar.gcdProto:InitializeWidget(width, height)
	self:SetBackdrop(BAR_BACKDROP)
	self:SetBackdropColor(0,0,0,1)

	local spark = self:CreateTexture(nil, "OVERLAY")
	spark:SetTexture([[Interface\CastingBar\UI-CastingBar-Spark]])
	spark:SetBlendMode('ADD')
	spark:SetWidth(16)
	spark:SetHeight(height*2.2)
	self.Spark = spark
end

function AdiCastBar:SpawnAllBars()
	local player = self:SpawnCastBar('player', 280, 8, "BOTTOM", UIParent, "BOTTOM", 0, 215)
	self:SpawnGCDBar(260, 4, "BOTTOM", player, "TOP", 0, 10)
	self:SpawnCastBar('pet', 210, 15, "TOP", player, "BOTTOM", 0, -3)

	--local target = self:SpawnCastBar('target', 360, 21, "TOP", UIParent, "TOP", 0, -220)
	local target = self:SpawnCastBar('target', 310, 12, "TOP", UIParent, "CENTER", 0, -160)
	self:SpawnCastBar('focus', 250, 20, "BOTTOM", target, "TOP", 0, 3)
end
