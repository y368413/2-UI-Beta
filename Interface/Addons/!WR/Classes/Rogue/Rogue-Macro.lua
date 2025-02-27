--初始化职业宏
function WR_RogueCreateButton()
	WR_CreateMacroButton("CSF1","CTRL-SHIFT-F1","/cast [spec:1,@party1target] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSF2","CTRL-SHIFT-F2","/cast [spec:1,@party2target] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSF3","CTRL-SHIFT-F3","/cast [spec:1,@party3target] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSF4","CTRL-SHIFT-F4","/cast [spec:1,@party4target] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSF5","CTRL-SHIFT-F5","/cast [spec:1,@mouseover] 割裂\n/startattack [@target,harm,exists,nodead]")
	
	WR_CreateMacroButton("CSF6","CTRL-SHIFT-F6","/cast [spec:1,@focus] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CSF7","CTRL-SHIFT-F7","/cast [@mouseover] 脚踢")
	WR_CreateMacroButton("CSF8","CTRL-SHIFT-F8","/cast [@focus] 脚踢")
	
	WR_CreateMacroButton("CSF9","CTRL-SHIFT-F9","")	--目标 宠物	--哔哩哔哩直播姬
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
	WR_CreateMacroButton("ACN0","ALT-CTRL-NUMPAD0","/cancelaura [spec:1] 至黑之夜")

	WR_CreateMacroButton("AN1","ALT-NUMPAD1","")
	WR_CreateMacroButton("AN2","ALT-NUMPAD2","")
	WR_CreateMacroButton("AN3","ALT-NUMPAD3","")
	WR_CreateMacroButton("AN4","ALT-NUMPAD4","")
	WR_CreateMacroButton("AN5","ALT-NUMPAD5","")
	WR_CreateMacroButton("AN6","ALT-NUMPAD6","")
	WR_CreateMacroButton("AN7","ALT-NUMPAD7","")
	WR_CreateMacroButton("AN8","ALT-NUMPAD8","")
	WR_CreateMacroButton("AN9","ALT-NUMPAD9","")
	WR_CreateMacroButton("AN0","ALT-NUMPAD0","")
	WR_CreateMacroButton("CN1","CTRL-NUMPAD1","/cast [spec:1,@party1target] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN2","CTRL-NUMPAD2","/cast [spec:1,@party2target] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN3","CTRL-NUMPAD3","/cast [spec:1,@party3target] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN4","CTRL-NUMPAD4","/cast [spec:1,@party4target] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN5","CTRL-NUMPAD5","/cast [spec:1,@mouseover] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN6","CTRL-NUMPAD6","/cast [spec:1,@focus] 锁喉\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CN7","CTRL-NUMPAD7","/cast 萎缩药膏")
	WR_CreateMacroButton("CN8","CTRL-NUMPAD8","/cast 减速药膏")
	WR_CreateMacroButton("CN9","CTRL-NUMPAD9","/cast [spec:1] 增效药膏")
	WR_CreateMacroButton("CN0","CTRL-NUMPAD0","/cast 夺命药膏")
	
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
	
	WR_CreateMacroButton("CF1","CTRL-F1","/cast [spec:1,@target] 割裂\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF2","CTRL-F2","/cast [spec:1,@target] 锁喉\n/startattack [@target,harm,exists,nodead]")	--微软管家
	WR_CreateMacroButton("CF3","CTRL-F3","/cast [spec:1,@target] 毁伤\n/startattack [@target,harm,exists,nodead]")
	WR_CreateMacroButton("CF4","CTRL-F4","/cast 潜行")
	WR_CreateMacroButton("CF5","CTRL-F5","/cast 切割")
	WR_CreateMacroButton("CF6","CTRL-F6","/cast [@target] 申斥回响")
	WR_CreateMacroButton("CF7","CTRL-F7","/cast [spec:1,@target] 刀扇")
	WR_CreateMacroButton("CF8","CTRL-F8","/cast [spec:1,@target] 猩红风暴")
	WR_CreateMacroButton("CF9","CTRL-F9","/cast [spec:1,@target] 毒伤")
	WR_CreateMacroButton("CF10","CTRL-F10","/cast [spec:1,@target] 死亡印记")
	WR_CreateMacroButton("CF11","CTRL-F11","/cast 血性狂怒\n/cast 先祖召唤\n/cast 狂暴(种族特长)\n/cast [spec:1,@target] 君王之灾")
	WR_CreateMacroButton("CF12","CTRL-F12","/cast 血性狂怒\n/cast 先祖召唤\n/cast 狂暴(种族特长)\n/cast [spec:1,@target] 菊花茶\n/cast [spec:1,@target] 君王之灾")	--网吧问题
	
	WR_CreateMacroButton("SF1","SHIFT-F1","/cast [@party1] 嫁祸诀窍")
	WR_CreateMacroButton("SF2","SHIFT-F2","/cast [@party2] 嫁祸诀窍")
	WR_CreateMacroButton("SF3","SHIFT-F3","/cast [@party3] 嫁祸诀窍")
	WR_CreateMacroButton("SF4","SHIFT-F4","/cast [@party4] 嫁祸诀窍")
	WR_CreateMacroButton("SF5","SHIFT-F5","/cast [@focus] 嫁祸诀窍")
	WR_CreateMacroButton("SF6","SHIFT-F6","/cast [spec:1,@target] 毒刃")
	WR_CreateMacroButton("SF7","SHIFT-F7","/cast [@target] 伏击")
	WR_CreateMacroButton("SF8","SHIFT-F8","/cast [@target] 脚踢")
	WR_CreateMacroButton("SF9","SHIFT-F9","/cast [@target] 肾击")	--网吧问题
	WR_CreateMacroButton("SF10","SHIFT-F10","/cast 消失")
	WR_CreateMacroButton("SF11","SHIFT-F11","/cast 猩红之瓶")	--网吧问题
	WR_CreateMacroButton("SF12","SHIFT-F12","/cast 佯攻")
	
	WR_CreateMacroButton("CSP","CTRL-SHIFT-P","/cast [@party1target] 脚踢")
	WR_CreateMacroButton("CSL","CTRL-SHIFT-L","/cast [@party2target] 脚踢")
	WR_CreateMacroButton("CSO","CTRL-SHIFT-O","/cast [@party3target] 脚踢")
	WR_CreateMacroButton("CSK","CTRL-SHIFT-K","/cast [@party4target] 脚踢")
	WR_CreateMacroButton("CSM","CTRL-SHIFT-M","/cast [@mouseover] 肾击")
	WR_CreateMacroButton("CSI","CTRL-SHIFT-I","/cast [@focus] 肾击")
	WR_CreateMacroButton("CSJ","CTRL-SHIFT-J","/cast [@party1target] 肾击")
	WR_CreateMacroButton("CSN","CTRL-SHIFT-N","/cast [@party2target] 肾击")
	WR_CreateMacroButton("CSU","CTRL-SHIFT-U","/cast [@party3target] 肾击")
	WR_CreateMacroButton("CSH","CTRL-SHIFT-H","/cast [@party4target] 肾击")
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
		--print("当前职业：|cff00adf0盗贼")
		print("|cff00ff00----------------------------------------")
	end
	
end

if UnitClassBase("player")=="ROGUE" and NotAffectingCombat() then
	WR_CreateButtonInfo=false
	WR_RogueCreateButton() --初始化
end
