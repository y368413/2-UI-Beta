-------------------------------------------------------------------------------
-- English localization (Default)
-------------------------------------------------------------------------------
local _, addon = ...
local baseLocale = {
    ["Selected Team"] = "Selected Team",
    ["Team Roster"] = "Team Roster",
    ["Teams and Pets"] = "Teams and Pets",
    ["Display pets xp as part of the pets level"] = "Display pets xp as part of the pets level",
    ["Display pets xp instead of the health bar"] = "Display pets xp instead of the health bar",
    ["Display team name above the team"] = "Display team name above the team",
    ["Enable mouse wheel scrolling for the selected team"] = "Enable mouse wheel scrolling for the selected team",
    ["When enabled allows you to change the selected team by using the mouse wheel on the selected team (above the roster)"] = "When enabled allows you to change the selected team by using the mouse wheel on the selected team (above the roster)",
    ["Main"] = "Main",
    ["Attach PetBattle Teams to Pet Journal"] = "Attach PetBattle Teams to Pet Journal",
    ["When attached, PetBattle Teams will only be usable from the Pet Journal."] = "When attached, PetBattle Teams will only be usable from the Pet Journal.",    
    ["Hide PetBattle Teams while in combat or in a Pet Battle"] = "Hide PetBattle Teams while in combat or in a Pet Battle",
    ["Hides PetBattle Teams while in combat or in a Pet Battle."] = "Hides PetBattle Teams while in combat or in a Pet Battle.",    
    ["Lock PetBattle Teams Position"] = "Lock PetBattle Teams Position",
    ["When the team frame is not attached to the Pet Journal then if the frame is locked it cannot be moved."] = "When the team frame is not attached to the Pet Journal then if the frame is locked it cannot be moved.",
    ["Show the selected team indicator"] = "Show the selected team indicator",
    ["When enabled:|nThe currently selected team will have its pets updated to match the pet journal at all times unless the selected team is locked.|n|nNewly created teams will be created using the currently selected pets."] = "When enabled:|nThe currently selected team will have its pets updated to match the pet journal at all times unless the selected team is locked.|n|nNewly created teams will be created using the currently selected pets.",
    ["Show control buttons"] = "Show control buttons",
    ["When enabled, Your active pet will be dismissed when switching teams"] = "When enabled, Your active pet will be dismissed when switching teams",
    ["Show the team roster"] = "Show the team roster",
    ["Attempts to reconstuct teams with invalid pets"] = "Attempts to reconstuct teams with invalid pets",
    ["Tooltip"] = "Tooltip",
    ["Show keybinding helper text in tooltip"] = "Show keybinding helper text in tooltip",
    ["Show breed information in tooltip"] = "Show breed information in tooltip",
    ["Team Management"] = "Team Management",
    ["Automatically Save Teams"] = "Automatically Save Teams",
    ["Automatically Dismiss pet after team changes"] = "Automatically Dismiss pet after team changes",
    ["Reconstruct teams"] = "Reconstruct teams",
    ["Unlock all existing teams"] = "Unlock all existing teams",
    ["This does not prevent you from locking individual teams."] = "This does not prevent you from locking individual teams.",
    ["Lock all existing teams"] = "Lock all existing teams",
    ["This does not lock newly created teams or prevent you from unlocking individual teams."] = "This does not lock newly created teams or prevent you from unlocking individual teams.",
    ["Delete all teams"] = "Delete all teams",
    ["Permanently deletes all teams. There is no confirmation for this action."] = "Permanently deletes all teams. There is no confirmation for this action.",
    ["Reset UI"] = "Reset UI",
    ["Resets the UI to its default settings. There is no confirmation for this action."] = "Resets the UI to its default settings. There is no confirmation for this action.",
}


addon:RegisterLocale('enUS', baseLocale)