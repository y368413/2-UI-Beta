---
--- @file
--- Icon class for defining icons and their look.
---

local _, this = ...

local Icon = {}

---
--- List of icons we are going to use in our addon on map.
---
Icon.list = {
  ['chest'] = 'Warfronts-FieldMapIcons-Neutral-Mine',
  ['chest-completed'] = 'Warfronts-FieldMapIcons-Alliance-Mine',
  ['monster'] = 'Warfronts-BaseMapIcons-Horde-Barracks',
  ['monster-completed'] = 'Warfronts-BaseMapIcons-Alliance-Barracks',
  ['achievement'] = 'storyheader-cheevoicon',
  ['default'] = 'map-markeddefeated',
  ['poi'] = 'map-markeddefeated',
  ['pet'] = 'wildbattlepetcapturable',
  ['quest'] = 'questnormal',
  ['door-up'] = 'poi-door-up',
  ['door-right'] = 'poi-door-right',
  ['door-down'] = 'poi-door-down',
  ['door-left'] = 'poi-door-left',
}

this.Icon = Icon
