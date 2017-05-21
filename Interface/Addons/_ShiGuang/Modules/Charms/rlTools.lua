---------------------------------------------------- MAIN ADDON FRAME
local MAF=CreateFrame("Frame","MyParent",UIParent)
	MAF:SetSize(21,9)
	MAF:SetPoint("RIGHT", UIParent, "RIGHT", -66, 121)
	    MAF.texture = MAF:CreateTexture(nil, "ARTWORK") 
      MAF.texture:SetAllPoints(MAF) 
      MAF.texture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Wallpaper\\MaoR-UI")
	
	MAF:SetMovable(true)
	MAF:EnableMouse(true)
	MAF:RegisterForDrag("LeftButton")
	MAF:SetScript("OnDragStart", MAF.StartMoving)
	MAF:SetScript("OnDragStop", MAF.StopMovingOrSizing)
	
---------------------------------------------------- MARKS & FLARES
local MF=CreateFrame("Frame","MyParent",MAF)
	MF:SetSize(21,210)
	MF:SetPoint("TOP")

--Skull Marks Raid Marker 8 NO World Marker
local WMSkull = CreateFrame("BUTTON", "RaidMarker8Skull",MF, "SecureActionButtonTemplate")
     	WMSkull:SetSize(21,21)
     	WMSkull:SetPoint("TOP",0,-12)
     	WMSkull:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8.png")
	WMSkull:SetAlpha(0.5)
    	WMSkull:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMSkull:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMSkull:RegisterForClicks("AnyUp")
	
	WMSkull:SetAttribute("type","macro")
	WMSkull:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",8) end\n/wm [btn:2] 8')
	
	--Cross Marks Raid Marker 7 World Marker 4
local WMCross = CreateFrame("BUTTON", "WorldMarker4Cross",MF, "SecureActionButtonTemplate")
     	WMCross:SetSize(21,21)
     	WMCross:SetPoint("TOP",0,-37)
     	WMCross:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_7.png")
	WMCross:SetAlpha(0.5)
    	WMCross:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMCross:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMCross:RegisterForClicks("AnyUp")
	
	WMCross:SetAttribute("type","macro")
	WMCross:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",7) end\n/wm [btn:2] 4')
	
	--Square Marks Raid Marker 6 World Marker 1
local WMSquare = CreateFrame("BUTTON", "WorldMarker1Square",MF, "SecureActionButtonTemplate")
     	WMSquare:SetSize(21,21)
     	WMSquare:SetPoint("TOP",0,-62)
     	WMSquare:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_6.png")
	WMSquare:SetAlpha(0.5)
    	WMSquare:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMSquare:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMSquare:RegisterForClicks("AnyUp")
	
	WMSquare:SetAttribute("type","macro")
	WMSquare:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",6) end\n/wm [btn:2] 1')
	
	--Moon Marks Raid Marker 5 World Marker 7
local WMMoon = CreateFrame("BUTTON", "RaidMarker5Moon",MF, "SecureActionButtonTemplate")
     	WMMoon:SetSize(21,21)
     	WMMoon:SetPoint("TOP",0,-87)
     	WMMoon:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_5.png")
	WMMoon:SetAlpha(0.5)
    	WMMoon:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMMoon:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMMoon:RegisterForClicks("AnyUp")
	
	WMMoon:SetAttribute("type","macro")
	WMMoon:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",5) end\n/wm [btn:2] 7')
	
	--Triangle Marks Raid Marker 4 World Marker 2
local WMTriangle = CreateFrame("BUTTON", "WorldMarker2Triangle",MF, "SecureActionButtonTemplate")
     	WMTriangle:SetSize(21,21)
     	WMTriangle:SetPoint("TOP",0,-112)
     	WMTriangle:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_4.png")
	WMTriangle:SetAlpha(0.5)
    	WMTriangle:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMTriangle:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMTriangle:RegisterForClicks("AnyUp")
	
	WMTriangle:SetAttribute("type","macro")
	WMTriangle:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",4) end\n/wm [btn:2] 2')
	
	--Diamond Marks Raid Marker 3 World Marker 3
local WMDiamond = CreateFrame("BUTTON", "WorldMarker3Diamond",MF, "SecureActionButtonTemplate")
     	WMDiamond:SetSize(21,21)
     	WMDiamond:SetPoint("TOP",0,-137)
     	WMDiamond:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_3.png")
	WMDiamond:SetAlpha(0.5)
    	WMDiamond:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMDiamond:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMDiamond:RegisterForClicks("AnyUp")
	
	WMDiamond:SetAttribute("type","macro")
	WMDiamond:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",3) end\n/wm [btn:2] 3')
	
	--Circle Marks Raid Marker 2 World Marker 6
local WMCircle = CreateFrame("BUTTON", "RaidMarker2Circle",MF, "SecureActionButtonTemplate")
     	WMCircle:SetSize(21,21)
     	WMCircle:SetPoint("TOP",0,-162)
     	WMCircle:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_2.png")
	WMCircle:SetAlpha(0.5)
    	WMCircle:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMCircle:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMCircle:RegisterForClicks("AnyUp")
	
	WMCircle:SetAttribute("type","macro")
	WMCircle:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",2) end\n/wm [btn:2] 6')

