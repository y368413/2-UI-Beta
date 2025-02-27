--初始化职业宏
function WR_ShamanCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/focus [spec:3] party1\n/cast [@party1target,spec:1/2] 风剪")	--目标 队友1
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/focus [spec:3] party2\n/cast [@party2target,spec:1/2] 风剪")	--目标 队友2
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/focus [spec:3] party3\n/cast [@party3target,spec:1/2] 风剪")	--目标 队友3
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/focus [spec:3] party4\n/cast [@party4target,spec:1/2] 风剪")	--目标 队友4
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/focus [spec:3] player\n/cast [@mouseover,spec:1/2] 风剪")	--目标 自己
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/focus [spec:3] boss2\n/cast [@target,spec:1/2] 风剪\n/startattack [@target,harm,exists,nodead]")	--目标 boss2
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/focus [spec:3] boss3\n/cast [@target,spec:2] 风暴打击\n/startattack [@target,harm,exists,nodead]")	--目标 boss3
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/focus [spec:3] boss4\n/cast [@mouseover,spec:2] 风暴打击")	--目标 boss4
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","/focus [spec:3] pet")	--目标 宠物	--哔哩哔哩直播姬
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
	WR_CreateMacroButton("ACN0","ALT-CTRL-NUMPAD0","/cast [@player,spec:1/2] 治疗之涌")
	
	WR_CreateMacroButton("AN1","ALT-NUMPAD1","/focus [spec:3] raid1\n/cast [@party1target,spec:1/2] 净化术")	--目标 团队1
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","/focus [spec:3] raid2\n/cast [@party2target,spec:1/2] 净化术")	--目标 团队2
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","/focus [spec:3] raid3\n/cast [@party3target,spec:1/2] 净化术")	--目标 团队3
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","/focus [spec:3] raid4\n/cast [@party4target,spec:1/2] 净化术")	--目标 团队4
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","/focus [spec:3] raid5\n/cast [@target,spec:1/2] 净化术\n/startattack [@target,harm,exists,nodead]")	--目标 团队5
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","/focus [spec:3] raid6\n/cast [@mouseover,spec:1/2] 净化术")	--目标 团队6
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","/focus [spec:3] raid7\n/cast [@party1target,spec:2] 熔岩猛击")	--目标 团队7
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","/focus [spec:3] raid8\n/cast [@party2target,spec:2] 熔岩猛击")	--目标 团队8
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","/focus [spec:3] raid9\n/cast [@party3target,spec:2] 熔岩猛击")	--目标 团队9
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","/focus [spec:3] raid10\n/cast [@party4target,spec:2] 熔岩猛击")	--目标 团队10
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/focus [spec:3] raid11\n/cast [@party1,spec:1/2] 净化灵魂")	--目标 团队11
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/focus [spec:3] raid12\n/cast [@party2,spec:1/2] 净化灵魂")	--目标 团队12
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/focus [spec:3] raid13\n/cast [@party3,spec:1/2] 净化灵魂")	--目标 团队13
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/focus [spec:3] raid14\n/cast [@party4,spec:1/2] 净化灵魂")	--目标 团队14
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/focus [spec:3] raid15\n/cast [@mouseover,spec:1/2] 净化灵魂")	--目标 团队15
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/focus [spec:3] raid16\n/cast [@player,spec:1/2] 净化灵魂")	--目标 团队16
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/focus [spec:3] raid17\n/cast [@party1target,spec:2] 风暴打击")	--目标 团队17
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/focus [spec:3] raid18\n/cast [@party2target,spec:2] 风暴打击")	--目标 团队18
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/focus [spec:3] raid19\n/cast [@party3target,spec:2] 风暴打击")	--目标 团队19
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/focus [spec:3] raid20\n/cast [@party4target,spec:2] 风暴打击")	--目标 团队20
	
	WR_CreateMacroButton("CSV","CTRL-SHIFT-V","/run zhandoumoshi=0")
	WR_CreateMacroButton("CSC","CTRL-SHIFT-C","/run zhandoumoshi=1")
	WR_CreateMacroButton("CST","CTRL-SHIFT-T","/use 阿加治疗药水")
	WR_CreateMacroButton("CSF","CTRL-SHIFT-F","/use 治疗石\n/run ZLS_UseTime=GetTime()")
	WR_CreateMacroButton("CSX","CTRL-SHIFT-X","/stopcasting")
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
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [@target,spec:2] 野性狼魂\n/cast [spec:3] 治疗之潮图腾\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF2","CTRL-F2","/cast [@target,spec:1/2] 烈焰震击\n/cast [@focus,spec:3] 激流\n/startattack [@target,harm,exists,nodead]")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast [@target,spec:2] 熔岩猛击\n/cast [@focus,spec:3] 治疗波\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast [@target,spec:2] 闪电箭\n/cast [@focus,spec:3] 闪电箭\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast [@target,spec:2] 始源之潮\n/cast [@focus,spec:3] 始源之潮\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast [@player,spec:2] 涌动图腾\n/cast [@player,spec:3] 治疗之雨\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast [spec:2] 火焰新星\n/cast [spec:3] 自然迅捷\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast [spec:2/3] 治疗之泉图腾\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [@target,spec:2] 毁灭闪电\n/cast [@focus,spec:3] 熔岩爆裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF10","CTRL-F10","/cast [known:血性狂怒] 血性狂怒\n/cast [known:先祖召唤] 先祖召唤\n/cast [known:狂暴] 狂暴\n/cast [@target,spec:2] 升腾\n/cast [spec:3] 升腾\n/cast [spec:3] 先祖指引\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF11","CTRL-F11","/cast [@target,spec:2] 闪电链\n/cast [@focus,spec:3] 闪电链\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF12","CTRL-F12","/cast [@mouseover] 闪电箭")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","/cast [@focus] 风剪")
	WR_CreateMacroButton("SF2","SHIFT-F2","/cast [@focus] 净化术")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast [@mouseover,spec:1/2] 烈焰震击\n/cast [@focus,spec:3] 烈焰震击")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [@party1target,spec:1/2] 烈焰震击\n/cast [@focus,spec:3] 生命释放")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast [@party2target,spec:1/2] 烈焰震击\n/cast [spec:3] 先祖视界")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast [@party3target,spec:1/2] 烈焰震击\n/cast [spec:3] 石壁图腾")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast [@party4target,spec:1/2] 烈焰震击\n/cast [@focus,spec:3] 治疗之涌")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [@party1target,spec:1/2] 闪电箭\n/cast [@focus,spec:3] 净化灵魂")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [@party2target,spec:1/2] 闪电箭\n/cast [spec:3] 唤潮者的护卫")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast [@party3target,spec:1/2] 闪电箭\n/cast [@focus,spec:3] 治疗链")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast [@party4target,spec:1/2] 闪电箭\n/cast [@player,spec:3] 灵魂链接图腾")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast 雷霆风暴\n/startattack [@target,harm,exists,nodead]")
	
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/cast [@target,spec:2] 元素冲击\n/cast [spec:3] 收回图腾")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast [@target,spec:2] 霜刃打击")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [@target,spec:2] 毁灭之风")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast 星界转移")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast 清毒图腾")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","/cast [@target,spec:2] 裂地术")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","")
	WR_CreateMacroButton("CSU","CTRL-SHIFT-U","/cast 战栗图腾")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","/cast [@target,spec:2] 冰霜震击")
	WR_CreateMacroButton("CSB","CTRL-SHIFT-B","/cast 幽魂步")
	WR_CreateMacroButton("CSY","CTRL-SHIFT-Y","/cast 先祖指引")
	WR_CreateMacroButton("CSG","CTRL-SHIFT-G","")
	
	WR_CreateMacroButton("ASF1","ALT-SHIFT-F1","/cast [spec:2] 风怒武器\n/cast [spec:3] 大地生命武器")
	WR_CreateMacroButton("ASF2","ALT-SHIFT-F2","/cast [spec:2] 火舌武器")
	WR_CreateMacroButton("ASF3","ALT-SHIFT-F3","/cast [spec:2] 闪电之盾\n/cast [spec:3] 水之护盾")
	WR_CreateMacroButton("ASF5","ALT-SHIFT-F5","/cast [@player,spec:2] 大地之盾\n/cast [@focus,spec:3] 大地之盾")
	WR_CreateMacroButton("ASF6","ALT-SHIFT-F6","/cast 土元素\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("ASF7","ALT-SHIFT-F7","/cast [@player] 天怒")
	WR_CreateMacroButton("ASF8","ALT-SHIFT-F8","/cast [@mouseover,spec:2] 熔岩猛击")
	WR_CreateMacroButton("ASF9","ALT-SHIFT-F9","/cast [@mouseover] 闪电链")
	WR_CreateMacroButton("ASF10","ALT-SHIFT-F10","")	--Nvidia内覆盖
	WR_CreateMacroButton("ASF11","ALT-SHIFT-F11","/cast [@party1target] 闪电链")	--网吧问题
	WR_CreateMacroButton("ASF12","ALT-SHIFT-F12","/cast [@party2target] 闪电链")
	
	WR_CreateMacroButton("ACF1","ALT-CTRL-F1","/cast 幽魂之狼")
	WR_CreateMacroButton("ACF2","ALT-CTRL-F2","/use [@player] 13")
	WR_CreateMacroButton("ACF3","ALT-CTRL-F3","/use [@party1] 13")
	WR_CreateMacroButton("ACF5","ALT-CTRL-F5","/use [@party2] 13")
	WR_CreateMacroButton("ACF6","ALT-CTRL-F6","/use [@party3] 13")
	WR_CreateMacroButton("ACF7","ALT-CTRL-F7","/use [@party4] 13")
	WR_CreateMacroButton("ACF8","ALT-CTRL-F8","")	--intel核心显卡的驱动程序软件
	WR_CreateMacroButton("ACF9","ALT-CTRL-F9","/cast [@party3target] 闪电链")
	WR_CreateMacroButton("ACF10","ALT-CTRL-F10","/cast [@party4target] 闪电链")
	WR_CreateMacroButton("ACF11","ALT-CTRL-F11","")	--intel核心显卡的驱动程序软件
	WR_CreateMacroButton("ACF12","ALT-CTRL-F12","")	--intel核心显卡的驱动程序软件
	
	WR_CreateMacroButton("ACSF1","ALT-CTRL-SHIFT-F1","/cast [@target] 熔岩爆裂")
	WR_CreateMacroButton("ACSF2","ALT-CTRL-SHIFT-F2","/use [@player] 14")
	WR_CreateMacroButton("ACSF3","ALT-CTRL-SHIFT-F3","/use [@party1] 14")
	WR_CreateMacroButton("ACSF5","ALT-CTRL-SHIFT-F5","/use [@party2] 14")
	WR_CreateMacroButton("ACSF6","ALT-CTRL-SHIFT-F6","/use [@party3] 14")
	WR_CreateMacroButton("ACSF7","ALT-CTRL-SHIFT-F7","/use [@party4] 14")
	WR_CreateMacroButton("ACSF8","ALT-CTRL-SHIFT-F8","")
	WR_CreateMacroButton("ACSF9","ALT-CTRL-SHIFT-F9","/cast [@party1target,spec:2] 始源之潮")
	WR_CreateMacroButton("ACSF10","ALT-CTRL-SHIFT-F10","/cast [@party2target,spec:2] 始源之潮")
	WR_CreateMacroButton("ACSF11","ALT-CTRL-SHIFT-F11","/cast [@party3target,spec:2] 始源之潮")	--网吧问题
	WR_CreateMacroButton("ACSF12","ALT-CTRL-SHIFT-F12","/cast [@party4target,spec:2] 始源之潮")
	
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
		--print("当前职业：|cff00adf0萨满")
		print("|cff00ff00----------------------------------------")
	end
	
end

if UnitClassBase("player")=="SHAMAN" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_ShamanCreateButton() --初始化
end