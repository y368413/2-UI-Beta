local M, R, U, I = unpack(select(2, ...))

-- Frame Mover
local MoverList, BackupTable, f = {}, {}
M.Mover = function(Frame, Text, key, Pos, w, h)
	if not MaoRUISettingDB["Mover"] then MaoRUISettingDB["Mover"] = {} end
	local Mover = CreateFrame("Frame", nil, UIParent)
	Mover:SetWidth(w or Frame:GetWidth())
	Mover:SetHeight(h or Frame:GetHeight())
	M.CreateBD(Mover)
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
end

local function LockElements()
	for i = 1, #MoverList do
		local mover = MoverList[i]
		mover:Hide()
	end
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
	if f then f:Show() return end

	f = CreateFrame("Frame", nil, UIParent)
	f:SetPoint("TOP", 0, -150)
	f:SetSize(296, 65)
	M.CreateBD(f)
	M.CreateTex(f)
	M.CreateMF(f)
	local lable = M.CreateFS(f, 15, "面板移动控制", false, "TOP", 0, -10)
	lable:SetTextColor(1, .8, 0)
	local bu, text = {}, {LOCK, CANCEL, "网格", RESET}
	for i = 1, 4 do
		bu[i] = CreateFrame("Button", nil, f)
		bu[i]:SetSize(70, 30)
		if i == 1 then
			bu[i]:SetPoint("BOTTOMLEFT", 5, 5)
		else
			bu[i]:SetPoint("LEFT", bu[i-1], "RIGHT", 2, 0)
		end
		M.CreateBD(bu[i], .3, 2)
		M.CreateBC(bu[i])
		M.CreateFS(bu[i], 14, text[i], true)
	end
	-- Lock
	bu[1]:SetScript("OnClick", function()
		f:Hide()
		LockElements()
		SlashCmdList["TOGGLEGRID"]("1")
	end)
	-- Cancel
	bu[2]:SetScript("OnClick", function()
		StaticPopup_Show("CANCEL_MOVER")
	end)
	-- Grids
	bu[3]:SetScript("OnClick", function()
		SlashCmdList["TOGGLEGRID"]("32")
	end)
	-- Reset
	bu[4]:SetScript("OnClick", function()
		StaticPopup_Show("RESET_MOVER")
	end)

	MaoRUI:EventFrame("PLAYER_REGEN_DISABLED"):SetScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				f:Hide()
				LockElements()
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
			end
		else
			f:Show()
			UnlockElements()
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		end
	end)
end

SlashCmdList["NDUI_MOVER"] = function(msg)
	if InCombatLockdown() then
		UIErrorsFrame:AddMessage(DM.InfoColor..ERR_NOT_IN_COMBAT)
		return
	end
	CreateConsole()
	UnlockElements()
end
SLASH_NDUI_MOVER1 = "/moveit"