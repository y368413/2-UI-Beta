if select(2, UnitClass("player")) ~= "WARRIOR" then return end

local Angerbar = {}

local Angerbar_sounds = {
["BadPress"] = "Sound\\Spells\\SimonGame_Visual_BadPress.wav",
["Sonar"] = "Interface\\Addons\\Angerbar\\Sounds\\Sonar.ogg",
["BagFull"] = "Interface\\AddOns\\Angerbar\\Sounds\\BagFull.ogg",
["Beep"] = "Interface\\AddOns\\Angerbar\\Sounds\\Beep.ogg",
["Dadongda"] = "Interface\\AddOns\\Angerbar\\Sounds\\Dadongda.ogg",
["Legendary"] = "Interface\\AddOns\\Angerbar\\Sounds\\Legendary.ogg",
["QuestNotifier"] = "Interface\\AddOns\\Angerbar\\Sounds\\QuestNotifier.ogg",
["Whisper"] = "Interface\\AddOns\\Angerbar\\Sounds\\Whisper.ogg",
}

local function createslider(parent, name, value, min, max, step, ...)
local slider = CreateFrame("Slider", "Angerbar "..value.." Option", parent, "OptionsSliderTemplate")
slider.value = value
slider:SetWidth(200)
slider:SetHeight(15)
slider:SetPoint(...)
_G[slider:GetName()..'Low']:SetText(min)
_G[slider:GetName()..'Low']:ClearAllPoints()
_G[slider:GetName()..'Low']:SetPoint("RIGHT", slider, "LEFT", 10, 0)
_G[slider:GetName()..'High']:SetText(max)
_G[slider:GetName()..'High']:ClearAllPoints()
_G[slider:GetName()..'High']:SetPoint("LEFT", slider, "RIGHT", -10, 0)
_G[slider:GetName()..'Text']:ClearAllPoints()
_G[slider:GetName()..'Text']:SetPoint("BOTTOM", slider, "TOP", 0, 3)
_G[slider:GetName()..'Text']:SetFontObject(GameFontHighlight)
BlizzardOptionsPanel_Slider_Enable(slider)
slider:SetMinMaxValues(min, max)
slider:SetValueStep(step)
slider:SetScript("OnEvent", function(self)
_G[slider:GetName()..'Text']:SetText(name.." |cFF00FFFF"..AngerDB[self.value].."|r")
self:SetValue(AngerDB[self.value])
end)
slider:RegisterEvent("PLAYER_LOGIN")
slider:SetScript("OnShow", function(self)
_G[slider:GetName()..'Text']:SetText(name.." |cFF00FFFF"..AngerDB[self.value].."|r")
self:SetValue(AngerDB[self.value]) 
end)
slider:SetScript("OnValueChanged", function(self, getvalue)
   if not self._onsetting then   -- is single threaded 
     self._onsetting = true
     self:SetValue(self:GetValue())
     getvalue = self:GetValue()     -- cant use original 'value' parameter
     self._onsetting = false
   else return end               -- ignore recursion for actual event handler
_G[slider:GetName()..'Text']:SetText(name.." |cFF00FFFF"..AngerDB[self.value].."|r")
AngerDB[self.value] = math.floor(getvalue)
end)
return slider
end

local function createcheckbutton(parent, name, value, ...)
local bu = CreateFrame("CheckButton", "Angerbar"..value, parent, "InterfaceOptionsCheckButtonTemplate")
bu:SetPoint(...)
bu.value = value
bu.text = bu:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
bu.text:SetText(name)
bu.text:SetPoint("LEFT", bu, "RIGHT", 5, 1)
bu.text:SetJustifyH("LEFT")
bu:SetScript("OnEvent", function(self) self:SetChecked(AngerDB[self.value]) end)
bu:RegisterEvent("PLAYER_LOGIN")
bu:SetScript("OnShow", function(self) self:SetChecked(AngerDB[self.value]) end)
bu:SetScript("OnClick", function(self) AngerDB[self.value] = self:GetChecked() or false end)
return bu
end

