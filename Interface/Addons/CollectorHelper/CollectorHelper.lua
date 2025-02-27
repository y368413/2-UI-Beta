-- ============================================================================
-- CollectorHelper --
-- ============================================================================

local CollectorHelper = LibStub("AceAddon-3.0"):NewAddon("CollectorHelper", "AceConsole-3.0", "AceEvent-3.0")

-- ============================================================================
-- Command help table for the slash command "/ch"
-- ============================================================================
local commands = {
    { cmd = "help",     desc = "- Displays this help or command list." },
    { cmd = "options",  desc = "- Opens config panel." },
    { cmd = "ah",       desc = "- Shows auction house shop list" },
    { cmd = "recipe",   desc = "- Shows recipe frame for sync" },
    { cmd = "news",     desc = "- Shows news/changelog frame" },
}


function CollectorHelper:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("CollectorHelperDB", defaults, true)
    self:RegisterChatCommand("ch", "HandleChatCommand")

    local version = C_AddOns.GetAddOnMetadata("CollectorHelper", "Version")
    self.db.version = version

    self:InitDB()
    self:InitSettings()
end

function CollectorHelper:OnEnable()
    --self:Print("OnInitialize fired. Welcome! Version: " .. self.db.version)
    self:Init()
end

function CollectorHelper:OnDisable()
    --self:Print("Addon Disabled!")
end

-- ============================================================================
-- Command Handle
-- ============================================================================
function CollectorHelper:HandleChatCommand(input)
    local command, _ = strsplit(" ", input, 2)
    command = command and command:lower() or ""
    if command == "" or command == "help" then
        self:ShowHelpCmd()
    elseif command == "ah" then
        self.ahFrame:Show()
    elseif command == "recipe" then
        self:ShowRecipeUI(true)
    elseif command == "news" then
        self:ShowNews()
    elseif command == "options" then
        Settings.OpenToCategory(self.MainPanel)
    else
        self:Print("Unknown command: " .. command)
        self:ShowHelpCmd()
    end
end

-- ============================================================================
-- Commands
-- ============================================================================
function CollectorHelper:ShowHelpCmd()
    self:Print("Displaying command list:")
    for _, entry in ipairs(commands) do
        self:Print(string.format("/ch %s %s", entry.cmd, entry.desc))
    end
end
-- ============================================================================
-- Elvui check
-- ============================================================================

function CollectorHelper:IsElvUI()
    --return (C_AddOns.IsAddOnLoaded("ElvUI") or false)
end

_G.CollectorHelper = CollectorHelper
