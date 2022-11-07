## Title: Random Hearthstone
## Author: Jamien
## Version: 1.1
## Notes: Uses a random hearthstone toy
## SavedVariables: rhOptions

local rhList, count, src
local addon = ...

--------------------------------------------------------------------
-- Hearthstone List
--------------------------------------------------------------------
local rhToys = {
	{54452, "Ethereal Portal"},
	{64488, "The Innkeeper's Daughter"},
	{93672, "Dark Portal"},
	{142542, "Tome of Town Portal"},
	{162973, "Greatfather Winter's Hearthstone"},
	{163045, "Headless Horseman's Hearthstone"},
	{165669, "Lunar Elder's Hearthstone"},
	{165670, "Peddlefeet's Lovely Hearthstone"},
	{165802, "Noble Gardener's Hearthstone"},
	{166746, "Fire Eater's Hearthstone"},
	{166747, "Brewfest Reveler's Hearthstone"},
	{168907, "Holographic Digitalization Hearthstone"},
	{172179, "Eternal Traveler's Hearthstone"},
	{180290, "Night Fae Hearthstone"},
	{182773, "Necrolord Hearthstone"},
	{183716, "Venthyr Sinstone"},
	{184353, "Kyrian Hearthstone"},
	{193588, "Timewalker's Hearthstone"},
	{188952, "Dominated Hearthstone"},
	{200630, "Ohnir Windsage's Hearthstone"},
	{190237, "Broker Translocation Matrix"},
	{190196, "Enlightened Hearthstone"},
	{163206, "Weary Spirit Binding"},
	}

--------------------------------------------------------------------
-- Options panel
--------------------------------------------------------------------
local rh = {}
rh.panel = CreateFrame("Frame", "rhOptionsPanel", UIParent)
rh.panel.name = "Random Hearthstone"
rh.panel.okay = function() optionsOkay(); end
rh.panel.cancel = function() optionsCancel(); end
InterfaceOptions_AddCategory(rh.panel)

rh.title = CreateFrame("Frame", "rhTitle", rhOptionsPanel)
rh.title:SetPoint("TOPLEFT", 10, -10)
rh.title:SetSize(100,20)
rh.title.text = rh.title:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rh.title.text:SetText("Random Hearthstone")
rh.title.text:SetPoint("TOPLEFT", rh.title, 0,0)
rh.title.text:SetFont("Fonts\\FRIZQT__.TTF", 18)

rh.description = CreateFrame("Frame", "rhDescription", rhOptionsPanel)
rh.description:SetPoint("TOPLEFT", 20, -40)
rh.description:SetSize(100,20)
rh.description.text = rh.description:CreateFontString(nil, "OVERLAY", "GameFontNormal")
rh.description.text:SetText("Add or remove hearthstone toys from rotation")
rh.description.text:SetPoint("TOPLEFT", rh.description, 0,0)
rh.description.text:SetFont("Fonts\\FRIZQT__.TTF", 14)

local rhCheckButtons = {}
for i = 1, #rhToys do
	local name = "rhCheckbox" .. i
	local chkOffset = -40 + (i * -22)
	rhCheckButtons[i] = CreateFrame("CheckButton", name, rhOptionsPanel, "UICheckButtonTemplate")
	rhCheckButtons[i]:SetPoint("TOPLEFT", 15, chkOffset)
	rhCheckButtons[i]:SetSize(25,25)
	rhCheckButtons[i].ID = rhToys[i][1]
	_G[rhCheckButtons[i]:GetName() .. "Text"]:SetText("  " .. rhToys[i][2])
	_G[rhCheckButtons[i]:GetName() .. "Text"]:SetTextColor(1,1,1,1)
end

local rhListener = CreateFrame("Frame")
rhListener:RegisterEvent("ADDON_LOADED")
rhListener:SetScript("OnEvent", function(self, event, arg1)
	if event == "ADDON_LOADED" and arg1 == addon then
		-- Set savedvariable defaults if first load or compare and update savedvariables with toy list
		if rhOptions == nil then
			rhOptions = {}
			for i=1, #rhToys do
				rhOptions[i] = {rhToys[i][1], true}
			end
		else
			for i,v in pairs(rhOptions) do
				local chk = 0
				for l = 1, #rhToys do
					if v[1] == rhToys[l][1] then
						chk = 1
					end
				end
				if chk == 0 then 
					rhOptions[i] = nil
				end
			end

			for i,v in pairs(rhToys) do
				local chk = 0
				for l = 1, #rhOptions do
					if v[1] == rhOptions[l][1] then
						chk = 1
					end
				end
				if chk == 0 then
					print("New hearthstone toy added - " .. v[2])
					table.insert(rhOptions, {v[1], true})
				end
			end
		end
		
		for i,v in pairs(rhOptions) do
			for l = 1, #rhOptions do
				if rhCheckButtons[l].ID == v[1] and v[2] == true then
					rhCheckButtons[l]:SetChecked(true)
				end
			end
		end
	self:UnregisterEvent("ADDON_LOADED")
	end
end)

