---
--- @file
--- Map point definitions.
---

local _, this = ...

local points = {}
local maps = this.maps

points['bt_karabor_sewers'] = {
  [27500950] = {
    icon = 'door-up',
    portal = maps['bt_black_temple'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_black_temple'] = {
  [29007770] = {
    icon = 'door-down',
    portal = maps['bt_karabor_sewers'],
    opacity = 1,
    scale = 2,
  },
  [74204780] = {
    icon = 'door-right',
    portal = maps['bt_sanctuary_of_shadows'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_sanctuary_of_shadows'] = {
  [21105050] = {
    icon = 'door-left',
    portal = maps['bt_black_temple'],
    opacity = 1,
    scale = 2,
  },
  [61703420] = {
    icon = 'door-right',
    portal = maps['bt_halls_of_anguish'],
    opacity = 1,
    scale = 2,
  },
  [58509100] = {
    icon = 'door-left',
    portal = maps['bt_gorefiends_vigil'],
    opacity = 1,
    scale = 2,
  },
  [26702220] = {
    icon = 'door-up',
    portal = maps['bt_den_of_mortal_delights'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_halls_of_anguish'] = {
  [64303940] = {
    icon = 'door-left',
    portal = maps['bt_sanctuary_of_shadows'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_gorefiends_vigil'] = {
  [74706860] = {
    icon = 'door-right',
    portal = maps['bt_sanctuary_of_shadows'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_den_of_mortal_delights'] = {
  [08505110] = {
    icon = 'door-down',
    portal = maps['bt_sanctuary_of_shadows'],
    opacity = 1,
    scale = 2,
  },
  [67305500] = {
    icon = 'door-down',
    portal = maps['bt_chamber_of_command'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_chamber_of_command'] = {
  [64701790] = {
    icon = 'door-left',
    portal = maps['bt_den_of_mortal_delights'],
    opacity = 1,
    scale = 2,
  },
  [34104890] = {
    icon = 'door-left',
    portal = maps['bt_temple_summit'],
    opacity = 1,
    scale = 2,
  },
}

points['bt_temple_summit'] = {
  [53102680] = {
    icon = 'door-down',
    portal = maps['bt_chamber_of_command'],
    opacity = 1,
    scale = 2,
  },
}

-- Assign all zones to our addon.
for zoneName, data in pairs(points) do
  this.points[maps[zoneName]] = data
end
