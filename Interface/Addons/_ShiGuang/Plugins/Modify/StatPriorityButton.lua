-- Author: Nerino1
-- Create Date : 3/1/2019
-- Version 9.6

local f=CreateFrame("frame");
f:RegisterEvent("PLAYER_LOGIN");
f:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED");
f:RegisterEvent("QUEST_COMPLETE");
f:RegisterEvent("QUEST_FINISHED");

local level = UnitLevel("player")
local currentSpec = GetSpecialization()
local currentClass = select(2,UnitClass("player"))

table.insert(UISpecialFrames, "StatWindowFrame")
table.insert(UISpecialFrames, "StatWindowQuestFrame")

classTable = {
[0] = "",
[1] = "Holy",
[2] = "Protection",
[3] = "Retribution",
[4] = "Arms",
[5] = "Fury",
[6] = "Protection",
[7] = "Beast Mastery",
[8] = "Marksmanship",
[9] = "Survival",
[10] = "Assassination",
[11] = "Outlaw",
[12] = "Subtlety",
[13] = "Discipline",
[14] = "Holy",
[15] = "Shadow",
[16] = "Blood",
[17] = "Frost",
[18] = "Unholy",
[19] = "Elemental",
[20] = "Enhancement",
[21] = "Restoration",
[22] = "Arcane",
[23] = "Fire",
[24] = "Frost",
[25] = "Affliction",
[26] = "Demonology",
[27] = "Destruction",
[28] = "Brewmaster",
[29] = "Mistweaver",
[30] = "Windwalker",
[31] = "Balance",
[32] = "Feral",
[33] = "Guardian",
[34] = "Restoration",
[35] = "Havoc",
[36] = "Vengeance",
}

local function eventhandler(self,event)
	if event == "PLAYER_LOGIN" then
		if UnitLevel("player") <= 3 then
			statbtn:Hide()
			StatWindowFrame:Hide()
			StatWindowQuestFrame:Hide()
			do return end
		end
		--DEFAULT_CHAT_FRAME:AddMessage("Stat Priority Button Loaded.");
		StatWindowFrame:Hide()
		StatWindowQuestFrame:Hide()		
	end
	if event == "PLAYER_SPECIALIZATION_CHANGED" then
		currentSpec = GetSpecialization()
		GenerateStats()
	end
	if event == "QUEST_COMPLETE" then
		GenerateStats()
		StatWindowQuestFrame:Show()
	end
	if event == "QUEST_FINISHED" then
		StatWindowQuestFrame:Hide()
	end
end

f:SetScript("OnEvent",eventhandler);

local StatWindow = CreateFrame("frame","StatWindowFrame", PaperDollFrame, BackdropTemplateMixin and "BackdropTemplate" or nil)
StatWindow:SetBackdrop({
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
      tile=1, tileSize=32, edgeSize=32, 
      insets={left=11, right=12, top=12, bottom=11}
})
StatWindow:SetWidth(215)
StatWindow:SetHeight(50)
StatWindow:SetPoint("BOTTOMRIGHT", 3, -40, PaperDollFrame)
StatWindow.text = StatWindow.text or
StatWindow:CreateFontString(nil,"OVERLAY","GameFontNormal")
StatWindow.text:SetAllPoints(true)
StatWindow.text:SetJustifyH("CENTER")
StatWindow.text:SetTextColor(1,1,1,1)
StatWindow.text:SetPoint("TOPLEFT",StatWindowFrame,"TOPLEFT",9,0)
StatWindow.text:SetPoint("BOTTOMRIGHT",StatWindowFrame,"BOTTOMRIGHT",-9,0)

local StatWindowQuest = CreateFrame("frame","StatWindowQuestFrame", QuestFrameRewardPanel, BackdropTemplateMixin and "BackdropTemplate" or nil)
StatWindowQuest:SetBackdrop({
	--bgFile="Interface\\DialogFrame\\UI-DialogBox-Background", 
	--edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border", 
	tile=1, tileSize=18, edgeSize=10, 
	insets={left=11, right=12, top=12, bottom=11}
})
StatWindowQuest:SetWidth(215)
StatWindowQuest:SetHeight(50)
--StatWindowQuest:SetPoint("BOTTOMRIGHT", -45, -28, QuestFrameRewardPanel)
StatWindowQuest:SetPoint("TOPLEFT", 85, -18, QuestFrameRewardPanel)
StatWindowQuest.text = StatWindowQuest.text or
StatWindowQuest:CreateFontString(nil,"OVERLAY","GameFontNormal")
StatWindowQuest.text:SetAllPoints(true)
StatWindowQuest.text:SetJustifyH("CENTER")
StatWindowQuest.text:SetTextColor(1,1,1,1)


