--## Title: CancelPetFight ## Author: Znuff ## Version: v1.0.1

local CancelPet = CreateFrame("Frame", nil, UIParent)
-- Table & Variables for "known" wild pets.
local CPF = {}
CancelPet:RegisterEvent("PET_BATTLE_OPENING_START")
CancelPet:RegisterEvent("PET_BATTLE_OVER")
CancelPet:RegisterEvent("VARIABLES_LOADED")
CancelPet:RegisterEvent("UPDATE_MOUSEOVER_UNIT")  

StaticPopupDialogs["NO_RARE_PET"] = {
    text = COMBAT_TEXT_NONE .. ITEM_QUALITY_COLORS[3].hex .. GARRISON_MISSION_RARE .. PET_TYPE_PET ..". → |cffff0000ESCAPE|r ←",
    button1 = START ,
    button2 = PASS ,
    whileDead = false,
    showAlert = true,
    OnCancel = function(self) C_PetBattles.ForfeitGame(); end,
    timeout = 0,
    exclusive = 1,
    hideOnEscape = 1,
    preferredIndex = 3,
};

-- code shamelessly stolen from Phanx's addon
CPF_Frame = CreateFrame("Button", ADDON, UIParent)
CPF_Frame:SetAllPoints(true)
CPF_Frame:SetFrameStrata("FULLSCREEN_DIALOG")
CPF_Frame:RegisterForClicks("AnyUp")
CPF_Frame:EnableKeyboard(true)
CPF_Frame:Hide()
CPF_Frame.bg = CPF_Frame:CreateTexture(nil, "BACKGROUND")
CPF_Frame.bg:SetAllPoints(true)
CPF_Frame.bg:SetTexture(0, 0, 0, 0.5)
CPF_Frame.text = CPF_Frame:CreateFontString(nil, "OVERLAY", "PVPInfoTextFont")
CPF_Frame.text:SetPoint("CENTER")
CPF_Frame.text:SetText(COMBAT_TEXT_NONE .. ITEM_QUALITY_COLORS[3].hex .. GARRISON_MISSION_RARE .. PET_TYPE_PET ..".|n|n|" .. NPE_CLOSECHARACTERSHEET .." |n" .. HELPFRAME_REPORT_PLAYER_RIGHT_CLICK .. CONTINUE)

CPF_Frame:SetScript("OnClick", function(self, button)
    if button == "LeftButton" then C_PetBattles.ForfeitGame() end
    self:Hide()
end)

PetBattleFrame.BottomFrame.ForfeitButton:SetScript("OnClick", function(...)
    if IsShiftKeyDown() then C_PetBattles.ForfeitGame() else PetBattleForfeitButton_OnClick(...) end
end)

function DoPetLink(pet)
    local name = C_PetBattles.GetName(2, pet)
    local speciesID = C_PetBattles.GetPetSpeciesID(2, pet)
    local level = C_PetBattles.GetLevel(2, pet)
    local quality = C_PetBattles.GetBreedQuality(2, pet)-1
    local health = C_PetBattles.GetMaxHealth(2, pet)
    local power = C_PetBattles.GetPower(2, pet)
    local speed = C_PetBattles.GetSpeed(2, pet)  
    return string.format("%s|Hbattlepet:%s:%s:%s:%s:%s:%s:|h[%s]|h|r", ITEM_QUALITY_COLORS[quality].hex, speciesID, level, quality, health, power, speed, name)
end

CancelPet:SetScript("OnEvent", function(frame, event, ...)
    if event == "PET_BATTLE_OPENING_START" then    
        for i=1,C_PetBattles.GetNumPets(2) do message = DoPetLink(i) .. " " end    
        --if CPF[UnitGUID("target")] then print("|cff33ff99CPF|r: Been here already!") end  
        SELECTED_CHAT_FRAME:AddMessage(message)       
          if C_PetBattles.GetBreedQuality(2,1) < 4 and C_PetBattles.GetBreedQuality(2,2) < 4 and C_PetBattles.GetBreedQuality(2,3) < 4 then                
             if C_PetBattles.IsWildBattle() then StaticPopup_Show("NO_RARE_PET") elseif C_PetBattles.IsWildBattle() then CPF_Frame:Show() end
          end
    --elseif event == "PET_BATTLE_OVER" then CPF[UnitGUID("target")] = 1    
    elseif event == "UPDATE_MOUSEOVER_UNIT" then
        local inInstance, instanceType = IsInInstance()
        if not (UnitAffectingCombat("player") or UnitInRaid("player") or IsInInstance() or GetRaidTargetIndex("mouseover")) and CPF[UnitGUID("mouseover")] then
            SetRaidTarget("mouseover", 2)
        end    
    end
end)
