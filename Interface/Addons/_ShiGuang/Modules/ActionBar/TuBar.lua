local M, R, U, I = unpack(select(2, ...))
--------------------------------------Hide the left/right end cap------------------------
MainMenuBarLeftEndCap:Hide()  MainMenuBarRightEndCap:Hide()
---------------------------------------------------------------------------------------------   
if not IsAddOnLoaded('rActionBarStyler') or not IsAddOnLoaded('Bartender4') or not IsAddOnLoaded('Dominos') then --return; end
--加载设置
local _G = _G
ShiGuangPerDB = {}
local TuBar = CreateFrame("Frame","tubarLoader")
TuBar:RegisterEvent("ADDON_LOADED")
local cfg = ShiGuangPerDB
local function OnEvent(frame, event)
    if not MaoRUISettingDB["Misc"]["TuBar"] then return end 
    if event == "ADDON_LOADED" then --and string.upper(name) == string.upper(addon)
        cfg = ShiGuangPerDB
        cfg.curStyle = cfg.curStyle or "mr"
        loadLayout(cfg.curStyle)
    end
end
TuBar:SetScript("OnEvent", OnEvent);

CreateFrame("Button", "TLVB", UIParent, "SecureHandlerClickTemplate, SecureHandlerStateTemplate");
TLVB:SetSize(32, 32)
TLVB:SetPoint("BOTTOMLEFT", UIParent, -100, -100)
TLVB:RegisterForClicks("AnyUp")
--这里copy系统自带的-。-
TLVB:SetScript("OnClick", function(self)
	if ( UnitOnTaxi("player") ) then
		TaxiRequestEarlyLanding();
		self:Disable();
		self:SetHighlightTexture([[Interface\Buttons\CheckButtonHilight]], "ADD");
		self:LockHighlight();
	else
		VehicleExit();
	end
end)
--0.234375,0.234375,0.765625,0.78125
TLVB:SetNormalTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Up")  --UI-Vehicles-Button-PITCHDOWN-Up
TLVB:SetPushedTexture("Interface\\Vehicles\\UI-Vehicles-Button-Exit-Down")
TLVB:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
TLVB:GetNormalTexture():SetTexCoord(0.234375,0.765625,0.234375,0.78125)
TLVB:GetPushedTexture():SetTexCoord(0.234375,0.765625,0.234375,0.78125)

hooksecurefunc("MainMenuBarVehicleLeaveButton_Update", function()
	if ( CanExitVehicle() and ActionBarController_GetCurrentActionBarState() == LE_ACTIONBAR_STATE_MAIN ) then
		TLVB:Show()
		TLVB:UnlockHighlight();
		TLVB:Enable();
        if(GetNumShapeshiftForms()>0)then
            MainMenuBarVehicleLeaveButton:Hide()
        end
	else
		TLVB:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]], "ADD");
		TLVB:Hide()
	end
end)

--底部菜单背景
local hidden = false;
function hideBlzArt()
    MainMenuBar:ClearAllPoints();
    MainMenuBar:SetScale(0.8);  --MaoRUISettingDB["Settings"]["GUIScale"]
    MainMenuBar:SetPoint("BOTTOM",UIParent,"BOTTOM",0,-440);
    hidden = true;
end
--非战斗状态才隐藏这个
if not (InCombatLockdown() or UnitAffectingCombat("player")) then
    hideBlzArt();
