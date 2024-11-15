
local thj = {}
_G["SFC"] = thj
thj.info = {
    key = nil,
    keyCD = nil,
    keyCounter = nil,
    isCombat = false,
    isChanneling = false,
    isQuesting = false
}
thj.items = {}
thj.keyMapping = {}
thj.createFrame = function(opt)
    local name, parent = opt.name, opt.parent or UIParent
    local monitorEvents = opt.monitorEvents
    -- name, parent, monitorEvents, withBorder
    local width, height = opt.width or 300, opt.height or 200
    local f = CreateFrame("Frame", name, parent or UIParent);
    f:SetWidth(width)
    f:SetHeight(height)
    f:SetPoint(unpack(opt.anchor or {"CENTER", 0, 0}))
    -- 配置事件监控
    if monitorEvents then
        f:SetScript("OnEvent", function(self, evtName, ...)
            if self[evtName] then
                if evtName == "COMBAT_LOG_EVENT_UNFILTERED" then
                    local timestamp, subEvt, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, extraArg1, extraArg2, extraArg3, extraArg4, extraArg5, extraArg6, extraArg7, extraArg8, extraArg9, extraArg10 = CombatLogGetCurrentEventInfo()
                    if self[subEvt] then
                        self[subEvt](self, sourceGUID, sourceName, destGUID, destName, extraArg1, extraArg2, extraArg3, extraArg4, extraArg5, extraArg6, extraArg7, extraArg8, extraArg9, extraArg10);
                    end
                else
                    self[evtName](self, evtName, ...);
                end
            end
        end)
    end
    return f;
end
local sfo = thj.createFrame({
    name = "SFOFrame",
    monitorEvents = true
})
local lastUpdate = 0;
sfo:SetScript("OnUpdate", function(self, elapsed)
    lastUpdate = lastUpdate + elapsed;
    -- 每秒更新坐骑状态，当在坐骑上时不释放技能，否则马上进入战斗，放个技能又下马了
    if lastUpdate > 0.1 then
        -- print("OnUpdate.elapsed = ", lastUpdate)
        lastUpdate = 0;
        thj.info.isMounted = IsMounted("player");
        thj.UpdateState();
        thj.Repaint();
    end
end)
-- sfo:SetPoint("TOPLEFT", 0, 0);
sfo:SetPoint("CENTER", 0, 0);
sfo:SetFrameStrata("HIGH")
sfo:SetFrameLevel(10000)
sfo:SetSize(200, 10);

thj.frame = sfo;


local keyMapping = {
    ["BACKSPACE"] = 8,
    ["TAB"] = 9,
    ["ENTER"] = 13,
    ["SPACE"] = 32,
    ["MOUSEWHEELDOWN"] = 174,
    ["MOUSEWHEELUP"] = 175,
    ["MwD"] = 174,
    ["MwU"] = 175,
    ["F1"] = 112,
    ["F2"] = 113,
    ["F3"] = 114,
    ["F4"] = 115,
    ["F5"] = 116,
    ["F6"] = 117,
    ["F7"] = 118,
    ["F8"] = 119,
    ["F9"] = 120,
    ["F10"] = 121,
    ["F11"] = 122,
    ["F12"] = 123,
    ["1"] = 49,
    ["2"] = 50,
    ["3"] = 51,
    ["4"] = 52,
    ["5"] = 53,
    ["6"] = 54,
    ["7"] = 55,
    ["8"] = 56,
    ["9"] = 57,
    ["0"] = 48,
    ["A"] = 65,
    ["B"] = 66,
    ["C"] = 67,
    ["D"] = 68,
    ["E"] = 69,
    ["F"] = 70,
    ["G"] = 71,
    ["H"] = 72,
    ["I"] = 73,
    ["J"] = 74,
    ["K"] = 75,
    ["L"] = 76,
    ["M"] = 77,
    ["N"] = 78,
    ["O"] = 79,
    ["P"] = 80,
    ["Q"] = 81,
    ["R"] = 82,
    ["S"] = 83,
    ["T"] = 84,
    ["U"] = 85,
    ["V"] = 86,
    ["W"] = 87,
    ["X"] = 88,
    ["Y"] = 89,
    ["Z"] = 90,
    [";"] = 186,
    ["'"] = 222,
    [","] = 188,
    ["."] = 190,
    ["/"] = 191,
    ["`"] = 192,
    ["-"] = 189,
    ["="] = 187,
    ["["] = 219,
    ["\\"] = 220,
    ["]"] = 221,
    ["LEFT"] = 37,
    ["RIGHT"] = 39,
    ["UP"] = 38,
    ["DOWN"] = 40,
    ["INSERT"] = 45,
    ["DELETE"] = 46,
    ["PAGEUP"] = 33,
    ["PAGEDOWN"] = 34,
    ["HOME"] = 36,
    ["END"] = 35
}
thj.rawKeys = keyMapping
local km = thj.keyMapping;
for k, v in pairs(keyMapping) do
    km[k] = {
        key = v
    }
    km["C" .. k] = {
        control = true,
        key = v
    }
    km["A" .. k] = {
        alt = true,
        key = v
    }
    km["S" .. k] = {
        shift = true,
        key = v
    }
    km["AC" .. k] = {
        alt = true,
        control = true,
        key = v
    }
    km["CS" .. k] = {
        shift = true,
        control = true,
        key = v
    }
    km["AS" .. k] = {
        alt = true,
        shift = true,
        key = v
    }
    km["ACS" .. k] = {
        alt = true,
        control = true,
        shift = true,
        key = v
    }
