local WarlockFrame = CreateFrame("FRAME"); -- Need a frame to respond to events
WarlockFrame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
WarlockFrame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out

local Settings_HighestDemonCount = 0
local Settings_HighestEmpoweredCount = 0
local Settings_HighestConsumptionCount = 0
local Settings_HighestEmpoweredConsumptionCount = 0
local Settings_HideOutOfCombat = false
local Settings_HideOutOfDemonology = true

-------------------------------------------------------------------------------------------------v1.2

function ZapLib_FrameMoveable(unlock, movframe)
    if(unlock) then
        -- WarlockFrame movement
        movframe:EnableMouse(true)      
    else
        -- WarlockFrame dismovement
        movframe:EnableMouse(false)
    end
    movframe:RegisterForDrag("LeftButton")
    movframe:SetScript("OnDragStart", function(self) self:StartMoving() end)
    movframe:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
end

function ZapLib_DoubleDigit(num)
    if(num < 10) then return "0"..num;
    else return num;
    end
end

function UnitHasBuff(Unit, ID)
    local HasBuff = false;
    for i = 1, 40 do
        local BuffID = select(11,UnitBuff(Unit, i));
        if (BuffID == ID) then
            HasBuff = true;
        end
    end
    return HasBuff;
end

--------------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- Warlockbox demon and demon empowerment tracker by Zaperox
-- Based on ElvUI Wild Imps Tracker By Lockslap which in turn is
-- Based on Imps by Kuni!
-------------------------------------------------------------------------------
local demonTime, demonEmpowered = {}, {}
local alreadyRegistered = false
local demonCount = 0
local empowered_demonCount = 0
local lastEnpowermentCast = 0
local petActive = 0
local petEmpowered = 0
local playerGUID
local CurrentDemon = PET_TYPE_DEMON
local EmpowermentTimeLeft = 0
local EmpowermentcastingTime = 1.5 --1.5 seconds is the default amount of time

local DemonicTable = {
    --Regular warlock pet codes
    ["1863"] = "Succubus",  --Warlockbox_Succubus
    ["120527"] = "Succubus",
    ["120526"] = "Succubus",
    ["416"] = "Imp",        --Warlockbox_Imp
    ["58959"] = "Imp",
    ["1860"] = "Voidwalker",  
    ["58960"] = "Voidwalker",
    ["417"] = "Felhunter",
    ["17252"] = "Felguard",
    ["11859"] = "Doomguard",
    ["89"] = "Infernal",
    ["58964"] = "Observer",
    ["58963"] = "Shivarra",
    ["58965"] = "Wrathguard",
    --Summoned pets
    ["55659"] = "Wild Imp",
    ["98035"] = "Dreadstalker",
    ["99737"] = "Wild Imp" -- the ones on top of dreadstalkers
    --Doomguard and infernal should be the same
}

local function ShowWindow(bool)
    if(Settings_HideOutOfCombat) then
        if(bool and InCombatLockdown()) then
            WarlockboxGUI:Show()
        else
            WarlockboxGUI:Hide()
        end
    else
        if(bool) then
            WarlockboxGUI:Show()
        else
            WarlockboxGUI:Hide()
        end
    end
end

local WarlockboxGUI = CreateFrame("Frame", "WarlockboxGUI", UIParent)
WarlockboxGUI:SetBackdrop({
	bgFile = "Interface\\dialogframe\\ui-dialogbox-background-dark",
	edgeFile = "Interface\\tooltips\\UI-tooltip-Border",
	tile = true,
	tileSize = 32,
	edgeSize = 8,
	insets = {
		left = 1,
		right = 1,
		top = 1,
		bottom = 1,
	},
})
WarlockboxGUI:SetWidth(160)
WarlockboxGUI:SetHeight(30)
WarlockboxGUI:SetPoint("CENTER")
WarlockboxGUI:SetMovable(true)

local WarlockboxGUIImp = WarlockboxGUI:CreateFontString("WarlockboxGUI", "OVERLAY")
--WarlockboxGUIImp:SetTexture("Interface\\AddOns\\Warlockbox\\"..CurrentDemon..".tga")
WarlockboxGUIImp:SetFont(STANDARD_TEXT_FONT, 12, "OUTLINE")
WarlockboxGUIImp:SetWidth(85)
WarlockboxGUIImp:SetHeight(85)
WarlockboxGUIImp:SetText(CurrentDemon)
WarlockboxGUIImp:SetPoint("RIGHT", -55, 0)
    
