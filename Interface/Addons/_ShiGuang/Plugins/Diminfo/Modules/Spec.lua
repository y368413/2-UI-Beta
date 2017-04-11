local addon, ns = ...
local cfg = ns.cfg
local init = ns.init

if cfg.Spec == true then
	local Stat = CreateFrame("Frame", nil, UIParent)
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)
	Stat:SetHitRectInsets(0, 0, -10, 0)
	local Text = Stat:CreateFontString(nil, "OVERLAY")
	Text:SetFont(unpack(cfg.TTFonts))
	Text:SetShadowColor(0, 0, 0)
  Text:SetShadowOffset(1, -1)
	Text:SetPoint(unpack(cfg.SpecPoint))
	Stat:SetAllPoints(Text)

	local menuFrame = CreateFrame("Frame", "SpecSwitchMenu", Stat, "Lib_UIDropDownMenuTemplate")
	local menuList = {
		{text = CHOOSE_SPECIALIZATION, isTitle = true, notCheckable = true},
		{text = SPECIALIZATION, hasArrow = true, notCheckable = true},
		{text = SELECT_LOOT_SPECIALIZATION, hasArrow = true, notCheckable = true},
	}

	local function UpdateText()
		if GetSpecialization() then
			local _, name, _, icon = GetSpecializationInfo(GetSpecialization())
			if not name then return end
			Text:SetText(init.Colored..name)

			local specID = GetLootSpecialization()
			if not GetSpecialization() then
				Text:Hide()
			elseif specID == 0 then
				Text:SetText("|T"..icon..":15:15:0:0:50:50:4:46:4:46|t")
			else
				Text:SetText("|T"..select(4, GetSpecializationInfoByID(specID))..":15:15:0:0:50:50:4:46:4:46|t")
			end
		else
			Text:SetText(SPECIALIZATION..": "..init.Colored..NONE)
		end
	end

	Stat:RegisterEvent("PLAYER_LOGIN")
	Stat:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	Stat:RegisterEvent("PLAYER_LOOT_SPEC_UPDATED")
	Stat:SetScript("OnEvent", UpdateText)
	
	local function clickFunc(i, isLoot, isPet)
		if not i then return end
		if isLoot then
			SetLootSpecialization(i)
		else
			SetSpecialization(i, isPet)
		end
		DropDownList1:Hide()
	end
	
	Stat:SetScript("OnMouseUp", function(self, btn)
		if not GetSpecialization() then return end
			menuList[2].menuList = {{}, {}, {}, {}}
			menuList[3].menuList = {{}, {}, {}, {}, {}}
			local specList, lootList = menuList[2].menuList, menuList[3].menuList

			local spec, specName = GetSpecializationInfo(GetSpecialization())
			local lootSpec = GetLootSpecialization()
			lootList[1] = {text = format(LOOT_SPECIALIZATION_DEFAULT, specName), func = function() clickFunc(0, true) end, checked = lootSpec == 0 and true or false}

			for i = 1, 4 do
				local id, name = GetSpecializationInfo(i)
				if id then
					specList[i].text = name
					if id == spec then
						specList[i].func = function() clickFunc() end
						specList[i].checked = true
					else
						specList[i].func = function() clickFunc(i) end
						specList[i].checked = false
					end
					lootList[i+1] = {text = name, func = function() clickFunc(id, true) end, checked = id == lootSpec and true or false}
				else
					specList[i] = nil
					lootList[i+1] = nil
				end
			end

			do
				local _, myclass = UnitClass("player")
				if myclass == "HUNTER" and IsPetActive() then
					menuList[4] = {text = PET..SPECIALIZATION, hasArrow = true, notCheckable = true}
					menuList[4].menuList = {{}, {}, {}}
					local petList = menuList[4].menuList
					local spec = GetSpecializationInfo(GetSpecialization(false, true), false, true)
					for i = 1, 3 do
						local id, name = GetSpecializationInfo(i, false, true)
						petList[i].text = name
						if id == spec then
							petList[i].func = function() clickFunc() end
							petList[i].checked = true
						else
							petList[i].func = function() clickFunc(i, false, true) end
							petList[i].checked = false
						end
					end					
				else
					menuList[4] = nil
				end
			end

			Lib_EasyMenu(menuList, menuFrame, self, -80, 100, "MENU", 1)

		GameTooltip:Hide()
	end)
end