end
local pxMappings = {
    [0] = {8, 8, 8, 8},
    [1] = {8, 8, 8, 24},
    [2] = {8, 8, 8, 40},
    [3] = {8, 8, 8, 56},
    [4] = {8, 8, 24, 8},
    [5] = {8, 8, 24, 24},
    [6] = {8, 8, 24, 40},
    [7] = {8, 8, 24, 56},
    [8] = {8, 8, 40, 8},
    [9] = {8, 8, 40, 24},
    [10] = {8, 8, 40, 40},
    [11] = {8, 8, 40, 56},
    [12] = {8, 8, 56, 8},
    [13] = {8, 8, 56, 24},
    [14] = {8, 8, 56, 40},
    [15] = {8, 8, 56, 56},
    [16] = {8, 24, 8, 8},
    [17] = {8, 24, 8, 24},
    [18] = {8, 24, 8, 40},
    [19] = {8, 24, 8, 56},
    [20] = {8, 24, 24, 8},
    [21] = {8, 24, 24, 24},
    [22] = {8, 24, 24, 40},
    [23] = {8, 24, 24, 56},
    [24] = {8, 24, 40, 8},
    [25] = {8, 24, 40, 24},
    [26] = {8, 24, 40, 40},
    [27] = {8, 24, 40, 56},
    [28] = {8, 24, 56, 8},
    [29] = {8, 24, 56, 24},
    [30] = {8, 24, 56, 40},
    [31] = {8, 24, 56, 56},
    [32] = {8, 40, 8, 8},
    [33] = {8, 40, 8, 24},
    [34] = {8, 40, 8, 40},
    [35] = {8, 40, 8, 56},
    [36] = {8, 40, 24, 8},
    [37] = {8, 40, 24, 24},
    [38] = {8, 40, 24, 40},
    [39] = {8, 40, 24, 56},
    [40] = {8, 40, 40, 8},
    [41] = {8, 40, 40, 24},
    [42] = {8, 40, 40, 40},
    [43] = {8, 40, 40, 56},
    [44] = {8, 40, 56, 8},
    [45] = {8, 40, 56, 24},
    [46] = {8, 40, 56, 40},
    [47] = {8, 40, 56, 56},
    [48] = {8, 56, 8, 8},
    [49] = {8, 56, 8, 24},
    [50] = {8, 56, 8, 40},
    [51] = {8, 56, 8, 56},
    [52] = {8, 56, 24, 8},
    [53] = {8, 56, 24, 24},
    [54] = {8, 56, 24, 40},
    [55] = {8, 56, 24, 56},
    [56] = {8, 56, 40, 8},
    [57] = {8, 56, 40, 24},
    [58] = {8, 56, 40, 40},
    [59] = {8, 56, 40, 56},
    [60] = {8, 56, 56, 8},
    [61] = {8, 56, 56, 24},
    [62] = {8, 56, 56, 40},
    [63] = {8, 56, 56, 56},
    [64] = {24, 8, 8, 8},
    [65] = {24, 8, 8, 24},
    [66] = {24, 8, 8, 40},
    [67] = {24, 8, 8, 56},
    [68] = {24, 8, 24, 8},
    [69] = {24, 8, 24, 24},
    [70] = {24, 8, 24, 40},
    [71] = {24, 8, 24, 56},
    [72] = {24, 8, 40, 8},
    [73] = {24, 8, 40, 24},
    [74] = {24, 8, 40, 40},
    [75] = {24, 8, 40, 56},
    [76] = {24, 8, 56, 8},
    [77] = {24, 8, 56, 24},
    [78] = {24, 8, 56, 40},
    [79] = {24, 8, 56, 56},
    [80] = {24, 24, 8, 8},
    [81] = {24, 24, 8, 24},
    [82] = {24, 24, 8, 40},
    [83] = {24, 24, 8, 56},
    [84] = {24, 24, 24, 8},
    [85] = {24, 24, 24, 24},
    [86] = {24, 24, 24, 40},
    [87] = {24, 24, 24, 56},
    [88] = {24, 24, 40, 8},
    [89] = {24, 24, 40, 24},
    [90] = {24, 24, 40, 40},
    [91] = {24, 24, 40, 56},
    [92] = {24, 24, 56, 8},
    [93] = {24, 24, 56, 24},
    [94] = {24, 24, 56, 40},
    [95] = {24, 24, 56, 56},
    [96] = {24, 40, 8, 8},
    [97] = {24, 40, 8, 24},
    [98] = {24, 40, 8, 40},
    [99] = {24, 40, 8, 56},
    [100] = {24, 40, 24, 8},
    [101] = {24, 40, 24, 24},
    [102] = {24, 40, 24, 40},
    [103] = {24, 40, 24, 56},
    [104] = {24, 40, 40, 8},
    [105] = {24, 40, 40, 24},
    [106] = {24, 40, 40, 40},
    [107] = {24, 40, 40, 56},
    [108] = {24, 40, 56, 8},
    [109] = {24, 40, 56, 24},
    [110] = {24, 40, 56, 40},
    [111] = {24, 40, 56, 56},
    [112] = {24, 56, 8, 8},
    [113] = {24, 56, 8, 24},
    [114] = {24, 56, 8, 40},
    [115] = {24, 56, 8, 56},
    [116] = {24, 56, 24, 8},
    [117] = {24, 56, 24, 24},
    [118] = {24, 56, 24, 40},
    [119] = {24, 56, 24, 56},
    [120] = {24, 56, 40, 8},
    [121] = {24, 56, 40, 24},
    [122] = {24, 56, 40, 40},
    [123] = {24, 56, 40, 56},
    [124] = {24, 56, 56, 8},
    [125] = {24, 56, 56, 24},
    [126] = {24, 56, 56, 40},
    [127] = {24, 56, 56, 56},
    [128] = {40, 8, 8, 8},
    [129] = {40, 8, 8, 24},
    [130] = {40, 8, 8, 40},
    [131] = {40, 8, 8, 56},
    [132] = {40, 8, 24, 8},
    [133] = {40, 8, 24, 24},
    [134] = {40, 8, 24, 40},
    [135] = {40, 8, 24, 56},
    [136] = {40, 8, 40, 8},
    [137] = {40, 8, 40, 24},
    [138] = {40, 8, 40, 40},
    [139] = {40, 8, 40, 56},
    [140] = {40, 8, 56, 8},
    [141] = {40, 8, 56, 24},
    [142] = {40, 8, 56, 40},
    [143] = {40, 8, 56, 56},
    [144] = {40, 24, 8, 8},
    [145] = {40, 24, 8, 24},
    [146] = {40, 24, 8, 40},
    [147] = {40, 24, 8, 56},
    [148] = {40, 24, 24, 8},
    [149] = {40, 24, 24, 24},
    [150] = {40, 24, 24, 40},
    [151] = {40, 24, 24, 56},
    [152] = {40, 24, 40, 8},
    [153] = {40, 24, 40, 24},
    [154] = {40, 24, 40, 40},
    [155] = {40, 24, 40, 56},
    [156] = {40, 24, 56, 8},
    [157] = {40, 24, 56, 24},
    [158] = {40, 24, 56, 40},
    [159] = {40, 24, 56, 56},
    [160] = {40, 40, 8, 8},
    [161] = {40, 40, 8, 24},
    [162] = {40, 40, 8, 40},
    [163] = {40, 40, 8, 56},
    [164] = {40, 40, 24, 8},
    [165] = {40, 40, 24, 24},
    [166] = {40, 40, 24, 40},
    [167] = {40, 40, 24, 56},
    [168] = {40, 40, 40, 8},
    [169] = {40, 40, 40, 24},
    [170] = {40, 40, 40, 40},
    [171] = {40, 40, 40, 56},
    [172] = {40, 40, 56, 8},
    [173] = {40, 40, 56, 24},
    [174] = {40, 40, 56, 40},
    [175] = {40, 40, 56, 56},
    [176] = {40, 56, 8, 8},
    [177] = {40, 56, 8, 24},
    [178] = {40, 56, 8, 40},
    [179] = {40, 56, 8, 56},
    [180] = {40, 56, 24, 8},
    [181] = {40, 56, 24, 24},
    [182] = {40, 56, 24, 40},
    [183] = {40, 56, 24, 56},
    [184] = {40, 56, 40, 8},
    [185] = {40, 56, 40, 24},
    [186] = {40, 56, 40, 40},
    [187] = {40, 56, 40, 56},
    [188] = {40, 56, 56, 8},
    [189] = {40, 56, 56, 24},
    [190] = {40, 56, 56, 40},
    [191] = {40, 56, 56, 56},
    [192] = {56, 8, 8, 8},
    [193] = {56, 8, 8, 24},
    [194] = {56, 8, 8, 40},
    [195] = {56, 8, 8, 56},
    [196] = {56, 8, 24, 8},
    [197] = {56, 8, 24, 24},
    [198] = {56, 8, 24, 40},
    [199] = {56, 8, 24, 56},
    [200] = {56, 8, 40, 8},
    [201] = {56, 8, 40, 24},
    [202] = {56, 8, 40, 40},
    [203] = {56, 8, 40, 56},
    [204] = {56, 8, 56, 8},
    [205] = {56, 8, 56, 24},
    [206] = {56, 8, 56, 40},
    [207] = {56, 8, 56, 56},
    [208] = {56, 24, 8, 8},
    [209] = {56, 24, 8, 24},
    [210] = {56, 24, 8, 40},
    [211] = {56, 24, 8, 56},
    [212] = {56, 24, 24, 8},
    [213] = {56, 24, 24, 24},
    [214] = {56, 24, 24, 40},
    [215] = {56, 24, 24, 56},
    [216] = {56, 24, 40, 8},
    [217] = {56, 24, 40, 24},
    [218] = {56, 24, 40, 40},
    [219] = {56, 24, 40, 56},
    [220] = {56, 24, 56, 8},
    [221] = {56, 24, 56, 24},
    [222] = {56, 24, 56, 40},
    [223] = {56, 24, 56, 56},
    [224] = {56, 40, 8, 8},
    [225] = {56, 40, 8, 24},
    [226] = {56, 40, 8, 40},
    [227] = {56, 40, 8, 56},
    [228] = {56, 40, 24, 8},
    [229] = {56, 40, 24, 24},
    [230] = {56, 40, 24, 40},
    [231] = {56, 40, 24, 56},
    [232] = {56, 40, 40, 8},
    [233] = {56, 40, 40, 24},
    [234] = {56, 40, 40, 40},
    [235] = {56, 40, 40, 56},
    [236] = {56, 40, 56, 8},
    [237] = {56, 40, 56, 24},
    [238] = {56, 40, 56, 40},
    [239] = {56, 40, 56, 56},
    [240] = {56, 56, 8, 8},
    [241] = {56, 56, 8, 24},
    [242] = {56, 56, 8, 40},
    [243] = {56, 56, 8, 56},
    [244] = {56, 56, 24, 8},
    [245] = {56, 56, 24, 24},
    [246] = {56, 56, 24, 40},
    [247] = {56, 56, 24, 56},
    [248] = {56, 56, 40, 8},
    [249] = {56, 56, 40, 24},
    [250] = {56, 56, 40, 40},
    [251] = {56, 56, 40, 56},
    [252] = {56, 56, 56, 8},
    [253] = {56, 56, 56, 24},
    [254] = {56, 56, 56, 40},
    [255] = {56, 56, 56, 56}
}
thj.pxMappings = pxMappings;

