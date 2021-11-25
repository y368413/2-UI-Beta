---
--- @file
--- Map point definitions.
---

local _, this = ...

local maps = {}
local points = {}

---
--- Table with maps names and their respective IDs.
---
--- @var table maps
---   Map definitions for easier finding and loading ids in specific maps.
---
maps = {
  -- The Burning Crusade

  -- Black Temple
  ['bt_black_temple'] = 339,
  ['bt_karabor_sewers'] = 340,
  ['bt_sanctuary_of_shadows'] = 341,
  ['bt_halls_of_anguish'] = 342,
  ['bt_gorefiends_vigil'] = 343,
  ['bt_den_of_mortal_delights'] = 344,
  ['bt_chamber_of_command'] = 345,
  ['bt_temple_summit'] = 346,

  -- Warlords of Draenor
  ['gorgrond'] = 543,
  ['talador'] = 535,
  ['spires_of_arak'] = 542,
  ['nagrand'] = 550,
}

-- Iterate all maps and assign their ids, so we can use them for our points.
local index, id = next(maps, index)
while id do
  points[id] = {}
  -- Load next map.
  index, id = next(maps, index)
end

this.maps = maps
this.points = points
