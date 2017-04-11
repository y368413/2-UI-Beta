local M, R, U, I = unpack(select(2, ...))

local r, g, b = I.ClassColor.r, I.ClassColor.g, I.ClassColor.b
local f

local function CreatePanel()
	if f then f:Show() return end

	-- Structure
	f = CreateFrame("Frame", "NDui_AWConfig", UIParent)
	f:SetPoint("CENTER")
	f:SetSize(800, 500)
	M.CreateBD(f)
	M.CreateTex(f)
	M.CreateMF(f)
	M.CreateFS(f, 17, "NDui自定义技能监视", true, "TOP", 0, -10)
	M.CreateFS(f, 15, "分组", true, "TOPLEFT", 30, -50)
	f:SetFrameStrata("HIGH")
	tinsert(UISpecialFrames, "NDui_AWConfig")

	f.Close = CreateFrame("Button", nil, f)
	f.Close:SetPoint("BOTTOMRIGHT", -20, 15)
	f.Close:SetSize(80, 20)
	M.CreateBD(f.Close, .3)
	M.CreateBC(f.Close)
	M.CreateFS(f.Close, 14, CLOSE, true)
	f.Close:SetScript("OnClick", function()
		f:Hide()
	end)

	f.Complete = CreateFrame("Button", nil, f)
	f.Complete:SetPoint("RIGHT", f.Close, "LEFT", -10, 0)
	f.Complete:SetSize(80, 20)
	M.CreateBD(f.Complete, .3)
	M.CreateBC(f.Complete)
	M.CreateFS(f.Complete, 14, OKAY, true)
	f.Complete:SetScript("OnClick", function()
		f:Hide()
		StaticPopup_Show("RELOAD_NDUI")
	end)

	f.Reset = CreateFrame("Button", nil, f)
	f.Reset:SetPoint("BOTTOMLEFT", 25, 15)
	f.Reset:SetSize(120, 20)
	M.CreateBD(f.Reset, .3)
	M.CreateBC(f.Reset)
	M.CreateFS(f.Reset, 14, "NDui Reset", true)
	StaticPopupDialogs["RESET_NDUI_AWLIST"] = {
		text = "你想要清空所有自定义监视列表？",
		button1 = YES,
		button2 = NO,
		OnAccept = function()
			MaoRUISettingDB["AuraWatchList"] = {}
			MaoRUISettingDB["InternalCD"] = {}
			ReloadUI()
		end,
		whileDead = 1,
	}
	f.Reset:SetScript("OnClick", function()
		StaticPopup_Show("RESET_NDUI_AWLIST")
	end)

	-- Elements
	local function CreateLabel(parent, text, tip)
		local label = M.CreateFS(parent, 14, text, false, "CENTER", 0, 25)
		label:SetTextColor(1, .8, 0)
		local frame = CreateFrame("Frame", nil, parent)
		frame:SetAllPoints(label)
		frame:SetScript("OnEnter", function()
			GameTooltip:ClearLines()
			GameTooltip:SetOwner(parent, "ANCHOR_RIGHT", 0, 3)
			GameTooltip:AddLine(text)
			GameTooltip:AddLine(tip, .6,.8,1)
			GameTooltip:Show()
		end)
		frame:SetScript("OnLeave", GameTooltip_Hide)
	end

	local function CreateEditbox(parent, text, x, y, tip)
		local eb = CreateFrame("EditBox", nil, parent)
		eb:SetAutoFocus(false)
		eb:SetSize(90, 30)
		eb:SetMaxLetters(8)
		eb:SetTextInsets(10, 10, 0, 0)
		eb:SetFontObject(GameFontHighlight)
		eb:SetPoint("TOPLEFT", x, y)
		M.CreateBD(eb, .3)
		CreateLabel(eb, text, tip)
		eb:SetScript("OnEscapePressed", function()
			eb:ClearFocus()
		end)
		eb:SetScript("OnEnterPressed", function()
			eb:ClearFocus()
		end)

		eb.Type = "EditBox"
		return eb
	end

	local function CreateCheckBox(parent, text, x, y, tip)
		local cb = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
		cb:SetPoint("TOPLEFT", x, y)
		cb:SetHitRectInsets(-5, -5, -5, -5)
		M.CreateCB(cb)
		CreateLabel(cb, text, tip)

		cb.Type = "CheckBox"
		return cb
	end

	local function CreateDropdown(parent, text, x, y, options, tip)
		local dd = CreateFrame("Frame", nil, parent)
		dd:SetPoint("TOPLEFT", x, y)
		dd:SetSize(90, 30)
		M.CreateBD(dd, .3)
		dd.Text = M.CreateFS(dd, 14, "")
		dd.Selection = {}
		CreateLabel(dd, text, tip)

		local bu = CreateFrame("Button", nil, dd)
		bu:SetPoint("LEFT", dd, "RIGHT", -2, 0)
		bu:SetSize(22, 22)
		bu.Icon = bu:CreateTexture(nil, "ARTWORK")
		bu.Icon:SetAllPoints()
		bu.Icon:SetTexture(I.gearTex)
		--bu.Icon:SetTexCoord(0, .5, 0, .5)
		bu:SetHighlightTexture(I.gearTex)
		--bu:GetHighlightTexture():SetTexCoord(0, .5, 0, .5)
		local list = CreateFrame("Frame", nil, dd)
		list:SetPoint("TOP", dd, "BOTTOM")
		M.CreateBD(list, .3)
		bu:SetScript("OnShow", function() list:Hide() end)
		bu:SetScript("OnClick", function()
			PlaySound("gsTitleOptionOK")
			ToggleFrame(list)
		end)

		local opt, index = {}, 0
		for i, j in pairs(options) do
			opt[i] = CreateFrame("Button", nil, list)
			opt[i]:SetPoint("TOPLEFT", 5, -5 - (i-1)*30)
			opt[i]:SetSize(80, 30)
			M.CreateBD(opt[i], .3)
			M.CreateFS(opt[i], 14, j, false, "LEFT", 5, 0)
			opt[i]:SetScript("OnClick", function(self)
				PlaySound("gsTitleOptionOK")
				for index = 1, #opt do
					if index == i then
						opt[index]:SetBackdropColor(1, .8, 0, .3)
						opt[index].selected = true
					else
						opt[index]:SetBackdropColor(0, 0, 0, .3)
						opt[index].selected = false
					end
				end
				dd.Text:SetText(j)
				list:Hide()
			end)
			opt[i]:SetScript("OnEnter", function(self)
				if self.selected then return end
				self:SetBackdropColor(1, 1, 1, .3)
			end)
			opt[i]:SetScript("OnLeave", function(self)
				if self.selected then return end
				self:SetBackdropColor(0, 0, 0, .3)
			end)

			dd.Selection[i] = opt[i]
			index = index + 1
		end
		list:SetSize(90, index*30 + 10)

		dd.Type = "DropDown"
		return dd
	end

	local function ClearEdit(element)
		if element.Type == "EditBox" then
			element:ClearFocus()
			element:SetText("")
		elseif element.Type == "CheckBox" then
			element:SetChecked(false)
		elseif element.Type == "DropDown" then
			element.Text:SetText("")
			for i = 1, #element.Selection do
				element.Selection[i].selected = false
			end
		end
	end

	local function CreatePage(name)
		local p = CreateFrame("Frame", nil, f)
		p:SetPoint("TOPLEFT", 160, -70)
		p:SetSize(620, 380)
		M.CreateBD(p, .2)
		M.CreateFS(p, 15, name, false, "TOPLEFT", 5, 20)
		p:Hide()
		return p
	end

	local function CreateScroll(parent)
		local scroll = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
		scroll:SetSize(575, 200)
		scroll:SetPoint("BOTTOMLEFT", 10, 10)
		M.CreateBD(scroll, .2)
		M.CreateFS(scroll, 15, "自定义监视列表", false, "TOPLEFT", 5, 20)
		if IsAddOnLoaded("Aurora") then
			local F = unpack(Aurora)
			F.ReskinScroll(scroll.ScrollBar)
		end

		scroll.Child = CreateFrame("Frame", nil, scroll)
		scroll.Child:SetSize(585, 1)
		scroll:SetScrollChild(scroll.Child)
		return scroll
	end

	local barTable = {}
	local function SortBars(index)
		local num, onLeft, onRight = 1, 1, 1
		for k, v in pairs(barTable[index]) do
			if index ~= 10 then
				if MaoRUISettingDB["AuraWatchList"][index][k] ~= nil then
					local bar = barTable[index][k]
					if num == 1 then
						bar:SetPoint("TOPLEFT", 10, -10)
					elseif num > 1 and num/2 ~= floor(num/2) then
						bar:SetPoint("TOPLEFT", 10, -10 - 35*onLeft)
						onLeft = onLeft + 1
					elseif num == 2 then
						bar:SetPoint("TOPLEFT", 295, -10)
					elseif num > 2 and num/2 == floor(num/2) then
						bar:SetPoint("TOPLEFT", 295, -10 - 35*onRight)
						onRight = onRight + 1
					end
					num = num + 1
				end
			else
				if MaoRUISettingDB["InternalCD"][k] ~= nil then
					local bar = barTable[index][k]
					if num == 1 then
						bar:SetPoint("TOPLEFT", 10, -10)
					elseif num > 1 and num/2 ~= floor(num/2) then
						bar:SetPoint("TOPLEFT", 10, -10 - 35*onLeft)
						onLeft = onLeft + 1
					elseif num == 2 then
						bar:SetPoint("TOPLEFT", 295, -10)
					elseif num > 2 and num/2 == floor(num/2) then
						bar:SetPoint("TOPLEFT", 295, -10 - 35*onRight)
						onRight = onRight + 1
					end
					num = num + 1
				end
			end
		end
	end

	local slotIndex = {
		[6] = INVTYPE_WAIST,
		[11] = INVTYPE_FINGER.."1",
		[12] = INVTYPE_FINGER.."2",
		[13] = INVTYPE_TRINKET.."1",
		[14] = INVTYPE_TRINKET.."2",
		[15] = INVTYPE_CLOAK,
	}
	local function AddAura(parent, index, data)
		local typeID, spellID, _, _, _, _, _, _, text = unpack(data)
		local name, _, texture = GetSpellInfo(spellID)
		if typeID == "SlotID" then
			texture = GetInventoryItemTexture("player", spellID)
			name = slotIndex[spellID]
		elseif typeID == "TotemID" then
			texture = "Interface\\ICONS\\INV_Misc_QuestionMark"
			name = "图腾栏"..spellID
		end

		local bar = CreateFrame("Frame", nil, parent)
		bar:SetSize(280, 30)
		M.CreateBD(bar, .3)
		barTable[index][spellID] = bar

		local icon = CreateFrame("Frame", nil, bar)
		icon:SetSize(20, 20)
		icon:SetPoint("LEFT", 5, 0)
		M.CreateIF(icon, true)
		icon.Icon:SetTexture(texture)
		if typeID ~= "TotemID" then
			icon:SetScript("OnEnter", function()
				GameTooltip:ClearLines()
				GameTooltip:SetOwner(icon, "ANCHOR_RIGHT", 0, 3)
				if typeID == "SlotID" then
					GameTooltip:SetInventoryItem("player", spellID)
				else
					GameTooltip:SetSpellByID(spellID)
				end
				GameTooltip:Show()
			end)
			icon:SetScript("OnLeave", GameTooltip_Hide)
		end

		local close = CreateFrame("Button", nil, bar)
		close:SetSize(20, 20)
		close:SetPoint("RIGHT", -5, 0)
		close.Icon = close:CreateTexture(nil, "ARTWORK")
		close.Icon:SetAllPoints()
		close.Icon:SetTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
		close:SetHighlightTexture(close.Icon:GetTexture())
		close:SetScript("OnClick", function()
			bar:Hide()
			MaoRUISettingDB["AuraWatchList"][index][spellID] = nil
			barTable[index][spellID] = nil
			SortBars(index)
		end)
		local spellName = M.CreateFS(bar, 14, name, false, "LEFT", 30, 0)
		spellName:SetWidth(180)
		spellName:SetJustifyH("LEFT")
		M.CreateFS(bar, 14, text, false, "RIGHT", -30, 0)

		SortBars(index)
	end

	local function AddInternal(parent, index, data)
		local intID, duration, itemID = unpack(data)
		local name, _, texture = GetSpellInfo(intID)
		if itemID then
			name = GetItemInfo(itemID)
		end

		local bar = CreateFrame("Frame", nil, parent)
		bar:SetSize(280, 30)
		M.CreateBD(bar, .3)
		barTable[index][intID] = bar

		local icon = CreateFrame("Frame", nil, bar)
		icon:SetSize(20, 20)
		icon:SetPoint("LEFT", 5, 0)
		M.CreateIF(icon, true)
		icon.Icon:SetTexture(texture)
		icon:SetScript("OnEnter", function()
			GameTooltip:ClearLines()
			GameTooltip:SetOwner(icon, "ANCHOR_RIGHT", 0, 3)
			GameTooltip:SetSpellByID(intID)
			GameTooltip:Show()
		end)
		icon:SetScript("OnLeave", GameTooltip_Hide)

		local close = CreateFrame("Button", nil, bar)
		close:SetSize(20, 20)
		close:SetPoint("RIGHT", -5, 0)
		close.Icon = close:CreateTexture(nil, "ARTWORK")
		close.Icon:SetAllPoints()
		close.Icon:SetTexture("Interface\\BUTTONS\\UI-GroupLoot-Pass-Up")
		close:SetHighlightTexture(close.Icon:GetTexture())
		close:SetScript("OnClick", function()
			bar:Hide()
			MaoRUISettingDB["InternalCD"][intID] = nil
			barTable[index][intID] = nil
			SortBars(index)
		end)
		local spellName = M.CreateFS(bar, 14, name, false, "LEFT", 30, 0)
		spellName:SetWidth(180)
		spellName:SetJustifyH("LEFT")
		M.CreateFS(bar, 14, duration, false, "RIGHT", -30, 0)

		SortBars(index)
	end

	-- Main
	if not MaoRUISettingDB["AuraWatchList"] then MaoRUISettingDB["AuraWatchList"] = {} end
	if not MaoRUISettingDB["InternalCD"] then MaoRUISettingDB["InternalCD"] = {} end
	local groups = {
		"玩家光环",		-- 1 PlayerBuff
		"玩家重要光环",		-- 2 SPECIAL
		"目标光环",		-- 3 TargetDebuff
		"目标重要光环",			-- 4 Warning
		"焦点光环",		-- 5 FOCUS
		"冷却计时",	-- 6 CD
		"附魔及饰品",		-- 7 Enchant
		"团队增益",			-- 8 RaidBuff
		"团队减益",		-- 9 RaidDebuff
		"内置冷却",		-- 10 InternalCD
	}
	local tabs = {}
	for i, group in pairs(groups) do
		if not MaoRUISettingDB["AuraWatchList"][i] then MaoRUISettingDB["AuraWatchList"][i] = {} end
		barTable[i] = {}

		tabs[i] = CreateFrame("Button", nil, f)
		tabs[i]:SetPoint("TOPLEFT", 20, -40 - i*30)
		tabs[i]:SetSize(130, 30)
		M.CreateBD(tabs[i], .3)
		local label = M.CreateFS(tabs[i], 15, group, true, "LEFT", 10, 0)
		label:SetTextColor(1, .8, 0)
		tabs[i].Page = CreatePage(group)
		tabs[i].List = CreateScroll(tabs[i].Page)

		local Option = {}
		if i ~= 10 then
			for k, _ in pairs(MaoRUISettingDB["AuraWatchList"][i]) do
				AddAura(tabs[i].List.Child, i, MaoRUISettingDB["AuraWatchList"][i][k])
			end
			Option[1] = CreateDropdown(tabs[i].Page, "类型*", 20, -30, {"AuraID", "SpellID", "SlotID", "TotemID"}, "\nAuraID: 监视Buff/Debuff的状态；\n\nSpellID: 监视技能法术的冷却时间；\n\nSlotID: 监视装备栏位的冷却时间；\n\nTotemID: 监视对应图腾的持续时间。")
			Option[2] = CreateEditbox(tabs[i].Page, "ID*", 140, -30, "\n法术的编号，必须为数字。\n\n你可以在法术的鼠标提示框中看到法术ID。\n\n不支持直接输入法术名称。")
			Option[3] = CreateDropdown(tabs[i].Page, "单位*", 260, -30, {"player", "target", "focus", "pet"}, "\n监视法术所来自的单位。\n\nplayer: 玩家单位的法术；\n\ntarget: 目标单位的法术；\n\nfocus: 焦点单位的法术；\n\npet: 宠物单位的法术。")
			Option[4] = CreateDropdown(tabs[i].Page, "施法者", 380, -30, {"player", "target", "pet"}, "\n用于过滤法术的来源。\n\nplayer: 施法者是玩家；\n\ntarget: 施法者是目标；\n\npet: 施法者是宠物。\n\n留空则任何人施放的都会显示。")
			Option[5] = CreateEditbox(tabs[i].Page, "层数", 500, -30, "\n过滤法术的层数，必须为数字。\n\n当法术的层数达到你所设置的数值后显示。\n\n留空则无视层数，直接显示。")
			Option[6] = CreateCheckBox(tabs[i].Page, "光环数值", 40, -95, "\n勾选后，显示法术包含的数值信息。\n\n例如牧师的真言术盾将显示其具体吸收数值。\n\n优先级高于文本提示。")
			Option[7] = CreateCheckBox(tabs[i].Page, "隐藏计时", 120, -95, "\n勾选后，该法术的冷却时间会被隐藏。")
			Option[8] = CreateCheckBox(tabs[i].Page, "战斗时显示", 200, -95, "\n勾选后，该法术将仅在战斗中显示。")
			Option[9] = CreateEditbox(tabs[i].Page, "文本提示", 260, -90, "\n法术的文本提示。\n\n法术激活时，将同时显示你所设置的文字。\n\n若启用Value或者留空，则不显示文本提示。")
			Option[10] = CreateDropdown(tabs[i].Page, "装备栏位*", 140, -30, {slotIndex[6], slotIndex[11], slotIndex[12], slotIndex[13], slotIndex[14], slotIndex[15]}, "\n显示所选择装备栏的冷却时间。\n\n例如工程腰带、披风等等。\n\n饰品栏位仅支持主动饰品。")
			Option[11] = CreateDropdown(tabs[i].Page, "图腾栏位*", 140, -30, {"图腾栏".."1", "图腾栏".."2", "图腾栏".."3", "图腾栏".."4"}, "\n显示所选择图腾栏位的持续时间。")

			for i = 2, 11 do Option[i]:Hide() end

			for i = 1, #Option[1].Selection do
				Option[1].Selection[i]:HookScript("OnClick", function()
					for i = 2, 11 do
						Option[i]:Hide()
						ClearEdit(Option[i])
					end

					if Option[1].Text:GetText() == "AuraID" then
						for j = 2, 9 do Option[j]:Show() end
					elseif Option[1].Text:GetText() == "SpellID" then
						Option[2]:Show()
					elseif Option[1].Text:GetText() == "SlotID" then
						Option[10]:Show()
					elseif Option[1].Text:GetText() == "TotemID" then
						Option[11]:Show()
					end
				end)
			end
		else
			for k, _ in pairs(MaoRUISettingDB["InternalCD"]) do
				AddInternal(tabs[i].List.Child, i, MaoRUISettingDB["InternalCD"][k])
			end
			Option[12] = CreateEditbox(tabs[10].Page, "法术*", 20, -30, "\n用于触发冷却计时器的法术编号，必须为数字。\n\n你可以在法术的鼠标提示框中看到法术ID。\n\n不支持直接输入法术名称。")
			Option[13] = CreateEditbox(tabs[10].Page, "时长*", 140, -30, "\n所触发的冷却计时器的持续时间。")
			Option[14] = CreateEditbox(tabs[10].Page, "名称", 260, -30, "\n冷却计时器的名称所属的物品编号。\n\n留空则使用触发冷却的法术编号。")
		end

		local clear = CreateFrame("Button", nil, tabs[i].Page)
		clear:SetPoint("TOPRIGHT", -120, -90)
		clear:SetSize(70, 25)
		M.CreateBD(clear, .3)
		M.CreateBC(clear)
		M.CreateFS(clear, 14, KEY_NUMLOCK_MAC, true)
		clear:SetScript("OnClick", function()
			if i ~= 10 then
				for j = 1, 11 do ClearEdit(Option[j]) end
				for j = 2, 11 do Option[j]:Hide() end
			else
				for j = 12, 14 do ClearEdit(Option[j]) end
			end
		end)

		local slotTable = {6, 11, 12, 13, 14, 15}
		local add = CreateFrame("Button", nil, tabs[i].Page)
		add:SetPoint("TOPRIGHT", -40, -90)
		add:SetSize(70, 25)
		M.CreateBD(add, .3)
		M.CreateBC(add)
		M.CreateFS(add, 14, ADD, true)
		add:SetScript("OnClick", function()
			if i ~= 10 then
				local typeID, spellID, unitID, slotID, totemID = Option[1].Text:GetText(), tonumber(Option[2]:GetText()), Option[3].Text:GetText()
				for i = 1, #Option[10].Selection do
					if Option[10].Selection[i].selected then slotID = slotTable[i] break end
				end
				for i = 1, #Option[11].Selection do
					if Option[11].Selection[i].selected then totemID = i break end
				end

				if not typeID then UIErrorsFrame:AddMessage(I.InfoColor.."请选择一种监视类型。") return end
				if (typeID == "AuraID" and (not spellID or not unitID)) or (typeID == "SpellID" and not spellID) or (typeID == "SlotID" and not slotID) or (typeID == "TotemID" and not totemID) then UIErrorsFrame:AddMessage(I.InfoColor.."你需要完成所有带*的选项。") return end
				if (typeID == "AuraID" or typeID == "SpellID") and not GetSpellInfo(spellID) then UIErrorsFrame:AddMessage(I.InfoColor.."你输入的法术ID不存在") return end

				local realID = spellID or slotID or totemID
				if MaoRUISettingDB["AuraWatchList"][i][realID] then UIErrorsFrame:AddMessage(I.InfoColor.."你已经添加过改法术。") return end

				MaoRUISettingDB["AuraWatchList"][i][realID] = {typeID, realID, unitID, Option[4].Text:GetText(), tonumber(Option[5]:GetText()), Option[6]:GetChecked(), Option[7]:GetChecked(), Option[7]:GetChecked(), Option[9]:GetText()}
				AddAura(tabs[i].List.Child, i, MaoRUISettingDB["AuraWatchList"][i][realID])
				for i = 1, 11 do ClearEdit(Option[i]) end
			else
				local intID, duration, itemID = tonumber(Option[12]:GetText()), tonumber(Option[13]:GetText()), tonumber(Option[14]:GetText())
				if not intID or not duration then UIErrorsFrame:AddMessage(I.InfoColor.."你需要完成所有带*的选项。") return end
				if intID and not GetSpellInfo(intID) then UIErrorsFrame:AddMessage(I.InfoColor.."你输入的法术ID不存在") return end
				if MaoRUISettingDB["InternalCD"][intID] then UIErrorsFrame:AddMessage(I.InfoColor.."你已经添加过改法术。") return end

				MaoRUISettingDB["InternalCD"][intID] = {intID, duration, itemID}
				AddInternal(tabs[i].List.Child, i, MaoRUISettingDB["InternalCD"][intID])
				for i = 12, 14 do ClearEdit(Option[i]) end
			end
		end)

		tabs[i]:SetScript("OnClick", function()
			for index = 1, #tabs do
				if i == index then
					tabs[index].Page:Show()
					tabs[index]:SetBackdropColor(r, g, b, .3)
					tabs[index].selected = true
				else
					tabs[index].Page:Hide()
					tabs[index]:SetBackdropColor(0, 0, 0, .3)
					tabs[index].selected = false
				end
			end
		end)
		tabs[i]:SetScript("OnEnter", function(self)
			if self.selected then return end
			self:SetBackdropColor(r, g, b, .3)
		end)
		tabs[i]:SetScript("OnLeave", function(self)
			if self.selected then return end
			self:SetBackdropColor(0, 0, 0, .3)
		end)
	end
	
	tabs[1]:Click()

	MaoRUI:EventFrame("PLAYER_REGEN_DISABLED"):SetScript("OnEvent", function(self, event)
		if event == "PLAYER_REGEN_DISABLED" then
			if f:IsShown() then
				f:Hide()
				self:RegisterEvent("PLAYER_REGEN_ENABLED")
			end
		else
			f:Show()
			self:UnregisterEvent("PLAYER_REGEN_ENABLED")
		end
	end)
end

SlashCmdList["NDUI_AWCONFIG"] = function()
	if InCombatLockdown() then UIErrorsFrame:AddMessage(I.InfoColor..ERR_NOT_IN_COMBAT) return end
	CreatePanel()
end
SLASH_NDUI_AWCONFIG1 = "/awc"