--[[ 创建UI ]]
local sfo = thj.frame

local SIZE = 1;
local BLOCK_COUNT = 24;
local C = {
    START_TAG_INDEX = 1,
    STATE_INDEX = 2,
    MAIN_SPELL_INDEX = 3,
    CD_SPELL_INDEX = 4,
    COUNTER_SPELL_INDEX = 5,
    END_TAG_INDEX = 6
}
--[[
UI规划
[1.定位点][2.版本][3.状态][4.主技能][5.无CD爆发][6.Counter技能][7.地图][8.坐标][9.目标][10.背包][-][-][-][-][-][-][-][-][-][20.定位点]
]]
local function newTex(x)
    local tx = sfo:CreateTexture(nil, "ARTWORK");
    tx:SetColorTexture(0, 0, 0);
    tx:SetSize(SIZE, SIZE);
    tx:SetPoint("TOPLEFT", sfo, x, 0)
    return tx;
end
local pxs = {};
local blocks = {}
for i = 1, BLOCK_COUNT do
    local tx = newTex(i, 0.05 * i, 0, 0);
    table.insert(blocks, tx);
    for j = 1, 12, 1 do
        table.insert(pxs, 0);
    end
end
local function updatePx(k, r, g, b)
    local i = k - 1;
    r = thj.pxMappings[r];
    pxs[i * 12 + 1] = r[1];
    pxs[i * 12 + 2] = r[2];
    pxs[i * 12 + 3] = r[3];
    pxs[i * 12 + 4] = r[4];
    g = thj.pxMappings[g];
    pxs[i * 12 + 5] = g[1];
    pxs[i * 12 + 6] = g[2];
    pxs[i * 12 + 7] = g[3];
    pxs[i * 12 + 8] = g[4];
    b = thj.pxMappings[b];
    pxs[i * 12 + 9] = b[1];
    pxs[i * 12 + 10] = b[2];
    pxs[i * 12 + 11] = b[3];
    pxs[i * 12 + 12] = b[4];
