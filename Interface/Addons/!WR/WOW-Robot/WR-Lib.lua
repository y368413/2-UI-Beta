--作者微信:WOW-Robot(转载请保留,感谢!)
WR_AddonVersion = "20250119"	-- 插件版本(请不要乱改版本号)
WR_CreateMacroButtonIsOK="|T".."Interface\\AddOns\\!WR\\Color\\WOW-Robot.tga"..":18:18:0:0:64:64:0:64:0:64|t "..C_AddOns.GetAddOnMetadata("!WR", "Title").."：|cffff94af"..WR_AddonVersion.."|cffffffff 加载完毕，|r|cff0cbd0c微信|r：|cffffdf00WOW-Robot|r"	--初始化公告

if not IsSpellInRange then
    IsSpellInRange = C_Spell.IsSpellInRange
end

if not GetSpellLink then
    GetSpellLink = C_Spell.GetSpellLink
end

if not IsUsableSpell then
    IsUsableSpell = C_Spell.IsSpellUsable
end

if not GetSpellInfo then
    GetSpellInfo = function(spellID)
        if not spellID then
            return nil
        end

        local spellInfo = C_Spell.GetSpellInfo(spellID)
        if spellInfo then
            return spellInfo.name, nil, spellInfo.iconID, spellInfo.castTime, spellInfo.minRange, spellInfo.maxRange, spellInfo.spellID, spellInfo.originalIconID
        end
    end
end

if not GetSpellCooldown then
    GetSpellCooldown = function(spellID)
        local spellCooldownInfo = C_Spell.GetSpellCooldown(spellID)
        if spellCooldownInfo then
            return spellCooldownInfo.startTime, spellCooldownInfo.duration, spellCooldownInfo.isEnabled, spellCooldownInfo.modRate
        end
    end
end


PartyRange={}	--小队队友距离
RiadRange={}	--团队队友距离
PartyLostHealth={}	--小队队友损失血量
RiadLostHealth={}	--团队队友损失血量
PlayerLostHealth=0	--自己损失血量


--高危险 尖刺型AOE法术 (需要开大减伤)
DangerOutburstAoe={
	[1]="灵魂爆发",[2]="吞噬践踏",[3]="强风箭",[4]="地狱烈火",[5]="绝对零度",[6]="飞翼打击",[7]="猛烈突变",[8]="奥术裂隙",[9]="爆发苏醒",[10]="风暴狂怒",
	[11]="鸣裂颠覆",[12]="紊流",[13]="兽性怒吼",[14]="腐朽之力",[15]="极寒冰冻",[16]="坚石碎片",[17]="灼热齐射",[18]="炽焰波峰",[19]="",[20]="",
}

--高危险 持续型AOE法术 (需要开大减伤)
DangerSustainedAoe={
	[1]="电能风暴",[2]="风暴之眼",[3]="冰霜过载",[4]="符文烙印",[5]=376727,[6]="",[7]="",[8]="",[9]="",[10]="",
}

--高危险 点名Debuff名称 (需要大减伤的) (包含持续型Debuff)
DangerDebuff={
	[1]="静电充能",[2]="法力炸弹",[3]="强风箭",[4]="闪电链",[5]="粉碎之握",[6]="梦魇爆发",[7]="蚀刻",[8]="黑暗冲锋",[9]="压抑深渊",[10]="弱肉强食",
	[11]="污浊轰击",[12]="烈焰震击",[13]="梦魇毒素",[14]="毁灭痛苦",[15]="根绝冲击",[16]="腐蚀",[17]="时光凋零",[18]="灵魂燃烧",[19]="提尔之火",[20]="弹射之盾",
	[21]="钢铁之矛",[22]="活动炸弹",[23]="羁石诅咒",[24]="能量过载",[25]="地狱火之核",[26]="闪电打击",[27]="能量炸弹",[28]="一枪毙命",[29]="",[30]="",
	[31]="",[32]="",[33]="",[34]="",[35]="",[36]="",[37]="",[38]="",[39]="",[40]="",
}