local function createradiobuttongroup(parent,name, value, group, ...)
local frame = CreateFrame("Frame", "Angerbar"..value.."RadioButtonGroup", parent)
frame:SetPoint(...)
frame:SetSize(150, 30)

for k, v in pairs(group) do
frame[k] = CreateFrame("CheckButton", "Angerbar"..value..k.."RadioButtonGroup", frame, "UIRadioButtonTemplate")

_G[frame[k]:GetName() .. "Text"]:SetText(v)

frame[k]:SetScript("OnEvent", function(self) 
self:SetChecked(AngerDB[value] == k) 
end)
frame[k]:RegisterEvent("PLAYER_LOGIN")

frame[k]:SetScript("OnShow", function(self)
self:SetChecked(AngerDB[value] == k)
end)

frame[k]:SetScript("OnClick", function(self)
if self:GetChecked() then 
AngerDB[value] = k
else
self:SetChecked(true)
end
end)
end

for k, v in pairs(group) do
frame[k]:HookScript("OnClick", function(self)
if AngerDB[value] == k then
for key, value in pairs(group) do
if key ~= k then
frame[key]:SetChecked(false)
end
end
end
end)
end

frame.name = frame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
frame.name:SetText(name)

local buttons = {frame:GetChildren()}
for i = 1, #buttons do
if i == 1 then
buttons[i]:SetPoint("LEFT", 5, 0)
else
buttons[i]:SetPoint("LEFT", _G[buttons[i-1]:GetName() .. "Text"], "RIGHT", 5, 0)
end
if i == #buttons then
frame.name:SetPoint("LEFT", _G[buttons[i]:GetName() .. "Text"], "RIGHT", 10, 1)
end
end

return frame
end
--====================================================--
--[[                   -- GUI --                    ]]--
--====================================================--
local GUI = CreateFrame("Frame", "Angerbar_GUI", UIParent)
GUI.name = ("|cff02F78E[职业]|r怒气条")
InterfaceOptions_AddCategory(GUI)

GUI.title = GUI:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
GUI.title:SetPoint("TOPLEFT", 15, -20)
GUI.title:SetText("|cff02F78E[职业]|r怒气条")

GUI.line = GUI:CreateTexture(nil, "ARTWORK")
GUI.line:SetSize(600, 1)
GUI.line:SetPoint("TOP", 0, -50)
GUI.line:SetTexture(1, 1, 1, .2)

Angerbar.combatlock = createcheckbutton(GUI, "战斗中锁定", "combatlock", "TOPLEFT", 30, -95)
Angerbar.heightoption = createslider(GUI, "宽度", "height", 5, 25, 5, "TOPLEFT", 30, -135)
Angerbar.widthoption = createslider(GUI, "长度", "width", 100, 500, 10, "TOPLEFT", 30, -175)

Angerbar.orientationgroup = {
["HORIZONTAL"] = "水平",
["VERTICAL"] = "垂直",
}
Angerbar.orientationoption = createradiobuttongroup(GUI, "方向", "orientation", Angerbar.orientationgroup, "TOPLEFT", 30, -205)

Angerbar.fontsizeoption = createslider(GUI, "字体大小", "fontsize", 10, 25, 1, "TOPLEFT", 30, -255)
Angerbar.limitoption = createslider(GUI, "变色阈值", "limit", 1, 120, 1, "TOPLEFT", 30, -295)
Angerbar.glowoption = createslider(GUI, "警报阈值", "glowlimit", 1, 120, 1, "TOPLEFT", 30, -335)
GUI.glow = createcheckbutton(GUI, "满怒发光", "glow", "TOPLEFT", 30, -375)
GUI.sound = createcheckbutton(GUI, "满怒音效", "sound", "TOPLEFT", 30, -405)

GUI.soundfile = CreateFrame("Frame", "Angerbar Soundfile DropDown", GUI, "UIDropDownMenuTemplate")
GUI.soundfile:SetPoint("TOPLEFT", GUI, "TOPLEFT", 200, -402)

