--初始化职业宏
function WR_EvokerCreateMacroButton()
	local MacroButton
	----------注册宏按钮
	--注册自己为目标
	MacroButton = CreateFrame("Button", "FocusPlayer", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/focus player")
	--注册鼠标指向为目标
	MacroButton = CreateFrame("Button", "FocusMouseover", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/focus mouseover")

	for i=1,5,1
	--注册BOSS1~5为目标
	do
		MacroButton = CreateFrame("Button", "FocusBoss"..i, UIParent, "SecureActionButtonTemplate");
		MacroButton:RegisterForClicks("AnyDown", "AnyUp")
		MacroButton:SetAttribute("type", "macro")
		MacroButton:SetAttribute("macrotext", "/focus ".."boss"..i)
	end
	
	for i=1,4,1
	--注册小队目标
	do
		MacroButton = CreateFrame("Button", "FocusParty"..i, UIParent, "SecureActionButtonTemplate");
		MacroButton:RegisterForClicks("AnyDown", "AnyUp")
		MacroButton:SetAttribute("type", "macro")
		MacroButton:SetAttribute("macrotext", "/focus ".."party"..i)
	end
	
	for i=1,20,1
	--注册团队目标
	do
		MacroButton = CreateFrame("Button", "FocusRaid"..i, UIParent, "SecureActionButtonTemplate");
		MacroButton:RegisterForClicks("AnyDown", "AnyUp")
		MacroButton:SetAttribute("type", "macro")
		MacroButton:SetAttribute("macrotext", "/focus ".."raid"..i)
	end
	SetBinding("CTRL-SHIFT-F1", "CLICK FocusParty1:LeftButton")
	SetBinding("CTRL-SHIFT-F2", "CLICK FocusParty2:LeftButton")
	SetBinding("CTRL-SHIFT-F3", "CLICK FocusParty3:LeftButton")
	SetBinding("CTRL-SHIFT-F4", "CLICK FocusParty4:LeftButton")
	SetBinding("CTRL-SHIFT-F5", "CLICK FocusPlayer:LeftButton")
	SetBinding("CTRL-SHIFT-F6", "CLICK FocusBoss2:LeftButton")
	SetBinding("CTRL-SHIFT-F7", "CLICK FocusBoss3:LeftButton")
	SetBinding("CTRL-SHIFT-F8", "CLICK FocusBoss4:LeftButton")
	SetBinding("CTRL-SHIFT-F11", "CLICK FocusBoss5:LeftButton")
	SetBinding("CTRL-SHIFT-F12", "CLICK FocusMouseover:LeftButton")

	SetBinding("ALT-NUMPAD1", "CLICK FocusRaid1:LeftButton")
	SetBinding("ALT-NUMPAD2", "CLICK FocusRaid2:LeftButton")
	SetBinding("ALT-NUMPAD3", "CLICK FocusRaid3:LeftButton")
	SetBinding("ALT-NUMPAD4", "CLICK FocusRaid4:LeftButton")
	SetBinding("ALT-NUMPAD5", "CLICK FocusRaid5:LeftButton")
	SetBinding("ALT-NUMPAD6", "CLICK FocusRaid6:LeftButton")
	SetBinding("ALT-NUMPAD7", "CLICK FocusRaid7:LeftButton")
	SetBinding("ALT-NUMPAD8", "CLICK FocusRaid8:LeftButton")
	SetBinding("ALT-NUMPAD9", "CLICK FocusRaid9:LeftButton")
	SetBinding("ALT-NUMPAD0", "CLICK FocusRaid10:LeftButton")
	SetBinding("CTRL-NUMPAD1", "CLICK FocusRaid11:LeftButton")
	SetBinding("CTRL-NUMPAD2", "CLICK FocusRaid12:LeftButton")
	SetBinding("CTRL-NUMPAD3", "CLICK FocusRaid13:LeftButton")
	SetBinding("CTRL-NUMPAD4", "CLICK FocusRaid14:LeftButton")
	SetBinding("CTRL-NUMPAD5", "CLICK FocusRaid15:LeftButton")
	SetBinding("CTRL-NUMPAD6", "CLICK FocusRaid16:LeftButton")
	SetBinding("CTRL-NUMPAD7", "CLICK FocusRaid17:LeftButton")
	SetBinding("CTRL-NUMPAD8", "CLICK FocusRaid18:LeftButton")
	SetBinding("CTRL-NUMPAD9", "CLICK FocusRaid19:LeftButton")
	SetBinding("CTRL-NUMPAD0", "CLICK FocusRaid20:LeftButton")


	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@player] 青铜龙的祝福")
	SetBinding("CTRL-F1", "CLICK CF1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 新生光焰")
	SetBinding("CTRL-F3", "CLICK CF3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF4", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/use 治疗石")
	SetBinding("CTRL-F4", "CLICK CF4:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/use 凋零梦境药水\n/use 梦行者治疗药水\n/use 振奋治疗药水")
	SetBinding("CTRL-F5", "CLICK CF5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 扫尾")
	SetBinding("CTRL-F6", "CLICK CF6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 黑檀之力")
	SetBinding("CTRL-F7", "CLICK CF7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@target,harm,nodead] 地壳激变")
	SetBinding("CTRL-F8", "CLICK CF8:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 火焰吐息")
	SetBinding("CTRL-F9", "CLICK CF9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@target,harm,nodead] 喷发")
	SetBinding("CTRL-F10", "CLICK CF10:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@focus,help,nodead] 先知先觉\n/cast 先知先觉")
	SetBinding("CTRL-F11", "CLICK CF11:LeftButton")
	
	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 黑龙协调")
	SetBinding("SHIFT-F1", "CLICK SF1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@target,harm,nodead] 活化烈焰")
	SetBinding("SHIFT-F2", "CLICK SF2:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@target,harm,nodead] 碧蓝打击")
	SetBinding("SHIFT-F3", "CLICK SF3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF4", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/target party1target")
	SetBinding("SHIFT-F4", "CLICK SF4:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/target party2target")
	SetBinding("SHIFT-F5", "CLICK SF5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/target party3target")
	SetBinding("SHIFT-F6", "CLICK SF6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/target party4target")
	SetBinding("SHIFT-F7", "CLICK SF7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@player,help,nodead] 净除")
	SetBinding("SHIFT-F8", "CLICK SF8:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party2,help,nodead] 净除")
	SetBinding("SHIFT-F10", "CLICK SF10:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party4,help,nodead] 净除")
	SetBinding("SHIFT-F12", "CLICK SF12:LeftButton")
	
	
	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSP", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 黑曜鳞片")
	SetBinding("CTRL-SHIFT-P", "CLICK CSP:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSL", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party1,help,nodead] 净除")
	SetBinding("CTRL-SHIFT-L", "CLICK CSL:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSO", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party3,help,nodead] 净除")
	SetBinding("CTRL-SHIFT-O", "CLICK CSO:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSK", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party3target,harm,nodead] 镇压")
	SetBinding("CTRL-SHIFT-K", "CLICK CSK:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSM", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party4target,harm,nodead] 镇压")
	SetBinding("CTRL-SHIFT-M", "CLICK CSM:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSI", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party1,help,nodead] 魔力之源")
	SetBinding("CTRL-SHIFT-I", "CLICK CSI:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSJ", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party2,help,nodead] 魔力之源")
	SetBinding("CTRL-SHIFT-J", "CLICK CSJ:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSN", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party3,help,nodead] 魔力之源")
	SetBinding("CTRL-SHIFT-N", "CLICK CSN:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSU", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party4,help,nodead] 魔力之源")
	SetBinding("CTRL-SHIFT-U", "CLICK CSU:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSH", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast 扭转天平")
	SetBinding("CTRL-SHIFT-H", "CLICK CSH:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSB", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party1,help,nodead] 炽火龙鳞")
	SetBinding("CTRL-SHIFT-B", "CLICK CSB:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSY", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party2,help,nodead] 炽火龙鳞")
	SetBinding("CTRL-SHIFT-Y", "CLICK CSY:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSG", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party3,help,nodead] 炽火龙鳞")
	SetBinding("CTRL-SHIFT-G", "CLICK CSG:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSV", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party4,help,nodead] 炽火龙鳞")
	SetBinding("CTRL-SHIFT-V", "CLICK CSV:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CST", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@mouseover,help,nodead] 净除")
	SetBinding("CTRL-SHIFT-T", "CLICK CST:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSF", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@mouseover,harm,nodead] 梦游")
	SetBinding("CTRL-SHIFT-F", "CLICK CSF:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSC", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/run zhandoumoshi=1\n/console findYourselfAnywhere 1\n/console findYourselfAnywhereOnlyInCombat 0\n/console secureAbilityToggle 1\n/console SpellQueueWindow 400\n/console doNotFlashLowHealthWarning 1")
	SetBinding("CTRL-SHIFT-C", "CLICK CSC:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSZ", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/run zhandoumoshi=0\n/console findYourselfAnywhere 1\n/console findYourselfAnywhereOnlyInCombat 0\n/console secureAbilityToggle 1\n/console SpellQueueWindow 400\n/console doNotFlashLowHealthWarning 1")
	SetBinding("CTRL-SHIFT-Z", "CLICK CSZ:LeftButton")
	
	
	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party1target,harm,nodead] 镇压")
	SetBinding("ALT-SHIFT-F1", "CLICK ASF1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@party2target,harm,nodead] 镇压")
	SetBinding("ALT-SHIFT-F2", "CLICK ASF2:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@target,harm,nodead] 镇压")
	SetBinding("ALT-SHIFT-F3", "CLICK ASF3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@targettarget,help,nodead] 炽火龙鳞")
	SetBinding("ALT-SHIFT-F5", "CLICK ASF5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@mouseover,help,nodead] 灼烧之焰")
	SetBinding("ALT-SHIFT-F6", "CLICK ASF6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@focus,help,nodead] 灼烧之焰")
	SetBinding("ALT-SHIFT-F7", "CLICK ASF7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/use 13")
	SetBinding("ALT-SHIFT-F8", "CLICK ASF8:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/use 14")
	SetBinding("ALT-SHIFT-F9", "CLICK ASF9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@player] 青翠之拥")
	SetBinding("ALT-SHIFT-F12", "CLICK ASF12:LeftButton")
	
	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "/cast [@player] 翡翠之花")
	SetBinding("ALT-CTRL-F1", "CLICK ACF1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F2", "CLICK ACF2:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F3", "CLICK ACF3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F5", "CLICK ACF5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F6", "CLICK ACF6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F7", "CLICK ACF7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F9", "CLICK ACF9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F10", "CLICK ACF10:LeftButton")
	
	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F1", "CLICK ACSF1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F2", "CLICK ACSF2:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F3", "CLICK ACSF3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F5", "CLICK ACSF5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F6", "CLICK ACSF6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F7", "CLICK ACSF7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F8", "CLICK ACSF8:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F9", "CLICK ACSF9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F10", "CLICK ACSF10:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F12", "CLICK ACSF12:LeftButton")

	
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD1", "CLICK ACN1:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD2", "CLICK ACN2:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD3", "CLICK ACN3:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN4", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD4", "CLICK ACN4:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD5", "CLICK ACN5:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD6", "CLICK ACN6:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD7", "CLICK ACN7:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD8", "CLICK ACN8:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD9", "CLICK ACN9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACN0", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-NUMPAD0", "CLICK ACN0:LeftButton")


--------------------------------------------------------------------------------------------------------------------------------------------------
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF1", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F1", "CLICK AF1:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F2", "CLICK AF2:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF3", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F3", "CLICK AF3:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF5", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F5", "CLICK AF5:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF6", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F6", "CLICK AF6:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF7", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F7", "CLICK AF7:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F8", "CLICK AF8:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F9", "CLICK AF9:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F10", "CLICK AF10:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F11", "CLICK AF11:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-SHIFT-F10", "CLICK ASF10:LeftButton")--Nvidia内覆盖
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF2", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("CTRL-F2", "CLICK CF2:LeftButton")--微软管家
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("CTRL-SHIFT-F9", "CLICK CSF9:LeftButton")--哔哩哔哩直播姬
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSF10", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("CTRL-SHIFT-F10", "CLICK CSF10:LeftButton")--哔哩哔哩直播姬
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("SHIFT-F11", "CLICK SF11:LeftButton")--网吧问题
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ASF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-SHIFT-F11", "CLICK ASF11:LeftButton")--网吧问题
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACSF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-SHIFT-F11", "CLICK ACSF11:LeftButton")--网吧问题
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF8", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F8", "CLICK ACF8:LeftButton")--intel核心显卡的驱动程序软件
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF11", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F11", "CLICK ACF11:LeftButton")--intel核心显卡的驱动程序软件
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "ACF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-CTRL-F12", "CLICK ACF12:LeftButton")--intel核心显卡的驱动程序软件
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "SF9", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")--网吧问题
	SetBinding("SHIFT-F9", "CLICK SF9:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("CTRL-F12", "CLICK CF12:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "CSX", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("CTRL-SHIFT-X", "CLICK CSX:LeftButton")
	----------注册宏按钮
	MacroButton = CreateFrame("Button", "AF12", UIParent, "SecureActionButtonTemplate");
	MacroButton:RegisterForClicks("AnyDown", "AnyUp")
	MacroButton:SetAttribute("type", "macro")
	MacroButton:SetAttribute("macrotext", "")
	SetBinding("ALT-F12", "CLICK AF12:LeftButton")

	if WR_CreateMacroButtonInfo == true then
		print("|cff00ff00----------------------------------------")
		print(WR_CreateMacroButtonIsOK)
		print("当前职业：|cff00adf0龙希尔")
		print("|cff00ff00----------------------------------------")
	end
	
end


if UnitClassBase("player")=="EVOKER" and WR_EvokerCreateMacroButton()~=nil then
	WR_CreateMacroButtonInfo=false
	WR_MonkCreateMacroButton() --初始化宏
end
