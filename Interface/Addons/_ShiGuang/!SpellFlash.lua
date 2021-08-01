--## Title:|CFFD74DE1[输出]|r |cffff7d0a残疾人|r |cffffe00a救助中心|r
--## Author: thj

local thj = {}
local insert, remove, sort, unpack, wipe = table.insert, table.remove, table.sort, table.unpack, table.wipe
local keyMapping = {
    ["BACKSPACE"] = 8,
    ["TAB"] = 9,
    ["ENTER"] = 13, 
    ["SPACE"] = 32,
    ["MOUSEWHEELDOWN"] = 174,
    ["MOUSEWHEELUP"] = 175,
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
    ["END"] = 35,
}
local km = {};
for k,v in pairs(keyMapping) do
    km[k] = {
        key = v
    }
    km["CONTROL-"..k] = {
        control = true,
        key = v
    }
    km["CTRL-"..k] = {
        control = true,
        key = v
    }
    km["ALT-"..k] = {
        alt = true,
        key = v
    }
    km["SHIFT-"..k] = {
        shift = true,
        key = v
    }
    km["ALT-CTRL"..k] = {
        alt = true,
        control = true,
        key = v
    }
    km["CTRL-SHIFT"..k] = {
        shift = true,
        control = true,
        key = v
    }
    km["ALT-SHIFT"..k] = {
        alt = true,
        shift = true,
        key = v
    }
    km["ALT-CTRL-SHIFT"..k] = {
        alt = true,
        control = true,
        shift = true,
        key = v
    }
end
thj.keyMapping = km;

--[[
    Base functions
]]

_G["SpellFlashCore"] = thj
SFO = thj
local SIZE = 5;
local sfo = CreateFrame("Frame", "SFOFrame", UIParent)
sfo:SetPoint("TOPLEFT", 0, 0);
sfo:SetFrameStrata("HIGH")
sfo:SetFrameLevel(10000)
-- /dump SFO:GetPoint()
sfo:SetSize(SIZE * 17, SIZE);
sfo:SetScript("OnEvent", function(self, evtName, ...)
    if self[evtName] then
        -- print("OnEvent->" .. evtName);
        self[evtName](self, evtName, ...);
    end
end)

-- 战斗状态指示
sfo:RegisterEvent("PLAYER_REGEN_ENABLED")
function sfo:PLAYER_REGEN_ENABLED() thj.SetCombat(false) end
sfo:RegisterEvent("PLAYER_REGEN_DISABLED")
function sfo:PLAYER_REGEN_DISABLED()
    thj.SetCombat(true)
    -- thj.dots[13]:SetColorTexture(0, 1, 0);
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

-- 按键扫描注册
sfo:RegisterEvent("PLAYER_ENTERING_WORLD")
function sfo:PLAYER_ENTERING_WORLD() thj.ScanKeyBindings(); end
sfo:RegisterEvent("UPDATE_BINDINGS")
function sfo:UPDATE_BINDINGS() thj.ScanKeyBindings(); end
sfo:RegisterEvent("ACTIONBAR_PAGE_CHANGED")
function sfo:ACTIONBAR_PAGE_CHANGED() thj.ScanKeyBindings(); end
sfo:RegisterEvent("ACTIONBAR_SLOT_CHANGED")
function sfo:ACTIONBAR_SLOT_CHANGED() thj.ScanKeyBindings(); end
sfo:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
function sfo:PLAYER_SPECIALIZATION_CHANGED() thj.ScanKeyBindings(); end
sfo:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
function sfo:UPDATE_SHAPESHIFT_FORM() thj.ScanKeyBindings(); end

thj.dots = {};
local function createBlock(pos, r, g, b)
    local tx = sfo:CreateTexture(nil, "ARTWORK");
    tx:SetColorTexture(r, g, b);
    tx:SetSize(SIZE, SIZE);
    tx:SetPoint("TOPLEFT", sfo, "TOPLEFT", pos * SIZE, 0)
    thj.dots[pos] = tx;
end

--[[
    UI elements
]]
-- 标志
createBlock(0, 1, 1, 0);

local UnitClass = UnitClass;
local wipe = table.wipe;
--[[
    /dump GetBindingKey("ACTIONBUTTON3");
    /dump GetActionInfo(3);
    /dump GetMacroSpell(127)
    /dump GetSpellInfo(53600)
]]
thj.info = {
    key = nil,
    isCombat = false,
    isChanneling = false,
    isQuesting = false,
    spellId = nil,
    spellName = nil
}
thj.spells = {}
local slotNames = {"", "", "", "", "", ""}
local function UpdateSpell(spellId, spellName, key, page)
    thj.spells[spellId] = spellName
    thj.spells[spellName] = key
end
local function StoreKeybindInfo(page, bindingName, slot)
    local key1, key2 = GetBindingKey(bindingName);
    local key = key1 and key1 or key2;
    local actionType, id, subType = GetActionInfo(slot)
    local action, ability
    if not key then return end
    if actionType == "spell" then
        local spellName = GetSpellInfo(id);
        thj.spells[id] = spellName
        thj.spells[spellName] = key
        -- print("SKI Spell->", key, id, spellName)
    elseif actionType == "macro" then
        local sID = GetMacroSpell(id)
        if not sID then return end
        local spellName = GetSpellInfo(sID);
        thj.spells[sID] = spellName
        thj.spells[spellName] = key
    elseif actionType == "item" then
        local item = GetItemInfo(id)
        -- ability = item and class.abilities[ item ]
        -- action = ability and ability.key
        if not action then end
    end