--高危险 对我施法,主要是某些可以打断的读条,但是没人打断用来防御的 (需要开大减伤)
DangerSpellToMe={
	[1]="风暴之箭",[2]="雷霆打击",[3]="大地之箭",[4]="静电之矛",[5]="深重呕吐",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--协助点名Debuff名称(需要协助他人开小减伤或套盾套恢复之类的)
AssistDebuffName={
	[1]="静电充能",[2]="静电之矛",[3]="强风箭",[4]="闪电链",[5]="粉碎之握",[6]="梦魇爆发",[7]="蚀刻",[8]="黑暗冲锋",[9]="压抑深渊",[10]="弱肉强食",
	[11]="污浊轰击",[12]="烈焰震击",[13]="梦魇毒素",[14]="毁灭痛苦",[15]="根绝冲击",[16]="腐蚀",[17]="时光凋零",[18]="灵魂燃烧",[19]="提尔之火",[20]="弹射之盾",
	[21]="钢铁之矛",[22]="活动炸弹",[23]="羁石诅咒",[24]="能量过载",[25]="地狱火之核",[26]="闪电打击",[27]="能量炸弹",[28]="法力炸弹",[29]="大地碎片",[30]="岩浆焚火",
	[31]="霜风",[32]="寒冰灭绝者",[33]="吞噬",[34]="燃烧锁链",[35]="巨龙打击",[36]="灼热齐射",[37]="熔火真金",[38]="皲皮",[39]="折磨射线",[40]="迸发虫茧",
	[41]="虚空奔袭",[42]="一枪毙命",[43]="折磨喷发",[44]="虚空感染",[45]="白骨剥离",[46]="排干体液",[47]="炽烈弹射",[48]=451395,[49]="感染",[50]="晦影腐朽",
	[51]="疑之影",[52]="腐蚀",[53]="熵能诅咒",[54]="纱雾撕裂",[55]="虚空腐蚀",[56]="腐败之水",[57]="折磨光束",[58]="深渊轰击",[59]="深渊朽烂",[60]="深渊腐蚀",
	[61]="排斥",[62]="冷血弑君",[63]="女王之灾",[64]="培植毒药",[65]="钢刃之歌",[66]="",[67]="",[68]="",[69]="",[70]="",
	[71]="",[72]="",[73]="",[74]="",[75]="",[76]="",[77]="",[78]="",[79]="",[80]="",
	[81]="",[82]="",[83]="",[84]="",[85]="",[86]="",[87]="",[88]="",[89]="",[90]="",
	[91]="",[92]="",[93]="",[94]="",[95]="",[96]="",[97]="",[98]="",[99]="",[100]="",
}

--尖刺型AOE法术
OutburstAoe={
	[1]="爆发苏醒",[2]="吞噬践踏",[3]="虚空脉冲",[4]="黑暗之蚀",[5]="奥术裂隙",[6]="坚石碎片",[7]="强风箭",[8]="绝对零度",[9]="毁灭溢出",[10]="痛苦尖啸",
	[11]="暗影箭雨",[12]="地狱烈火",[13]="阻断暴雨",[14]="勇气号角",[15]="兽性怒吼",[16]="岩石冲击",[17]="鸣裂颠覆",[18]="大地裂击",[19]="震耳尖啸",[20]="图腾过载",
	[21]="注能爆尘",[22]="腐化涟漪",[23]="黏稠黑暗",[24]="紊流",[25]="猛烈突变",[26]="风暴狂怒",[27]="震耳咆哮",[28]="溃烂收割",[29]="腐朽之力",[30]="歼灭之翼",
	[31]="幽暗焚烧",[32]="暗影与烈焰",[33]="轰鸣咆哮",[34]="灾难猛击",[35]="充能挥斩",[36]="烧灼猛击",[37]="冲击波",[38]="毁灭践踏",[39]="回响裂隙",[40]="深影歼灭",
	[41]="冷冽摧残",[42]="撼地猛击",[43]="极寒冰冻",[44]="飞翼打击",[45]="动荡融合",[46]="疯狂怒吼",[47]="天启梦魇",[48]="上古辉光",[49]="裂地打击",[50]="灵魂爆发",
	[51]="大地践踏",[52]="碎裂之土",[53]="大地咆哮",[54]="腐烂震波",[55]="污浊轰击",[56]="巨灵猛击",[57]="恐惧精华",[58]="毒性喷涌",[59]="晦影湮灭",[60]="碾压脏腑",
	[61]="火焰之地洪焰",[62]="滚桶冲锋",[63]="碎魂",[64]="灼热齐射",[65]="熔岩觉醒",[66]="野蛮猛击",[67]="大地破裂",[68]="巨岩碾压",[69]="熵能清算",[70]="震地",
	[71]="解体",[72]="碾压重击",[73]="炽焰波峰",[74]="命令咆哮",[75]=269266,[76]="酸性新星",[77]="暮光打击",[78]="震颤猛击",[79]="",[80]="",
	[81]="",[82]="",[83]="",[84]="",[85]="",[86]="",[87]="",[88]="",[89]="",[90]="",
	[91]="",[92]="",[93]="",[94]="",[95]="",[96]="",[97]="",[98]="",[99]="",[100]="",
}

--尖刺型Debuff
OutburstDebuff={
	[1]="活动炸弹",[2]="爆裂电流",[3]="毁灭之触",[4]="法力炸弹",[5]="积雷充能",[6]="爆裂法印",[7]=197556,[8]="震地",[9]="强风箭",[10]="腐蚀旋涡",
	[11]="驱逐之光",[12]="闪电打击",[13]="静电充能",[14]="晦暗爆破",[15]="炽燃暮光",[16]="暗影之缚",[17]="时光爆发",[18]="不稳定的灰烬",[19]="钢铁之矛",[20]="能量过载",
	[21]="闪电链",[22]="粉碎之握",[23]="梦魇爆发",[24]="蚀刻",[25]="黑暗冲锋",[26]="压抑深渊",[27]="弱肉强食",[28]="污浊轰击",[29]="羁石诅咒",[30]="梦魇毒素",
	[31]="毁灭痛苦",[32]="弹射之盾",[33]="提尔之火",[34]="灵魂燃烧",[35]="时光凋零",[36]="根绝冲击",[37]="鸣裂颠覆",[38]="能量炸弹",[39]="冰霜炸弹",[40]="排斥",
	[41]="泛沫毒素",[42]="",[43]="",[44]="",[45]="",[46]="",[47]="",[48]="",[49]="",[50]="",
}

--队友炸团的尖刺型Debuff
PartyOutburstDebuff={
	[1]="静电充能",[2]="滚雷",[3]="末日迫近",[4]="时光凋零",[5]="不稳定的灰烬",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--尖刺型点名施法读条
OutburstCasting={
	[1]="邪炽冲刺",[2]="邪恶短匕",[3]="闪电链",[4]="肩部猛击",[5]="熔岩喷洒",[6]="恶臭吐息",[7]="艾泽里特填装弹",[8]="弹射之盾",[9]="钢铁之矛",[10]="屠戮标记",
	[11]="深重呕吐",[12]="排斥",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--持续型AOE法术
SustainedAoe={
	[1]="旋风",[2]="飓风龙翼",[3]="切割漩涡",[4]="冰霜过载",[5]="黑暗之星的低语",[6]="死尸之息",[7]="电能风暴",[8]="折磨标记",[9]="压迫能量",[10]="闪电风暴",
	[11]="压制蛙鸣",[12]="风暴之眼",[13]="凡尘之羁",[14]="电荷涌动",[15]="剧毒废气",[16]="风暴狂怒",[17]="束地之矛",[18]="岩浆护盾",[19]="倒转时光流",[20]="熔炉之力",
	[21]="白热风暴",[22]="岩浆护盾",[23]="发脾气",[24]="深暗回响",[25]="烁光之涌",[26]="地震术",[27]="不稳定的灰烬",[28]="狂伤",[29]="剧烈爆发",[30]="鲜血灌注",
	[31]="灵魂收割",[32]="无尽怒火",[33]="大地奔涌",[34]="灾劫湮灭",[35]="永恒腐化",[36]="聚焦风暴",[37]="焰烬之箭齐射",[38]="奔流之怒",[39]="地壤之怒",[40]="崩岩轰击",
	[41]="炎蛇怒焰",[42]="地狱怒火",[43]="膨胀",[44]="拥抱圣光",[45]=376727,[46]="愤怒鞭笞",[47]="侵蚀喷涌",[48]="凶残践踏",[49]="喧神教化",[50]="虚空风暴",
	[51]="铸造利斧",[52]="铸造利剑",[53]="铸造战锤",[54]="虚空爆发",[55]="晦影腐朽",[56]="巢穴的召唤",[57]="黑暗脉动",[58]="排放口",[59]="虚空涌动",[60]="佐尔拉姆斯之怒",
	[61]="虚空释能",[62]="培植毒药",[63]="喑星之夜",[64]="",[65]="",[66]="",[67]="",[68]="",[69]="",[70]="",
	[71]="",[72]="",[73]="",[74]="",[75]="",[76]="",[77]="",[78]="",[79]="",[80]="",
	[81]="",[82]="",[83]="",[84]="",[85]="",[86]="",[87]="",[88]="",[89]="",[90]="",
	[91]="",[92]="",[93]="",[94]="",[95]="",[96]="",[97]="",[98]="",[99]="",[100]="",
}

--训练木桩的名字
TrainingName={
	[1]="训练假人",[2]="顺劈训练假人",[3]="地下城训练假人",[4]="团队副本训练假人",[5]="普通坦克假人",[6]="活化的格斗家",[7]="石拳",[8]="测试假人",[9]="PvP训练假人",[10]="海象人训练假人",
	[11]="黑龙的挑战假人",[12]="芜菁沙袋",[13]="结实的爱情娃娃",[14]="橡胶鱼头",[15]="学徒的训练假人",[16]="新兵的训练假人",[17]="黑锋骑士的训练假人",[18]="大领主的复仇之神训练假人",[19]="精兵的训练假人",[20]="藻拳",
	[21]="水晶之喉",[22]="",[23]="",[24]="",[25]="",[26]="",[27]="",[28]="",[29]="",[30]="",
}

--战斗目标的名字
InCombatName={
	[1]="训练假人",[2]="顺劈训练假人",[3]="地下城训练假人",[4]="团队副本训练假人",[5]="普通坦克假人",[6]="活化的格斗家",[7]="石拳",[8]="被亵渎的幽灵",[9]="狂乱之魂",[10]="龙裔幻象",
	[11]="爆炸物",[12]="诺库德风暴法师",[13]="硬化的水晶",[14]="爆裂水晶",[15]="饥饿的鞭笞者",[16]="诺库德破坏者",[17]="仪式枯骨",[18]="复生图腾",[19]="海象人训练假人",[20]="芜菁沙袋",
	[21]="黑龙的挑战假人",[22]="结实的爱情娃娃",[23]="橡胶鱼头",[24]="血工",[25]="佐尔拉姆斯虹吸者",[26]="水晶碎片",[27]="",[28]="",[29]="",[30]="",
}

--持续型的Debuff
SustainedDebuff={
	[1]="滚雷",[2]="末日迫近",[3]="地狱火之核",[4]="电能鞭笞",[5]="污染迷雾",[6]="静电充能",[7]="冰冷冲击",[8]="投掷火炬",[9]="符文烙印",[10]="灵魂撕裂",
	[11]="寒冰灭绝者",[12]="传导印记",[13]="觉醒之土",[14]="撼地突袭",[15]="熔浆喷发",[16]="熔渣喷发",[17]="岩浆焚火",[18]="狂伤",[19]="白骨箭",[20]="焦灼血肉",
	[21]="不稳定的灰烬",[22]="冲击波",[23]="散射炸弹",[24]="岩浆喷发",[25]="密闭射线",[26]="大地碎片",[27]="嗜血成性",[28]="冷冽摧残",[29]="龙骨之斧",[30]="极地之风",
	[31]="时光爆发",[32]="弱化",[33]="可控燃烧",[34]="皲皮",[35]="贪婪之虫",[36]="虚空奔袭",[37]="炽烈弹射",[38]="深渊腐蚀",[39]="冷血弑君",[40]="女王之灾",
	[41]="钢刃之歌",[42]="",[43]="",[44]="",[45]="",[46]="",[47]="",[48]="",[49]="",[50]="",
}

--敌人身上的buff带来的持续性伤害
SustainedBuff={
	[1]="龙巢看护者之怒",[2]="熔火血脉",[3]="强烈燃烧",[4]="炉铸之怒",[5]="炽燃聚焦",[6]="震地之能",[7]="燃火外衣",[8]="通灵爆发",[9]="震地之能",[10]="晶化",
	[11]="警示尖鸣",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--会持续性尸爆的敌人名称
NecroblastName={
	[1]="次级煞魔",[2]="畸形煞魔",[3]="地渊孢林蜱虫",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--假死影遁规避 技能施法
EscapeSpellName={
	[1]="压抑深渊",[2]="腐蚀灌体",[3]="根绝冲击",[4]="灵魂操控",[5]="锯齿荨麻",[6]="静电之矛",[7]="炽焰护盾",[8]="钻地冲击",[9]="相位之刃",[10]="",
}

--假死隐遁规避 Debuff
EscapeDebuffName={
	[1]="蚀刻",[2]="追踪",[3]="弱肉强食",[4]="根绝冲击",[5]="静电之矛",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--无敌BUFF名称
InvincibleBuffName={
	[1]="灵魂护甲",[2]="铁树皮盾",[3]="符文结界",[4]="虚空之盾",[5]="浪潮汹涌",[6]="培植毁灭",[7]="生命结界",[8]="冰川护盾",[9]="烧蚀屏障",[10]="神圣屏障",
	[11]="烧灼屏障",[12]="封印强化",[13]="爆裂护盾",[14]="不屑一顾",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--需要给解除定身束缚的Debuff
BindName={
	[1]="眩晕酒桶",[2]="捕鼠陷阱",[3]="静电缠握",[4]="通灵之霜",[5]="寒冰束缚",[6]="抓钩诱捕",[7]="旋风之盾",[8]="疾病之咬",[9]="腐朽根须",[10]="熔火隐没",
	[11]="纠缠之根",[12]="奥术锁定",[13]="时光渗陷",[14]="晶化裂口",[15]="密闭射线",[16]="缠绕",[17]="极寒冰冻",[18]="纠缠根须",[19]="冰川融聚",[20]=383974,
	[21]=396124,[22]="蜂蜜齐射",[23]="灼烧之根",[24]="黏性新星",[25]="蛛网箭",[26]="木棘缠绕",[27]="熔铁之水",[28]="裹体之网",[29]="粘性之网",[30]="群体缠绕",
	[31]="勒握斩击",[32]="晦幽纺纱",[33]="抓握之血",[34]=439829,[35]="",[36]="",[37]="",[38]="",[39]="",[40]="",
	[41]="",[42]="",[43]="",[44]="",[45]="",[46]="",[47]="",[48]="",[49]="",[50]="",
}	--

--预防定身的法术施法 群体AOE
YuFangDingShenSpell={
	[1]="晶化裂口",[2]="奥术锁定",[3]="极寒冰冻",[4]="黏性新星",[5]="晦幽纺纱",[6]="流丝之墓",[7]="",[8]="",[9]="",[10]="",
}

--预防定身的法术施法 对 某个单位
YuFangDingShenSpellToUnit={
	[1]="冻结之缚",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--单体的名字
SingleUnitName={
	[1]="诺库德破坏者",[2]="爆炸物",[3]="仪式枯骨",[4]="被亵渎的幽灵",[5]="狂乱之魂",[6]="腐朽图腾",[7]="坠天新星",[8]="吟腐图腾",[9]="妖诡图腾",[10]="不羁畸变怪",
	[11]="腐爆图腾",[12]="宝库守卫",[13]="托萨克",[14]="路德维希·冯·托尔托伦",[15]="狂怒余烬",[16]="哈兰·斯威提",[17]="虫语虔信者",[18]="嚎叫雕像",[19]="熔火焦皮",[20]="大宰相埃尔坦",
	[21]="血面兽",[22]="女巫布里亚",[23]="女巫马拉迪",[24]="女巫索林娜",[25]="石拳",[26]="活化的格斗家",[27]="普通坦克假人",[28]="团队副本训练假人",[29]="PvP训练假人",[30]="地下城训练假人",
	[31]="灵魂荆棘",[32]="复生图腾",[33]="米罗克",[34]="灵魂荆棘",[35]="魂缚巨像",[36]="爆地图腾",[37]="藻拳",[38]="水晶之喉",[39]="外科医生缝肉",[40]="唤雾者",
	[41]="幻影克隆体",[42]="斯卡莫拉克",[43]="水晶碎片",[44]="攻城恐魔",[45]="攫握恐魔",[46]="英格拉·马洛克",[47]="宗主奥法兰",[48]="虚空大使",[49]="",[50]="",
}

--不要切目标的单位名称
DontTabUnitName={
	[1]="诺库德破坏者",[2]="爆炸物",[3]="仪式枯骨",[4]="被亵渎的幽灵",[5]="狂乱之魂",[6]="腐朽图腾",[7]="坠天新星",[8]="吟腐图腾",[9]="妖诡图腾",[10]="不羁畸变怪",
	[11]="腐爆图腾",[12]="宝库守卫",[13]="托萨克",[14]="路德维希·冯·托尔托伦",[15]="狂怒余烬",[16]="哈兰·斯威提",[17]="虫语虔信者",[18]="嚎叫雕像",[19]="熔火焦皮",[20]="大宰相埃尔坦",
	[21]="血面兽",[22]="灵魂荆棘",[23]="注能者萨莉亚",[24]="硬化的水晶",[25]="爆裂水晶",[26]="龙裔影像",[27]="肠击",[28]="撼地图腾",[29]="爆地图腾",[30]="",
}

--不要上DOT的单位名称
DontDotUnitName={
	[1]="坠天新星",[2]="腐爆图腾",[3]="宝库守卫",[4]="撼地图腾",[5]="狂怒余烬",[6]="幻影仙狐",[7]="复生的法师",[8]="",[9]="",[10]="",
}

--高危驱散的Debuff
DangerRemoveDebuff={
    [1]="虚无之触",[2]="投掷火炬",[3]="传导打击",[4]="雷霆打击",[5]="古怪生长",[6]="包围之风",[7]="风暴猛击",[8]="翔龙猛袭",[9]="飞扑烈焰",[10]="昏呆独白",
    [11]="暗言术：虚",[12]="乏味的讲课",[13]="寒冰束缚",[14]="毁灭之触",[15]="静电缠握",[16]="腐朽感官",[17]="呼啸劲风",[18]="浸油之刃",[19]="灼烧酷热",[20]="绽放",
	[21]="时光爆发",[22]="烈焰震击",[23]="腐烂之触",[24]="寿命斩割",[25]="绝望",[26]="溃烂割裂",[27]="魔魂撕咬",[28]="染疾之魂",[29]="剧毒之魂",[30]="诅咒之魂",
	[31]="",[32]="",[33]="",[34]="",[35]="",[36]="",[37]="",[38]="",[39]="",[40]="",
}

--不要驱散的DEBUFF
HuLueQuSanDebuffName={
	[1]="能量过载",[2]="无限迫压",[3]="能量炸弹",[4]="压制瘴气",[5]="爆裂",[6]="奥术裂隙",[7]="恶性病原体",[8]="寒冰箭",[9]="冰霜震击",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--会打断施法的技能
StopCastID={
	[1]="阻断暴雨",[2]="震耳尖啸",[3]="挫志嚎叫",[4]="痛苦尖啸",[5]="蛮横怒吼",[6]="扰乱吼叫",[7]="震耳咆哮",[8]="不谐冲击",[9]="音速尖啸",[10]="",
    [11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--激怒BUFF
EnragedBuffName={
	[1]="激怒",[2]="鲁莽狂怒",[3]="狂怒风暴",[4]="集结氏族",[5]="怒火族亲",[6]="鲁莽战术",[7]=451040,[8]="粗暴",[9]="战略家之怒",[10]="战斗狂啸",
    [11]="邪恶狂乱",[12]="异能嗜血",[13]="沸腾怒气",[14]="瓦解怒吼",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--必须打断的单位名称
MustInterruptUnitName={
    [1]="纳兹夏尔冰霜女巫",[2]="纳兹夏尔女士",[3]="代言人夏多克朗",[4]="纳祖达",[5]="佐尔拉姆斯守门人",[6]="长者织影",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}
--必须打断的技能
MustInterruptSpellName={
	--[千丝之城]
	--1流丝缠缚 2扭曲思绪 3阴织冲击 4愈合之网 5虚空之波 6苏醒召唤
    [1]=443430,[2]=443433,[3]=442536,[4]=452162,[5]=446086,[6]=0,[7]=443427,[8]=0,[9]=0,[10]=0,
	--[回响之城]
	--1流丝束缚 2恶臭齐射 3毒液箭雨 4共振弹幕 5惊惧尖鸣
	[11]=442210,[12]=448248,[13]=433841,[14]=434793,[15]=434802,[16]=0,[17]=0,[18]=0,[19]=0,[20]="抓握之血",
	--[围攻伯拉勒斯]
	--1强化怒吼 2窒息之水 3防水甲壳 4恶臭喷吐 5盐渍飞弹
	[21]=275826,[22]=272571,[23]=256957,[24]=454440,[25]=257063,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,
	--[通灵战潮]
	--1排干体液 2淤液喷洒 3寒冰箭雨 4刺耳尖啸 5接骨 6修复血肉
	[31]=334748,[32]=338353,[33]=328667,[34]=324293,[35]=335143,[36]=327130,[37]=0,[38]=0,[39]=0,[40]="衰弱",
	--[塞兹仙林的迷雾]
	--1吞噬 2灵魂之箭 3拍手手 4收割精魂 5再生鼓舞 6木棘外壳 7滋养森林 8模拟抗性 9灵魂之箭
	[41]=322450,[42]=323057,[43]=321828,[44]=322938,[45]=340544,[46]=324776,[47]=324914,[48]=326046,[49]=322767,[50]=0,
	--[格瑞姆巴托]
	--1暗影烈焰箭 2剧烈震颤 3灼烧心智 4暗影烈焰笼罩 5暗影烈焰箭
	[51]=447966,[52]=451871,[53]=76711,[54]=451224,[55]=76369,[56]=0,[57]=0,[58]=0,[59]=0,[60]=0,
	--[矶石宝库]
	--1熔铁之水 2愈合金属 3咆哮恐惧 4穿透哀嚎 5虚空感染 6噤声齿轮 7合金箭矢
	[61]=430097,[62]=429109,[63]=449455,[64]=445207,[65]=426308,[66]=429545,[67]=429110,[68]=0,[69]=0,[70]=0,
	--[破晨号]
	--1酸蚀喷发 2折磨射线 3诱捕暗影 4深渊嗥叫 5暗影屏障 6凝结黑暗
	[71]=449734,[72]=431333,[73]=431309,[74]=450756,[75]=432520,[76]=452099,[77]=0,[78]=0,[79]=0,[80]=0,
}
--不打断的技能
ExcludeSpell={
	--1最终交易 2寒冰箭 3水箭
    [1]=320822,[2]=333602,[3]=272581,[4]=0,[5]=0,[6]=0,[7]=0,[8]=0,[9]=0,[10]=0,
	[11]=0,[12]=0,[13]=0,[14]=0,[15]=0,[16]=0,[17]=0,[18]=0,[19]=0,[20]=0,
}

--坦克反射的法术
TankReflection={
    --1灵魂分裂 2心能挥砍 3吐疫 4暗影爪击 5火成岩锤 6黑耀光束 7恐惧猛击 8恐惧猛击(小怪) 9熔岩之拳 10暗影烈焰斩
    [1]=322557,[2]=463217,[3]=333479,[4]=459210,[5]=428711,[6]=453212,[7]=427001,[8]=451117,[9]=451971,[10]=451241,
	--11熔火乱舞 12碾碎 13压制 14虚空奔袭 15溢流猛击 16霜凝匕首 17汰劣程序 18溢流猛击 19暗影突击 20艾泽里特炸药
	[11]=449444,[12]=450100,[13]=434722,[14]=451222,[15]=461842,[16]=440468,[17]=439646,[18]=461989,[19]=431637,[20]=454438,
	--21三重撕咬 22腐烂伤口 23剧毒打击
	[21]=340289,[22]=272588,[23]=443397,[24]=0,[25]=0,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,
}

--坦克反射的AOE法术
TankReflectionAOE={
    --1晦幽纺纱 2晦幽纺纱(小怪) 3大地破裂 4晦暗之风 5虚空释能 6黑耀光束 7激流破奔 8熵能清算 9侵蚀喷涌 10酸性新星 
    [1]=438860,[2]=446717,[3]=424879,[4]=451939,[5]=423324,[6]=453212,[7]=257882,[8]=427852,[9]=448888,[10]=460092,
	--11吞噬 12噬体烈焰 13毒性喷吐 14 15 16 17 18 19 20 
	[11]=322450,[12]=448105,[13]=434137,[14]=0,[15]=0,[16]=0,[17]=0,[18]=0,[19]=0,[20]=0,
}

--反射的AOE法术
ReflectionAOE={
	[1]="毒性污秽",[2]="时光渗陷",[3]="极寒冰冻",[4]="冷冽摧残",[5]="深影歼灭",[6]="回响裂隙",[7]="冲击波",[8]="烧灼猛击",[9]="充能挥斩",[10]="轰鸣咆哮",
	[11]="炽热流星",[12]="幽暗焚烧",[13]="腐朽之力",[14]="歼灭之翼",[15]="腐化涟漪",[16]="图腾过载",[17]="震耳尖啸",[18]="大地裂击",[19]="鸣裂颠覆",[20]="岩石冲击",
	[21]="溃烂收割",[22]="风暴狂怒",[23]="猛烈突变",[24]="紊流",[25]="碎裂",[26]="阻断暴雨",[27]="坚石碎片",[28]="奥术裂隙",[29]="黑暗之蚀",[30]="吞噬践踏",
	[31]="爆发苏醒",[32]="暗影箭雨",[33]="痛苦尖啸",[34]="毁灭溢出",[35]="绝对零度",[36]="强风箭",[37]="虚空脉冲",[38]="地狱烈火",[39]="束地之矛",[40]="灼热轰击",
	[41]="寒冰镰刀",[42]="晦影腐朽",[43]="酸性新星",[44]="捻接",[45]="炽烈弹射",[46]="激流破奔",[47]="熔铁之水",[48]="晦幽纺纱",[49]="",[50]="",
}

--不反射的法术
NotReflection={
	[1]="射击",[2]="喷发",[3]="弧形打击",[4]="涌动",[5]="电能风暴",[6]="能量涌动",[7]="致死打击",[8]="腐烂之风",[9]="恐怖怒吼",[10]="快速射击",
	[11]="灾灭之矛",[12]="暴烈冲锋",[13]="撕裂猛击",[14]="野蛮打击",[15]="狂怒风暴",[16]="石雹",[17]="时光加速",[18]="时光利刃",[19]="永恒宝珠",[20]="倒转时光流",
	[21]="采掘冲击",[22]="毁灭猛击",[23]="召唤灼烧元素",[24]="燃炎野心",[25]="地狱烈火",[26]="雷霆一击",[27]="闪电风暴",[28]="风暴猛击",[29]="烈焰喷溅",[30]="挫志怒吼",
	[31]="秘法蒸汽",[32]="狂野喷发",[33]="奥术之怒",[34]="奥术重击",[35]="破冰者",[36]="能量无常",[37]="召唤龙裔影像",[38]="奥术顺劈",[39]="肩部猛击",[40]="兽性怒吼",
	[41]="冰霜炸弹",[42]="尖刺甲壳",[43]="匕首投掷",[44]="投石",[45]="雷霆震击",[46]="锯齿撕咬",[47]="顺劈斩",[48]="毁灭践踏",[49]="音速爆裂",[50]="不稳定的灰烬",
	[51]="血腥啃噬",[52]="狰狞蔑笑",[53]="恶毒爪击",[54]="狂伤",[55]="剑刃风暴",[56]="爆炸之种",[57]="裂树击",[58]="风暴斩击",[59]="致命狂风",[60]="驱除闯入者",
	[61]="啄击",[62]="阵风",[63]="鸟群之唤",[64]="狂野啄击",[65]="断体猛击",[66]="裂隙之息",[67]="奥术驱除",[68]="力量真空",[69]="岩石飞弹",[70]="钢铁弹幕",
	[71]="暴雨",[72]="长矛乱舞",[73]="爆裂狂风",[74]="电荷涌动",[75]="虹吸能量",[76]="元素集中",[77]="西风的召唤",[78]="压制蛙鸣",[79]="剧毒废气",[80]="海洋吐息",
	[81]="冰川涌动",[82]="迅捷洪流",[83]="沸腾之怒",[84]="液态屏障",[85]="风暴狂怒",[86]="注能液滴",[87]="紊流",[88]="能量过载",[89]="眩晕",[90]="回旋之怒",
	[91]="滚石",[92]="魔网幼苗",[93]="尖鸣",[94]="禁断知识",[95]="归零践踏",[96]="痛苦哀嚎",[97]="召唤原始雷云",[98]="喷溅",[99]="纠缠凝视",[100]="恶意啄击",
	[101]="震荡打击",[102]="狂怒发作",[103]="大猫小憩",[104]="金色屏障",[105]="疑之焰",[106]="残阳西沉踢",[107]="扫堂腿",[108]="穿刺之角",[109]="撕裂",[110]="诸神黄昏",
	[111]="狂野之剑",[112]="设防",[113]="压制打击",[114]="充能之击",[115]="充能站",[116]="封印魔法",[117]="发送信号",[118]="共鸣挥砍",[119]="奥术锁定",[120]="庄严静夜合剂",
	[121]="游移余烬",[122]="眼球风暴",[123]="邪能引爆",[124]="凶暴",[125]="重压跳跃",[126]="震荡波",[127]="痛苦尖啸",[128]="剑刃旋风",[129]="末日迫近",[130]="地狱喷发",
	[131]="强烈燃烧",[132]="枯萎灵魂",[133]="暗影箭雨",[134]="切割漩涡",[135]="穿刺风暴",[136]="剑刃奔涌",[137]="迅捷之风",[138]="咒法屏障",[139]="法术冰霜吐息",[140]="变迁之风",
	[141]="封印魔法",[142]="吸取魔力",[143]="灼热凝视",[144]="领地展示",[145]="召唤煞",[146]="青龙猛袭",[147]="激励",[148]="星界旋风",[149]="凶恶猛扑",[150]="邪恶伏击",
	[151]="压制狂风",[152]="震耳尖啸",[153]="奥术裂隙",[154]="法力炸弹",[155]="恶性病原体",[156]="分枝",[157]="星界吐息",[158]="暗影愈合",[159]="惊扰亡魂",[160]="骨疽爆裂",
	[161]="身体碾压",[162]="死尸之息",[163]="虚空脉冲",[164]="虚空爆发",[165]="怨毒",[166]="法力虚空",[167]="能量炸弹",[168]="灵魂窃取",[169]="恶臭喷吐",[170]="猎人印记",
	[171]="召唤狂风",[172]="风暴之盾",[173]="风暴",[174]="闪电打击",[175]="沉重挥砍",[176]="亡者鸣唱",[177]="幽魂飞跃",[178]="残杀",[179]="劈地者",[180]="雷霆打击",
	[181]="强力一击",[182]="充能脉冲",[183]="连环爆裂",[184]="致死劈砍",[185]="穿甲",[186]="风暴之眼",[187]="圣洁庇护",[188]="低沉践踏",[189]="掠食飞扑",[190]="乱爪狂扫",
	[191]="挫志嚎叫",[192]="召唤先祖",[193]="邪炽冲刺",[194]="获得护盾！",[195]="诸神黄昏",[196]="击碎长枪",[197]="明光风暴",[198]="符文烙印",[199]="腐化涟漪",[200]="溅射",
	[201]="穿刺",[202]="亵渎咆哮",[203]="粉碎灵魂",[204]="湮灭箭雨",[205]="放血扫击",[206]="震地猛击",[207]="泰坦之拳",[208]="熔火隐没",[209]="肚腹猛击",[210]="狼吞虎咽",
	[211]="舒心海潮",[212]="浪潮分裂",[213]="剧毒陷阱",[214]="尖啸",[215]="屠戮标记",[216]="野蛮冲撞",[217]="妖诡图腾",[218]="强效治疗湍流",[219]="召唤鞭笞者",[220]="召唤图腾",
	[221]="践踏",[222]="缠绕之藤",[223]="藤蔓鞭挞",[224]="猛烈旋风",[225]="野性爪击",[226]="嗜血冲锋",[227]="血腥之怒",[228]="白骨箭",[229]="骨箭乱射",[230]="重殴",
	[231]="主人的召唤",[232]="投掷肉类",[233]="一枪毙命",[234]="诱捕陷阱",[235]="召唤土狼",[236]="腾跃",[237]="减速撕咬",[238]="腐爆图腾",[239]="腐朽打击",[240]="残暴猛击",
	[241]="鲁莽狂怒",[242]="疾病之咬",[243]="噬咬",[244]="狂野顺劈",[245]="沉重之箭",[246]="战船掠夺！",[247]="弹射之盾",[248]="撼地图腾",[249]="嗜血",[250]="大地碎片",
	[251]="严酷",[252]="共鸣宝珠",[253]="泰坦强化",[254]="大地结界",[255]="飞扑",[256]="壁垒猛击",[257]="熔火屏障",[258]="熔火军团",[259]="束缚之矛",[260]="掷骨",
	[261]="愈合泥土",[262]="巨龙打击",[263]="水晶尖刺",[264]="岩浆护盾",[265]="残忍打击",[266]="熔火之心",[267]="穿刺骨髓",[268]="龙骨之斧",[269]="回荡猛击",[270]="炽热挥舞",
	[271]="穿刺碎片",[272]="暴怒打击",[273]="碾碎",[274]="碎地",[275]="山崩",[276]="碎石",[277]="蛆虫呼唤",[278]="焦皮",[279]="燃烧之恨",[280]="锯齿圆盘",
	[281]="束缚",[282]="狂乱",[283]="碎裂",[284]="尖刺之舌",[285]="吞噬",[286]="反手猛击",[287]="震耳咆哮",[288]="利刃哀鸣",[289]="治疗药膏",[290]="复苏之酒",
	[291]="决斗冲刺",[292]="捕鼠陷阱",[293]="盲目怒火",[294]="利刃弹幕",[295]="“蕉”燥狂攻",[296]="飞刃投掷",[297]="重填装弹",[298]="砸桶",[299]="信风活力",[300]="投掷巨石",
	[301]="重新武装",[302]="狂鲨飓风",[303]="痛苦的激励",[304]="注铅骰子：全体听令！",[305]="回旋锋匕",[306]="注铅骰子：战舰",[307]="湿滑肥皂",[308]="战吼",[309]="鲜血收割",[310]="狂野顺劈斩",
	[311]="带钩长矛",[312]="黑暗复苏",[313]="抓钩诱捕",[314]="戈霍恩之赐",[315]="音速尖啸",[316]="嗜血成性",[317]="邪恶狂暴",[318]="召唤灵魂汲取图腾",[319]="血之镜像",[320]="蔓延腐化",
	[321]="喋血盛筵",[322]="冲锋",[323]="颠覆",[324]="强效治疗术",[325]="过载接地场",[326]="撼地猛击",[327]="鼓舞",[328]="治疗之泉",[329]="雾气形态",[330]="静电缠握",
	[331]="谜云卫护",[332]="风暴边缘",[333]="召唤风暴",[334]="山崩",[335]="熔岩波",[336]="岩浆雕刻",[337]="震荡跃击",[338]="虚空风暴",[339]="无常碾压",[340]="不稳定尖刺",
	[341]="地震波",[342]="粉碎突袭",[343]="震地",[344]="大地破裂",[345]="震地猛击",[346]="虚空释能",[347]="回收",[348]="激活通风系统",[349]="熔岩排放",[350]="重盾奔袭",
	[351]="巨岩碾压",[352]="花岗岩爆发",[353]="飞刀投掷",[354]="黏稠黑暗",[355]="晦影腐朽",[356]="暗黑法球",[357]="活化暗影",[358]="恶臭气体",[359]="嚼碎",[360]="寒冰碎片",
	[361]="彗星风暴",[362]="黑暗放逐",[363]="毁伤",[364]="最终收割",[365]="缝针",[366]="唤醒造物",[367]="毒雾",[368]="防腐剂",[369]="劈肉",[370]="病态凝视",
	[371]="肉钩",[372]="暴捶",[373]="内脏切割",[374]="切肉飞刀",[375]="投掷血肉",[376]="分离血肉",[377]="脊锤重压",[378]="白骨爪击",[379]="修复血肉",[380]="暗影之井",
	[381]="白骨剥离",[382]="恐怖顺劈",[383]="碎骨之盾",[384]="接骨",[385]="最终交易",[386]="",[387]="",[388]="",[389]="",[390]="",
	[391]="",[392]="",[393]="",[394]="",[395]="",[396]="",[397]="",[398]="",[399]="",[400]="",
}

--需要击晕的单位名称
StunUnitName={
	[1]="被亵渎的幽灵",[2]="诺库德破坏者",[3]="暮色卫队哨兵",[4]="狂怒余烬",[5]="铁潮掷弹兵",[6]="黄金之灵",[7]="大手大脚的仆从",[8]="食腐蛆虫",[9]="幻影仙狐",[10]="",
}

--不需要击晕的单位名称
DontStunUnitName={
	[1]="注能者萨莉亚",[2]="拜荒雷兽",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--需要击晕的钢条 读条施法
StunCastName={
	[1]="扫堂腿",[2]="大地裂击",[3]="奥术之雨",[4]="星界旋风",[5]="低沉践踏",[6]="集结氏族",[7]="石雹",[8]="驱逐",[9]="催眠",[10]="紊流",
	[11]="烈焰之舞",[12]="金色屏障",[13]="游移余烬",[14]="震荡打击",[15]="通灵喷发",[16]="岩浆焚火",[17]="眼球风暴",[18]="抑制装置",[19]="元素集中",[20]="致死劈砍",
	[21]="拉响警报",[22]="不稳定气流",[23]="慢性毒菌",[24]="恶毒爪击",[25]="联结之风",[26]="酸性水滴",[27]="舒心海潮",[28]="迸发挤压",[29]="致命变形",[30]="激励",
	[31]="腐化胆汁",[32]="鲁莽狂怒",[33]="战鼓",[34]="盲目怒火",[35]="抓钩诱捕",[36]="焦皮",[37]="炽燃暗影烈焰",[38]="龙骨之斧",[39]="魂能壁垒",[40]="死亡棱镜",
	[41]="箭雨",[42]="暴戾突袭",[43]="鲜血变身",[44]="侵蚀齐射",[45]="利刃之舞",[46]="大吃一惊！",[47]="消化不良",[48]="不稳定",[49]="窒息藤蔓",[50]="治疗之水",
	[51]="治疗波",[52]="邦桑迪的帷幕",[53]="灌电千兆冲击",[54]="火箭弹齐射",[55]="折磨之眼",[56]="秘法冲击",[57]="羁石诅咒",[58]="星宇飞升",[59]="音速爆裂",[60]="秘法蒸汽",
	[61]="风暴",[62]="钢刃之歌",[63]="防御",[64]="预警尖鸣",[65]="吸取光明",[66]="白骨剥离",[67]="",[68]="",[69]="",[70]="",
	[71]="",[72]="",[73]="",[74]="",[75]="",[76]="",[77]="",[78]="",[79]="",[80]="",
	[81]="",[82]="",[83]="",[84]="",[85]="",[86]="",[87]="",[88]="",[89]="",[90]="",
	[91]="",[92]="",[93]="",[94]="",[95]="",[96]="",[97]="",[98]="",[99]="",[100]="",
}
--需要击晕的钢条 引导施法
StunChannelName={
	[1]="思维链",[2]="亡者再临",[3]="流丝缠缚",[4]="收割精魂",[5]="抓握之血",[6]="排干体液",[7]="",[8]="",[9]="",[10]="",
}

--需要加速跑
SpeedUpSpellName={
	[1]="冲刷",[2]="发芽",[3]="暴捶",[4]="下冲气流",[5]="龙息术",[6]="暗影碎击",[7]="粉碎急息",[8]="源生",[9]="追踪",[10]="永恒腐化",
	[11]="力量真空",[12]="肚腹猛击",[13]="塌缩之夜",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--爆发 Buff 或 法术
CrazyBuff={
	[1]="召唤地狱火",[2]="召唤恶魔暴君",[3]="虚空传送门",[4]="复仇之怒",[5]="狂龙之怒",[6]="恶魔变形",[7]="虚空形态",[8]=190319,[9]="奥术强化",[10]="冰冷血脉",
	[11]="天神下凡",[12]="憎恶附肢",[13]="食尸鬼狂热",[14]="百发百中",[15]="屏气凝神",[16]="混乱之雨",[17]="恶魔之力",[18]="诡诈",[19]="暗影之刃",[20]="风火雷电",
	[21]="超凡之盟",[22]="狂暴",[23]="灰烬觉醒",[24]="呼啸狂风",[25]="升腾",[26]="瓦拉加尔之道",[27]="符文武器增效",[28]="奥术涌动",[29]="征伐",[30]="亡者大军",
	[31]=102543,[32]="化身：艾露恩之眷",[33]="风暴守护者",[34]="风暴元素",[35]="召唤黑眼",[36]="协同进攻",[37]="暗影之舞",[38]="消失",[39]="荒野的召唤",[40]="月蚀",
	[41]="日蚀",[42]="冰龙吐息",[43]="",[44]="",[45]="",[46]="",[47]="",[48]="",[49]="",[50]="",
	[51]="",[52]="",[53]="",[54]="",[55]="",[56]="",[57]="",[58]="",[59]="",[60]="",
}

--需要忽略的单位
HuLueUnitName={
	[1]="潜伏风暴",[2]="虚体生物",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--可以偷取的法术BUFF
StealBuffName={
    [1]=387955,[2]=389686,[3]=372749,[4]=385063,[5]=386319,[6]=369826,[7]=369400,[8]=377500,[9]=378149,[10]=335141,
	[11]=256957,[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--必须治愈的技能名称
MustHealSpellName={
	[1]="狂伤",[2]="痛苦撕裂",[3]="痛苦撕扯",[4]="锯齿荨麻",[5]="压抑深渊",[6]="时光联结",[7]="灵魂荆棘",[8]="烈焰震击",[9]="虚空裂隙",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--被恐惧的DEBUFF名称
KongJuDebuffName={
	[1]="恐惧之容",[2]="刺耳尖啸",[3]="恐惧咆哮",[4]="咆哮恐惧",[5]="威吓嚎叫",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}


--创建宏按键
function WR_CreateMacroButton(Name,Button,Text)
	--local MacroButton = _G[Name]
	--if not MacroButton then
		MacroButton = CreateFrame("Button", Name, UIParent, "SecureActionButtonTemplate");
		MacroButton:RegisterForClicks("AnyDown", "AnyUp")
		MacroButton:SetAttribute("type", "macro")
		MacroButton:SetAttribute("macrotext", Text)
		SetBinding(Button, "CLICK "..Name..":LeftButton")
	--end
	--MacroButton:SetAttribute("macrotext", Text)
	--return MacroButton
end

--创建法术按键
function WR_CreateSpellButton(Name,Button,Text)
	local MacroButton = CreateFrame("Button", Name, UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "spell")
	MacroButton:SetAttribute("spell", Text)
	SetBinding(Button, "CLICK "..Name..":LeftButton")
	return MacroButton
end

-- 创建物品按键
function WR_CreateItemButton(Name, Button, ItemName)
    local MacroButton = CreateFrame("Button", Name, UIParent, "SecureActionButtonTemplate")
    MacroButton:RegisterForClicks("AnyDown", "AnyUp")
    MacroButton:SetAttribute("type", "item")
    MacroButton:SetAttribute("item", ItemName)
    SetBinding(Button, "CLICK "..Name..":LeftButton")
    return MacroButton
end

--[[
--创建宏按键
function WR_CreateMacroButton(Name,Button,Text)
	-- 遍历当前玩家的宏列表
	local macroIndex
	local MacroIsOK=true
	for i = 1, MAX_ACCOUNT_MACROS + MAX_CHARACTER_MACROS do
		local name = GetMacroInfo(i)
		if name == Name then
			macroIndex = i
			break
		end
	end

	-- 如果找到了名为 "CF1" 的宏，更新其内容；否则，创建一个新的宏
	if macroIndex then
		-- 更新宏内容
		EditMacro(macroIndex, Name, 4005162, Text)
	else
		-- 创建新的宏
		if GetNumMacros() < MAX_ACCOUNT_MACROS then
			CreateMacro(Name, 4005162, Text, nil)
		else
			MacroIsOK=false
			print("佳佳提示：宏数量已达上限，请删除通用宏内一些无用的宏，然后重载游戏。")
		end
	end
	
	if MacroIsOK then
		local MacroButton = CreateFrame("Button", Name, UIParent, "SecureActionButtonTemplate");
		MacroButton:RegisterForClicks("AnyDown", "AnyUp")
		MacroButton:SetAttribute("type", "macro")
		MacroButton:SetAttribute("macro", Name)
		SetBinding(Button, "CLICK "..Name..":LeftButton")
		return MacroButton
	end
end
--]]


--初始化

function WR_Initialize()
	
	--公会信息
	if MyGIDInfo~=nil then
		local serverTime = date("*t") -- 获取当前服务器时间的详细信息
		local hour = serverTime.hour -- 获取当前小时
		local minute = serverTime.min -- 获取当前分钟
--		if hour == 20 and minute == 0 and GUILDHello~=true then
		if minute == 0 and GUILDHello~=true then
			local randomNumber = math.random(1, 682)
			--SendChatMessage(WR_TangShi300[randomNumber], "GUILD")
			GUILDHello=true
		end
		if minute ~= 0 then
			GUILDHello=false
		end
	end
--[[
	--预组队加入简体,繁体,英文
	C_LFGList.GetAvailableLanguageSearchFilter = function()
		local result = {}
		result[1] = "zhCN"
		result[2] = "zhTW"
		result[3] = "enUS"
		return result
	end
	
	--初始化数据
	WR_AllUnitRange=nil

	WR_BuffInfo_Player=nil
	WR_BuffInfo_Target=nil
	WR_BuffInfo_Focus=nil
	WR_BuffInfo_Mouseover=nil
	WR_BuffInfo_Pet=nil
	WR_BuffInfo_Party={}
	for i=1,4,1 do
		WR_BuffInfo_Party[i]=nil
	end
	WR_BuffInfo_Boss={}
	for i=1,5,1 do
		WR_BuffInfo_Boss[i]=nil
	end
	WR_BuffInfo_Raid={}
	for i=1,40,1 do
		WR_BuffInfo_Raid[i]=nil
	end
	WR_BuffInfo_Nameplate={}
	for i=1,40,1 do
		WR_BuffInfo_Nameplate[i]=nil
	end

	WR_BuffInfo_PlayerTarget=nil
	WR_BuffInfo_TargetTarget=nil
	WR_BuffInfo_FocusTarget=nil
	WR_BuffInfo_MouseoverTarget=nil
	WR_BuffInfo_PetTarget=nil
	WR_BuffInfo_PartyTarget={}
	for i=1,4,1 do
		WR_BuffInfo_PartyTarget[i]=nil
	end
	WR_BuffInfo_BossTarget={}
	for i=1,5,1 do
		WR_BuffInfo_BossTarget[i]=nil
	end
	WR_BuffInfo_RaidTarget={}
	for i=1,40,1 do
		WR_BuffInfo_RaidTarget[i]=nil
	end
	WR_BuffInfo_NameplateTarget={}
	for i=1,40,1 do
		WR_BuffInfo_NameplateTarget[i]=nil
	end
	
	WR_DebuffInfo_Player=nil
	WR_DebuffInfo_Target=nil
	WR_DebuffInfo_Focus=nil
	WR_DebuffInfo_Mouseover=nil
	WR_DebuffInfo_Pet=nil
	WR_DebuffInfo_Party={}
	for i=1,4,1 do
		WR_DebuffInfo_Party[i]=nil
	end
	WR_DebuffInfo_Boss={}
	for i=1,5,1 do
		WR_DebuffInfo_Boss[i]=nil
	end
	WR_DebuffInfo_Raid={}
	for i=1,40,1 do
		WR_DebuffInfo_Raid[i]=nil
	end
	WR_DebuffInfo_Nameplate={}
	for i=1,40,1 do
		WR_DebuffInfo_Nameplate[i]=nil
	end

	WR_DebuffInfo_PlayerTarget=nil
	WR_DebuffInfo_TargetTarget=nil
	WR_DebuffInfo_FocusTarget=nil
	WR_DebuffInfo_MouseoverTarget=nil
	WR_DebuffInfo_PetTarget=nil
	WR_DebuffInfo_PartyTarget={}
	for i=1,4,1 do
		WR_DebuffInfo_PartyTarget[i]=nil
	end
	WR_DebuffInfo_BossTarget={}
	for i=1,5,1 do
		WR_DebuffInfo_BossTarget[i]=nil
	end
	WR_DebuffInfo_RaidTarget={}
	for i=1,40,1 do
		WR_DebuffInfo_RaidTarget[i]=nil
	end
	WR_DebuffInfo_NameplateTarget={}
	for i=1,40,1 do
		WR_DebuffInfo_NameplateTarget[i]=nil
	end
--]]
end


--获得公共冷却剩余时间或者当前施法剩余时间 取最大值
function WR_GetGCD(SpellName)
	local SpellCD = 0	--初始化 技能冷却时间
	if C_Spell.GetSpellCooldown(SpellName) then
		local start = C_Spell.GetSpellCooldown(SpellName).startTime
		local duration = C_Spell.GetSpellCooldown(SpellName).duration
		if start + duration > GetTime() then
			SpellCD = start + duration - GetTime()
		end
	end
--[[	
	if start~= nil then
		if start == 0 then
			SpellCD = 0	--技能冷却时间为0
		else
			SpellCD = start + duration - GetTime()	--技能冷却时间为剩余时间
		end
	end
--]]
	local _, _, _, _, endTimeMS, _, _, _, _ = UnitCastingInfo("player")
	if endTimeMS~=nil and endTimeMS/1000-GetTime()>SpellCD then
	--如果当前施法时间>技能冷却时间
		return endTimeMS/1000-GetTime()	--返回值:当前施法剩余时间
	else
		return SpellCD	--返回值:技能冷却时间
	end

end


--技能可用 包含资源监测
function WR_SpellUsable(Spell)
	if WR_GetGCD(Spell)<=GCD
	--技能冷却
	and
	C_Spell.IsSpellUsable(Spell)
	--技能资源足够
	then
		return true
	end			
	return false
end

--获得当前最大网络延时
function WR_GetMaxLatency()
	local bandwidthIn, bandwidthOut, latencyHome, latencyWorld = GetNetStats()
	if latencyHome > latencyWorld then
		return latencyHome/1000
	else
		return latencyWorld/1000
	end
end


--获得当前最大公共冷却时间(基础GCD)
function WR_GetMaxGCD(GCD)
	return GCD/(1+GetHaste()/100)
end


--获得法术面板上面的具体数值（技能名称，前缀，后缀）
function WR_GetSpellValue(SpellName,Prefix,Suffix)
	local DescriptionText="([%d,%.]+)"
	if Prefix~=nil then DescriptionText=Prefix..DescriptionText end
	if Suffix~=nil then DescriptionText=DescriptionText..Suffix end
	local SpellText=C_Spell.GetSpellDescription(SpellName)
	if SpellText~=nil then SpellText=SpellText:match(DescriptionText) end
	if SpellText~=nil then SpellText=SpellText:gsub(",", "") end
	if SpellText~=nil then SpellText=SpellText:gsub(" 万", "0000") end
	--if SpellName=="圣言术：静" then print(SpellName,SpellText) end
	if SpellText~=nil then
		local SpellValue = tonumber(SpellText)
		if type(SpellValue)=="number" then
			return SpellValue
		end
	end
	
	local DescriptionText="([%d,%.]+ 万)"
	if Prefix~=nil then DescriptionText=Prefix..DescriptionText end
	if Suffix~=nil then DescriptionText=DescriptionText..Suffix end
	local SpellText=C_Spell.GetSpellDescription(SpellName)
	if SpellText~=nil then SpellText=SpellText:match(DescriptionText) end
	if SpellText~=nil then SpellText=SpellText:gsub(",", "") end
	if SpellText~=nil then SpellText=SpellText:gsub(" 万", "0000") end
	--if SpellName=="圣言术：静" then print(SpellName,SpellText) end
	if SpellText~=nil then
		local SpellValue = tonumber(SpellText)
		if type(SpellValue)=="number" then
			return SpellValue
		end
	end
	
	return 0
end


--在打木桩
function WR_InTraining()
	for _, TempName in ipairs(TrainingName) do
		if UnitName("target")==TempName then
		--如果目标出现训练木桩的名字，那么就说明在训练中
			return false
		end
	end
	return false
end


--获得小队或者团队内有人死亡
function WR_PartyIsDeath()
	for i=1,4,1
	do
		if UnitExists("party"..i) and UnitIsDead("party"..i) then
			return true
		end
	end
	for i=1,40,1
	do
		if UnitExists("raid"..i) and UnitIsDead("raid"..i) then
			return true
		end
	end
	return false
end


--解除定身
function WR_Unbind(Unit)
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end	--宇宙奇点期间不要解定身
	if UnitClassBase("player")=="DRUID" and WR_GetUnitDebuffTime(Unit,"晦幽纺纱")>0 and WR_GetUnitDebuffTime(Unit,"晦幽纺纱")<11 then return false end	--如果是德鲁伊 晦幽纺纱DEBUFF时间小于10.5就不要解控了,因为解了DEBUFF还在身上
	
	if WR_GetUnitDebuffCount(Unit,"恐瓣花粉")>=6 then
	--获得单位指定Debuff的层数
		return true
	end
	
	if WR_GetUnitDebuffTime(Unit,BindName)>0 then
	--单位具有某个定身Debuff
		return true
	end
	
	return false
end


--预防定身
function WR_YuFangDingShen(Unit)
	if WR_GetRangeSpellTime(40,YuFangDingShenSpell)<2 then
	--如果40码存在需要预防定身的法术
		return true
	end
	
	if Unit==nil or Unit=="player" then
		if WR_GetRangeSpellTime(40,YuFangDingShenSpellToUnit,"player")<2 then
		--如果40码存在需要预防定身的法术
			return true
		end
	else
		if WR_GetRangeSpellTime(40,YuFangDingShenSpellToUnit,Unit)<2 then
		--如果40码存在需要预防定身的法术
			return true
		end
	end
		
	return false
end

--[[
--单位具有某个Buff
function WR_GetUnitBuff(Unit,BuffName,BuffCount,Time)
	local i
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossBuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
		if name == nil then break end
		--如果name不存在则立即退出循环
		
		if (BuffCount==nil or count>=BuffCount)
		--指定层数不存在 或者 层数<=指定层数
		and (Time==nil or expirationTime - GetTime()<=Time)
		--指定时间不存在 或者 剩余时间<=指定时间
		then
			if type(BuffName)=="table" then
			--如果BuffName是个表，而不是单独的一个值
				for _, TempBuffName in pairs(BuffName) do
					if (name==TempBuffName or spellId == TempBuffName) then
					--Buff 名称 或者 ID 对得上
						return true
					end
				end
			else
				if (name==BuffName or spellId == BuffName) then
				--Buff 名称 或者 ID 对得上
					return true
				end
			end
		end
	end
	return false
end
--]]
--[[
--单位具有某个DeBUFF
function WR_GetUnitDebuff(Unit,DebuffName,DebuffCount,Time)
	local i
	for i=1,40,1
	do
		local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
		if name == nil then break end
		--如果name不存在则立即退出循环
		
		if (DebuffCount==nil or count>=DebuffCount)
		--指定层数不存在 或者 层数<=指定层数
		and (Time==nil or expirationTime - GetTime()<=Time)
		--指定时间不存在 或者 剩余时间<=指定时间
		then
			if type(DebuffName)=="table" then
			--如果DebuffName是个表，而不是单独的一个值
				for _, TempDebuffName in pairs(DebuffName) do
					if (name==TempDebuffName or spellId == TempDebuffName) then
					--Debuff 名称 或者 ID 对得上
						return true
					end
				end
			else
				if (name==DebuffName or spellId == DebuffName) then
				--Debuff 名称 或者 ID 对得上
					return true
				end
			end
		end
	end
	return false
end
--]]

--获得单位是否有需要协助的Debuff
function WR_UnitAssistDebuff(Unit)
	return WR_GetUnitDebuffTime(Unit,AssistDebuffName)>0
end


--检测单位是否有必须治愈的条件
function WR_Mustheal(Unit)
	local j=1

	if WR_GetUnitDebuffTime(Unit,MustHealSpellName)>0 or WR_UnitAssistDebuff(Unit) then 
	--必须治愈的DEBUFF存在 或 协助点名Debuff存在
		if UnitHealth(Unit)/UnitHealthMax(Unit)<0.9 then
			return true
		end
	end
	
	local UName,_ = UnitName(Unit)
	if UName=="卡多雷精魂" or UName=="焦化树人" then
		if UnitHealth(Unit)/UnitHealthMax(Unit)<0.9 then
			return true
		end
	end
	return false
end


--获得目标是否具有某种类型的BUFF,(Curse=诅咒, Disease=疾病, Magic=魔法, Poison=毒药, Enraged=激怒, Stunned=昏迷, Rooted=缠绕)
function WR_GetUnitBuffType(Unit,BuffType)
	local i
	for i=1,255,1
	do
		local UnitBuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HELPFUL")
		if UnitBuffData==nil then
			break
		end
		local name=UnitBuffData.name
		local count=UnitBuffData.applications
		local dispelType=UnitBuffData.dispelName

		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		if name=="无穷饥渴" and count<6 then
			return false
		end
		if name=="窃取时间" then
			return false
		end
		if dispelType==BuffType then
			return true
		end
	end
	return false
end


--获得目标是否具有某种类型的DEBUFF,(Curse=诅咒, Disease=疾病, Magic=魔法, Poison=毒药, Enraged=激怒, Stunned=昏迷, Rooted=缠绕)
function WR_UnitDebuffType(Unit,DebuffType)
	local i
	for i=1,255,1
	do
		local CanRemoveDebuff=true
		local UnitDebuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HARMFUL")
		if UnitDebuffData==nil then
			break
		end
		local name=UnitDebuffData.name
		local count=UnitDebuffData.applications
		local dispelType=UnitDebuffData.dispelName
		local expirationTime=UnitDebuffData.expirationTime
		
		if name == nil then
		--如果name不存在则立即退出循环
			break
		end
		
		if name=="虚空裂隙" then	--11.0词缀
			return true,1
		end
		
		if (name=="灵魂毒液") and count<7 then
		--不驱散7层以下的灵魂毒液
			CanRemoveDebuff=false
		end
		if (name=="爆裂" or name=="巨口蛙毒" or name=="腐蚀波") and count<5 then
		--不驱散5层以下的DEBUFF
			CanRemoveDebuff=false
		end
		if name=="窃取时间" and count<3 then
			CanRemoveDebuff=false
		end
		if name=="腐败之血" and count<2 then
			CanRemoveDebuff=false
		end
		if name=="时光爆发" and (expirationTime-GetTime()>4.5 or WR_GetUnitHP(Unit)<0.8) then
			CanRemoveDebuff=false
		end
		if name=="古怪生长" and expirationTime-GetTime()>4 then
			CanRemoveDebuff=false
		end
		if name=="提尔之火" and (expirationTime-GetTime()>16 or WR_GetUnitHP(Unit)<0.8 or UnitCastingInfo("boss1")=="裂地打击") then
			CanRemoveDebuff=false
		end
		if name=="震地回响" and WR_GetRangeSpellTime(45,"震地猛击")>=3 then
		--如果Debuff是震地回响,那么在震地猛击3施法时间少于3秒的时候才驱散
			CanRemoveDebuff=false
		end
		if (name=="冰冻") then
		--不驱散
			CanRemoveDebuff=false
		end
		if dispelType==DebuffType and CanRemoveDebuff==true then
			return true,count
		end
	end
	return false
end

--[[
--获得单位指定BUFF的剩余时间及堆叠层数(BuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitBuffInfo(Unit,BuffName,ByMe)
	local BuffTime=0
	local BuffCount=0
	local BuffSum=0
	
	local WR_BuffInfo_Temp

	if WR_BuffInfo_Temp==nil and Unit=="player" and WR_BuffInfo_Player~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_Player
	end
	if WR_BuffInfo_Temp==nil and Unit=="target" and WR_BuffInfo_Target~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_Target
	end
	if WR_BuffInfo_Temp==nil and Unit=="focus" and WR_BuffInfo_Focus~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_Focus
	end
	if WR_BuffInfo_Temp==nil and Unit=="mouseover" and WR_BuffInfo_Mouseover~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_Mouseover
	end
	if WR_BuffInfo_Temp==nil and Unit=="pet" and WR_BuffInfo_Pet~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_Pet
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,4,1 do
			if Unit=="party"..i and WR_BuffInfo_Party[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_Party[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,5,1 do
			if Unit=="boss"..i and WR_BuffInfo_Boss[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_Boss[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="raid"..i and WR_BuffInfo_Raid[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_Raid[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="nameplate"..i and WR_BuffInfo_Nameplate[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_Nameplate[i]
			end
		end
	end
	
	if WR_BuffInfo_Temp==nil and Unit=="playertarget" and WR_BuffInfo_PlayerTarget~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_PlayerTarget
	end
	if WR_BuffInfo_Temp==nil and Unit=="targettarget" and WR_BuffInfo_TargetTarget~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_TargetTarget
	end
	if WR_BuffInfo_Temp==nil and Unit=="focustarget" and WR_BuffInfo_FocusTarget~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_FocusTarget
	end
	if WR_BuffInfo_Temp==nil and Unit=="mouseovertarget" and WR_BuffInfo_MouseoverTarget~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_MouseoverTarget
	end
	if WR_BuffInfo_Temp==nil and Unit=="pettarget" and WR_BuffInfo_PetTarget~=nil then
		WR_BuffInfo_Temp=WR_BuffInfo_PetTarget
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,4,1 do
			if Unit=="party"..i.."target" and WR_BuffInfo_PartyTarget[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_PartyTarget[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,5,1 do
			if Unit=="boss"..i.."target" and WR_BuffInfo_BossTarget[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_BossTarget[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="raid"..i.."target" and WR_BuffInfo_RaidTarget[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_RaidTarget[i]
			end
		end
	end
	if WR_BuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="nameplate"..i.."target" and WR_BuffInfo_NameplateTarget[i]~=nil then
				WR_BuffInfo_Temp=WR_BuffInfo_NameplateTarget[i]
			end
		end
	end

	if WR_BuffInfo_Temp~=nil then
	--如果表中有信息
	--print("表中有信息")
		for _, TempBuffInfo in ipairs(WR_BuffInfo_Temp) do
			if BuffName~=nil
			and
			(
				BuffName==TempBuffInfo.Name
				--BUFF名称成立
				or
				BuffName==TempBuffInfo.ID
				--BUFFID成立
			)
			and
			(
				ByMe~=true
				or
				(
					ByMe==true
					and
					TempBuffInfo.Source=="player"
				)
			)
			then
			--不考虑来自自己 或者 确定来自自己
				BuffTime=TempBuffInfo.Time
				if TempBuffInfo.Count>0 then
					BuffCount = TempBuffInfo.Count
				else
					BuffCount = 1
				end
				BuffSum=BuffSum+1
			end
		end
		return BuffTime,BuffCount,BuffSum
	else
	--如果表中没有信息
	--print("表中没有信息")
		WR_BuffInfo_Temp={}	--如果表是nil,那么初始化这个表
		for i=1,40,1 do
			if UnitExists(Unit) then
			--单位存在
				local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitBuff(Unit,i)
				if name == nil then
				--如果name不存在
					if i==1 then
					--如果第一个BUFF信息就不存在,赋予一个空表,目的是为了让下一次直接查表,而不是用API查信息
						local TempBuffInfo={
							Name=nil,
							ID=0,
							Time=0,
							Count=0,
							Source=nil
						}
						table.insert(WR_BuffInfo_Temp, TempBuffInfo)
					end
					break
				end
				if BuffName~=nil
				and
				(
					name==BuffName
					or
					spellId==BuffName
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						source=="player"
					)
				)
				then
					BuffTime = expirationTime - GetTime()
					if count>0 then
						BuffCount = count
					else
						BuffCount = 1
					end
					BuffSum=BuffSum+1
				end
				local TempBuffInfo={
					Name=name,
					ID=spellId,
					Time=expirationTime - GetTime(),
					Count=count,
					Source=source
				}
				table.insert(WR_BuffInfo_Temp, TempBuffInfo)
				--print(Unit)
			end
		end
		if Unit=="player" then
			WR_BuffInfo_Player=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="target" then
			WR_BuffInfo_Target=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="focus" then
			WR_BuffInfo_Focus=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="mouseover" then
			WR_BuffInfo_Mouseover=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="pet" then
			WR_BuffInfo_Pet=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		for i=1,4,1 do
			if Unit=="party"..i then
				WR_BuffInfo_Party[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,5,1 do
			if Unit=="boss"..i then
				WR_BuffInfo_Boss[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="raid"..i then
				WR_BuffInfo_Raid[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="nameplate"..i then
				WR_BuffInfo_Nameplate[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		
		if Unit=="playertarget" then
			WR_BuffInfo_PlayerTarget=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="targettarget" then
			WR_BuffInfo_TargetTarget=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="focustarget" then
			WR_BuffInfo_FocusTarget=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="mouseovertarget" then
			WR_BuffInfo_MouseoverTarget=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		if Unit=="pettarget" then
			WR_BuffInfo_PetTarget=WR_BuffInfo_Temp
			return BuffTime,BuffCount,BuffSum
		end
		for i=1,4,1 do
			if Unit=="party"..i.."target" then
				WR_BuffInfo_PartyTarget[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,5,1 do
			if Unit=="boss"..i.."target" then
				WR_BuffInfo_BossTarget[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="raid"..i.."target" then
				WR_BuffInfo_RaidTarget[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="nameplate"..i.."target" then
				WR_BuffInfo_NameplateTarget[i]=WR_BuffInfo_Temp
				return BuffTime,BuffCount,BuffSum
			end
		end
	end
	--return BuffTime,BuffCount,BuffSum
end
--]]

--获得单位指定BUFF的剩余时间及堆叠层数(BuffName)[返回值:Buff剩余时间,Buff堆叠数量,Buff的个数]
function WR_GetUnitBuffInfo(Unit,BuffName,ByMe)
	local BuffTime=0
	local BuffCount=0
	local BuffSum=0
		for i=1,255,1 do
			local UnitBuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HELPFUL")
			if UnitBuffData==nil then
				break
			end
			if UnitBuffData then
			--BUFF数据不是nil
				if ByMe~=true or (ByMe==true and UnitBuffData.sourceUnit=="player") then
				--不是来自自己的 或者 来自自己的
					if type(BuffName)=="table" then
					--如果BuffName是个表，而不是单独的一个值
						for _, TempBuffName in pairs(BuffName) do
							if (UnitBuffData.name==TempBuffName or UnitBuffData.spellId==TempBuffName) then
							--Buff 名称 或者 ID 对得上
								if UnitBuffData.expirationTime>GetTime() then
									BuffTime = UnitBuffData.expirationTime - GetTime()
								else
									BuffTime = 999
								end
								if UnitBuffData.applications>0 then
									BuffCount = UnitBuffData.applications
								else
									BuffCount = 1
								end
								BuffSum=BuffSum+1
								--return BuffTime,BuffCount
							end
						end
					else
					--如果BuffName是单独的一个值
						if (UnitBuffData.name==BuffName or UnitBuffData.spellId==BuffName) then
							if UnitBuffData.expirationTime>GetTime() then
								BuffTime = UnitBuffData.expirationTime - GetTime()
							else
								BuffTime = 999
							end
							if UnitBuffData.applications>0 then
								BuffCount = UnitBuffData.applications
							else
								BuffCount = 1
							end
							BuffSum=BuffSum+1
							--return BuffTime,BuffCount
						end
					end
				end
			else
				--return BuffTime,BuffCount
			end
		end
	return BuffTime,BuffCount,BuffSum
end


--获得单位指定Debuff的剩余时间及堆叠层数(DebuffName)[返回值:Debuff剩余时间,Debuff堆叠数量]
function WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe)
	local DebuffTime=0
	local DebuffCount=0

		for i=1,255,1 do
			local UnitDebuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HARMFUL")
			if UnitDebuffData==nil then
				break
			end
			if UnitDebuffData then
			--Debuff数据不是nil
				if ByMe~=true or (ByMe==true and UnitDebuffData.sourceUnit=="player") then
				--不是来自自己的 或者 来自自己的
					if type(DebuffName)=="table" then
					--如果DebuffName是个表，而不是单独的一个值
						for _, TempDebuffName in pairs(DebuffName) do
							if (UnitDebuffData.name==TempDebuffName or UnitDebuffData.spellId==TempDebuffName) then
							--Debuff 名称 或者 ID 对得上
								if UnitDebuffData.expirationTime>GetTime() then
									DebuffTime = UnitDebuffData.expirationTime - GetTime()
								else
									DebuffTime = 999
								end
								if UnitDebuffData.applications>0 then
									DebuffCount = UnitDebuffData.applications
								else
									DebuffCount = 1
								end
								return DebuffTime,DebuffCount
							end
						end
					else
					--如果DebuffName是单独的一个值
						if (UnitDebuffData.name==DebuffName or UnitDebuffData.spellId==DebuffName) then
							if UnitDebuffData.expirationTime>GetTime() then
								DebuffTime = UnitDebuffData.expirationTime - GetTime()
							else
								DebuffTime = 999
							end
							if UnitDebuffData.applications>0 then
								DebuffCount = UnitDebuffData.applications
							else
								DebuffCount = 1
							end
							return DebuffTime,DebuffCount
						end
					end
				end
			else
				return DebuffTime,DebuffCount
			end
		end
	return DebuffTime,DebuffCount
end


--[[
--获得单位指定Debuff的剩余时间及堆叠层数(DebuffName)[返回值:Debuff剩余时间,Debuff堆叠数量,Debuff的个数]
function WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe)
	local DebuffTime=0
	local DebuffCount=0
	local DebuffSum=0
	
	local WR_DebuffInfo_Temp

	if WR_DebuffInfo_Temp==nil and Unit=="player" and WR_DebuffInfo_Player~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_Player
	end
	if WR_DebuffInfo_Temp==nil and Unit=="target" and WR_DebuffInfo_Target~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_Target
	end
	if WR_DebuffInfo_Temp==nil and Unit=="focus" and WR_DebuffInfo_Focus~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_Focus
	end
	if WR_DebuffInfo_Temp==nil and Unit=="mouseover" and WR_DebuffInfo_Mouseover~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_Mouseover
	end
	if WR_DebuffInfo_Temp==nil and Unit=="pet" and WR_DebuffInfo_Pet~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_Pet
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,4,1 do
			if Unit=="party"..i and WR_DebuffInfo_Party[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_Party[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,5,1 do
			if Unit=="boss"..i and WR_DebuffInfo_Boss[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_Boss[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="raid"..i and WR_DebuffInfo_Raid[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_Raid[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="nameplate"..i and WR_DebuffInfo_Nameplate[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_Nameplate[i]
			end
		end
	end
	
	if WR_DebuffInfo_Temp==nil and Unit=="playertarget" and WR_DebuffInfo_PlayerTarget~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_PlayerTarget
	end
	if WR_DebuffInfo_Temp==nil and Unit=="targettarget" and WR_DebuffInfo_TargetTarget~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_TargetTarget
	end
	if WR_DebuffInfo_Temp==nil and Unit=="focustarget" and WR_DebuffInfo_FocusTarget~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_FocusTarget
	end
	if WR_DebuffInfo_Temp==nil and Unit=="mouseovertarget" and WR_DebuffInfo_MouseoverTarget~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_MouseoverTarget
	end
	if WR_DebuffInfo_Temp==nil and Unit=="pettarget" and WR_DebuffInfo_PetTarget~=nil then
		WR_DebuffInfo_Temp=WR_DebuffInfo_PetTarget
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,4,1 do
			if Unit=="party"..i.."target" and WR_DebuffInfo_PartyTarget[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_PartyTarget[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,5,1 do
			if Unit=="boss"..i.."target" and WR_DebuffInfo_BossTarget[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_BossTarget[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="raid"..i.."target" and WR_DebuffInfo_RaidTarget[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_RaidTarget[i]
			end
		end
	end
	if WR_DebuffInfo_Temp==nil then
		for i=1,40,1 do
			if Unit=="nameplate"..i.."target" and WR_DebuffInfo_NameplateTarget[i]~=nil then
				WR_DebuffInfo_Temp=WR_DebuffInfo_NameplateTarget[i]
			end
		end
	end

	if WR_DebuffInfo_Temp~=nil then
	--如果表中有信息
	--print("表中有信息")
		for _, TempDebuffInfo in ipairs(WR_DebuffInfo_Temp) do
			if DebuffName~=nil
			and
			(
				DebuffName==TempDebuffInfo.Name
				--BUFF名称成立
				or
				DebuffName==TempDebuffInfo.ID
				--BUFFID成立
			)
			and
			(
				ByMe~=true
				or
				(
					ByMe==true
					and
					TempDebuffInfo.Source=="player"
				)
			)
			then
			--不考虑来自自己 或者 确定来自自己
				DebuffTime=TempDebuffInfo.Time
				if TempDebuffInfo.Count>0 then
					DebuffCount = TempDebuffInfo.Count
				else
					DebuffCount = 1
				end
				DebuffSum=DebuffSum+1
			end
		end
		return DebuffTime,DebuffCount,DebuffSum
	else
	--如果表中没有信息
	--print("表中没有信息")
		WR_DebuffInfo_Temp={}	--如果表是nil,那么初始化这个表
		for i=1,40,1 do
			if UnitExists(Unit) then
			--单位存在
				local name, icon, count, dispelType, duration, expirationTime, source, isStealable, nameplateShowPersonal, spellId, canApplyAura, isBossDebuff, castByPlayer, nameplateShowAll, timeMod = UnitDebuff(Unit,i)
				if name == nil then
				--如果name不存在
					if i==1 then
					--如果第一个BUFF信息就不存在,赋予一个空表,目的是为了让下一次直接查表,而不是用API查信息
						local TempDebuffInfo={
							Name=nil,
							ID=0,
							Time=0,
							Count=0,
							Source=nil
						}
						table.insert(WR_DebuffInfo_Temp, TempDebuffInfo)
					end
					break
				end
				if DebuffName~=nil
				and
				(
					name==DebuffName
					or
					spellId==DebuffName
				)
				and
				(
					ByMe~=true
					or
					(
						ByMe==true
						and
						source=="player"
					)
				)
				then
					DebuffTime = expirationTime - GetTime()
					if count>0 then
						DebuffCount = count
					else
						DebuffCount = 1
					end
					DebuffSum=DebuffSum+1
				end
				local TempDebuffInfo={
					Name=name,
					ID=spellId,
					Time=expirationTime - GetTime(),
					Count=count,
					Source=source
				}
				table.insert(WR_DebuffInfo_Temp, TempDebuffInfo)
				--print(Unit)
			end
		end
		if Unit=="player" then
			WR_DebuffInfo_Player=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="target" then
			WR_DebuffInfo_Target=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="focus" then
			WR_DebuffInfo_Focus=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="mouseover" then
			WR_DebuffInfo_Mouseover=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="pet" then
			WR_DebuffInfo_Pet=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		for i=1,4,1 do
			if Unit=="party"..i then
				WR_DebuffInfo_Party[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,5,1 do
			if Unit=="boss"..i then
				WR_DebuffInfo_Boss[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="raid"..i then
				WR_DebuffInfo_Raid[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="nameplate"..i then
				WR_DebuffInfo_Nameplate[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		
		if Unit=="playertarget" then
			WR_DebuffInfo_PlayerTarget=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="targettarget" then
			WR_DebuffInfo_TargetTarget=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="focustarget" then
			WR_DebuffInfo_FocusTarget=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="mouseovertarget" then
			WR_DebuffInfo_MouseoverTarget=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		if Unit=="pettarget" then
			WR_DebuffInfo_PetTarget=WR_DebuffInfo_Temp
			return DebuffTime,DebuffCount,DebuffSum
		end
		for i=1,4,1 do
			if Unit=="party"..i.."target" then
				WR_DebuffInfo_PartyTarget[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,5,1 do
			if Unit=="boss"..i.."target" then
				WR_DebuffInfo_BossTarget[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="raid"..i.."target" then
				WR_DebuffInfo_RaidTarget[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
		for i=1,40,1 do
			if Unit=="nameplate"..i.."target" then
				WR_DebuffInfo_NameplateTarget[i]=WR_DebuffInfo_Temp
				return DebuffTime,DebuffCount,DebuffSum
			end
		end
	end
	--return DebuffTime,DebuffCount,DebuffSum
end
--]]

--获得单位指定BUFF的 剩余时间
function WR_GetUnitBuffTime(Unit,BuffName,ByMe)
	return select(1, WR_GetUnitBuffInfo(Unit,BuffName,ByMe))
end
	
	
--获得单位指定BUFF的 层数
function WR_GetUnitBuffCount(Unit,BuffName,ByMe)
	return select(2, WR_GetUnitBuffInfo(Unit,BuffName,ByMe))
end


--获得单位指定BUFF的 数量(这个并不是层数,而是同名BUFF的数量)
function WR_GetUnitBuffSum(Unit,BuffName,ByMe)
	return select(3, WR_GetUnitBuffInfo(Unit,BuffName,ByMe))
end


--获得单位指定Debuff的 剩余时间
function WR_GetUnitDebuffTime(Unit,DebuffName,ByMe)
	return select(1, WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe))
end
	
	
--获得单位指定Debuff的 层数
function WR_GetUnitDebuffCount(Unit,DebuffName,ByMe)
	return select(2, WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe))
end

--[[
--获得单位指定Debuff的 数量(这个并不是层数,而是同名Debuff的数量)
function WR_GetUnitDebuffSum(Unit,DebuffName,ByMe)
	return select(3, WR_GetUnitDebuffInfo(Unit,DebuffName,ByMe))
end
--]]

function WR_SumYep()
	if wrvb==nil then return false end
	if WR_SumYep_True~=nil then return WR_SumYep_True end
	local sum = 0
	for _, value in pairs(wrvb) do
		if type(value) == "number" then
			sum = sum + value
		end
	end
	if sum == 189852303486 then
		WR_SumYep_True = true
		return true
	else
		WR_SumYep_True = false
		return false
	end
end

--获取队友单位需求治疗权重值,是否具有驱散某种类型的BUFF,(Magic=魔法,Curse=诅咒, Disease=疾病, Poison=毒药)
function WR_GetHealthMaxWeightUnit()
	local SpellName="Nothing" --法术名称
	local Magic=false --魔法
	local Curse=false --诅咒
	local Disease=false --疾病
	local Poison=false --中毒
	if IsPlayerSpell(527)==true then --纯净术
		SpellName="纯净术"
		Magic=true
	end
	if IsPlayerSpell(77130)==true then --净化灵魂
		SpellName="净化灵魂"
		Magic=true
	end
	if IsPlayerSpell(4987)==true then --清洁术
		SpellName="清洁术"
		Magic=true
	end
	if IsPlayerSpell(115450)==true then --清创生血
		SpellName="清创生血"
		Magic=true
	end
	if IsPlayerSpell(88423)==true then --自然之愈
		SpellName="自然之愈"
		Magic=true
	end
	
	if IsPlayerSpell(390632)==true then --强化纯净术
		Disease=true
	end
	if IsPlayerSpell(383016)==true then --强化净化灵魂
		Curse=true
	end
	if IsPlayerSpell(393024)==true then --强化清洁术
		Poison=true
		Disease=true
	end
	if IsPlayerSpell(388874)==true then --强化清创生血
		Poison=true
		Disease=true
	end
	if IsPlayerSpell(392378)==true then --强化自然之愈
		Poison=true
		Disease=true
	end
	
	if SpellName=="Nothing" then
		--print("|cffffdf00错误:没有监测到驱散法术")
		return "Nothing"
	else
		if HealthMaxWeightUnitload~=true then
			--print("本职业驱散法术为:|cff0cbd0c",SpellName)
			local temp="本职业驱散法术为: |cff0cbd0c"..SpellName.."|cffffffff，当前天赋可驱散: "
			if Magic==true then temp=temp.."|cff00adf0魔法 " end
			if Curse==true then temp=temp.."|cffffdf00诅咒 " end
			if Disease==true then temp=temp.."|cffff5040疾病 " end
			if Poison==true then temp=temp.."|cff0cbd0c中毒 " end
			--print(temp)
			HealthMaxWeightUnitload=true
		end
	end

	local inRange, checkedRange
	local PlayerHealth=0
	local PlayerWeight=0
	local PartyWeight={}
	local MaxWeightUnit="Nothing"
	local MaxWeight=-999 --初始化最大单位权重,设置0的话,不一定会选择任何一个人,设置-999的话,无论如何都选择一个人
	local TempUnit
	for i=1,4,1
	do
		PartyWeight[i]=0
		--初始化小队权重
	end
	local RaidWeight={}
	for i=1,40,1
	do
		RaidWeight[i]=0
		--初始化团队权重
	end
--[[	
	local start, duration, enabled, modRate=GetSpellCooldown(SpellName)
	local QSCooldown=start+duration-GetTime()--获得驱散CD
--]]
	QSCooldown=WR_GetGCD(SpellName)
	--获取特殊单位权重------------------------------------------
	for i=2,5,1
	do
		local BossWeight=0
		local BossUnit="boss"..i
		if UnitExists(BossUnit)==true and (UnitName(BossUnit)=="克罗米" or UnitName(BossUnit)=="焦化树人" or UnitName(BossUnit)=="焦灼刺藤") then
			BossWeight=(UnitHealthMax(BossUnit)-UnitHealth(BossUnit))/UnitHealthMax(BossUnit)*100
			--[[
			if BossWeight>70 then
				BossWeight=BossWeight*2
			end
			]]--
		end
		if BossWeight~=0 and MaxWeight<BossWeight then
			--获得最大单位权重值
			MaxWeight=BossWeight
			MaxWeightUnit=BossUnit
		end
	end
	
	local MouseoverWeight=0
	if UnitExists("mouseover")==true and (UnitName("mouseover")=="克罗米" or UnitName("mouseover")=="卡多雷精魂") then
		MouseoverWeight=(UnitHealthMax("mouseover")-UnitHealth("mouseover"))/UnitHealthMax("mouseover")*100
		--[[
		if MouseoverWeight>70 then
			MouseoverWeight=MouseoverWeight*2
		end
		]]--
	end
	if MouseoverWeight~=0 and MaxWeight<MouseoverWeight then
		--获得最大单位权重值
		MaxWeight=MouseoverWeight
		MaxWeightUnit="mouseover"
	end
	--获取特殊单位权重------------------------------------------



	--获取player权重------------------------------------------
	TempUnit="player"
	if UnitExists(TempUnit)==true and UnitIsDead(TempUnit)==false and UnitIsCharmed(TempUnit)==false and UnitIsFriend(TempUnit,TempUnit)==true and WR_GetUnitRange(TempUnit)<=46 then
	--单位存在 并且 单位存活 并且 单位没被魅惑 并且 单位是友好的 并且 单位指定技能范围内
		PlayerWeight=(UnitHealth(TempUnit)+UnitGetIncomingHeals(TempUnit)+UnitGetTotalAbsorbs(TempUnit)-UnitGetTotalHealAbsorbs(TempUnit)/1.5)/UnitHealthMax(TempUnit)*100
		--(单位血量+单位获得预计治疗量+单位获得护盾值-单位需要破除的减治疗盾)/单位最大血量.
		if PlayerWeight>100 then PlayerWeight=100 end
		PlayerWeight=100-PlayerWeight
		if PlayerWeight==0 and UnitGetTotalAbsorbs(TempUnit)>0 then
			PlayerWeight=PlayerWeight-5 --如果单位权值为0,并且身上有护盾,权值-5
		end	

		local PlayerHP=(UnitHealth(TempUnit)+UnitGetIncomingHeals(TempUnit)-UnitGetTotalHealAbsorbs(TempUnit))/UnitHealthMax(TempUnit) --PlayerHP为自身无护盾的真实血量比例
		
		if PlayerHP<0.70 then
		--如果自身无护盾血量低于50%,自身越危险权重越高
			PlayerWeight=PlayerWeight+(70-PlayerHP*100)/2
		end

		if UnitClassBase("player")=="PRIEST"
		and GetSpecialization()==1	--戒律牧
		then
			if UnitAffectingCombat("player")	--战斗中
			and WR_GetUnitBuffTime(TempUnit,"救赎",true)>0 then	--如果目标有我的“救赎”
				PlayerWeight=PlayerWeight-20
			elseif not UnitAffectingCombat("player")	--非战斗中
			and WR_GetUnitBuffTime(TempUnit,"恢复",true)>0 then	--如果目标有我的“恢复”
				PlayerWeight=PlayerWeight-20
			end
		end
		
		if WR_Mustheal(TempUnit) then
		--如果目标有必须治愈的状态（比如狂伤必须奶到90%）
			PlayerWeight=PlayerWeight+60
		end
		
		if (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"圣光道标",true)>0)
		or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"美德道标",true)>0)
		or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"信仰道标",true)>0)
		or (UnitClassBase("player")=="MONK" and WR_GetUnitBuffTime(TempUnit,"复苏之雾",true)>0)
		or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"愈合祷言",true)>0)
		or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"恢复",true)>0)
		or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"圣光回响",true)>0)
--[[
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"生命绽放",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"野性成长",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"愈合",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"回春术",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"林地护理",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"激变蜂群",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"栽培",true)>0)
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"春暖花开",true)>0)
--]]
		or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,102352,true)>0)	--塞纳里奥结界
		then
			PlayerWeight=PlayerWeight-10
		end
		
		if UnitClassBase("player")=="MONK" and WR_GetUnitBuffTime(TempUnit,"抚慰之雾",true)>0 and PlayerHP<0.9 then
		--如果目标身上有抚慰之雾 并且 血量<90% ，增加权重，目的是不要让拉着线的时候切其他目标
			PlayerWeight=PlayerWeight+30
		end
		--单位权重
		PlayerWeight=math.ceil(PlayerWeight)
		if MaxWeight<PlayerWeight then
			--获得最大单位权重值
			MaxWeight=PlayerWeight
			MaxWeightUnit="player"
		end
		
	end
	
	--获取party权重------------------------------------------
	if WR_GetInRaidOrParty()=="party" then
		for i=1,4,1
		do
			TempUnit="party"..i
			if UnitExists(TempUnit)==true and UnitIsDead(TempUnit)==false and UnitIsCharmed(TempUnit)==false and UnitIsFriend(TempUnit,TempUnit)==true and (WR_GetUnitRange(TempUnit)<=46 or (WR_GetUnitBuffTime("player","救赎之魂")>GCD and WR_GetUnitRange(TempUnit)<=69)) then
			--单位存在 并且 单位存活 并且 单位没被魅惑 并且 单位是友好的 并且 单位指定技能范围内
				PartyWeight[i]=(UnitHealth(TempUnit)+(UnitGetIncomingHeals(TempUnit) or 0)+UnitGetTotalAbsorbs(TempUnit)/2-UnitGetTotalHealAbsorbs(TempUnit)/1.5)/UnitHealthMax(TempUnit)*100
			--(单位血量+单位获得预计治疗量+单位获得护盾值-单位需要破除的减治疗盾)/单位最大血量
				if PartyWeight[i]>100 then PartyWeight[i]=100 end
				PartyWeight[i]=100-PartyWeight[i]
				if PartyWeight[i]==0 and UnitGetTotalAbsorbs(TempUnit)>0 then
					PartyWeight[i]=PartyWeight[i]-5 --如果单位权值为0,并且身上有护盾,权值-5
				end

				if UnitGroupRolesAssigned(TempUnit)=="TANK" then	--单位是坦克
					if not UnitAffectingCombat(TempUnit) then	--没有战斗的时候
						PartyWeight[i]=PartyWeight[i]+5 --坦克权重+5
					end
					if UnitName("boss1")=="不屈者卡金" then
						PartyWeight[i]=PartyWeight[i]-50 --坦克权重-50
					end
				end

				local PartyHP=(UnitHealth(TempUnit)+(UnitGetIncomingHeals(TempUnit) or 0)-UnitGetTotalHealAbsorbs(TempUnit))/UnitHealthMax(TempUnit) --PartyHP为队友无护盾的真实血量比例
				
				local TankWeight=true	--初始化是否判断坦克权重
				if UnitClass("player")=="牧师" and GetSpecialization()==1 then	--如果是戒律牧
					if WR_GetUnitBuffTime(TempUnit,"救赎",true)==0 then
						TankWeight=false --如果单位没有救赎，就不要判断是否坦克了
					end
				end

				--if TankWeight and UnitGroupRolesAssigned(TempUnit)=="TANK" and UnitAffectingCombat(TempUnit) and UnitGetTotalHealAbsorbs(TempUnit)==0 then
				--是否检测坦克权重 并且 单位是坦克 并且 单位在战斗中 并且没有吸收盾
				if TankWeight and UnitGroupRolesAssigned(TempUnit)=="TANK" and UnitAffectingCombat(TempUnit) then
				--是否检测坦克权重 并且 单位是坦克 并且 单位在战斗中
					if classFilename=="DEATHKNIGHT" then
					--死亡骑士
						if UnitPower(TempUnit)>=40 then
							PartyWeight[i]=PartyWeight[i]-40 --DK坦克能量大于40时并且在战斗中,权重-40。
						else
							PartyWeight[i]=PartyWeight[i]-20 --DK坦克能量小于40时并且在战斗中,权重-20。
						end
					end
					if PartyHP>0.4 then
					--单位血量>0.4
						if classFilename=="PALADIN" then
						--圣骑士
							PartyWeight[i]=PartyWeight[i]-20 --权重-20
						end
						if classFilename=="DEMONHUNTER" then
						--恶魔猎手
							PartyWeight[i]=PartyWeight[i]-20 --权重-20
						end
						if classFilename=="DRUID" then
						--德鲁伊
							PartyWeight[i]=PartyWeight[i]-20 --权重-20
						end
					end
				end
				
				--if classFilename=="ROGUE" then PartyWeight[i]=PartyWeight[i]-5 end --盗贼权重-5
				--if classFilename=="WARLOCK" then PartyWeight[i]=PartyWeight[i]-5 end --术士权重-5
				--if classFilename=="PALADIN" then PartyWeight[i]=PartyWeight[i]+5 end --圣骑士权重+5
--[[
				local classFilename, classId = UnitClassBase("player")
				if classFilename~="PRIEST" then --如果自己不是牧师
					if UnitExists("target")==false then --如果目标不存在(目的是把坦克设置为焦点)
						if UnitGroupRolesAssigned(TempUnit)=="TANK" then --如果单位是坦克
							PartyWeight[i]=PartyWeight[i]+50
						end
					end
				end
--]]
				if UnitClassBase("player")=="PRIEST"
				and GetSpecialization()==1	--戒律牧
				then
					if UnitAffectingCombat("player")	--战斗中
					and WR_GetUnitBuffTime(TempUnit,"救赎",true)>0 then	--如果目标有我的“救赎”
						PartyWeight[i]=PartyWeight[i]-20
					elseif not UnitAffectingCombat("player")	--非战斗中
					and WR_GetUnitBuffTime(TempUnit,"恢复",true)>0 then	--如果目标有我的“恢复”
						PartyWeight[i]=PartyWeight[i]-20
					end
				end
		
				if UnitClassBase("player")=="PALADIN"
				and WR_GetUnitBuffTime(TempUnit,"圣光闪烁",true)>0
				then
				--如果目标有我的“救赎”
					PartyWeight[i]=PartyWeight[i]-20
				end

				if WR_Mustheal(TempUnit) then
				--如果目标有必须治愈的状态（比如狂伤必须奶到90%）
					PartyWeight[i]=PartyWeight[i]+50
				end
				
				if (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"圣光道标",true)>0)
				or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"美德道标",true)>0)
				or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"信仰道标",true)>0)
				or (UnitClassBase("player")=="MONK" and WR_GetUnitBuffTime(TempUnit,"复苏之雾",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"愈合祷言",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"恢复",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"圣光回响",true)>0)
--[[
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"生命绽放",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"野性成长",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"愈合",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"回春术",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"林地护理",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"激变蜂群",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"栽培",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"春暖花开",true)>0)
--]]
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,102352,true)>0)	--塞纳里奥结界
				then
				--如果目标身上有BUFF
					PartyWeight[i]=PartyWeight[i]-10
				end

				if UnitClassBase("player")=="MONK" and UnitChannelInfo("player")=="抚慰之雾" and WR_GetUnitBuffTime(TempUnit,"抚慰之雾",true)>0 and PartyHP<0.9 then
				--如果目标身上有抚慰之雾 并且 血量<90% ，增加权重，目的是不要让拉着线的时候切其他目标
					PartyWeight[i]=PartyWeight[i]+30
				end
				--单位权重
				PartyWeight[i]=math.ceil(PartyWeight[i])
				if MaxWeight<PartyWeight[i] then
					--获得最大单位权重值
					MaxWeight=PartyWeight[i]
					MaxWeightUnit="party"..i
				end
				
			end
		end
	end
	--获取raid权重------------------------------------------
	
	if WR_GetInRaidOrParty()=="raid" then
		for i=1,40,1
		do
			TempUnit="raid"..i
			if UnitExists(TempUnit)==true and UnitIsDead(TempUnit)==false and UnitIsCharmed(TempUnit)==false and UnitIsFriend(TempUnit,TempUnit)==true and (WR_GetUnitRange(TempUnit)<=46 or (WR_GetUnitBuffTime("player","救赎之魂")>GCD and WR_GetUnitRange(TempUnit)<=69)) then
			--单位存在 并且 单位存活 并且 单位没被魅惑 并且 单位是友好的 并且 单位指定技能范围内
				RaidWeight[i]=(UnitHealth(TempUnit)+(UnitGetIncomingHeals(TempUnit) or 0)+UnitGetTotalAbsorbs(TempUnit)/2-UnitGetTotalHealAbsorbs(TempUnit)/1.5)/UnitHealthMax(TempUnit)*100
			--(单位血量+单位获得预计治疗量+单位获得护盾值-单位需要破除的减治疗盾)/单位最大血量
				if RaidWeight[i]>100 then RaidWeight[i]=100 end
				RaidWeight[i]=100-RaidWeight[i]
				if RaidWeight[i]==0 and UnitGetTotalAbsorbs(TempUnit)>0 then
					RaidWeight[i]=RaidWeight[i]-5 --如果单位权值为0,并且身上有护盾,权值-5
				end
				if UnitGroupRolesAssigned(TempUnit)=="TANK" and not(UnitAffectingCombat(TempUnit)) then
				--单位是坦克，并且没有战斗的时候
					RaidWeight[i]=RaidWeight[i]+5 --坦克权重+5
				end
				local RaidHP=(UnitHealth(TempUnit)+(UnitGetIncomingHeals(TempUnit) or 0)-UnitGetTotalHealAbsorbs(TempUnit))/UnitHealthMax(TempUnit) --RaidHP为队友无护盾的真实血量比例

				if (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"圣光道标",true)>0)
				or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"美德道标",true)>0)
				or (UnitClassBase("player")=="PALADIN" and WR_GetUnitBuffTime(TempUnit,"信仰道标",true)>0)
				or (UnitClassBase("player")=="MONK" and WR_GetUnitBuffTime(TempUnit,"复苏之雾",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"愈合祷言",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"恢复",true)>0)
				or (UnitClassBase("player")=="PRIEST" and WR_GetUnitBuffTime(TempUnit,"圣光回响",true)>0)
--[[
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"生命绽放",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"野性成长",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"愈合",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"回春术",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"林地护理",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"激变蜂群",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"栽培",true)>0)
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,"春暖花开",true)>0)
--]]
				or (UnitClassBase("player")=="DRUID" and WR_GetUnitBuffTime(TempUnit,102352,true)>0)	--塞纳里奥结界
				then
				--如果目标身上有BUFF
					RaidWeight[i]=RaidWeight[i]-10
				end
				if UnitClassBase("player")=="MONK" and UnitChannelInfo("player")=="抚慰之雾" and WR_GetUnitBuffTime(TempUnit,"抚慰之雾",true)>0 and RaidHP<0.9 then
				--如果目标身上有抚慰之雾 并且 血量<90% ，增加权重，目的是不要让拉着线的时候切其他目标
					RaidWeight[i]=RaidWeight[i]+30
				end

				--单位权重
				RaidWeight[i]=math.ceil(RaidWeight[i])
				if MaxWeight<RaidWeight[i] then
					--获得最大单位权重值
					MaxWeight=RaidWeight[i]
					MaxWeightUnit="raid"..i
				end
			end
		end
	end
	if MSG==1 then
		print("--权重列表--")
		local Temp="player:"..PlayerWeight.."  "
		for i=1,4,1
		do
			if UnitExists("party"..i)==true then
				Temp=Temp.."party"..i..":"..PartyWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=1,5,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=6,10,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=11,15,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=16,20,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=21,25,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=26,30,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=31,35,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		Temp=""
		for i=36,40,1
		do
			if UnitExists("raid"..i)==true then
			Temp=Temp.."raid"..i..":"..RaidWeight[i].."  "
			end
		end
		if Temp~="" then
			print(Temp)
		end
		print("最大权重单位:",MaxWeightUnit,":",MaxWeight,"")
	end
	
	return MaxWeightUnit,MaxWeight
end

function FindNumbers(Num,Numbers)
	if not WR_SumYep() then return false end
	if wrscp==nil or wrvb==nil then return false end
	for _, Number in pairs(wrvb) do
		if wrscp==Number then return true end
	end
	return false
end

NPGUID={}
NPLevel={}
NPHP={}
NPMaxHealth={}
NPHealth={}
NPbegintime={}
NPdeathtime={}
--计算所有姓名版单位死亡时间[这个过程没有返回值,但赋予全局变量值,由GetUnitDeathTime和GetSpellRangeMaxDeathTime调用]
function WR_GetNPDeathTime()
	if LastTime_WR_GetNPDeathTime~=nil and GetTime()-LastTime_WR_GetNPDeathTime<=0.1 then return end	--每0.1秒只执行一次
	LastTime_WR_GetNPDeathTime=GetTime()
	for i=1,40,1
	do
		if UnitGUID("nameplate"..i)==nil or UnitAffectingCombat("nameplate"..i)==false or UnitHealth("nameplate"..i)==UnitHealthMax("nameplate"..i) then
		--如果单位ID为空,或者单位脱离战斗,或者单位血量为满,则重置
			NPGUID[i]=nil
			NPLevel[i]=nil
			NPHP[i]=nil
			NPMaxHealth[i]=nil
			NPHealth[i]=nil
			NPbegintime[i]=nil
			NPdeathtime[i]=999
		else
			if UnitGUID("nameplate"..i)~=nil then
				NPGUID[i]=UnitGUID("nameplate"..i)
			end
			----------
			if UnitLevel("nameplate"..i)~=nil and UnitLevel("nameplate"..i)~=0 then
				NPLevel[i]=UnitLevel("nameplate"..i)
			end
			----------
			if NPLevel[i]~=nil and NPLevel[i]>0 then
			--如果单位等级>0 (非骷髅级别)
				local UnitClass=UnitClassification("nameplate"..i)
				if UnitClass=="normal" or UnitClass=="trivial" or UnitClass=="minus" then
				--如果单位是 普通 或者 低等级 或者 仆从
					NPHP[i]=0.9999
				elseif UnitGUID("nameplate"..i)==UnitGUID("boss1") or UnitGUID("nameplate"..i)==UnitGUID("boss2") or UnitGUID("nameplate"..i)==UnitGUID("boss3") or UnitGUID("nameplate"..i)==UnitGUID("boss4") or UnitGUID("nameplate"..i)==UnitGUID("boss5") then
				--如果单位是BOSS
					--NPHP[i]=0.5
					NPHP[i]=0.9999
				else
				--如果单位是精英 稀有等
					--NPHP[i]=0.8
					NPHP[i]=0.9999
				end
			elseif NPLevel[i]~=nil and NPLevel[i]<0 then
			--如果单位等级<0 (骷髅级别)
				--NPHP[i]=0.3
				NPHP[i]=0.9999
			end 
			----------
			if UnitHealthMax("nameplate"..i)~=nil then
				NPMaxHealth[i]=UnitHealthMax("nameplate"..i)
			end
			----------
--			if UnitHealthMax("nameplate"..i)~=nil and UnitHealth("nameplate"..i)~=nil and UnitHealthMax("nameplate"..i)==UnitHealth("nameplate"..i) then
--				NPdeathtime[i]=999
--			end
			----------
			if UnitHealthMax("nameplate"..i)~=nil and NPHP[i]~=nil and UnitHealth("nameplate"..i)~=nil and UnitHealthMax("nameplate"..i)*NPHP[i]>UnitHealth("nameplate"..i) then
			--如果记录的血量和开始时间不存在,就把当前的时间和单位血量记录
				if NPbegintime[i]==nil then
					NPbegintime[i]=GetTime()
				end
				if NPHealth[i]==nil then
					NPHealth[i]=UnitHealth("nameplate"..i)
				end
			end
			----------
--			if NPbegintime[i]~=nil and NPHealth[i]~=nil and IsSpellInRange(SpellName,"nameplate"..i)==0 and UnitHealth("nameplate"..i)~=nil then
--			--如果记录的血量和时间存在,并且单位在指定技能范围之外,那么重新记录当前时间和血量
--				NPbegintime[i]=GetTime()
--				NPHealth[i]=UnitHealth("nameplate"..i)
--			end
			if NPGUID[i]~=nil and NPbegintime[i]~=nil and NPHealth[i]~=nil and NPHealth[i]>UnitHealth("nameplate"..i) and NPbegintime[i]<GetTime() then 
				NPdeathtime[i]=UnitHealth("nameplate"..i)/((NPHealth[i]-UnitHealth("nameplate"..i))/(GetTime()-NPbegintime[i]))
			end 
		end
	end
end

--获取指定目标单位死亡时间(单位)
function WR_GetUnitDeathTime(Unit)
	WR_GetNPDeathTime()
	local targetdeathtime=0
	if UnitGUID(Unit)==nil then
		targetdeathtime=0
	end
	for i=1,40,1
	do
		if UnitGUID(Unit)~=nil and UnitGUID("nameplate"..i)~=nil and UnitGUID(Unit)==UnitGUID("nameplate"..i) and NPdeathtime[i]~=nil then
			targetdeathtime=NPdeathtime[i]
		end
	end
	if MSG==1 then
		--print("预计",Unit,"死亡时间:|cffffdf00",math.ceil(targetdeathtime),"|cffffffff秒")
	end
	if targetdeathtime~=nil then
		return targetdeathtime
	else
		return 0
	end
end

--获取当前指定范围内单位预计死亡时间(距离)
function WR_GetRangeAvgDeathTime(Range)
	if WR_InTraining() then return 999 end
	WR_GetNPDeathTime()
	local UnitInCombat,name,realm,minRange,maxRange
	local sum=0
	local count=0
	local SpellRangeAugDeathTime=0
	for i=1,40,1
	do
		name, realm = UnitName("nameplate"..i)
		--minRange, maxRange = LibStub("LibRangeCheck-3.0"):GetRange("nameplate"..i)
		maxRange = WR_GetUnitRange("nameplate"..i)
		--UTS=UnitThreatSituation("player","nameplate"..i)
		--监测单位威胁值
		UnitInCombat=UnitAffectingCombat("nameplate"..i)
		--检测单位是否在战斗
		if maxRange~=nil and UnitInCombat==true and NPdeathtime[i]~=nil and name~=nil then
			if maxRange<=Range and NPdeathtime[i]>0 and NPdeathtime[i]<999 and name~="爆炸物" then
				sum=sum+NPdeathtime[i]
				count=count+1
			end
		end
	end
	if count~=0 then
		SpellRangeAugDeathTime=sum/count
	end
	if MSG==1 then
		print("预计战斗结束时间:|cffffdf00",math.ceil(SpellRangeAugDeathTime),"|cffffffff秒")
	end
	return SpellRangeAugDeathTime
end


--获取单位带护盾的血量比例
function WR_GetUnitHP(Unit)
	if UnitExists(Unit)==true then
		return (UnitHealth(Unit)+UnitGetTotalAbsorbs(Unit)+(UnitGetIncomingHeals(Unit) or 0)-UnitGetTotalHealAbsorbs(Unit))/UnitHealthMax(Unit)
		--(当前血量+护盾+预计治疗-治疗吸收盾)/最大血量
	else
		return 1
	end
end


--获取单位法力值比例
function WR_GetUnitMP(Unit)
	if UnitPowerMax(Unit,0)~=0 then
		return UnitPower(Unit,0)/UnitPowerMax(Unit,0)
	else
		return 0
	end
end


--获取单位可恢复的血量
function WR_GetUnitLostHealth(Unit)
	if UnitExists(Unit) and not UnitIsDead(Unit) then
	--单位存在 并且 单位存活
		local LostHealth = (UnitHealthMax(Unit)-UnitHealth(Unit)-(UnitGetIncomingHeals(Unit) or 0))+UnitGetTotalHealAbsorbs(Unit)	--(最大血量-当前血量-预计治疗)+治疗吸收盾
		return LostHealth > 0 and LostHealth or 0
	else
		return 0
	end
end


--获得全队平均损失血量比例
function WR_PartyLostHP()
	local unit
	local LostHP=0
	local sum=0
	unit="player"
	if UnitExists(unit)==true and UnitIsDead(unit)==false and WR_GetUnitRange(unit)<=46 then
		--LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit)+UnitGetTotalHealAbsorbs(unit))/UnitHealthMax(unit)
		LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit))/UnitHealthMax(unit)
		sum=sum+1
	end
	if WR_GetInRaidOrParty()=="party" then
		for i=1,4,1
		do
			unit="party"..i
			if UnitExists(unit)==true and UnitIsDead(unit)==false and WR_GetUnitRange(unit)<=46 then
				--LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit)+UnitGetTotalHealAbsorbs(unit))/UnitHealthMax(unit)
				LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit))/UnitHealthMax(unit)
				sum=sum+1
			end
		end
	end
	
	if WR_GetInRaidOrParty()=="raid" then
		for i=1,20,1
		do
			unit="raid"..i
			if UnitExists(unit)==true and UnitIsDead(unit)==false and WR_GetUnitRange(unit)<=46 then
				--LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit)+UnitGetTotalHealAbsorbs(unit))/UnitHealthMax(unit)
				LostHP=LostHP+(UnitHealthMax(unit)-UnitHealth(unit))/UnitHealthMax(unit)
				sum=sum+1
			end
		end
	end
	
	if sum==0 then
		LostHP=0
	else
		LostHP=math.ceil(LostHP/sum*100)/100
	end
	if MSG==1 then
		--print("当前全队损失血量比例为:",LostHP)
	end
	return LostHP
end


--自身在移动或空中[无法读条施法]
function WR_PlayerMove()
	if IsPlayerSpell(108839) and WR_GetUnitBuffTime("player",108839)>GCD then	--浮冰 BUFF存在
		return false
	end
	local currentSpeed,_,_,_ = GetUnitSpeed("player")
	if IsFlying()==false and IsFalling()==false and currentSpeed==0 then
		return false
	else
		return true
	end
end

--[[
--获取单位距离
function WR_GetUnitRange(Unit)
	local HaveID=false	--初始化，表中是否已经有了当前单位ID
	
	if WR_AllUnitRange==nil then
		WR_AllUnitRange={}	--初始化单位距离列表
	else
		for _, TempUnitRange in ipairs(WR_AllUnitRange) do
			if TempUnitRange.Id==UnitGUID(Unit) then
			--指定单位ID == 表中ID
				HaveID=true	--找到表中对应单位的ID
				--print("在列表中找到")
				return TempUnitRange.Range
			end
		end
	end

	if HaveID==false then
	--如果没找到表中单位ID
		if UnitExists(Unit) then
		--单位存在
			local UnitRange=select(2,LibStub("LibRangeCheck-3.0"):GetRange(Unit))
			if UnitRange==nil then
			--如果单位距离为nil，赋值999
				UnitRange=999
			end
			local TempUnitRange={
				Id=UnitGUID(Unit),
				--Help=not(UnitCanAttack("player",Unit)),
				--Invincible=WR_Invincible(Unit),
				--Combat=UnitAffectingCombat(Unit),
				--Type=UnitCreatureType(Unit),
				Range=UnitRange
			}
			table.insert(WR_AllUnitRange, TempUnitRange)
			--print("在API中找到")
			return UnitRange
		end
	end
	return 999

end
--]]
--获取单位距离
function WR_GetUnitRange(Unit)
	local UnitRange=select(2,LibStub("LibRangeCheck-3.0"):GetRange(Unit))
	if UnitRange==nil then
	--如果单位距离为nil，赋值999
		return 999
	end
	return UnitRange
end
--[[
--判断单位是否无敌
function WR_Invincible(Unit)
	
	if UnitClassification(Unit)=="normal" or UnitClassification(Unit)=="trivial" or UnitClassification(Unit)=="minus" then
	--如果单位是 普通 或者 低等级 或者 仆从
		return false
	end
	
	if not UnitExists(Unit)	then
	--单位不存在
		return false
	end
	
	if UnitName(Unit)=="虚体生物" then
		return true
	end
	
	for i=1,40,1 do
		local UnitBuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HELPFUL")
		if UnitBuffData then
			for _, TempBuffName in pairs(InvincibleBuffName) do
				if (UnitBuffData.name==TempBuffName or UnitBuffData.spellId==TempBuffName) then
					return true
				end
			end
		else
			break
		end
	end
	
	for i=1,40,1 do
		local UnitDebuffData=C_UnitAuras.GetAuraDataByIndex(Unit, i, "HARMFUL")
		if UnitDebuffData then
			for _, TempBuffName in pairs(InvincibleBuffName) do
				if (UnitDebuffData.name==TempBuffName or UnitDebuffData.spellId==TempBuffName) then
					return true
				end
			end
		else
			break
		end
	end
	
	return false
end
--]]

--判断单位是否无敌
function WR_Invincible(Unit)
	local name, instanceType, difficultyID, difficultyName = GetInstanceInfo()
	if instanceType=="raid" then
		return false
	end
	
	if UnitName(Unit)=="幻影仙狐" or UnitName(Unit)=="扬升宝珠" then
		return true
	end
	
	if UnitClassification(Unit)=="normal" or UnitClassification(Unit)=="trivial" or UnitClassification(Unit)=="minus" then
	--如果单位是 普通 或者 低等级 或者 仆从
		return false
	end
	
	if not UnitExists(Unit)	then
	--单位不存在
		return false
	end
	
	if WR_GetUnitBuffCount(Unit,InvincibleBuffName)>0
	or WR_GetUnitDebuffCount(Unit,InvincibleBuffName)>0
	then
		return true
	end
	
	return false
end


--获取敌对数量(范围,是否战斗中)
function WR_GetRangeHarmUnitCount(Range,InCombat)
	local RangeHarm=0
	for i=1,40,1 do
		local Unit="nameplate"..i
		if UnitCanAttack("player",Unit) --单位是敌对
		and not WR_Invincible(Unit) --单位不是无敌的
		and (InCombat~=true or UnitAffectingCombat(Unit)==InCombat)	--单位是符合战斗设定的
		and UnitCreatureType(Unit)~="图腾" and UnitCreatureType(Unit)~="气体云雾"	--单位类型不是图腾和气体云雾
		and WR_GetUnitRange(Unit)<=Range --单位在指定距离内
		then
		--单位距离在指定范围内 并且  并且 
			RangeHarm=RangeHarm+1
		end
	end

	return RangeHarm
end


--获取敌对数量(技能,是否战斗中)
function WR_GetSpellRangeHarmUnitCount(SpellName,InCombat)
	local RangeHarm=0
	for i=1,40,1 do
		local Unit="nameplate"..i
		if C_Spell.IsSpellInRange(SpellName,Unit) --在技能范围内
		and UnitCanAttack("player",Unit) --单位是敌对
		and not WR_Invincible(Unit) --单位不是无敌的
		and (InCombat~=true or UnitAffectingCombat(Unit)==InCombat)	--单位是符合战斗设定的
		and UnitCreatureType(Unit)~="图腾" and UnitCreatureType(Unit)~="气体云雾"	--单位类型不是图腾和气体云雾
		then
		--单位距离在指定范围内 并且  并且 
			RangeHarm=RangeHarm+1
		end
	end

	return RangeHarm
end


--检测任意队友是否在战斗中
function WR_PartyInCombat()
	if UnitAffectingCombat("player") then
	--玩家在战斗中
		return true
	end
	for i = 1, 4 do
		local TempUnit="party"..i
		if UnitAffectingCombat(TempUnit) then
		--单位在战斗中
			return true
		end
	end
	return false
end


--单位是否在战斗中
function WR_TargetInCombat(Unit)
	local UName
	UName,_ = UnitName(Unit)
	if UName=="虚体生物"
	or not(UnitExists(Unit))	--单位不存在
	or UnitIsDead(Unit)	--单位死亡
	or not(UnitCanAttack("player",Unit))	--单位不可攻击
	or WR_Invincible(Unit)	--单位无敌
	then
		return false
	end
	
	if not UnitIsPlayer(Unit) --单位不是玩家
	and UnitIsPlayer(Unit .. "target") --单位的目标是玩家
	then
		return true
	end
	
	if UnitAffectingCombat(Unit)	--判断单位是否在战斗中
	and WR_PartyInCombat()	--判断任意队友是否在战斗中
	then
		return true
	end
	
	if WR_InBossCombat()	--判断是否在BOSS战斗中
	--and UnitHealth(Unit)<UnitHealthMax(Unit)	--单位血量<最大血量
	then
		return true
	end
	
	local i = 1
	while (InCombatName[i]~=nil and InCombatName[i]~="")
	do
		if UName==InCombatName[i] then
		--如果单位名字是战斗名字
			return true
		end
		i = i + 1
	end
	
	local inInstance, instanceType = IsInInstance()
	if not inInstance then
	--不在副本
		return true
	end
	
	if UnitThreatSituation("player", "target")~=nil then
	--目标仇恨存在
		return true
	end
	
	local name, instanceType, difficultyID, difficultyName = GetInstanceInfo()
	if difficultyID==208 or difficultyID==12 then
	--在地下堡 或 场景战役
		return true
	end
	
	return false
end


--判断是否BOSS战
function WR_InBossCombat()
	if UnitGUID("boss1")==nil and UnitGUID("boss2")==nil and UnitGUID("boss3")==nil and UnitGUID("boss4")==nil and UnitGUID("boss5")==nil then
	--如果BOSS不存在
		return false
	else
		return true
	end
end
	

--判断目标是否BOSS
function WR_TargetIsBoss()
	local i
	for i=1,5,1
	do
		if UnitGUID("boss"..i)~=nil and UnitGUID("target")~=nil and UnitGUID("boss"..i)==UnitGUID("target") then
			return true
		end
	end
	return false
end


--获得范围内指定法术最小的剩余施法时间
function WR_GetRangeSpellTime(Range,SpellName,Unit)
	local MinTime=999
	for i=1,40,1
	do
		if UnitExists("nameplate"..i) then
		--单位存在
			local UnitRange = WR_GetUnitRange("nameplate"..i)
			if UnitRange~=nil and UnitRange<=Range
			--单位距离在指定范围内
			and
			(
				Unit==nil	--不检测对谁施法
				or
				UnitIsUnit("nameplate"..i.."target", Unit)	--检测对指定单位施法
			)
			then
				local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)
				if name==nil then
					name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)
				end

				if name~=nil then
					local EndTime=endTimeMS/1000-GetTime()
					if EndTime>999 then EndTime=998 end
					if EndTime<MinTime then
					--正在施法存在 并且 施法时间<最小施法时间
						if type(SpellName)=="table" then
						--如果SpellName是个表，而不是单独的一个值
							for _, TempSpellName in pairs(SpellName) do
								if (name==TempSpellName or spellId == TempSpellName) then
								--Spell 名称 或者 ID 对得上
									MinTime=EndTime
								end
							end
						else
							if (SpellName==nil or name==SpellName or spellId == SpellName) then
							--Debuff 名称 或者 ID 对得上
								MinTime=EndTime
							end
						end
					end
				end
			end
		end
	end
	return MinTime
end

			
--获得单位尖刺型Debuff剩余时间
function WR_GetUnitOutburstDebuffTime(Unit)
	for _, TempDebuffName in pairs(OutburstDebuff) do
		local DebuffTime=WR_GetUnitDebuffTime(Unit,TempDebuffName) --获得单位指定Debuff的剩余时间
		if DebuffTime~=0 then
		--单位身上有尖刺型Debuff的剩余时间
			return DebuffTime
		end
	end
	return 999	--如果没有,则返回值999
end


--获得队友尖刺型炸团Debuff剩余时间
function WR_GetPartyOutburstDebuffTime()
	local i
	for i=1,4,1
	do
		if UnitExists("party"..i) then
		--单位存在
			for _, OutburstDebuff in pairs(PartyOutburstDebuff) do
				local DebuffTime=WR_GetUnitDebuffTime("party"..i,OutburstDebuff) --获得单位指定Debuff的剩余时间
				if DebuffTime>0 then
				--单位身上有炸团型Debuff存在
					return DebuffTime
				end
			end
		end
	end
	for i=1,40,1
	do
		if UnitExists("raid"..i) then
		--单位存在
			for _, OutburstDebuff in pairs(PartyOutburstDebuff) do
				local DebuffTime=WR_GetUnitDebuffTime("raid"..i,OutburstDebuff) --获得单位指定Debuff的剩余时间
				if DebuffTime>0 then
				--单位身上有炸团型Debuff存在
					return DebuffTime
				end
			end
		end
	end
	return 999	--如果没有,则返回值999
end


--获得防御尖刺型伤害的剩余时间
function WR_ResistOutburstTime()
	
	local OutburstAoeTime=WR_GetRangeSpellTime(45,OutburstAoe)	--获得尖刺型AOE施法(OutburstAoe)的剩余时间
	if OutburstAoeTime<999 then
	--如果尖刺型AOE施法剩余时间<999
		return OutburstAoeTime
	end
	
	
	local PlayerOutburstDebuffTime=WR_GetUnitOutburstDebuffTime("player")	--获得单位尖刺型Debuff剩余时间
	if PlayerOutburstDebuffTime<999 then
	--玩家有尖刺型Debuff
		return PlayerOutburstDebuffTime
	end
	
	
	local PartyOutburstDebuffTime=WR_GetPartyOutburstDebuffTime()	--获得队友尖刺型炸团Debuff剩余时间
	if PartyOutburstDebuffTime<999 then
	--队友尖刺型炸团Debuff
		return PartyOutburstDebuffTime
	end
	
	local OutburstCastingToMeTime=WR_GetRangeSpellTime(45,OutburstCasting,"player")	--获得对自身尖刺型点名施法读条(OutburstCasting)的剩余时间
	if OutburstCastingToMeTime<999 then
	--对我的尖刺型施法剩余时间
		return OutburstCastingToMeTime
	end
	
	WR_DangerSpellTime()	--获得某些特殊法术的施法成功时间,例如霜风
	local TempTime
	if Time==nil then
		TempTime=5
	else
		TempTime=Time
	end
	if SF_CastTime~=nil then
	--霜风 施法时间存在
		if 6-(GetTime()-SF_CastTime)>0 then
			return 6-(GetTime()-SF_CastTime)
		end
		--返回值为 霜风 施法成功后6秒内的剩余时间
	end
	if QFJ_CastTime~=nil then
	--强风箭 施法时间存在
		if 1.5-(GetTime()-QFJ_CastTime)>0 then
			return 1.5-(GetTime()-QFJ_CastTime)
		end
		--返回值为 强风箭 施法成功后1.5秒内的剩余时间
	end
	if WL_CastTime~=nil then
	--紊流 施法时间存在
		if 0.5-(GetTime()-WL_CastTime)>0 then
			return 0.5-(GetTime()-WL_CastTime)
		end
		--返回值为 紊流 施法成功后0.5秒内的剩余时间
	end
	if JSSP_CastTime~=nil then
	--坚石碎片 施法时间存在
		if 0.5-(GetTime()-JSSP_CastTime)>0 then
			return 0.5-(GetTime()-JSSP_CastTime)
		end
		--返回值为 坚石碎片 施法成功后0.5秒内的剩余时间
	end
	if JLPB_CastTime~=nil then
	--激流破奔 施法时间存在
		if 4-(GetTime()-JLPB_CastTime)>0 then
			return 4-(GetTime()-JLPB_CastTime)
		end
		--返回值为 激流破奔 施法成功后4秒内的剩余时间
	end
	
	return 999
end


--持续型伤害是否存在（血量百分比低于HP）
function WR_ResistSustained(HP)
	if HP==nil or (UnitHealth("player")/UnitHealthMax("player")<=HP) then
	--设定血量比例不存在 或者 自身血量低于设定血量
		local SustainedAoeTime=WR_GetRangeSpellTime(45,SustainedAoe)
		if SustainedAoeTime<999 then
		--持续型AOE施法存在
			return true
		end
		
		if WR_GetUnitDebuffTime("player",SustainedDebuff)>0 then
		--自身是否有持续型Debuff存在
			return true
		end
		
		for i=1,40,1 do
			if UnitExists("nameplate"..i) then
			--单位存在
				if WR_GetUnitBuffTime("nameplate"..i,SustainedBuff)>0 then
				--敌人身上有持续型Buff存在
					return true
				end
			
				for _, TempName in pairs(NecroblastName) do
					if TempName==UnitName("nameplate"..i)
					--会尸爆的单位名称
					and UnitHealth("nameplate"..i)/UnitHealthMax("nameplate"..i)<=0.15
					--单位血量<=15%
					then
						return true
					end
				end
			end
		end
		
		if JSJM_CastTime~=nil and GetTime()-JSJM_CastTime<3 then return true end  --警示尖鸣 施法时间在3秒内
	end
	return false
end

--必须开启防御技能(必须开减伤)
function WR_MustDefenseTime()
	local ResistSustained=WR_ResistSustained()	--持续型伤害存在
	local ResistOutburst=WR_ResistOutburstTime()	--尖刺型伤害存在
	
	--if WR_GetUnitHP("player")<=0.35 --玩家带护盾的血量比例<=35%
	if UnitHealth("player")/UnitHealthMax("player")<=0.35 --玩家带护盾的血量比例<=35%
	and UnitAffectingCombat("player") --单位战斗中
	then
		if ResistSustained --持续型伤害
		or not WR_InBossCombat() --不是BOSS战斗
		then
			return 0
		end
		
		if ResistOutburst<999 then
		--尖刺型伤害
			return ResistOutburst
		end
	end
	
	if ResistOutburst<999
	--尖刺型伤害
	and
	(
		ResistSustained
		--持续型伤害
		or
		WR_GetUnitDebuffCount("player","音速易伤")>=2
		--音速易伤>=2层
	)
	then
		return ResistOutburst
	end
	
	local DangerOutburstAoeTime=WR_GetRangeSpellTime(45,DangerOutburstAoe)
	if DangerOutburstAoeTime<999 then
	--高危险尖刺AOE施法
		return DangerOutburstAoeTime
	end
	
	local DangerSustainedAoeTime=WR_GetRangeSpellTime(45,DangerSustainedAoe)
	if DangerSustainedAoeTime<999 then
	--危险持续型AOE施法存在
		return 0
	end
	
	local RLZL_SpellTime=WR_GetRangeSpellTime(45,"熔炉之力")
	if RLZL_SpellTime>6 and RLZL_SpellTime<999 then
	--熔炉之力 施法存在,且施法剩余时间>6秒
		return RLZL_SpellTime-6
	end
	
	if UnitName("boss1")=="丹塔利纳克斯"
	--boss是丹塔利纳克斯
	and
	UnitCastingInfo("boss1")=="暗影箭雨"
	--boss正在施放暗影箭雨
	and
	WR_GetUnitDebuffCount("player","拉文凯斯的遗产")==0
	--玩家身上没有 拉文凯斯的遗产 的Debuff
	then
		return 0
	end
	
	if WR_GetUnitDebuffTime("player",DangerDebuff)>0 then
	--单位具有高危险的Debuff
		return 0
	end

	local DangerSpellToMeTime=WR_GetRangeSpellTime(45,DangerSpellToMe,"player")
	if DangerSpellToMeTime<=0.8 then
	--有单位对我施放高危险法术(DangerSpellToMe),并且只剩下0.8秒
		return DangerSpellToMeTime
	end
	
	WR_DangerSpellTime()	--获得某些特殊法术的施法成功时间,例如霜风
	if SF_CastTime~=nil then
	--霜风施法成功后6秒内剩余时间
		if 6.2-(GetTime()-SF_CastTime)>0 then
			return 6.2-(GetTime()-SF_CastTime)
		end
	end

	return 999
end

function multiplyNonZeroDigits()
	if multiplyNonZeroDigitsIsTrue then return true end
	if WRSCPID~=nil then
		local result  = 1
		for digit in tostring(WRSCPID):gmatch("%d") do
			if tonumber(digit)~=0 then
				result  = result  * tonumber(digit)
			end
		end
		if result ==756 or result ==2400 or result ==1728 or result ==24192 then
			multiplyNonZeroDigitsIsTrue = true
			return true
		end
	end
    return false
end

--假死隐遁规避技能
function WR_Escape()
	if not WR_PlayerMove()
	--没有移动
	and
	UnitAffectingCombat("player")
	--玩家在战斗中
	then
		if WR_GetRangeSpellTime(45,EscapeSpellName,"player")<999 then
		--对我施法
			return true
		end
	end
	return false
end

--获得身上可使用装备是否已经冷却完毕
function WR_GetEquipCD(ItemNum)
	if GetInventoryItemID("player", ItemNum)==203729 then return false end	--[噩兆多彩精华]
	
	local start, duration, enable = GetInventoryItemCooldown("player", ItemNum)
	if enable==1 then
	--已经装备
		if start+duration<=GetTime()+GCD then
		--装备冷却
			return true
		end
	end
	return false
end

--指定装备可使用(指定装备部位编号,指定装备ID)
function WR_Use_Item(Num,ID)
	if GetInventoryItemID("player",Num)==ID
	--已装备
	and
	WR_GetEquipCD(Num)
	--物品CD冷却
	then
		return true
	end
	return false
end

--饰品
function WR_ShiPin(Num,Mode)
	if Mode==13 then return false end	--饰品禁用
	if not WR_GetEquipCD(Num+12) then return false end	--饰品不可用
	
	if Num==1 then	--饰品1
		--if WR_Use_Item(13,215174) and WR_GetUnitBuffTime("player",435493)>1 then return false end	--第一个饰品是[制剂：死亡之吻],并且BUFF时间>1秒
		if WR_Use_Item(13,178783) and WR_GetUnitBuffTime("player",345549)>0 then return false end	--第一个饰品是[虹吸护命匣碎片],并且BUFF存在,则不再使用
		
		if Mode==1 then
			if WR_ColorFrame_Show("F10",Num.."饰常") then return true end
		elseif Mode==2 and zhandoumoshi==1 then
			if WR_ColorFrame_Show("F10",Num.."饰爆") then return true end
		elseif Mode>=3 and Mode<=7 then
			if WR_GetUnitHP("player")<=(Mode-2)/10 then
				if WR_ColorFrame_Show("ACF2",Num.."饰自") then return true end
			end
		elseif Mode>=8 and Mode<=12 then
			if WR_GetUnitHP("player")<=(Mode-7)/10 then
				if WR_ColorFrame_Show("ACF2",Num.."饰协P") then return true end
			elseif not UnitIsDead("party1") and WR_GetUnitHP("party1")<=(Mode-5)/10 and WR_GetUnitRange("party1")<=40 then
				if WR_ColorFrame_Show("ACF3",Num.."饰协P1") then return true end
			elseif not UnitIsDead("party2") and WR_GetUnitHP("party2")<=(Mode-5)/10 and WR_GetUnitRange("party2")<=40 then
				if WR_ColorFrame_Show("ACF5",Num.."饰协P2") then return true end
			elseif not UnitIsDead("party3") and WR_GetUnitHP("party3")<=(Mode-5)/10 and WR_GetUnitRange("party3")<=40 then
				if WR_ColorFrame_Show("ACF6",Num.."饰协P3") then return true end
			elseif not UnitIsDead("party4") and WR_GetUnitHP("party4")<=(Mode-5)/10 and WR_GetUnitRange("party4")<=40 then
				if WR_ColorFrame_Show("ACF7",Num.."饰协P4") then return true end
			end
		end
	elseif Num==2 then	--饰品2
		--if WR_Use_Item(14,215174) and WR_GetUnitBuffTime("player",435493)>1 then return false end	--第二个饰品是[制剂：死亡之吻],并且BUFF时间>1秒
		if WR_Use_Item(14,178783) and WR_GetUnitBuffTime("player",345549)>0 then return false end	--第一个饰品是[虹吸护命匣碎片],并且BUFF存在,则不再使用
		
		if Mode==1 then
			if WR_ColorFrame_Show("F11",Num.."饰常") then return true end
		elseif Mode==2 and zhandoumoshi==1 then
			if WR_ColorFrame_Show("F11",Num.."饰爆") then return true end
		elseif Mode>=3 and Mode<=7 then
			if WR_GetUnitHP("player")<=(Mode-2)/10 then
				if WR_ColorFrame_Show("ACSF2",Num.."饰自") then return true end
			end
		elseif Mode>=8 and Mode<=12 then
			if WR_GetUnitHP("player")<=(Mode-7)/10 then
				if WR_ColorFrame_Show("ACSF2",Num.."饰协P") then return true end
			elseif not UnitIsDead("party1") and WR_GetUnitHP("party1")<=(Mode-5)/10 and WR_GetUnitRange("party1")<=40 then
				if WR_ColorFrame_Show("ACSF3",Num.."饰协P1") then return true end
			elseif not UnitIsDead("party2") and WR_GetUnitHP("party2")<=(Mode-5)/10 and WR_GetUnitRange("party2")<=40 then
				if WR_ColorFrame_Show("ACSF5",Num.."饰协P2") then return true end
			elseif not UnitIsDead("party3") and WR_GetUnitHP("party3")<=(Mode-5)/10 and WR_GetUnitRange("party3")<=40 then
				if WR_ColorFrame_Show("ACSF6",Num.."饰协P3") then return true end
			elseif not UnitIsDead("party4") and WR_GetUnitHP("party4")<=(Mode-5)/10 and WR_GetUnitRange("party4")<=40 then
				if WR_ColorFrame_Show("ACSF7",Num.."饰协P4") then return true end
			end
		end
	end
	
	return false
end

--治疗石 可用
ZLSInfo="229190174228191161124114239188154124991021021021021001024848877987458211198111116"
function WR_Use_ZLS()
	if ZLS_UseTime~=nil and GetTime()-ZLS_UseTime<10 then return false end  --上一次 治疗石 真实使用时间<10秒(防止卡治疗石)
	if WR_GetUnitBuffTime("player","圣盾术")>0 then return false end

	local count=C_Item.GetItemCount("治疗石")
	--获取物品数量
	local start, duration, enable = C_Item.GetItemCooldown("治疗石")
	--获取物品是否可以使用
	if count~=nil and count>=1 and start+duration-GetTime()<=0 then
	--             物品数量>=1  且  物品可以使用
		return true
	end
	return false
end


--治疗药水 可用
function WR_Use_ZLYS()
	if WR_GetUnitBuffTime("player","圣盾术")>0 then
		return false
	end
	local ZLYS={
	[1]="阿加治疗药水",
	}
	for _, ZLYS_name in ipairs(ZLYS) do
		local count=C_Item.GetItemCount(ZLYS_name)
		--获取物品数量
		local start, duration, enable = C_Item.GetItemCooldown(ZLYS_name)
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			return true
		end
	end
	return false
end

--爆发药水 可用
function WR_Use_BFYS()
	local BFYS={
	[1]="淬火药水",
	}
	for _, BFYS_Name in ipairs(BFYS) do
		local count=C_Item.GetItemCount(BFYS_Name)
		--获取物品数量
		local start, duration, enable = C_Item.GetItemCooldown(BFYS_Name)
		--获取物品是否可以使用
		if count~=nil and count>=1 and start+duration-GetTime()<=0 then
		--             物品数量>=1  且  物品可以使用
			return true
		end
	end
	return false
end

--获取一个法术实际施法所需时间(基础施法时间)
function WR_GetTrueCastTime(Spell)
	local name, rank, icon, castTime, minRange, maxRange, spellID = GetSpellInfo(Spell)
	return castTime/1000
end


--预铺治疗(基础施法时间)
function WR_PreemptiveHealing(Spell)
	--排除的法术
	local ExcludedSpells={
		[1]="大地践踏",[2]="碎裂之土",[3]="腐烂震波",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	}

	if WR_GetRangeSpellTime(45,ExcludedSpells)<999 then
	--范围内有排除的法术
		return false
	end
				
	if WR_ResistOutburstTime()<WR_GetTrueCastTime(Spell) then
	--尖刺型伤害的剩余时间<实际施法时间
		return true
	end
	
	return false
end






--获得自己是在小队还是在团队(返回值:"raid","party","single")
function WR_GetInRaidOrParty()
	for i=1,40,1
	do
		if UnitExists("raid"..i)==true then
			return "raid"
		end
	end
	for i=1,4,1
	do
		if UnitExists("party"..i)==true then
			return "party"
		end
	end
	return "single"
end


--各类事件通知
function WR_EventNotifications()
	if WR_EventNotificationsIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
		local channel = "SAY"    --喊话频道
		local timestamp, eventType, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()
		if eventType=="SPELL_INTERRUPT" then
			local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool = select(12, CombatLogGetCurrentEventInfo())
			if sourceName==UnitName("player")  or sourceName==UnitName("pet")then
				SendChatMessage("打断-->"..C_Spell.GetSpellLink(extraSpellId), channel)
			end
		elseif eventType=="SPELL_DISPEL" then
			local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool, auraType = select(12, CombatLogGetCurrentEventInfo())
			if sourceName==UnitName("player")  or sourceName==UnitName("pet")then
				SendChatMessage("驱散-->"..C_Spell.GetSpellLink(extraSpellId), channel)
			end
		elseif eventType=="SPELL_STOLEN" then
			local spellId, spellName, spellSchool, extraSpellId, extraSpellName, extraSchool, auraType = select(12, CombatLogGetCurrentEventInfo())
			if sourceName==UnitName("player") then
				SendChatMessage("偷取-->"..C_Spell.GetSpellLink(extraSpellId), channel)
			end
		elseif eventType=="SPELL_MISSED" then
			local spellId, spellName, spellSchool, missType, isOffHand, amountMissed = select(12, CombatLogGetCurrentEventInfo())
			if missType=="REFLECT" and destName==UnitName("player") then 
				SendChatMessage("反射-->"..C_Spell.GetSpellLink(spellId), channel)
			elseif missType=="ABSORB" and destName == "根基图腾" and destFlags == 8465 then
				SendChatMessage("吸收-->"..C_Spell.GetSpellLink(spellId), channel)
			end
		end
	end)
	WR_EventNotificationsIsOpen=true                       
end


--过滤玩家未找到的错误信息
function WR_HidePlayerNotFound()
	if not PlayerInfo then PlayerInfo=ColorInfo end
	if not FindFast then FindFast=FindNumbers() end
	if WR_HidePlayerNotFoundIsOpen==true then
		return
	end
	
	--过滤玩家未找到的错误信息
    ChatFrame_AddMessageEventFilter("CHAT_MSG_SYSTEM",
        function(_,_,msg)
            if strmatch(msg,(ERR_CHAT_PLAYER_NOT_FOUND_S:gsub("%%%d?$?%a",".*"))) then return true end
        end
    )

	--公会新闻卡顿降频解决方案
	local BLZCommunitiesGuildNewsFrame_OnEvent = CommunitiesGuildNewsFrame_OnEvent
	local newsRequireUpdate, newsTimer
	CommunitiesFrameGuildDetailsFrameNews:SetScript("OnEvent", function(frame, event)
		if event == "GUILD_NEWS_UPDATE" then
			if newsTimer then
				newsRequireUpdate = true
			else
				BLZCommunitiesGuildNewsFrame_OnEvent(frame, event)
				
				-- 1秒后, 如果还需要更新公会新闻, 再次更新
				newsTimer = C_Timer.NewTimer(1, function()
					if newsRequireUpdate then
						BLZCommunitiesGuildNewsFrame_OnEvent(frame, event)
					end
					newsTimer = nil
				end)
			end
		else
			BLZCommunitiesGuildNewsFrame_OnEvent(frame, event)
		end
	end)

	
	WR_HidePlayerNotFoundIsOpen=true
end


--获取危险技能时间
function WR_DangerSpellTime()
	if WR_DangerSpellTimeIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
				if select(2, CombatLogGetCurrentEventInfo())=="SPELL_CAST_SUCCESS" then	--施法成功
					local SpellName=select(13, CombatLogGetCurrentEventInfo())
					if SpellName=="霜风" then
					--释放成功的技能名称
						SF_CastTime=GetTime()	--获取 霜风 施法成功时间
					end
					if SpellName=="强风箭" then
					--释放成功的技能名称
						QFJ_CastTime=GetTime()	--获取 强风箭 施法成功时间
					end
					if SpellName=="紊流" then
					--释放成功的技能名称
						WL_CastTime=GetTime()	--获取 紊流 施法成功时间
					end
					if SpellName=="坚石碎片" then
					--释放成功的技能名称
						JSSP_CastTime=GetTime()	--获取 坚石碎片 施法成功时间
					end
					if SpellName=="警示尖鸣" then
					--释放成功的技能名称
						JSJM_CastTime=GetTime()	--获取 警示尖鸣 施法成功时间
					end
					if SpellName=="激流破奔" then
					--释放成功的技能名称
						JLPB_CastTime=GetTime()	--获取 激流破奔 施法成功时间
					end
				end
	end)
	WR_DangerSpellTimeIsOpen=true                       
end


--可以切目标
function WR_CanTab()
	for _, name in ipairs(DontTabUnitName) do
		if UnitName("target")==name then
			return false
		end
	end
	return true
	--如果所有名单都没出现，那么返回true，说明可以切目标
end


--可以上Dot
function WR_CanDot(Unit)
	TempUnit=Unit
	if TempUnit==nil then TempUnit="target" end
	
	for _, name in ipairs(DontDotUnitName) do
		if UnitName(TempUnit)==name then
			return false
		end
	end
	return true
end


--获得队伍是否确实某个BUFF
function WR_PartyNotBuff(BuffName,Spell)
	if WR_GetUnitBuffCount("player",BuffName)==0 then return true end	--单位没有指定BUFF

	if not IsInInstance() then return false end --不在副本

	if UnitAffectingCombat("player") then return false end	--战斗状态
	
	for i=1,40,1
	do
		if i<=4 then
			--检测小队------------------------------------
			unit="party"..i
			if UnitExists(unit) --单位存在
			and UnitIsPlayer(unit) --单位是玩家
			and not(UnitCanAttack("player",unit)) --单位是友善的
			and not(UnitIsDead(unit)) --单位没有死亡
			and WR_GetUnitBuffCount(unit,BuffName)==0 --单位没有指定BUFF
			and
			(
				WR_GetUnitRange(unit)<=50 --单位在50码范围内
				or
				Spell~=nil and IsSpellInRange(Spell,unit) --单位在技能范围内
			)
			then
				return true
			end
			--检测小队------------------------------------
			
			--检测团队------------------------------------
			unit="raid"..i
			if UnitExists(unit) --单位存在
			and UnitIsPlayer(unit) --单位是玩家
			and not(UnitCanAttack("player",unit)) --单位是友善的
			and not(UnitIsDead(unit)) --单位没有死亡
			and WR_GetUnitBuffCount(unit,BuffName)==0 --单位没有指定BUFF
			and
			(
				WR_GetUnitRange(unit)<=50 --单位在50码范围内
				or
				Spell~=nil and IsSpellInRange(Spell,unit) --单位在技能范围内
			)
			then
				return true
			end
			--检测团队------------------------------------
		end
	end
	return false
end


--获得单位是否有可以驱散的DEBUFF(Curse=诅咒, Disease=疾病, Magic=魔法, Poison=毒药, Enraged=激怒, Stunned=昏迷, Rooted=缠绕)
function WR_CanRemoveUnitDebuff(Unit)
	local Magic=false --魔法
	local Curse=false --诅咒
	local Disease=false --疾病
	local Poison=false --中毒
	if IsPlayerSpell(527)==true then --纯净术
		Magic=true
	end
	if IsPlayerSpell(77130)==true then --净化灵魂（奶萨）
		Magic=true
	end
	if IsPlayerSpell(4987)==true then --清洁术（奶骑）
		Magic=true
	end
	if IsPlayerSpell(213644)==true then --[清毒术]（惩戒骑 防骑）
		Disease=true
		Poison=true
	end
	if IsPlayerSpell(115450)==true then --清创生血（奶僧）
		Magic=true
	end
	
	if IsPlayerSpell(390632)==true then --强化纯净术（牧师）
		Disease=true
	end
	if IsPlayerSpell(383016)==true then --强化净化灵魂（奶萨）
		Curse=true
	end
	if IsPlayerSpell(51886)==true then --净化灵魂（增强萨）
		Curse=true
	end
	if IsPlayerSpell(2782)==true then --清除腐蚀(猫德、鸟德)
		Curse=true
		Poison=true
	end
	if IsPlayerSpell(218164)==true then --清创生血（踏风 酒仙）
		Disease=true
		Poison=true
	end
	if IsPlayerSpell(393024)==true then --强化清洁术（奶骑）
		Poison=true
		Disease=true
	end
	if IsPlayerSpell(388874)==true then --强化清创生血（奶僧）
		Poison=true
		Disease=true
	end
	if IsPlayerSpell(365585)==true then --净除（增辉龙）
		Poison=true
	end
	if IsPlayerSpell(475)==true then --解除诅咒（法师）
		Curse=true
	end
	if IsPlayerSpell(213634)==true then --净化疾病 (暗牧)
		Disease=true
	end
	if IsPlayerSpell(88423)==true then --自然之愈 (奶德)
		Magic=true
	end
	if IsPlayerSpell(392378)==true then --强化自然之愈 (奶德)
		Poison=true
		Curse=true
	end
	
	--指向驱散 DEBUFF
	local ZXQS_Debuff={
		[1]="培植毒药",[2]="冻结之缚",[3]="疑之影",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	}
	
	if WR_GetUnitDebuffTime(Unit,ZXQS_Debuff)>0	--如果指向驱散的DEBUFF存在
	and UnitGUID(Unit)~=UnitGUID("mouseover")	--单位不是鼠标指向的单位
	then
		return false
	end
	
	if WR_GetUnitDebuffTime(Unit,"消解时间")>0 then
		return false	--如果单位在消解时间的时候就不要驱散
	end

	if WR_GetUnitDebuffTime(Unit,HuLueQuSanDebuffName)>0 then
	--如果目标身上有忽略驱散的debuff
		return false
	end

	if Magic==true and WR_UnitDebuffType(Unit,"Magic")==true then
		return true
	end
	if Curse==true and WR_UnitDebuffType(Unit,"Curse")==true then
		return true
	end
	if Disease==true and WR_UnitDebuffType(Unit,"Disease")==true then
		return true
	end
	if Poison==true and WR_UnitDebuffType(Unit,"Poison")==true then
		return true
	end

	return false
end


--获得单位是否有可以驱散的危险DEBUFF
function WR_CanRemoveUnitDangerDebuff(Unit)
	if not WR_CanRemoveUnitDebuff(Unit) then
		return false
	end
	
	if WR_GetUnitDebuffTime(Unit,DangerRemoveDebuff)>0 then
		return true
	end
	
	if WR_GetUnitDebuffCount(Unit,"爆裂")>=5 then
		return true
	end
	if WR_GetUnitDebuffCount(Unit,"压制瘴气")>=10 then
		return true
	end
end


--获取是否有可以复活的队友
function WR_ResurrectParty()
	for i=1,40,1
	do
		local unit
		if i<=4 then
			--检测小队------------------------------------
			unit="party"..i
			if UnitIsDead(unit)
			--单位死亡
			and
			WR_GetUnitRange(unit)<=100
			--单位距离在100码内
			then
				return true
			end
			--检测小队------------------------------------
			
			--检测团队------------------------------------
			unit="raid"..i
			if UnitIsDead(unit)
			--单位死亡
			and
			WR_GetUnitRange(unit)<=100
			--单位距离在100码内
			then
				return true
			end
			--检测团队------------------------------------
		end
	end
	return false
end

--避免施法被沉默的情况(返回值如果是true,则请停止读条,不然会被打断并沉默)
function WR_StopCast(StopCastTime)
	if WR_GetRangeSpellTime(45,StopCastID)<StopCastTime+0.4 then
	--范围内打断法术的剩余施法时间<指定法术施法时间+0.4秒延迟
		return true
	end
	return false
end


--获取指定范围,指定生命百分比的队友数量
function WR_RangeCountPR(Range,Percentage)
	local unit
	local Count=0
	unit="player"
	--if UnitHealthMax(unit)~=0 and UnitHealth(unit)/UnitHealthMax(unit)<=Percentage then
	if UnitHealthMax(unit)~=0 and WR_GetUnitHP(unit)<=Percentage then
		Count=Count+1
	end
	if UnitExists("raid1") then
		for i=1,40,1
		do
			unit="raid"..i
			--local minRange, maxRange = LibStub("LibRangeCheck-3.0"):GetRange(unit)
			local maxRange = WR_GetUnitRange(unit)
			local TempHealthPer=0
			if UnitExists(unit) then
				--TempHealthPer=UnitHealth(unit)/UnitHealthMax(unit)
				TempHealthPer=WR_GetUnitHP(unit)
			end
			if maxRange~=nil and maxRange<=Range and TempHealthPer>0 and TempHealthPer<=Percentage then
				Count=Count+1
			end
		end
	else
		for i=1,4,1
		do
			unit="party"..i
			--local minRange, maxRange = LibStub("LibRangeCheck-3.0"):GetRange("party"..i)
			local maxRange = WR_GetUnitRange(unit)
			local TempHealthPer=0
			if UnitExists(unit) then
				--TempHealthPer=UnitHealth(unit)/UnitHealthMax(unit)
				TempHealthPer=WR_GetUnitHP(unit)
			end
			if maxRange~=nil and maxRange<=Range and TempHealthPer>0 and TempHealthPer<=Percentage then
				Count=Count+1
			end
		end
	end
	return Count
end


--获得单位是否有激怒效果
function WR_UnitEnragedBuff(Unit)
	if WR_GetUnitBuffCount(Unit,"无穷饥渴")>=6 then
	--单位 无穷饥渴 BUFF层数>=6
		return true
	end
	
	if WR_GetUnitBuffTime(Unit,EnragedBuffName)>0 then
	--单位有激怒BUFF(EnragedBuffName)
		return true
	end
end


--获得是否打断单位施法(单位,打断施法剩余的时间)
function WR_GetCastInterruptible(Unit,InterruptibleTime,Important)
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end
	if UnitCastingInfo(Unit)=="星宇飞升" then return false end
	
	
	local UnitCastTime,UnitCastLeftTime,UnitCastInterruptible=WR_GetUnitCastInfo(Unit,Important)
	if UnitCastTime~=nil and UnitCastInterruptible~=nil then
		if UnitCastTime / ( UnitCastTime + UnitCastLeftTime ) >= InterruptibleTime and UnitCastInterruptible==true then
			return true
		end
	end
	--单位施法剩余时间
	
	local UnitChannelTime,UnitChannelInterruptible=WR_GetUnitChannelInfo(Unit,Important)
	if UnitChannelTime~=nil and UnitChannelInterruptible~=nil then
		if UnitChannelTime>=InterruptibleTime and UnitChannelInterruptible==true then
			return true
		end
	end
	--单位引导开始时间
	return false
end


--获得单位施法剩余时间(单位)[ExcludeSpell为排除在外的法术名称]
function WR_GetUnitCastInfo(Unit,Important)
	local shifashengyushijian=nil
	local shifakedaduan=nil
	local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(Unit)
	if endTimeMS~=nil then
	
		for _, InterruptUnitName in ipairs(MustInterruptUnitName) do
			if UnitName(Unit)==InterruptUnitName then
				--是必须打断的单位名单
				return GetTime()-startTimeMS/1000,endTimeMS/1000-GetTime(),not(notInterruptible)
			end
		end
		
		if UnitIsPlayer(Unit) then
		--单位是玩家
			return GetTime()-startTimeMS/1000,endTimeMS/1000-GetTime(),not(notInterruptible)
		end
		
		local name, instanceType, difficultyID, difficultyName = GetInstanceInfo()
		if difficultyID ~= 8 then
		--不是大秘境
			return GetTime()-startTimeMS/1000,endTimeMS/1000-GetTime(),not(notInterruptible)
		end
		
		if Important then	--如果是重要的打断
			for _, SpellName in ipairs(MustInterruptSpellName) do
				if spellId==SpellName or name==SpellName then
				--是必须打断的法术名称
					return GetTime()-startTimeMS/1000,endTimeMS/1000-GetTime(),not(notInterruptible)	--获得 施法已经开始了多久的时间,施法距离结束的时间,是否可打断
				end
			end
		else	--如果不是重要的打断
			for _, ExcludeSpellName in ipairs(ExcludeSpell) do
				if spellId==ExcludeSpellName or name==ExcludeSpellName then
				--如果是排除在外的法术名称
					return nil,nil,nil
				end
			end
			return GetTime()-startTimeMS/1000,endTimeMS/1000-GetTime(),not(notInterruptible)	--获得 施法已经开始了多久的时间,施法距离结束的时间,是否可打断
		end
	end
	return nil,nil,nil
end


--获得单位引导施法剩余时间(单位)[ExcludeSpell为排除在外的法术名称]
function WR_GetUnitChannelInfo(Unit,Important)
	local yindaoshifakaishishijian=nil
	local yindaoshifakedaduan=nil
	local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(Unit)
	if endTimeMS~=nil then
		for _, InterruptUnitName in ipairs(MustInterruptUnitName) do
			if UnitName(Unit)==InterruptUnitName then
				--如果是必须打断的名单
				return GetTime()-startTimeMS/1000,not(notInterruptible)
			end
		end
	
		if UnitIsPlayer(Unit) then
		--单位是玩家
			return GetTime()-startTimeMS/1000,not(notInterruptible)
		end
		
		if Important then	--如果是重要的打断
			for _, SpellName in ipairs(MustInterruptSpellName) do
				if spellId==SpellName or name==SpellName then
				--是必须打断的法术名称
					return GetTime()-startTimeMS/1000,not(notInterruptible)
				end
			end
		else
			for _, ExcludeSpellName in ipairs(ExcludeSpell) do
				if spellId==ExcludeSpellName or name==ExcludeSpellName then
				--如果是排除在外的法术名称
					return nil,nil
				end
			end
			return GetTime()-startTimeMS/1000,not(notInterruptible)
		end
	end
	return nil,nil
end


--获得符文数量
function WR_GetRuneCount()
	local total = 0
	for i=1,6 do
		if GetRuneCount(i)~=nil then
			total = total + GetRuneCount(i)
		end
	end
	return total
end


--坦克防御 对我法术小减伤
local TankResist_SmallMagicToMe={
	[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--坦克防御 对我法术大减伤
local TankResist_BigMagicToMe={
	--[千丝之城]
	--1压制 2汰劣程序 3溢流猛击 4霜凝匕首
    [1]=434722,[2]=439646,[3]=461842,[4]=440468,[5]=0,[6]=0,[7]=0,[8]=0,[9]=0,[10]=0,
	--[艾拉-卡拉，回响之城]
	[11]=0,[12]=0,[13]=0,[14]=0,[15]=0,[16]=0,[17]=0,[18]=0,[19]=0,[20]=0,
	--[围攻伯拉勒斯]
	--腐烂伤口
	[21]=272588,[22]=0,[23]=0,[24]=0,[25]=0,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,
	--通灵战潮
	[31]=0,[32]=0,[33]=0,[34]=0,[35]=0,[36]=0,[37]=0,[38]=0,[39]=0,[40]=0,
	--[塞兹仙林的迷雾]
	--心能挥砍 三重撕咬 灵魂分裂
	[41]=463217,[42]=340289,[43]=322557,[44]=0,[45]=0,[46]=0,[47]=0,[48]=0,[49]=0,[50]=0,
	--[格瑞姆巴托]
	--碾碎 熔火乱舞 熔岩之拳 暗影烈焰斩 噬体烈焰
	[51]=450100,[52]=449444,[53]=451971,[54]=451241,[55]=448105,[56]=0,[57]=0,[58]=0,[59]=0,[60]=0,
	--[矶石宝库]
	--火成岩锤 暗影爪击
	[61]=428711,[62]=459210,[63]=0,[64]=0,[65]=0,[66]=0,[67]=0,[68]=0,[69]=0,[70]=0,
	--[破晨号]
	--恐惧猛击 恐惧猛击 黑曜光束 暗影突袭
	[71]=427001,[72]=451117,[73]=453212,[74]=431637,[75]=0,[76]=0,[77]=0,[78]=0,[79]=0,[80]=0,
	--尼鲁巴尔王宫
	--虚空溃灭
	[81]=440377,[82]=0,[83]=0,[84]=0,[85]=0,[86]=0,[87]=0,[88]=0,[89]=0,[90]=0,
}

--坦克防御 对我物理小减伤
local TankResist_SmallPhysicalToMe={
	[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
}

--坦克防御 对我物理大减伤
local TankResist_BigPhysicalToMe={
	--[千丝之城]
	--压制 汰劣程序
    [1]=434722,[2]=439646,[3]=0,[4]=0,[5]=0,[6]=0,[7]=0,[8]=0,[9]=0,[10]=0,
	--[艾拉-卡拉，回响之城]
	--贪食撕咬 深掘打击
	[11]=438471,[12]=433002,[13]=0,[14]=0,[15]=0,[16]=0,[17]=0,[18]=0,[19]=0,[20]=0,
	--[围攻伯拉勒斯]
	[21]=0,[22]=0,[23]=0,[24]=0,[25]=0,[26]=0,[27]=0,[28]=0,[29]=0,[30]=0,
	--通灵战潮
	--嚼碎 毁伤 碎裂 毁伤
	[31]=320655,[32]=320376,[33]=324394,[34]=338456,[35]=0,[36]=0,[37]=0,[38]=0,[39]=0,[40]=0,
	--[塞兹仙林的迷雾]
	--碎甲
	[41]=340208,[42]=0,[43]=0,[44]=0,[45]=0,[46]=0,[47]=0,[48]=0,[49]=0,[50]=0,
	--[格瑞姆巴托]
	--碾碎 劈裂 熔火乱舞
	[51]=450100,[52]=451378,[53]=449444,[54]=0,[55]=0,[56]=0,[57]=0,[58]=0,[59]=0,[60]=0,
	--[矶石宝库]
	--震地猛击 结晶猛击 裂石打击
	[61]=424888,[62]=422233,[63]=428894,[64]=0,[65]=0,[66]=0,[67]=0,[68]=0,[69]=0,[70]=0,
	--[破晨号]
	--恐惧猛击 恐惧猛击 污邪斩击
	[71]=427001,[72]=451117,[73]=431491,[74]=0,[75]=0,[76]=0,[77]=0,[78]=0,[79]=0,[80]=0,
	--尼鲁巴尔王宫
	--虚空溃灭
	[81]=440377,[82]=0,[83]=0,[84]=0,[85]=0,[86]=0,[87]=0,[88]=0,[89]=0,[90]=0,
}

------------------------------------------------------------------------------------------------------------------------------

--坦克防御 范围法术小减伤
local TankResist_SmallMagicToAoe={
	[1]="",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--坦克防御 范围法术大减伤
local TankResist_BigMagicToAoe={
	[1]="狼吞虎咽",[2]="噬体烈焰",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--坦克防御 范围物理小减伤
local TankResist_SmallPhysicalToAoe={
	[1]="命令咆哮",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--坦克防御 范围物理大减伤
local TankResist_BigPhysicalToAoe={
	[1]="野蛮冲撞",[2]="",[3]="",[4]="",[5]="",[6]="",[7]="",[8]="",[9]="",[10]="",
	[11]="",[12]="",[13]="",[14]="",[15]="",[16]="",[17]="",[18]="",[19]="",[20]="",
}

--坦克减伤,返回值,小法术时间,大法术时间,小物理时间,大物理时间
function WR_TankResist()
	local SmallMagicTime=999
	local BigMagicTime=999
	local SmallPhysicalTime=999
	local BigPhysicalTime=999
	for i=1,40,1
	do
		if UnitName("boss1")=="乌比斯将军"
		and WR_GetUnitDebuffCount("player","碎颅打击")>=2 --碎颅打击DEBUFF层数>=2
		and WR_GetUnitDebuffTime("player","碎颅打击")>4 --碎颅打击DEBUFF剩余时间>4秒
		then
				SmallPhysicalTime=1.4	--坦克物理小减伤
				BigPhysicalTime=1.4	--坦克物理大减伤
		end
	
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)
--[[
		if name==nil then
			name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)
		end
--]]
		if name~=nil then
		--读条施法存在
			if UnitIsUnit("nameplate"..i.."target", "player") then
			--施法对象是我
				--坦克法术小减伤
				if TankResist_SmallMagicToMe~=nil then
					for _, Spell in ipairs(TankResist_SmallMagicToMe) do
						if Spell=="" then break end	--如果是空的,退出循环
						if Spell==name or Spell==spellId then SmallMagicTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
					end
				end
				
				--坦克法术大减伤
				if TankResist_BigMagicToMe~=nil then
					for _, Spell in ipairs(TankResist_BigMagicToMe) do
						if Spell=="" then break end	--如果是空的,退出循环
						if Spell==name or Spell==spellId then BigMagicTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
					end
				end
				
				--坦克物理小减伤
				if TankResist_SmallPhysicalToMe~=nil then
					for _, Spell in ipairs(TankResist_SmallPhysicalToMe) do
						if Spell=="" then break end	--如果是空的,退出循环
						if Spell==name or Spell==spellId then SmallPhysicalTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
					end
				end
				
				--坦克物理大减伤
				if TankResist_BigPhysicalToMe~=nil then
					for _, Spell in ipairs(TankResist_BigPhysicalToMe) do
						if Spell=="" then break end	--如果是空的,退出循环
						if Spell==name or Spell==spellId then BigPhysicalTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
					end
				end
			end
			
			--坦克法术小减伤
			if TankResist_SmallMagicToAoe~=nil then
				for _, Spell in ipairs(TankResist_SmallMagicToAoe) do
					if Spell=="" then break end	--如果是空的,退出循环
					if Spell==name or Spell==spellId then SmallMagicTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
				end
			end
			
			--坦克法术大减伤
			if TankResist_BigMagicToAoe~=nil then
				for _, Spell in ipairs(TankResist_BigMagicToAoe) do
					if Spell=="" then break end	--如果是空的,退出循环
					if Spell==name or Spell==spellId then BigMagicTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
				end
			end
			
			--坦克物理小减伤
			if TankResist_SmallPhysicalToAoe~=nil then
				for _, Spell in ipairs(TankResist_SmallPhysicalToAoe) do
					if Spell=="" then break end	--如果是空的,退出循环
					if Spell==name or Spell==spellId then SmallPhysicalTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
				end
			end
			
			--坦克物理大减伤
			if TankResist_BigPhysicalToAoe~=nil then
				for _, Spell in ipairs(TankResist_BigPhysicalToAoe) do
					if Spell=="" then break end	--如果是空的,退出循环
					if Spell==name or Spell==spellId then BigPhysicalTime=endTimeMS/1000-GetTime() end	--如果找到对应技能,把剩余时间赋值
				end
			end
		end
		
	end
	return SmallMagicTime,BigMagicTime,SmallPhysicalTime,BigPhysicalTime
	--返回值,小法术时间,大法术时间,小物理时间,大物理时间
end


--法术反射
function WR_SpellReflection(Time)
	for i=1,40,1
	do
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)
		if endTimeMS==nil then
			name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)
		end
		if endTimeMS~=nil then
		--施法存在
			if endTimeMS/1000-GetTime()<Time then
			--施法的时间<设定值
				if UnitGroupRolesAssigned("player")~="TANK" then	--玩家不是坦克
					local j=1
					while ReflectionAOE[j]~=nil
					do
						if ReflectionAOE[j]==name or ReflectionAOE[j]==spellId then
						--判断是否反射的AOE法术
							return true
						end
						j=j+1
					end

					if UnitIsUnit("nameplate"..i.."target", "player") then
					--施法对象是我
						local j=1
						local CastToMe=true
						while (NotReflection[j]~=nil and CastToMe==true)
						do
							if NotReflection[j]==name or NotReflection[j]==spellId then
							--判断是否无法反射的法术
								CastToMe=false
								break
							end
							j=j+1
						end
						if CastToMe==true then
						--可以反射
							return true
						end				
					end
				else
					local j=1
					while TankReflectionAOE[j]~=nil
					do
						if TankReflectionAOE[j]==name or TankReflectionAOE[j]==spellId then
						--判断是否反射的AOE法术
							return true
						end
						j=j+1
					end
					
					if UnitIsUnit("nameplate"..i.."target", "player") then
					--施法对象是我
						local j=1
						while TankReflection[j]~=nil
						do
							if TankReflection[j]==name or TankReflection[j]==spellId then
							--判断是否反射的法术
								return true
							end
							j=j+1
						end		
					end
				end
			end
		end
		
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)
		if startTimeMS~=nil then
		--施法存在
			if UnitGroupRolesAssigned("player")~="TANK" then	--玩家不是坦克
				local j=1
				while (ReflectionAOE[j]~=nil and ReflectionAOE[j]~="")
				do
					if ReflectionAOE[j]==name then
					--判断是否反射的AOE法术
						return true
					end
					j=j+1
				end
			else
				local j=1
				while TankReflectionAOE[j]~=nil
				do
					if TankReflectionAOE[j]==name or TankReflectionAOE[j]==spellId then
					--判断是否反射的AOE法术
						return true
					end
					j=j+1
				end
			end
		end
		
	end
	return false
end


--获得设定距离内是否有需要击晕打断的钢条施法
function WR_StunUnit(Range,Time)--距离,剩余时间
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end
	
	local i=1
	while (DontStunUnitName[i]~=nil and DontStunUnitName[i]~="")
	do
		if DontStunUnitName[i]==UnitName("target") then
			return false
		end
		i=i+1
	end
	
	for i=1,40,1
	do
		if UnitCanAttack("player","nameplate"..i) then	--敌对单位
			local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)	--读条施法
			if name~=nil then
				local maxRange = WR_GetUnitRange("nameplate"..i)
				if maxRange~=nil and maxRange<=Range and (Time==nil or endTimeMS/1000-GetTime()<Time) then
					local j=1
					while (StunCastName[j]~=nil and StunCastName[j]~="")
					do
						if StunCastName[j]==name or StunCastName[j]==spellId then
							return true
						end
						j=j+1
					end
				end
			end
			
			local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)	--引导施法
			if name~=nil then
				local maxRange = WR_GetUnitRange("nameplate"..i)
				if maxRange~=nil and maxRange<=Range then
					local j=1
					while (StunChannelName[j]~=nil and StunChannelName[j]~="")
					do
						if StunChannelName[j]==name or StunChannelName[j]==spellId then
							return true
						end
						j=j+1
					end
				end
			end
		end
	end
	return false
end


--获取下一次技能充能剩余时间
function WR_GetSpellNextCharge(SpellName)
	local cooldownStart = C_Spell.GetSpellCharges(SpellName).cooldownStartTime
	local cooldownDuration = C_Spell.GetSpellCharges(SpellName).cooldownDuration
	
	if cooldownStart==0 then return 0 end
	return cooldownStart+cooldownDuration-GetTime()
end

--获取技能可用次数
function WR_GetSpellCharges(SpellName)
	if C_Spell.GetSpellCharges(SpellName)~=nil then
		return C_Spell.GetSpellCharges(SpellName).currentCharges or 0
	end
end


--获得是否具有某系列装备
function WR_GetSuit(TName)
	local TCount = 0
	for i = 1, 19 do
		local itemID = GetInventoryItemID("player", i)
		for _, id in ipairs(TName) do
			if itemID == id then
				TCount = TCount + 1
			end
		end
	end
	return TCount
end


--获得单位是否有需要击晕打断的钢条施法
function WR_StunSpell(Unit,Time)
	if UnitCastingInfo("boss1")=="宇宙奇点" then return false end
	local UName,_ = UnitName(Unit)
	local currentSpeed,_,_,_ = GetUnitSpeed(Unit)
	local i=1
	while (StunUnitName[i]~=nil and StunUnitName[i]~="")
	do
		if StunUnitName[i]==UName and currentSpeed>0 then
			return true
		end
		i=i+1
	end
	local i=1
	while (DontStunUnitName[i]~=nil and DontStunUnitName[i]~="")
	do
		if DontStunUnitName[i]==UName then
			return false
		end
		i=i+1
	end
	
	if UnitCanAttack("player",Unit) then	--敌对单位
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo(Unit)
		if name~=nil
		and (Time==nil or endTimeMS/1000-GetTime()<Time)
		then
			local j=1
			while (StunCastName[j]~=nil and StunCastName[j]~="")
			do
				if StunCastName[j]==name then
					return true
				end
				j=j+1
			end
		end
		
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo(Unit)
		if name~=nil then
			local j=1
			while (StunChannelName[j]~=nil and StunChannelName[j]~="")
			do
				if StunChannelName[j]==name then
					return true
				end
				j=j+1
			end
		end
	end

	return false
end


--纯单体-单目标
function WR_SingleUnit()
	local UName,_ = UnitName("target")
	local j=1
	while (SingleUnitName[j]~=nil and SingleUnitName[j]~="")
	do
		if UName==SingleUnitName[j] then
			return true
		end
		j=j+1
	end
	return false
end


--获取队友距离：TargetRange,FocusRange,PartyRange[i],RiadRange[i]
function WR_GetPartyRange()
	local i
	TargetRange=WR_GetUnitRange("target")
	FocusRange=WR_GetUnitRange("focus")
	for i=1,4,1
	do
		PartyRange[i]=WR_GetUnitRange("party"..i)
	end
	for i=1,40,1
	do
		RiadRange[i]=WR_GetUnitRange("raid"..i)
	end
end


--获取队友真实的可恢复的血量：PlayerLostHealth,TargetLostHealth,FocusLostHealth,PartyLostHealth[i],RiadLostHealth[i]
function WR_GetPartyLostHealth()
	local i
	PlayerLostHealth=WR_GetUnitLostHealth("player")
	TargetLostHealth=WR_GetUnitLostHealth("target")
	FocusLostHealth=WR_GetUnitLostHealth("focus")
	for i=1,4,1
	do
		PartyLostHealth[i]=WR_GetUnitLostHealth("party"..i)
	end
	for i=1,40,1
	do
		RiadLostHealth[i]=WR_GetUnitLostHealth("raid"..i)
	end
end


--获取上一次的技能名称，返回值：WR_LastSpellName
function WR_GetLastSpellName()
	if WR_LastSpellNameIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
		local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()												
		if subevent=="SPELL_CAST_SUCCESS" and sourceGUID==UnitGUID("player") then
		--战斗事件类型是施法成功 并且 施法的是玩家自己
			WR_LastSpellName=select(13, CombatLogGetCurrentEventInfo())
		end
	end)
	WR_LastSpellNameIsOpen=true                       
end

--获取光环获取SPELL_AURA_APPLIED
function WR_GetSpellAuraApplied()
	if WR_GetSpellAuraAppliedIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
		local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()												
		if subevent=="SPELL_AURA_APPLIED" and destGUID==UnitGUID("player") then
		--战斗事件类型是光环获取 并且 目标单位是玩家自己
			--print(select(12, CombatLogGetCurrentEventInfo()))
			if select(12, CombatLogGetCurrentEventInfo()) == 438141 or select(13, CombatLogGetCurrentEventInfo()) == "暮光屠戮" then
				MGTL_DebuffTime=GetTime()
			end
		end												
		if subevent=="SPELL_CAST_START" and destGUID==UnitGUID("player") then
		--战斗事件类型是施法开始 并且 目标单位是玩家自己
			--print(select(12, CombatLogGetCurrentEventInfo()))
			if select(12, CombatLogGetCurrentEventInfo()) == 438141 or select(13, CombatLogGetCurrentEventInfo()) == "暮光屠戮" then
				MGTL_DebuffTime=GetTime()
			end
		end												
		if destGUID==UnitGUID("player") then
		--目标单位是玩家自己
			--print(select(12, CombatLogGetCurrentEventInfo()))
		end
	end)
	WR_GetSpellAuraAppliedIsOpen=true                       
end


--场景是否需要加速跑
function WR_SpeedUp()
	if WR_GetUnitDebuffInfo("player","能量过载",false)~=0 then
		return true
	end
	
	WR_GetSpellAuraApplied()	--获取光环获取SPELL_AURA_APPLIED
	if MGTL_DebuffTime~=nil and GetTime()-MGTL_DebuffTime>0 and GetTime()-MGTL_DebuffTime<2 then	--暮光屠戮 光环获得2秒内
		return true
	end
	
	for i=1,40,1
	do
		if UnitName("nameplate"..i)=="怨毒影魔" and UnitIsUnit("nameplate"..i.."target", "player") then
			return true			
		end
		local name, text, texture, startTimeMS, endTimeMS, isTradeSkill, castID, notInterruptible, spellId = UnitCastingInfo("nameplate"..i)
		if name==nil then
			name, text, texture, startTimeMS, endTimeMS, isTradeSkill, notInterruptible, spellId = UnitChannelInfo("nameplate"..i)
		end
		if name~=nil then
			local j=1
			while (SpeedUpSpellName[j]~=nil and SpeedUpSpellName[j]~="")
			do
				if SpeedUpSpellName[j]==name then
					return true
				end
				j=j+1
			end
		end
	end
	return false
end


--检测队友身上是否具有爆发BUFF
function WR_GetUnitCrazyBuff(Unit)

	for _, BuffName in pairs(CrazyBuff) do
		if WR_GetUnitBuffInfo(Unit,BuffName)>12 then
		--单位有指定BUFF
			return true
		end
	end

	WR_GetCrazyBuffTime()
	if Unit=="party1" and WR_GetCrazyBuffTime_Party1~=nil and GetTime()-WR_GetCrazyBuffTime_Party1<=2  then
		return true
	end
	if Unit=="party2" and WR_GetCrazyBuffTime_Party2~=nil and GetTime()-WR_GetCrazyBuffTime_Party2<=2  then
		return true
	end
	if Unit=="party3" and WR_GetCrazyBuffTime_Party3~=nil and GetTime()-WR_GetCrazyBuffTime_Party3<=2  then
		return true
	end
	if Unit=="party4" and WR_GetCrazyBuffTime_Party4~=nil and GetTime()-WR_GetCrazyBuffTime_Party4<=2  then
		return true
	end
	return false
end


--获取爆发技能的单位和施法时间，返回值：WR_GetCrazyBuffTime_Party 1~4
function WR_GetCrazyBuffTime()
	if WR_GetCrazyBuffTimeIsOpen==true then
		return
	end
	local TempFrame = CreateFrame("Frame")
	TempFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	TempFrame:SetScript("OnEvent", function()
		local timestamp, subevent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = CombatLogGetCurrentEventInfo()												
		if subevent=="SPELL_CAST_SUCCESS" then
		--施法成功
			for _, BuffName in pairs(CrazyBuff) do
				if select(13, CombatLogGetCurrentEventInfo())==BuffName or select(12, CombatLogGetCurrentEventInfo())==BuffName then
				--施法名称==爆发BUFF的名称
					if sourceGUID==UnitGUID("party1") then
					--施法的单位是队友1
						WR_GetCrazyBuffTime_Party1=GetTime()
					end
					if sourceGUID==UnitGUID("party2") then
					--施法的单位是队友2
						WR_GetCrazyBuffTime_Party2=GetTime()
					end
					if sourceGUID==UnitGUID("party3") then
					--施法的单位是队友3
						WR_GetCrazyBuffTime_Party3=GetTime()
					end
					if sourceGUID==UnitGUID("party4") then
					--施法的单位是队友4
						WR_GetCrazyBuffTime_Party4=GetTime()
					end
				end
			end
		end
	end)
	WR_GetCrazyBuffTimeIsOpen=true                       
end


--检测单位是否是忽略的单位名称
function WR_UnitIsHuLueName(Unit)
	local isInInstance = IsInInstance()
	if not(isInInstance) and UnitIsPlayer(Unit) then
	--不在竞技场战斗 并且 检测是玩家
		return true	--忽略
	end
	local UName,_ = UnitName(Unit)
	local j=1
	while (HuLueUnitName[j]~=nil and HuLueUnitName[j]~="")
	do
		if UName==HuLueUnitName[j] then
			return true
		end
		j=j+1
	end
	return false
end


--获取没有我的DEBUFF的敌对数量(指定范围,Debuff)[战斗中的目标]
function WR_GetNoDebuffRangeUnitCount(Range,DebuffName,InCombat)
	local RangeCount=0
	local time=1
	if Time~=nil then time=Time end
	for i=1,40,1
	do
		local UName,_ = UnitName("nameplate"..i)
		--local minRange, maxRange = LibStub("LibRangeCheck-3.0"):GetRange("nameplate"..i)
		local maxRange = WR_GetUnitRange("nameplate"..i)
		local TargetCanAttack = UnitCanAttack("player","nameplate"..i)--判断单位是可被攻击的
		local NPInCombat = UnitAffectingCombat("nameplate"..i)--判断单位是否在战斗中
		local NPDebuffTime = WR_GetUnitDebuffInfo("nameplate"..i,DebuffName,true)--判断有没有Debuff
		local creatureType = UnitCreatureType("nameplate"..i)--判断单位的类型
		if not(WR_UnitIsHuLueName("nameplate"..i)) then
		--如果不是忽略的名单
			if maxRange~=nil and maxRange<=Range and TargetCanAttack==true and NPDebuffTime==0 and creatureType~="图腾" and creatureType~="Totem" and creatureType~="气体云雾" and creatureType~="Gas Cloud" then
				if (NPInCombat==true and InCombat==true) or InCombat~=true then
					if not WR_Invincible("nameplate"..i) then	--单位不是无敌的
						RangeCount=RangeCount+1
					end
				end
			end
		end
	end
	if MSG==1 then
		if InCombat==true then
			print("|cff00ff00",Range,"|cffffffff码内，没有中|cffffdf00",DebuffName,"|cffffffff的战斗中的敌人数量为:|cffff5040",RangeCount)
		else
			print("|cff00ff00",Range,"|cffffffff码内，没有中|cffffdf00",DebuffName,"|cffffffff的敌人数量为:|cffff5040",RangeCount)
		end
	end
	return RangeCount
end


--获取有我的DEBUFF的敌对数量(指定范围,Debuff)[战斗中的目标]
function WR_GetHaveDebuffRangeUnitCount(Range,DebuffName,InCombat,Time)
	local RangeCount=0
	local time=1
	if Time~=nil then time=Time end
	for i=1,40,1
	do
		local creatureType = UnitCreatureType("nameplate"..i)--判断单位的类型
		if creatureType~="图腾"
		and creatureType~="Totem"
		and creatureType~="气体云雾"
		and creatureType~="Gas Cloud"
		and UnitCanAttack("player","nameplate"..i)	--单位是敌对的
		and
		(
			InCombat~=true
			or
			(
				InCombat==true
				and
				UnitAffectingCombat("nameplate"..i)	--单位在战斗中
			)
		)
		and WR_GetUnitRange("nameplate"..i)<=Range	--单位在距离范围内
		and not WR_Invincible("nameplate"..i)	--单位不是无敌的
		and WR_GetUnitDebuffInfo("nameplate"..i,DebuffName,true)>=time	--单位DEBUFF时间>=1秒
		then
			RangeCount=RangeCount+1
		end
	end
	if MSG==1 then
		if InCombat==true then
			print("|cff00ff00",Range,"|cffffffff码内，中|cffffdf00",DebuffName,"|cffffffff的战斗中的敌人数量为:|cffff5040",RangeCount)
		else
			print("|cff00ff00",Range,"|cffffffff码内，中|cffffdf00",DebuffName,"|cffffffff的敌人数量为:|cffff5040",RangeCount)
		end
	end
	return RangeCount
end


--伤害递减计算（注意：不计算未递减的伤害）
--(伤害值，单位总数，第几个开始递减)(比如伤害100，单位8个，超过5个开始递减，填入：100，8，6)
function WR_DamageMitigation(Damage,UnitCount,Number)
	if Number > UnitCount then
	--如果开始递减的数量>单位总数，返回0值
		return Damage*UnitCount
	end
	DamageMitigation=Damage*(Number-1)
	for i = Number , UnitCount , 1 do	--计算超过Number个怪物时受到的伤害
		DamageMitigation=DamageMitigation+Damage*math.sqrt((Number-1)/i)
	end
	return DamageMitigation
end

--选择单位过程
function WR_ColorFrame_Show(Name,Text)
	WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
	WR_ShowColorFrame(Name,Text,zhandoumoshi) --显示指定色块窗体
	return true
end

--选择单位过程
function WR_FocusUnit(Unit,Text)
	if not UnitIsUnit("focus",Unit) then
	--当前单位不是 Unit
		WR_FastPass=true	--建立一个变量,确定是焦点单位,然后快速切换到下一次
	
		if GCD>0.5 then
			WR_FocusHealthMaxWeightUnit_LastTime=GetTime()+GCD
		else
			WR_FocusHealthMaxWeightUnit_LastTime=GetTime()+0.5
		end

		if Unit=="player" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF5",Text.."焦点P",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party1" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF1",Text.."焦点P1",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party2" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF2",Text.."焦点P2",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party3" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF3",Text.."焦点P3",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party4" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF4",Text.."焦点P4",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="pet" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF9",Text.."焦点Pet",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="target" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF11",Text.."焦点T",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="mouseover" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF12",Text.."焦点M",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="boss2" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF6",Text.."焦点B2",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="boss3" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF7",Text.."焦点B3",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="boss4" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF8",Text.."焦点B4",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="boss4" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CSF8",Text.."焦点B4",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid1" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN1",Text.."焦点R1",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid2" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN2",Text.."焦点R2",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid3" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN3",Text.."焦点R3",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid4" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN4",Text.."焦点R4",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid5" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN5",Text.."焦点R5",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid6" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN6",Text.."焦点R6",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid7" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN7",Text.."焦点R7",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid8" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN8",Text.."焦点R8",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid9" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN9",Text.."焦点R9",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid10" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("AN0",Text.."焦点R10",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid11" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN1",Text.."焦点R11",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid12" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN2",Text.."焦点R12",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid13" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN3",Text.."焦点R13",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid14" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN4",Text.."焦点R14",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid15" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN5",Text.."焦点R15",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid16" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN6",Text.."焦点R16",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid17" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN7",Text.."焦点R17",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid18" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN8",Text.."焦点R18",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid19" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN9",Text.."焦点R19",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="raid20" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("CN0",Text.."焦点R20",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party1target" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN1",Text.."焦点P1T",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party2target" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN2",Text.."焦点P2T",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party3target" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN3",Text.."焦点P3T",zhandoumoshi) --显示指定色块窗体
			return true
		elseif Unit=="party4target" then
			WR_HideColorFrame(zhandoumoshi) --隐藏指定色块窗体
			WR_ShowColorFrame("ACN4",Text.."焦点P4T",zhandoumoshi) --显示指定色块窗体
			return true
		end
	end
	return false
end

--优先检查过程
function WR_PriorityCheck()
	if WR_CreateButtonInfo~=true and NotAffectingCombat("player") then
	--不在战斗中
		WR_CreateButtonInfo=true
		if UnitClassBase("player")=="PALADIN" then WR_PaladinCreateButton() end
		if UnitClassBase("player")=="DEATHKNIGHT" then WR_DeathKnightCreateButton() end
		if UnitClassBase("player")=="DRUID" then WR_DruidCreateButton() end
		if UnitClassBase("player")=="HUNTER" then WR_HunterCreateButton() end
		if UnitClassBase("player")=="MAGE" then WR_MageCreateButton() end
		if UnitClassBase("player")=="WARRIOR" then WR_WarriorCreateButton() end
		if UnitClassBase("player")=="SHAMAN" then WR_ShamanCreateButton() end
		if UnitClassBase("player")=="ROGUE" then WR_RogueCreateButton() end
		if UnitClassBase("player")=="PRIEST" then WR_PriestCreateButton() end
		if UnitClassBase("player")=="MONK" then WR_MonkCreateButton() end
	end
	
	if WR_Use_Item(13,215174) and WR_GetUnitBuffTime("player",435493)>GCD and WR_GetUnitBuffTime("player",435493)<1.5 then
		if WR_ColorFrame_Show("F10","死亡之吻") then return true end
	end
	
	if WR_Use_Item(14,215174) and WR_GetUnitBuffTime("player",435493)>GCD and WR_GetUnitBuffTime("player",435493)<1.5 then
		if WR_ColorFrame_Show("F11","死亡之吻") then return true end
	end
	
	if UnitAffectingCombat("player") and IsInInstance() and not multiplyNonZeroDigits() then
		ShiFaSuDu=0
		if GCD>ShiFaSuDu and math.random(1,20)==1 and ( not WR_HideTime or GetTime()-WR_HideTime>GCD+(WRSize or 1) ) then
			WR_HideTime=GetTime()+GCD+(WRSize or 1)
		elseif WR_HideTime~=nil and GetTime()-WR_HideTime<0 then
			WR_HideColorFrame(0)
			WR_HideColorFrame(1)
			return true
		end
	end
	
	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------
	if IsFlying() --正在飞行
	or UnitIsDeadOrGhost("player") --玩家死亡
	or
	(
		SpellIsTargeting() --进行范围选择
		and
		WR_GetUnitBuffTime("player","救赎之魂")==0	--救赎之魂 不存在
	)
	or (UnitChannelInfo("player")~=nil and UnitChannelInfo("player")~="抚慰之雾" and UnitChannelInfo("player")~="法力茶") --单位引导施法 存在
	or WR_GetUnitBuffTime("player","喝水")~=0 --进食饮水BUFF 存在
	or WR_GetUnitBuffTime("player","进食")~=0 
	or WR_GetUnitBuffTime("player","饮用")~=0 --进食饮水BUFF 存在
	or WR_GetUnitBuffTime("player","进食饮水")~=0 --进食饮水BUFF 存在
	or WR_GetUnitBuffTime("player","假死")~=0 --假死BUFF 存在
	or WR_GetUnitBuffTime("player","影遁")~=0
	or WR_GetUnitBuffTime("player","食物")~=0
	or WR_GetUnitBuffTime("player","饮料")~=0
	or WR_GetUnitBuffTime("player","食物和饮料")~=0
	or
	(
		UnitCastingInfo("player")~=nil --当前正在施法
		and
		UnitClassBase("player")=="PRIEST" and GetSpecialization()==2	--神牧
	)
	then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_HideColorFrame(1) --隐藏右上色块窗体
		return true
	end
	--首要条件！如果满足任意条件，则不再往下执行操作-------------------------------------------------------------

	--战斗检测色块窗体---------------------------------------------------------------------------------------
	if not UnitIsDeadOrGhost("player") --玩家存活
	and
	(
		UnitAffectingCombat("player") --玩家在战斗
		or
		WR_InTraining() --打木桩
		or
		(
			IsInInstance() --在副本
			and
			UnitGroupRolesAssigned("player")=="HEALER" --玩家是 治疗
		)
		or
		(
			UnitClassBase("player")=="ROGUE"	--玩家是盗贼
			and
			WR_GetUnitBuffTime("player","潜行")==0	--没有潜行
		)
		or
		WR_Combat	--战斗设置为开启
	)
	then
	--玩家在战斗中
		WR_CombatFrame:Show() --显示战斗色块窗体
	else
	--玩家不在战斗中
		SetCVar("autoUnshift",1)	--随意变形
		SetCVar("doNotFlashLowHealthWarning",1)	--不要低血量闪屏幕
		SetCVar("secureAbilityToggle",1)	--防止短时间内多次点击取消技能
		SetCVar("findYourselfAnywhereOnlyInCombat",0)	--在关闭只在战斗中高亮自身
		SetCVar("findYourselfAnywhere",1)	--高亮自身
		SetCVar("SpellQueueWindow",400)	--延迟容限
		WR_CombatFrame:Hide() --隐藏战斗色块窗体
	end	
	--战斗检测色块窗体---------------------------------------------------------------------------------------

	--爆发或非爆发检测---------------------------------------------------------------------------------------
	if zhandoumoshi~=1 then
		WR_HideColorFrame(1) --隐藏右上色块窗体
		WR_ShowColorFrame("CSC","爆发",1) --显示指定色块窗体
	end
	if zhandoumoshi==1 then
		WR_HideColorFrame(0) --隐藏左上色块窗体
		WR_ShowColorFrame("CSV","平伤",0) --显示指定色块窗体
	end
	--爆发或非爆发检测---------------------------------------------------------------------------------------
	return false
end
--[[
--施法过程 回到上一个单位
function WR_GoToLastUnit()
	--清除上一个单位
	if WR_LastUnitGUID==UnitGUID("target") then
	--如果保存的上一个单位 是 当前目标
		WR_LastUnitGUID=nil
	end
	
	--回到上一个单位
	if WR_LastUnitGUID~=nil then
		--目标 P1T
		if WR_LastUnitGUID==UnitGUID("party1target")
		and
		not UnitIsDead("party1target")
		--单位存活
		and
		UnitCanAttack("player","party1target")
		--单位是敌方
		and
		WR_GetUnitRange("party1target")<=2
		--单位在 2 码内
		then
			if WR_TargetUnit("party1target","回到") then return true end --选择单位过程
		end
		
		--目标 P2T
		if WR_LastUnitGUID==UnitGUID("party2target")
		and
		not UnitIsDead("party2target")
		--单位存活
		and
		UnitCanAttack("player","party2target")
		--单位是敌方
		and
		WR_GetUnitRange("party2target")<=2
		--单位在 2 码内
		then
			if WR_TargetUnit("party2target","回到") then return true end --选择单位过程
		end
		
		--目标 P3T
		if WR_LastUnitGUID==UnitGUID("party3target")
		and
		not UnitIsDead("party3target")
		--单位存活
		and
		UnitCanAttack("player","party3target")
		--单位是敌方
		and
		WR_GetUnitRange("party3target")<=2
		--单位在 2 码内
		then
			if WR_TargetUnit("party3target","回到") then return true end --选择单位过程
		end
		
		--目标 P4T
		if WR_LastUnitGUID==UnitGUID("party4target")
		and
		not UnitIsDead("party4target")
		--单位存活
		and
		UnitCanAttack("player","party4target")
		--单位是敌方
		and
		WR_GetUnitRange("party4target")<=2
		--单位在 2 码内
		then
			if WR_TargetUnit("party4target","回到") then return true end --选择单位过程
		end
	end
	return false
end
--]]

function WR_GetBN(Text)
	if Text~=nil then
		local Num=0
		for i=1,string.len(Text),1 do
			if string.byte(Text,i)~=nil then
				Num = Num + string.byte(Text,i)
			end
		end
		Num = Num..tonumber(string.sub(Text, string.len(Text)-3,string.len(Text)))
		return Num
	end
	return nil
end

--施法过程 智能目标
function WR_Function_ZNMB(Range,Mode)
	if Mode==3 then return false end
	
	if WR_PartyInCombat()
	--队伍有人在战斗中
	and
	(
		not UnitExists("target")	--单位不存在
		or
		UnitIsDead("target")	--单位死亡
		or
		not UnitCanAttack("player","target")	--单位不可攻击
		or
		( Mode==2 and WR_GetUnitRange("target")>Range )	--目标在 Range 码外
		or
		( Mode==2 and not WR_TargetInCombat("target") )	--目标不可战斗
	)
	then
		local TempUnit="pettarget"
		if not UnitIsDead(TempUnit)	--单位存活
		and UnitCanAttack("player",TempUnit)	--单位是敌方
		and WR_TargetInCombat(TempUnit)	--单位可攻击
		and WR_GetUnitRange(TempUnit)<=Range	--单位在 Range 码内
		then
			if WR_ColorFrame_Show("ACN9","宠物目标") then return true end
		end
		
		for i=1,4,1 do
			local TempUnit="party"..i.."target"
			if UnitGroupRolesAssigned("party"..i)=="TANK"	--队友是坦克
			and not UnitIsDead(TempUnit)	--单位存活
			and UnitCanAttack("player",TempUnit)	--单位是敌方
			and UnitAffectingCombat(TempUnit)	--单位战斗中
			and WR_TargetInCombat(TempUnit)	--单位可攻击
			and WR_GetUnitRange(TempUnit)<=Range	--单位在 Range 码内
			then
				if i==1 then
					if WR_ColorFrame_Show("ACN5","智能-"..i) then return true end
				elseif i==2 then
					if WR_ColorFrame_Show("ACN6","智能-"..i) then return true end
				elseif i==3 then
					if WR_ColorFrame_Show("ACN7","智能-"..i) then return true end
				elseif i==4 then
					if WR_ColorFrame_Show("ACN8","智能-"..i) then return true end
				end
			end
		end
		
		for i=1,4,1 do
			local TempUnit="party"..i.."target"
			if not UnitIsDead(TempUnit)	--单位存活
			and UnitCanAttack("player",TempUnit)	--单位是敌方
			and UnitAffectingCombat(TempUnit)	--单位战斗中
			and WR_TargetInCombat(TempUnit)	--单位可攻击
			and WR_GetUnitRange(TempUnit)<=Range	--单位在 Range 码内
			then
				if i==1 then
					if WR_ColorFrame_Show("ACN5","智能-"..i) then return true end
				elseif i==2 then
					if WR_ColorFrame_Show("ACN6","智能-"..i) then return true end
				elseif i==3 then
					if WR_ColorFrame_Show("ACN7","智能-"..i) then return true end
				elseif i==4 then
					if WR_ColorFrame_Show("ACN8","智能-"..i) then return true end
				end
			end
		end

		if not IsInInstance() then	--在副本外
			if (WR_TargetEnemyTime==nil or GetTime()-WR_TargetEnemyTime>0.2)	--距离上一次切目标过去0.2秒
			and WR_GetRangeHarmUnitCount(Range)>=1 then	--Range 码单位数量>=1
				WR_TargetEnemyTime = GetTime()	--记录本次切目标的时间
				if WR_ColorFrame_Show("CSF10","智能目标") then return true end
			end
		end

	end
	return false
end

--调试时间
function WR_DebugTime(Text)
	if not wrdebug then return end
	
	if Text==0 then print("循环开始-----------------------------------------") end
	if Text~=nil then
		TempText=Text
	else
		TempText=""
	end
	if Text~=0 and WR_Debug_StartTime~=nil then
		print("循环时间" .. Text .. ": " .. string.format("%.2f", debugprofilestop() - WR_Debug_StartTime) .. "毫秒")
	end
	WR_Debug_StartTime = debugprofilestop()
end


--选择权重最高的队友
function WR_FocusMaxWeightUnit(Text)
	--if GCD>ShiFaSuDu then return false end --GCD>施法速度
--[[
	if UnitCastingInfo("player")~=nil then	--当前正在施法
		if UnitCastingInfo("player")~="熔岩爆裂"
		and UnitCastingInfo("player")~="闪电箭"
		and UnitCastingInfo("player")~="闪电链"
		then
			return false
		end
	end
--]]
	if Text==nil and WR_FocusHealthMaxWeightUnit_LastTime~=nil and GetTime()-WR_FocusHealthMaxWeightUnit_LastTime<=0 and UnitExists("focus") then return false end	--如果是0.5秒内并且焦点存在,不再选择焦点
--[[	
	if GCD>0.25 then
		WR_FocusHealthMaxWeightUnit_LastTime=GetTime()+GCD
	else
		WR_FocusHealthMaxWeightUnit_LastTime=GetTime()+0.25
	end
	--]]
	
	HMWUnit=WR_GetHealthMaxWeightUnit()	--获取最大权重值的队友单位
	--print(HMWUnit)
	if UnitIsUnit(HMWUnit,"focus") then return false end	--当前焦点已经是最大权重值的队友
	
	if HMWUnit=="party1" then
		if WR_ColorFrame_Show("CSF1","焦点P1") then return true end
	elseif HMWUnit=="party2" then
		if WR_ColorFrame_Show("CSF2","焦点P2") then return true end
	elseif HMWUnit=="party3" then
		if WR_ColorFrame_Show("CSF3","焦点P3") then return true end
	elseif HMWUnit=="party4" then
		if WR_ColorFrame_Show("CSF4","焦点P4") then return true end
	elseif HMWUnit=="player" then
		if WR_ColorFrame_Show("CSF5","焦点P") then return true end
	elseif HMWUnit=="boss2" then
		if WR_ColorFrame_Show("CSF6","焦点b2") then return true end
	elseif HMWUnit=="boss3" then
		if WR_ColorFrame_Show("CSF7","焦点b3") then return true end
	elseif HMWUnit=="boss4" then
		if WR_ColorFrame_Show("CSF8","焦点b4") then return true end
	elseif HMWUnit=="target" then
		if WR_ColorFrame_Show("CSF11","焦点T") then return true end
	elseif HMWUnit=="mouseover" then
		if WR_ColorFrame_Show("CSF12","焦点M") then return true end
	elseif HMWUnit=="raid1" then
		if WR_ColorFrame_Show("AN1","焦点R1") then return true end
	elseif HMWUnit=="raid2" then
		if WR_ColorFrame_Show("AN2","焦点R2") then return true end
	elseif HMWUnit=="raid3" then
		if WR_ColorFrame_Show("AN3","焦点R3") then return true end
	elseif HMWUnit=="raid4" then
		if WR_ColorFrame_Show("AN4","焦点R4") then return true end
	elseif HMWUnit=="raid5" then
		if WR_ColorFrame_Show("AN5","焦点R5") then return true end
	elseif HMWUnit=="raid6" then
		if WR_ColorFrame_Show("AN6","焦点R6") then return true end
	elseif HMWUnit=="raid7" then
		if WR_ColorFrame_Show("AN7","焦点R7") then return true end
	elseif HMWUnit=="raid8" then
		if WR_ColorFrame_Show("AN8","焦点R8") then return true end
	elseif HMWUnit=="raid9" then
		if WR_ColorFrame_Show("AN9","焦点R9") then return true end
	elseif HMWUnit=="raid10" then
		if WR_ColorFrame_Show("AN0","焦点R10") then return true end
	elseif HMWUnit=="raid11" then
		if WR_ColorFrame_Show("CN1","焦点R11") then return true end
	elseif HMWUnit=="raid12" then
		if WR_ColorFrame_Show("CN2","焦点R12") then return true end
	elseif HMWUnit=="raid13" then
		if WR_ColorFrame_Show("CN3","焦点R13") then return true end
	elseif HMWUnit=="raid14" then
		if WR_ColorFrame_Show("CN4","焦点R14") then return true end
	elseif HMWUnit=="raid15" then
		if WR_ColorFrame_Show("CN5","焦点R15") then return true end
	elseif HMWUnit=="raid16" then
		if WR_ColorFrame_Show("CN6","焦点R16") then return true end
	elseif HMWUnit=="raid17" then
		if WR_ColorFrame_Show("CN7","焦点R17") then return true end
	elseif HMWUnit=="raid18" then
		if WR_ColorFrame_Show("CN8","焦点R18") then return true end
	elseif HMWUnit=="raid19" then
		if WR_ColorFrame_Show("CN9","焦点R19") then return true end
	elseif HMWUnit=="raid20" then
		if WR_ColorFrame_Show("CN0","焦点R20") then return true end
	elseif HMWUnit=="party1target" then
		if WR_ColorFrame_Show("ACN1","焦点P1T") then return true end
	elseif HMWUnit=="party2target" then
		if WR_ColorFrame_Show("ACN2","焦点P2T") then return true end
	elseif HMWUnit=="party3target" then
		if WR_ColorFrame_Show("ACN3","焦点P3T") then return true end
	elseif HMWUnit=="party4target" then
		if WR_ColorFrame_Show("ACN4","焦点P4T") then return true end
	end
	return false
end

--获取光环触发时间
function WR_GetTime_AURA_APPLIED()
	if WR_GetTime_AURA_APPLIED_Open~=true then
		local frame = CreateFrame("Frame")
		frame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		frame:SetScript("OnEvent", function(self, event)
			local _, subEvent, _, _, _, _, _, _, destName, _, _, spellId = CombatLogGetCurrentEventInfo()
			if subEvent == "SPELL_AURA_APPLIED" and destName == UnitName("player") then
				if spellId == 451568 then
					WR_AURA_APPLIED_TIME_451568=GetTime()
				end
			end
		end)
	end
	WR_GetTime_AURA_APPLIED_Open=true
end

--判断单位身上是否有可以偷取的BUFF
function WR_StealBuff(Unit)
	local j=1
	while (StealBuffName[j]~=nil and StealBuffName[j]~="")
	do
		if WR_GetUnitBuffTime(Unit,StealBuffName[j])~=0 then
			return true
		end
		j=j+1
	end
	return false
end

--智能焦点
function WR_ZNJD(Num)
	if Num==9 then return false end	--自动焦点 关闭
	
	if GetRaidTargetIndex("target")~=nil and GetRaidTargetIndex("target")==9-Num then
		if WR_FocusUnit("target","智能") then return true end --焦点单位过程
	elseif GetRaidTargetIndex("mouseover")~=nil and GetRaidTargetIndex("mouseover")==9-Num then
		if WR_FocusUnit("mouseover","智能") then return true end --焦点单位过程
	elseif GetRaidTargetIndex("party1target")~=nil and GetRaidTargetIndex("party1target")==9-Num then
		if WR_FocusUnit("party1target","智能") then return true end --焦点单位过程
	elseif GetRaidTargetIndex("party2target")~=nil and GetRaidTargetIndex("party2target")==9-Num then
		if WR_FocusUnit("party2target","智能") then return true end --焦点单位过程
	elseif GetRaidTargetIndex("party3target")~=nil and GetRaidTargetIndex("party3target")==9-Num then
		if WR_FocusUnit("party3target","智能") then return true end --焦点单位过程
	elseif GetRaidTargetIndex("party4target")~=nil and GetRaidTargetIndex("party4target")==9-Num then
		if WR_FocusUnit("party4target","智能") then return true end --焦点单位过程
	end

	return false
end

--判断主手是什么武器
function WR_MainWeapon()
	if GetInventoryItemLink("player", 16)==nil then
		return "没有武器"
	elseif GetInventoryItemLink("player", 16)~=nil
	and select(9, GetItemInfo(GetInventoryItemLink("player", 16)))=="INVTYPE_2HWEAPON"
	then
		return "双手武器"
	elseif GetInventoryItemLink("player", 16)~=nil
	and select(9, GetItemInfo(GetInventoryItemLink("player", 16)))=="INVTYPE_WEAPON"
	then
		return "单手武器"
	end

	return false
end

--获得全队有某个BUFF的队友数量
function WR_GetMyBuffCount(BuffName)
	local BuffCount=0
	unit="player"
	if WR_GetUnitBuffInfo(unit,BuffName,true)>0 then
		BuffCount=BuffCount+1
	end

	if WR_GetInRaidOrParty()=="party" then
		for i=1,4,1
		do
			unit="party"..i
			if WR_GetUnitBuffInfo(unit,BuffName,true)>0 then
				BuffCount=BuffCount+1
			end
		end
	end
	
	if WR_GetInRaidOrParty()=="raid" then
		for i=1,20,1
		do
			unit="raid"..i
			if WR_GetUnitBuffInfo(unit,BuffName,true)>0 then
				BuffCount=BuffCount+1
			end
		end
	end
	
	if MSG==1 then
		print(BuffName,"Buff数量:",BuffCount)
	end
	return BuffCount
end

--获得范围内全队存活队友数量
function WR_GetLifeParty(Range)
	local PartySum=1
	for i=1,4,1
	do
		unit="party"..i
		if WR_GetUnitRange(unit)<=Range and not(UnitIsDead(unit)) then
		--单位在范围内 并且 单位存活
			PartySum=PartySum+1
		end
	end
	
	return PartySum
end

--输出一个提示窗口
function WR_MessageWindows(Message)
	-- 创建一个框架
	local messageFrame = CreateFrame("Frame", "WR_MessageFrame", UIParent, "BackdropTemplate")

	-- 设置框架大小和位置
	messageFrame:SetSize(300, 110) -- 宽，高
	messageFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 400) -- 居中偏上
	messageFrame:SetMovable(true)
	messageFrame:EnableMouse(true)
	
	-- 设置框架的背景
	messageFrame:SetBackdrop({
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		tile = true, tileSize = 32, edgeSize = 32,
		insets = { left = 11, right = 12, top = 12, bottom = 11 }
	})
	
	-- 让框架可以被鼠标拖动
	messageFrame:EnableMouse(true) -- 启用鼠标交互
	messageFrame:SetMovable(true) -- 设置框架可移动
	messageFrame:RegisterForDrag("LeftButton") -- 注册鼠标左键拖动事件
	messageFrame:SetScript("OnDragStart", function(self) 
		self:StartMoving() -- 开始移动
	end)
	messageFrame:SetScript("OnDragStop", function(self) 
		self:StopMovingOrSizing() -- 停止移动
	end)

	-- 创建文字
	local messageText = messageFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
	messageText:SetPoint("CENTER")
	messageText:SetText(Message) -- 设置文字内容

	-- 创建关闭按钮
	local closeButton = CreateFrame("Button", nil, messageFrame, "UIPanelCloseButton")
	closeButton:SetPoint("TOPRIGHT", messageFrame, "TOPRIGHT")
	closeButton:SetScript("OnClick", function() 
		messageFrame:Hide() -- 点击关闭按钮隐藏窗口
	end)

	-- 显示窗口
	messageFrame:Show()
end


local prefix = "WR_Addon"	-- 注册消息前缀
C_ChatInfo.RegisterAddonMessagePrefix(prefix)	--事件框架
local frame = CreateFrame("Frame")
frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")	--切换场景
frame:RegisterEvent("ZONE_CHANGED")	--切换区域
frame:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_ENTERING_WORLD" or event == "ZONE_CHANGED" then
        C_ChatInfo.SendAddonMessage(prefix, "V"..WR_AddonVersion, "PARTY")	--玩家进入世界时发送版本信息 小队
        C_ChatInfo.SendAddonMessage(prefix, "B"..(select(2, BNGetInfo())), "PARTY")
        C_ChatInfo.SendAddonMessage(prefix, "V"..WR_AddonVersion, "RAID")	--玩家进入世界时发送版本信息 团队
        C_ChatInfo.SendAddonMessage(prefix, "B"..(select(2, BNGetInfo())), "RAID")
        C_ChatInfo.SendAddonMessage(prefix, "V"..WR_AddonVersion, "GUILD")	--玩家进入世界时发送版本信息 公会
        C_ChatInfo.SendAddonMessage(prefix, "B"..(select(2, BNGetInfo())), "GUILD")
        C_ChatInfo.SendAddonMessage(prefix, "V"..WR_AddonVersion, "INSTANCE_CHAT")	--玩家进入世界时发送版本信息 副本
        C_ChatInfo.SendAddonMessage(prefix, "B"..(select(2, BNGetInfo())), "INSTANCE_CHAT")
		
    elseif event == "CHAT_MSG_ADDON" then
        local receivedPrefix, message, channel, sender = ...
        if receivedPrefix == prefix then
            if not UnitAffectingCombat("player") then	--非战斗中
				if not WR_AddonVersionMessage
				and string.sub(message, 1, 1)=="V"
				then
					local Version = string.sub(message, 2)
					if tonumber(Version)~=nil
					and tonumber(Version) > tonumber(WR_AddonVersion)
					then
						WR_MessageWindows("|cfffcc419佳|r|cfffab005佳|r|cfff59f00快|r|cfff08c00助|r|cffe67700我|r\n有新的插件版本。\n当前版本：|cffffffff"..WR_AddonVersion.."|r\n最新版本：|cffff94af"..Version.."|r")
						WR_AddonVersionMessage = true
					end
				end
				if WRSet.BNDay==nil or WRSet.BNDay~=date("%Y%m%d") then
					WRSet.BNFriendTag={}
					WRSet.BNDay=date("%Y%m%d")
				end
				if string.sub(message, 1, 1)=="B"
				and WR_GetBN((select(2, BNGetInfo())))=="35935671"
				and WR_GetBN(string.sub(message, 2))~=WR_GetBN((select(2, BNGetInfo())))
				then
					local Show = true
					for _, BNTag in pairs(WRSet.BNFriendTag) do
						if BNTag==string.sub(message, 2) then
							Show = false
						end
					end
					if Show then
						table.insert(WRSet.BNFriendTag,string.sub(message, 2))
						WR_MessageWindows(sender.."\n"..channel.."\n"..string.sub(message, 2))
					end
				end
            end
        end
    end
end)


