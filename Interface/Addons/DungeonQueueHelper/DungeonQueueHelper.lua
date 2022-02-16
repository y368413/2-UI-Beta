
local addon_name, addon = ...

local Core = addon.DungeonQueueHelperCore
------------------------------------------------
Global_KilledList = {} --记录boss击杀列表
Global_AutoEnter = true --自动接受进本
Global_AutoQueue = true --重载后自动排本
------------------------------------------------
--必填，必改字段
--地下城地图id
local lfdTypeName = "皇冠药剂公司" -- 希望自动排队的类别，必须位于list选项第二个
local dungeonMapId = 310 --情人节火箭地图id，用于记录是否击杀
--打印地图id         /run print(C_Map.GetBestMapForUnit("player"))
------------------------------------------------
--加载后判断角色等级用于是否显示界面
local okLevel = 50
local isOk = false
------------------------------------------------


local frameName = "DungeonQueueHelperFrame"
local f = CreateFrame("Frame", frameName, UIParent,"BackdropTemplate")
f:SetPoint("TOP", UIParent, "TOP", -300, 50)
f:SetSize(200, 260)
f:SetBackdrop({
	bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
	edgeFile = "Interface\\PVPFrame\\UI-Character-PVP-Highlight", -- this one is neat
	edgeSize = 16,
	insets = { left = 8, right = 6, top = 8, bottom = 8 },
})
f:SetBackdropBorderColor(0, .44, .87, 0.5) -- darkblue
-- Movable
f:SetMovable(true)
f:SetClampedToScreen(true)
f:SetScript("OnMouseDown", function(self, button)
	if button == "LeftButton" then
		self:StartMoving()
	end
end)
f:SetScript("OnMouseUp", f.StopMovingOrSizing)
 
----------------------------------------------------------
local function addCheckBox (text, w, h, x, y)
	--根据其他的习惯，将y翻转
	y = -y
	local ctrl = CreateFrame("CheckButton", nil, f, "ChatConfigCheckButtonTemplate");
	ctrl:SetPoint("TOPLEFT", frameName, "TOPLEFT", x, y)
	ctrl:SetSize(h, h)
	ctrl:SetChecked(true)
	--文字
	ctrl.Text = ctrl:CreateFontString(nil, "OVERLAY")-- 为Frame创建一个新的文字层
    ctrl.Text:SetFont("Fonts\\ZYKai_T.ttf", 14, "")-- 设置字体路径, 大小, 描边
    ctrl.Text:SetText(text) -- 文字
    ctrl.Text:SetPoint("LEFT", ctrl, "CENTER", h/2, 0)
    ctrl.Text:SetJustifyH("LEFT")--水平对齐方式
	
	return ctrl
end 

local function addLabel (text, w, h, x, y)
	--根据其他的习惯，将y翻转
	y = -y
	local ctrl = CreateFrame("Frame", nil, f)
	ctrl:SetPoint("TOPLEFT", frameName, "TOPLEFT", x, y)
	ctrl:SetSize(w, h)
	--文字
	ctrl.Text = ctrl:CreateFontString(nil, "OVERLAY")-- 为Frame创建一个新的文字层
    ctrl.Text:SetFont("Fonts\\ZYKai_T.ttf", 14, "")-- 设置字体路径, 大小, 描边
    ctrl.Text:SetText(text) -- 文字
    ctrl.Text:SetPoint("CENTER", ctrl, "CENTER",0, 0)
    ctrl.Text:SetJustifyH("LEFT")--水平对齐方式
	 
	return ctrl
end 

local function setLabelText(ctrl,text)
	ctrl.Text:SetText(text)
end

local function addButton (text, w, h, x, y)
	--根据其他的习惯，将y翻转
	y = -y
	--local ctrl = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
	--使用 SecureActionButtonTemplate 可以在上面绑定不安全的宏
	local ctrl = CreateFrame("Button", nil, f, "SecureActionButtonTemplate,UIPanelButtonTemplate")

	ctrl:SetPoint("TOPLEFT", frameName, "TOPLEFT", x, y)
	ctrl:SetText(text)
	ctrl:SetSize(w, h) 
	return ctrl
