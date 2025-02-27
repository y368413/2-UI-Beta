local addon, L = ...

--[[
Wowhead link to show all toys that are hearthstones:
https://www.wowhead.com/items?filter=216:107;1:0;0:hearthstone+location
]]


L.HearthstoneIds = {
    54452,  -- Ethereal Portal
    64488,  -- The Innkeeper's Daughter
    93672,  -- Dark Portal
    142542, -- Tome of Town Portal
    162973, -- Greatfather Winter's Hearthstone
    163045, -- Headless Horseman's Hearthstone
    163206, -- Weary Spirit Binding (This item is in databases, but never made it into the game. Leaving here in case it ever gets put in)
    165669, -- Lunar Elder's Hearthstone
    165670, -- Peddlefeet's Lovely Hearthstone
    165802, -- Noble Gardener's Hearthstone
    166746, -- Fire Eater's Hearthstone
    166747, -- Brewfest Reveler's Hearthstone
    168907, -- Holographic Digitalization Hearthstone
    172179, -- Eternal Traveler's Hearthstone
    180290, -- Night Fae Hearthstone
    182773, -- Necrolord Hearthstone
    183716, -- Venthyr Sinstone
    184353, -- Kyrian Hearthstone
    188952, -- Dominated Hearthstone
    190196, -- Enlightened Hearthstone
    190237, -- Broker Translocation Matrix
    193588, -- Timewalker's Hearthstone
    200630, -- Ohn'ir Windsage's Hearthstone
    206195, -- Path of the Naaru
    208704, -- Deepdweller's Earthen Hearthstone
    209035, -- Hearthstone of the Flame
    210455, -- Draenic Hologem
    212337, -- Stone of the Hearth
    228940, -- Notorious Thread's Hearthstone
}