--StatWindow:EnableMouse(true)
--StatWindow:SetMovable(true)
--StatWindow:RegisterForDrag("LeftButton")
--StatWindow:SetScript("OnDragStart", function(self) self:StartMoving() end)
--StatWindow:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
--StatWindow:SetFrameStrata("FULLSCREEN_DIALOG")


local btn = CreateFrame("Button", "statbtn", PaperDollFrame, "OptionsButtonTemplate");
btn:SetPoint("BOTTOMRIGHT", -215, 10)
btn:SetText("Stat Priority")
btn:SetScript("OnClick", function() OpenStatWindow() end)

local classOne = CreateFrame("Button", "classOnebtn", StatWindowFrame, "OptionsButtonTemplate");
classOne:SetPoint("BOTTOMLEFT", 5, -15)
classOne:SetWidth(100)
classOne:SetScript("OnClick", function() OpenClassChoice() end)

local classTwo = CreateFrame("Button", "classTwobtn", QuestFrameRewardPanel, "OptionsButtonTemplate");
classTwo:SetPoint("TOPRIGHT",QuestFrameRewardPanel, -80, -65)
classTwo:SetWidth(100)
classTwo:SetScript("OnClick", function() OpenClassChoice() end)

local menuFrame = CreateFrame("Frame", "ExampleMenuFrame", UIParent, "UIDropDownMenuTemplate")

local menuPali = {
    { text = "Select Class", isTitle = true},
    { text = (classTable[1]), func = function() StatWindow.text:SetText(dataTable[1]);StatWindowQuest.text:SetText(dataTable[1]);classOne:SetText(classTable[1]);classTwo:SetText(classTable[1]); end },
    { text = (classTable[2]), func = function() StatWindow.text:SetText(dataTable[2]);StatWindowQuest.text:SetText(dataTable[2]);classOne:SetText(classTable[2]);classTwo:SetText(classTable[2]); end },
	{ text = (classTable[3]), func = function() StatWindow.text:SetText(dataTable[3]);StatWindowQuest.text:SetText(dataTable[3]);classOne:SetText(classTable[3]);classTwo:SetText(classTable[3]); end },
}

local menuWarr = {
    { text = "Select Class", isTitle = true},
    { text = (classTable[4]), func = function() StatWindow.text:SetText(dataTable[4]);StatWindowQuest.text:SetText(dataTable[4]);classOne:SetText(classTable[4]);classTwo:SetText(classTable[4]); end },
    { text = (classTable[5]), func = function() StatWindow.text:SetText(dataTable[5]);StatWindowQuest.text:SetText(dataTable[5]);classOne:SetText(classTable[5]);classTwo:SetText(classTable[5]); end },
	{ text = (classTable[6]), func = function() StatWindow.text:SetText(dataTable[6]);StatWindowQuest.text:SetText(dataTable[6]);classOne:SetText(classTable[6]);classTwo:SetText(classTable[6]); end },
}

local menuHunt = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[7]), func = function() StatWindow.text:SetText(dataTable[7]);StatWindowQuest.text:SetText(dataTable[7]);classOne:SetText(classTable[7]);classTwo:SetText(classTable[7]); end },
	{ text = (classTable[8]), func = function() StatWindow.text:SetText(dataTable[8]);StatWindowQuest.text:SetText(dataTable[8]);classOne:SetText(classTable[8]);classTwo:SetText(classTable[8]); end },
	{ text = (classTable[9]), func = function() StatWindow.text:SetText(dataTable[9]);StatWindowQuest.text:SetText(dataTable[9]);classOne:SetText(classTable[9]);classTwo:SetText(classTable[9]); end },
}

local menuRog = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[10]), func = function() StatWindow.text:SetText(dataTable[10]);StatWindowQuest.text:SetText(dataTable[10]);classOne:SetText(classTable[10]);classTwo:SetText(classTable[10]); end },
	{ text = (classTable[11]), func = function() StatWindow.text:SetText(dataTable[11]);StatWindowQuest.text:SetText(dataTable[11]);classOne:SetText(classTable[11]);classTwo:SetText(classTable[11]); end },
	{ text = (classTable[12]), func = function() StatWindow.text:SetText(dataTable[12]);StatWindowQuest.text:SetText(dataTable[12]);classOne:SetText(classTable[12]);classTwo:SetText(classTable[12]); end },
}