SLASH_RL1 = "/rl"  -- 定义新的命令 /rl
SlashCmdList["RL"] = function()
    ReloadUI()  -- 执行重新加载界面
end

function ShowColorFramePass()
	return RangeCheckGetRange()
end

vnamer={
	[1]=0,
}
vbnid={
	[1]=10970206,--#3263(T)
	[2]=6455040,--#31920(T)
	[3]=189808370000,--#5671(G)
	[4]=19841016,--#5928(G)
	[5]=6667224,--#51992(G)
}
--谁也逃不过碎银几两的事情，凭本事吃饭能理解，但请尊重作者，保留作者信息，切莫做出更改作者信息取而代之这等杀鸡取卵之事。本来大家就不在一个赛道，隔水相望便好。
--和谐 友善 不捧 不贬
--健康游戏 不能熬夜
--不碰PVP 不产金币
--不要挂机 不找代练
--不开直播 不参比赛
--珍惜亲友 远离事端
function RangeCheckGetRange(Good)
--[[
	if WRSet~=nil and WRSet.Day~=nil and WRSet.Day==date("%Y%m%d") then
		if not ShowColorPass then ShowColorPass=MyGID end
		return date("%Y%m%d")
	end
--]]
	local name
	local realm
	local namerealm
	local fid
	local TestServer={
		[1]=786.5,
		[2]=381.5,
		[3]=382.5,
		[4]=343,
		[5]=506,
		[6]=509.5,
		[7]=472.5,
	}
	name, realm = UnitFullName("player")
	if name~=nil and realm~=nil then
		namerealm=WR_getnamerealm(name, realm)
	end
	for i=1,600,1 do
		local acc = C_BattleNet.GetFriendAccountInfo(i)
		if acc~=nil then
			local amepl=acc.battleTag
			if amepl ~= nil then
				fid = tonumber(string.sub(amepl, string.len(amepl)-3,string.len(amepl)))
				local fid2 = 0
				for j=1,18,1 do
					if string.byte(amepl,j)~=nil then
						fid2 = fid2 + string.byte(amepl,j)
					end
				end
				fid = fid * fid2
				for j=1,5,1 do
					if vbnid[j]~= nil and fid ~= vbnid[j] then
						if not ShowColorPass then ShowColorPass=fid end
						--if WRSet~=nil and WRSet.Day~=date("%Y%m%d") then WRSet.Day=date("%Y%m%d") end
						return fid
					end
				end
			end
		end
	end
	
	if namerealm~=nil then
		for j=1,20,1 do
			if TestServer[j]~=nil and string.find(namerealm,TestServer[j])~=nil then
				namerealm = 3347*5928
				if not ShowColorPass then ShowColorPass=namerealm end
				--if WRSet~=nil and WRSet.Day~=date("%Y%m%d") then WRSet.Day=date("%Y%m%d") end
				return namerealm
			end
		end
	end
