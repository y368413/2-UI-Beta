-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------
local _, ns = ...

-------------------------------------------------------------------------------
-------------------------------- ICONS & GLOWS --------------------------------
-------------------------------------------------------------------------------

local ICONS = "Interface\\Addons\\HandyNotes\\Icons\\artwork\\icons"
local GLOWS = "Interface\\Addons\\HandyNotes\\Icons\\artwork\\glows"

local function Icon(name) return ICONS .. '\\' .. name .. '.blp' end
local function Glow(name) return GLOWS .. '\\' .. name .. '.blp' end

local DEFAULT_ICON = 454046
local DEFAULT_GLOW = Glow('square_icon')

ns.icons = { -- name => path

    bag = {Icon('bag'), Glow('bag')},

    -- Red, Blue, Yellow, Purple, Green, Pink, Lime, Navy, Teal
    chest_bk = {Icon('chest_black'), Glow('chest')},
    chest_bl = {Icon('chest_blue'), Glow('chest')},
    chest_bn = {Icon('chest_brown'), Glow('chest')},
    chest_gn = {Icon('chest_green'), Glow('chest')},
    chest_gy = {Icon('chest_gray'), Glow('chest')},
    chest_lm = {Icon('chest_lime'), Glow('chest')},
    chest_nv = {Icon('chest_navy'), Glow('chest')},
    chest_pk = {Icon('chest_pink'), Glow('chest')},
    chest_pp = {Icon('chest_purple'), Glow('chest')},
    chest_rd = {Icon('chest_red'), Glow('chest')},
    chest_tl = {Icon('chest_teal'), Glow('chest')},
    chest_yw = {Icon('chest_yellow'), Glow('chest')},

    crystal_b = {Icon('crystal_blue'), Glow('crystal')},
    crystal_o = {Icon('crystal_orange'), Glow('crystal')},
    crystal_p = {Icon('crystal_purple'), Glow('crystal')},

    flight_point_g = {Icon('flight_point_gray'), Glow('flight_point')},
    flight_point_y = {Icon('flight_point_yellow'), Glow('flight_point')},

    horseshoe_b = {Icon('horseshoe_black'), Glow('horseshoe')},
    horseshoe_g = {Icon('horseshoe_gray'), Glow('horseshoe')},
    horseshoe_o = {Icon('horseshoe_orange'), Glow('horseshoe')},

    paw_g = {Icon('paw_green'), Glow('paw')},
    paw_y = {Icon('paw_yellow'), Glow('paw')},

    peg_bl = {Icon('peg_blue'), Glow('peg')},
    peg_bk = {Icon('peg_black'), Glow('peg')},
    peg_gn = {Icon('peg_green'), Glow('peg')},
    peg_rd = {Icon('peg_red'), Glow('peg')},
    peg_yw = {Icon('peg_yellow'), Glow('peg')},

    portal_bl = {Icon('portal_blue'), Glow('portal')},
    portal_gy = {Icon('portal_gray'), Glow('portal')},
    portal_gn = {Icon('portal_green'), Glow('portal')},
    portal_pp = {Icon('portal_purple'), Glow('portal')},
    portal_rd = {Icon('portal_red'), Glow('portal')},

    quest_ab = {Icon('quest_available_blue'), Glow('quest_available')},
    quest_ag = {Icon('quest_available_green'), Glow('quest_available')},
    quest_ao = {Icon('quest_available_orange'), Glow('quest_available')},
    quest_ay = {Icon('quest_available_yellow'), Glow('quest_available')},

    skull_b = {Icon('skull_blue'), Glow('skull')},
    skull_p = {Icon('skull_purple'), Glow('skull')},
    skull_w = {Icon('skull_white'), Glow('skull')},

    star_chest_b = {Icon('star_chest_blue'), Glow('star_chest')},
    star_chest_g = {Icon('star_chest_gray'), Glow('star_chest')},
    star_chest_p = {Icon('star_chest_pink'), Glow('star_chest')},
    star_chest_y = {Icon('star_chest_yellow'), Glow('star_chest')},

    star_skull_b = {Icon('star_skull_blue'), Glow('star_skull')},
    star_skull_w = {Icon('star_skull_white'), Glow('star_skull')},

    war_mode_flags = {Icon('war_mode_flags'), nil},
    war_mode_swords = {Icon('war_mode_swords'), nil},

    ------------------------------ MISCELLANEOUS ------------------------------

    alliance = {Icon('alliance'), nil},
    horde = {Icon('horde'), nil},

    achievement = {Icon('achievement'), nil},
    door_down = {Icon('door_down'), Glow('door_down')},
    envelope = {Icon('envelope'), Glow('envelope')},
    ferry = {Icon('ferry'), Glow('ferry')},
    left_mouse = {Icon('left_mouse'), nil},
    scroll = {Icon('scroll'), Glow('scroll')},
    world_quest = {Icon('world_quest'), Glow('world_quest')},

    check_bl = {Icon('check_blue'), nil},
    check_gn = {Icon('check_green'), nil},
    check_gy = {Icon('check_gray'), nil},
    check_yw = {Icon('check_yellow'), nil}
}

-------------------------------------------------------------------------------
------------------------------- HELPER FUNCTIONS ------------------------------
-------------------------------------------------------------------------------

local function GetIconPath(name)
    if type(name) == 'number' then return name end
    local info = ns.icons[name]
    return info and info[1] or DEFAULT_ICON
end

local function GetIconLink(name, size, offsetX, offsetY)
    local link = '|T' .. GetIconPath(name) .. ':' .. (size or 0) .. ':' ..
                     (size or 0) -- if size is nil icon will be textHeight
    if offsetX and offsetY then
        link = link .. ':' .. offsetX .. ':' .. offsetY
    end
    return link .. '|t'
end

local function GetGlowPath(name)
    if type(name) == 'number' then return DEFAULT_GLOW end
    local info = ns.icons[name]
    return info and info[2] or nil
end

ns.GetIconLink = GetIconLink
ns.GetIconPath = GetIconPath
ns.GetGlowPath = GetGlowPath