local menuPrie = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[13]), func = function() StatWindow.text:SetText(dataTable[13]);StatWindowQuest.text:SetText(dataTable[13]);classOne:SetText(classTable[13]);classTwo:SetText(classTable[13]); end },
	{ text = (classTable[14]), func = function() StatWindow.text:SetText(dataTable[14]);StatWindowQuest.text:SetText(dataTable[14]);classOne:SetText(classTable[14]);classTwo:SetText(classTable[14]); end },
	{ text = (classTable[15]), func = function() StatWindow.text:SetText(dataTable[15]);StatWindowQuest.text:SetText(dataTable[15]);classOne:SetText(classTable[15]);classTwo:SetText(classTable[15]); end },
}

local menuDK = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[16]), func = function() StatWindow.text:SetText(dataTable[16]);StatWindowQuest.text:SetText(dataTable[16]);classOne:SetText(classTable[16]);classTwo:SetText(classTable[16]); end },
	{ text = (classTable[17]), func = function() StatWindow.text:SetText(dataTable[17]);StatWindowQuest.text:SetText(dataTable[17]);classOne:SetText(classTable[17]);classTwo:SetText(classTable[17]); end },
	{ text = (classTable[18]), func = function() StatWindow.text:SetText(dataTable[18]);StatWindowQuest.text:SetText(dataTable[18]);classOne:SetText(classTable[18]);classTwo:SetText(classTable[18]); end },
}

local menuSha = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[19]), func = function() StatWindow.text:SetText(dataTable[19]);StatWindowQuest.text:SetText(dataTable[19]);classOne:SetText(classTable[19]);classTwo:SetText(classTable[19]); end },
	{ text = (classTable[20]), func = function() StatWindow.text:SetText(dataTable[20]);StatWindowQuest.text:SetText(dataTable[20]);classOne:SetText(classTable[20]);classTwo:SetText(classTable[20]); end },
	{ text = (classTable[21]), func = function() StatWindow.text:SetText(dataTable[21]);StatWindowQuest.text:SetText(dataTable[21]);classOne:SetText(classTable[21]);classTwo:SetText(classTable[21]); end },
}

local menuMage = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[22]), func = function() StatWindow.text:SetText(dataTable[22]);StatWindowQuest.text:SetText(dataTable[22]);classOne:SetText(classTable[22]);classTwo:SetText(classTable[22]); end },
	{ text = (classTable[23]), func = function() StatWindow.text:SetText(dataTable[23]);StatWindowQuest.text:SetText(dataTable[23]);classOne:SetText(classTable[23]);classTwo:SetText(classTable[23]); end },
	{ text = (classTable[24]), func = function() StatWindow.text:SetText(dataTable[24]);StatWindowQuest.text:SetText(dataTable[24]);classOne:SetText(classTable[24]);classTwo:SetText(classTable[24]); end },
}

local menuLock = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[25]), func = function() StatWindow.text:SetText(dataTable[25]);StatWindowQuest.text:SetText(dataTable[25]);classOne:SetText(classTable[25]);classTwo:SetText(classTable[25]); end },
	{ text = (classTable[26]), func = function() StatWindow.text:SetText(dataTable[26]);StatWindowQuest.text:SetText(dataTable[26]);classOne:SetText(classTable[26]);classTwo:SetText(classTable[26]); end },
	{ text = (classTable[27]), func = function() StatWindow.text:SetText(dataTable[27]);StatWindowQuest.text:SetText(dataTable[27]);classOne:SetText(classTable[27]);classTwo:SetText(classTable[27]); end },
}

local menuMonk = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[28]), func = function() StatWindow.text:SetText(dataTable[28]);StatWindowQuest.text:SetText(dataTable[28]);classOne:SetText(classTable[28]);classTwo:SetText(classTable[28]); end },
	{ text = (classTable[29]), func = function() StatWindow.text:SetText(dataTable[29]);StatWindowQuest.text:SetText(dataTable[29]);classOne:SetText(classTable[29]);classTwo:SetText(classTable[29]); end },
	{ text = (classTable[30]), func = function() StatWindow.text:SetText(dataTable[30]);StatWindowQuest.text:SetText(dataTable[30]);classOne:SetText(classTable[30]);classTwo:SetText(classTable[30]); end },
}

