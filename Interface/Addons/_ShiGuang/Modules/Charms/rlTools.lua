---------------------------------------------------- MAIN ADDON FRAME
local MAF=CreateFrame("Frame","MyParent",UIParent)
	MAF:SetSize(21,21)
	MAF:SetPoint("RIGHT", UIParent, "RIGHT", -66, 121)
  MAF:SetAlpha(0.6)
	MAF:SetBackdrop({bgFile = "Interface\\AddOns\\_ShiGuang\\Media\\Hexagon"})
	MAF:SetBackdropColor(RAID_CLASS_COLORS[select(2, UnitClass("player"))].r, RAID_CLASS_COLORS[select(2, UnitClass("player"))].g, RAID_CLASS_COLORS[select(2, UnitClass("player"))].b)
	MAF:SetMovable(true)
	MAF:EnableMouse(true)
	MAF:RegisterForDrag("LeftButton")
	MAF:SetScript("OnDragStart", MAF.StartMoving)
	MAF:SetScript("OnDragStop", MAF.StopMovingOrSizing)
	MAF:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(MAF, "ANCHOR_TOP")
	GameTooltip:AddLine("点我拖动", 1,2,0)
	GameTooltip:AddLine("左击-标记.右击-光柱", 0,6,6)
	GameTooltip:Show()
	end)
  MAF:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	
---------------------------------------------------- MARKS & FLARES
local function CreatMarkerButton(id, parent, Texture, w, h, ap, frame, rp, x, y, alpha)
		local Markerbutton = CreateFrame("Button", id, parent, "SecureActionButtonTemplate")
		Markerbutton:SetWidth(w)
		Markerbutton:SetHeight(h)
		Markerbutton:SetPoint(ap, frame, rp, x, y)
		Markerbutton:SetNormalTexture(Texture)
		Markerbutton:SetAlpha(alpha)
		return Markerbutton
end
	
