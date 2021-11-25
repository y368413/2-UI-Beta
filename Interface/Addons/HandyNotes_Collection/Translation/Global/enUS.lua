---
--- @file
--- Localization file for global text strings in enUS language.
---

local NAME, this = ...

-- We add true as last parameter, since this is default language.
local t = this.AceLocale:NewLocale(NAME, 'enUS', true)

if not t then
  return
end

-- Configuration
t['config_name'] = 'Collection'
t['config_description'] = 'Handful collection of points around the World (of Warcraft).'
t['config_name_completed'] = 'Show completed'
t['config_description_completed'] = 'Show points you have already found?'
t['config_name_scale'] = 'Icon scale'
t['config_description_scale'] = 'The scale of the icons.'
t['config_name_opacity'] = 'Icon opacity'
t['config_description_opacity'] = 'The alpha transparency of the icons.'
t['rewards'] = 'Rewards'
t['earned'] = 'Earned'
t['in_progress'] = 'In progress'