end
updatePx(C.START_TAG_INDEX, 0xcc, 0xff, 0x66)
updatePx(C.END_TAG_INDEX, 0xcc, 0xff, 0x66)

local function getSpellColor(key, keyState)
    local r, g, b;
    local info = thj.info;
    local km = thj.keyMapping[key or ""];
    if not km then
        r = 0;
        g = 0;
    else
        -- r = 组合键标志位<CCAASS00> ctrl | alt | shift  
        r = (km.control and 1 or 0) * 0xC0 + (km.alt and 1 or 0) * 0x30 + (km.shift and 1 or 0) * 0xC
        r = r;
        -- g = 按键编码
        g = km.key;
    end
    -- 蓄力施法支持
    b = (keyState == 'down' and 1 or 0) * 0xC0 + (keyState == 'up' and 1 or 0) * 0x30;
    return r, g, b;
end
thj.UpdateSpell = function(key, keyState, keyIndex)
    local info = thj.info;
    local r, g, b = getSpellColor(info.key, info.keyState)
    updatePx(C.MAIN_SPELL_INDEX, r, g, b)
    r, g, b = getSpellColor(info.keyCD)
    updatePx(C.CD_SPELL_INDEX, r, g, b)
    r, g, b = getSpellColor(info.keyCounter)
    updatePx(C.COUNTER_SPELL_INDEX, r, g, b)