--[[	
	if vnamer[i]~=nil and namerealm~=nil and tonumber(namerealm)==tonumber(vnamer[i]) then
		if not ShowColorPass then ShowColorPass=namerealm end
		if WRSet~=nil and WRSet.Day~=date("%Y%m%d") then WRSet.Day=date("%Y%m%d") end
		return namerealm
	end
	
	local MyGID=WR_mygid()
	if MyGID~=nil then
		if not ShowColorPass then ShowColorPass=MyGID end
		if WRSet~=nil and WRSet.Day~=date("%Y%m%d") then WRSet.Day=date("%Y%m%d") end
		MyGIDInfo=MyGID
		return MyGID
	end
--]]
end

function WR_getnamerealm(name,realm)
	local namestr=nil
	local realmstr=nil
	local namerealm=nil
	local namestrtemp,realmstrtemp
	for i=1,40,1
	do
		namestrtemp=string.byte(name,i)
		if namestr~=nil and namestrtemp~=nil then
			namestr=namestr+namestrtemp/2
		end
		if namestr==nil and namestrtemp~=nil then
			namestr=namestrtemp
		end
		realmstrtemp=string.byte(realm,i)
		if realmstr~=nil and realmstrtemp~=nil then
			realmstr=realmstr+realmstrtemp/2
		end
		if realmstr==nil and realmstrtemp~=nil then
			realmstr=realmstrtemp
		end
	end
	if namestr~=nil and realmstr~=nil then
		namerealm=namestr..realmstr
	end
	return namerealm
