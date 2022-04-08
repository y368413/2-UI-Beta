local addonName, addon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhCN")
if not L then return end

--L["dialog.introduction"] = "功能介绍"
L["dialog.description"] = "当您在切换盟约或专精时，将会根据下面预设的内容自动为您设置您的羁绊和配装方案。"

L["dialog.enable"] = "启用"
L["dialog.default"] = "保持不变"

L["dialog.title.preset"] = "预设"
L["dialog.title.soulbind"] = "灵魂羁绊"
L["dialog.title.equipmentset"] = "配装方案"

L["dialog.err.invaildconfig"] = "无效的配置文件。"
L["dialog.err.invaildcovenant"] = "切换羁绊时发生错误，无法获取盟约信息。"
L["dialog.err.invaildsoulbind"] = "切换羁绊时发生错误，无法获取羁绊信息。"
L["dialog.err.changesoulbindfailed"] = "切换羁绊时发生错误，切换失败！"
L["dialog.err.activatesoulbind"] = "当前状态下无法切换羁绊。"
L["dialog.activate.soulbind"] = "当前生效羁绊："

L["dialog.err.useequipmentset"] = "切换配装方案时发生错误！请查看系统提示。"
L["dialog.err.invaildequipments"] = "切换配装方案时发生错误，无法获取配装信息。"
L["dialog.err.changeequipmentsetfailed"] = "切换配装方案时发生错误，切换失败！"
L["dialog.err.cantuseequipments"] = "当前状态下无法切换配装方案。"
L["dialog.activate.equipment"] = "当前生效配装："

L["dialog.tip.changeequipmentset"] = addonName .. "检测到您删除了一套配装方案。如果它是您的预设配置，请您及时前往自定义设置中更新配置，防止出错！"

L["dialog.title.setting"] = "设置"

L["dialog.title.font"] = "文字设置"
L["dialog.font.name"] = "字体"
L["dialog.font.outline"] = "文字效果"
L["dialog.font.size"] = "文字大小"
L["dialog.font.shadow"] = "阴影效果"

L["dialog.title.display"] = "显示设置"
L["dialog.display.time"] = "显示时间"
L["dialog.display.delay"] = "延迟时间"

L["dialog.title.position"] = "位置设置"
L["dialog.postion.xoffset"] = "X 偏移"
L["dialog.postion.yoffset"] = "Y 偏移"

L["dialog.title.test"] = "显示测试文本"
L["dialog.test.name"] = "测试名称"

--[[
L["dialog.contact"] = "在使用中有任何问题可以在 NGA回复 或 游戏内联系 非酋克星-遗忘海岸"
]]