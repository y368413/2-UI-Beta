local _, ns = ...
local M, R, U, I = unpack(ns)
local module = M:GetModule("Misc")

--[[
	SoloInfo是一个告知你当前副本难度的小工具，防止我有时候单刷时进错难度了。
	instList左侧是副本ID，你可以使用"/getid"命令来获取当前副本的ID；右侧的是副本难度，常用的一般是：2为5H，4为25普通，6为25H。
]]
function module:SoloInfo()
	if not MaoRUISettingDB["Misc"]["SoloInfo"] then return end

	local instList = {
		[556] = 2,		-- 塞塔克大厅，乌鸦
		[575] = 2,		-- 乌特加德之巅，蓝龙
		[585] = 2,		-- 魔导师平台，白鸡
		--[603] = 4,		-- 奥杜尔，飞机头
		[631] = 6,		-- 冰冠堡垒，无敌
	}

	local f = CreateFrame("Frame", nil, UIParent)
	f:SetPoint("CENTER", UIParent, "CENTER", 0, 120)
	f:SetSize(150, 70)
	f:Hide()
	M.CreateBD(f)
	M.CreateTex(f)
	f.Text = M.CreateFS(f, 12, "")
	f.Text:SetWordWrap(true)
	f:SetScript("OnMouseUp", function() f:Hide() end)

	local function updateAlert()
		local name, _, instType, diffname, _, _, _, id = GetInstanceInfo()
		if IsInInstance() and instType ~= 24 then
			if instList[id] and instList[id] ~= instType then
				f:Show()
				f.Text:SetText(I.InfoColor..name..I.MyColor.."\n( "..diffname.." )\n\n"..I.InfoColor.."^-^")
			else
				f:Hide()
			end
		else
			f:Hide()
		end
	end
	M:RegisterEvent("ZONE_CHANGED_NEW_AREA", updateAlert)
	M:RegisterEvent("PLAYER_DIFFICULTY_CHANGED", updateAlert)
	M:RegisterEvent("PLAYER_ENTERING_WORLD", updateAlert)
end

-- 发现稀有/事件时的通报插件
function module:RareAlert()
	if not MaoRUISettingDB["Misc"]["RareAlerter"] then return end
	local cache = {}
	local function updateAlert(_, id)
		if id and not cache[id] then
			local info = C_VignetteInfo.GetVignetteInfo(id)
			if not info then return end
			local filename, width, height, txLeft, txRight, txTop, txBottom = GetAtlasInfo(info.atlasName)
			if not filename then return end
			local atlasWidth = width/(txRight-txLeft)
			local atlasHeight = height/(txBottom-txTop)
			local tex = string.format("|T%s:%d:%d:0:0:%d:%d:%d:%d:%d:%d|t", filename, 0, 0, atlasWidth, atlasHeight, atlasWidth*txLeft, atlasWidth*txRight, atlasHeight*txTop, atlasHeight*txBottom)
			RaidNotice_AddMessage(RaidWarningFrame, "----------   "..tex..(info.name or "").."   ----------", ChatTypeInfo["RAID_WARNING"])
			if MaoRUISettingDB["Misc"]["AlertinChat"] then
				print("  -> "..I.InfoColor.." → "..tex..(info.name or ""))
			end
			PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\Dadongda.ogg", "Master")
			cache[id] = true
		end
		if #cache > 666 then wipe(cache) end
	end
	M:RegisterEvent("VIGNETTE_MINIMAP_UPDATED", updateAlert)
end