end

thj.UpdateState = function()
    local info = thj.info; 
    local b = ((info.isCombat and not info.isMounted) and 1 or 0) * 0xC0 + (info.isChanneling and 1 or 0) * 0x30;
    updatePx(C.STATE_INDEX, 0, 0, b)
end
thj.Repaint = function()
    for i = 1, BLOCK_COUNT, 1 do
        local r, g, b = pxs[i * 3 - 2], pxs[i * 3 - 1], pxs[i * 3]
        blocks[i]:SetColorTexture(r / 0xff, g / 0xff, b / 0xff)
    end
end

local sfo = thj.frame;
local GetSpellInfo = C_Spell.GetSpellInfo
local Hekili

--[[                                  公共方法                              ]]
--[[设置战斗状态]]
thj.SetCombat = function(flag)
    thj.info.isCombat = flag;
    thj.UpdateState();
    thj.Repaint();
end
--[[设置通道施法状态]]
thj.SetChanneling = function(flag)
    thj.info.isChanneling = flag;
    thj.UpdateState();
    thj.Repaint();
end
local allTimer
--[[
    事件注册
]]
sfo:RegisterEvent("ADDON_LOADED")
function sfo:ADDON_LOADED(evt, name)
    if (name == "Hekili") then
        Hekili = _G["Hekili"]
        C_Timer.After(1, function()
            -- print("Hekili_Primary_B1 = ", Hekili_Primary_B1)
            sfo:SetParent(Hekili_Primary_B1)
            sfo:SetPoint("TOPLEFT", Hekili_Primary_B1, 54, 1)
        end)
    end
end

