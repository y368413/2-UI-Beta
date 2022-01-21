local addonName, newmotd = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "enUS", true)
if not L then return end
  --["Term"] = true -- Example
  -- common
  L["Hide from Minimap"] = true
  L["Hide addon Minimap Button."] = true
  L["|cffff7f00Click|r to show GuildMOTD."] = true
  L["|cffff7f00Middle Click|r to open Options."] = true
  L["|cffff7f00Right Click|r to change GuildMOTD."] = true
  L["Only new GuildMOTD"] = true
  L["Show GuildMOTD popup only if it has changed."] = true
  L["Not in-combat"] = true
  L["Defer GuildMOTD popup to combat end."] = true
  L["Auto-Hide"] = true
  L["How long in seconds before the GuildMOTD popup auto-hides."] = true
  L["Set Delay"] = true
  L["How long in seconds the GuildMOTD popup will delay."] = true
  L["Set Transparency"] = true
  L["Set GuildMOTD popup artwork transparency."] = true
  L.USAGE = [[|cff00ff00NewMotD|r
Pulls Guild Message of the Day out of all the chatframe spam
and presents it as a non-blocking popup on screen.

• It can show up only when the Guild Message of the Day changes.
• It can wait for combat to end before showing up.
• It will auto-hide after a configurable delay.
• It saves a short history of messages.

|cffffff00To dismiss it manually simply mouseover the guild logo at the top of the popup.|r]]

newmotd.L = L