--快速设置焦点
function module:Focuser()
	if not MaoRUISettingDB["Misc"]["Focuser"] then return end

	local modifier = "shift" -- shift, alt or ctrl
	local mouseButton = "1" -- 1 = left, 2 = right, 3 = middle, 4 and 5 = thumb buttons if there are any
	local pending = {}

	local function SetFocusHotkey(frame)
		if not frame or frame.focuser then return end

		if not InCombatLockdown() then
			frame:SetAttribute(modifier.."-type"..mouseButton, "focus")
			frame.focuser = true
			pending[frame] = nil
		else
			pending[frame] = true
		end
	end

	local function CreateFrame_Hook(_, name, _, template)
		if name and template == "SecureUnitButtonTemplate" then
			SetFocusHotkey(_G[name])
		end
	end
	hooksecurefunc("CreateFrame", CreateFrame_Hook)

	-- Keybinding override so that models can be shift/alt/ctrl+clicked
	local Keybindings = CreateFrame("CheckButton", "FocuserButton", UIParent, "SecureActionButtonTemplate")
	Keybindings:SetAttribute("type1", "macro")
	Keybindings:SetAttribute("macrotext", "/focus mouseover")
	SetOverrideBindingClick(FocuserButton, true, modifier.."-BUTTON"..mouseButton, "FocuserButton")
  -- Set the keybindings on the default unit frames since we won't get any CreateFrame notification about them
  local duf = {
	PlayerFrame,
	PetFrame,
	PartyMemberFrame1,
	PartyMemberFrame2,
	PartyMemberFrame3,
	PartyMemberFrame4,
	PartyMemberFrame1PetFrame,
	PartyMemberFrame2PetFrame,
	PartyMemberFrame3PetFrame,
	PartyMemberFrame4PetFrame,
	TargetFrame,
	TargetofTargetFrame,
  }
	local function setupHotkey(event)
		if event == "PLAYER_REGEN_ENABLED" then
			for frame in pairs(pending) do
				SetFocusHotkey(frame)
			end
		else
		  for i,frame in pairs(duf) do 
		    SetFocusHotkey(frame)
		  end
		end
	end
	M:RegisterEvent("PLAYER_REGEN_ENABLED", setupHotkey)
	M:RegisterEvent("GROUP_ROSTER_UPDATE", setupHotkey)
	M:RegisterEvent("PLAYER_ENTERING_WORLD", setupHotkey)
end

function module:EXPTracker()
	-- Create Frame
	local ExpFrame = CreateFrame("Frame", nil, UIParent)
	ExpFrame:SetSize(210,60)
	ExpFrame:SetPoint("LEFT", UIParent, "LEFT",8,-210)
	-- Drag&Drop
	ExpFrame:SetMovable(true)
	ExpFrame:EnableMouse(true)
	ExpFrame:RegisterForDrag("LeftButton")
	ExpFrame:SetScript("OnDragStart", ExpFrame.StartMoving)
	ExpFrame:SetScript("OnDragStop", ExpFrame.StopMovingOrSizing)
	ExpFrame:SetUserPlaced(true)
	-- Create Lv
	ExpFrame.level = ExpFrame:CreateFontString(nil, "Overlyay")
	ExpFrame.level:SetPoint("LEFT", ExpFrame,"LEFT",10,12)
	ExpFrame.level:SetFontObject("GameFontHighlight")
	-- Create Pre
	ExpFrame.Pre = ExpFrame:CreateFontString(nil, "Overlyay")
	ExpFrame.Pre:SetPoint("LEFT", ExpFrame.level,"RIGHT",8,0)
	ExpFrame.Pre:SetFontObject("GameFontHighlight")
	-- Create Next
	ExpFrame.Next = ExpFrame:CreateFontString(nil, "Overlyay")
	ExpFrame.Next:SetPoint("LEFT", ExpFrame,"LEFT",10,-3)
	ExpFrame.Next:SetFontObject("GameFontHighlight")
	-- Create Rest
	ExpFrame.Rest = ExpFrame:CreateFontString(nil, "Overlyay")
	ExpFrame.Rest:SetPoint("LEFT", ExpFrame,"LEFT",10,-16)
	ExpFrame.Rest:SetFontObject("GameFontHighlight")

  local function showIfResting() if (IsResting("player") or FALSE) then return "+" end return "" end

  local function showRestAmount() if (GetXPExhaustion("player") or FALSE) then return math.ceil(100*(GetXPExhaustion("player")/UnitXPMax("player"))) end return "0" end

  local function updateFrame()
  if not MaoRUISettingDB["Misc"]["EXPTracker"] then return end
  if (UnitLevel("player") >= 120) then return end
	ExpFrame.level:SetText( GUILD_RECRUITMENT_LEVEL .. ": ".. UnitLevel("player"))
	ExpFrame.Pre:SetText(math.floor(100*(UnitXP("player")/UnitXPMax("player"))) .. "%")
	ExpFrame.Next:SetText( GARRISON_FOLLOWER_XP_STRING .. ": "..	UnitXPMax("player")-UnitXP("player"))
	ExpFrame.Rest:SetText( BUFFER_DOUBLE .. ": ".. showRestAmount() .. "%" .. showIfResting())
  end
	M:RegisterEvent("PLAYER_ENTERING_WORLD", updateFrame)
	M:RegisterEvent("PLAYER_XP_UPDATE", updateFrame)
	M:RegisterEvent("PLAYER_LEVEL_UP", updateFrame)
	M:RegisterEvent("ENABLE_XP_GAIN", updateFrame)
	M:RegisterEvent("DISABLE_XP_GAIN", updateFrame)
	M:RegisterEvent("UPDATE_EXHAUSTION", updateFrame)
end