--Star Marks Raid Marker 1 World Marker 5
local WMStar = CreateFrame("BUTTON", "WorldMarker5Star",MF, "SecureActionButtonTemplate")
     	WMStar:SetSize(21,21)
     	WMStar:SetPoint("TOP",0,-187)
     	WMStar:SetNormalTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_1.png")
	WMStar:SetAlpha(0.5)
    	WMStar:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMStar:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMStar:RegisterForClicks("AnyUp")
	
	WMStar:SetAttribute("type","macro")
	WMStar:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",1) end\n/wm [btn:2] 5')
	
	--Clear Marks Raid Marker 0 World Marker 6
local WMClear = CreateFrame("BUTTON", "WorldMarker6Clear",MF, "SecureActionButtonTemplate")
     	WMClear:SetSize(21,21)
     	WMClear:SetPoint("TOP",0,-310)
     	WMClear:SetNormalTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
	WMClear:SetAlpha(0.5)
    	WMClear:SetScript("OnEnter", function(self)
		self:SetAlpha(1)
	end)
    	WMClear:SetScript("OnLeave", function(self)
		self:SetAlpha(0.5)
	end)
	WMClear:RegisterForClicks("AnyUp")
	
	WMClear:SetAttribute("type","macro")
	WMClear:SetAttribute("macrotext","/tm [btn:1] 0\n/cwm [btn:2] 0")
	
	---------------------------------------------------- READY CHECK
local RC = CreateFrame("Button", "READY CHECK", MAF, "SecureActionButtonTemplate")
	RC:SetPoint("TOP",0,-222)
	RC:SetSize(21,21)
	RC:SetNormalTexture("Interface\\Addons\\_ShiGuang\\Media\\Emotes\\okay")
	
	RC:SetAlpha(0.43)
    	RC:SetScript("OnEnter", function(self)
		RC:SetAlpha(1)
	end)
    	RC:SetScript("OnLeave", function(self)
		RC:SetAlpha(0.43)
	end)
	RC:RegisterForClicks("LeftButtonUp")
	
	RC:SetAttribute("type","macro")
	RC:SetAttribute("macrotext",'/script DoReadyCheck()')
	
---------------------------------------------------- ROLE POLL
local RP = CreateFrame("Button", "ROLE POLL", MAF, "SecureActionButtonTemplate")
	RP:SetPoint("TOP",0,-242)
	RP:SetSize(21,21)
  RP:SetNormalTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\DAMAGER")
	
	RP:SetAlpha(0.43)
    	RP:SetScript("OnEnter", function(self)
		RP:SetAlpha(1)
	end)
    	RP:SetScript("OnLeave", function(self)
		RP:SetAlpha(0.43)
	end)
	RP:RegisterForClicks("LeftButtonUp")
	
	RP:SetAttribute("type","macro")
	RP:SetAttribute("macrotext",'/script InitiateRolePoll()')
	
	---------------------------------------------------- FlaskFood
local FF = CreateFrame("Button", "FLASK FODOD", MAF, "SecureActionButtonTemplate")
	FF:SetPoint("TOP",0,-262)
	FF:SetSize(21,21)
	FF:SetNormalTexture("Interface\\GossipFrame\\TaxiGossipIcon")
		--RP:SetText("※")
	FF:SetAlpha(0.43)
    	FF:SetScript("OnEnter", function(self)
		FF:SetAlpha(1)
	end)
    	FF:SetScript("OnLeave", function(self)
		FF:SetAlpha(0.43)
	end)
	FF:RegisterForClicks("LeftButtonUp")
	
	FF:SetAttribute("type","macro")
	FF:SetAttribute("macrotext",'/hj')
	---------------------------------------------------- PullTimer
local PT = CreateFrame("Button", "PULL TIMER", MAF, "SecureActionButtonTemplate")
	PT:SetPoint("TOP",0,-282)
	PT:SetSize(21,21)
	PT:SetNormalTexture("Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex")
	
	PT:SetAlpha(0.43)
    	PT:SetScript("OnEnter", function(self)
		PT:SetAlpha(1)
	end)
    	PT:SetScript("OnLeave", function(self)
		PT:SetAlpha(0.43)
	end)
	PT:RegisterForClicks("LeftButtonUp")
	
	PT:SetAttribute("type","macro")
	PT:SetAttribute("macrotext",'/dbm pull 8')	
----------------------------------------------------Automatically show/hide the frame if we have RaidLeader or RaidOfficer
local function CheckRaidStatus()
	local inInstance, instanceType = IsInInstance()
	if ((IsInGroup() and not IsInRaid()) or UnitIsGroupLeader('player') or UnitIsGroupAssistant("player")) and not (inInstance and (instanceType == "pvp" or instanceType == "arena")) then
		return true
	else
		return false
	end
end

local function eventHandler(self, event, ...)
if InCombatLockdown() then
		MAF:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	end

	if CheckRaidStatus() then MAF:Show() else MAF:Hide() end

	if event == "PLAYER_REGEN_ENABLED" then
		MAF:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
end

MAF:RegisterEvent("GROUP_ROSTER_UPDATE")
MAF:RegisterEvent("PLAYER_ENTERING_WORLD")
MAF:SetScript("OnEvent", eventHandler);