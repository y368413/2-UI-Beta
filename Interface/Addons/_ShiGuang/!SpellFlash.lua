--## Title:|CFFD74DE1[输出]|r |cffff7d0a残疾人|r |cffffe00a救助中心|r
--## Author: thj

local thj = {}
_G["SpellFlashCore"] = thj

thj.info = {
    key = nil,
    keyAlt = nil,
    isCombat = false,
    isChanneling = false,
    isQuesting = false,
    spellID = nil,
    spellName = nil,
    spellID2 = nil,
    spellName2 = nil
}
thj.spells = {}
thj.items = {}
thj.keyMapping = {}
thj.meta = {
    spellUpgrade = {
        -- ZS
        ["浴血奋战"] = "嗜血",
        ["碎甲猛击"] = "怒击",
        -- DH
        ["死亡横扫"] = "刃舞",
        ["毁灭"] = "混乱打击"
        -- LR
    },
    shapeShiftFormMapping = {[0] = 0, [1] = 96, [2] = 72, [3] = 108}
}
local _, clzName = UnitClass('player');
if (clzName == "PRIEST") then
    thj.meta.shapeShiftFormMapping[1] = 0
end
local lastUpdate = 0;
thj.createFrame = function(name, parent)
    local f = CreateFrame("Frame", name, parent or UIParent);
    f:SetScript("OnEvent", function(self, evtName, ...)
        if self[evtName] then
            if evtName == "COMBAT_LOG_EVENT_UNFILTERED" then
                local timestamp, subEvt, _, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags, extraArg1, extraArg2, extraArg3, extraArg4, extraArg5, extraArg6, extraArg7, extraArg8, extraArg9, extraArg10 = CombatLogGetCurrentEventInfo()
                if self[subEvt] then
                    self[subEvt](self,  sourceGUID, sourceName, destGUID, destName, extraArg1, extraArg2, extraArg3, extraArg4, extraArg5, extraArg6, extraArg7, extraArg8, extraArg9, extraArg10);
                end
            else
                self[evtName](self, evtName, ...);
            end
        end
    end)
    f:SetScript("OnUpdate", function(self, elapsed)
        lastUpdate = lastUpdate + elapsed;
        if lastUpdate > 1 then
            -- print("OnUpdate.elapsed = ", lastUpdate)
            lastUpdate = 0;
            thj.isMounted = IsMounted("player");
            thj.Repaint();
        end
    end)
    return f;
end

local SIZE = 5;
local sfo = thj.createFrame("SFOFrame", UIParent)
sfo:SetPoint("TOPLEFT", 0, 0);
sfo:SetFrameStrata("HIGH")
sfo:SetFrameLevel(10000)
-- /dump SFO:GetPoint()
sfo:SetSize(SIZE, SIZE);

thj.frame = sfo;

--[[
    CombatLogGetCurrentEventInfo()

]]

local insert, remove, sort, unpack, wipe = table.insert, table.remove,
                                           table.sort, table.unpack, table.wipe
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
    ["END"] = 35
} 
local km = thj.keyMapping;
for k, v in pairs(keyMapping) do
    km[k] = {key = v}
    km["CONTROL-" .. k] = {control = true, key = v}
    km["CTRL-" .. k] = {control = true, key = v}
    km["ALT-" .. k] = {alt = true, key = v}
    km["SHIFT-" .. k] = {shift = true, key = v}
    km["ALT-CTRL" .. k] = {alt = true, control = true, key = v}
    km["CTRL-SHIFT" .. k] = {shift = true, control = true, key = v}
    km["ALT-SHIFT" .. k] = {alt = true, shift = true, key = v}
    km["ALT-CTRL-SHIFT" .. k] = {
        alt = true,
        control = true,
        shift = true,
        key = v
    }
end

local function UpdateSpell(spellID, spellName, key, page)
    thj.spells[spellID] = spellName
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
        local upgradedSpell = thj.meta.spellUpgrade[spellName];
        if (upgradedSpell) then
            thj.spells[upgradedSpell] = key
        end
        -- print("SKI Spell->", key, id, spellName)
    elseif actionType == "macro" then
        local sID = GetMacroSpell(id)
        if not sID then return end
        local spellName = GetSpellInfo(sID);
        thj.spells[sID] = spellName
        thj.spells[spellName] = key
    elseif actionType == "item" then
        local item = GetItemInfo(id)
        if not item then return end
        thj.items[id] = item;
        thj.items[item] = key
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
            local icon, active, castable, spellID = GetShapeshiftFormInfo(i);
            local key1, key2 = GetBindingKey("SHAPESHIFTBUTTON" .. i);
            local key = key1 and key1 or key2;
            -- print("ScanStanceBar->", i, key, spellID)
            if icon and key then
                local spellName = GetSpellInfo(spellID);
                thj.spells[spellID] = spellName
                thj.spells[spellName] = key
            end
        end
    end