end
--tubar 全局数据存储
local gBtn = {}
--全局变量设置函数
function initVars()
    local indexStr = "123456789ABC"             --索引，为了保证两个字符，所以把1-12变成1-C
    gBtn["UI"] = UIParent                       --UIParent
    gBtn["VK"] = TLVB--MainMenuBarVehicleLeaveButton  --离开载具的按钮
    for i=1,12 do
        gBtn["A"..indexStr:sub(i,i)] = _G["ActionButton"..i]
        gBtn["B"..indexStr:sub(i,i)] = _G["MultiBarBottomLeftButton"..i]
        gBtn["C"..indexStr:sub(i,i)] = _G["MultiBarBottomRightButton"..i]
        gBtn["D"..indexStr:sub(i,i)] = _G["MultiBarLeftButton"..i]
        gBtn["E"..indexStr:sub(i,i)] = _G["MultiBarRightButton"..i]
    end
    for i=1,10 do
        gBtn["P"..indexStr:sub(i,i)] = _G["PetActionButton"..i]
    end
    for i=1,6 do
        gBtn["S"..indexStr:sub(i,i)] = _G["StanceButton"..i]
    end
end
--根据缩写的按钮名称获得按钮
function getBtn(btnName)
    return gBtn[btnName]
end
--从（A1B2C3D4E5P6S3）获取第N个按钮的缩写
function getBtnName(nameString, N)
    return nameString:sub(N*2-1,N*2)
end
--定位btn到tar
function setAnchor(btn, tar, anchor, tarAnchor, xOff, yOff)
    btn:ClearAllPoints()
    btn:SetPoint(anchor, tar, tarAnchor, xOff, yOff)
end
--方向定义
local dirDef = {
    ["up"] = {"BOTTOM", "TOP"},
    ["down"] = {"TOP", "BOTTOM"},
    ["left"] = {"RIGHT", "LEFT"},
    ["right"] = {"LEFT", "RIGHT"}
}
--布局函数
function loadLayout(layoutName)
    local layout = TuBarStyles[layoutName..""];
    if layout == nil then
        print("|cff0080ff[TuBar]|r |cffff3333样式不存在！|r")
    end
    if not hidden then  hideBlzArt(); end
    local blkCnt = #layout
    --print("当前布局分为<"..blkCnt..">块")
    for blkIdx = 1, blkCnt do
        local blk = layout[blkIdx]
        local seq = blk.seq
        local btnCount = string.len(seq)/2
        --print("    Block["..blkIdx.."] 共有<"..btnCount..">个按钮")
        local ac1,tar,ac2,ofx,ofy = unpack(blk.anchor)
        local btn, btnName, preBtn, size
        preBtn = getBtn(tar)
        btnName = getBtnName(seq, 1)
        btn = getBtn(btnName)
        --print("      set "..btnName.." -> "..blk.target)
        size = blk.size or 43
        --print("size = "..size)
        btn:SetSize(size,size);
        setAnchor(btn, preBtn, ac1, ac2, ofx, ofy)
        if blk.offset~=nil then ofx,ofy=unpack(blk.offset) end
        for i= 2, btnCount do
            preBtn = btn
            btnName = getBtnName(seq, i)
            --print("        btn["..i.."] = "..btnName)
            btn = getBtn(btnName)
            btn:SetSize(size, size);
            setAnchor(btn, preBtn, dirDef[blk.dir][1], dirDef[blk.dir][2], ofx, ofy)
        end
    end
    --只有加载成功了才修改配置
    ShiGuangPerDB.curStyle = layoutName