local menuDru = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[31]), func = function() StatWindow.text:SetText(dataTable[31]);StatWindowQuest.text:SetText(dataTable[31]);classOne:SetText(classTable[31]);classTwo:SetText(classTable[31]); end },
	{ text = (classTable[32]), func = function() StatWindow.text:SetText(dataTable[32]);StatWindowQuest.text:SetText(dataTable[32]);classOne:SetText(classTable[32]);classTwo:SetText(classTable[32]); end },
	{ text = (classTable[33]), func = function() StatWindow.text:SetText(dataTable[33]);StatWindowQuest.text:SetText(dataTable[33]);classOne:SetText(classTable[33]);classTwo:SetText(classTable[33]); end },
	{ text = (classTable[34]), func = function() StatWindow.text:SetText(dataTable[34]);StatWindowQuest.text:SetText(dataTable[34]);classOne:SetText(classTable[34]);classTwo:SetText(classTable[34]); end },
}

local menuDemon = {
    { text = "Select Class", isTitle = true},
	{ text = (classTable[35]), func = function() StatWindow.text:SetText(dataTable[35]);StatWindowQuest.text:SetText(dataTable[35]);classOne:SetText(classTable[35]);classTwo:SetText(classTable[35]); end },
	{ text = (classTable[36]), func = function() StatWindow.text:SetText(dataTable[36]);StatWindowQuest.text:SetText(dataTable[36]);classOne:SetText(classTable[36]);classTwo:SetText(classTable[36]); end },
}

