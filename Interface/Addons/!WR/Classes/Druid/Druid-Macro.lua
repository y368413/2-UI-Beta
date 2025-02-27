--初始化职业宏
function WR_DruidCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/focus [spec:4] party1\n/cast [@party1target,spec:1] 月火术")	--目标 队友1
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/focus [spec:4] party2\n/cast [@party2target,spec:1] 月火术")	--目标 队友2
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/focus [spec:4] party3\n/cast [@party3target,spec:1] 月火术")	--目标 队友3
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/focus [spec:4] party4\n/cast [@party4target,spec:1] 月火术")	--目标 队友4
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/focus [spec:4] player\n/cast [@target,spec:1] 日光术\n/cast [@target,spec:2/3] 迎头痛击")	--目标 自己
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/focus [spec:4] boss2\n/cast [@mouseover,spec:1] 月火术\n/cast [@mouseover,spec:2/3] 迎头痛击")	--目标 boss2
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/focus [spec:4] boss3\n/cast [@focus,spec:1] 月火术\n/cast [@focus,spec:2/3] 迎头痛击")	--目标 boss3
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/focus [spec:4] boss4\n/cast [@mouseover,spec:1] 阳炎术\n/cast [@party1,spec:3] 愈合")	--目标 boss4
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","/focus [spec:4] pet\n/cast [@focus,spec:1] 阳炎术\n/cast [@party2,spec:3] 愈合")	--目标 宠物	--哔哩哔哩直播姬
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
	WR_CreateMacroButton("ACN0","ALT-CTRL-NUMPAD0","/cast [@party3,spec:3] 愈合")

	WR_CreateMacroButton("AN1","ALT-NUMPAD1","/focus [spec:4] raid1\n/cast [@party1target,spec:1/2/3] 安抚")	--目标 团队1
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","/focus [spec:4] raid2\n/cast [@party2target,spec:1/2/3] 安抚")	--目标 团队2
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","/focus [spec:4] raid3\n/cast [@party3target,spec:1/2/3] 安抚")	--目标 团队3
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","/focus [spec:4] raid4\n/cast [@party4target,spec:1/2/3] 安抚")	--目标 团队4
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","/focus [spec:4] raid5\n/cast [@target,spec:1/2/3] 安抚")	--目标 团队5
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","/focus [spec:4] raid6\n/cast [@mouseover,spec:1/2/3] 安抚")	--目标 团队6
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","/focus [spec:4] raid7\n/focus [spec:1/2/3] target")	--目标 团队7
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","/focus [spec:4] raid8\n/cast [@party4,spec:3] 愈合")	--目标 团队8
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","/focus [spec:4] raid9\n/cast [@target,spec:2/3] 斜掠")	--目标 团队9
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","/focus [spec:4] raid10\n/cast [@mouseover,spec:2] 斜掠")	--目标 团队10
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/focus [spec:4] raid11\n/cast [@party1,spec:1/2/3] 清除腐蚀")	--目标 团队11
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/focus [spec:4] raid12\n/cast [@party2,spec:1/2/3] 清除腐蚀")	--目标 团队12
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/focus [spec:4] raid13\n/cast [@party3,spec:1/2/3] 清除腐蚀")	--目标 团队13
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/focus [spec:4] raid14\n/cast [@party4,spec:1/2/3] 清除腐蚀")	--目标 团队14
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/focus [spec:4] raid15\n/cast [@mouseover,spec:1/2/3] 清除腐蚀")	--目标 团队15
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/focus [spec:4] raid16\n/cast [@player,spec:1/2/3] 清除腐蚀")	--目标 团队16
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/focus [spec:4] raid17\n/cast [@party1target,spec:1] 阳炎术\n/cast [@party1target,spec:2] 斜掠")	--目标 团队17
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/focus [spec:4] raid18\n/cast [@party2target,spec:1] 阳炎术\n/cast [@party2target,spec:2] 斜掠")	--目标 团队18
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/focus [spec:4] raid19\n/cast [@party3target,spec:1] 阳炎术\n/cast [@party3target,spec:2] 斜掠")	--目标 团队19
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/focus [spec:4] raid20\n/cast [@party4target,spec:1] 阳炎术\n/cast [@party4target,spec:2] 斜掠")	--目标 团队20
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [@player] 野性印记")
	WR_CreateMacroButton("CF2","CTRL-F2","/cast 甘霖")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast 树皮术")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast [spec:1] 枭兽形态\n/cast [spec:3] 沉睡者之怒\n/cast [@focus,spec:4] 铁木树皮")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast 狂暴回复")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast 万灵之召")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast 熊形态")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast 猎豹形态")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [@focus] 安抚")
	WR_CreateMacroButton("CF10","CTRL-F10","/cancelform")
	WR_CreateMacroButton("CF11","CTRL-F11","/cast 夺魂咆哮")
	WR_CreateMacroButton("CF12","CTRL-F12","/cast [@target,spec:1] 艾露恩之怒\n/cast [@target,spec:3] 粉碎\n/cast [@focus,spec:4] 迎头痛击")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","/cast [@player] 激活")
	WR_CreateMacroButton("SF2","SHIFT-F2","/cast [@focus,spec:1/2/3] 清除腐蚀\n/cast [@focus,spec:4] 自然之愈")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast 血性狂怒\n/cast 先祖召唤\n/cast 狂暴(种族特长)\n/cast [spec:1] 超凡之盟\n/cast [spec:1] 化身：艾露恩之眷\n/cast [spec:2] 狂暴\n/cast [spec:2] 化身：阿莎曼之灵\n/cast [spec:4] 化身：生命之树")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [spec:1] 艾露恩的战士\n/cast [combat,spec:2/3] 生存本能\n/cast [nocombat,spec:4] 新生")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast [spec:1] 星辰坠落\n/cast [spec:2] 猛虎之怒\n/cast [@focus,spec:4] 迅捷治愈")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast [@player,spec:1/2/3] 愈合\n/cast [@focus,spec:4] 愈合")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast [spec:1,@player] 自然之力\n/cast [spec:2] 野性狂乱\n/cast [spec:3] 摧折\n/cast [spec:4] 繁盛")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [spec:2] 野蛮挥砍\n/cast [spec:3] 明月普照\n/cast [@focus,spec:4] 野性成长")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [spec:1] 星涌术\n/cast [@focus,spec:4] 星涌术")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast [spec:2] 原始之怒\n/cast [spec:3] 铁鬃\n/cast [@focus,spec:4] 塞纳里奥结界")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast [@focus] 回春术")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast [spec:2] 激变蜂群\n/cast [@focus,spec:4] 生命绽放")
	
	WR_CreateMacroButton("CSV","CTRL-SHIFT-V","/run zhandoumoshi=0")
	WR_CreateMacroButton("CSC","CTRL-SHIFT-C","/run zhandoumoshi=1")
	WR_CreateMacroButton("CST","CTRL-SHIFT-T","/use 阿加治疗药水")
	WR_CreateMacroButton("CSF","CTRL-SHIFT-F","/use 治疗石\n/run ZLS_UseTime=GetTime()")
	WR_CreateMacroButton("CSX","CTRL-SHIFT-X","")
	WR_CreateMacroButton("CSZ","CTRL-SHIFT-Z","")
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/cast [@target,spec:1] 阳炎术\n/cast [@focus,spec:4] 阳炎术")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast [@target,spec:1/2/3] 月火术\n/cast [@focus,spec:4] 月火术")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [@target,spec:1] 愤怒\n/cast [@focus,spec:4] 愤怒")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast [spec:1] 星火术\n/cast [@focus,spec:4] 星火术")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","/cast [@focus,spec:4] 斜掠")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast [@target,spec:2] 撕碎\n/cast [@focus,spec:4] 撕碎")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","/cast [@target,spec:1] 星辰耀斑\n/cast [@target,spec:2/3] 割裂\n/cast [@focus,spec:4] 割裂")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","/stopcasting")
	WR_CreateMacroButton("CSU","CTRL-SHIFT-U","/cast [@target,spec:2] 凶猛撕咬\n/cast [@focus,spec:4] 凶猛撕咬")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","/cast 痛击")
	WR_CreateMacroButton("CSB","CTRL-SHIFT-B","/cast 横扫")
	WR_CreateMacroButton("CSY","CTRL-SHIFT-Y","/cast [spec:3] 裂伤\n/cast [@player,spec:4] 百花齐放")
	WR_CreateMacroButton("CSG","CTRL-SHIFT-G","/cast [spec:4] 自然迅捷\n/cast [@mouseover,help,dead] 复生\n/cast [@focus,exists,help,nodead,spec:4] 愈合")
	
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
	
	WR_CreateMacroButton("ASF1","ALT-SHIFT-F1","/cast [spec:1/2/4] 影遁")
	WR_CreateMacroButton("ASF2","ALT-SHIFT-F2","/cast 野性之心")
	WR_CreateMacroButton("ASF3","ALT-SHIFT-F3","/cast [@mouseover] 休眠")
	WR_CreateMacroButton("ASF5","ALT-SHIFT-F5","/cast 重殴")
	WR_CreateMacroButton("ASF6","ALT-SHIFT-F6","/cast 自然的守护")
	WR_CreateMacroButton("ASF7","ALT-SHIFT-F7","/cast 潜行")
	WR_CreateMacroButton("ASF8","ALT-SHIFT-F8","")
	WR_CreateMacroButton("ASF9","ALT-SHIFT-F9","/cast [@party1target,spec:2/3] 迎头痛击")
	WR_CreateMacroButton("ASF10","ALT-SHIFT-F10","/cast [@party2target,spec:2/3] 迎头痛击")	--Nvidia内覆盖
	WR_CreateMacroButton("ASF11","ALT-SHIFT-F11","/cast [@party3target,spec:2/3] 迎头痛击")	--网吧问题
	WR_CreateMacroButton("ASF12","ALT-SHIFT-F12","/cast [@party4target,spec:2/3] 迎头痛击")
	
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
	WR_CreateMacroButton("F8","F8","/cast [@focus] 林莽卫士")
	WR_CreateMacroButton("F9","F9","")
	WR_CreateMacroButton("F10","F10","/use 13")
	WR_CreateMacroButton("F11","F11","/use 14")
	WR_CreateMacroButton("F12","F12","")
	
	if WR_CreateButtonInfo == true then
		print("|cff00ff00----------------------------------------")
		print(WR_CreateMacroButtonIsOK)
		--print("当前职业：|cff00adf0德鲁伊")
		print("|cff00ff00----------------------------------------")
	end
	
end

if UnitClassBase("player")=="DRUID" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_DruidCreateButton() --初始化
end
