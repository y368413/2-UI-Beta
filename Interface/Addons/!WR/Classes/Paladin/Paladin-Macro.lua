--初始化职业宏
function WR_PaladinCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/focus [spec:1] party1\n/cast [@party1target,spec:2/3] 责难")	--目标 队友1
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/focus [spec:1] party2\n/cast [@party2target,spec:2/3] 责难")	--目标 队友2
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/focus [spec:1] party3\n/cast [@party3target,spec:2/3] 责难")	--目标 队友3
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/focus [spec:1] party4\n/cast [@party4target,spec:2/3] 责难")	--目标 队友4
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/focus [spec:1] player\n/cast [@mouseover,spec:2/3] 责难")	--目标 自己
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/focus [spec:1] boss2\n/cast [@focus,spec:2/3] 责难")	--目标 boss2
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/focus [spec:1] boss3\n/cast [@mouseover,spec:2/3] 制裁之锤")	--目标 boss3
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/focus [spec:1] boss4\n/cast [@focus,spec:2/3] 制裁之锤")	--目标 boss4
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","/focus [spec:1] pet\n/cast [spec:3] 专注光环")	--目标 宠物	--哔哩哔哩直播姬
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
	WR_CreateMacroButton("ACN0","ALT-CTRL-NUMPAD0","/cast 虔诚光环")

	WR_CreateMacroButton("AN1","ALT-NUMPAD1","/focus [spec:1] raid1\n/cast [@party1,spec:2/3] 自由祝福")	--目标 团队1
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","/focus [spec:1] raid2\n/cast [@party2,spec:2/3] 自由祝福")	--目标 团队2
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","/focus [spec:1] raid3\n/cast [@party3,spec:2/3] 自由祝福")	--目标 团队3
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","/focus [spec:1] raid4\n/cast [@party4,spec:2/3] 自由祝福")	--目标 团队4
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","/focus [spec:1] raid5\n/cast [@party1target,spec:2/3] 制裁之锤")	--目标 团队5
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","/focus [spec:1] raid6\n/cast [@party2target,spec:2/3] 制裁之锤")	--目标 团队6
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","/focus [spec:1] raid7\n/cast [@party3target,spec:2/3] 制裁之锤")	--目标 团队7
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","/focus [spec:1] raid8\n/cast [@party4target,spec:2/3] 制裁之锤")	--目标 团队8
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","/focus [spec:1] raid9\n/cast [@party1,spec:2/3] 清毒术")	--目标 团队9
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","/focus [spec:1] raid10\n/cast [@party2,spec:2/3] 清毒术")	--目标 团队10
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/focus [spec:1] raid11\n/cast [@party1,spec:2/3] 圣疗术")	--目标 团队11
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/focus [spec:1] raid12\n/cast [@party2,spec:2/3] 圣疗术")	--目标 团队12
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/focus [spec:1] raid13\n/cast [@party3,spec:2/3] 圣疗术")	--目标 团队13
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/focus [spec:1] raid14\n/cast [@party4,spec:2/3] 圣疗术")	--目标 团队14
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/focus [spec:1] raid15\n/cast [@party1,spec:2/3] 牺牲祝福")	--目标 团队15
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/focus [spec:1] raid16\n/cast [@party2,spec:2/3] 牺牲祝福")	--目标 团队16
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/focus [spec:1] raid17\n/cast [@party3,spec:2/3] 牺牲祝福")	--目标 团队17
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/focus [spec:1] raid18\n/cast [@party4,spec:2/3] 牺牲祝福")	--目标 团队18
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/focus [spec:1] raid19\n/cast [@party3,spec:2/3] 清毒术")	--目标 团队19
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/focus [spec:1] raid20\n/cast [@party4,spec:2/3] 清毒术")	--目标 团队20
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [@focus,spec:1] 神圣震击\n/cast [@party1,spec:2] 破咒祝福\n/cast [spec:3] 血性狂怒\n/cast [spec:3] 先祖召唤\n/cast [spec:3] 狂暴\n/cast [@target,spec:3] 灰烬觉醒\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF2","CTRL-F2","")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast [@target,harm,exists,nodead] 圣洁鸣钟\n/cast [@player] 圣洁鸣钟\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast [@focus,harm,exists,nodead,spec:1] 审判\n/cast [@target,harm,exists,nodead,spec:2/3] 审判\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast [spec:1] 提尔的拯救\n/cast [@party2,spec:2] 破咒祝福\n/cast [@target,spec:3] 神圣风暴\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast [@target] 正义盾击")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast [spec:1] 黎明之光\n/cast [spec:2] 提尔之眼\n/cast [@target,spec:3] 公正之剑\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast [@focus,harm,exists,nodead,spec:1] 愤怒之锤\n/cast [@target,harm,exists,nodead,spec:2/3] 愤怒之锤\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [@focus,harm,exists,nodead,spec:1] 十字军打击\n/cast [spec:2] 十字军打击\n/cast [@target,harm,exists,nodead,spec:3] 十字军打击\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF10","CTRL-F10","/cast [@focus,spec:1] 圣疗术\n/cast [@player,spec:2/3] 圣疗术")
	WR_CreateMacroButton("CF11","CTRL-F11","/cast 圣盾术")
	WR_CreateMacroButton("CF12","CTRL-F12","/cast [@focus,spec:1] 荣耀圣令\n/cast [@player,spec:2/3] 荣耀圣令")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","/cast [@focus,spec:1] 责难\n/cast [@target,spec:2/3] 责难")
	WR_CreateMacroButton("SF2","SHIFT-F2","/cast [@focus,spec:1] 清洁术\n/cast [@player,spec:2/3] 清毒术")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast [@focus,spec:1] 自由祝福\n/cast [@player,spec:2/3] 自由祝福")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [@focus,spec:1] 制裁之锤\n/cast [@target,spec:2/3] 制裁之锤")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast 盲目之光")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast [@focus,spec:1] 信仰屏障\n/cast [spec:2] 远古列王守卫\n/cast [@target,spec:3] 圣殿骑士的裁决\n/cast [@target,spec:3] 最终审判\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast [@mouseover] 代祷")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [@focus,spec:1] 牺牲祝福\n/cast [@party3,spec:2] 破咒祝福")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [@player,spec:1] 美德道标\n/cast [spec:2] 炽热防御者\n/cast [spec:3] 复仇之盾")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast [spec:1/3] 圣佑术\n/cast [@target,spec:2] 复仇者之盾")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast 血性狂怒\n/cast 先祖召唤\n/cast 狂暴\n/cast 复仇之怒\n/startattack [@target,harm,exists,nodead]")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast [spec:1] 光环掌握\n/cast [spec:2] 戒卫\n/cast [spec:3] 处决宣判\n/cast [@player,spec:3] 最终清算\n/startattack [@target,harm,exists,nodead]")
	
	WR_CreateMacroButton("CSV","CTRL-SHIFT-V","/run zhandoumoshi=0")
	WR_CreateMacroButton("CSC","CTRL-SHIFT-C","/run zhandoumoshi=1")
	WR_CreateMacroButton("CST","CTRL-SHIFT-T","/use 阿加治疗药水")
	WR_CreateMacroButton("CSF","CTRL-SHIFT-F","/use 治疗石\n/run ZLS_UseTime=GetTime()")
	WR_CreateMacroButton("CSX","CTRL-SHIFT-X","")
	WR_CreateMacroButton("CSZ","CTRL-SHIFT-Z","")
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/cast [@none,spec:1/2] 圣言祭礼\n/use 16")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast [@player] 神圣壁垒")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [spec:2] 圣光壁垒\n/cast [spec:3] 神圣之锤")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast [@player,spec:1] 仲夏祝福\n/cast [@party4,spec:2] 破咒祝福")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","/cast 奉献")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast [@focus,spec:1] 神圣棱镜\n/cast [@mouseover,spec:2] 复仇者之盾")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","/cast [spec:1] 宽恕\n/cast [spec:2] 光荣时刻")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","/cast [@focus] 圣光闪现")
	--WR_CreateMacroButton("CSU","CTRL-SHIFT-U","/cancelaura 圣光之锤")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","")
	WR_CreateMacroButton("CSB","CTRL-SHIFT-B","")
	WR_CreateMacroButton("CSY","CTRL-SHIFT-Y","")
	WR_CreateMacroButton("CSG","CTRL-SHIFT-G","")
	
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
	
	WR_CreateMacroButton("ASF1","ALT-SHIFT-F1","/cast [@party1,spec:1] 圣光道标\n/cast [@party1target,spec:2] 复仇者之盾\n/cast [@party1,spec:3] 荣耀圣令")
	WR_CreateMacroButton("ASF2","ALT-SHIFT-F2","/cast [@party2,spec:1] 圣光道标\n/cast [@party2target,spec:2] 复仇者之盾\n/cast [@party2,spec:3] 荣耀圣令")
	WR_CreateMacroButton("ASF3","ALT-SHIFT-F3","/cast [@party3,spec:1] 圣光道标\n/cast [@party3target,spec:2] 复仇者之盾\n/cast [@party3,spec:3] 荣耀圣令")
	WR_CreateMacroButton("ASF5","ALT-SHIFT-F5","/cast [@party4,spec:1] 圣光道标\n/cast [@party4target,spec:2] 复仇者之盾\n/cast [@party4,spec:3] 荣耀圣令")
	WR_CreateMacroButton("ASF6","ALT-SHIFT-F6","/cast [@party1,spec:1] 信仰道标\n/cast [@player,spec:2] 破咒祝福")
	WR_CreateMacroButton("ASF7","ALT-SHIFT-F7","/cast [@party2,spec:1] 信仰道标")
	WR_CreateMacroButton("ASF8","ALT-SHIFT-F8","/cast [@party3,spec:1] 信仰道标")
	WR_CreateMacroButton("ASF9","ALT-SHIFT-F9","/cast [@party4,spec:1] 信仰道标")
	WR_CreateMacroButton("ASF10","ALT-SHIFT-F10","")	--Nvidia内覆盖
	WR_CreateMacroButton("ASF11","ALT-SHIFT-F11","/cast [@player,spec:1] 圣光道标\n/cast [@mouseover,spec:2/3] 清毒术")	--网吧问题
	WR_CreateMacroButton("ASF12","ALT-SHIFT-F12","/cast [@player,spec:1] 信仰道标\n/cast [@focus,spec:2] 复仇者之盾")
	
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
		--print("当前职业：|cff00adf0圣骑士")
		print("|cff00ff00----------------------------------------")
	end
	
end

if UnitClassBase("player")=="PALADIN" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_PaladinCreateButton() --初始化
end
