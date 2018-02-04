-- ## Author: Gello## Version: 1.0.7

local FlyoutBindings=CreateFrame("Button",nil,SpellFlyout,"SecureHandlerShowHideTemplate")
FlyoutBindings:SetAttribute("_onshow",[[
	for i=1,10 do
		self:SetBindingClick(false,i<10 and tostring(i) or "0","SpellFlyoutButton"..i)
	end
]])
FlyoutBindings:SetAttribute("_onhide",[[
	self:ClearBindings()
]])
SpellFlyout:HookScript("OnShow",function()
  local i=1
  while _G["SpellFlyoutButton"..i] and i<=10 do
    _G["SpellFlyoutButton"..i.."HotKey"]:SetText(i<10 and i or 0)
    i=i+1
  end
end)
