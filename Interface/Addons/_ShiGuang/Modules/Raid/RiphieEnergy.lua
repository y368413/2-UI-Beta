local M, R, U, I = unpack(select(2, ...))

local EnergyBar = CreateFrame("StatusBar", "EnergyBar", M.UIParent)
EnergyBar:SetHeight(8)
EnergyBar:SetWidth(285)
M.CreateSBC(EnergyBar, true)
EnergyBar:SetPoint("CENTER", 0, -195)	
EnergyBar:SetStatusBarColor(246/255, 222/255, 32/255, 1)    --黄红渐变
    --mana       = {   0/255, 190/255, 230/255, 1 },  --天蓝色
    --rage       = {  65/255,  65/255,  65/255, 1 },  --暗紫色
    --focus      = { 230/255, 140/255,  60/255, 1 },  --深红色
    --maelstrom  = {   0/255, 127/255, 255/255, 1 },  --深蓝色
EnergyBar.Count = M.CreateFS(EnergyBar, 16, "")
EnergyBar.Count:ClearAllPoints()
EnergyBar.Count:SetPoint("LEFT", EnergyBar, "LEFT", 8, 6)

EnergyBar:SetScript("OnUpdate", function(self, elapsed)
if not MaoRUISettingDB["Misc"]["nPower"] then self:UnregisterAllEvents() EnergyBar:Hide() return end
  local maxPower = UnitPowerMax("player", UnitPowerType("player"))
  if maxPower == 1000 then maxPower = maxPower / 10 end  -- hack to fix vengeance dh pain
  if maxPower == 10000 then maxPower = maxPower / 100 end  -- hack to fix shadow priest insanity
  if (select(2, UnitClass("player")) == "WARRIOR" and GetSpecialization() == 1) or (select(2, UnitClass("player")) == "Druid" and GetSpecialization() == 1) then maxPower = 130 end
  self:SetMinMaxValues(0, maxPower)
  self:SetValue(UnitPower("player"))
  M.SmoothBar(EnergyBar)
end)

EnergyBar:RegisterEvent("PLAYER_ENTERING_WORLD")
EnergyBar:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
EnergyBar:RegisterEvent("UNIT_AURA")
EnergyBar:RegisterEvent("UNIT_POWER")
EnergyBar:RegisterEvent("UNIT_POWER_FREQUENT")
EnergyBar:SetScript("OnEvent", function(self, event, ...)
if not MaoRUISettingDB["Misc"]["nPower"] then self:UnregisterAllEvents() return end
  EnergyBar.Count:SetText(M.Numb(UnitPower("player")))
end)
