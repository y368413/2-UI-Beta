local _, ns = ...
local M, R, U, I = unpack(ns)
--------------------------------------------------------------------------------------- DejaAutoMark ## Authors: Dejablue
local TankHealerMarkFrame = CreateFrame("Frame", "TankHealerMarkFrame")
TankHealerMarkFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
TankHealerMarkFrame:RegisterEvent("GROUP_ROSTER_UPDATE")
TankHealerMarkFrame:RegisterEvent("INSPECT_READY")

TankHealerMarkFrame:SetScript("OnEvent", function(self, event, ...)
    if not MaoRUISettingDB["Misc"]["AutoMark"] then return end
	if IsInRaid() then return
	elseif IsInGroup() then
		local ROLEMARKS={["TANK"]=2,["HEALER"]=5}
		for i=1,5 do 
			local role=UnitGroupRolesAssigned("party"..i)
			if ROLEMARKS[role]then 
				SetRaidTarget("party"..i,ROLEMARKS[role])
				--print(i, role)
			end 
		end
		local currentSpecID, currentSpecName = GetSpecializationInfo(GetSpecialization())
		--print("Your current spec:", currentSpecName)
		--print("Your current spec ID:", currentSpecID)
		local roleToken = GetSpecializationRoleByID(currentSpecID)
		--print(roleToken)
		if ROLEMARKS[roleToken]then SetRaidTarget("player", ROLEMARKS[roleToken]) end
	else SetRaidTarget("player", 0) end
end)


--[[----------------------------------------------------------------------BattleRes  ## Version: 1.1  ## Author: fyhcslb
local BattleRes = CreateFrame("Frame", "BattleResFrame", UIParent)
BattleRes:SetFrameStrata("BACKGROUND")
BattleRes:SetSize(120, 12)
BattleRes:SetBackdrop({bgFile = "Interface\\Tooltips\\UI-Tooltip-Background"})
BattleRes:SetBackdropColor(0.2, 0.2, 0.2, 0.7)
BattleRes:SetPoint("TOPLEFT", UIParent, 410, -2)
BattleRes:EnableMouse(true)
BattleRes:SetMovable(true)
BattleRes:SetUserPlaced(true)
BattleRes:SetClampedToScreen(true)
BattleRes:Hide()
BattleRes:SetScript("OnMouseDown", function(self, button) self:StartMoving() end)
BattleRes:SetScript("OnMouseUp", function(self, button) self:StopMovingOrSizing() end)

local font, height, flag = SystemFont_Small:GetFont()
BattleRes:CreateFontString(nil, "ARTWORK"):SetFont(font, height, "OUTLINE")
BattleRes:CreateFontString(nil, "ARTWORK"):SetFont(font, height, "OUTLINE")
BattleRes:CreateFontString(nil, "ARTWORK"):SetJustifyH("LEFT")
BattleRes:CreateFontString(nil, "ARTWORK"):SetJustifyH("RIGHT")
BattleRes:CreateFontString(nil, "ARTWORK"):SetPoint("BOTTOMLEFT",0, 2)
BattleRes:CreateFontString(nil, "ARTWORK"):SetPoint("BOTTOMRIGHT",0, 2)
BattleRes:CreateFontString(nil, "ARTWORK"):SetText("|cffff00000|r")
BattleRes:CreateFontString(nil, "ARTWORK"):SetText("")

local total = 0
local isMovable = false
BattleRes:SetScript("OnUpdate", function(self, elapsed)
	if isMovable then return end --设置位置
	total = total + elapsed
	if total > 0.3 then total = 0
		local charges, _, started, duration = GetSpellCharges(20484)
		if not charges then
			-- hide out of encounter
			BattleRes:Hide()
			BattleRes:RegisterEvent("SPELL_UPDATE_CHARGES")
			return
		end
		local color = (charges > 0) and "|cffffffff" or "|cffff0000"
		local remaining = duration - (GetTime() - started)
		local m = floor(remaining / 60)
		local s = mod(remaining, 60)

		BattleRes:CreateFontString(nil, "ARTWORK"):SetText(("|cffffffff%d:%02d|r"):format(m, s))
		BattleRes:CreateFontString(nil, "ARTWORK"):SetText(("%s%d|r"):format(color, charges))
		BattleRes:SetMinMaxValues(0, duration)
		BattleRes:SetValue(duration - remaining)

	end
end)

function BattleRes:SPELL_UPDATE_CHARGES()
	local charges = GetSpellCharges(20484)
	if charges then
		self:UnregisterEvent("SPELL_UPDATE_CHARGES")
		--self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		isMovable = false
		self:Show()
	end
end

function BattleRes:PLAYER_ENTERING_WORLD()
	self:UnregisterEvent("SPELL_UPDATE_CHARGES")
	self:Hide()
	local _, instanceType, difficulty = GetInstanceInfo()
	-- raid
	if instanceType == "raid" then
		if IsEncounterInProgress() then self:Show() --如果 上线时/重载界面后 已在boss战中
		else self:RegisterEvent("SPELL_UPDATE_CHARGES")
		end
	end
	if difficulty == 8 then self:Show() end	-- challenge mode
end

function BattleRes:CHALLENGE_MODE_START() self:Show() end

BattleRes:RegisterEvent("PLAYER_ENTERING_WORLD")
BattleRes:RegisterEvent("CHALLENGE_MODE_START")
BattleRes:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)

------------------------------- Slash-----------------------------
SLASH_BATTLERES1, SLASH_BATTLERES2 = '/br', '/battleres'
function SlashCmdList.BATTLERES(msg, editbox)
	if BattleRes:IsShown() then
		BattleRes:Hide()
		isMovable = false
	else
		isMovable = true
		BattleRes:Show()
	end
end]]