local modName, core = ...
core.Commands = {}

local Localization = core.Localization
local Config = core.Config
local Helper = core.Helper
local Main = core.Main
local UI = core.UI
local Commands = core.Commands

local function help()
    print("--")
    Helper:PrintDefault(Localization.LIST_OF_COMMANDS)
    Helper:PrintCommand("/ra reward", Localization.PRINT_REWARD_ACHIEVEMENTS)
    Helper:PrintCommand("/ra update", Localization.UPDATE_ACHIEVEMENTS_INFORMATION)
    Helper:PrintCommand("/ra log", Localization.TOGGLE_LOG)
    Helper:PrintCommand("/ra help", Localization.PRINT_HELP)
    print("--")
end

local function toggleLog()
    Config.log = not Config.log
    local loggingStatus = (Config.log and Localization.ENABLED or Localization.DISABLED)
    Helper:PrintDefault(Localization.LOG .. " " .. loggingStatus)
end

local function update()
    Helper:PrintDefault(Localization.UPDATE_STARTED)
    C_Timer.After(
        0,
        function()
            Main:UpdateCache()
            Helper:PrintDefault(Localization.UPDATE_FINISHED)
        end
    )
end

local function reward()
    Helper:PrintDefault(Localization.LIST_OF_REWARD_ACHIEVEMENTS)
    Main:ShowRewardAchievements()
end

--handle / command
Commands = {
    ["help"] = help,
    ["log"] = toggleLog,
    ["update"] = update,
    ["reward"] = reward
}

local function HandleSlashCommands(str)
    if (#str == 0) then
        Commands.help()
        return
    end
    local args = {}
    for _, arg in ipairs({string.split(" ", str)}) do
        if (#arg > 0) then
            table.insert(args, arg)
        end
    end
    local path = Commands
    for id, arg in ipairs(args) do
        if (#arg > 0) then
            arg = arg:lower()
            if (path[arg]) then
                if (type(path[arg]) == "function") then
                    path[arg](select(id + 1, unpack(args)))
                    return
                else
                    Commands.help()
                    return
                end
            end
        end
    end
end

_G["SLASH_" .. modName .. "1"] = "/ra"
SlashCmdList[modName] = HandleSlashCommands