end
--[[
    扫描状态条
]]
local function ScanStanceBar()
    local _, _, classId = UnitClass('player');
    local spec = GetSpecialization();
    -- SHAPESHIFTBUTTON
    -- /dump GetShapeshiftFormInfo(1)
    -- 2=QS 4=DZ 11=XD
    if (classId == 11 or classId == 2 or classId == 4) then
        for i = 1, 4 do
            local icon, active, castable, spellId = GetShapeshiftFormInfo(i);
            local key1, key2 = GetBindingKey("SHAPESHIFTBUTTON" .. i);
            local key = key1 and key1 or key2;
            -- print("ScanStanceBar->", i, key, spellId)
            if icon and key then
                local spellName = GetSpellInfo(spellId);
                thj.spells[spellId] = spellName
                thj.spells[spellName] = key
            end
        end
    end
end
thj.fixSpells = function()
    -- thj.spells[317349] = thj.spells[330325]
end
-- /run SFO.ScanKeyBindings()
-- /dump GetSpellInfo(317349)
-- 330325  317349 184367
-- SKI Spell-> ` 21562 真言术：韧
-- /dump GetActionBarPage()
thj.ScanKeyBindings = function()
    wipe(thj.spells);
    -- print("--------扫描按键定义中-------")
    local curPage = GetActionBarPage();
    for i = 1, 12 do StoreKeybindInfo(curPage, "ACTIONBUTTON" .. i, i + (curPage - 1) * 12) end

    for i = 25, 36 do
        StoreKeybindInfo(3, "MULTIACTIONBAR3BUTTON" .. i - 24, i)
    end

    for i = 37, 48 do
        StoreKeybindInfo(4, "MULTIACTIONBAR4BUTTON" .. i - 36, i)
    end

    for i = 49, 60 do
        StoreKeybindInfo(5, "MULTIACTIONBAR2BUTTON" .. i - 48, i)
    end

    for i = 61, 72 do
        StoreKeybindInfo(6, "MULTIACTIONBAR1BUTTON" .. i - 60, i)
    end

    -- page 7-10
    -- for i = 72, 119 do
    --     StoreKeybindInfo(7 + floor((i - 72) / 12),
    --                      "ACTIONBUTTON" .. (1 + (i - 72) % 12), i + 1)
    -- end

    ScanStanceBar();
end

--[[
    /dump SpellFlashCore.info
    /dump SpellFlashCore.spells
    /dump SpellFlashCore.keyMapping["6"]
]]
thj.Repaint = function()
    local dot = thj.dots[0];
    local f = thj.info;
    local km = thj.keyMapping[f.key];
    if not km then
        print("SpellFlashCore Error! -> spellId = " .. f.spellId ..
                  ", spellName = " .. f.spellName .. ", key = " .. f.key)
        return
    end
    -- r = ctrl alt shift
    local r = (km.control and 1 or 0) * 0xC0 + (km.alt and 1 or 0) * 0x30 +
                  (km.shift and 1 or 0) * 0xC
    r = r / 255;
    -- g = key
    local g = km.key / 255;
    -- b = flag
    local b = (f.isCombat and 1 or 0) * 0xC0 + (f.isChanneling and 1 or 0) *
                  0x30;
    b = b / 255;
    dot:SetColorTexture(r, g, b);
end

thj.SetCombat = function(flag)
    thj.info.isCombat = flag;
    thj.Repaint();
end
thj.SetChanneling = function(flag)
    thj.info.isChanneling = flag;
    thj.Repaint();
end
thj.ResetFlash = function() end
thj.FlashKey = function(key)
    -- 战斗 或者 通道施法状态不响应
    if not thj.info.isCombat and not thj.info.isChanneling then
        return true
    end
    if not key then return false end
    thj.info.key = key;
    thj.Repaint();
    return true;
end
thj.ItemName = function(id) return id; end
thj.FlashItem = function(key, color)
    -- print("SFO->FlashItem", key)
end
thj.SpellName = function(id)
    if not id or id < 0 then return nil end
    -- print("SpellName->"..id)
    local name = thj.spells[id];
    if not name then
        name = GetSpellInfo(id);
        thj.spells[id] = name;
    end
    thj.info.spellId = id;
    thj.info.spellName = name;
    return name;
end
--[[
/dump SFO.spells[317349]
/dump SFO.spells[330325]
/dump SFO.keyMapping["1"]
/run SFO.FlashKey('1')
/run SFO.FlashAction(330325)
]]
thj.FlashAction = function(spellName, color)
    if not spellName then return end
    -- print("FlashAction->"..spellName)
    local key = thj.spells[spellName];
    if not key and thj.info.isCombat then
        local link = GetSpellLink(spellName);
        print("|cffff2020 技能 " .. link .. "未绑定按键！");
        return 
    end
    thj.FlashKey(key)
end
thj.StartQuesting = function() thj.info.isQuesting = true; end
thj.StopQuesting = function() thj.info.isQuesting = false; end