-- 战斗状态指示
sfo:RegisterEvent("PLAYER_REGEN_ENABLED")
function sfo:PLAYER_REGEN_ENABLED()
    thj.SetCombat(false)
end
sfo:RegisterEvent("PLAYER_REGEN_DISABLED")
function sfo:PLAYER_REGEN_DISABLED()
    thj.SetCombat(true)
end
-- Chennel状态指示 
sfo:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_START", "player")
function sfo:UNIT_SPELLCAST_CHANNEL_START()
    thj.info.isChanneling = true;
    thj.Repaint();
end
sfo:RegisterUnitEvent("UNIT_SPELLCAST_CHANNEL_STOP", "player")
function sfo:UNIT_SPELLCAST_CHANNEL_STOP()
    thj.info.isChanneling = false;
    thj.Repaint();
end
local cache = {}
sfo:RegisterUnitEvent("UNIT_SPELLCAST_EMPOWER_START", "player")
function sfo:UNIT_SPELLCAST_EMPOWER_START(unitTarget, castGUID, spellID)
    -- print("UNIT_SPELLCAST_EMPOWER_START", unitTarget, castGUID, spellID)
    local name, text, texture, startTime, endTime, isTradeSkill, notInterruptible, spellID, _, numStages =
        UnitChannelInfo("player");
    local totalTime = 0;
    for i = 1, numStages + 1, 1 do
        local duration = GetUnitEmpowerStageDuration("player", i - 1)
        totalTime = totalTime + duration;
    end
    totalTime = totalTime / 1000
    C_Timer.After(totalTime, function()
        thj.info.keyState = "up"
        thj.Repaint(); 
    end)
end
local INTERVAL = 0.2
local lastKey = nil
local empowering = false
C_Timer.NewTicker(INTERVAL, function()
    local recommends = Hekili.DisplayPool["Primary"].Recommendations
    local firstKeybind = nil

    local curSequence = recommends[1]
    local curSpellName, curSpellId, curKey, empowerTo = curSequence.actionName, curSequence.actionID,
        curSequence.keybind, curSequence.empower_to or 0
    if not curSpellId then return end
    if not curKey then
        --print("Unknown spell {1}, id = {2}", curSpellName, curSpellId)
        return
    end

    if curKey ~= lastKey then
        lastKey = curKey
        if empowerTo > 1 and not empowering then
            empowering = true
            thj.info.keyState = "down"
        end
        thj.FlashKey(curKey)
    else
        return
    end
end)
--[[
    SFO API
]]

thj.FlashFrame = function()
end
--[[
    根据按键进行技能提示
]]
thj.FlashKey = function(key, slot)
    slot = slot or ""
    -- 非战斗 或者 通道施法状态 不响应
    -- if not thj.info.isCombat or thj.info.isChanneling then
    --     return
    -- end
    if not key then
        return
    end
    thj.info["key" .. slot] = key;
    thj.info.keyState = ""
    local curSpell = Hekili.DisplayPool["Primary"].Recommendations[1]
    local empLvl = curSpell.empower_to or 0
    if empLvl > 1 then
        thj.info.keyState = "down"
        empowering = false
    end
    thj.UpdateSpell()
    thj.Repaint();
    return;
end
--[[
    API: 根据技能ID获取技能名称
    @param id: 技能ID
    @returns 技能名称
]]
-- /dump Hekili.KeybindInfo[Hekili.Class.abilities["奥术智慧"].key]
thj.SpellName = function(id)
    if not id or id < 0 then
        print("|cffff2020 Spell: ID must NOT EMPTY!|r")
        return nil
    end
    local hekiliDef = Hekili.Class.abilities[id]
    if not hekiliDef then
        print("|cffff2020 Spell: {1} not found in HEKILI!|r", id)
        return nil
    end
    return hekiliDef.name;
end
thj.Flashable = function(spell)
    return true
end;
local function GetSpellMeta(spellIdOrName)
    local hekiliDef = Hekili.Class.abilities[spellIdOrName]
    if not hekiliDef then
        print("|cffff2020 Spell: {1} not found in HEKILI!|r", spellIdOrName)
        return nil
    end
    local id, name, simcName = hekiliDef.id, hekiliDef.name, hekiliDef.key;
    local key;
    local bindings = Hekili.KeybindInfo[simcName];
    if bindings then
        for k, v in pairs(bindings.upper) do
            key = v
        end
    end
    return id, name, key;
