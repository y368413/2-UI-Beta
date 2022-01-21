local addonName, newmotd = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhTW")
if not L then return end
  --["Term"] = "術語", -- Example
  -- common
  L["Refresh"] = "刷新"

  newmotd.L = L
