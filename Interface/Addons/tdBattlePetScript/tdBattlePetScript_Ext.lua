--## Author: scdhao ## Version: 1.0.1  tdBattlePetScript命令扩展
local inited = false
local function registerTdScript()
    if tdBattlePetScript then
        if inited then
            return
        end
        tdBattlePetScript:RegisterCondition(
            "count",
            {type = "compare", arg = false},
            function(owner, pet)
                return C_PetBattles.GetNumPets(owner)
            end
        )

        tdBattlePetScript:RegisterCondition(
            "hp.explode",
            {type = "boolean", arg = false},
            function(owner, pet)
                local player, enemy
                if owner == LE_BATTLE_PET_ENEMY then
                    player = C_PetBattles.GetActivePet(LE_BATTLE_PET_ALLY)
                    enemy = pet
                else
                    player = pet
                    enemy = C_PetBattles.GetActivePet(LE_BATTLE_PET_ENEMY)
                end
                return C_PetBattles.GetHealth(LE_BATTLE_PET_ENEMY, enemy) <
                    floor(C_PetBattles.GetMaxHealth(LE_BATTLE_PET_ALLY, player) * 0.4)
            end
        )
        inited = true
    end
end

local frame = CreateFrame("FRAME", nil, UIParent)
frame:SetScript(
    "OnEvent",
    function()
        registerTdScript()
    end
)
frame:RegisterEvent("ADDON_LOADED")