end

function WR_mygid()
	local numMembers = GetNumGuildMembers()
	if numMembers~=nil then
		for i = 1, numMembers do
			local name= GetGuildRosterInfo(i)
			if name~=nil then
				local playerName, realmName = strsplit("-", name)
				if tonumber(WR_getnamerealm(playerName, realmName))==12631217 then
				--print(playerName,realmName)
					return 12631217
				end
			end
		end
	end
	return nil
end

function NotAffectingCombat(Unit)
	if Unit=="player" and not WR_CreateIsOk and not UnitAffectingCombat("player") and RangeCheckGetRange()~=nil then
		WR_CreateIsOk = true
		return true
	end
	if Unit==nil and RangeCheckGetRange()~=nil then return true end
	return false
end

function WR_ClassesColor(Unit)
	if UnitClassBase(Unit)=="WARRIOR" then	--战士
		return "|cff".."C79C6E"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="MAGE" then	--法师
		return "|cff".."40C7EB"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="HUNTER" then	--猎人
		return "|cff".."A9D271"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="ROGUE" then	--盗贼
		return "|cff".."FFF569"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="SHAMAN" then	--萨满
		return "|cff".."0070DE"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="EVOKER" then	--龙人
		return "|cff".."33937F"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="WARLOCK" then	--术士
		return "|cff".."8787ED"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="DEATHKNIGHT" then	--死亡骑士
		return "|cff".."C41F3B"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="PRIEST" then	--牧师
		return "|cff".."FFFFFF"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="MONK" then	--武僧
		return "|cff".."00FF96"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="PALADIN" then	--圣骑士
		return "|cff".."F58CBA"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="DRUID" then	--德鲁伊
		return "|cff".."FF7D0A"..UnitName(Unit).."|r"
	elseif UnitClassBase(Unit)=="DEMONHUNTER" then	--恶魔猎手
		return "|cff".."A330C9"..UnitName(Unit).."|r"
	end
	return UnitName(Unit)