UIDropDownMenu_SetWidth(GUI.soundfile, 150)
UIDropDownMenu_SetText(GUI.soundfile, "")

--====================================================--
--[[                   -- DB Init --                ]]--
--====================================================--

local default_Settings = {
combatlock = true,
height = 6,
width = 210,
orientation = "HORIZONTAL",
fontsize = 15,
limit = 70,
glowlimit = 100,
sound = true,
glow = true,
soundfile = "Sonar",
}

local eventframe = CreateFrame("Frame")
eventframe:RegisterEvent("ADDON_LOADED")
eventframe:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

function eventframe:ADDON_LOADED(arg1)
if arg1 ~= "Angerbar" then return end

if AngerDB == nil then AngerDB = {} end

for k, v in pairs(default_Settings) do if AngerDB[k] == nil then AngerDB[k] = v end end

UIDropDownMenu_Initialize(GUI.soundfile, function(self, level, menuList)
local info = UIDropDownMenu_CreateInfo()
for name, file in pairs(Angerbar_sounds) do
info.text = name
info.checked = function() return (AngerDB["soundfile"] == name) end
info.func = function(self)
AngerDB["soundfile"] = name
PlaySoundFile(file, "Master")
UIDropDownMenu_SetSelectedName(GUI.soundfile, name, true)
UIDropDownMenu_SetText(GUI.soundfile, name)
CloseDropDownMenus()
end
UIDropDownMenu_AddButton(info)
end
end)

UIDropDownMenu_SetSelectedName(GUI.soundfile, AngerDB["soundfile"], true)
UIDropDownMenu_SetText(GUI.soundfile, AngerDB["soundfile"])
end

---------------------------------------------------------------------------
--[[                                APIs                               ]]--
---------------------------------------------------------------------------
local function CreateBorder(parent, r, g, b, a, size, br, bg, bb, ba)
local sd = CreateFrame("Frame", nil, parent, "BackdropTemplate")
sd:SetFrameLevel(parent:GetFrameLevel()-1)
sd:SetBackdrop({
bgFile = "Interface\\Buttons\\WHITE8x8",
edgeFile = "Interface\\AddOns\\Angerbar\\Tex\\glowTex",
edgeSize = size,
insets = {
left = size,
right = size,
top = size,
bottom = size,
}
})
sd:SetPoint("TOPLEFT", parent, -size, size)
sd:SetPoint("BOTTOMRIGHT", parent, size, -size)
sd:SetBackdropColor(r, g, b, a or 0.6)
sd:SetBackdropBorderColor(br, bg, bb, ba or 0.6)

parent.sd = sd
end

local createStatusbar = function(parent, name, tex, layer, height, width, r, g, b, alpha)
    local bar = CreateFrame("StatusBar", name, parent)
    bar:SetHeight(height)
    bar:SetWidth(width)
    bar:SetStatusBarTexture(tex, layer)
    bar:SetStatusBarColor(r, g, b, alpha)
    return bar
end

---------------------------------------------------------------------------
--[[                            Rage Bar                               ]]--
---------------------------------------------------------------------------

local ragebar = createStatusbar(UIParent, "Angerbar_Ragebar", "Interface\\Buttons\\WHITE8x8", "ARTWORK", 6, 300, 1, 0, 0, 1)
ragebar:SetPoint("CENTER", UIParent, "CENTER", 0, -130)
ragebar:SetMinMaxValues(0, 1)
CreateBorder(ragebar, .5, .25, .05, .8, 5, 0, 0, 0)

for k, v in pairs(Angerbar.orientationgroup) do
Angerbar.orientationoption[k]:HookScript("OnClick", function(self)
ragebar:SetOrientation(AngerDB["orientation"])
if AngerDB["orientation"] == "HORIZONTAL" then
ragebar:SetSize(AngerDB["width"], AngerDB["height"])
else
ragebar:SetSize(AngerDB["height"], AngerDB["width"])
end
end)
end