function optionsOkay()
	for i = 1, #rhOptions do
		for _,v in pairs(rhOptions) do
			if rhCheckButtons[i].ID == v[1] then
				v[2] = rhCheckButtons[i]:GetChecked()
			end
		end
	end
	listGenerate()
	setRandom()
end

function optionsCancel()
	for i,v in pairs(rhOptions) do
		for l = 1, #rhOptions do
			if rhCheckButtons[l].ID == v[1] and v[2] == true then
				rhCheckButtons[l]:SetChecked(true)
			end
		end
	end
end

--------------------------------------------------------------------
-- Button creation
--------------------------------------------------------------------
local rhBtn = CreateFrame("Button", "rhButton", nil,  "SecureActionButtonTemplate")
rhBtn:RegisterEvent("PLAYER_ENTERING_WORLD")
rhBtn:RegisterEvent("UNIT_SPELLCAST_STOP")
rhBtn:SetAttribute("type","toy")
rhBtn:SetScript("OnEvent", function(self,event, arg1)
		if not InCombatLockdown() then
			if event == "PLAYER_ENTERING_WORLD" then
				listGenerate()
				setRandom()
			end
			
			if event == "UNIT_SPELLCAST_STOP" and arg1 == "player" then
				setRandom()
			end
		end
	end)

--------------------------------------------------------------------
-- Generate list of valid Hearthstone toys
--------------------------------------------------------------------
function listGenerate()
	rhList = {}
	count = 0
	for i=1, #rhOptions do
		if rhOptions[i][2] == true then
			-- Kyrian
			if rhOptions[i][1] == 184353 then
				if PlayerHasToy(rhOptions[i][1]) and C_Covenants.GetActiveCovenantID() == 1 then
					count = count + 1
					table.insert(rhList, rhOptions[i][1])
				end
			-- Venthyr
			elseif rhOptions[i][1] == 183716 then
				if PlayerHasToy(rhOptions[i][1]) and C_Covenants.GetActiveCovenantID() == 2 then
					count = count + 1
					table.insert(rhList, rhOptions[i][1])
				end
			-- Night Fae
			elseif rhOptions[i][1] == 180290 then
				if PlayerHasToy(rhOptions[i][1]) and C_Covenants.GetActiveCovenantID() == 3 then
					count = count + 1
					table.insert(rhList, rhOptions[i][1])
				end
			-- Necrolord
			elseif rhOptions[i][1] == 182773 then
					if PlayerHasToy(rhOptions[i][1]) and C_Covenants.GetActiveCovenantID() == 4 then
						count = count + 1
						table.insert(rhList, rhOptions[i][1])
					end
			else
				if PlayerHasToy(rhOptions[i][1]) then
					count = count + 1
					table.insert(rhList, rhOptions[i][1])
				end
			end
		end
	end
	if #rhList == 0 then 
		print("|cffFF0000No valid Hearthstone toy chosen -|r Setting macro to use Hearthstone")
		src = "\n/use Hearthstone"
	else 
		src = "\n/click rhButton LeftButton" 
	end
end

--------------------------------------------------------------------
-- Set random Hearthstone
--------------------------------------------------------------------
function setRandom()
	if not InCombatLockdown() and #rhList > 0 then
		local rnd = math.random(1,count)
		local item = Item:CreateFromItemID(rhList[rnd])
		item:ContinueOnItemLoad(function()
			local name = item:GetItemName()
			local icon = item:GetItemIcon()
			rhBtn:SetAttribute("toy",name)
			updateMacro(name,icon)
		end)
	elseif #rhList == 0 then
		updateMacro("Hearthstone","134414")
	end
end

--------------------------------------------------------------------
-- Create or update global macro
--------------------------------------------------------------------
function updateMacro(name,icon)
	if not InCombatLockdown() then
		local macroIndex = GetMacroIndexByName("Random Hearth")
		if macroIndex > 0 then
			EditMacro(macroIndex, "Random Hearth", icon, "#showtooltip " .. name .. src)
		else
			CreateMacro("Random Hearth", icon, "#showtooltip " .. name .. src, nil)
		end
	end
end


--------------------------------------------------------------------
-- Create slash command
--------------------------------------------------------------------
SLASH_RandomHearthstone1 = "/rh"
function SlashCmdList.RandomHearthstone(msg, editbox)
InterfaceOptionsFrame_OpenToCategory(rh.panel)
InterfaceOptionsFrame_OpenToCategory(rh.panel)
end