end
initVars()
TuBarStyles = {};
TuBarStyles["pve1"] = {
{--最右侧
seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
},{--右侧偏左的那个
seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"TOPRIGHT","E1","TOPLEFT",-2, 0},dir="down",offset={0, -3},size = 39
},{--主动作条
seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-391,6},dir="right",offset={3, 0}
},{--主动作条上面那条
seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3, 0}
},{--主动作条上面那条的右边那条
seq= "C7C8C9CACBCC",anchor= {"LEFT","AC","RIGHT",10,0},dir = "right",offset = {3, 0}
},{--主动作条上面那条的右边那条
seq= "C1C2C3C4C5C6",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {3, 0}
},{--载具
seq= "VK",anchor= {"TOPLEFT","C6","RIGHT",6, 0},size = 43
},{--姿态
seq= "S1",anchor= {"BOTTOMLEFT", "B2","TOPLEFT"},initOffset={0, 3},size = 30
},{--宠物
seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","C5","TOPRIGHT",0, 3},dir = "left",size=30,offset = {-3, 0}
}
};
TuBarStyles["pve2"] = {
    {--最右侧
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
    },{--右侧偏左的那个
        seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"TOPRIGHT","E1","TOPLEFT",-2, 0},dir="down",offset={0, -3},size = 39
    },{--	主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"TOPLEFT","C6","RIGHT",6, 0},size = 43
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","B2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","BB","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
    },{--123@B1左侧
        seq= "C3C2C1",anchor= {"RIGHT","B1","LEFT",-8, -8},dir = "left",offset = {-2, 0},size = 36
    },{--456@B12右侧
        seq= "C4C5C6",anchor= {"LEFT","BC","RIGHT",8, -8},dir = "right",offset = {2, 0},size = 36
    },{--789@A1左侧
        seq= "C9C8C7",anchor= {"BOTTOMRIGHT","A1","BOTTOMLEFT",-8, 0},dir = "left",offset = {-2, 0},size = 36
    },{--101112@A12右侧
        seq= "CACBCC",anchor= {"BOTTOMLEFT","AC","BOTTOMRIGHT",8, 0},dir = "right",offset = {2, 0},size = 36
    }
};
TuBarStyles["miao"] = {
    {--最右侧
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
    },{--右侧偏左的那个
        seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"TOPRIGHT","E1","TOPLEFT",-2, 0},dir="down",offset={0, -3},size = 39
    },{--	主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-303,6},dir="right",offset={3,0},size = 52
    },{--主动作条上面那条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0},size = 52
    },{--载具
        seq= "VK",anchor= {"TOPLEFT","C6","RIGHT",6, 0},size = 43
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","B2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","BB","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
    },{--123@B1左侧
        seq= "C3C2C1",anchor= {"RIGHT","B1","LEFT",-8, 8},dir = "left",offset = {-2, 0},size = 52
    },{--456@B12右侧
        seq= "C4C5C6",anchor= {"LEFT","BC","RIGHT",8, 8},dir = "right",offset = {2, 0},size = 52
    },{--789@A1左侧
        seq= "C9C8C7",anchor= {"BOTTOMRIGHT","A1","BOTTOMLEFT",-8, 0},dir = "left",offset = {-2, 0},size = 52
    },{--101112@A12右侧
        seq= "CACBCC",anchor= {"BOTTOMLEFT","AC","BOTTOMRIGHT",8, 0},dir = "right",offset = {2, 0},size = 52
    }
};
TuBarStyles["pve3"] = {
{--最右侧
seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
},{--右侧偏左的那个
seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"TOPRIGHT","E1","TOPLEFT",-2, 0},dir="down",offset={0, -3},size = 39
},{--	主动作条
seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
},{--主动作条上面那条
seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 3},dir="right",offset={3,0}
},{--载具
seq= "VK",anchor= {"LEFT","AC","RIGHT",6, 0},size = 36
},{--姿态
seq= "S1",anchor= {"BOTTOMLEFT","C2","TOPLEFT",0, 3},size = 30
},{--宠物
seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","CC","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
},{--主动作条上面那条的右边那条
seq= "C1C2C3C4C5C6C7C8C9CACBCC",anchor= {"BOTTOM","B1","TOP",0, 3},dir="right",offset={3,0}
}
};
--柴柴的PVP布局
TuBarStyles["pvp1"] = {
    {--最右侧
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
    },{--右侧偏左的中八个
        seq= "D1D2D3D4D5D6D7D8",anchor= {"CENTER","UI","CENTER",-161, -280},dir="right",offset={3, 0}
    },{--右侧偏左的前俩个
        seq= "D9DA",anchor= {"TOP","D1","BOTTOMLEFT",0, -3},dir="right",offset={3, 0},size = 36
    },{--右侧偏左的后俩个
        seq= "DBDC",anchor= {"TOP","D8","BOTTOMRIGHT",0, -3},dir="left",offset={-3, 0},size = 36
    },{--主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"TOPLEFT","C6","RIGHT",6, 0},size = 43
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","B2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","C5","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
    },{--123@B1左侧
        seq= "C3C2C1",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--456@B12右侧
        seq= "C4C5C6",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--789@A1左侧
        seq= "C9C8C7",anchor= {"RIGHT","A1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--101112@A12右侧
        seq= "CACBCC",anchor= {"LEFT","AC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    }
};
--Hinako的PVP布局
TuBarStyles["pvp2"] = {
    {--最右侧
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
    },{--右侧偏左的前四个
        seq= "D1D2D3D4",anchor= {"RIGHT","E6","LEFT",-2, -16},dir="down",offset={0, -3},size=43
    },{--右侧偏左的后八个
        seq= "D5D6D7D8D9DADBDC",anchor= {"CENTER","UI","CENTER",-161, -280},dir="right",offset={3, 0}
    },{--主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"LEFT","CC","RIGHT",6, 0},size = 26
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","B2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","C5","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
    },{--左侧四个上2个
        seq= "C4C3",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--右侧四个上2个
        seq= "C5C6",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--左侧较大按钮，anchor到上面的后一个
        seq= "C2",anchor= {"RIGHT","C3","BOTTOMLEFT",-5, 0},size=64
    },{--最左侧按钮
        seq= "C1",anchor= {"RIGHT","C2","LEFT",-5, 0}
    },{--左侧四个下2个
        seq= "C8C7",anchor= {"RIGHT","A1","LEFT",-10, 0},dir = "left",offset = {-6, 0} 
    },{--右侧四个下2个
        seq= "C9CA",anchor= {"LEFT","AC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--右侧较大按钮，anchor到上面的后一个
        seq= "CB",anchor= {"LEFT","C6","BOTTOMRIGHT",5, 0},size=64
    },{--最右侧按钮
        seq= "CC",anchor= {"LEFT","CB","RIGHT",5, 0}
    }
};
--技能栏1放在中间方便使用之柴之迷布局
TuBarStyles["mr"] = {
    {--最右侧
        seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"RIGHT","UI","RIGHT",-2, 165},dir="down",offset={0, -3},size = 43
    },{--右侧偏左的后八个
        seq= "A1A2A3A4A5A6A7A8",anchor= {"CENTER","UI","CENTER",-172, -275},dir="right",offset={3, 0},size = 46
    },{--主动作条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"BOTTOM","B1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"LEFT","AC","RIGHT",6, 0},size = 26
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","E2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","C8","TOPRIGHT",-16, 3},dir = "left",offset = {-6, 0},size = 26
    },{--左侧三个上3个
        seq= "C3C2C1",anchor= {"RIGHT","E1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--左侧三个下3个
        seq= "C6C5C4",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--左侧较大按钮，anchor到上面的后一个
        seq= "A9",anchor= {"RIGHT","C1","BOTTOMLEFT",-5, 0},size=64
    },{--最左侧按钮
        seq= "AA",anchor= {"RIGHT","A9","LEFT",-5, 0}
    },{--右侧三个上3个
        seq= "C7C8C9",anchor= {"LEFT","EC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--右侧三个下3个
        seq= "CACBCC",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--右侧较大按钮，anchor到上面的后一个
        seq= "AB",anchor= {"LEFT","C9","BOTTOMRIGHT",5, 0},size=64
    },{--最右侧按钮
        seq= "AC",anchor= {"LEFT","AB","RIGHT",5, 0}
    }
};
--技能栏1放在中间方便使用之柴之迷布局
TuBarStyles["jk"] = {
    {--监控 1-2
        seq= "D1D2D3",anchor= {"LEFT","UI","CENTER",280, 230},dir="right",offset={16, 0},size = 50
    },{--监控 2-3
        seq= "D4D5D6D7",anchor= {"TOPRIGHT","D1","BOTTOM",-12, -12},dir="right",offset={16, 0},size = 50
    },{--监控 3-2
        seq= "D8D9DA",anchor= {"TOPLEFT","D4","BOTTOM",12, -12},dir="right",offset={16, 0},size = 50
    },{--右侧偏左的后八个
        seq= "A1A2A3A4A5A6A7A8",anchor= {"CENTER","UI","CENTER",-161, -280},dir="right",offset={3, 0}
    },{--主动作条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"BOTTOM","B1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"LEFT","AC","RIGHT",6, 0},size = 26
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","E2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"TOPRIGHT","A8","BOTTOMRIGHT",-26, -3},dir = "left",offset = {-6, 0},size = 26
    },{--左侧三个上3个
        seq= "C3C2C1",anchor= {"RIGHT","E1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--左侧三个下3个
        seq= "C6C5C4",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-6, 0}
    },{--左侧最大按钮，anchor到上面的后一个
        seq= "DB",anchor= {"RIGHT","C1","BOTTOMLEFT",-5, 0},size=88
    },{--左侧较大按钮，anchor到上面的后一个
        seq= "A9",anchor= {"RIGHT","DB","LEFT",-5, 0},size=64
    },{--最左侧按钮
        seq= "AA",anchor= {"RIGHT","A9","LEFT",-5, 0}
    },{--右侧三个上3个
        seq= "C7C8C9",anchor= {"LEFT","EC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--右侧三个下3个
        seq= "CACBCC",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {6, 0}
    },{--右侧最大按钮，anchor到上面的后一个
        seq= "DC",anchor= {"LEFT","C9","BOTTOMRIGHT",5, 0},size=88
    },{--右侧较大按钮，anchor到上面的后一个
        seq= "AB",anchor= {"LEFT","DC","RIGHT",5, 0},size=64
    },{--最右侧按钮
        seq= "AC",anchor= {"LEFT","AB","RIGHT",5, 0}
    }
};
--宽屏可以用这个
TuBarStyles["wide"] = {
    {--最右侧
        seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 145},dir="down",offset={0, -3},size = 39
    },{--主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
    },{--主动作条上面那条
        seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
    },{--载具
        seq= "VK",anchor= {"TOPLEFT","D1","RIGHT",6, 0},size = 43
    },{--姿态
        seq= "S1",anchor= {"BOTTOMLEFT","B2","TOPLEFT",0, 3},size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","BB","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
    },{--左侧六个上2个
        seq= "C6C5C4C3C2C1",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-2, 0}
    },{--左侧六个下2个
        seq= "CCCBCAC9C8C7",anchor= {"RIGHT","A1","LEFT",-10, 0},dir = "left",offset = {-2, 0}
    },{--右侧六个上2个
        seq= "D6D5D4D3D2D1",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {2, 0}
    },{--右侧六个下2个
        seq= "DCDBDAD9D8D7",anchor= {"LEFT","AC","RIGHT",10, 0},dir = "right",offset = {2, 0}
    }
};
TuBarStyles["ta"] = {
{--最右侧
seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"RIGHT","UI","RIGHT",-2, 180},dir="down",offset={0, -3}
},{--右侧偏左的那个
seq= "D1D2D3D4D5D6D7D8D9DADBDC",anchor= {"TOPRIGHT","E1","TOPLEFT",-2, 0},dir="down",offset={0, -3}
},{--	主动作条
seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
},{--主动作条上面那条
seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
},{--载具
seq= "VK",anchor= {"LEFT","C3","RIGHT",6, 0},size = 26
},{--姿态
seq= "S1",anchor= {"BOTTOMLEFT","E2","TOPLEFT",0, 3},size = 30
},{--宠物
seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","EB","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
},{--主动作条上面那条的右边那条
seq= "E1E2E3E4E5E6E7E8E9EAEBEC",anchor= {"BOTTOM","B1","TOP",0, 3},dir="right",offset={3,0}
    },{--左侧两个上
        seq= "D2D1",anchor= {"RIGHT","E1","LEFT",-10, 0},dir = "left",offset = {-3, 0}
    },{--左侧四个中
        seq= "D6D5D4D3",anchor= {"RIGHT","B1","LEFT",-10, 0},dir = "left",offset = {-3, 0}
    },{--左侧六个下
        seq= "DCDBDAD9D8D7",anchor= {"RIGHT","A1","LEFT",-10, 0},dir = "left",offset = {-3, 0}
     },{--右侧两个上
        seq= "C2C1",anchor= {"LEFT","EC","RIGHT",10, 0},dir = "right",offset = {3, 0}
    },{--右侧四个中
        seq= "C6C5C4C3",anchor= {"LEFT","BC","RIGHT",10, 0},dir = "right",offset = {3, 0}
    },{--右侧六个下
        seq= "CCCBCAC9C8C7",anchor= {"LEFT","AC","RIGHT",10, 0},dir = "right",offset = {3, 0}
    }
};
--3X20，5个动作条都在一起-。-
TuBarStyles["all"] = {
{--	主动作条
seq= "A1A2A3A4A5A6A7A8A9AAABAC",anchor= {"BOTTOM","UI","BOTTOM",-253,6},dir="right",offset={3,0}
},{--主动作条上面那条
seq= "B1B2B3B4B5B6B7B8B9BABBBC",anchor= {"BOTTOM","A1","TOP",0, 2},dir="right",offset={3,0}
},{--载具
seq= "VK",anchor= {"TOPLEFT","D8","RIGHT",6, 0},size = 43
},{--姿态
seq= "S1",anchor= {"BOTTOMLEFT","C2","TOPLEFT",0, 3},size = 30
},{--宠物
seq= "PAP9P8P7P6P5P4P3P2P1",anchor= {"BOTTOMRIGHT","CB","TOPRIGHT",0, 3},dir = "left",offset = {-3, 0},size = 30
},{--主动作条上面那条的右边那条
seq= "C1C2C3C4C5C6C7C8C9CACBCC",anchor= {"BOTTOM","B1","TOP",0, 3},dir="right",offset={3,0}
},{--左侧上4个
seq= "E4E3E2E1",anchor= {"RIGHT","C1","LEFT",-10, 0},dir="left",offset={-3, 0}
},{--左侧中4个
seq= "E8E7E6E5",anchor= {"RIGHT","B1","LEFT",-10, 0},dir="left",offset={-3, 0}
},{--左侧下4个
seq= "ECEBEAE9",anchor= {"RIGHT","A1","LEFT",-10, 0},dir="left",offset={-3, 0}
},{--右侧上4个
seq= "D1D2D3D4",anchor= {"LEFT","CC","RIGHT",10, 0},dir="right",offset={3, 0}
},{--右侧中4个
seq= "D5D6D7D8",anchor= {"LEFT","BC","RIGHT",10, 0},dir="right",offset={3, 0}
},{--右侧下4个
seq= "D9DADBDC",anchor= {"LEFT","AC","RIGHT",10, 0},dir="right",offset={3, 0}
}
};
SlashCmdList["TU"] = function(msg, editBox)
    if InCombatLockdown() then
        print("|cff0080ff[TuBar]|r |cffff3333战斗中无法切换按键布局！|r")
        return
    end
    if msg and msg:len() > 0 then
        if msg == "list" then
            local str = "|cff0080ff[TuBar]|r 样式有"
            for k,v in ipairs(TuBarStyles) do
                print("------------")
                str=str.."<"..k.."> "
            end
            print(str)
        else
            --DEFAULT_CHAT_FRAME:AddMessage("|cff0080ff[TuBar]|r 加载样式<"..msg..">~")
            --ShiGuangPerDB.curStyle = msg
            loadLayout(msg)
        end
    else
        DEFAULT_CHAT_FRAME:AddMessage("|cff0080ff[TuBar]|r |cff00ff80语法:|r /tt <pve1 | pve2 | pve3 | 自定义样式名称>")
    end
