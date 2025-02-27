--初始化职业宏
function WR_PriestCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/focus party1")	--目标 队友1
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/focus party2")	--目标 队友2
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/focus party3")	--目标 队友3
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/focus party4")	--目标 队友4
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/focus player")	--目标 自己
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/focus boss2")	--目标 boss2
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/focus boss3")	--目标 boss3
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/focus boss4")	--目标 boss4
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","/focus pet")	--目标 宠物	--哔哩哔哩直播姬
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

	WR_CreateMacroButton("AN1","ALT-NUMPAD1","/focus raid1")	--目标 团队1
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","/focus raid2")	--目标 团队2
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","/focus raid3")	--目标 团队3
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","/focus raid4")	--目标 团队4
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","/focus raid5")	--目标 团队5
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","/focus raid6")	--目标 团队6
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","/focus raid7")	--目标 团队7
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","/focus raid8")	--目标 团队8
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","/focus raid9")	--目标 团队9
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","/focus raid10")	--目标 团队10
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/focus raid11")	--目标 团队11
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/focus raid12")	--目标 团队12
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/focus raid13")	--目标 团队13
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/focus raid14")	--目标 团队14
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/focus raid15")	--目标 团队15
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/focus raid16")	--目标 团队16
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/focus raid17")	--目标 团队17
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/focus raid18")	--目标 团队18
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/focus raid19")	--目标 团队19
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/focus raid20")	--目标 团队20
	
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
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [@focus,exists,help,nodead] 真言术：命")
	WR_CreateMacroButton("CF2","CTRL-F2","/cast [spec:1,@focus,exists,help,nodead] 苦修\n/cast [spec:2,@focus,exists,help,nodead] 圣言术：静")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast [@focus,exists,help,nodead] 纯净术")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast [spec:1,@focus,exists,nodead] 真言术：耀\n/cast [spec:2,@player] 圣言术：灵")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast [@focus,exists,help,nodead] 快速治疗")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast [@focus,exists,help,nodead] 治疗术")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast [@focus,exists,help,nodead] 真言术：盾")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast [@focus,exists,help,nodead] 治疗之环")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [@focus,exists,help,nodead] 愈合祷言")
	WR_CreateMacroButton("CF10","CTRL-F10","/cast 预兆")
	WR_CreateMacroButton("CF11","CTRL-F11","")
	WR_CreateMacroButton("CF12","CTRL-F12","")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","")
	WR_CreateMacroButton("SF2","SHIFT-F2","")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast [spec:1,@target,exists,harm,nodead] 心灵震爆\n/cast [spec:2,@target,exists,harm,nodead] 圣言术：罚")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [@target,exists,harm,nodead] 暗言术：灭")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast [@target,exists,harm,nodead] 控心术")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast [@target,exists,harm,nodead] 暗言术：痛")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast [@target,exists,harm,nodead] 苦修\n/cast [@target,exists,harm,nodead] 神圣之火")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [@target,exists,harm,nodead] 惩击")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [@player] 天堂之羽")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast [@focus,exists,help,nodead] 恢复")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast [@player] 真言术：韧")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast 光晕")
	
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/stopcasting")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast 渐隐术")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [spec:1,@focus,exists,help,nodead] 痛苦压制\n/cast [spec:2,@focus,exists,help,nodead] 守护之魂")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast 绝望祷言")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","/cast [@focus,exists,help,nodead] 能量灌注")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast [nocombat] 群体复活")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","/cast [spec:1,@target,exists,harm,nodead] 虚空幽灵\n/cast [spec:2,@target,exists,harm,nodead] 暗影魔")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","/cast [@focus,exists,harm,nodead] 驱散魔法")
	WR_CreateMacroButton("CSU","CTRL-SHIFT-U","/cast 心灵尖啸")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","/cast [@focus,exists,help,nodead] 守护之魂")
	WR_CreateMacroButton("CSB","CTRL-SHIFT-B","/cast 神圣化身")
	WR_CreateMacroButton("CSY","CTRL-SHIFT-Y","/cast 神圣新星")
	WR_CreateMacroButton("CSG","CTRL-SHIFT-G","/cast 光明之泉")
	
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
	
	WR_CreateMacroButton("ACF1","ALT-CTRL-F1","")
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
	
	WR_CreateMacroButton("ACSF1","ALT-CTRL-SHIFT-F1","")
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
	WR_CreateMacroButton("F12","F12","")
	
	if WR_CreateButtonInfo == true then
		print("|cff00ff00----------------------------------------")
		print(WR_CreateMacroButtonIsOK)
		--print("当前职业：|cff00adf0牧师")
		print("|cff00ff00----------------------------------------")
	end
	
end

if UnitClassBase("player")=="PRIEST" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_PriestCreateButton() --初始化
end