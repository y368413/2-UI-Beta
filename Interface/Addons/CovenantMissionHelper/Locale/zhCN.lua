local ADDON_NAME, addon = ...

local L = LibStub("AceLocale-3.0"):NewLocale(ADDON_NAME, "zhCN", false)
if not L then return end

--Board.lua
L["|c0000FF33Round "] = "|c0000FF33回合 "
L['turn for index '] = 'turn for index '
L["targetableUnits -> "] = "目标单位 -> "
L["turn order -> "] = "turn 顺序 -> "
L["Spell: "] = "技能："
L["Effect: "] = "效果："
L[', TargetType: '] = ', 目标类型：'
L["targetIndexes -> "] = "目标索引 -> "
L['|cFFFF7700 %s kill %s |r'] = '|cFFFF7700 %s 杀死 %s |r'
L['. HP = '] = '。 生命值 = '
L["Units have random abilities. The mission isn't simulate automatically.\nClick on the button to check the result."] = "部队拥有随机能力，任务无法自动模拟。\n单击按钮确认模拟结果。"
L['LOST'] = '失去'
L['RECEIVED'] = 'RECEIVED'
L["|cFFFF0000Units have random abilities. Actual rest HP may not be the same as predicted|r\n"] = "|cFFFF0000部队拥有随机能力.。实际剩余生命可能与预测结果不同|r\n"
L["%sMy units:\n%s \n\nTOTAL %s HP = %s"] = "%s我的单位:\n%s \n\n总计 %s 生命值 = %s"
L['Add units on board'] = '添加伙伴以及部队'
L['|cFFFF0000More than %s rounds. Winner is undefined|r'] = '|cFFFF0000超过 %s 回合。胜利方无法确定。|r'
L['|cFF00FF00 Predicted result: WIN |r'] = '|cFF00FF00 预测结果：胜利 |r'
L['|cFFFF0000 Predicted result: LOSE |r'] = '|cFFFF0000 预测结果：失败 |r'
L['|cFFFF7700 Predicted result: WIN (~%s%%) |r'] = '|cFFFF7700 预测结果：胜利 (~%s%%) |r'

--CovenantMissionHelper.lua
L['Base XP'] = '基础经验值'
L[' XP\n+'] = ' 经验值\n+'
L['XP/hour'] = '经验值/小时'

--DataTables.lua
L["for spellID = 17 only"] = "来自 技能编号 = 17"
L["damage"] = "伤害"
L["heal"] = "治疗"
L["DoT"] = "持续伤害"
L["HoT"] = "持续治疗"
L["Taunt"] = "嘲讽"
L["Untargetable"] = "未命中"
L["Damage dealt multiplier"] = "造成伤害倍率"
L["Damage taken multiplier"] = "承受伤害倍率"
L["Reflect"] = "反伤"
L["Maximum health multiplier"] = "最大生命值倍率"
L["Additional damage dealt"] = "造成额外伤害"
L["Additional receive damage"] = "受到额外伤害"

--MissionHelperFrame.lua
L['Duration: '] = '需要时间: '
L['Offer time: '] = '过期时间: '

--UI.lua
L["Simulate mission 50 times to find approximate success rate"] = "模拟50次冒险战斗，以获得更准确的成功率。（部队拥有随机技能时可用）"
L['Simulate'] = '战斗模拟'
L["Change the order of your troops to minimize HP loss"] = "优化调整部队的站位,，可最大限度的减少生命值损失。"
L["It shuffles only units on board and doesn't consider others"] = "该操作只考虑指挥台上的部队，不考虑未上场部队。"
L["Addon doesn't support "] = "如果部队拥有随机技能，"
L['"Optimize" if units have random abilities'] = '则"优化站位"功能不可用'
L['Optimize'] = '优化站位'
L['Result'] = '冒险结果'
L['Combat log'] = '冒险记录'

--Unit.lua
L['Auto Attack'] = '自动攻击'
L['self buff. effect = %s, baseValue = %s, spellID = %s, source = %s '] = '自我增益。效果 = %s，基值 = %s，技能编号 = %s，来源 = %s '
L['target buff '] = '目标增益'
L['damage multiplier = '] = '伤害倍率 = '
L[' pos. multiplier = '] = ' pos.倍率 = '
L['additional damage = '] = '额外伤害 = '
L['|c%s%s %s %s for %s. (HP %s -> %s)|r'] = '|c%s%s %s %s 的 %s。(生命值 %s -> %s)|r'
L['|c%s%s %s %s for %s|r'] = '|c%s%s %s %s 的 %s|r'
L['apply '] = '使用 '
L['targetUnit = '] = '目标单位 = '
L[' buff effect = '] = ' 增益效果 = '
L[' duration = '] = ' 持续时间 = '
L[' period = '] = ' period = '
L['|c000088CC%s remove %s from %s|r'] = '|c000088CC%s 移除 %s 从 %s|r'
