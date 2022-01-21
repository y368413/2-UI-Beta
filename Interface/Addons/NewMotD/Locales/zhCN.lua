local addonName, newmotd = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhCN")
if not L then return end
  --["Term"] = "术语", -- Example
  -- common
  L["Refresh"] = "刷新"

  newmotd.L = L