end
SLASH_TU1 = "/TTB"

--[[
    简写说明：
    UI, 对应 UIParent
    VK, 对应 下载具按钮
    A1~AC,分别对应 ActionButton1-ActionButton12（主动作条，从左往右1-12）
    B1~BC,分别对应 MultiBarBottomLeftButton1-MultiBarBottomLeftButton12（主动作条上面那条，从左往右1-12）
    C1~CC,分别对应 MultiBarBottomRightButton1-MultiBarBottomRightButton12（主动作条右上那条，从左往右1-12）
    D1~DC,分别对应 MultiBarLeftButton1-MultiBarLeftButton12  （屏幕左右边2条中左边那条，从上往下1-12）
    E1~EC,分别对应 MultiBarRightButton1-MultiBarRightButton12（屏幕左右边2条中右边那条，从上往下1-12）
    P1~PA,分别对应 PetActionButton-PetActionButton10（宠物动作条，从左往右1-10）
    S1~S6,分别对应 StanceButton1-StanceButton6（姿态条，从左往右1-6）
]]
--示例，逗比飞行模式
TuBarStyles["fly"] = {
    {--	主动作条
        seq= "A1A2A3A4A5A6A7A8A9AAABAC",
        anchor= {"BOTTOM","UI","BOTTOM",-260,6},
        dir="right",
        offset={3,0}
    },{--主动作条上面那条
        seq= "BCBBBAB9B8B7B6B5B4B3B2B1",
        anchor= {"BOTTOM","A6","TOP",0, 8},
        dir="left",
        offset={-6,3}
    },{--主动作条上面那条
        seq= "C1C2C3C4C5C6C7C8C9CACBCC",
        anchor= {"BOTTOM","A7","TOP",0, 3},
        dir="right",
        offset={6,3}
    },{--下载具
        seq= "VK",
        anchor= {"BOTTOM","E1","TOP",0, 3},
        size = 32
    },{--姿态
        seq= "S1",
        anchor= {"BOTTOMLEFT","E2","TOPLEFT",0, 3},
        size = 30
    },{--宠物
        seq= "PAP9P8P7P6P5P4P3P2P1",
        anchor= {"BOTTOMRIGHT","EC","TOPRIGHT",0, 6},
        dir = "left",
        offset = {-3, 0},
        size = 30
    }
};
-- Buttonrange
hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
   if self.rangeTimer == TOOLTIP_UPDATE_TIME and self.action then
      local range = false
      if ( IsActionInRange(self.action) == false ) then
         _G[self:GetName().."Icon"]:SetVertexColor(1, 0, 0)
         _G[self:GetName().."NormalTexture"]:SetVertexColor(1, 0, 0)
         range = true
      end;
      if self.range ~= range and range == false then
         ActionButton_UpdateUsable(self)
      end;
      self.range = range
   end