-- Empowerment artwork
local WarlockboxGUIEmpowerment = WarlockboxGUI:CreateTexture("impGraphic")
WarlockboxGUIEmpowerment:SetTexture("Interface\\Icons\\spell_warlock_demonicempowerment")
WarlockboxGUIEmpowerment:SetWidth(26)
WarlockboxGUIEmpowerment:SetHeight(26)
WarlockboxGUIEmpowerment:SetPoint("TOPRIGHT", 21, -2)
WarlockboxGUIEmpowerment:SetVertexColor(1, 1, 1, 1)

-- Countdown string
local demonCounter = WarlockboxGUI:CreateFontString("demonCounter")
demonCounter:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Eggo.ttf", 24, "OUTLINE")
demonCounter:SetTextColor(1, 1, 1, 1)
demonCounter:SetText("0 / 0")
demonCounter:SetJustifyH("CENTER")
demonCounter:SetJustifyV("TOP")
demonCounter:SetPoint("RIGHT", WarlockboxGUI, -5, 0)

-- count string
local empowermentCountdown = WarlockboxGUI:CreateFontString("empowermentCountdown")
empowermentCountdown:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Eggo.ttf", 18, "OUTLINE")
empowermentCountdown:SetTextColor(1, 1, 1, 1)
empowermentCountdown:SetText()
empowermentCountdown:SetJustifyH("CENTER")
empowermentCountdown:SetJustifyV("TOP")
empowermentCountdown:SetPoint("TOPRIGHT", WarlockboxGUI, 30, -8)
empowermentCountdown:Hide()

local function isDemonology()
	if (GetSpecialization() == 2) then
        return true
    else
        return false
    end
end

local function isWarlock()
    local _, class = UnitClass("player")
    if (class == "WARLOCK") then
        return true
    else
        return false
    end
end

local function RegisterifyAddon()
if (isWarlock() and (isDemonology() or not Settings_HideOutOfDemonology)) then
		if not alreadyRegistered then
			WarlockboxGUI:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			alreadyRegistered = true
			_, _, _, EmpowermentcastingTime = GetSpellInfo(193396)
		end
		ShowWindow(true)
	else
		if alreadyRegistered then
			WarlockboxGUI:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
			alreadyRegistered = false
		end
		WarlockboxGUI:Hide()
	end
end

-- events
function WarlockboxGUI:CHARACTER_POINTS_CHANGED(self, event, ...)
	RegisterifyAddon()
end

function WarlockboxGUI:PLAYER_TALENT_UPDATE(self, event, ...)
	RegisterifyAddon()
end

function WarlockboxGUI:ACTIVE_TALENT_GROUP_CHANGED(self, event, ...)
	RegisterifyAddon()
end

function WarlockboxGUI:PLAYER_ENTERING_WORLD(self, event, ...)
	playerGUID = UnitGUID("player")
	
        demonCounter:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Eggo.ttf", 24, "OUTLINE")
        --demonCounter:SetFont(STANDARD_TEXT_FONT, 24, "OUTLINE")
    
        WarlockboxGUIImp:Show()
        WarlockboxGUI:SetWidth(120)
    
    ZapLib_FrameMoveable(true, WarlockboxGUI)
    
	-- only if they pass the checks will we actually look at the combat log
	if (isWarlock() and (isDemonology() or not Settings_HideOutOfDemonology)) then
		WarlockboxGUI:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		ShowWindow(true)
		alreadyRegistered = true
	else
		WarlockboxGUI:Hide()
	end
	
	-- events to watch to see if they switched to a demo spec
	WarlockboxGUI:RegisterEvent("CHARACTER_POINTS_CHANGED")
	WarlockboxGUI:RegisterEvent("PLAYER_TALENT_UPDATE")
	WarlockboxGUI:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED")
	
	WarlockboxGUI:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

function EmpowermentTickdown()
    if(EmpowermentTimeLeft > 0) then
        EmpowermentTimeLeft = EmpowermentTimeLeft - 0.25
        empowermentCountdown:SetText(ZapLib_DoubleDigit(floor(EmpowermentTimeLeft)))
		if(EmpowermentTimeLeft < EmpowermentcastingTime) then
			empowermentCountdown:SetTextColor(1,0,0);
        elseif(EmpowermentTimeLeft < (EmpowermentcastingTime * 2)) then
            empowermentCountdown:SetTextColor(1,1,0);
		else
			empowermentCountdown:SetTextColor(1,1,1);
		end
    else
        empowermentCountdown:SetText("")
        empowermentCountdown:Hide()
        WarlockboxGUIEmpowerment:SetVertexColor(1, 1, 1, 1)
    end
end
C_Timer.NewTicker(0.25, function() EmpowermentTickdown() end)

