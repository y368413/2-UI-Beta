-------------------------------------------------------------------------------
-- French localization
-------------------------------------------------------------------------------

if (GetLocale() ~= "frFR") then return end

local _, addon = ...
local baseLocale = {
    ["Selected Team"] = "\195\137quipe s\195\169lectionn\195\169e",
    ["Team Roster"] = "Liste des \195\169quipes",
    ["Teams and Pets"] = "\195\137quipes et Mascottes",
    ["Display pets xp as part of the pets level"] = "Afficher l'exp\195\169rience des mascottes comme partie du niveau des mascottes",
    ["Display pets xp instead of the health bar"] = "Afficher l'exp\195\169rience des mascottes \195\160 la place de la barre de sant\195\169",
    ["Display team name above the team"] = "Afficher le nom de l'\195\169quipe au-dessus de l'\195\169quipe",
    ["Enable mouse wheel scrolling for the selected team"] = "Activer le d\195\169filement de la molette de la souris pour l'\195\169quipe s\195\169lectionn\195\169e",
    ["When enabled allows you to change the selected team by using the mouse wheel on the selected team (above the roster)"] = "Lorsqu'activ\195\169, permet de changer l'\195\169quipe s\195\169lectionn\195\169e en utilisant la molette de la souris sur l'\195\169quipe s\195\169lectionn\195\169e (au-dessus du roster)",
    ["Main"] = "Principal",
    ["Attach PetBattle Teams to Pet Journal"] = "Attacher les \195\137quipes de Bataille de Mascottes au Journal des Mascottes",
    ["When attached, PetBattle Teams will only be usable from the Pet Journal."] = "Lorsqu'attach\195\169, les \195\137quipes de Bataille de Mascottes ne seront utilisables que depuis le Journal des Mascottes.",
    ["Hide PetBattle Teams while in combat or in a Pet Battle"] = "Cacher les \195\137quipes de Bataille de Mascottes pendant un combat ou une Bataille de Mascottes",
    ["Hides PetBattle Teams while in combat or in a Pet Battle."] = "Cache les \195\137quipes de Bataille de Mascottes pendant un combat ou une Bataille de Mascottes.",
    ["Lock PetBattle Teams Position"] = "Verrouiller la Position des \195\137quipes de Bataille de Mascottes",
    ["When the team frame is not attached to the Pet Journal then if the frame is locked it cannot be moved."] = "Lorsque le cadre de l'\195\169quipe n'est pas attach\195\169 au Journal des Mascottes, si le cadre est verrouill\195\169, il ne peut pas \195\170tre d\195\169plac\195\169.",
    ["Show the selected team indicator"] = "Afficher l'indicateur de l'\195\169quipe s\195\169lectionn\195\169e",
    ["When enabled:|nThe currently selected team will have its pets updated to match the pet journal at all times unless the selected team is locked.|n|nNewly created teams will be created using the currently selected pets."] = "Lorsqu'activ\195\169 :|nL'\195\169quipe actuellement s\195\169lectionn\195\169e aura ses mascottes mises \195\160 jour pour correspondre au journal des mascottes en tout temps, \195\160 moins que l'\195\169quipe s\195\169lectionn\195\169e ne soit verrouill\195\169e.|n|nLes nouvelles \195\169quipes seront cr\195\169\195\169es en utilisant les mascottes actuellement s\195\169lectionn\195\169es.",
    ["Show control buttons"] = "Afficher les boutons de contr\195\180le",
    ["When enabled, Your active pet will be dismissed when switching teams"] = "Lorsqu'activ\195\169, votre mascotte active sera renvoy\195\169e lors du changement d'\195\169quipes",
    ["Show the team roster"] = "Afficher le roster de l'\195\169quipe",
    ["Attempts to reconstuct teams with invalid pets"] = "Tente de reconstruire des \195\169quipes avec des mascottes invalides",
    ["Tooltip"] = "Infobulle",
    ["Show keybinding helper text in tooltip"] = "Afficher le texte d'aide de raccourcis dans l'infobulle",
    ["Show breed information in tooltip"] = "Afficher les informations de race dans l'infobulle",
    ["Team Management"] = "Gestion d'\195\137quipe",
    ["Automatically Save Teams"] = "Sauvegarder automatiquement les \195\169quipes",
    ["Automatically Dismiss pet after team changes"] = "Renvoyer automatiquement la mascotte apr\195\168s les changements d'\195\169quipe",
    ["Reconstruct teams"] = "Reconstruire les \195\169quipes",
    ["Unlock all existing teams"] = "D\195\169verrouiller toutes les \195\169quipes existantes",
    ["This does not prevent you from locking individual teams."] = "Cela ne vous emp\195\170che pas de verrouiller des \195\169quipes individuelles.",
    ["Lock all existing teams"] = "Verrouiller toutes les \195\169quipes existantes",
    ["This does not lock newly created teams or prevent you from unlocking individual teams."] = "Cela ne verrouille pas les \195\169quipes nouvellement cr\195\169\195\169es ou ne vous emp\195\170che pas de d\195\169verrouiller des \195\169quipes individuelles.",
    ["Delete all teams"] = "Supprimer toutes les \195\169quipes",
    ["Permanently deletes all teams. There is no confirmation for this action."] = "Supprime d\195\169finitivement toutes les \195\169quipes. Il n'y a pas de confirmation pour cette action.",
    ["Reset UI"] = "R\195\169initialiser l'interface utilisateur",
    ["Resets the UI to its default settings. There is no confirmation for this action."] = "R\195\169initialise l'interface utilisateur aux param\195\168tres par d\195\169faut. Il n'y a pas de confirmation pour cette action.",
}


addon:RegisterLocale('frFR', baseLocale)