function OpenClassChoice()
	-- DEFAULT_CHAT_FRAME:AddMessage(".Class Menu");
	if currentClass == "PALADIN" then
		EasyMenu(menuPali, menuFrame, "cursor", 0 , 0, "MENU");
	elseif	currentClass == "WARRIOR" then
		EasyMenu(menuWarr, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "HUNTER" then
		EasyMenu(menuHunt, menuFrame, "cursor", 0 , 0, "MENU");
	elseif	currentClass == "ROGUE" then
		EasyMenu(menuRog, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "PRIEST" then
		EasyMenu(menuPrie, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "DEATHKNIGHT" then
		EasyMenu(menuDK, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "SHAMAN" then
		EasyMenu(menuSha, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "MAGE" then
		EasyMenu(menuMage, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "WARLOCK" then
		EasyMenu(menuLock, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "MONK" then
		EasyMenu(menuMonk, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "DRUID" then
		EasyMenu(menuDru, menuFrame, "cursor", 0 , 0, "MENU");	
	elseif	currentClass == "DEMONHUNTER" then
		EasyMenu(menuDemon, menuFrame, "cursor", 0 , 0, "MENU");	
	end	
end

function OpenStatWindow()
	currentSpec = GetSpecialization()
	if StatWindowFrame:IsShown() then
		StatWindowFrame:Hide()
	else
		GenerateStats()
		StatWindowFrame:Show()
	end
end

function GenerateStats()
	if currentClass == "PALADIN" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[1])
			StatWindowQuest.text:SetText(dataTable[1])
			classOne:SetText(classTable[1])
			classTwo:SetText(classTable[1])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[2])
			StatWindowQuest.text:SetText(dataTable[2])
			classOne:SetText(classTable[2])
			classTwo:SetText(classTable[2])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[3])
			StatWindowQuest.text:SetText(dataTable[3])
			classOne:SetText(classTable[3])
			classTwo:SetText(classTable[3])
		end
	elseif	currentClass == "WARRIOR" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[4])
			StatWindowQuest.text:SetText(dataTable[4])
			classOne:SetText(classTable[4])
			classTwo:SetText(classTable[4])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[5])
			StatWindowQuest.text:SetText(dataTable[5])
			classOne:SetText(classTable[5])
			classTwo:SetText(classTable[5])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[6])
			StatWindowQuest.text:SetText(dataTable[6])
			classOne:SetText(classTable[6])
			classTwo:SetText(classTable[6])
		end
	elseif	currentClass == "HUNTER" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[7])
			StatWindowQuest.text:SetText(dataTable[7])
			classOne:SetText(classTable[7])
			classTwo:SetText(classTable[7])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[8])
			StatWindowQuest.text:SetText(dataTable[8])
			classOne:SetText(classTable[8])
			classTwo:SetText(classTable[8])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[9])
			StatWindowQuest.text:SetText(dataTable[9])
			classOne:SetText(classTable[9])
			classTwo:SetText(classTable[9])
		end
	elseif	currentClass == "ROGUE" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[10])
			StatWindowQuest.text:SetText(dataTable[10])
			classOne:SetText(classTable[10])
			classTwo:SetText(classTable[10])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[11])
			StatWindowQuest.text:SetText(dataTable[11])
			classOne:SetText(classTable[11])
			classTwo:SetText(classTable[11])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[12])
			StatWindowQuest.text:SetText(dataTable[12])
			classOne:SetText(classTable[12])
			classTwo:SetText(classTable[12])
		end
	elseif	currentClass == "PRIEST" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[13])
			StatWindowQuest.text:SetText(dataTable[13])
			classOne:SetText(classTable[13])
			classTwo:SetText(classTable[13])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[14])
			StatWindowQuest.text:SetText(dataTable[14])
			classOne:SetText(classTable[14])
			classTwo:SetText(classTable[14])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[15])
			StatWindowQuest.text:SetText(dataTable[15])
			classOne:SetText(classTable[15])
			classTwo:SetText(classTable[15])
		end
	elseif	currentClass == "DEATHKNIGHT" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[16])
			StatWindowQuest.text:SetText(dataTable[16])
			classOne:SetText(classTable[16])
			classTwo:SetText(classTable[16])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[17])
			StatWindowQuest.text:SetText(dataTable[17])
			classOne:SetText(classTable[17])
			classTwo:SetText(classTable[17])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[18])
			StatWindowQuest.text:SetText(dataTable[18])
			classOne:SetText(classTable[18])
			classTwo:SetText(classTable[18])
		end
	elseif	currentClass == "SHAMAN" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[19])
			StatWindowQuest.text:SetText(dataTable[19])
			classOne:SetText(classTable[19])
			classTwo:SetText(classTable[19])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[20])
			StatWindowQuest.text:SetText(dataTable[20])
			classOne:SetText(classTable[20])
			classTwo:SetText(classTable[20])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[21])
			StatWindowQuest.text:SetText(dataTable[21])
			classOne:SetText(classTable[21])
			classTwo:SetText(classTable[21])
		end
	elseif	currentClass == "MAGE" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[22])
			StatWindowQuest.text:SetText(dataTable[22])
			classOne:SetText(classTable[22])
			classTwo:SetText(classTable[22])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[23])
			StatWindowQuest.text:SetText(dataTable[23])
			classOne:SetText(classTable[23])
			classTwo:SetText(classTable[23])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[24])
			StatWindowQuest.text:SetText(dataTable[24])
			classOne:SetText(classTable[24])
			classTwo:SetText(classTable[24])
		end
	elseif	currentClass == "WARLOCK" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[25])
			StatWindowQuest.text:SetText(dataTable[25])
			classOne:SetText(classTable[25])
			classTwo:SetText(classTable[25])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[26])
			StatWindowQuest.text:SetText(dataTable[26])
			classOne:SetText(classTable[26])
			classTwo:SetText(classTable[26])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[27])
			StatWindowQuest.text:SetText(dataTable[27])
			classOne:SetText(classTable[27])
			classTwo:SetText(classTable[27])
		end
	elseif	currentClass == "MONK" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[28])
			StatWindowQuest.text:SetText(dataTable[28])
			classOne:SetText(classTable[28])
			classTwo:SetText(classTable[28])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[29])
			StatWindowQuest.text:SetText(dataTable[29])
			classOne:SetText(classTable[29])
			classTwo:SetText(classTable[29])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[30])
			StatWindowQuest.text:SetText(dataTable[30])
			classOne:SetText(classTable[30])
			classTwo:SetText(classTable[30])
		end
	elseif	currentClass == "DRUID" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[31])
			StatWindowQuest.text:SetText(dataTable[31])
			classOne:SetText(classTable[31])
			classTwo:SetText(classTable[31])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[32])
			StatWindowQuest.text:SetText(dataTable[32])
			classOne:SetText(classTable[32])
			classTwo:SetText(classTable[32])
		elseif currentSpec == 3 then
			StatWindow.text:SetText(dataTable[33])
			StatWindowQuest.text:SetText(dataTable[33])
			classOne:SetText(classTable[33])
			classTwo:SetText(classTable[33])
		elseif currentSpec == 4 then
			StatWindow.text:SetText(dataTable[34])
			StatWindowQuest.text:SetText(dataTable[34])
			classOne:SetText(classTable[34])
			classTwo:SetText(classTable[34])
		end
	elseif	currentClass == "DEMONHUNTER" then
		if currentSpec == 1 then
			StatWindow.text:SetText(dataTable[35])
			StatWindowQuest.text:SetText(dataTable[35])
			classOne:SetText(classTable[35])
			classTwo:SetText(classTable[35])
		elseif currentSpec == 2 then
			StatWindow.text:SetText(dataTable[36])
			StatWindowQuest.text:SetText(dataTable[36])
			classOne:SetText(classTable[36])
			classTwo:SetText(classTable[36])
		end
	end	
