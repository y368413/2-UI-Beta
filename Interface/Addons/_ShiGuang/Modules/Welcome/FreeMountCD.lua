if GetLocale() == "zhCN" then

local color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[select(2, UnitClass("player"))]
local soundfile1 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCd\\1.mp3")
local soundfile2 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCd\\2.mp3")
local soundfile3 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\3.mp3")
local soundfile4 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\4.mp3")
local soundfile5 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\5.mp3")
local soundfile6 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\6.mp3")
local soundfile7 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\7.mp3")
local soundfile8 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\8.mp3")
local soundfile9 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\9.mp3")
local soundfile10 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\10.mp3")
local soundfile11 = tostring("Interface\\AddOns\\_ShiGuang\\Media\\Sounds\\FreeMountCD\\11.mp3")

-- Function --
local function CreatCDButton(id, parent, w, h, ap, frame, rp, x, y, alpha, r, g, b)
		local CDButton = CreateFrame("Button", id, parent, "SecureActionButtonTemplate")
		CDButton:SetFrameStrata("HIGH")
		CDButton:SetWidth(w)
		CDButton:SetHeight(h)
		CDButton:SetPoint(ap, frame, rp, x, y)
		CDButton:SetAlpha(alpha)
		CDButton:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Hexagon"})
		CDButton:SetBackdropColor(r, g, b)
		--ChatButton:SetNormalTexture(Texture)
		return CDButton
end
local function CreatCDText(f, font, fontsize, fontmod, w, h, text, rp, x, y, r, g, b)
    local CDText = f:CreateFontString(nil, "OVERLAY")
		CDText:SetFont(font, fontsize, fontmod)
		CDText:SetJustifyH("CENTER")
		CDText:SetWidth(w)
		CDText:SetHeight(h)
		CDText:SetText(text)
		CDText:SetPoint(rp, x, y)
		CDText:SetTextColor(r, g, b)
		return CDText