end 
----------------------------------------------------------
local lab1 = addLabel("...",180,30,10,5)
local btnQueue = addButton("1. 排本/取消",180,30,10,40)
--
local ckbAutoQueue = addCheckBox("登录后自动排本",100,30,10,80)
ckbAutoQueue:SetScript("OnClick",  function()
	Global_AutoQueue = ckbAutoQueue:GetChecked()
end);
--
local ckbAutoEnter = addCheckBox("自动接受进本",100,30,10,110)
ckbAutoEnter:SetScript("OnClick",  function()
	Global_AutoEnter = ckbAutoEnter:GetChecked()
end);
--
local btnQuit = addButton("2. 退出副本",180,30,10,150)
--
local btnLogout = addButton("3. 返回角色界面",180,30,10,190)
btnLogout:SetAttribute('type', 'macro')
btnLogout:SetAttribute('macrotext', '/logout')
--
addLabel("trykle 2022.2",180,30,10,225)
--
btnQueue:SetScript("OnMouseUp", function(self, button)
	local okQueue = Core:StartQueue(lfdTypeName)
	if not okQueue then
		print ("地下城类别第2个非 " .. lfdTypeName)
	end
end)
btnQuit:SetScript("OnMouseUp", function(self, button)
	--离开副本
	C_PartyInfo.LeaveParty()
end)

f:Show()
----------------------------------------------------------
local queueOk = false
local function queue()
	Core:StartQueue(lfdTypeName)
end

local function tryQueue(sec)
	C_Timer.After(0,function()
		C_Timer.After(sec,function()
			if queueOk then
				return true
			end
			local status, err = pcall(queue)
			setLabelText(lab1,"尝试自动排队 " .. sec .. "s")
			if status == true then
				queueOk = true
			end
		end)
	end)
end
----------------------------------------------------------
-- 实时更新事件
local timeElapsed = 2
local function setOnUpdate()
	f:SetScript("OnUpdate", function(self, elapsed)
		timeElapsed = timeElapsed + elapsed 
		if (isOk and timeElapsed > 2) then
			timeElapsed = timeElapsed - 2
			--一直点击进本按钮
			if ckbAutoEnter:GetChecked() then
				Core:ClickLFDEnter()
			end
		end
	end)
end

----------------------------------------------------------
--事件注册
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("LFG_COMPLETION_REWARD") --地下城完成

f:SetScript('OnEvent', function(self, event, name)
	if event == "ADDON_LOADED" then
		--恢复配置
		ckbAutoQueue:SetChecked(Global_AutoQueue)
		ckbAutoEnter:SetChecked(Global_AutoEnter)
	elseif event == "PLAYER_LOGIN" then
		print("进入世界")  
        isOk = UnitLevel("player") >= okLevel 
		if not isOk then
			print("未满 " .. okLevel .. " 级，不显示排本界面")
			f:Hide()
		else
			setOnUpdate()
			local uuid = Core:RoleDayUUID()
			--如果未击杀，直接排队
			if not Global_KilledList[uuid] and ckbAutoQueue:GetChecked() then
				tryQueue(2)
				tryQueue(5)
				tryQueue(10)
			--如果已击杀，不排队
			elseif Global_KilledList[uuid] then
				setLabelText(lab1,"已击杀，换个号吧")
			end
		end
	elseif event == "LFG_COMPLETION_REWARD" and isOk then
		print("地下城完成")
		local mapId = C_Map.GetBestMapForUnit("player")
		if dungeonMapId == mapId then
			local uuid = Core:RoleDayUUID()
			Global_KilledList[uuid] = true
			setLabelText(lab1,"已击杀")
		end
	end
end) -- end fn

