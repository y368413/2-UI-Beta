local _, ns = ...
local M, R, U, I = unpack(ns)

-- Frame Mover
local MoverList, BackupTable, f = {}, {}
M.Mover = function(Frame, Text, key, Pos, w, h)
	if not MaoRUISettingDB["Mover"] then MaoRUISettingDB["Mover"] = {} end
	local Mover = CreateFrame("Frame", nil, UIParent)
	Mover:SetWidth(w or Frame:GetWidth())
	Mover:SetHeight(h or Frame:GetHeight())
	M.CreateBD(Mover)
	M.CreateSD(Mover)
	M.CreateTex(Mover)
	M.CreateFS(Mover, I.Font[2], Text)
	tinsert(MoverList, Mover)

	if not MaoRUISettingDB["Mover"][key] then 
		Mover:SetPoint(unpack(Pos))
	else
		Mover:SetPoint(unpack(MaoRUISettingDB["Mover"][key]))
	end
	Mover:EnableMouse(true)
	Mover:SetMovable(true)
	Mover:SetClampedToScreen(true)
	Mover:SetFrameStrata("HIGH")
	Mover:RegisterForDrag("LeftButton")
	Mover:SetScript("OnDragStart", function(self) self:StartMoving() end)
	Mover:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		local orig, _, tar, x, y = self:GetPoint()
		MaoRUISettingDB["Mover"][key] = {orig, "UIParent", tar, x, y}
	end)
	Mover:Hide()
	Frame:SetPoint("TOPLEFT", Mover)

	return Mover
end

local function UnlockElements()
	for i = 1, #MoverList do
		local mover = MoverList[i]
		if not mover:IsShown() then
			mover:Show()
		end
	end
	M.CopyTable(MaoRUISettingDB["Mover"], BackupTable)
	f:Show()
end

local function LockElements()
	for i = 1, #MoverList do
		local mover = MoverList[i]
		mover:Hide()
	end
	f:Hide()
	SlashCmdList.AuraWatch("lock")
end

StaticPopupDialogs["RESET_MOVER"] = {
	text = "你确定重置所有面板的位置吗？",
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		wipe(MaoRUISettingDB["Mover"])
		ReloadUI()
	end,
}

StaticPopupDialogs["CANCEL_MOVER"] = {
	text = "你确定取消本次的操作吗？",
	button1 = OKAY,
	button2 = CANCEL,
	OnAccept = function()
		M.CopyTable(BackupTable, MaoRUISettingDB["Mover"])
		ReloadUI()
	end,
}

-- Mover Console
local function CreateConsole()
	if f then return end

	f = CreateFrame("Frame", nil, UIParent)
	f:SetPoint("TOP", 0, -150)
	f:SetSize(296, 65)
	M.CreateBD(f)
	M.CreateSD(f)
	M.CreateTex(f)
	M.CreateMF(f)
	local lable = M.CreateFS(f, 15, "面板移动控制", false, "TOP", 0, -10)
	lable:SetTextColor(1, .8, 0)
	local bu, text = {}, {LOCK, CANCEL, "网格", RESET}
	for i = 1, 4 do
		bu[i] = M.CreateButton(f, 70, 28, text[i])
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", 5, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 2, 0)
		end
	end

	-- Lock
	bu[1]:SetScript("OnClick", LockElements)
	-- Cancel
	bu[2]:SetScript("OnClick", function()
		StaticPopup_Show("CANCEL_MOVER")
	end)
	-- Grids
	bu[3]:SetScript("OnClick", function()
		sendCmd("/align") --SlashCmdList["TOGGLEGRID"]("32")
	end)
	-- Reset
	bu[4]:SetScript("OnClick", function()
		StaticPopup_Show("RESET_MOVER")
	end)

	do
		local frame = CreateFrame("Frame", nil, f)
		frame:SetPoint("TOP", f, "BOTTOM")
		frame:SetSize(296, 65)
		M.CreateBD(frame)
		M.CreateSD(frame)
		M.CreateTex(frame)
		local lable = M.CreateFS(frame, 15, MINIMAP_MENU_AURACONFIG, false, "TOP", 0, -10)
		lable:SetTextColor(1, .8, 0)

		local bu, text = {}, {UNLOCK, LOCK, RESET}
		for i = 1, 3 do
			bu[i] = M.CreateButton(frame, 94, 28, text[i])
			if i == 1 then
				bu[i]:SetPoint("BOTTOMLEFT", 5, 5)
			else
				bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 2, 0)
			end
		end
		-- UNLOCK
		bu[1]:SetScript("OnClick", function()
			SlashCmdList.AuraWatch("move")
		end)
		-- Lock
		bu[2]:SetScript("OnClick", LockElements)
		-- RESET
		bu[3]:SetScript("OnClick", function()
			StaticPopup_Show("RESET_AURAWATCH_MOVER")
		end)
	end

	local function showLater(event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				LockElements()
				M:RegisterEvent("PLAYER_REGEN_ENABLED", showLater)
			end
		else
			UnlockElements()
			M:UnregisterEvent(event, showLater)
		end
	end
	M:RegisterEvent("PLAYER_REGEN_DISABLED", showLater)
end

SlashCmdList["NDUI_MOVER"] = function()
	if InCombatLockdown() then
		UIErrorsFrame:AddMessage(I.InfoColor..ERR_NOT_IN_COMBAT)
		return
	end
	CreateConsole()
	UnlockElements()
end
SLASH_NDUI_MOVER1 = "/moveit"