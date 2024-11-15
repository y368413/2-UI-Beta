---
--- @file
--- Localization file for Mists of Pandaria in enUS language.
---

local NAME, this = ...

-- We add true as last parameter, since this is default language.
local t = this.AceLocale:NewLocale(NAME, 'enUS', true)

if not t then
  return
end

-- Timeless Isle
t['sunken_treasure_treasure'] = 'Sunken Treasure'
t['sunken_treasure_note'] = 'Inside sunken ship. You need to loot [item(104015)] from nearby Hozen.'
t['rattleskew_note'] = 'Wait until [npc(72032)] is up. Kill 3 waves of [npc(72033)] to spawn rare.'