end
--[[
    API: 根据技能名称提示技能
    @param spellName: 技能名称
]]
thj.FlashAction = function(spellName)
    -- print("FlashAction ->", spellName) 
    local id, name, key = GetSpellMeta(spellName);
    if not id or not key then
        return nil
    end
    thj.FlashKey(key)
end
--[[
    API: 根据技能名称提示技能
    @param spellName: 技能名称
]]
thj.FlashAction2 = function(spellName)
    local id, name, key = GetSpellMeta(spellName);
    if not id or not key then
        return nil
    end
    thj.FlashKey(key, "CD")
end
--[[
    API: 根据技能名称提示技能
    @param spellName: 技能名称
]]
thj.FlashAction3 = function(spellName)
    local id, name, key = GetSpellMeta(spellName);
    if not id or not key then
        return nil
    end
    thj.FlashKey(key, "Counter")
end
--[[
    API: 根据物品ID获取物品名称
    @param id: 物品ID
    @returns 物品名称
]]
thj.ItemName = function(id)
    if not id then
        return nil
    end
    -- print("ItemName->"..id)
    local name = thj.items[id];
    if not name then
        name = GetItemInfo(id);
        thj.items[id] = name;
    end
    local hd = Hekili.Class.abilities[name]
    if not hd then
        return nil
    end
    return hd.name;
end
--[[
    API: 根据物品名称提示物品使用
    @param spellName: 物品名称
    @param color: 忽视
]]
thj.FlashItem = function(itemName, color)
    local id, name, key = GetSpellMeta(itemName);
    if not id or not key then
        return nil
    end
    thj.FlashKey(key)
end
thj.StartQuesting = function()
    thj.info.isQuesting = true;
end
thj.StopQuesting = function()
    thj.info.isQuesting = false;
end

local cp = CreateFrame('Frame', 'hkc', UIParent)
-- 位置可移动，宽高分别为205 150
cp:SetPoint('BOTTOM', UIParent, 'BOTTOM', -485, 95)
cp:SetSize(1, 1)
--cp.TitleText:SetText("|cff777777Hekili快捷开关")
cp:SetScript('OnHide', function() cpIcon:Show() end);
cp:SetFrameStrata("LOW")
cp:Show()
cp:SetAlpha(1)

local cpIcon = CreateFrame('Frame', 'cpIcon', UIParent)
--local _,className = UnitClass("player")
--local texture = cpIcon:CreateTexture()
--if className == "HUNTER" then className = "SHAMAN" end
--texture:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\Emotes\\禁")
--texture:SetAllPoints(cpIcon)
local cptext = cpIcon:CreateFontString()
cptext:SetFont(STANDARD_TEXT_FONT, 15, "OUTLINE")
cptext:SetText("Hekili")
cptext:SetPoint("TOPLEFT", cpIcon, "TOPLEFT", 3, -3)
thj.debugger = text;
cpIcon:SetSize( 50, 20 )
cpIcon:SetPoint('RIGHT', cp, 'LEFT', 0, 0)
cpIcon:SetFrameStrata("LOW")
cpIcon:SetMovable(true)
cpIcon:SetClampedToScreen(true)
cpIcon:SetScript('OnMouseUp', function()
    cpIcon:StopMovingOrSizing();
end);
cpIcon:SetScript('OnMouseDown', function()
    cpIcon:StartMoving();
     Hekili:FireToggle('cooldowns')
end);
cpIcon:Show()

local function SetDisplayMode(mode)
    Hekili.DB.profile.toggles.mode.value = mode
    if WeakAuras and WeakAuras.ScanEvents then
        WeakAuras.ScanEvents('HEKILI_TOGGLE', 'mode', mode)
    end
    -- if ns.UI.Minimap then ns.UI.Minimap:RefreshDataText() end
    Hekili:UpdateDisplayVisibility()
    Hekili:ForceUpdate('HEKILI_TOGGLE', true)
end