end)
-- 技能栏切框
local btnBorderTex="Interface\\Addons\\_ShiGuang\\Media\\border"
for i=1,12 do
    for _,v in ipairs({"ActionButton","MultiBarBottomLeftButton","MultiBarBottomRightButton","MultiBarLeftButton","MultiBarRightButton","StanceButton"}) do  --[["PetActionButton",]]
        local btn = _G[v..i];if not btn then break;end
        btn.icon:SetTexCoord(.07, .93, .07, .93)
        btn:SetNormalTexture(btnBorderTex)
        btn:GetNormalTexture():SetTexture(btnBorderTex)
        btn:GetNormalTexture():SetAllPoints()
    end
end


--[[------------------------------X   HotSpotMicroMenu by Sojik X ------------------------------]]--
local Mainmenu = true

if Mainmenu then
local fmicro = CreateFrame("Frame","MicroMenuHolder",UIParent)

local MicroButtons = {
CharacterMicroButton, SpellbookMicroButton, TalentMicroButton,  -- Here's the names of the buttons.
AchievementMicroButton, QuestLogMicroButton, GuildMicroButton,            -- You can use them for lines 19 - 22.
LFDMicroButton, CollectionsMicroButton, EJMicroButton,  -- Don't change anything in this list though unless you
StoreMicroButton, MainMenuMicroButton,              -- don't want the WatchFrameCollapseExpandButton moved.
}

