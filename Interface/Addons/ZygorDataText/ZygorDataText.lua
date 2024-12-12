local addOnName, addOn = ...

local ZGVAddOn = ZygorGuidesViewer
local ZGVName = ZGV.L["name_plain"]

local function DataTextClicked(clickedFrame, button)

	if ZGVAddOn.Config.Running or ZGVAddOn.Tutorial.Running then
		return end
		
	ZGVAddOn:ToggleFrame()
	
end

LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject(ZGVName, {
	type = "launcher",
	icon = "Interface\\AddOns\\" .. tostring(ZGVAddOn) .. "\\Skins\\zglogo_single",
	OnClick = DataTextClicked,
	text = (Broker2FuBar) and ZGVName or nil, -- only for fubar, not for ldb
	label = ZGVName,
})