end
-- Function end --

  MMMMHIDE = CreatCDButton("MMMMHIDE", UIParent, 43, 43, "TOPLEFT", UIParent, "TOPLEFT", 116, -12, 1, color.r, color.g, color.b)
	MMMMHIDE:SetMovable(true)
  MMMMHIDE:SetClampedToScreen(true)
  MMMMHIDE:RegisterForDrag("LeftButton", "RightButton")
	MMMMHIDE:SetScript("OnDragStart", function(self) self:StartMoving() end)
  MMMMHIDE:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	MMMMHIDE:SetScript("OnClick", function() Toggle(NNNN) end)
	MMMMHIDEText = CreatCDText(MMMMHIDE, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "CD", "CENTER", 2, 0, 1, 1, 0)
	MMMMHIDE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(MMMMHIDE, "ANCHOR_TOP")
		GameTooltip:AddLine("                                                                          【《魔兽世界》免费CD云分流终端】", 1, 2, 0)
		GameTooltip:AddLine("                                                                                          【革命者】（国服）", 1, 0, 1)
		GameTooltip:AddLine("                                                                                  【版本1.34N NGA单轨中速版 】", 0,6,6)
		GameTooltip:AddLine("       ", 1, 0.4,0.8)
		GameTooltip:AddLine("                                                          【本终端是提供《魔兽世界》免费低级本进度功能的小工具插件】", 1, 0.4,0.8)
		GameTooltip:AddLine("                    【此插件及其提供的服务永久免费，不收取任何形式的费用！任何人不得冒充插件版权拥有者、以有偿形式分享本插件！】", 1, 0,0)
		GameTooltip:AddLine("                                           ", 1, 0.4,0.8)
		GameTooltip:AddLine("                                                                              _______★【 副本坐标 】★_______", 1, 1, 1)
		GameTooltip:AddLine("      —冰冠堡垒：【冰冠冰川53.85】   —奥杜尔：  【风暴峭壁42.18】      —火焰之地  【海加尔山48.78】   —黑翼血环  【燃烧平原25.25】 ", color.r, color.g, color.b)
		GameTooltip:AddLine("       —风神王座  【奥丹姆39.80】      —巨龙之魂  【时光之穴62.28】       —魔古宝库  【昆莱山60.39】        —永春台    【雾纱栈道49.62】 ", color.r, color.g, color.b)
		GameTooltip:AddLine("        —雷神王座  【雷神岛63.33】     —决战奥格  【锦绣谷72.45】           —黑石铸造厂【戈尔隆德51.28】      —地狱火堡垒【塔纳安丛林45.53】", color.r, color.g, color.b)
		GameTooltip:AddLine("                                                             —安其拉神殿【安其拉堕落王国47.08】 ",color.r, color.g, color.b)
		GameTooltip:AddLine("                ", color.r, color.g, color.b)
		GameTooltip:AddLine("     ﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌★【 注意事项 】★﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌﹌ ", 1, 1, 1)
		GameTooltip:AddLine("                  ※【帖子里有一套图文攻略可供下载，包括插件的安装使用、以上副本的掉落、坐标、前往方式、注意事项等，请详细阅读】", 0, 1,0)
		GameTooltip:AddLine("  ●CD君们并非工作也不是义务，何时营业、营业多久取决于条件和时间，所以CD君们不在线或在线不能营业、提供CD时间不定等情况，请理解●", 1, 2, 0)
		GameTooltip:AddLine("         ▼请注意：① 80级之前的副本不能染CD，所以没有【蛋刀CD】", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：② 除了【决战奥格H小吼CD】以外，其他副本必须普通难度进本！", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：③ 进本后只有冰冠堡垒可以且必须切H难度！其他副本严禁进本后切 H ！", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：④ 史诗难度不能染CD，因此决战奥格的小吼、黑石铸造厂的黑手、地狱火堡垒的阿克蒙德，没有对应的史诗CD  ", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：⑤ 免费CD只是帮你跳BOSS，没法让你无限刷，也不是带你刷，请不懂的人自行百度什么是染CD。 ", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：⑥ 如果可以，请尽量躲开每周的 【周三、周四、周六、周日】这4天人流高峰，错峰染CD。  ", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：⑦ 一定要严格按照要求使用插件，尤其是【退】按钮，一定要进本之后点！避免你进入死循环。 ", color.r, color.g, color.b)
		GameTooltip:AddLine("         ▼请注意：⑧ BLZ的BUG已修复，巨龙之魂8号CD已恢复供应，只能染普通难度，请勿切H！ ", 1, 1, 1)
		GameTooltip:AddLine("                ", color.r, color.g, color.b)
		GameTooltip:AddLine("                                                   >>>>>>>>>★【点击 CD 按钮，展开插件界面、鼠标拖拽可改变位置】★<<<<<<<< ", 0, 1,0)

		GameTooltip:Show()
	end)
  MMMMHIDE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	MMMMHIDE:SetScript("OnClick", function(self)
		MMMM:Show()
		MMMMHIDE:Hide()
	end)	

  local BUTTONFRAME=CreateFrame("Frame","BUTTONFRAME",UIParent)	
	BUTTONFRAME:SetSize(46*9+65, 46)
	BUTTONFRAME:SetPoint("CENTER", UIParent, "CENTER", -12, 12)
	
	MMMM = CreatCDButton("MMMM", UIParent, 65, 65, "TOPLEFT", UIParent, "TOPLEFT", 268, -43, 1, color.r, color.g, color.b)
	MMMM:SetMovable(true)
  MMMM:SetClampedToScreen(true)
  MMMM:RegisterForDrag("LeftButton", "RightButton")
	MMMM:SetScript("OnDragStart", function(self) self:StartMoving() end)
  MMMM:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
	MMMM:Hide()
	MMMMText = CreatCDText(MMMM, STANDARD_TEXT_FONT, 14, "OUTLINE", 25, 25, "CD", "CENTER", 2, 0, 1, 1, 0)
	MMMM:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(MMMM, "ANCHOR_TOP")
		GameTooltip:AddLine("                【《魔兽世界》免费CD云分流终端】", 1, 2, 0)
		GameTooltip:AddLine("                               【革命者】（国服）", 1, 0, 1)
		GameTooltip:AddLine("                        【版本1.34N NGA单轨中速版 】", 0,6,6)
		GameTooltip:AddLine("                                           ", 1, 0.4,0.8)
		GameTooltip:AddLine("  ____________________★【 使用方法 】★____________________", 1, 1, 1)
		GameTooltip:AddLine("                   ", 1, 0.4,0.8)
		GameTooltip:AddLine("               需求者必须仔细阅读各按钮所列的详细内容！ ", 1, 2, 0)
		GameTooltip:AddLine("                                           ", 1, 0.4,0.8)
		GameTooltip:AddLine("    先前往副本入口，在入口处点击获取CD，并进行下一步操作。", 0,6,6)
		GameTooltip:AddLine("                ", 1, 0, 0)
		GameTooltip:AddLine("  ____________________★【 按钮简介 】★____________________", 1, 1, 1)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(" ●【BL/LM 按钮】", 1, 2,0)
		GameTooltip:AddLine(" 提供常规免费CD，详见按钮里的说明。", color.r, color.g, color.b)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(" ●【A B C 按钮】", 1, 2,0)
		GameTooltip:AddLine(" 提供多向性CD，详见按钮里的说明。", color.r, color.g, color.b)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(" ●【 退   按钮】", 1, 2,0)
		GameTooltip:AddLine(" 提供退队列功能，进本之后一定要点击 退 按钮。", color.r, color.g, color.b)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(" ●【 H 、10 按钮】", 1, 2,0)
		GameTooltip:AddLine(" 提供冰冠堡垒、决战奥格小吼切H、切换10人难度的快捷键。", color.r, color.g, color.b)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(" ●【 S 、 L 按钮】", 1, 2,0)
		GameTooltip:AddLine(" 插件用户手册、查询在线CD君按钮 。", color.r, color.g, color.b)
		GameTooltip:AddLine("         ", 1, 0, 0)
		GameTooltip:AddLine(">>★【点击“CD”按钮可最小化界面，鼠标拖拽可改变位置】★<< ", 0, 1,0)
		GameTooltip:Show()
	end)
  MMMM:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)
	MMMM:SetScript("OnClick", function(self)
		MMMM:Hide()
		MMMMHIDE:Show()
	end)

  CDONE = CreatCDButton("CDONE", MMMM, 46, 46, "LEFT",MMMM,"RIGHT",0,0, 1, 255/255,106/255,106/255)
  CDONEText = CreatCDText(CDONE, STANDARD_TEXT_FONT, 14, "OUTLINE", 25, 25, "BL", "CENTER", 0, 0, 1, 1, 0)
	CDONE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDONE, "ANCHOR_TOP")
		GameTooltip:AddLine(" >>>>>>>>>★【点击开始 常规CD 云分流】★<<<<<<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" ▼—冰冠堡垒[无敌](必须25普通难度进本，再点 H 切英雄）", 0, 1,0)
		GameTooltip:AddLine(" ▼—奥杜尔[飞机头](必须25人，不要与守护者对话）", 0, 1,0)
		GameTooltip:AddLine(" ▼—风神王座[南风幼龙]（不能切H）", 0, 1,0)
		GameTooltip:AddLine(" ▼—火焰之地[纯血火鹰](火乌鸦、鹿盔、大螺丝)(不能切h)", 0, 1,0)
		GameTooltip:AddLine(" ▼—魔古宝库[星光龙]", 0, 1,0)
		GameTooltip:AddLine(" ▼—永春台[玉魂]", 0, 1,0)
		GameTooltip:AddLine(" ▼—黑翼血环[能量洪流](不能切h)", 0, 1,0)
		GameTooltip:AddLine(" ▼—黑石铸造厂：[黑石之印](10号{黑手} 不能切m刷坐骑)", 0, 1,0)
		GameTooltip:AddLine(" ▼—地狱火堡垒：[血环之印]( 5号{死眼} 不能切m刷坐骑)", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine(" 如需染10人难度，进队后点击【 10 】按钮，将自动切10人 ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                          ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("            ★进本后必须点右侧【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("         ★染[冰冠堡垒]拿到队长后点【 H 】按钮！ ★", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:Show()
		CDONE:SetBackdropColor(0,0,0)
	end)
  CDONE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
    CDONE:SetBackdropColor(255/255,106/255,106/255)
	end)	
	CDONE:RegisterForClicks("LeftButtonUp")
	CDONE:SetAttribute("type","macro")
	CDONE:SetAttribute("macrotext",
	'/click CD1M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("慕容晨-无尽之海","1")M("明家七风子-织亡者","1")M("镭萧-亡语者","1")M("湛蓝呵呵-戈提克","1")M("想静静-贫瘠之地","1")M("九筱妖-布兰卡德","1")M("郑矢娜-战歌","9")M("阿焦大做饭-希尔瓦娜斯","1")M("月色下的乞丐-辛达苟萨","44296")'
	..'\n'..
	--'/Y 已开始部落【常规CD】的云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/E 欢迎加入免费CD部落群【嫣红蔷薇】，获取双轨疾速版！群号563537568，入群口令：部落。'
	..'\n'..
	'/E 联动推荐其他免费CD交流群：365513777、576067091、378516668。'
	..'\n'..
	'/script StopMusic();'
	)
	
	

  CDTWO = CreatCDButton("CDTWO", MMMM, 65, 65, "LEFT",CDONE,"RIGHT",130,0, 1, color.r, color.g, color.b)
  CDTWOText = CreatCDText(CDTWO, STANDARD_TEXT_FONT, 13, "OUTLINE", 25, 25, "退", "CENTER", 2, 0, 1, 1, 0)
	CDTWO:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDTWO, "ANCHOR_TOP")
		GameTooltip:AddLine("         >>>>>>>★【点击退出 多余队列】★<<<<<<<",  0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("            请进本后一定要点击此按钮，退出多余的队列！", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                       可避免您进入云分流死循环！", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("★染免费CD，做素质玩家！为他人让路，等于为自己让路！★", 1, 0.4,0.8)
		GameTooltip:Show()
		CDTWO:SetBackdropColor(0,0,0)
	end)
    CDTWO:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDTWO:SetBackdropColor(color.r, color.g, color.b)
	end)	
	CDTWO:RegisterForClicks("LeftButtonUp")
	CDTWO:SetAttribute("type","macro")
	CDTWO:SetAttribute("macrotext",
	'/click CD2M'
	..'\n'..
	'/P 3'
	..'\n'..
	'/S 谁再组你都拒绝，祝红手！'
	..'\n'..
	'/W 慕容晨-无尽之海 0'
	..'\n'..
	'/W 明家七风子-织亡者 0'
	..'\n'..
	'/W 镭萧-亡语者 0'
	..'\n'..
	'/W 湛蓝呵呵-戈提克 0'
	..'\n'..
	'/W 九筱妖-布兰卡德 0'
	..'\n'..
	'/W 月色下的乞丐-辛达苟萨 0'
	..'\n'..
	'/W 阿焦大做饭-希尔瓦娜斯 0'
	..'\n'..
	'/W 郑矢娜-战歌 0'
	..'\n'..
	'/W 郑矢娜-战歌 版本1.34N'
	..'\n'..
	'/W 想静静-贫瘠之地 0'
	..'\n'..
	--'/Y 染冰冠堡垒的人，点 H 按钮切H难度！其他本严禁切H!”'
	--..'\n'..
	'/script StopMusic();'
	)


  CDTHREE = CreatCDButton("CDTHREE", MMMM, 46, 46, "LEFT",MMMM,"RIGHT",-3,0, 1, 99/255,184/255,255/255)
  CDTHREEText = CreatCDText(CDTHREE, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "LM", "CENTER", 0, 0, 1, 1, 0)
	CDTHREE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDTHREE, "ANCHOR_TOP")
		GameTooltip:AddLine(" >>>>>>>>>★【点击开始 常规CD 云分流】★<<<<<<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" ▼—冰冠堡垒[无敌](必须25普通难度进本，再点 H 切英雄）", 0, 1,0)
		GameTooltip:AddLine(" ▼—奥杜尔[飞机头](必须25人，不要与守护者对话）", 0, 1,0)
		GameTooltip:AddLine(" ▼—风神王座[南风幼龙]（不能切H）", 0, 1,0)
		GameTooltip:AddLine(" ▼—火焰之地[纯血火鹰](火乌鸦、鹿盔、大螺丝)(不能切h)", 0, 1,0)
		GameTooltip:AddLine(" ▼—魔古宝库[星光龙]", 0, 1,0)
		GameTooltip:AddLine(" ▼—永春台[玉魂]", 0, 1,0)
		GameTooltip:AddLine(" ▼—黑翼血环[能量洪流](不能切h)", 0, 1,0)
		GameTooltip:AddLine(" ▼—黑石铸造厂：[黑石之印](10号{黑手} 不能切m刷坐骑)", 0, 1,0)
		GameTooltip:AddLine(" ▼—地狱火堡垒：[血环之印]( 5号{死眼} 不能切m刷坐骑)", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine(" 如需染10人难度，进队后点击【 10 】按钮，将自动切10人 ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                          ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("            ★进本后必须点右侧【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("         ★染[冰冠堡垒]拿到队长后点【 H 】按钮！ ★", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:Show()
		CDTHREE:SetBackdropColor(0,0,0)
	end)
  CDTHREE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDTHREE:SetBackdropColor(99/255,184/255,255/255)
	end)
	CDTHREE:RegisterForClicks("LeftButtonUp")
	CDTHREE:SetAttribute("type","macro")
	CDTHREE:SetAttribute("macrotext",
	'/click CD3M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end; M("兔子修炼成马-白银之手","1")M("昀萧-夏维安","1")M("死神的黑羽翼-山丘之王","1") M("未闻君名-白银之手","1") M("千山云影-雷霆号角","1")M("永夜绽放之薇-艾森娜","9")M("林荫下的乞丐-安苏","44296")'
	..'\n'..
	--'/Y 已开始联盟【常规CD】的云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/E 欢迎加入免费CD联盟群【秘蓝玫瑰】，获取双轨疾速版！群号282718439，入群口令：联盟。'
	..'\n'..
	'/E 联动推荐其他免费CD交流群：365513777、576067091、378516668。'
	..'\n'..
	'/script StopMusic();'
	)
	
  CDFOUR = CreatCDButton("CDFOUR", MMMM, 65, 65, "LEFT",CDTHREE,"RIGHT",130,0, 1, color.r, color.g, color.b)
  CDFOURText = CreatCDText(CDFOUR, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "退", "CENTER", 0, 0, 1, 1, 0)
	CDFOUR:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDFOUR, "ANCHOR_TOP")
		GameTooltip:AddLine("         >>>>>>>★【点击退出 多余队列】★<<<<<<<",  0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("            请进本后一定要点击此按钮，退出多余的队列！", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                       可避免您进入云分流死循环！", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("★染免费CD，做素质玩家！为他人让路，等于为自己让路！★", 1, 0.4,0.8)
		GameTooltip:Show()
		CDFOUR:SetBackdropColor(0,0,0)
	end)
  CDFOUR:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDFOUR:SetBackdropColor(color.r, color.g, color.b)
	end)
	CDFOUR:RegisterForClicks("LeftButtonUp")
	CDFOUR:SetAttribute("type","macro")
	CDFOUR:SetAttribute("macrotext",
	'/click CD4M'
	..'\n'..
	'/P 3'
	..'\n'..
	'/S 谁再组你都拒绝，祝红手！'
	..'\n'..
	'/W 兔子修炼成马-白银之手 0'
	..'\n'..
	'/W 昀萧-夏维安 0'
	..'\n'..
	'/W 林荫下的乞丐-安苏 0'
	..'\n'..
	'/W 未闻君名-白银之手 0'
	..'\n'..
	'/W 死神的黑羽翼-山丘之王 0'
	..'\n'..
	'/W 永夜绽放之薇-艾森娜 0'
	..'\n'..
	'/W 永夜绽放之薇-艾森娜 版本1.34N'
	..'\n'..
	'/W 千山云影-雷霆号角 0'
	..'\n'..
	--'/Y 染冰冠堡垒的人，点 H 按钮切H难度！其他本严禁切H!”'
	--..'\n'..
	'/script StopMusic();'
	)
	
	CDFIVE = CreatCDButton("CDFIVE", MMMM, 46, 46, "LEFT",CDONE,"RIGHT",2,0, 1, 255/255, 215/255, 1/255)
  CDFOURText = CreatCDText(CDFIVE, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "A", "CENTER", 0, 0, 0, 1, 0)
	CDFIVE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDFIVE, "ANCHOR_TOP")
		GameTooltip:AddLine("    >>>★【点击开始 标准CD+解密CD 云分流】★<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" ▼—巨龙之魂[织炎幼龙](8号)(只能染普通，不能切H！)", 0, 1,0)
		GameTooltip:AddLine(" ▼—雷神王座  [季鹍]", 0, 1,0)
		GameTooltip:AddLine(" ▼—决战奥格  [谜语人坐骑任务]（傲之煞已死，进去拿书）", 0, 1,0)
		GameTooltip:AddLine(" ▼—安其拉神殿[清醒的梦魇步骤] (克苏恩已死)", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("   如需染10人难度，进队后点击【 10 】按钮，将自动切10人  ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                            ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("               ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDFIVE:SetBackdropColor(0,0,0)
	end)
  CDFIVE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDFIVE:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDFIVE:RegisterForClicks("LeftButtonUp")
	CDFIVE:SetAttribute("type","macro")
	CDFIVE:SetAttribute("macrotext",
	'/click CD5M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("慕容晨-无尽之海","1")M("明家七风子-织亡者","1")M("想静静-贫瘠之地","1")M("郑矢娜-战歌","9")M("月色下的乞丐-辛达苟萨","44296")'
	..'\n'..
	--'/Y 已开始【标准CD、解密CD】云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	
	CDSIX = CreatCDButton("CDSIX", MMMM, 46, 46, "LEFT",CDFIVE,"RIGHT",-7,0, 1, 255/255, 215/255, 1/255)
  CDSIXText = CreatCDText(CDSIX, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "B", "CENTER", 0, 0, 1,0.4,0.8)
	CDSIX:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDSIX, "ANCHOR_TOP")
		GameTooltip:AddLine("           >>>★【点击开始 特殊CD 云分流】★<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
	  GameTooltip:AddLine("      【供应此CD的CD君们是间歇性营业的，不是全天候】", 1, 0.4,0.8)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" ▼—巨龙之魂[2B龙](5号)(打完出本，可用A按钮染8号CD)", 0, 1,0)
		GameTooltip:AddLine(" ▼—雷神王座[郝立东] (2号)(打完出本，可用A按钮染6号CD)", 0, 1,0)
		GameTooltip:AddLine(" ▼—决战奥格[索克(猎人宝宝)]", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("   如需染10人难度，进队后点击【 10 】按钮，将自动切10人  ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                            ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("               ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDSIX:SetBackdropColor(0,0,0)
	end)
  CDSIX:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDSIX:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDSIX:RegisterForClicks("LeftButtonUp")
	CDSIX:SetAttribute("type","macro")
	CDSIX:SetAttribute("macrotext",
	'/click CD6M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("镭萧-亡语者","1")M("九筱妖-布兰卡德","1")'
	..'\n'..
	--'/Y 已开始【特殊CD】的云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	
  CDSEVEN = CreatCDButton("CDSEVEN", MMMM, 46, 46, "LEFT",CDSIX,"RIGHT",-7,0, 1, 255/255, 215/255, 1/255)
  CDSEVENText = CreatCDText(CDSEVEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "C", "CENTER", 0, 0, 0,6,6)
	CDSEVEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDSEVEN, "ANCHOR_TOP")
		GameTooltip:AddLine(" >>★【点击开始 小吼CD（H难度）云分流】★<<", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_____________________【 CD清单 】____________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("                    ▼—决战奥格[小吼]（H难度）", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                   动态CD，系统强制切10人难度！", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_____________________【！注意！】____________________", 1, 0,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("     ★此CD特殊，进组后点击后面的 H 按钮，再进本！", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("             ★提示已调整为10（英雄），即可进本！ ", 1, 2, 0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("             ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDSEVEN:SetBackdropColor(0,0,0)
	end)
  CDSEVEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDSEVEN:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDSEVEN:RegisterForClicks("LeftButtonUp")
	CDSEVEN:SetAttribute("type","macro")
	CDSEVEN:SetAttribute("macrotext",
	'/click CD7M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("慕容晨-无尽之海","1")M("明家七风子-织亡者","1")M("昀萧-夏维安","1")M("湛蓝呵呵-戈提克","1")M("月色下的乞丐-辛达苟萨","44296")M("郑矢娜-战歌","9")M("想静静-贫瘠之地","1")M("九筱妖-布兰卡德","1")'
	..'\n'..
	--'/Y 已开始【决战奥格-小吼（H难度）】的CD云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("CD君组你后一定要点 H 按钮，插件会自动为你切换10人英雄难度！看到切换提示后进本。")'
	..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	
	CDEIGHT = CreatCDButton("CDEIGHT", MMMM, 46, 46, "LEFT",CDTHREE,"RIGHT",2,0, 1, 255/255, 215/255, 1/255)
  CDEIGHTText = CreatCDText(CDEIGHT, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "A", "CENTER", 0, 0, 0,1,0)
	CDEIGHT:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDEIGHT, "ANCHOR_TOP")
	 GameTooltip:AddLine("    >>>★【点击开始 标准CD+解密CD 云分流】★<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)
	    GameTooltip:AddLine(" ▼—巨龙之魂[织炎幼龙](8号)(只能染普通，不能切H！)", 0, 1,0)		
		GameTooltip:AddLine(" ▼—雷神王座  [季鹍]", 0, 1,0)
		GameTooltip:AddLine(" ▼—决战奥格  [谜语人坐骑任务]（傲之煞已死，进去拿书）", 0, 1,0)
		GameTooltip:AddLine(" ▼—安其拉神殿[清醒的梦魇步骤] (克苏恩已死)", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("   如需染10人难度，进队后点击【 10 】按钮，将自动切10人  ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                            ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("               ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDEIGHT:SetBackdropColor(0,0,0)
	end)
  CDEIGHT:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDEIGHT:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDEIGHT:RegisterForClicks("LeftButtonUp")
	CDEIGHT:SetAttribute("type","macro")
	CDEIGHT:SetAttribute("macrotext",
	'/click CD5M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("兔子修炼成马-白银之手","1")M("昀萧-夏维安","1")M("未闻君名-白银之手","1")M("永夜绽放之薇-艾森娜","9")M("林荫下的乞丐-安苏","44296")'
	..'\n'..
	--'/Y 已开始【标准CD、解密CD】云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	
	CDNINE = CreatCDButton("CDNINE", MMMM, 46, 46, "LEFT",CDEIGHT,"RIGHT",-7,0, 1, 255/255, 215/255, 1/255)
	CDNINEText = CreatCDText(CDNINE, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "B", "CENTER", 0, 0, 1,0.4,0.8)
	CDNINE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDNINE, "ANCHOR_TOP")
		GameTooltip:AddLine("           >>>★【点击开始 特殊CD 云分流】★<<< ", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
	    GameTooltip:AddLine("      【供应此CD的CD君们是间歇性营业的，不是全天候】", 1, 0.4,0.8)
		GameTooltip:AddLine("   【染此CD，飞本前先用 L 按钮确定特殊CD君是否营业中！】", 1, 0.4,0.8)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_______________________【 CD清单 】______________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" ▼—巨龙之魂[2B龙](5号)(打完出本，可用A按钮染8号CD)", 0, 1,0)
		GameTooltip:AddLine(" ▼—雷神王座[郝立东] (2号)(打完出本，可用A按钮染6号CD)", 0, 1,0)
		GameTooltip:AddLine(" ▼—决战奥格[索克(猎人宝宝)]", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("   如需染10人难度，进队后点击【 10 】按钮，将自动切10人  ", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("                            ★进组之后尽快进本！ ", 1, 0.4,0.8)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("               ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDNINE:SetBackdropColor(0,0,0)
	end)
    CDNINE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDNINE:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDNINE:RegisterForClicks("LeftButtonUp")
	CDNINE:SetAttribute("type","macro")
	CDNINE:SetAttribute("macrotext",
	'/click CD6M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("千山云影-雷霆号角","1")M("死神的黑羽翼-山丘之王","1")'
	..'\n'..
	--'/Y 已开始【特殊CD】的云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	

  CDTEN = CreatCDButton("CDTEN", MMMM, 46, 46, "LEFT",CDNINE,"RIGHT",-7,0, 1, 255/255, 215/255, 1/255)
	CDTENText = CreatCDText(CDTEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "C", "CENTER", 0, 0, 0,6,6)
	CDTEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDTEN, "ANCHOR_TOP")
		GameTooltip:AddLine(" >>★【点击开始 小吼CD（H难度）云分流】★<<", 0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("_____________________【 CD清单 】____________________", 1, 2, 0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("                    ▼—决战奥格[小吼]（H难度）", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                   动态CD，系统强制切10人难度！", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_____________________【！注意！】____________________", 1, 0,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("     ★此CD特殊，进组后点击后面的 H 按钮，再进本！", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("             ★提示已调整为10（英雄），即可进本！ ", 1, 2, 0)
		GameTooltip:AddLine("          ", 1, 0, 0)
		GameTooltip:AddLine("             ★进本后必须点前面的【 “退”按钮 】★ ", 1, 2, 0)
		GameTooltip:Show()
		CDTEN:SetBackdropColor(0,0,0)
	end)
  CDTEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDTEN:SetBackdropColor(255/255, 215/255, 1/255)
	end)
	CDTEN:RegisterForClicks("LeftButtonUp")
	CDTEN:SetAttribute("type","macro")
	CDTEN:SetAttribute("macrotext",
	'/click CD7M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(4)'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(14)'
	..'\n'..
	'/run local M=function(a,b)SendChatMessage(b,"WHISPER",nil,a)end;M("未闻君名-白银之手","1")M("林荫下的乞丐-安苏","44296")M("永夜绽放之薇-艾森娜","9")M("死神的黑羽翼-山丘之王","1")M("千山云影-雷霆号角","1")'
	..'\n'..
	--'/Y 已开始【决战奥格-小吼（H难度）】的CD云分流排队，版本1.34N(NGA单轨中速版)'
	--..'\n'..
	'/run print("CD君组你后一定要点 H 按钮，插件会自动为你切换10人英雄难度！看到切换提示后进本。")'
	..'\n'..
	'/run print("进本一定要点 退 按钮，防止你被轮入死循环！")'
	..'\n'..
	'/E 开始搜寻在线的CD君！'
	..'\n'..
	'/script StopMusic();'
	)
	
	CDELEVEN = CreatCDButton("CDELEVEN", MMMM, 56, 56, "LEFT",CDONE,"RIGHT",110,38, 1, 0,6,6)
  CDELEVENText = CreatCDText(CDELEVEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "H", "CENTER", 0, 0, 1,1,0)
	CDELEVEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDELEVEN, "ANCHOR_TOP")
		GameTooltip:AddLine(">>>>>>>>>>>>★【点击切换 英雄 模式】★<<<<<<<<<<<<",0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("       染 冰冠堡垒  请进本后点击此按钮，切换  H  难度", 1, 2,0)
		GameTooltip:AddLine("   ", 0, 1,0)
		GameTooltip:AddLine("染 决战奥格[H小吼]，请进队后点此按钮，提示切换10H后进本", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("             此按钮仅用于冰冠堡垒和决战奥格H小吼CD", 1, 0.4,0.8)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("             染其他进度严禁使用此按钮，避免损失进度！", 1, 0,0)
		GameTooltip:Show()
		CDELEVEN:SetBackdropColor(0,0,0)
	end)
  CDELEVEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDELEVEN:SetBackdropColor(0,6,6)
	end)
	CDELEVEN:RegisterForClicks("LeftButtonUp")
	CDELEVEN:SetAttribute("type","macro")
	CDELEVEN:SetAttribute("macrotext",
	'/click CD8M'
	..'\n'..
	'/run SelectGossipOption(1)StaticPopup1Button1:Click()SetRaidDifficultyID(15)'
	..'\n'..
	'/P YX10'
	..'\n'..
	'/script StopMusic();'
	..'\n'..
	'/E 切换副本难度为【英雄模式】！'
	)

	CDTWELVE = CreatCDButton("CDTWELVE", MMMM, 56, 56, "LEFT",CDONE,"RIGHT",110,-38, 1, 0,6,6)
  CDTWELVEText = CreatCDText(CDTWELVE, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "10", "CENTER", 0, 0, 1,1,0)
	CDTWELVE:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDTWELVE, "ANCHOR_TOP")
		GameTooltip:AddLine(">>>>>>>>>>>>★【点击切换 10人 模式】★<<<<<<<<<<<<",0, 1,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine(" 小号想染10人难度，请进队后点此按钮，提示切换10人后进本", 1, 2,0)
		GameTooltip:AddLine("      坐骑和幻象都是特殊掉率，人数不会影响坐骑掉率", 1, 2,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("_______________________【！注意！】______________________", 1, 0,0)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("                 此按钮严禁用于冰冠堡垒和奥杜尔CD！", 1, 0.4,0.8)
		GameTooltip:AddLine("         ", 1, 0, 0)	
		GameTooltip:AddLine("                       这两个本的10人难度不给坐骑！", 1, 0.4,0.8)
		GameTooltip:Show()
		CDTWELVE:SetBackdropColor(0,0,0)
	end)
  CDTWELVE:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDTWELVE:SetBackdropColor(0,6,6)
	end)
	CDTWELVE:RegisterForClicks("LeftButtonUp")
	CDTWELVE:SetAttribute("type","macro")
	CDTWELVE:SetAttribute("macrotext",
	'/E 切换为10人难度，请勿在此难度下进入【冰冠堡垒】和【奥杜尔】！'
	..'\n'..
	'/P 10'
	..'\n'..
	'/click CD10M'
	..'\n'..
	'/script StopMusic();'
	)	
		
	CDTHIRTEEN = CreatCDButton("CDTHIRTEEN", MMMM, 56, 56, "LEFT",MMMM,"RIGHT",-35,38, 1, 0,6,6)
  CDTHIRTEENText = CreatCDText(CDTHIRTEEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "S", "CENTER", 0, 0, 1,1,0)
	CDTHIRTEEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDTHIRTEEN, "ANCHOR_TOP")
		GameTooltip:AddLine("                                                                                      【免费CD云分流终端用户协议】", 1, 2, 0)
		GameTooltip:AddLine("                ", color.r, color.g, color.b)
		GameTooltip:AddLine("                   ____________________________________________________★【 插件守则 】★___________________________________________________", 1, 1, 1)
		GameTooltip:AddLine("    本插件提供的功能来自于魔兽世界游戏内，由自愿参与此项公益的志愿者，以个人在线方式共享的方式提供，我们自称CD君或CD姬。", 1, 0.4,0.8)
		GameTooltip:AddLine("    我们所做的免费共享，并非针对收费CD的抵制行为，也不是别有用心，单纯公益，请不要对我们做的事做不负责任的揣测和诽谤。", 1, 0.4,0.8)
		GameTooltip:AddLine("    此名单内的CD君，仅因志同道合而集中在一起，互相之间没有隶属关系和管辖权限，仅由我代为做一定的支持性协调与调度。", 1, 0.4,0.8)
		GameTooltip:AddLine("    由于每位志愿者的条件和能力有限，我们提供的服务也是公益性质，非义务和盈利目的，因此我们提供的免费CD行为，不承担因此对使用者产生的任", 1, 0.4,0.8)
		GameTooltip:AddLine("何可能后果的责任，包括但不限于服务中断、服务拒绝、使用者进度受损、封号等，我们不承诺提供的公益服务能够完美、不间断、高效，一切量力而行。", 1, 0.4,0.8)
		GameTooltip:AddLine("                                                        我们能承诺的，只有会尽自己所能，去做想做的公益，不忘初心。", 1, 2, 0)
		GameTooltip:AddLine("※请使用本插件的用户，在官方渠道获取本插件，如在非官方途径获取盗版插件而产生任何诸如账号丢失、财物受损等后果，我方不承担法律及道德责任！", 1, 0,0)
		GameTooltip:AddLine("         ※严禁任何人私自修改插件内容，包括且不限于数据、指令、名单、结构、代码、声明、文字等，自行改装，恶意篡改，均后果自负", 1, 0,0)
		GameTooltip:AddLine("我们希望在此基础上，能够为魔兽世界国服玩家，提供一个有爱共享的免费CD公益，也请所有享受此福利的玩家，共同维护使用环境，拒绝自私与低素质。", 1, 0.4,0.8)
		GameTooltip:AddLine("                   如您无法认同及接受以上观点，请彻底删除本插件，拒绝使用；使用本插件即意味着您本插件及插件涉及的行为不存在异议。", 1, 2, 0)
		GameTooltip:AddLine("                ", color.r, color.g, color.b)
		GameTooltip:AddLine("      _____________________________________________________________★【 版权声明 】★__________________________________________________________", 1, 1, 1)
		GameTooltip:AddLine("    此插件的所有权利，包括历届版权、修改、使用、定义、共享、终止、最终解释权等，均归属郑矢娜、徒手破九霄与所有在该插件名单内的CD君", 1, 2, 0)
		GameTooltip:AddLine("任何人不得将此插件以及其中的内容、可能产生的效果和衍生事物，用于商业盈利、非法获利、不当用途及其他我方不可接受的行为。", 1, 2, 0)
		GameTooltip:AddLine("                                                            此插件的提供者和维护者，有权并保留追究此类行为相关责任的权利！", 1, 2, 0)
		GameTooltip:AddLine("                                                        ※插件设计和提供：【徒手破九霄-格瑞姆巴托】  优化与维护：【郑矢娜-战歌】", 1, 2, 0)
		GameTooltip:AddLine("                                                              所使用音乐的版权，属于《红色警戒3》及其版权所有公司。            ", color.r, color.g, color.b)
		GameTooltip:AddLine("                ", color.r, color.g, color.b)
		GameTooltip:Show()
		CDTHIRTEEN:SetBackdropColor(0,0,0)
	end)
  CDTHIRTEEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDTHIRTEEN:SetBackdropColor(0,6,6)
	end)
	CDTHIRTEEN:RegisterForClicks("LeftButtonUp")
	CDTHIRTEEN:SetAttribute("type","macro")
	CDTHIRTEEN:SetAttribute("macrotext",
	'/E 请感谢以下CD君曾经的付出，他们怀着热情加入了我们，现已因故退役，请记住他们！'
	..'\n'..
	'/E  祝他们早日完成学业，工作顺利，家庭美满！'
	..'\n'..
	'/E  部落退役CD君：我爱小前台-白银之手、浅夏微涼-燃烧之刃、小新与风间-死亡之翼、大姐姐我们走-迦拉克隆、瓜呱呱瓜-奥斯里安'
	..'\n'..
	'/E  联盟退役CD君：我是小前台-白银之手、鱼戏江湖-织亡者、杨铁心-古加尔'
	..'\n'..
	'/click CD11M'
	)
	
  CDFOURTEEN = CreatCDButton("CDFOURTEEN", MMMM, 56, 56, "LEFT",MMMM,"RIGHT",-35,-38, 1, 0,6,6)
  CDFOURTEENText = CreatCDText(CDFOURTEEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "L", "CENTER", 0, 0, 1,1,0)
	CDFOURTEEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDFOURTEEN, "ANCHOR_TOP")
		GameTooltip:AddLine("      >>>★【点击开始 查看CD君是否在线？】★<<<", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine(" 多数CD君非24小时在线值守，本按钮用于查询在线CD君人数", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                点击该按钮，可以看到CD君是否在线！", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                  【未显示的CD君即未上线或未营业】", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("  _____________________【！注意！】____________________", 1, 0,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("     特殊CD按钮使用前，请先查询一下特殊CD君的在线状态！ ", 1, 2, 0)
		GameTooltip:AddLine("                 特殊CD姬：九筱妖-布兰卡德", 0, 1,0)
		GameTooltip:AddLine("                 特殊CD君：镭萧-亡语者", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:Show()
		CDFOURTEEN:SetBackdropColor(0,0,0)
	end)
  CDFOURTEEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDFOURTEEN:SetBackdropColor(0,6,6)
	end)
	CDFOURTEEN:RegisterForClicks("LeftButtonUp")
	CDFOURTEEN:SetAttribute("type","macro")
	CDFOURTEEN:SetAttribute("macrotext",
	'/E 开始查询CD君在线状态……'
	..'\n'..
	'/W 郑矢娜-战歌 检测是否处于营业状态……'
	..'\n'..
	'/W 慕容晨-无尽之海 {好}'
	..'\n'..
	'/W 明家七风子-织亡者 {好}'
	..'\n'..
	'/W 湛蓝呵呵-戈提克 {好}'
	..'\n'..
	'/W 月色下的乞丐-辛达苟萨 {好}我是全天候CD君，只要不掉线，就会在！'
	..'\n'..
	'/W 阿焦大做饭-希尔瓦娜斯 {好}我是全天候CD君，只要不掉线，就会在！'
	..'\n'..
	'/W 想静静-贫瘠之地 {好}'
	..'\n'..
	'/W 镭萧-亡语者 {好}我是特殊CD君！要染巨龙5号、雷神2号和决战奥格索克的可以现在飞本！随时可能下线……'
	..'\n'..
	'/W 九筱妖-布兰卡德 {好}我是特殊CD姬！要染巨龙5号、雷神2号和决战奥格索克的可以现在飞本！'
	..'\n'..
	'/run print("要染巨龙5号、雷神2号和决战奥格索克，请确认【九筱妖-布兰卡德】与【镭萧-亡语者】正在*营业状态的*情况下飞本，以免白跑一趟！")'
	..'\n'..
	'/click CD9M'
	..'\n'..
	'/script StopMusic();'
	)	

	CDFIFTEEN = CreatCDButton("CDFIFTEEN", MMMM, 56, 56, "LEFT",MMMM,"RIGHT",-35,-38, 1, 0,6,6)
	CDFIFTEENText = CreatCDText(CDFIFTEEN, STANDARD_TEXT_FONT, 12, "OUTLINE", 25, 25, "L", "CENTER", 0, 0, 1,1,0)
	CDFIFTEEN:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(CDFIFTEEN, "ANCHOR_TOP")
		GameTooltip:AddLine("      >>>★【点击开始 查看CD君是否在线？】★<<<", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine(" 多数CD君非24小时在线值守，本按钮用于查询在线CD君人数", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                点击该按钮，可以看到CD君是否在线！", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("                  【未显示的CD君即未上线或未营业】", 1, 2, 0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("  _____________________【！注意！】____________________", 1, 0,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:AddLine("     特殊CD按钮使用前，请先查询一下特殊CD君的在线状态！ ", 1, 2, 0)
		GameTooltip:AddLine("                 特殊CD君：千山云影-雷霆号角", 0, 1,0)
		GameTooltip:AddLine("                 特殊CD君：死神的黑羽翼-山丘之王", 0, 1,0)
		GameTooltip:AddLine("                       ", 1, 2, 0)
		GameTooltip:Show()
		CDFIFTEEN:SetBackdropColor(0,0,0)
	end)
  CDFIFTEEN:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
		CDFIFTEEN:SetBackdropColor(0,6,6)
	end)
	CDFIFTEEN:RegisterForClicks("LeftButtonUp")
	CDFIFTEEN:SetAttribute("type","macro")
	CDFIFTEEN:SetAttribute("macrotext",
	'/E 开始查询CD君在线状态……'
	..'\n'..
	'/W 永夜绽放之薇-艾森娜 检测是否处于营业状态……'
	..'\n'..
	'/W 兔子修炼成马-白银之手 {好}'
	..'\n'..
	'/W 昀萧-夏维安 {好}'
	..'\n'..
	'/W 林荫下的乞丐-安苏 {好}我是全天候CD君，只要不掉线，就会在！'
	..'\n'..
	'/W 未闻君名-白银之手 {好}'
	..'\n'..
	'/W 千山云影-雷霆号角 {好}我是特殊CD君！要染巨龙5号、雷神2号和决战奥格索克的可以现在飞本！随时可能下线……'
	..'\n'..
	'/W 死神的黑羽翼-山丘之王 {好}我是特殊CD君！要染巨龙5号、雷神2号和决战奥格索克的可以现在飞本！随时可能下线……'
	..'\n'..
	'/run print("要染巨龙5号、雷神2号和决战奥格索克，请确认【千山云影-雷霆号角】与【死神的黑羽翼-山丘之王】正在*营业状态的*情况下飞本，以免白跑一趟！")'
	..'\n'..
	'/click CD9M'
	..'\n'..
	'/script StopMusic();'
	)	
		
--声音按钮，，主要是懒，全复制粘贴。所以写成下面这样。上面用宏调用这些按钮	
  CD1M = CreatCDButton("CD1M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD1M:SetScript("OnClick", function() PlaySoundFile(soundfile3) end)
	CD2M = CreatCDButton("CD2M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD2M:SetScript("OnClick", function() PlaySoundFile(soundfile4) end)
	CD3M = CreatCDButton("CD3M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD3M:SetScript("OnClick", function() PlaySoundFile(soundfile3) end)
	CD4M = CreatCDButton("CD4M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD4M:SetScript("OnClick", function() PlaySoundFile(soundfile4) end)
	CD5M = CreatCDButton("CD5M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD5M:SetScript("OnClick", function() PlaySoundFile(soundfile5) end)
	CD6M = CreatCDButton("CD6M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD6M:SetScript("OnClick", function() PlaySoundFile(soundfile6) end)
	CD7M = CreatCDButton("CD7M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD7M:SetScript("OnClick", function() PlaySoundFile(soundfile7) end)
	CD8M = CreatCDButton("CD8M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD8M:SetScript("OnClick", function() PlaySoundFile(soundfile8) end)
	CD9M = CreatCDButton("CD9M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD9M:SetScript("OnClick", function() PlaySoundFile(soundfile9) end)
	CD10M = CreatCDButton("CD10M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD10M:SetScript("OnClick", function() PlaySoundFile(soundfile10) end)
	CD11M = CreatCDButton("CD11M", UIParent, 0, 0, "LEFT",CDEIGHT,"RIGHT",0,0,0,0,6,6)
	CD11M:SetScript("OnClick", function() StopMusic();PlayMusic(soundfile11); end)

	
if UnitFactionGroup("player")=="Alliance" then	
		CDONE:Hide()
		CDTWO:Hide()
		CDFIVE:Hide()
		CDSIX:Hide()
		CDSEVEN:Hide()
		CDFOURTEEN:Hide()
	else 
		CDTHREE:Hide()
		CDFOUR:Hide()
		CDEIGHT:Hide()
		CDNINE:Hide()
		CDTEN:Hide()
		CDFIFTEEN:Hide()
	end
end