local function MoveMicroButtons(skinName)
	for _, menu in pairs(MicroButtons) do
		menu:SetParent(fmicro)
		menu:ClearAllPoints()
		menu:SetScale(0.75)
		menu:SetAlpha(0.8)
	end
	
	CharacterMicroButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMLEFT", 3, -5)
	EJMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, -25) 
	CollectionsMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 5)
	TalentMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 25+10) 
	LFDMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 50+15) 
	AchievementMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 75+20)
	SpellbookMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 100+25)
	GuildMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 125+30)
	QuestLogMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 175+35)
	StoreMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 200+40)
	MainMenuMicroButton:SetPoint("BOTTOMRIGHT", CharacterMicroButton, "TOPRIGHT", 0, 225+45)
	
end

fmicro:RegisterEvent("PLAYER_ENTERING_WORLD")
fmicro:SetScript("OnEvent", function()
	hooksecurefunc("UpdateMicroButtons", MoveMicroButtons)
	MoveMicroButtons()
end)
end

--------------------------------------CleanHotKey------------------------
NumberFontNormalSmallGray:SetFont(STANDARD_TEXT_FONT, 18, 'OUTLINE')
NumberFontNormalSmallGray:SetShadowColor(1, 1, 0, 1)
--------------------------------------ShotHotKey by sakaras------------------------
local function updatehotkey(self, actionButtonType) 
   local hotkey = _G[self:GetName() .. "HotKey"]  
   local ShotHotKeyText = hotkey:GetText() 

   ShotHotKeyText = string.gsub(ShotHotKeyText, '(s%-)', 'S') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(a%-)', 'A') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(c%-)', 'C') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Mouse Button )', 'M') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Middle Mouse)', 'M3') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Mouse Wheel Down)', 'MWD') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Mouse Wheel Up)', 'MWU') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, "(鼠标中键)", "M3") 
   ShotHotKeyText = string.gsub(ShotHotKeyText, "(鼠标滚轮向上滚动)", "▲") 
   ShotHotKeyText = string.gsub(ShotHotKeyText, "(鼠标滚轮向下滚动)", "▼") 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Num Pad )', '数') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Num Pad +)', '+') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, "(数字键盘 +)", "+") 
   ShotHotKeyText = string.gsub(ShotHotKeyText, "(数字键盘 %-)", "数") 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Page Up)', 'P↑') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Page Down)', 'P↓') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Spacebar)', '空') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Insert)', 'Ins') 
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(Delete)', 'Del')
   ShotHotKeyText = string.gsub(ShotHotKeyText, '(`)', '~')

   if hotkey:GetText() == _G["RANGE_INDICATOR"] then 
      hotkey:SetText("") 
   else 
      hotkey:SetText(ShotHotKeyText) 
   end 
end 
hooksecurefunc("ActionButton_OnEvent", function(self, event) if event == "PLAYER_ENTERING_WORLD" then ActionButton_UpdateHotkeys(self, self.buttonType) end end) 
hooksecurefunc("ActionButton_UpdateHotkeys", updatehotkey)
end