Angerbar.heightoption:HookScript("OnValueChanged", function()
if AngerDB["orientation"] == "HORIZONTAL" then
ragebar:SetHeight(AngerDB["height"])
else
ragebar:SetWidth(AngerDB["height"])
end
end)
Angerbar.widthoption:HookScript("OnValueChanged", function()
if AngerDB["orientation"] == "HORIZONTAL" then
ragebar:SetWidth(AngerDB["width"])
else
ragebar:SetHeight(AngerDB["width"])
end
end)

ragebar.value = ragebar:CreateFontString(nil, "ARTWORK")
ragebar.value:SetFont(GameFontHighlight:GetFont(), 12, "OUTLINE")
ragebar.value:SetPoint("CENTER")
ragebar.value:SetText(0)

Angerbar.fontsizeoption:HookScript("OnValueChanged", function() ragebar.value:SetFont(GameFontHighlight:GetFont(), AngerDB["fontsize"], "OUTLINE") end)

ragebar:RegisterForDrag("LeftButton")
ragebar:SetScript("OnDragStart", function(self)
if not InCombatLockdown() then
self:StartMoving()
elseif not AngerDB["combatlock"] then
self:StartMoving()
end
end)
ragebar:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
ragebar:SetClampedToScreen(true)
ragebar:SetMovable(true)
ragebar:SetUserPlaced(true)
ragebar:EnableMouse(true)

local flash_frame = CreateFrame("Frame", nil, ragebar)
flash_frame:SetAllPoints(ragebar)
flash_frame:Hide()

CreateBorder(flash_frame, 1, 0, 0, .5, 10, 1, 0, 0, 1)

flash_frame.timer = 1
flash_frame:SetScript("OnUpdate", function(self, elapsed)
self.timer = self.timer - elapsed
if self.timer > .5 and self.timer <= 1 then
self:SetAlpha((1-self.timer)/.5)
elseif self.timer > 0 and self.timer <= .5 then
self:SetAlpha(self.timer/.5)
elseif self.timer <= 0 then
self.timer = 1
end
end)

local sound_frame = CreateFrame("Frame", nil, ragebar)
sound_frame:Hide()

sound_frame.timer = 0
sound_frame:SetScript("OnUpdate", function(self, elapsed)
self.timer = self.timer - elapsed
if self.timer <= 0 then
PlaySoundFile(Angerbar_sounds[AngerDB["soundfile"]], "Master")
self.timer = 2
end
end)

local function Update()
ragebar:SetValue(UnitPower("player")/UnitPowerMax("player"))
ragebar.value:SetText(UnitPower("player"))

if UnitPower("player") < AngerDB["limit"] then
ragebar.value:SetTextColor(1, 1, 1)
ragebar:SetStatusBarColor(1, 1, 0)
else
ragebar.value:SetTextColor(1, 1, 0)
ragebar:SetStatusBarColor(1, 0, 0)
end

if UnitPower("player") < AngerDB["glowlimit"] then
flash_frame:Hide()
sound_frame:Hide()
else
if AngerDB["glow"] then 
flash_frame:Show()
else
flash_frame:Hide()
end
if AngerDB["sound"] then
sound_frame:Show()
else
sound_frame:Hide()
end
end
end

Angerbar.limitoption:HookScript("OnValueChanged", Update)
Angerbar.glowoption:HookScript("OnValueChanged", Update)

ragebar:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

function ragebar:PLAYER_ENTERING_WORLD()
ragebar:UnregisterEvent("PLAYER_ENTERING_WORLD")
ragebar:SetOrientation(AngerDB["orientation"])
if AngerDB["orientation"] == "HORIZONTAL" then
ragebar:SetSize(AngerDB["width"], AngerDB["height"])
else
ragebar:SetSize(AngerDB["height"], AngerDB["width"])
end
ragebar.value:SetFont(GameFontHighlight:GetFont(), AngerDB["fontsize"], "OUTLINE")

Update()
end

function ragebar:UNIT_POWER_FREQUENT(arg1)
if arg1 == "player" then
Update()
end
end

ragebar:RegisterEvent("UNIT_POWER_FREQUENT")
ragebar:RegisterEvent("PLAYER_ENTERING_WORLD")