end
thj.fixSpells = function()
    -- thj.spells[317349] = thj.spells[330325]
end
-- /run SpellFlashCore.ScanKeyBindings()
-- /dump GetSpellInfo(317349)
-- 330325  317349 184367
-- SKI Spell-> ` 21562 真言术：韧
-- /dump GetActionBarPage() 
thj.ScanKeyBindings = function()
    wipe(thj.spells);
    -- print("--------扫描按键定义中-------")
    local curPage = GetActionBarPage();
    local shapeShiftForm = GetShapeshiftForm();
    if shapeShiftForm > 0 then
        for i = 1, 12 do
            StoreKeybindInfo(curPage, "ACTIONBUTTON" .. i,
                             i + thj.meta.shapeShiftFormMapping[shapeShiftForm]);
        end
    else
        for i = 1, 12 do
            StoreKeybindInfo(curPage, "ACTIONBUTTON" .. i,
                             i + (curPage - 1) * 12)
        end
    end

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

    -- 变身技能覆盖
    --[[
        cat; 1=human 73=cat  97=bear  109=catkin
    ]]
    ScanStanceBar();
end
-- /dump SpellFlashCore.FindBar()
thj.FindBar = function()
    for i = 0, 9 do
        local slot = i * 12 + 1;
        local type, id = GetActionInfo(slot);
        if id then
            local name = GetSpellInfo(id);
            print(slot, "-=>", id, name)
        end
    end
end

local sfo = thj.frame
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
sfo:RegisterEvent("CURRENT_SPELL_CAST_CHANGED")
function sfo:CURRENT_SPELL_CAST_CHANGED(_, flag)
    if flag then thj.ScanKeyBindings(); end
end

--[[ 创建UI ]]
local sfo = thj.frame;

local SIZE = 5;
local tx = sfo:CreateTexture(nil, "ARTWORK");
tx:SetColorTexture(1, 1, 0);
tx:SetSize(SIZE, SIZE);
tx:SetPoint("TOPLEFT", sfo, "TOPLEFT", 0, 0)
thj.tx = tx;
local tx2 = sfo:CreateTexture(nil, "ARTWORK");
tx2:SetColorTexture(1, 1, 0);
tx2:SetSize(SIZE, SIZE);
tx2:SetPoint("TOPLEFT", tx, "TOPRIGHT", 0, 0)
thj.txAlt = tx2;
--[[local text = sfo:CreateFontString()
text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
text:SetText("-")
text:SetPoint("TOPLEFT", tx2, "TOPRIGHT", 5, 0)
thj.debugger = text;]]
--[[
    注册重绘方法
    /dump SpellFlashCore.info
    /dump SpellFlashCore.spells
    /dump SpellFlashCore.keyMapping["6"]
    /dump SpellFlashCore.keyMapping["嗜血"]
]]
--[[
    --界面重绘--
    r:[AABBCC00]  AA-Control            BB-Alt                          CC-Shift
    g:[XXXXXXXX]  KeyCode
    b:[AABB0000]  AA-Combat Flag        BB-Channel/Quest Flag
]]
local function getSpellColor(key)
    local r, g, b;
    local f = thj.info;
    local km = thj.keyMapping[key or ""];
    if not km then
        r = 0;
        g = 0;
    else
        -- r = 组合键标志位<CCAASS00> ctrl | alt | shift  
        r = (km.control and 1 or 0) * 0xC0 + (km.alt and 1 or 0) * 0x30 +
                (km.shift and 1 or 0) * 0xC
        r = r / 255;
        -- g = 按键编码
        g = km.key / 255;
    end
    -- b = 标志位：战斗状态 | 通道施法
    b = ((f.isCombat and not thj.isMounted) and 1 or 0) * 0xC0 + (f.isChanneling and 1 or 0) * 0x30;
    b = b / 255;
    return r, g, b;
end
thj.Repaint = function()
    local dot = thj.tx;
    local f = thj.info;
    local r, g, b = getSpellColor(f.key);
    thj.tx:SetColorTexture(r, g, b);
    r, g, b = getSpellColor(f.keyAlt);
    thj.txAlt:SetColorTexture(r, g, b);
end
thj.Log = function(msg) 
    thj.debugger:SetText(msg) 
    print(msg)
end

local sfo = thj.frame;
--[[
    事件注册
]]

-- 战斗状态指示
sfo:RegisterEvent("PLAYER_REGEN_ENABLED")
function sfo:PLAYER_REGEN_ENABLED() thj.SetCombat(false) end
sfo:RegisterEvent("PLAYER_REGEN_DISABLED")
function sfo:PLAYER_REGEN_DISABLED() thj.SetCombat(true) end
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

--[[
    SFO API
]]

--[[                                  公共方法                              ]]
--[[
    设置战斗状态
]]
thj.SetCombat = function(flag)
    thj.info.isCombat = flag;
    thj.Repaint();
end
--[[
    设置通道施法状态
]]
thj.SetChanneling = function(flag)
    thj.info.isChanneling = flag;
    thj.Repaint();
end
--[[
    根据按键进行技能提示
]]
thj.FlashKey = function(key, slot)
    -- 战斗 或者 通道施法状态 不响应
    if not thj.info.isCombat and not thj.info.isChanneling then return end
    if not key then return end
    thj.info["key" .. (slot or "")] = key;
    thj.Repaint();
    return;
end
--[[
    API: 根据技能ID获取技能名称
    @param id: 技能ID
    @returns 技能名称
]]
thj.SpellName = function(id)
    if not id or id < 0 then return nil end
    -- print("SpellName->"..id)
    local name = thj.spells[id];
    if not name then
        name = GetSpellInfo(id);
        thj.spells[id] = name;
    end
    thj.info.spellID = id;
    thj.info.spellName = name;
    return name;
end
--[[
    API: 根据技能名称提示技能
    @param spellName: 技能名称
]]
thj.FlashAction = function(spellName)
    local key;
    if type(spellName) ~= "table" then
        -- print("FlashAction->" .. spellName)
        if not spellName then return end
        key = thj.spells[spellName];
    else
        -- print("FlashTableAction->", spellName[1])
        for k, v in pairs(spellName) do
            local name = GetSpellInfo(v);
            -- print("FlashTableAction->", k, v, name, thj.spells[v])
            key = thj.spells[name];
            -- 如果key不为空，则跳出循环
            if key then break end
        end
    end
    if not key and thj.info.isCombat and thj.info.spellID then
        local id = thj.info.spellID;
        print("|cffff2020 Spell: " .. spellName .. " not found!|r")
        return
    end
    thj.FlashKey(key)
end
thj.Flashable = function() return true end;
--[[
    API: 根据技能名称提示技能
    @param spellName: 技能名称
]]
thj.FlashAction2 = function(spellName)
    if not spellName then return end
    local key = thj.spells[spellName];
    if not key and thj.info.isCombat and thj.info.spellID then
        print("|cffff2020 Spell: " .. spellName .. " not found!|r")
        return
    end
    thj.FlashKey(key, "Alt")
end
--[[
    API: 根据物品ID获取物品名称
    @param id: 物品ID
    @returns 物品名称
]]
thj.ItemName = function(id)
    if not id or id < 0 then return nil end
    -- print("SpellName->"..id)
    local name = thj.items[id];
    if not name then
        name = GetItemInfo(id);
        thj.items[id] = name;
    end
    thj.info.spellID = id;
    thj.info.spellName = name;
    return name;
end
--[[
    API: 根据物品名称提示物品使用
    @param spellName: 物品名称
    @param color: 忽视
]]
thj.FlashItem = function(itemName, color)
    if not itemName then return end
    local key = thj.items[itemName];
    if not key and thj.info.isCombat and thj.info.spellID then
        print("|cffff2020 Item: " .. itemName .. " not found!|r")
        return
    end
    thj.FlashKey(key)
end
thj.StartQuesting = function() thj.info.isQuesting = true; end
thj.StopQuesting = function() thj.info.isQuesting = false; end


--[[ 战士盾反助手统计
local SRE = thj.createFrame("srEvt", thj.frame);
local myName = UnitName("player")
local Spell = {Berserk = 18499, SpellReflection = 23920}
print("--盾反提示 loaded--");
local btnSR = CreateFrame("Button", "SpellReflectionButton", UIParent,
                          "BackdropTemplate")
btnSR:SetWidth(32)
btnSR:SetHeight(32)
btnSR:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
btnSR:SetFrameStrata("LOW")
btnSR:SetBackdrop({bgFile = "Interface\\AddOns\\HelloWow\\media\\Hexagon"})
btnSR:SetBackdropColor(1, 0.3, 0.3)
btnSR:SetAttribute("unit", "player")
btnSR:RegisterForClicks("LeftButtonDown")
btnSR:SetAttribute("type", "macro")
btnSR:SetAttribute("macrotext", "/cast 法术反射")

local spellMeta = {}
local toDebugBosses = {["穆厄扎拉"] = true}
SRE:RegisterEvent("UNIT_SPELLCAST_START")

local LSF = thj;
local function doCounter(meta)
    if not meta.counterSpell then return end
    local spellName = LSF.SpellName(meta.counterSpell)
    if meta.delay then
        print("Delay start! ->" .. meta.delay)
        C_Timer.After(meta.delay, function()
            print("Delay done!")
            LSF.FlashAction2(spellName)
        end)
    else
        LSF.FlashAction2(spellName)
    end
end
-- 法术施放监听
function SRE:UNIT_SPELLCAST_START(frame, casterID, evtID, spellID)
    local spellTarget = UnitName(casterID .. "target") or "Nobody";
    local isTargetingPlayer = spellTarget == myName;
    local meta = spellMeta[spellID];
    local caster = UnitName(casterID);
    local spellName = GetSpellInfo(spellID);
    if toDebugBosses[caster] then
        print("UNIT_SPELLCAST_START", caster, spellID)
    end
    -- 如果当前正在释放的法术ID在监听列表中，则进一步判断
    if meta then
        print(
            (caster or casterID) .. " -> " .. (spellName or spellID) .. " @ " ..
                spellTarget)
        print("  target = " .. spellTarget,
              "isTarMe = " .. (isTargetingPlayer and "Yes" or "No~"))
        if meta.reflectAll or isTargetingPlayer then
            btnSR:SetBackdropColor(0.3, 1, 0.3)
            doCounter(meta)
        end
    end
end

SRE:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", "player")
function SRE:UNIT_SPELLCAST_SUCCEEDED(frame, casterID, evtID, spellID)
    if spellID ==  Spell.SpellReflection then
        btnSR:SetBackdropColor(1, 0.3, 0.3)
        -- thj.info.spell2 = nil;
    end
    LSF.Repaint();
end
--   添加需要处理的法术列表 334748
local function addSingleSpell(spellID, counterSpell, delay)
    if not counterSpell then return end
    delay = delay or 0;
    spellMeta[spellID] = {
        reflectAll = false,
        delay = delay,
        counterSpell = counterSpell
    }
    return spellMeta[spellID]
end
local function addAoeSpell(spellID, counterSpell, delay)
    if not counterSpell then return end
    spellMeta[spellID] = {
        reflectAll = true,
        delay = delay,
        counterSpell = counterSpell
    }
    return spellMeta[spellID]
end

--- 彼界 ---
addSingleSpell(322736, Spell.SpellReflection) -- [哈卡] - [尖锐脊刺] T
addSingleSpell(323166, Spell.SpellReflection) -- [哈卡] - [堕落之血]
addSingleSpell(320008, Spell.SpellReflection) -- [法力风暴夫妇] - [寒冰箭]  T
addSingleSpell(320230, Spell.SpellReflection, 2) -- [商人赛·艾柯莎] - [爆破计谋]  5s
-- addSingleSpell(323687) -- [商人赛·艾柯莎] - [奥术闪电]
addAoeSpell(325258, Spell.SpellReflection) -- [死亡之主] - [穆厄扎拉]
addSingleSpell(327646) -- [灵魂碎裂] T - [穆厄扎拉]
-- 小怪 --
addSingleSpell(332705) -- Smite
addSingleSpell(332707) -- Shadow Word: Pain
addSingleSpell(332605) -- Hex
addSingleSpell(334076) -- Shadowcore
addSingleSpell(332196) -- Discharge
addSingleSpell(328707) -- Scribe
addSingleSpell(333641) -- Reaver
addSingleSpell(332234) -- Essential Oil
addSingleSpell(333711) -- Decript Bite
addSingleSpell(323544) -- Blood Nova

--- 赎罪大厅 ---
addSingleSpell(322977) -- Sinlight Visions - Halkias
addSingleSpell(328322) -- Villainous Bolt - Ecehlon
addSingleSpell(323538) -- Bolt of Power - High Adjucator Aleez
addSingleSpell(328791, Spell.SpellReflection) -- 哀伤仪式 - Lord Chamberlain
-- 小怪 --
addSingleSpell(338003) -- Wicked Bolt
addSingleSpell(325700) -- Collect Sins
addSingleSpell(326829) -- Wicked Bolt

--- 仙林 ---
addSingleSpell(323057, Spell.SpellReflection) -- 灵魂之箭 - Ingra Maloch
-- 小怪 --
addSingleSpell(324923) -- Bramble Burst
addSingleSpell(326319) -- Spirit Bolt
addSingleSpell(322767) -- Drust Harvester - Spellname: Spirit Bolt - Reflect result: REFLECT
addSingleSpell(322557) -- Soul Split
addSingleSpell(331718) -- Spear Flurry
addSingleSpell(325223) -- Anima Injection
addSingleSpell(325418) -- Volatile Acid
addSingleSpell(322487) -- Tirnenn Villager - Spellname: Overgrowth - Reflect result: REFLECT

--- 凋魂 ---
addSingleSpell(324527, Spell.SpellReflection) -- 凋零践踏 - Globrog
addSingleSpell(329110, Spell.SpellReflection) -- 软泥注射 - Doctor Ickus
-- 小怪 --
addSingleSpell(328475) -- Enveloping Webbing
addSingleSpell(327995) -- Doom Shroom
addSingleSpell(327552) -- Doom Shroom
addSingleSpell(328002) -- Hurl Spores
addSingleSpell(328180) -- Gripping Infection
addSingleSpell(328094) -- Pestilence Bolt
addSingleSpell(334926) -- Wretched Phlegm
addSingleSpell(320512) -- Corroded Claws

--- 赤红 ---

addSingleSpell(322554, Spell.SpellReflection) -- 严惩（点名红圈） - Executor Tarvold

-- 小怪 --

addSingleSpell(326712) -- Dark Bolt
addSingleSpell(321249) -- Shadow Claws
addSingleSpell(326827) -- Dread Bindings
addSingleSpell(326837) -- Gloom Burst
addSingleSpell(326952) -- Fiery Cantrip
addSingleSpell(322169) -- Growing Mistrust
addSingleSpell(321038) -- Wrack Soul

--- 晋升 ---
addSingleSpell(324368) -- Attenuated Barrage - Kin-Tara
addSingleSpell(324608) -- Charged Stomp - Oryphrion
addSingleSpell(334053) -- Purifying Blast - Oryphrion
-- 小怪 --
addSingleSpell(317661) -- Insidious Venom
addSingleSpell(323804) -- Dark Seeker

--- 通灵 ---
addSingleSpell(320637) -- Fetid Gas - Blightbone
addSingleSpell(328146) -- Fetid Gas - Blightbone
addSingleSpell(328667) -- Frostbolt Volley - Amarth, the Harvester
addSingleSpell(320788) -- Frozen Binds - Nalthor the Rimebinder
addSingleSpell(322274) -- Enfeeble - Nalthor the Rimebinder

-- 小怪 --
addSingleSpell(334748, Spell.Berserk, 1) -- Drain Fluids
addSingleSpell(320462) -- Necrotic Bolt
addSingleSpell(320170) -- Necrotic Bolt
addSingleSpell(320171) -- Necrotic Bolt
addSingleSpell(333479) -- Spew Disease
addSingleSpell(323347) -- Clinging Darkness

--- 剧场 ---
addSingleSpell(320120) -- Plague Bolt - An Affront of Challengers
addSingleSpell(320300) -- Necromantic Bolt - An Affront of Challengers
addSingleSpell(319669) -- Spectral Reach - Kul'tharok
addSingleSpell(324079) -- Reaping Scythe - Mordretha, the Endless Empress
addSingleSpell(324589) -- Death Bolt - Mordretha, the Endless Empress
addSingleSpell(323608) -- Dark Devastation - Mordretha, the Endless Empress

-- 小怪 --
addSingleSpell(330784) -- Necrotic Bolt
addSingleSpell(330703) -- Decaying Filth
addSingleSpell(333299) -- Curse of Desolation
addSingleSpell(330875) -- Spirit Frost
addSingleSpell(330810) -- Bind Soul
addSingleSpell(332550) -- Soul Touch
-- =统御圣所=--
addSingleSpell(350453, true)]]
--[[

320462
aura_env.reflectableSpells = {}

--- Sanctum of Domination ---
---Bosses---
--- Eye of the Jailer ---
addSingleSpell(350453) -- Deathseeker Eye - Spellname: Piercing Lens - Reflect result: Reflect no dmg
addSingleSpell(348969) -- Eye of the Jailer - Spellname: Immediate Extermination  - Reflect result: Reflect 1 tick

--- The Nine ---
addSingleSpell(350283) -- Signe - Spellname: Soulful Blast - Reflect result: Reflect with dmg

--- Soulrender Dormazain ---
addSingleSpell(350801) -- Soulrender Dormazain - Spellname: Unleashed Tyranny - Reflect result: REFLECT with big damage
addSingleSpell(354231) -- Soulrender Dormazain - Spellname: Soul Manacles - Reflect result: Reflect 1 tick

--- Fatescribe Roh-Kalo ---
addSingleSpell(353398) -- Fatespawn Anomaly - Spellname: Anomalous Blast - Reflect result: Reflect with damage
addSingleSpell(353603) -- Fatescribe Roh-Kalo - Spellname: Diviner's Probe - Reflect result: Deflect
addSingleSpell(353931) -- Fatescribe Roh-Kalo - Spellname: Twist Fate - Reflect result: Reflect and prevent debuff

--- Sylvanas Windrunner ---
addSingleSpell(352650) -- Sylvanas Windrunner - Spellname: Ranger's Heartseeker - Reflect result: deflect 1 tick
addSingleSpell(358181) -- Sylvanas Windrunner - Spellname: Banshee's Blades - Reflect result: REFLECT magic portion

---Trash---
addSingleSpell(355072) -- Mawsworn Darkcaster - Spellname: Pain Blast - Reflect result: 7.58 K
addSingleSpell(355072) -- Mawsworn Darkcaster - Spellname: Pain Blast - Reflect result: 7.58 K 
addSingleSpell(356139) -- Mawsworn Lancer - Spellname: Empower Lance - Reflect result: REFLECT
addSingleSpell(358226) -- Mawsworn Embermage - Spellname: Firebolt - Reflect result: 6.31 K

--- Tazavesh ---
addSingleSpell(355930) -- Interrogation Specialist - Spellname: Spark Burn - Reflect result: REFLECT 
addSingleSpell(354297) -- Support Officer - Spellname: Hyperlight Bolt - Reflect result: REFLECT
addSingleSpell(355225) -- Fishmancer - Spellname: Waterbolt - Reflect result: REFLECT
addSingleSpell(352347) -- Vault Purifier - Spell Name: Valorous Bolt - Reflect result: REFLECT

--- Korthia ---
addSingleSpell(355887) -- Mawsworn Gatekeeper/Mawsworn Interrogator -- Pain Spike

--- The Maw ---
addSingleSpell(346243) -- Ghastly Willbreaker -- Shatter Resolve
addSingleSpell(329383) -- Nascent Shade  - Spellname: Suffering  - Reflect result: 1.92 K
addSingleSpell(304946) -- Mawsworn Skylurker - Spellname: Shadow Rip - Reflect result: REFLECT
addSingleSpell(343104) -- Blazing Stygia - Spellname: Scorch - Reflect result: 1.68 K 
addSingleSpell(275983) -- Magmic Flamebinder - Spellname: Firebolt - Reflect result: 1.14 K
addSingleSpell(346483) -- Inquisitor Devaki - Spellname: Painful Burst - Reflect result: REFLECT
addSingleSpell(336763) -- Resonant Agony - Spellname: Touch of Anguish - Reflect result: REFLECT
addSingleSpell(335680) -- Mawsworn Collector - Spellname: Pain Spike - Reflect result: REFLECT
addSingleSpell(330958) -- Mawsworn Deathsinger - Spellname: Soulfrost Shard - Reflect result: 2.68 K

--- Torghast ---
addSingleSpell(292926) -- Lord of Torment - Spellname: Eternal Torment - Reflect result: REFLECT 
addSingleSpell(305136) -- Empowered Coldheart Agent - Spellname: Shadow Spear - Reflect result: 8.06 K 

--- Bastion ---
addSingleSpell(342168) -- Dark Watcher - Spellname: Valiant Bolt - Reflect result: REFLECT 
addSingleSpell(341078) -- Dark Watcher - Spellname: Exoneration - Reflect result: REFLECT

--- Ardenweald ---
addSingleSpell(322745) -- Runestag - Spellname: Dreaming Charge - Reflect result: REFLECT
addSingleSpell(340678) -- Blighted Darkcaster - Spellname: Death Bolt - Reflect result: 2.34 K
addSingleSpell(338955) -- Gorm Harrier - Spellname: Acidic Injection - Reflect result: REFLECT
addSingleSpell(256865) -- Drust Shadowflayer - Spellname: Ruinous Bolt - Reflect result: 2.37 K
addSingleSpell(325183) -- Drustcrazed Tender - Spellname: Bruising Strike - Reflect result: REFLECT
addSingleSpell(320067) -- Drustcrazed Keeper - Spellname: Faerie Dust - Reflect result: REFLECT
addSingleSpell(320081) -- Drustcrazed Keeper - Spellname: Whimsy Barb - Reflect result: REFLECT
addSingleSpell(278919) -- Blighted Subduer - Spellname: Dark Claw - Reflect result: REFLECT
addSingleSpell(323446) -- Silentwing Ardenmoth - Spellname: Anima Toxin - Reflect result: REFLECT
addSingleSpell(322745) -- Highland Bull - Spellname: Dreaming Charge - Reflect result: REFLECT
addSingleSpell(338921) -- Gorm Secretor - Spellname: Sticky Secretion - Reflect result: REFLECT
addSingleSpell(322980) -- Evolving Mite - Spellname: Acidic Spit - Reflect result: REFLECT
addSingleSpell(340848) -- Dustbrawl - Spellname: Sand Blast - Reflect result: REFLECT
addSingleSpell(268792) -- Desiccated Duster - Spellname: Sand Blast - Reflect result: 3.35 K
addSingleSpell(341084) -- Blighted Overseer - Spellname: Spirit Bolt - Reflect result: REFLECT 
addSingleSpell(340759) -- Blighted Overseer - Spellname: Manifest Dread - Reflect result: REFLECT
addSingleSpell(324483) -- Possessed Guardian - Spellname: Anima-Charged Spear - Reflect result: REFLECT

--- Maldraxxus ---
addSingleSpell(318243) -- Runespeaker Malcorn - Spellname: Necrotic Bolt - Reflect result: REFLECT 
addSingleSpell(315076) -- Runespeaker Jorg - Spellname: Spectral Bolt - Reflect result: 1.34 K 
addSingleSpell(318312) -- Runespeaker Malcorn - Spellname: Decaying Touch - Reflect result: REFLECT
addSingleSpell(332650) -- Ritual Runeweaver - Spellname: Necrotic Bolt - Reflect result: 447 
addSingleSpell(330958) -- Master Runeshaper - Spellname: Soulfrost Shard - Reflect result: 1.55 K 
addSingleSpell(330926) -- Master Runeshaper - Spellname: Death Bolt - Reflect result: REFLECT
addSingleSpell(288710) -- Fireforge Enchanter - Spellname: Fireball - Reflect result: REFLECT
addSingleSpell(330569) -- Fatal Coalescence - Spellname: Deathbolt Rift - Reflect result: REFLECT 

--- Revendreth ---
addSingleSpell(333435) -- Tollkeeper Varaboss - Spellname: Exact Toll - Reflect result: REFLECT
addSingleSpell(328414) -- Renegade Collector - Spellname: Soul Flay - Reflect result: REFLECT
addSingleSpell(342947) -- Muckribbon - Spellname: Numbing Poison - Reflect result: REFLECT
addSingleSpell(331906) -- Unstable Muck - Spellname: Fling Muck - Reflect result: REFLECT
addSingleSpell(328411) -- Manor Leecher - Spellname: Dark Bolt - Reflect result: REFLECT
addSingleSpell(315076) -- Maldraxxi Defector - Spellname: Spectral Bolt - Reflect result: 1.34 K 
addSingleSpell(318312) -- Maldraxxi Defector - Spellname: Decaying Touch - Reflect result: REFLECT
addSingleSpell(333616) -- Devourer Mite - Spellname: Devour Essence - Reflect result: REFLECT 1 Tick
addSingleSpell(326032) -- Manifestation of Gluttony - Spellname: Relentless Feeding - Reflect result: REFLECT
addSingleSpell(325932) -- Manifestation of Pride - Spellname: Unmitigated Hubris - Reflect result: REFLECT
addSingleSpell(337346) -- Vain Courtier - Spellname: Arcane Bolt - Reflect result: REFLECT
addSingleSpell(335474) -- Manifestation of Fatigue - Spellname: Weary Soul - Reflect result: REFLECT
addSingleSpell(328413) -- Ardent Loyalist - Spellname: Sorrowful Burden - Reflect result: REFLECT
addSingleSpell(341962) -- Duke Vielle - Spellname: Forced Contrition - Reflect result: REFLECT
addSingleSpell(318255) -- Ash Crawler - Spellname: Ashen Bolt - Reflect result: REFLECT
addSingleSpell(331811) -- Lightbound Scorcher - Spellname: Holy Bolt - Reflect result: 1.67 K
addSingleSpell(330409) -- Feral Ritualist - Spellname: Wild Blast - Reflect result: 1.43 K
addSingleSpell(330604) -- Tower Creeper - Spellname: Grim Venom - Reflect result: REFLECT
addSingleSpell(338011) -- Primordial Sludge - Spellname: Sludge Bolt - Reflect result: REFLECT

--- 纳斯里亚堡 ---
--- Huntsman Altimor ---
addSingleSpell(334852) -- Petrifying Howl - Huntsman Altimor
addSingleSpell(335114) -- Sinseeker - Huntsman Altimor
--- Sun King's Salvation ---
addSingleSpell(328885) -- Greater Castigation - Sun King's Salvation
--- Lady Inerva Darkvein ---
addSingleSpell(331573) -- Unconscionable Guilt - Lady Inerva Darkvein
addSingleSpell(342321) -- Concentrated Anima - Lady Inerva Darkvein
addSingleSpell(342320) -- Lightly Concentrated Anima - Lady Inerva Darkvein
--- The Council of Blood ---
addSingleSpell(330968) -- Throw Food - The Council of Blood
addSingleSpell(346800) -- Waltz of Blood - The Council of Blood
addSingleSpell(346654) -- Drain Essence - The Council of Blood
addSingleSpell(331634) -- Dark Recital - The Council of Blood
--- Sire Denathrius ---
addSingleSpell(326005) -- Indignation - Sire Denathrius
addSingleSpell(326994) -- Blood Price - Sire Denathrius
addSingleSpell(326851) -- Blood Price - Sire Denathrius


-- Do not touch anything below this line. --

local header = "======== |T132361:20|t Spell Reflection Tracker |T132361:20|t ========"
aura_env.nameplateWarning = function()
    if C_CVar.GetCVar("nameplateShowEnemies") ~= "1" then
        print(header)
        print("\124cFFFF0000Enemy Nameplates are NOT enabled.\124r")
        print("\124cFFFF0000This WeakAura will not function without Enemy Nameplates enabled.\124r")
        print("This warning can be disabled in Custom Options.")
        print(header)
    end
end
if aura_env.config.nameplateWarning then
    aura_env.nameplateWarning()
end
aura_env.nameplateWarningSent = false

aura_env.castTable = {}
aura_env.sortCount = 1

aura_env.spairs = function(t)
    
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end
    
    table.sort(keys, function(a,b)
            return (t[a].endTime == t[b].endTime and t[a].sortCount < t[b].sortCount) or t[a].endTime < t[b].endTime
    end)
    
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i】】
        end
    end
end

aura_env.getBuffInfo = function(spellID)
    
    local _, _, _, _, buffDuration, buffExpirationTime, _, _, _, buffSpellID = WA_GetUnitBuff("player", spellID)
    
    -- build info table
    local infoTable = {
        isUp = buffSpellID == spellID,
        duration = not buffDuration and 0 or buffDuration,
        expirationTime = not buffExpirationTime and 0 or buffExpirationTime
    }
    
    return infoTable
end

aura_env.firstClone = {}
aura_env.spellReflection = aura_env.getBuffInfo(23920)
aura_env.shouldRun = false

local goingToReflect = nil

aura_env.colorReflectedSpell = function()
    
    if aura_env.config.colorReflectedSpell and aura_env.spellReflection.isUp
    and aura_env.spellReflection.expirationTime > aura_env.firstClone.endTime and aura_env.shouldRun then
        
        local region = WeakAuras.GetRegion(aura_env.id, aura_env.firstClone.key)
        region.bar.fg:SetVertexColor(aura_env.config.reflectedSpellBarColor[1],aura_env.config.reflectedSpellBarColor[2],
            aura_env.config.reflectedSpellBarColor[3],aura_env.config.reflectedSpellBarColor[4])
        
        goingToReflect = aura_env.firstClone.key
    end
end

local LCG = LibStub("LibCustomGlow-1.0")
local previousHighlightCast = nil

aura_env.highlight = function()
    
    local region = WeakAuras.GetRegion(aura_env.id, aura_env.highlightCast)
    
    if previousHighlightCast ~= aura_env.highlightCast then
        
        if previousHighlightCast then
            local previousRegion = WeakAuras.GetRegion(aura_env.id, previousHighlightCast)
            LCG.PixelGlow_Stop(previousRegion.bar)
        end
        
        LCG.PixelGlow_Start(region.bar,{1,1,0,1},4,0.25,nil,1,nil,nil,false)
        previousHighlightCast = aura_env.highlightCast
    end
    
    if goingToReflect then
        local gtrRegion = WeakAuras.GetRegion(aura_env.id, goingToReflect)
        LCG.PixelGlow_Stop(gtrRegion.bar)
    end
    goingToReflect = false
end

aura_env.strStartsWith = function(str, start)
    return string.sub(str,1,string.len(start)) == start
end
]]