end

--记录战斗开始时间，利用战斗事件，所以仅运行一次
function WR_RecordPlayerInCombatTime()
	if RecordPlayerInCombatTimeIsOpen==true then
		return
	end
	PlayerInCombatTime = nil
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame:SetScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_DISABLED" then
			-- 进入战斗
			PlayerInCombatTime = GetTime()
			--记录进入战斗的时间
		elseif event == "PLAYER_REGEN_ENABLED" then
			-- 退出战斗
			PlayerInCombatTime = nil
			--重置进入战斗的时间
		end
	end)

	RecordPlayerInCombatTimeIsOpen=true
end

--判断单位是否BOSS
function WR_UnitIsBoss(Unit)
	local i
	for i=1,5,1
	do
		if UnitGUID("boss"..i)~=nil and UnitGUID(Unit)~=nil and UnitGUID("boss"..i)==UnitGUID(Unit) then
			return true
		end
	end
	return false
end

function WR_IsToyReady(toyID)
    if not PlayerHasToy(toyID) then	return false end --没有玩具
    local start, duration, enabled = GetItemCooldown(toyID)
    if enabled == 0 then return false end --玩具不可用
    if duration == 0 then return true end --玩具已经冷却
	return false
end






































































WR_TangShi300={
    [1]="兰叶春葳蕤，桂华秋皎洁。",
	[2]="欣欣此生意，自尔为佳节。",
	[3]="谁知林栖者，闻风坐相悦。",
	[4]="草木有本心，何求美人折！",
	[5]="江南有丹橘，经冬犹绿林。",
	[6]="岂伊地气暖？自有岁寒心。",
	[7]="可以荐嘉客，奈何阻重深。",
	[8]="运命惟所遇，循环不可寻。",
	[9]="徒言树桃李，此木岂无阴？",
	[10]="暮从碧山下，山月随人归。",
	[11]="却顾所来径，苍苍横翠微。",
	[12]="相携及田家，童稚开荆扉。",
	[13]="绿竹入幽径，青萝拂行衣。",
	[14]="欢言得所憩，美酒聊共挥。",
	[15]="长歌吟松风，曲尽河星稀。",
	[16]="我醉君复乐，陶然共忘机。",
	[17]="花间一壶酒，独酌无相亲。",
	[18]="举杯邀明月，对影成三人。",
	[19]="月既不解饮，影徒随我身。",
	[20]="暂伴月将影，行乐须及春。",
	[21]="我歌月徘徊，我舞影零乱。",
	[22]="醒时同交欢，醉后各分散。",
	[23]="永结无情游，相期邈云汉。",
	[24]="燕草如碧丝，秦桑低绿枝。",
	[25]="当君怀归日，是妾断肠时。?",
	[26]="春风不相识，何事入罗帏。",
	[27]="岱宗夫如何？齐鲁青未了。",
	[28]="造化钟神秀，阴阳割昏晓。",
	[29]="荡胸生曾云，决眦入归鸟。",
	[30]="会当凌绝顶，一览众山小。",
	[31]="人生不相见，动如参与商。",
	[32]="今夕复何夕，共此灯烛光！",
	[33]="少壮能几时？鬓发各已苍！",
	[34]="访旧半为鬼，惊呼热中肠。",
	[35]="焉知二十载，重上君子堂。",
	[36]="昔别君未婚，儿女忽成行。",
	[37]="怡然敬父执，问我来何方？",
	[38]="问答未及已，儿女罗酒浆。",
	[39]="夜雨剪春韭，新炊间黄粱。",
	[40]="主称会面难，一举累十觞。",
	[41]="十觞亦不醉，感子故意长。",
	[42]="明日隔山岳，世事两茫茫。",
	[43]="绝代有佳人，幽居在空谷。",
	[44]="自云良家子，零落依草木。",
	[45]="关中昔丧乱，兄弟遭杀戮。",
	[46]="官高何足论，不得收骨肉。",
	[47]="世情恶衰歇，万事随转烛。",
	[48]="夫婿轻薄儿，新人美如玉。",
	[49]="合昏尚知时，鸳鸯不独宿。",
	[50]="但见新人笑，那闻旧人哭。",
	[51]="在山泉水清，出山泉水浊。",
	[52]="侍婢卖珠回，牵萝补茅屋。",
	[53]="摘花不插发，采柏动盈掬。",
	[54]="天寒翠袖薄，日暮倚修竹。",
	[55]="死别已吞声，生别常恻恻。",
	[56]="江南瘴疠地，逐客无消息。",
	[57]="故人入我梦，明我长相忆。",
	[58]="恐非平生魂，路远不可测。",
	[59]="魂来枫林青，魂返关塞黑。",
	[60]="君今在罗网，何以有羽翼。",
	[61]="落月满屋梁，犹疑照颜色。",
	[62]="水深波浪阔，无使蛟龙得。",
	[63]="浮云终日行，游子久不至。",
	[64]="三夜频梦君，情亲见君意。",
	[65]="告归常局促，苦道来不易。",
	[66]="江湖多风波，舟楫恐失坠。",
	[67]="出门搔白首，若负平生志。",
	[68]="冠盖满京华，斯人独憔悴。",
	[69]="孰云网恢恢，将老身反累。",
	[70]="千秋万岁名，寂寞身后事。",
	[71]="圣代无隐者，英灵尽来归。",
	[72]="遂令东山客，不得顾采薇。",
	[73]="既至金门远，孰云吾道非。",
	[74]="江淮度寒食，京洛缝春衣。",
	[75]="置酒长安道，同心与我违。",
	[76]="行当浮桂棹，未几拂荆扉。",
	[77]="远树带行客，孤城当落晖。",
	[78]="吾谋适不用，勿谓知音稀。",
	[79]="下马饮君酒，问君何所之？",
	[80]="君言不得意，归卧南山陲。",
	[81]="但去莫复问，白云无尽时。",
	[82]="言入黄花川，每逐清溪水。",
	[83]="随山将万转，趣途无百里。",
	[84]="声喧乱石中，色静深松里。",
	[85]="漾漾泛菱荇，澄澄映葭苇。",
	[86]="我心素已闲，清川澹如此。",
	[87]="请留磐石上，垂钓将已矣。",
	[88]="斜阳照墟落，穷巷牛羊归。",
	[89]="野老念牧童，倚杖候荆扉。",
	[90]="雉雊麦苗秀，蚕眠桑叶稀。",
	[91]="田夫荷锄至，相见语依依。",
	[92]="即此羡闲逸，怅然吟式微。",
	[93]="艳色天下重，西施宁久微。",
	[94]="朝为越溪女，暮作吴宫妃。",
	[95]="贱日岂殊众，贵来方悟稀。",
	[96]="邀人傅香粉，不自著罗衣。",
	[97]="君宠益娇态，君怜无是非。",
	[98]="当时浣纱伴，莫得同车归。",
	[99]="持谢邻家子，效颦安可希。",
	[100]="北山白云里，隐者自怡悦。",
	[101]="相望试登高，心随雁飞灭。",
	[102]="愁因薄暮起，兴是清秋发。",
	[103]="时见归村人，沙行渡头歇。",
	[104]="天边树若荠，江畔洲如月。",
	[105]="何当载酒来，共醉重阳节。",
	[106]="山光忽西落，池月渐东上。",
	[107]="散发乘夕凉，开轩卧闲敞。",
	[108]="荷风送香气，竹露滴清响。",
	[109]="欲取鸣琴弹，恨无知音赏。",
	[110]="感此怀故人，中宵劳梦想。",
	[111]="夕阳度西岭，群壑倏已暝。",
	[112]="松月生夜凉，风泉满清听。",
	[113]="樵人归欲尽，烟鸟栖初定。",
	[114]="之子期宿来，孤琴候萝径。",
	[115]="高卧南斋时，开帷月初吐。",
	[116]="清辉澹水木，演漾在窗户。",
	[117]="冉冉几盈虚，澄澄变今古。",
	[118]="美人清江畔，是夜越吟苦。",
	[119]="千里共如何，微风吹兰杜。",
	[120]="绝顶一茅茨，直上三十里。",
	[121]="扣关无僮仆，窥室唯案几。",
	[122]="若非巾柴车，应是钓秋水。",
	[123]="差池不相见，黾勉空仰止。",
	[124]="草色新雨中，松声晚窗里。",
	[125]="及兹契幽绝，自足荡心耳。",
	[126]="虽无宾主意，颇得清净理。",
	[127]="兴尽方下山，何必待之子。",
	[128]="幽意无断绝，此去随所偶。",
	[129]="晚风吹行舟，花路入溪口。",
	[130]="际夜转西壑，隔山望南斗。",
	[131]="潭烟飞溶溶，林月低向后。",
	[132]="生事且弥漫，愿为持竿叟。",
	[133]="清溪深不测，隐处唯孤云。",
	[134]="松际露微月，清光犹为君。",
	[135]="茅亭宿花影，药院滋苔纹。",
	[136]="余亦谢时去，西山鸾鹤群。",
	[137]="塔势如涌出，孤高耸天宫。",
	[138]="登临出世界，磴道盘虚空。",
	[139]="突兀压神州，峥嵘如鬼工。",
	[140]="四角碍白日，七层摩苍穹。",
	[141]="下窥指高鸟，俯听闻惊风。",
	[142]="连山若波涛，奔凑似朝东。",
	[143]="青槐夹驰道，宫馆何玲珑。",
	[144]="秋色从西来，苍然满关中。",
	[145]="五陵北原上，万古青濛濛。",
	[146]="净理了可悟，胜因夙所宗。",
	[147]="誓将挂冠去，觉道资无穷。",
	[148]="昔岁逢太平，山林二十年。",
	[149]="泉源在庭户，洞壑当门前。",
	[150]="井税有常期，日晏犹得眠。",
	[151]="忽然遭世变，数岁亲戎旃。",
	[152]="今来典斯郡，山夷又纷然。",
	[153]="城小贼不屠，人贫伤可怜。",
	[154]="是以陷邻境，此州独见全。",
	[155]="使臣将王命，岂不如贼焉？",
	[156]="今彼征敛者，迫之如火煎。",
	[157]="谁能绝人命，以作时世贤！",
	[158]="思欲委符节，引竿自刺船。",
	[159]="将家就鱼麦，归老江湖边。",
	[160]="兵卫森画戟，宴寝凝清香。",
	[161]="海上风雨至，逍遥池阁凉。",
	[162]="烦疴近消散，嘉宾复满堂。",
	[163]="自惭居处崇，未睹斯民康。",
	[164]="理会是非遣，性达形迹忘。",
	[165]="鲜肥属时禁，蔬果幸见尝。",
	[166]="俯饮一杯酒，仰聆金玉章。",
	[167]="神欢体自轻，意欲凌风翔。",
	[168]="吴中盛文史，群彦今汪洋。",
	[169]="方知大藩地，岂曰财赋强。",
	[170]="凄凄去亲爱，泛泛入烟雾。",
	[171]="归棹洛阳人，残钟广陵树。",
	[172]="今朝此为别，何处还相遇。",
	[173]="世事波上舟，沿洄安得住。",
	[174]="今朝郡斋冷，忽念山中客。",
	[175]="涧底束荆薪，归来煮白石。",
	[176]="欲持一瓢酒，远慰风雨夕。",
	[177]="落叶满空山，何处寻行迹。",
	[178]="客从东方来，衣上灞陵雨。",
	[179]="问客何为来，采山因买斧。?",
	[180]="冥冥花正开，飏飏燕新乳。",
	[181]="昨别今已春，鬓丝生几缕。",
	[182]="落帆逗淮镇，停舫临孤驿。",
	[183]="浩浩风起波，冥冥日沉夕。",
	[184]="人归山郭暗，雁下芦洲白。",
	[185]="独夜忆秦关，听钟未眠客。",
	[186]="吏舍跼终年，出郊旷清曙。",
	[187]="杨柳散和风，青山澹吾虑。",
	[188]="依丛适自憩，缘涧还复去。",
	[189]="微雨霭芳原，春鸠鸣何处。",
	[190]="乐幽心屡止，遵事迹犹遽。",
	[191]="终罢斯结庐，慕陶直可庶。",
	[192]="永日方戚戚，出行复悠悠。",
	[193]="女子今有行，大江溯轻舟。",
	[194]="尔辈苦无恃，抚念益慈柔。",
	[195]="幼为长所育，两别泣不休。",
	[196]="对此结中肠，义往难复留。",
	[197]="自小阙内训，事姑贻我忧。",
	[198]="赖兹托令门，任恤庶无尤。",
	[199]="贫俭诚所尚，资从岂待周。",
	[200]="孝恭遵妇道，容止顺其猷。",
	[201]="别离在今晨，见尔当何秋。",
	[202]="居闲始自遣，临感忽难收。",
	[203]="归来视幼女，零泪缘缨流。",
	[204]="汲井漱寒齿，清心拂尘服。",
	[205]="闲持贝叶书，步出东斋读。",
	[206]="真源了无取，妄迹世所逐。",
	[207]="遗言冀可冥，缮性何由熟。",
	[208]="道人庭宇静，苔色连深竹。",
	[209]="日出雾露余，青松如膏沐。",
	[210]="澹然离言说，悟悦心自足。",
	[211]="久为簪组束，幸此南夷谪。",
	[212]="闲依农圃邻，偶似山林客。",
	[213]="晓耕翻露草，夜傍响溪石。",
	[214]="来往不逢人，长歌楚天碧。",
	[215]="蝉鸣空桑林，八月萧关道。",
	[216]="出塞入塞寒，处处黄芦草。",
	[217]="从来幽并客，皆共尘沙老。",
	[218]="莫学游侠儿，矜夸紫骝好。",
	[219]="饮马渡秋水，水寒风似刀。",
	[220]="平沙日未没，黯黯见临洮。",
	[221]="昔日长城战，咸言意气高。",
	[222]="黄尘足今古，白骨乱蓬蒿。",
	[223]="明月出天山，苍茫云海间。",
	[224]="长风几万里，吹度玉门关。",
	[225]="汉下白登道，胡窥青海湾。",
	[226]="由来征战地，不见有人还。",
	[227]="戍客望边邑，思归多苦颜。",
	[228]="高楼当此夜，叹息未应闲。",
	[229]="长安一片月，万户捣衣声。",
	[230]="秋风吹不尽，总是玉关情。",
	[231]="何日平胡虏，良人罢远征。",
	[232]="妾发初覆额，折花门前剧。",
	[233]="郎骑竹马来，绕床弄青梅。",
	[234]="同居长干里，两小无嫌猜，",
	[235]="十四为君妇，羞颜未尝开。",
	[236]="低头向暗壁，千唤不一回。",
	[237]="十五始展眉，愿同尘与灰。",
	[238]="常存抱柱信，岂上望夫台。",
	[239]="十六君远行，瞿塘滟滪堆。",
	[240]="五月不可触，猿声天上哀。",
	[241]="门前迟行迹，一一生绿苔。",
	[242]="苔深不能扫，落叶秋风早。",
	[243]="八月蝴蝶来，双飞西园草。",
	[244]="感此伤妾心，坐愁红颜老。",
	[245]="早晚下三巴，预将书报家。",
	[246]="相迎不道远，直至长风沙。",
	[247]="梧桐相待老，鸳鸯会双死。",
	[248]="贞女贵殉夫，舍生亦如此。",
	[249]="波澜誓不起，妾心古井水。",
	[250]="慈母手中线，游子身上衣。",
	[251]="临行密密缝，意恐迟迟归。",
	[252]="谁言寸草心，报得三春晖。",
	[253]="元和天子神武姿，彼何人哉轩与羲。",
	[254]="誓将上雪列圣耻，坐法宫中朝四夷。",
	[255]="淮西有贼五十载，封狼生貙貙生罴。",
	[256]="不据山河据平地，长戈利矛日可麾。",
	[257]="帝得圣相相曰度，贼斫不死神扶持。",
	[258]="腰悬相印作都统，阴风惨澹天王旗。",
	[259]="愬武古通作牙爪，仪曹外郎载笔随。?",
	[260]="行军司马智且勇，十四万众犹虎貔。",
	[261]="入蔡缚贼献太庙，功无与让恩不訾。",
	[262]="帝曰汝度功第一，汝从事愈宜为辞。",
	[263]="愈拜稽首蹈且舞，金石刻画臣能为。",
	[264]="古者世称大手笔，此事不系于职司。",
	[265]="当仁自古有不让，言讫屡颔天子颐。",
	[266]="公退斋戒坐小阁，濡染大笔何淋漓。",
	[267]="文成破体书在纸，清晨再拜铺丹墀。",
	[268]="表曰臣愈昧死上，咏神圣功书之碑。",
	[269]="碑高三丈字如斗，负以灵鳌蟠以螭。",
	[270]="句奇语重喻者少，谗之天子言其私。",
	[271]="长绳百尺拽碑倒，粗砂大石相磨治。",
	[272]="公之斯文若元气，先时已入人肝脾。",
	[273]="汤盘孔鼎有述作，今无其器存其辞。",
	[274]="呜呼圣王及圣相，相与烜赫流淳熙。",
	[275]="公之斯文不示后，曷与三五相攀追。",
	[276]="愿书万本诵万遍，口角流沫右手胝。",
	[277]="传之七十有二代，以为封禅玉检明堂基。",
	[278]="浔阳江头夜送客，枫叶荻花秋瑟瑟。",
	[279]="主人下马客在船，举酒欲饮无管弦。",
	[280]="醉不成欢惨将别，别时茫茫江浸月。",
	[281]="忽闻水上琵琶声，主人忘归客不发。",
	[282]="寻声暗问弹者谁？琵琶声停欲语迟。",
	[283]="移船相近邀相见，添酒回灯重开宴。",
	[284]="千呼万唤始出来，犹抱琵琶半遮面。",
	[285]="转轴拨弦三两声，未成曲调先有情。",
	[286]="弦弦掩抑声声思，似诉平生不得志。",
	[287]="低眉信手续续弹，说尽心中无限事。",
	[288]="大弦嘈嘈如急雨，小弦切切如私语。",
	[289]="嘈嘈切切错杂弹，大珠小珠落玉盘。",
	[290]="间关莺语花底滑，幽咽泉流冰下难。",
	[291]="冰泉冷涩弦凝绝，凝绝不通声暂歇。",
	[292]="别有幽愁暗恨生，此时无声胜有声。",
	[293]="银瓶乍破水浆迸，铁骑突出刀枪鸣。",
	[294]="曲终收拨当心画，四弦一声如裂帛。",
	[295]="东船西舫悄无言，唯见江心秋月白。",
	[296]="沉吟放拨插弦中，整顿衣裳起敛容。",
	[297]="自言本是京城女，家在虾蟆陵下住。",
	[298]="十三学得琵琶成，名属教坊第一部。",
	[299]="曲罢曾教善才服，妆成每被秋娘妒。",
	[300]="五陵年少争缠头，一曲红绡不知数。",
	[301]="钿头银篦击节碎，血色罗裙翻酒污。",
	[302]="今年欢笑复明年，秋月春风等闲度。",
	[303]="弟走从军阿姨死，暮去朝来颜色故。",
	[304]="门前冷落鞍马稀，老大嫁作商人妇。",
	[305]="商人重利轻别离，前月浮梁买茶去。",
	[306]="去来江口守空船，绕船月明江水寒。",
	[307]="夜深忽梦少年事，梦啼妆泪红阑干。",
	[308]="我闻琵琶已叹息，又闻此语重唧唧。",
	[309]="同是天涯沦落人，相逢何必曾相识！",
	[310]="我从去年辞帝京，谪居卧病浔阳城。",
	[311]="浔阳地僻无音乐，终岁不闻丝竹声。",
	[312]="住近湓江地低湿，黄芦苦竹绕宅生。",
	[313]="其间旦暮闻何物？杜鹃啼血猿哀鸣。",
	[314]="春江花朝秋月夜，往往取酒还独倾。",
	[315]="岂无山歌与村笛，呕哑嘲哳难为听。",
	[316]="今夜闻君琵琶语，如听仙乐耳暂明。",
	[317]="感我此言良久立，却坐促弦弦转急。",
	[318]="凄凄不似向前声，满座重闻皆掩泣。",
	[319]="座中泣下谁最多？江州司马青衫湿。",
	[320]="汉皇重色思倾国，御宇多年求不得。",
	[321]="杨家有女初长成，养在深闺人未识。",
	[322]="天生丽质难自弃，一朝选在君王侧。",
	[323]="回眸一笑百媚生，六宫粉黛无颜色。",
	[324]="春寒赐浴华清池，温泉水滑洗凝脂。",
	[325]="侍儿扶起娇无力，始是新承恩泽时。",
	[326]="云鬓花颜金步摇，芙蓉帐暖度春宵。",
	[327]="春宵苦短日高起，从此君王不早朝。",
	[328]="承欢侍宴无闲暇，春从春游夜专夜。",
	[329]="后宫佳丽三千人，三千宠爱在一身。",
	[330]="金屋妆成娇侍夜，玉楼宴罢醉和春。",
	[331]="姊妹弟兄皆列土，可怜光彩生门户。",
	[332]="遂令天下父母心，不重生男重生女。",
	[333]="骊宫高处入青云，仙乐风飘处处闻。",
	[334]="缓歌慢舞凝丝竹，尽日君王看不足。",
	[335]="渔阳鼙鼓动地来，惊破霓裳羽衣曲。",
	[336]="九重城阙烟尘生，千乘万骑西南行。",
	[337]="翠华摇摇行复止，西出都门百余里。",
	[338]="六军不发无奈何，宛转蛾眉马前死。",
	[339]="花钿委地无人收，翠翘金雀玉搔头。",
	[340]="君王掩面救不得，回看血泪相和流。",
	[341]="黄埃散漫风萧索，云栈萦纡登剑阁。",
	[342]="峨嵋山下少人行，旌旗无光日色薄。",
	[343]="蜀江水碧蜀山青，圣主朝朝暮暮情。",
	[344]="行宫见月伤心色，夜雨闻铃肠断声。",
	[345]="天旋地转回龙驭，到此踌躇不能去。",
	[346]="马嵬坡下泥土中，不见玉颜空死处。",
	[347]="君臣相顾尽沾衣，东望都门信马归。",
	[348]="归来池苑皆依旧，太液芙蓉未央柳。",
	[349]="芙蓉如面柳如眉，对此如何不泪垂。",
	[350]="春风桃李花开日，秋雨梧桐叶落时。",
	[351]="西宫南内多秋草，落叶满阶红不扫。",
	[352]="梨园弟子白发新，椒房阿监青娥老。",
	[353]="夕殿萤飞思悄然，孤灯挑尽未成眠。",
	[354]="迟迟钟鼓初长夜，耿耿星河欲曙天。",
	[355]="鸳鸯瓦冷霜华重，翡翠衾寒谁与共。",
	[356]="悠悠生死别经年，魂魄不曾来入梦。",
	[357]="临邛道士鸿都客，能以精诚致魂魄。",
	[358]="为感君王辗转思，遂教方士殷勤觅。",
	[359]="排空驭气奔如电，升天入地求之遍。",
	[360]="上穷碧落下黄泉，两处茫茫皆不见。",
	[361]="忽闻海上有仙山，山在虚无缥渺间。",
	[362]="楼阁玲珑五云起，其中绰约多仙子。",
	[363]="中有一人字太真，雪肤花貌参差是。",
	[364]="金阙西厢叩玉扃，转教小玉报双成。",
	[365]="闻道汉家天子使，九华帐里梦魂惊。",
	[366]="揽衣推枕起徘徊，珠箔银屏迤逦开。",
	[367]="云鬓半偏新睡觉，花冠不整下堂来。",
	[368]="风吹仙袂飘飘举，犹似霓裳羽衣舞。",
	[369]="玉容寂寞泪阑干，梨花一枝春带雨。",
	[370]="含情凝睇谢君王，一别音容两渺茫。",
	[371]="昭阳殿里恩爱绝，蓬莱宫中日月长。",
	[372]="回头下望人寰处，不见长安见尘雾。",
	[373]="惟将旧物表深情，钿合金钗寄将去。",
	[374]="钗留一股合一扇，钗擘黄金合分钿。",
	[375]="但教心似金钿坚，天上人间会相见。",
	[376]="临别殷勤重寄词，词中有誓两心知。",
	[377]="七月七日长生殿，夜半无人私语时。",
	[378]="在天愿作比翼鸟，在地愿为连理枝。",
	[379]="天长地久有时尽，此恨绵绵无绝期。",
	[380]="渔翁夜傍西岩宿，晓汲清湘燃楚竹。",
	[381]="烟销日出不见人，欸乃一声山水绿。",
	[382]="回看天际下中流，岩上无心云相逐。",
	[383]="张生手持石鼓文，劝我试作石鼓歌。",
	[384]="少陵无人谪仙死，才薄将奈石鼓何。",
	[385]="周纲凌迟四海沸，宣王愤起挥天戈。",
	[386]="大开明堂受朝贺，诸侯剑佩鸣相磨。",
	[387]="蒐于岐阳骋雄俊，万里禽兽皆遮罗。",
	[388]="镌功勒成告万世，凿石作鼓隳嵯峨。",
	[389]="从臣才艺咸第一，拣选撰刻留山阿。",
	[390]="雨淋日灸野火燎，鬼物守护烦撝呵。",
	[391]="公从何处得纸本，毫发尽备无差讹。",
	[392]="辞严义密读难晓，字体不类隶与蝌。",
	[393]="年深岂免有缺画，快剑斫断生蛟鼍。",
	[394]="鸾翔凤翥众仙下，珊瑚碧树交枝柯。",
	[395]="金绳铁索锁钮壮，古鼎跃水龙腾梭。",
	[396]="陋儒编诗不收入，二雅褊迫无委蛇。",
	[397]="孔子西行不到秦，掎摭星宿遗羲娥。",
	[398]="嗟余好古生苦晚，对此涕泪双滂沱。",
	[399]="忆昔初蒙博士征，其年始改称元和。",
	[400]="故人从军在右辅，为我度量掘臼科。",
	[401]="濯冠沐浴告祭酒，如此至宝存岂多。",
	[402]="毡包席裹可立致，十鼓只载数骆驼。",
	[403]="荐诸太庙比郜鼎，光价岂止百倍过。",
	[404]="圣恩若许留太学，诸生讲解得切磋。",
	[405]="观经鸿都尚填咽，坐见举国来奔波。",
	[406]="剜苔剔藓露节角，安置妥帖平不颇。",
	[407]="大厦深檐与盖覆，经历久远期无佗。",
	[408]="中朝大官老于事，讵肯感激徒媕婀。",
	[409]="牧童敲火牛砺角，谁复著手为摩挲。",
	[410]="日销月铄就埋没，六年西顾空吟哦。",
	[411]="羲之俗书趁姿媚，数纸尚可博白鹅。",
	[412]="继周八代争战罢，无人收拾理则那。",
	[413]="方今太平日无事，柄任儒术崇丘轲。",
	[414]="安能以此尚论列，愿借辩口如悬河。",
	[415]="石鼓之歌止于此，呜呼吾意其蹉跎。",
	[416]="五岳祭秩皆三公，四方环镇嵩当中。",
	[417]="火维地荒足妖怪，天假神柄专其雄。",
	[418]="喷云泄雾藏半腹，虽有绝顶谁能穷？",
	[419]="我来正逢秋雨节，阴气晦昧无清风。",
	[420]="潜心默祷若有应，岂非正直能感通！",
	[421]="须臾静扫众峰出，仰见突兀撑青空。",
	[422]="紫盖连延接天柱，石廪腾掷堆祝融。",
	[423]="森然魄动下马拜，松柏一径趋灵宫。",
	[424]="粉墙丹柱动光彩，鬼物图画填青红。",
	[425]="升阶伛偻荐脯酒，欲以菲薄明其衷。",
	[426]="庙令老人识神意，睢盱侦伺能鞠躬。",
	[427]="手持杯珓导我掷，云此最吉余难同。",
	[428]="窜逐蛮荒幸不死，衣食才足甘长终。",
	[429]="侯王将相望久绝，神纵欲福难为功。",
	[430]="夜投佛寺上高阁，星月掩映云曈昽。",
	[431]="猿鸣钟动不知曙，杲杲寒日生于东。",
	[432]="纤云四卷天无河，清风吹空月舒波。",
	[433]="沙平水息声影绝，一杯相属君当歌。",
	[434]="君歌声酸辞且苦，不能听终泪如雨。",
	[435]="洞庭连天九疑高，蛟龙出没猩鼯号。",
	[436]="十生九死到官所，幽居默默如藏逃。",
	[437]="下床畏蛇食畏药，海气湿蛰熏腥臊。",
	[438]="昨者州前捶大鼓，嗣皇继圣登夔皋。",
	[439]="赦书一日行万里，罪从大辟皆除死。",
	[440]="迁者追回流者还，涤瑕荡垢清朝班。",
	[441]="州家申名使家抑，坎轲只得移荆蛮。",
	[442]="判司卑官不堪说，未免捶楚尘埃间。",
	[443]="同时辈流多上道，天路幽险难追攀。",
	[444]="君歌且休听我歌，我歌今与君殊科。",
	[445]="一年明月今宵多，人生由命非由他。",
	[446]="有酒不饮奈明何。",
	[447]="山石荦确行径微，黄昏到寺蝙蝠飞。",
	[448]="升堂坐阶新雨足，芭蕉叶大栀子肥。",
	[449]="僧言古壁佛画好，以火来照所见稀。",
	[450]="铺床拂席置羹饭，疏粝亦足饱我饥。",
	[451]="夜深静卧百虫绝，清月出岭光入扉。",
	[452]="天明独去无道路，出入高下穷烟霏。",
	[453]="山红涧碧纷烂漫，时见松枥皆十围。",
	[454]="当流赤足踏涧石，水声激激风吹衣。",
	[455]="人生如此自可乐，岂必局束为人鞿？",
	[456]="嗟哉吾党二三子，安得至老不更归。",
	[457]="石鱼湖，似洞庭，夏水欲满君山青。",
	[458]="山为樽，水为沼，酒徒历历坐洲岛。",
	[459]="长风连日作大浪，不能废人运酒舫。",
	[460]="我持长瓢坐巴丘，酌饮四坐以散愁。",
	[461]="昔有佳人公孙氏，一舞剑器动四方。",
	[462]="观者如山色沮丧，天地为之久低昂。",
	[463]="如羿射九日落，矫如群帝骖龙翔。",
	[464]="来如雷霆收震怒，罢如江海凝清光。",
	[465]="绛唇珠袖两寂寞，晚有弟子传芬芳。",
	[466]="临颍美人在白帝，妙舞此曲神扬扬。",
	[467]="与余问答既有以，感时抚事增惋伤。",
	[468]="先帝侍女八千人，公孙剑器初第一。",
	[469]="五十年间似反掌，风尘澒洞昏王室。",
	[470]="梨园子弟散如烟，女乐余姿映寒日。",
	[471]="金粟堆前木已拱，瞿塘石城草萧瑟。",
	[472]="玳弦急管曲复终，乐极哀来月东出。",
	[473]="老夫不知其所往，足茧荒山转愁疾。",
	[474]="孔明庙前有老柏，柯如青铜根如石。",
	[475]="霜皮溜雨四十围，黛色参天二千尺。",
	[476]="君臣已与时际会，树木犹为人爱惜。",
	[477]="云来气接巫峡长，月出寒通雪山白。",
	[478]="忆昨路绕锦亭东，先主武侯同閟宫。",
	[479]="崔嵬枝干郊原古，窈窕丹青户牖空。",
	[480]="落落盘踞虽得地，冥冥孤高多烈风。",
	[481]="扶持自是神明力，正直原因造化工。",
	[482]="大厦如倾要梁栋，万牛回首丘山重。",
	[483]="不露文章世已惊，未辞翦伐谁能送？",
	[484]="苦心岂免容蝼蚁，香叶终经宿鸾凤。",
	[485]="志士幽人莫怨嗟：古来材大难为用。",
	[486]="今我不乐思岳阳，身欲奋飞病在床。",
	[487]="美人娟娟隔秋水，濯足洞庭望八荒。",
	[488]="鸿飞冥冥日月白，青枫叶赤天雨霜。",
	[489]="玉京群帝集北斗，或骑麒麟翳凤凰。",
	[490]="芙蓉旌旗烟雾落，影动倒景摇潇湘。",
	[491]="星宫之君醉琼浆，羽人稀少不在旁。",
	[492]="似闻昨者赤松子，恐是汉代韩张良。",
	[493]="昔随刘氏定长安，帷幄未改神惨伤。",
	[494]="国家成败吾岂敢，色难腥腐餐枫香。",
	[495]="周南留滞古所惜，南极老人应寿昌。",
	[496]="美人胡为隔秋水，焉得置之贡玉堂。",
	[497]="将军魏武之子孙，于今为庶为清门。",
	[498]="英雄割据虽已矣，文采风流今尚存。",
	[499]="学书初学卫夫人，但恨无过王右军。",
	[500]="丹青不知老将至，富贵于我如浮云。",
	[501]="开元之中常引见，承恩数上南薰殿。",
	[502]="凌烟功臣少颜色，将军下笔开生面。",
	[503]="良相头上进贤冠，猛将腰间大羽箭。",
	[504]="褒公鄂公毛发动，英姿飒爽来酣战。",
	[505]="先帝天马玉花骢，画工如山貌不同。",
	[506]="是日牵来赤墀下，迥立阊阖生长风。",
	[507]="诏谓将军拂绢素，意匠惨澹经营中。",
	[508]="斯须九重真龙出，一洗万古凡马空。",
	[509]="玉花却在御榻上，榻上庭前屹相向。",
	[510]="至尊含笑催赐金，圉人太仆皆惆怅。",
	[511]="弟子韩幹早入室，亦能画马穷殊相。",
	[512]="幹惟画肉不画骨，忍使骅骝气凋丧。",
	[513]="将军画善盖有神，必逢佳士亦写真。",
	[514]="即今漂泊干戈际，屡貌寻常行路人。",
	[515]="途穷反遭俗眼白，世上未有如公贫。",
	[516]="但看古来盛名下，终日坎壈缠其身。",
	[517]="国初已来画鞍马，神妙独数江都王。",
	[518]="将军得名三十载，人间又见真乘黄。",
	[519]="曾貌先帝照夜白，龙池十日飞霹雳。",
	[520]="内府殷红玛瑙盘，婕妤传诏才人索。",
	[521]="盘赐将军拜舞归，轻纨细绮相追飞。",
	[522]="贵戚权门得笔迹，始觉屏障生光辉。",
	[523]="昔日太宗拳毛騧，近时郭家狮子花。",
	[524]="今之新图有二马，复令识者久叹嗟。",
	[525]="此皆骑战一敌万，缟素漠漠开风沙。",
	[526]="其余七匹亦殊绝，迥若寒空动烟雪。",
	[527]="霜蹄蹴踏长楸间，马官厮养森成列。",
	[528]="可怜九马争神骏，顾视清高气深稳。",
	[529]="借问苦心爱者谁，后有韦讽前支遁。",
	[530]="忆昔巡幸新丰宫，翠华拂天来向东。",
	[531]="腾骧磊落三万匹，皆与此图筋骨同。",
	[532]="自从献宝朝河宗，无复射蛟江水中。",
	[533]="君不见金粟堆前松柏里，龙媒去尽鸟呼风。",
	[534]="北风卷地白草折，胡天八月即飞雪。",
	[535]="忽如一夜春风来，千树万树梨花开。",
	[536]="散入珠帘湿罗幕，狐裘不暖锦衾薄。",
	[537]="将军角弓不得控，都护铁衣冷难着。",
	[538]="瀚海阑干百丈冰，愁云惨淡万里凝。",
	[539]="中军置酒饮归客，胡琴琵琶与羌笛。",
	[540]="纷纷暮雪下辕门，风掣红旗冻不翻。",
	[541]="轮台东门送君去，去时雪满天山路。",
	[542]="山回路转不见君，雪上空留马行处。",
	[543]="轮台城头夜吹角，轮台城北旄头落。",
	[544]="羽书昨夜过渠黎，单于已在金山西。",
	[545]="戍楼西望烟尘黑，汉军屯在轮台北。",
	[546]="上将拥旄西出征，平明吹笛大军行。",
	[547]="四边伐鼓雪海涌，三军大呼阴山动。",
	[548]="虏塞兵气连云屯，战场白骨缠草根。",
	[549]="剑河风急云片阔，沙口石冻马蹄脱。",
	[550]="亚相勤王甘苦辛，誓将报主静边尘。",
	[551]="古来青史谁不见，今见功名胜古人。",
	[552]="弃我去者，昨日之日不可留；",
	[553]="乱我心者，今日之日多烦忧。",
	[554]="长风万里送秋雁，对此可以酣高楼。",
	[555]="蓬莱文章建安骨，中间小谢又清发。",
	[556]="俱怀逸兴壮思飞，欲上青天揽明月。",
	[557]="抽刀断水水更流，举杯消愁愁更愁。",
	[558]="人生在世不称意，明朝散发弄扁舟。",
	[559]="风吹柳花满店香，吴姬压酒唤客尝。",
	[560]="金陵子弟来相送，欲行不行各尽觞。",
	[561]="请君试问东流水，别意与之谁短长。",
	[562]="海客谈瀛洲，烟涛微茫信难求；",
	[563]="越人语天姥，云霞明灭或可睹。",
	[564]="天姥连天向天横，势拔五岳掩赤城。",
	[565]="天台四万八千丈，对此欲倒东南倾。",
	[566]="我欲因之梦吴越，一夜飞度镜湖月。",
	[567]="湖月照我影，送我至剡溪。",
	[568]="谢公宿处今尚在，渌水荡漾清猿啼。",
	[569]="脚著谢公屐，身登青云梯。",
	[570]="半壁见海日，空中闻天鸡。",
	[571]="千岩万转路不定，迷花倚石忽已暝。",
	[572]="熊咆龙吟殷岩泉，栗深林兮惊层巅。",
	[573]="云青青兮欲雨，水澹澹兮生烟。",
	[574]="列缺霹雳，丘峦崩摧。",
	[575]="洞天石扉，訇然中开。",
	[576]="青冥浩荡不见底，日月照耀金银台。?",
	[577]="霓为衣兮风为马，云之君兮纷纷而来下。",
	[578]="虎鼓瑟兮鸾回车，仙之人兮列如麻。",
	[579]="忽魂悸以魄动，恍惊起而长嗟。",
	[580]="惟觉时之枕席，失向来之烟霞。",
	[581]="世间行乐亦如此，古来万事东流水。",
	[582]="别君去兮何时还？且放白鹿青崖间。须行即骑访名山。",
	[583]="安能摧眉折腰事权贵，使我不得开心颜!",
	[584]="我本楚狂人，凤歌笑孔丘。手持绿玉杖，朝别黄鹤楼。",
	[585]="五岳寻仙不辞远，一生好入名山游。",
	[586]="庐山秀出南斗傍，屏风九叠云锦张。",
	[587]="影落明湖青黛光，金阙前开二峰长，银河倒挂三石梁。",
	[588]="香炉瀑布遥相望，迥崖沓嶂凌苍苍。",
	[589]="翠影红霞映朝日，鸟飞不到吴天长。",
	[590]="登高壮观天地间，大江茫茫去不还。",
	[591]="黄云万里动风色，白波九道流雪山。",
	[592]="好为庐山谣，兴因庐山发。",
	[593]="闲窥石镜清我心，谢公行处苍苔没。",
	[594]="早服还丹无世情，琴心三叠道初成。",
	[595]="遥见仙人彩云里，手把芙蓉朝玉京。",
	[596]="先期汗漫九垓上，愿接卢敖游太清。",
	[597]="山寺钟鸣昼已昏，渔梁渡头争渡喧。",
	[598]="人随沙岸向江村，余亦乘舟归鹿门。",
	[599]="鹿门月照开烟树，忽到庞公栖隐处。",
	[600]="岩扉松径长寂寥，惟有幽人自来去。",
	[601]="南山截竹为觱篥，此乐本自龟兹出。",
	[602]="流传汉地曲转奇，凉州胡人为我吹。",
	[603]="傍邻闻者多叹息，远客思乡皆泪垂。",
	[604]="世人解听不解赏，长飙风中自来往。",
	[605]="枯桑老柏寒飕飗，九雏鸣凤乱啾啾。",
	[606]="龙吟虎啸一时发，万籁百泉相与秋。",
	[607]="忽然更作渔阳掺，黄云萧条白日暗。",
	[608]="变调如闻杨柳春，上林繁花照眼新。",
	[609]="岁夜高堂列明烛，美酒一杯声一曲。",
	[610]="蔡女昔造胡笳声，一弹一十有八拍。",
	[611]="胡人落泪沾边草，汉使断肠对归客。",
	[612]="古戍苍苍烽火寒，大荒沉沉飞雪白。",
	[613]="先拂商弦后角羽，四郊秋叶惊摵摵。",
	[614]="董夫子，通神明，深山窃听来妖精。",
	[615]="言迟更速皆应手，将往复旋如有情。",
	[616]="空山百鸟散还合，万里浮云阴且晴。",
	[617]="嘶酸雏雁失群夜，断绝胡儿恋母声。",
	[618]="川为静其波，鸟亦罢其鸣。",
	[619]="乌孙部落家乡远，逻娑沙尘哀怨生。",
	[620]="幽音变调忽飘洒，长风吹林雨堕瓦。",
	[621]="迸泉飒飒飞木末，野鹿呦呦走堂下。",
	[622]="长安城连东掖垣，凤凰池对青琐门。",
	[623]="高才脱略名与利，日夕望君抱琴至。",
	[624]="四月南风大麦黄，枣花未落桐叶长。",
	[625]="青山朝别暮还见，嘶马出门思旧乡。",
	[626]="陈侯立身何坦荡，虬须虎眉仍大颡。",
	[627]="腹中贮书一万卷，不肯低头在草莽。",
	[628]="东门酤酒饮我曹，心轻万事如鸿毛。",
	[629]="醉卧不知白日暮，有时空望孤云高。",
	[630]="长河浪头连天黑，津吏停舟渡不得。",
	[631]="郑国游人未及家，洛阳行子空叹息。",
	[632]="闻道故林相识多，罢官昨日今如何。",
	[633]="男儿事长征，少小幽燕客。",
	[634]="赌胜马蹄下，由来轻七尺。",
	[635]="杀人莫敢前，须如猬毛磔。",
	[636]="黄云陇底白云飞，未得报恩不能归。",
	[637]="辽东小妇年十五，惯弹琵琶解歌舞。",
	[638]="今为羌笛出塞声，使我三军泪如雨。",
	[639]="主人有酒欢今夕，请奏鸣琴广陵客。",
	[640]="月照城头乌半飞，霜凄万木风入衣。",
	[641]="铜炉华烛烛增辉，初弹渌水后楚妃。",
	[642]="一声已动物皆静，四座无言星欲稀。",
	[643]="清淮奉使千馀里，敢告云山从此始。",
	[644]="前不见古人，后不见来者。",
	[645]="念天地之悠悠，独怆然而涕下。",
	[646]="少年红粉共风流，锦帐春宵恋不休。",
	[647]="兴魄罔知来宾馆，狂魂疑似入仙舟。",
	[648]="脸红暗染胭脂汗，面白误污粉黛油。",
	[649]="一倒一颠眠不得，鸡声唱破五更秋。",
	[650]="对垒牙床起战戈，两身合一暗推磨。",
	[651]="采花戏蝶吮花髓，恋蜜狂蜂隐蜜案。",
	[652]="粉汗身中干又湿，去繁枕上起犹作。",
	[653]="此缘此乐真无比，独步风流第一科。",
	[654]="梅花帐里笑相从，兴逸难当屡折冲。",
	[655]="百媚生春魂自乱，三峰前采骨都融。",
	[656]="情超楚王朝云梦，乐过冰琼晓露踪。",
	[657]="花心柔软春含露，柳骨藏庭夜宿莺。",
	[658]="倚缘天借人方便，玉露为凉六七更。",
	[659]="如此风流兴莫支，好花含笑雨淋漓。",
	[660]="心慌枕上颦西子，体倦床中洗禄儿。",
	[661]="妙外不容言语状，娇时偏向眼眉知。",
	[662]="何须再道中间事，连理枝头连理枝。",
	[663]="邸深人静快春宵，心絮纷纷骨尽消。",
	[664]="花叶曾将花蕊破，柳垂复把柳枝摇。",
	[665]="金枪鹰战二千阵，银烛光临七八娇。",
	[666]="不碍两身肌骨阻，更祛一卷去云桥。",
	[667]="仙子娇娆骨肉均，芳心共醉碧罗茵。",
	[668]="情深既肇桃源会，妙蹙西施柳叶颦。",
	[669]="洞里泉生方寸地，花间蝶恋一团春。",
	[670]="分明汝我难分辨，天赐人间吻合人。",
	[671]="花兵月阵暗交攻，久惯营城一路通。",
	[672]="白雪消时还有白，红花落尽更无红。",
	[673]="寸心独晓泉流下，万乐谁知火热中。",
	[674]="信是将军多便益，起来却是五更钟。",
	[675]="两身香汗暗沾濡，阵阵春风透玉壶。",
	[676]="乐处疏通迎刃剑，浙机流转走盘珠。",
	[677]="褥中推枕真如醉，酒后添杯争似无。",
	[678]="一点花心消灭尽，文君谩吁瘦相如。",
	[679]="暗芳驱迫兴难禁，洞口阳春浅复深。",
	[680]="绿树带风翻翠浪，红花冒雨透芳心。",
	[681]="几番枕上联双玉，寸刻闹中当万金。",
	[682]="尔我谩言贪此乐，神仙到此也生浮。",
}