--初始化职业宏
function WR_WarriorCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/cast [@party1target] 风暴之锤")	--目标 队友1
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/cast [@party2target] 风暴之锤")	--目标 队友2
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/cast [@party3target] 风暴之锤")	--目标 队友3
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/cast [@party4target] 风暴之锤")	--目标 队友4
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/cast [@mouseover] 风暴之锤")	--目标 自己
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/cast [@focus] 风暴之锤")	--目标 boss2
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/cast [@mouseover] 斩杀")	--目标 boss3
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/cast [spec:3] 盾牌猛击")	--目标 boss4
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","/cast 雷霆一击")	--目标 宠物	--哔哩哔哩直播姬
	WR_CreateMacroButton("CSF10","CTRL-SHIFT-F10","/targetenemy")	--目标 搜索	--哔哩哔哩直播姬
	WR_CreateMacroButton("CSF11","CTRL-SHIFT-F11","/focus target")	--目标 焦点
	WR_CreateMacroButton("CSF12","CTRL-SHIFT-F12","/focus mouseover")	--目标 指向
	
	WR_CreateMacroButton("ACN1","ALT-CTRL-NUMPAD1","/focus party1target")
	WR_CreateMacroButton("ACN2","ALT-CTRL-NUMPAD2","/focus party2target")
	WR_CreateMacroButton("ACN3","ALT-CTRL-NUMPAD3","/focus party3target")
	WR_CreateMacroButton("ACN4","ALT-CTRL-NUMPAD4","/focus party4target")
	
	WR_CreateMacroButton("ACN5","ALT-CTRL-NUMPAD5","/target party1target")
	WR_CreateMacroButton("ACN6","ALT-CTRL-NUMPAD6","/target party2target")
	WR_CreateMacroButton("ACN7","ALT-CTRL-NUMPAD7","/target party3target")
	WR_CreateMacroButton("ACN8","ALT-CTRL-NUMPAD8","/target party4target")
	WR_CreateMacroButton("ACN9","ALT-CTRL-NUMPAD9","/target pettarget")
	WR_CreateMacroButton("ACN0","ALT-CTRL-NUMPAD0","")

	WR_CreateMacroButton("AN1","ALT-NUMPAD1","/cast [@party1target] 破裂投掷")	--目标 团队1
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","/cast [@party2target] 破裂投掷")	--目标 团队2
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","/cast [@party3target] 破裂投掷")	--目标 团队3
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","/cast [@party4target] 破裂投掷")	--目标 团队4
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","/cast [@mouseover] 破裂投掷")	--目标 团队5
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","")	--目标 团队6
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","")	--目标 团队7
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","")	--目标 团队8
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","")	--目标 团队9
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","")	--目标 团队10
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/cast [@party1target] 拳击")	--目标 团队11
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/cast [@party2target] 拳击")	--目标 团队12
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/cast [@party3target] 拳击")	--目标 团队13
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/cast [@party4target] 拳击")	--目标 团队14
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/cast [@mouseover] 拳击")	--目标 团队15
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/cast [@focus] 拳击")	--目标 团队16
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/cast [@party1target] 斩杀")	--目标 团队17
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/cast [@party2target] 斩杀")	--目标 团队18
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/cast [@party3target] 斩杀")	--目标 团队19
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/cast [@party4target] 斩杀")	--目标 团队20
	
	WR_CreateMacroButton("CSV","CTRL-SHIFT-V","/run zhandoumoshi=0")
	WR_CreateMacroButton("CSC","CTRL-SHIFT-C","/run zhandoumoshi=1")
	WR_CreateMacroButton("CST","CTRL-SHIFT-T","/use 阿加治疗药水")
	WR_CreateMacroButton("CSF","CTRL-SHIFT-F","/use 治疗石\n/run ZLS_UseTime=GetTime()")
	WR_CreateMacroButton("CSX","CTRL-SHIFT-X","")
	WR_CreateMacroButton("CSZ","CTRL-SHIFT-Z","")
	
	WR_CreateMacroButton("AF1","ALT-F1","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF2","ALT-F2","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF3","ALT-F3","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF5","ALT-F5","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF6","ALT-F6","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF7","ALT-F7","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF8","ALT-F8","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF9","ALT-F9","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF10","ALT-F10","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF11","ALT-F11","")	--Nvidia内覆盖
	WR_CreateMacroButton("AF12","ALT-F12","")	--Nvidia内覆盖
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [@player] 破坏者")
	WR_CreateMacroButton("CF2","CTRL-F2","/cast [@target] 破裂投掷\n/startattack [@target,harm,exists,nodead]")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast [@target] 英勇投掷\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast [@target] 猛击\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast [spec:2] 怒击\n/cast [spec:3] 破釜沉舟\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast [@target] 斩杀\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast [spec:2] 嗜血\n/cast [spec:3] 盾墙\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast [spec:2] 奥丁之怒\n/cast [spec:3] 盾牌格挡\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [spec:2] 暴怒\n/cast [spec:1/3] 无视苦痛\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF10","CTRL-F10","/cast 旋风斩\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF11","CTRL-F11","/cast [spec:1/2] 剑刃风暴\n/cast [spec:3] 盾牌冲锋\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF12","CTRL-F12","/cast 雷鸣之吼\n/startattack [@target,harm,exists,nodead]")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","/cast [known:血性狂怒] 血性狂怒\n/cast [known:先祖召唤] 先祖召唤\n/cast [known:狂暴] 狂暴\n/cast [spec:2] 鲁莽\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF2","SHIFT-F2","/cast 胜利在望\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast 集结呐喊\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [@target] 风暴之锤\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast 战斗怒吼")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast 破胆怒吼\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast 震荡波\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [@target] 拳击\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [spec:2] 狂暴姿态\n/cast [spec:1/3] 战斗姿态\n/startattack [@target,harm,exists,nodead]")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast 防御姿态\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast [spec:2] 狂怒回复\n/cast [spec:3] 挫志怒吼\n/startattack [@target,harm,exists,nodead]")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast 法术反射\n/startattack [@target,harm,exists,nodead]")
	
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/cast [@player] 勇士之矛")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast [spec:3] 复仇")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [spec:2] 强攻\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast [known:血性狂怒] 血性狂怒\n/cast [known:先祖召唤] 先祖召唤\n/cast [known:狂暴] 狂暴\n/cast 天神下凡\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast 狂暴之怒")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","")
	WR_CreateMacroButton("CSU","CTRL-SHIFT-U","")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","")
	WR_CreateMacroButton("CSB","CTRL-SHIFT-B","")
	WR_CreateMacroButton("CSY","CTRL-SHIFT-Y","")
	WR_CreateMacroButton("CSG","CTRL-SHIFT-G","")
	
	WR_CreateMacroButton("ASF1","ALT-SHIFT-F1","")
	WR_CreateMacroButton("ASF2","ALT-SHIFT-F2","")
	WR_CreateMacroButton("ASF3","ALT-SHIFT-F3","")
	WR_CreateMacroButton("ASF5","ALT-SHIFT-F5","")
	WR_CreateMacroButton("ASF6","ALT-SHIFT-F6","")
	WR_CreateMacroButton("ASF7","ALT-SHIFT-F7","")
	WR_CreateMacroButton("ASF8","ALT-SHIFT-F8","")
	WR_CreateMacroButton("ASF9","ALT-SHIFT-F9","")
	WR_CreateMacroButton("ASF10","ALT-SHIFT-F10","")	--Nvidia内覆盖
	WR_CreateMacroButton("ASF11","ALT-SHIFT-F11","")	--网吧问题
	WR_CreateMacroButton("ASF12","ALT-SHIFT-F12","")
	
	WR_CreateMacroButton("ACF1","ALT-CTRL-F1","/use 13")
	WR_CreateMacroButton("ACF2","ALT-CTRL-F2","/use [@player] 13")
	WR_CreateMacroButton("ACF3","ALT-CTRL-F3","/use [@party1] 13")
	WR_CreateMacroButton("ACF5","ALT-CTRL-F5","/use [@party2] 13")
	WR_CreateMacroButton("ACF6","ALT-CTRL-F6","/use [@party3] 13")
	WR_CreateMacroButton("ACF7","ALT-CTRL-F7","/use [@party4] 13")
	WR_CreateMacroButton("ACF8","ALT-CTRL-F8","")	--intel核心显卡的驱动程序软件
	WR_CreateMacroButton("ACF9","ALT-CTRL-F9","")
	WR_CreateMacroButton("ACF10","ALT-CTRL-F10","")
	WR_CreateMacroButton("ACF11","ALT-CTRL-F11","")	--intel核心显卡的驱动程序软件
	WR_CreateMacroButton("ACF12","ALT-CTRL-F12","")	--intel核心显卡的驱动程序软件
	
	WR_CreateMacroButton("ACSF1","ALT-CTRL-SHIFT-F1","/use 14")
	WR_CreateMacroButton("ACSF2","ALT-CTRL-SHIFT-F2","/use [@player] 14")
	WR_CreateMacroButton("ACSF3","ALT-CTRL-SHIFT-F3","/use [@party1] 14")
	WR_CreateMacroButton("ACSF5","ALT-CTRL-SHIFT-F5","/use [@party2] 14")
	WR_CreateMacroButton("ACSF6","ALT-CTRL-SHIFT-F6","/use [@party3] 14")
	WR_CreateMacroButton("ACSF7","ALT-CTRL-SHIFT-F7","/use [@party4] 14")
	WR_CreateMacroButton("ACSF8","ALT-CTRL-SHIFT-F8","")
	WR_CreateMacroButton("ACSF9","ALT-CTRL-SHIFT-F9","")
	WR_CreateMacroButton("ACSF10","ALT-CTRL-SHIFT-F10","")
	WR_CreateMacroButton("ACSF11","ALT-CTRL-SHIFT-F11","")	--网吧问题
	WR_CreateMacroButton("ACSF12","ALT-CTRL-SHIFT-F12","")
	
	WR_CreateMacroButton("F5","F5","")
	WR_CreateMacroButton("F6","F6","")
	WR_CreateMacroButton("F7","F7","")
	WR_CreateMacroButton("F8","F8","")
	WR_CreateMacroButton("F9","F9","")
	WR_CreateMacroButton("F10","F10","/use 13")
	WR_CreateMacroButton("F11","F11","/use 14")
	--WR_CreateMacroButton("F12","F12","")
	
	if WR_CreateButtonInfo == true then
		print("|cff00ff00----------------------------------------")
		print(WR_CreateMacroButtonIsOK)
		--print("当前职业：|cff00adf0战士")
		print("|cff00ff00----------------------------------------")
	end
	
end


if UnitClassBase("player")=="WARRIOR" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_WarriorCreateButton() --初始化
end