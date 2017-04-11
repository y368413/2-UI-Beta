local M, R, U, I = unpack(select(2, ...))
--[[OmniCC Basic A featureless, 'pure' version of OmniCC.--]]
--OmniCC = true                               -- hack to work around detection from other addons for OmniCC

local round = function(x)  return math.floor(x + 0.5)  end
 -- stops the timer
local function Timer_Stop(self)
    self.enabled = nil
    self:Hide()
end
 -- forces the given timer to update on the next frame
local function Timer_ForceUpdate(self)
    self.nextUpdate = 0
    self:Show()
end
 -- adjust font size whenever the timer's parent size changes, hide if it gets too tiny
local function Timer_OnSizeChanged(self, width, height)
    local fontScale = round(width) / 36
    if (fontScale == self.fontScale) then return end
    self.fontScale = fontScale
    if (fontScale < 0.5) then self:Hide()
    else
        self.text:SetFont(STANDARD_TEXT_FONT, fontScale * 16, 'OUTLINE')
        self.text:SetShadowColor(0, 0, 0, 0.5)
        self.text:SetShadowOffset(2, -2)
        if (self.enabled) then
            Timer_ForceUpdate(self)
        end
    end
end
 -- update timer text, if it needs to be, hide the timer if done
local function Timer_OnUpdate(self, elapsed)
    if (self.nextUpdate > 0) then
        self.nextUpdate = self.nextUpdate - elapsed
    else
        local remain = self.duration - (GetTime() - self.start)
        if (round(remain) > 0) then
            local time, nextUpdate = M.FormatTime(remain)
            self.text:SetText(time)
            self.nextUpdate = nextUpdate
        else
            Timer_Stop(self)
        end
    end
end
  -- returns a new timer object
local function Timer_Create(self)
    local scaler = CreateFrame('Frame', nil, self)
    scaler:SetAllPoints(self)
    local timer = CreateFrame('Frame', nil, scaler)
    timer:Hide()
    timer:SetAllPoints(scaler)
    timer:SetScript('OnUpdate', Timer_OnUpdate)
    local text = timer:CreateFontString(nil, 'BACKGROUND ')
    text:SetPoint('CENTER', 2, 0)
    text:SetJustifyH("CENTER")
    timer.text = text
    Timer_OnSizeChanged(timer, scaler:GetSize())
    scaler:SetScript('OnSizeChanged', function(self, ...) 
        Timer_OnSizeChanged(timer, ...) 
    end)
    self.timer = timer
    return timer
end
local function Timer_Start(self, start, duration)
    if not MaoRUISettingDB["Misc"]["OmniCC"] then return end
    if (start > 0 and duration > 2.5) then
        local timer = self.timer or Timer_Create(self)
        timer.start = start
        timer.duration = duration
        timer.enabled = true
        timer.nextUpdate = 0
        if (timer.fontScale >= 0.5) then timer:Show() end
    else
        local timer = self.timer 
        if (timer) then Timer_Stop(timer) end
    end
end
hooksecurefunc(getmetatable(ActionButton1Cooldown).__index, 'SetCooldown', Timer_Start)

local active = {}
local hooked = {}
local function Cooldown_OnShow(self) active[self] = true end
local function Cooldown_OnHide(self) active[self] = nil end
local function Cooldown_ShouldUpdateTimer(self, start, duration)
	local timer = self.timer
	if not timer then return true end
	return timer.start ~= start
end
local function Cooldown_Update(self)
	local button = self:GetParent()
	local start, duration, enable = GetActionCooldown(button.action)
	if Cooldown_ShouldUpdateTimer(self, start, duration) then
		Timer_Start(self, start, duration)
	end
end
local EventWatcher = CreateFrame('Frame')
EventWatcher:Hide()
EventWatcher:SetScript('OnEvent', function(self, event)
	for cooldown in pairs(active) do
		Cooldown_Update(cooldown)
	end
end)
EventWatcher:RegisterEvent('ACTIONBAR_UPDATE_COOLDOWN')
local function ActionButton_Register(frame)
	local cooldown = frame.cooldown
	if not hooked[cooldown] then
		cooldown:HookScript('OnShow', Cooldown_OnShow)
		cooldown:HookScript('OnHide', Cooldown_OnHide)
		hooked[cooldown] = true
	end
end
if _G['ActionBarButtonEventsFrame'].frames then
	for i, frame in pairs(_G['ActionBarButtonEventsFrame'].frames) do
		ActionButton_Register(frame)
	end
end
hooksecurefunc('ActionBarButtonEventsFrame_RegisterFrame', ActionButton_Register)