function WarlockboxGUI:COMBAT_LOG_EVENT_UNFILTERED(self, event, ...)  
    if(Settings_HideOutOfCombat and not InCombatLockdown()) then
        WarlockboxGUI:Hide()
    else
        WarlockboxGUI:Show()
    end

	local compTime = GetTime()
	local combatEvent = select(1, ...)
	local sourceGUID = select(3, ...)
	local destGUID = select(7, ...)
    local spellId = select(11, ...)
    local destNPCID = select(6,strsplit("-",destGUID))
    local DemonName = DemonicTable[destNPCID]
		
	-- time out any demons
	for index, value in pairs(demonTime) do
		if (value) < compTime then
			demonTime[index] = nil
			demonCount = demonCount - 1
            
			--print(("Demon timed out. Count: |cff00ff00%d|r"):format(demonCount))
		end
	end
	 
	-- demon died
	if combatEvent == "UNIT_DIED" then
		for index, value in pairs(demonTime) do
			if destGUID == index then
				demonTime[index] = nil
				demonCount = demonCount - 1
                
				--print(("Demon died. Count: |cff00ff00%d|r"):format(demonCount))
			end
		end
	end
    
    local function doEmpoweredDemonCount()
        empowered_demonCount = 0
        for index, value in pairs(demonTime) do
            if(demonEmpowered[index] ~= nil) then
                if(demonEmpowered[index] < GetTime() + 10) then
                    empowered_demonCount = empowered_demonCount + 1
                end
            end
        end
    end
    
    doEmpoweredDemonCount()
    
    -- player casts Demonic Empowerment
	if combatEvent == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID("player") and spellId == 193396 then
        lastEnpowermentCast = GetTime()
        -- empower demons
        for index, value in pairs(demonTime) do
            demonEmpowered[index] = GetTime()
            --print("Demon empowered.")
        end
        doEmpoweredDemonCount()
        --Start the tickdown timer
        EmpowermentTimeLeft = 12
        WarlockboxGUIEmpowerment:SetVertexColor(0.5, 0.5, 0.5, 0.5)
        empowermentCountdown:Show()
	end
    
    -- unempower demons after 10 seconds
    for index, value in pairs(demonTime) do
        if(demonEmpowered[index] ~= nil) then --if not nil
            if(demonEmpowered[index] < GetTime() - 10) then
                demonEmpowered[index] = nil
                --print("Demon unempowered.")
            end
        end
    end
	
	-- imp summoned
	if combatEvent == "SPELL_SUMMON" and DemonName == "Wild Imp" and sourceGUID == playerGUID then
		demonTime[destGUID] = compTime + 12 --Imps last 12 seconds
        demonEmpowered[destGUID] = nil
		demonCount = demonCount + 1
		
		--print(("Imp spawned. Count: |cff00ff00%d|r"):format(demonCount))
        EmpowermentTimeLeft = 0
	end
    
    -- Dreadstalker summoned
	if combatEvent == "SPELL_SUMMON" and DemonName == "Dreadstalker" and sourceGUID == playerGUID then
		demonTime[destGUID] = compTime + 12 --Dreadstalkers last 12 seconds
        demonEmpowered[destGUID] = nil
		demonCount = demonCount + 1
        
		--print(("Dreadstalker spawned. Count: |cff00ff00%d|r"):format(demonCount))
        EmpowermentTimeLeft = 0
	end
    
    -- Doomguard summoned
	if combatEvent == "SPELL_SUMMON" and DemonName == "Doomguard" and sourceGUID == playerGUID and not IsSpellKnown(152107) then
		demonTime[destGUID] = compTime + 25 --Doomguard last 25 seconds
        demonEmpowered[destGUID] = nil
		demonCount = demonCount + 1
        
		--print(("Doomguard spawned. Count: |cff00ff00%d|r"):format(demonCount))
        EmpowermentTimeLeft = 0
	end
    
    -- Infernal summoned
	if combatEvent == "SPELL_SUMMON" and DemonName == "Infernal" and sourceGUID == playerGUID and not IsSpellKnown(152107) then
		demonTime[destGUID] = compTime + 25 --Infernal last 25 seconds
        demonEmpowered[destGUID] = nil
		demonCount = demonCount + 1
        
		--print(("Infernal spawned. Count: |cff00ff00%d|r"):format(demonCount))
        EmpowermentTimeLeft = 0
	end
    
    -- Darkglare summoned
	if combatEvent == "SPELL_SUMMON" and DemonName == "Darkglare" and sourceGUID == playerGUID then
		demonTime[destGUID] = compTime + 12 --Darkglare last 12 seconds
        demonEmpowered[destGUID] = nil
		demonCount = demonCount + 1
        
		--print(("Darkglare spawned. Count: |cff00ff00%d|r"):format(demonCount))
        EmpowermentTimeLeft = 0
	end
    
    -- Grimoire of Service summon
	if combatEvent == "SPELL_SUMMON" and sourceGUID == playerGUID then
		if(spellId == 111859 or spellId == 111897 or spellId == 111898 or spellId == 111896 or spellId == 111895) then --if it is a grimoire summon
            demonTime[destGUID] = compTime + 25 --Grimoire of Service summon last 25 seconds
            demonEmpowered[destGUID] = nil
            demonCount = demonCount + 1
            --print(("Grimoire of Service summon. Count: |cff00ff00%d|r"):format(demonCount))
            EmpowermentTimeLeft = 0
        end
	end
    
    -- if the warlock has a pet
    if(UnitExists("pet")) then
        petActive = 1
        
        local PetNPCID = select(6,strsplit("-",UnitGUID("pet")))
        CurrentDemon = DemonicTable[PetNPCID]
        
            WarlockboxGUIImp:SetWidth(85)
            WarlockboxGUIImp:SetHeight(85)
        
        if(CurrentDemon ~= nil) then --if its not a Enslaved demon
            if(CurrentDemon == "Doomguard") then
                WarlockboxGUIImp:SetText("末日守卫")
            elseif(CurrentDemon == "Felguard") then
                WarlockboxGUIImp:SetText("恶魔卫士")
            elseif(CurrentDemon == "Felhunter") then
                WarlockboxGUIImp:SetText("地狱猎犬")
	          elseif(CurrentDemon == "Fel Imp") then
	              WarlockboxGUIImp:SetText("小鬼")
            elseif(CurrentDemon == "Infernal") then
                WarlockboxGUIImp:SetText("地狱火")
            elseif(CurrentDemon == "Imp") then
                WarlockboxGUIImp:SetText("小鬼")
            elseif(CurrentDemon == "Observer") then
                WarlockboxGUIImp:SetText("眼魔")
            elseif(CurrentDemon == "Shivarra") then
                WarlockboxGUIImp:SetText("破坏魔")
            elseif(CurrentDemon == "Succubus") then
                WarlockboxGUIImp:SetText("魅魔")
	          elseif(CurrentDemon == "Voidlord") then
	              WarlockboxGUIImp:SetText("蓝胖子") 
            elseif(CurrentDemon == "Voidwalker") then
                WarlockboxGUIImp:SetText("蓝胖子")
            elseif(CurrentDemon == "Wrathguard") then
                WarlockboxGUIImp:SetText("愤怒守卫")
            else
                --WarlockboxGUIImp:SetTexture("Interface\\AddOns\\Warlockbox\\"..CurrentDemon..".tga")
                WarlockboxGUIImp:SetText(CurrentDemon)
            end
        else
           WarlockboxGUIImp:SetText(PET_TYPE_DEMON)
        end
              
        if(UnitHasBuff("pet", 193396)) then
            petEmpowered = 1
        else
            petEmpowered = 0
        end
        
    else
        petActive = 0
        petEmpowered = 0
    end
	
	demonCounter:SetText((demonCount + petActive.." / |cff00ff00%d|r"):format(empowered_demonCount + petEmpowered))
    
    --setting the players highscores
    if(Settings_HighestDemonCount < (demonCount + petActive)) then
        Settings_HighestDemonCount = demonCount + petActive
    end
    if(Settings_HighestEmpoweredCount < (empowered_demonCount + petEmpowered)) then
        Settings_HighestEmpoweredCount = empowered_demonCount + petEmpowered
    end
	
	--Thal'kiel's Consumption highscore
	if combatEvent == "SPELL_CAST_SUCCESS" and sourceGUID == UnitGUID("player") and spellId == 211714 then
		if(Settings_HighestEmpoweredConsumptionCount < (empowered_demonCount + petEmpowered)) then
			Settings_HighestEmpoweredConsumptionCount = empowered_demonCount + petEmpowered
		end
		if(Settings_HighestConsumptionCount < (demonCount + petActive)) then
			Settings_HighestConsumptionCount = demonCount + petActive
		end
	end
end

WarlockboxGUI:SetScript("OnEvent", function(self, event, ...)
    self[event](self, event, ...)
end)
WarlockboxGUI:RegisterEvent("PLAYER_ENTERING_WORLD")
WarlockboxGUI:RegisterEvent("PLAYER_LOGOUT")