--Skull Marks Raid Marker 8 NO World Marker
  WMSkull = CreatMarkerButton("RaidMarker8Skull", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_8.png", 21, 21, "TOP", MAF, "BOTTOM", 0, 0, 0.5)
  WMSkull:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMSkull:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMSkull:RegisterForClicks("AnyUp")
	WMSkull:SetAttribute("type","macro")
	WMSkull:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",8) end\n/wm [btn:2] 8')
	
--Cross Marks Raid Marker 7 World Marker 4
	WMCross = CreatMarkerButton("RaidMarker7Cross", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_7.png", 21, 21, "TOP", WMSkull, "BOTTOM", 0, -5, 0.5)
  WMCross:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMCross:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMCross:RegisterForClicks("AnyUp")
	WMCross:SetAttribute("type","macro")
	WMCross:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",7) end\n/wm [btn:2] 4')
	
--Square Marks Raid Marker 6 World Marker 1
  WMSquare = CreatMarkerButton("RaidMarker6Square", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_6.png", 21, 21, "TOP", WMCross, "BOTTOM", 0, -5, 0.5)
  WMSquare:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMSquare:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMSquare:RegisterForClicks("AnyUp")
	WMSquare:SetAttribute("type","macro")
	WMSquare:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",6) end\n/wm [btn:2] 1')
	
--Moon Marks Raid Marker 5 World Marker 7
  WMMoon = CreatMarkerButton("RaidMarker5Moon", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_5.png", 21, 21, "TOP", WMSquare, "BOTTOM", 0, -5, 0.5)
  WMMoon:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMMoon:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMMoon:RegisterForClicks("AnyUp")
	WMMoon:SetAttribute("type","macro")
	WMMoon:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",5) end\n/wm [btn:2] 7')
	
--Triangle Marks Raid Marker 4 World Marker 2
  WMTriangle = CreatMarkerButton("RaidMarker4Triangle", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_4.png", 21, 21, "TOP", WMMoon, "BOTTOM", 0, -5, 0.5)
	WMTriangle:SetAlpha(0.5) WMTriangle:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMTriangle:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMTriangle:RegisterForClicks("AnyUp")
	WMTriangle:SetAttribute("type","macro")
	WMTriangle:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",4) end\n/wm [btn:2] 2')
	
--Diamond Marks Raid Marker 3 World Marker 3
  WMDiamond = CreatMarkerButton("RaidMarker3Diamond", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_3.png", 21, 21, "TOP", WMTriangle, "BOTTOM", 0, -5, 0.5)
	WMDiamond:SetAlpha(0.5) WMDiamond:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMDiamond:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMDiamond:RegisterForClicks("AnyUp")
	WMDiamond:SetAttribute("type","macro")
	WMDiamond:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",3) end\n/wm [btn:2] 3')
	
--Circle Marks Raid Marker 2 World Marker 6
  WMCircle = CreatMarkerButton("RaidMarker2Circle", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_2.png", 21, 21, "TOP", WMDiamond, "BOTTOM", 0, -5, 0.5)
	WMCircle:SetAlpha(0.5) WMCircle:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMCircle:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMCircle:RegisterForClicks("AnyUp")
	WMCircle:SetAttribute("type","macro")
	WMCircle:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",2) end\n/wm [btn:2] 6')

--Star Marks Raid Marker 1 World Marker 5
  WMStar = CreatMarkerButton("RaidMarker1Star", MAF, "Interface\\TargetingFrame\\UI-RaidTargetingIcon_1.png", 21, 21, "TOP", WMCircle, "BOTTOM", 0, -5, 0.5)
	WMStar:SetAlpha(0.5) WMStar:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMStar:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMStar:RegisterForClicks("AnyUp")
	WMStar:SetAttribute("type","macro")
	WMStar:SetAttribute("macrotext",'/run if SecureCmdOptionParse("[btn:1]") then SetRaidTargetIcon("target",1) end\n/wm [btn:2] 5')
	
--Clear Marks Raid Marker 0 World Marker 6
	WMClear = CreatMarkerButton("WorldMarker6Clear", MAF, "Interface\\BUTTONS\\UI-GroupLoot-Pass-Up", 21, 21, "TOP", WMStar, "BOTTOM", 0, -5, 0.5)
  WMClear:SetScript("OnEnter", function(self) self:SetAlpha(1) end)
  WMClear:SetScript("OnLeave", function(self) self:SetAlpha(0.5) end)
	WMClear:RegisterForClicks("AnyUp")
	WMClear:SetAttribute("type","macro")
	WMClear:SetAttribute("macrotext","/tm [btn:1] 0\n/cwm [btn:2] 0")
	
---------------------------------------------------- READY CHECK
	RC = CreatMarkerButton("READYCHECK", MAF, "Interface\\Addons\\_ShiGuang\\Media\\Emotes\\okay", 21, 21, "TOP", WMClear, "BOTTOM", 0, -11, 0.43)
	RC:SetScript("OnEnter", function(self) RC:SetAlpha(1) end)
  RC:SetScript("OnLeave", function(self) RC:SetAlpha(0.43) end)
	RC:RegisterForClicks("LeftButtonUp")
	RC:SetAttribute("type","macro")
	RC:SetAttribute("macrotext",'/script DoReadyCheck()')
	RC:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(RC, "ANCHOR_TOP")
	GameTooltip:AddLine("就位确认", 1,2,0)
	GameTooltip:Show()
	end)
  RC:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	
---------------------------------------------------- ROLE POLL
  RP = CreatMarkerButton("ROLEPOLL", MAF, "Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\DAMAGER", 21, 21, "TOP", RC, "BOTTOM", 0, -3, 0.43)
	RP:SetScript("OnEnter", function(self) RP:SetAlpha(1) end)
  RP:SetScript("OnLeave", function(self) RP:SetAlpha(0.43) end)
	RP:RegisterForClicks("LeftButtonUp")
	RP:SetAttribute("type","macro")
	RP:SetAttribute("macrotext",'/script InitiateRolePoll()')
	RP:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(RP, "ANCHOR_TOP")
	GameTooltip:AddLine("职责确认", 1,2,0)
	GameTooltip:Show()
	end)
  RP:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
	
---------------------------------------------------- FlaskFood  --RP:SetText("※")
	FF = CreatMarkerButton("FLASKFOOD", MAF, "Interface\\GossipFrame\\TaxiGossipIcon", 21, 21, "TOP", RP, "BOTTOM", 0, -3, 0.43)
  FF:SetScript("OnEnter", function(self) FF:SetAlpha(1) end)
  FF:SetScript("OnLeave", function(self) FF:SetAlpha(0.43) end)
	FF:RegisterForClicks("LeftButtonUp")
	FF:SetAttribute("type","macro")
	FF:SetAttribute("macrotext",'/hj')
	FF:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(FF, "ANCHOR_TOP")
	GameTooltip:AddLine("检查食物", 1,2,0)
	GameTooltip:Show()
	end)
  FF:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
  
---------------------------------------------------- PullTimer
	PT = CreatMarkerButton("FLASKFOOD", MAF, "Interface\\Addons\\_ShiGuang\\Media\\Modules\\Role\\bubbleTex", 21, 21, "TOP", FF, "BOTTOM", 0, -3, 0.43)
  PT:SetScript("OnEnter", function(self) PT:SetAlpha(1) end)
  PT:SetScript("OnLeave", function(self) PT:SetAlpha(0.43) end)
	PT:RegisterForClicks("LeftButtonUp")
	PT:SetAttribute("type","macro")
	PT:SetAttribute("macrotext",'/dbm pull 8')
	PT:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(PT, "ANCHOR_TOP")
	GameTooltip:AddLine("DBM倒数", 1,2,0)
	GameTooltip:Show()
	end)
  PT:SetScript("OnLeave", function(self) GameTooltip:Hide() end)
  	
---------------------------------------------------- Automatically show/hide the frame if we have RaidLeader or RaidOfficer
local function CheckRaidStatus()
	local inInstance, instanceType = IsInInstance()
	if ((IsInGroup() and not IsInRaid()) or UnitIsGroupLeader('player') or UnitIsGroupAssistant("player")) and not (inInstance and (instanceType == "pvp" or instanceType == "arena")) then return true else return false end
end
local function eventHandler(self, event, ...)
if InCombatLockdown() then MAF:RegisterEvent("PLAYER_REGEN_ENABLED") return end
if CheckRaidStatus() then MAF:Show() else MAF:Hide() end
if event == "PLAYER_REGEN_ENABLED" then MAF:UnregisterEvent("PLAYER_REGEN_ENABLED") end
end
MAF:RegisterEvent("GROUP_ROSTER_UPDATE")
MAF:RegisterEvent("PLAYER_ENTERING_WORLD")
MAF:SetScript("OnEvent", eventHandler);