-- 爆发监控/控制按钮 
--[[local btnCD = thj.createSwitchButton({
    name = "CoolDownButton",
    parent = cp,
    text = "爆发",
    getter = function()
        return Hekili.DB.profile.toggles.cooldowns.value
    end,
    setter = function(v)
        Hekili:FireToggle('cooldowns')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", cpIcon, "RIGHT", 0, 0},
    tip = function()
        return Hekili.DB.profile.toggles.cooldowns.key or "未设置"
    end
})
local btnMinorCD = thj.createSwitchButton({
    name = "MinorCDButton",
    parent = cp,
    text = "大招",
    getter = function()
        return Hekili.DB.profile.toggles.essences.value
    end,
    setter = function(v)
        Hekili:FireToggle('essences')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnCD, "RIGHT", 0, 0},
    tip = function()
        return Hekili.DB.profile.toggles.essences.key or "未设置"
    end
})
-- 保命 监控/控制按钮 
local btnDefensives = thj.createSwitchButton({
    name = "DefensivesButton",
    parent = cp,
    text = "保命",
    getter = function()
        return Hekili.DB.profile.toggles.defensives.value
    end,
    setter = function(v)
        Hekili:FireToggle('defensives')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnMinorCD, "RIGHT", 0, 0},
    tip = function()
        return Hekili.DB.profile.toggles.defensives.key or "未设置"
    end
}) 
-- 打断 监控/控制按钮 
local btnInterrupt = thj.createSwitchButton({
    name = "InterruptsButton",
    parent = cp,
    text = "打断",
    getter = function()
        return Hekili.DB.profile.toggles.interrupts.value
    end,
    setter = function(v)
        Hekili:FireToggle('interrupts')
    end,
    width = 50,
    height = 20,
    anchor = {"TOP", cpIcon, "BOTTOM", 0, 0},
    tip = function()
        return Hekili.DB.profile.toggles.interrupts.key or "未设置"
    end
}) 
-- 嗑药 监控/控制按钮 
local btnPotions = thj.createSwitchButton({
    name = "PotionButton",
    parent = cp,
    text = "药剂",
    getter = function()
        return Hekili.DB.profile.toggles.potions.value
    end,
    setter = function(v)
        Hekili:FireToggle('potions')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnInterrupt, "RIGHT", 0, 0},
    tip = function()
        return Hekili.DB.profile.toggles.potions.key or "未设置"
    end
}) 

-----------------模式切换按钮----------------
-- 自动模式 监控/控制按钮 
local btnAuto = thj.createSwitchButton({
    name = "AutoButton",
    parent = cp,
    text = "自动",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "automatic"
    end,
    setter = function(v)
        SetDisplayMode('automatic')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnPotions, "RIGHT", 0, 0}
}) 
-- AOE 监控/控制按钮 
local btnAOE = thj.createSwitchButton({
    name = "AOEButton",
    parent = cp,
    text = "AOE",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "aoe"
    end,
    setter = function(v)
        SetDisplayMode('aoe')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnAuto, "RIGHT", 0, 0}
}) 
-- 单体 监控/控制按钮 
local btnSingle = thj.createSwitchButton({
    name = "SingleButton",
    parent = cp,
    text = "单体",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "single"
    end,
    setter = function(v)
        SetDisplayMode('single')
    end,
    width = 50,
    height = 20,
    anchor = {"TOP", btnInterrupt, "BOTTOM", 0, 0}
})
-- 双显 监控/控制按钮 
local btnDual = thj.createSwitchButton({
    name = "DualButton",
    parent = cp,
    text = "双显",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "dual"
    end,
    setter = function(v)
        SetDisplayMode('dual')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnSingle, "RIGHT", 0, 0}
})
-- 响应 监控/控制按钮 
local btnReactive = thj.createSwitchButton({
    name = "ReactiveButton",
    parent = cp,
    text = "响应",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "reactive"
    end,
    setter = function(v)
        SetDisplayMode('reactive')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnDual, "RIGHT", 0, 0}
})
-- 漏斗 监控/控制按钮 
local btnFunnel = thj.createSwitchButton({
    name = "FunnelButton",
    parent = cp,
    text = "漏斗",
    getter = function()
        return Hekili.DB.profile.toggles.mode.value == "funnel"
    end,
    setter = function(v)
        SetDisplayMode('funnel')
    end,
    width = 50,
    height = 20,
    anchor = {"LEFT", btnReactive, "RIGHT", 0, 0},
    tip = "漏斗模式：AOE时用群攻技能攒能量，施放单体终结技。\n适用于敏锐、奇袭、增强、毁灭专精。"
})
-- 播放按键声音钮 
local btnVoice = thj.createSwitchButton({
    name = "VoiceButton",
    parent = cp,
    text = "语音",
    getter = function()
        return HSstop
    end,
    setter = function(v)
        HSstop = false
    end,
    width = 60,
    height = 20,
    anchor = {"LEFT", btnFunnel, "RIGHT", 0, 0},
    tip = "语音播报下一个按键"
})]]

