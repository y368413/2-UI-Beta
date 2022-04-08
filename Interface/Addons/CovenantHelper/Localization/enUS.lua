local addonName, addon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)
if not L then return end

--L["dialog.introduction"] = "Function Introduction"
L["dialog.description"] = "When you switch covenants or specializations, your soulbind and equipmentset will be automatically set for you according to the preset content below."

L["dialog.enable"] = "Enable"
L["dialog.default"] = "Constant"

L["dialog.title.preset"] = "Preset"
L["dialog.title.soulbind"] = "Soul Bind"
L["dialog.title.equipmentset"] = "Equipment Set"

L["dialog.err.invaildconfig"] = "Invalid configuration."

L["dialog.err.invaildcovenant"] = "An error occurred while switching soulbind, Unable to obtain covenant information."
L["dialog.err.invaildsoulbind"] = "An error occurred while switching soulbind，Unable to obtain soulbind information."
L["dialog.err.changesoulbindfailed"] = "An error occurred while switching soulbind, switching failed!"
L["dialog.err.activatesoulbind"] = "You cannot switch soulbind in the current state."
L["dialog.activate.soulbind"] = "Currently active soulbind:"

L["dialog.err.useequipmentset"] = "An error occurred while switching equipmentset, Please check the system message."
L["dialog.err.invaildequipments"] = "An error occurred while switching the equipmentset，Unable to obtain equipmentset information."
L["dialog.err.changeequipmentsetfailed"] = "An error occurred while switching equipmentset, switching failed!"
L["dialog.err.cantuseequipments"] = "You cannot switch equipmentset in the current state."
L["dialog.activate.equipment"] = "Currently active equipment:"

L["dialog.tip.changeequipmentset"] = addonName .. "It has been detected that you have deleted a set of equipment. If it is your default configuration, please go to the custom settings to update the configuration in time to prevent errors!"

L["dialog.title.setting"] = "Settings"

L["dialog.title.font"] = "Text Settings"
L["dialog.font.name"] = "Text font"
L["dialog.font.outline"] = "Text effect"
L["dialog.font.size"] = "Text size"
L["dialog.font.shadow"] = "Shadow effect"

L["dialog.title.display"] = "Display Settings"
L["dialog.display.time"] = "Display time"
L["dialog.display.delay"] = "Delay time"

L["dialog.title.position"] = "Position Settings"
L["dialog.postion.xoffset"] = "X Offset"
L["dialog.postion.yoffset"] = "Y Offset"

L["dialog.title.test"] = "Display test text"
L["dialog.test.name"] = "Test name"