end

dataTable = {
[0] = "",
[1] = "Intellect > Haste > Mastery > Versatility > Critical Strike", -- Holy Paladin
[2] = "Haste > Mastery > Versatility > Critical Strike", -- Protection Paladin
[3] = "Strength > Haste = Versatility = Mastery = Critical Strike", -- Retribution Paladin
[4] = "Strength > Haste to 20% > Critical Strike > Mastery > Versatility", -- Arms Warrior
[5] = "Strength > Haste > Mastery > Critical Strike > Versatility", -- Fury Warrior
[6] = "Haste > Versatility > Mastery > Critical Strike > Strength > Armor", -- Protection Warrior
[7] = "Haste > Critical Strike > Versatility > Mastery", -- Beast Mastery Hunter
[8] = "Critical Strike > Mastery > Versatility > Haste", -- Marksmanship Hunter
[9] = "Haste > Versatility = Critical Strike > Mastery", -- Survival Hunter
[10] = "Critical Strike > Versatility > Mastery > Haste", -- Assassination Rogue
[11] = "Versatility > Haste > Critical Strike > Mastery", -- Outlaw Rogue
[12] = "Critical Strike > Versatility > Mastery > Haste", -- Subtlety Rogue
[13] = "Intellect > Haste > Critical Strike > Versatility > Mastery", -- Discipline Priest
[14] = "Intellect > Critical Strike > Haste > Versatility > Mastery", -- Holy Priest
[15] = "Intellect > Haste = Mastery > Critical Strike > Versatility", -- Shadow Priest
[16] = "Strength > Versatility > Haste > Critical Strike > Mastery", -- Blood Death Knight
[17] = "Mastery > Critical Strike > Haste > Versatility", -- Frost Death Knight
[18] = "Mastery > Haste > Critical Strike = Versatility", -- Unholy Death Knight
[19] = "Intellect > Versatility > Haste > Critical Strike > Mastery", -- Elemental Shaman
[20] = "Agility > Haste > Critical Strike = Versatility > Mastery", -- Enhancement Shaman
[21] = "Intellect > Versatility = Critical Strike > Haste = Mastery", -- Restoration Shaman
[22] = "Intellect > Critical Strike > Mastery > Versatility > Haste", -- Arcane Mage
[23] = "Intellect > Haste > Versatility > Mastery > Critical Strike", -- Fire Mage
[24] = "Intellect > Critical Strike to 33.34% > Haste > Versatility > Mastery", -- Frost Mage
[25] = "Intellect > Mastery > Haste > Critical Strike > Versatility", -- Affliction Warlock
[26] = "Intellect > Haste > Mastery > Critical Strike = Versatility", -- Demonology Warlock
[27] = "Intellect > Haste > Mastery > Critical Strike > Versatility", -- Destruction Warlock
[28] = "Versatility = Mastery = Critical Strike > Haste > Agility", -- Brewmaster Monk
[29] = "Intellect > Critical Strike > Versatility > Haste > Mastery", -- Mistweaver Monk
[30] = "Agility > Versatility > Mastery > Critical Strike > Haste", -- Windwalker Monk
[31] = "Intellect > Mastery > Versatility > Haste > Critical Strike", -- Balance Druid
[32] = "Agility > Critical Strike > Mastery > Versatility > Haste", -- Feral Druid
[33] = "Armor = Agility = Stamina > Versatility > Mastery > Haste > Critical Strike", -- Guardian Druid
[34] = "Intellect > Mastery = Haste > Versatility > Critical Strike", -- Restoration Druid
[35] = "Agility > Haste = Versatility > Critical Strike > Mastery", -- Havoc Demon Hunter
[36] = "Agility > Haste > Versatility > Critical Strike > Mastery", -- Vengeance Demon Hunter
}