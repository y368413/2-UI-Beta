local addonName, ns = ...
_G[addonName] = ns

ns[1] = {} -- Config
ns[2] = {} -- Function
ns[3] = {} -- Locales
local C, F, L = unpack(ns)
setmetatable(L, {__index = function(_, k) return k end})

local loaded =  false

function F:IsLoaded()
    return loaded
end

function F:RemoveArrayValue(tbl,value)
    for i = #tbl,1,-1 do 
        if tbl[i] == value then
            tremove(tbl,i)
        end
    end
end

local eventHandler = CreateFrame("Frame")

eventHandler:SetScript("OnEvent",function(self,event,...)
    F:FireCallback(self,event,...)
end)


local CUSTOM_CALLBACK_PREFIX = "CUSTOM"
function F:RegisterCallback(event,callback)
    event = event:upper()
    if not eventHandler[event] then
        eventHandler[event] = {}
        -- CUSTOM_CALLBACK_PREFIX
        if not (event:sub(1,strlen(CUSTOM_CALLBACK_PREFIX)) == CUSTOM_CALLBACK_PREFIX) then
            eventHandler:RegisterEvent(event)
        end
    end
    tinsert(eventHandler[event],callback)
end

function F:FireCallback(t,event,...)
    event = event:upper()
    if eventHandler[event] then
        for _,callback in ipairs(eventHandler[event]) do callback(t,event,...) end
    end
end

function F:UnregisterCallback(event,callback)
    event = event:upper()
    if eventHandler[event] then
        F:RemoveArrayValue(eventHandler[event],callback)
    end
end

function F:initSettings(source, target)
    for i, j in pairs(source) do
        if type(j) == "table" then
            if target[i] == nil then target[i] = {} end
            for k, v in pairs(j) do
                if target[i][k] == nil then target[i][k] = v end
            end
        else
            if target[i] == nil then target[i] = j end
        end
    end
    for i in pairs(target) do if source[i] == nil then target[i] = nil end end
end

function F.registerCMD(key, cmd, callback) 
    key = key:upper() 
    if type(callback) == "function" then 
        if type(cmd) == "string" then 
            _G["SLASH_" .. key .. "1"] = "/"..cmd 
        elseif type(cmd) == "table" then 
            for i, v in pairs(cmd) do 
                _G["SLASH_" .. key .. i] = "/"..cmd[i] 
            end 
        end 
        SlashCmdList[key] = callback 
    end 
end

F:RegisterCallback("ADDON_LOADED",function(self,_,addon)
    if addon == addonName then
        F:FireCallback(ns,"CUSTOM_ADDON_PRELOAD")
    end
end)
F:RegisterCallback("PLAYER_LOGIN",function()
    F:FireCallback(ns,"CUSTOM_ADDON_LOAD")
end)
F:RegisterCallback("PLAYER_ENTERING_WORLD",function(self,_,isInitialLogin, isReloadingUi)
    if isInitialLogin or isReloadingUi then
        F:FireCallback(ns,"CUSTOM_ADDON_POSTLOAD")
    end
end)

local _, class = UnitClass("player")
loaded = (class == "SHAMAN")

local C, F, L = unpack(ns)
if not F:IsLoaded() then return end
local GetSpecialization,GetNumSpecializations,GetTalentInfo,GetActiveSpecGroup = GetSpecialization,GetNumSpecializations,GetTalentInfo,GetActiveSpecGroup

C.db = {}
local config = {
    font = STANDARD_TEXT_FONT, -- 字体
    fontSize = 12, -- 字体大小
    -- icon
    iconSize = 32, -- 图标大小
    spacing = 5, -- 图标间隔
    -- icon alpha
    CDAlpha = .6, -- CD时的图标透明度
    AuraAlpha = 1, -- 进行时的图标透明度
    -- misc
    showSpellCD = true -- 显示技能冷却时间
}
C.config = config

local watchOrderSpell = {
    [1] = { -- 元素
        [1] = 198103, -- 土元素
        [2] = 192058, -- 电能图腾
        [3] = 198067, -- 火元素
        [4] = 8143 -- 战栗图腾
    },
    [2] = { -- 增强
        [1] = 198103, -- 土元素
        [2] = 192058, -- 电能图腾
        [3] = 2484, -- 地缚图腾
        [4] = 8143 -- 战栗图腾
    },
    [3] = { -- 恢复
        [1] = 198103, -- 土元素
        [2] = 98008, -- 灵魂链接
        [3] = 108280, -- 治疗之潮
        [4] = 5394, -- 治疗之泉图腾
        [5] = 16191, -- 法力之潮图腾
    }
}
local function resettingSpellList()
    C.watchOrderSpell = {}
    F:initSettings(watchOrderSpell,C.watchOrderSpell)
end


function C:UpdateWatchedSpellList()
    resettingSpellList()
    local talents = C:GetWatchTalents()
    local spells = C:GetWatchSpells()
    for k,v in pairs(talents) do 
        if v.learn then
            tinsert(C.watchOrderSpell[self.db.spec],v.spell)
            if v.replace or v.passive then
                F:RemoveArrayValue(C.watchOrderSpell[self.db.spec],v.spell)
            end
            
        end
    end
end

-- learn 是否学会
-- spell 法术ID
-- replace 替代原有法术
-- passive 被动法术
local watchTalents = {
    [1] = { -- 元素
        ["4:2"] = {learn = false, spell = 192249,replace = true}, -- 风暴元素（代替火元素
        ["4:3"] = {learn = false, spell = 192222}, -- 岩浆图腾
        ["5:3"] = {learn = false, spell = 192077}, -- 狂风图腾
        ["6:2"] = {learn = false, spell = 117013,isPet =true,passive = true} -- 元素尊者（使图腾变成宠物
    },
    [2] = { -- 增强
        ["5:3"] = {learn = false, spell = 192077} -- 狂风图腾
    },
    [3] = { -- 恢复
        ["3:2"] = {learn = false, spell = 51485}, -- 陷地图腾
        ["4:2"] = {learn = false, spell = 198838}, -- 大地之墙图腾
        ["4:3"] = {learn = false, spell = 207399}, -- 先祖护佑图腾
        ["5:3"] = {learn = false, spell = 192077}, -- 狂风图腾
        ["6:3"] = {learn = false, spell = 157153,replace=true} -- 暴雨图腾（代替治疗之泉图腾
    }
}
local PetDuration = {
    [198103] = 60,   -- 元素尊者： 土元素
    [198067] = 30,   -- 元素尊者： 火元素/风暴元素
}
function C:UpdateTalent()
    self.db.spec = GetSpecialization() or 0
    if self.db.spec < GetNumSpecializations() and self.db.spec > 0 then
        local talents = watchTalents[self.db.spec]
        for k,v in pairs(talents) do 
            local tier,column = strsplit(":",k)
            local _, _, _, selected, _, spell, _, _, _, _, known = GetTalentInfo(tier, column, GetActiveSpecGroup())
            local name = F:GetActiveSpellName(spell,false)
            if name then 
                if spell == v.spell and (selected or known) then
                    v.learn = true
                else
                    v.learn = false
                end

            end
        end
        C:UpdateWatchedSpellList()
    end
end
function C:GetWatchTalentInfo(spell)
    self.db.spec = GetSpecialization() or 0
    if self.db.spec <= GetNumSpecializations() then
        local talents = watchTalents[self.db.spec]
        for k,v in pairs(talents) do
            local name = F:GetActiveSpellName(spell,false)
            if name then
                local watchName = F:GetActiveSpellName(v.spell,false)
                if name == watchName then return v end
            end
        end
    end
end
function C:GetWatchTalents()
    self.db.spec = GetSpecialization() or 0
    return watchTalents[self.db.spec]
end

function C:GetPetDuration(spell)
    local name = F:GetActiveSpellName(spell)
    for k,v in pairs(PetDuration) do 
        local watchName = F:GetActiveSpellName(k)
        if name == watchName then return v end
    end
    return 0
end

function C:GetWatchSpells()
    return self.watchOrderSpell[self.db.spec]
end

function C:GetWatchSpell(index)
    return self.watchOrderSpell[self.db.spec][index]
end

-- 特殊处理 这里用了一个magicValue 想办法干掉他
function C:IsPet(index)
    local name = F:GetActiveSpellName(self:GetWatchSpell(index))
    for k ,v in pairs(PetDuration) do 
        local watchName = F:GetActiveSpellName(k)
        local watchSpecialTalent = C:GetWatchTalentInfo(117013)
        if watchName == name and watchSpecialTalent and watchSpecialTalent.learn  then
            return true
        end
    end
    return false
end


local defaultConfig = {["pos"] = {"CENTER", "UIParent", "CENTER", 0, -230}}

F:RegisterCallback("CUSTOM_ADDON_PRELOAD", function(self)
    if not SpecialTotemBarConfig then SpecialTotemBarConfig = {} end
    F:initSettings(defaultConfig, SpecialTotemBarConfig)
    C.db.var = SpecialTotemBarConfig
    resettingSpellList()
end)
function C:VARGET(key) return self.db.var[key] end
function C:VARSET(key,value) SpecialTotemBarConfig[key] = value end


local C, F, L = unpack(ns)
if not F:IsLoaded() then return end

local function UpdateMulti()
    local _, height = GetPhysicalScreenSize()
    local fixedHeight = 768 / height
    local scale = UIParent:GetScale()
    return fixedHeight / scale
end

function F:CreateText(font, fontSize, justifyh)
    if self.Text then return end
    self.Text = self:CreateFontString(nil, "OVERLAY")
    self.Text:SetFont(font, fontSize, "OUTLINE")
    if not justifyh then justifyh = "CENTER" end
    self.Text:SetJustifyH(justifyh)
    -- Debug("CreateButton", "CreateText", "SetPoint", self:GetWidth() / 100, self:GetHeight() / 100, justifyh)
    self.Text:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT",
                       -self:GetWidth() / 100, self:GetHeight() / 100)
    -- Debug("CreateButton", "CreateText")
end

function F:CreateIcon(multi)
    if self.Icon then return end
    if not multi then multi = UpdateMulti() end
    self.Icon = self:CreateTexture(nil, "ARTWORK")

    self.Icon:SetPoint("TOPLEFT", multi, -multi)
    self.Icon:SetPoint("BOTTOMRIGHT", -multi, multi)

    self.Icon:SetTexCoord(.08, .92, .08, .92)

end

function F:CreateCooldown()
    if self.CD then return end
    self.CD = CreateFrame("Cooldown", nil, self, "CooldownFrameTemplate")
    self.CD:SetAllPoints()
    self.CD:SetReverse(true)
end

function F:GetActiveSpellName(spell, deep)
    if not spell then return "" end
    if deep == nil then deep = true end
    if tonumber(spell) then spell = GetSpellInfo(tonumber(spell)) end
    local lastspell = spell
    if deep then
        spell = GetSpellInfo(spell)
        if not spell then spell = lastspell end
    end
    return spell
end

function F:GetActiveSpellTexture(spell)
    return GetSpellTexture(F:GetActiveSpellName(spell))
end

local actionButtonPool = {}
function F:GetActionButtonFrame(name, parent) 
    if actionButtonPool[name] then
        actionButtonPool[name]:ClearAllPoints()
        actionButtonPool[name]:SetParent(parent)
        return actionButtonPool[name]
    end
    local button = CreateFrame("Button", name, parent, "SecureActionButtonTemplate")
    button:RegisterForClicks("AnyUp")
    button:SetHighlightTexture([[Interface\Buttons\ButtonHilight-Square]],"ADD")
    button:SetPushedTexture([[Interface\Buttons\UI-Quickslot-Depress]])
    
    actionButtonPool[name] = button
    return button
end
function F:TotemButtonAcquire(frame,slot)
    local totem = F:GetActionButtonFrame(addonName.."Totem"..slot,frame)
    totem.slot = slot
    local macrotext = "/click TotemFrameTotem" .. totem.slot .. " RightButton"
    if frame.isPet then
        macrotext = "/petdismiss"
    end
    totem:SetAttribute("type2","macro")
    totem:SetAttribute("macrotext2",macrotext)

    totem:ClearAllPoints()
    totem:SetAllPoints()
    totem:Show()

    return totem
end

function F:ActionButtonAcquire(index,parent,spell,isPet)
    isPet = not not isPet
    local frame = F:GetActionButtonFrame(addonName.."ActionButton"..index,parent)
    frame.isPet = isPet
    frame:SetAttribute("type1","spell")
    frame:SetAttribute("spell1",spell)
    local size = C.config.iconSize
    frame:SetSize(size,size)


    if isPet then
        local totem = F:TotemButtonAcquire(frame,index)
        totem:SetSize(size,size)
        totem:Hide()
        frame.totem = totem
    end

    return frame
end
function F:ActionButtonRelease(frame)
    frame:Hide()
    frame:ClearAllPoints()
end
function F:ActionButtonRelaseAll()
    for k,v in pairs(actionButtonPool) do 
        F:ActionButtonRelease(v)
    end
end

function F.GetSpellCooldown(spell)
    local start, dur, enable = GetSpellCooldown(spell)
    local charges, maxCharges, startCharges, durCharges = GetSpellCharges(spell);

    local stack = charges or GetSpellCount(spell)

    
    local gcd = math.max((1.5 / (1 + (UnitSpellHaste("player") / 100))), 0.75)

    start = start or 0
    dur = dur or 0

    startCharges = startCharges or 0
    durCharges = durCharges or 0

    if enable == 0 then start, dur = 0, 0 end

    local startTime, duration = start, dur

    if charges == maxCharges then
        start, dur = 0, 0
        startCharges, durCharges = 0, 0
    elseif charges > 0 then
        startTime, duration = startCharges, durCharges
    end

    if gcd == duration then startTime, duration = 0, 0 end

    return stack, maxCharges, startTime, duration
end

function F:UpdateCooldown(frame)
    if not frame then return end 
    if not frame.spell then return end
    local stack,maxStack,start,duration = F.GetSpellCooldown(frame.spell)
    if frame.Text then
        if stack and stack > 0 then
            if maxStack > 1 then
                frame.Text:SetText(stack)
            else
                frame.Text:SetText("")
            end
        else
            frame.Text:SetText("")
        end
    end
    if frame.CD then
        local gcdstart, gcdduration = GetSpellCooldown(61304)
        if gcdstart>0 and gcdduration>0 then
        else
            frame.CD:SetCooldown(start,duration)
        end
    end
    return true
end




local addon, ns = ...
local C, F, L = unpack(ns)
if not F:IsLoaded() then return end

local CreateFrame,GetTotemInfo,UnitExists,InCombatLockdown = CreateFrame,GetTotemInfo,UnitExists,InCombatLockdown
local MAX_TOTEMS = MAX_TOTEMS 

local HiddenFrame = CreateFrame("Frame")
HiddenFrame:Hide()
local mainFrame = CreateFrame("Frame","SpecialTotemMainBar",UIParent)
local function CreateButton(index)
    local spell = F:GetActiveSpellName(C:GetWatchSpell(index))
    local frame = F:ActionButtonAcquire(index,mainFrame,spell,C:IsPet(index))
    frame.spell = spell
    F.CreateCooldown(frame)
    F.CreateIcon(frame)
    F.CreateText(frame,C.config.font,C.config.fontSize,"RIGHT")
    
    F:UpdateCooldown(frame)

    frame.Icon:SetTexture(F:GetActiveSpellTexture(spell))
    frame:SetAlpha(C.config.CDAlpha)
    return frame
end

local frames = {}
ns.frames = frames
local function CreateButtons()
    for i=1 , #frames do 
        F:ActionButtonRelease(frames[i])
        frames[i] = nil
    end
    
    local watchSpell = C:GetWatchSpells()
    for i = 1, #watchSpell do 
        local frame = CreateButton(i)
        F:TotemButtonAcquire(HiddenFrame,i)
        if frame then
            if i == 1 then
                frame:SetPoint("LEFT",mainFrame,C.config.spacing/2,0)
            else
                frame:SetPoint("LEFT",frames[i-1],"RIGHT",C.config.spacing,0)
            end
            
            F:FireCallback(frames,"CUSTOM_CREATEBUTTON_SETPOINT",frame,i)
            frame:Show()
            frames[i] = frame
        end
    end
end


local state = {}
local function CreateTotem(frame,slot)
    if frame.isPet then slot = 20 - slot end
    return F:TotemButtonAcquire(frame,slot)
end

local function UpdateTotemTable()
    local s = state
    for i =1,MAX_TOTEMS do 
        local haveToten,name,start,duration,icon = GetTotemInfo(i)
        local frameTotem = _G["TotemFrameTotem" .. i]
        if not s[i] then
            s[i] = {index = i, slot = frameTotem.slot, show = haveToten, name = name, lastname = "", start = start, dur = duration, icon = icon, btnFunc = CreateTotem}
        else
            s[i].show = haveToten
            s[i].lastname = s[i].name ~= "" and s[i].name or s[i].lastname
            s[i].slot = frameTotem.slot
            s[i].name = name
            s[i].start = start
            s[i].dur = duration
            s[i].icon = icon
        end

    end
end

local function UpdateTotem(_,_,slot)
    UpdateTotemTable()
    for k,v in pairs(state) do 
        if v.lastname ~= "" or v.name ~= "" then 
            for i,frame in pairs(frames) do 
                if frame.isPet == false then 
                    if v.dur > 0 then 
                        if v.name ~= "" and (v.name:find(frame.spell) or frame.spell:find(v.name)) then 
                            local totem = v.btnFunc(frame,v.slot)
                            frame.totem = totem
                            F:FireCallback(frame,"CUSTOM_SPELL_DURATION_START",v.start,v.dur)
                            break
                        end
                    else
                        if frame.totem and v.lastname ~="" and (v.lastname:find(frame.spell) or frame.spell:find(v.lastname)) then
                            frame.totem:Hide()
                            frame.totem = nil
                            F:FireCallback(frame,"CUSTOM_SPELL_DURATION_END")
                            frame:SetAlpha(C.config.CDAlpha)
                            if C.config.showSpellCD then
                                frame.CD:SetCooldown(0,0)
                                frame.aura = false
                                F:UpdateCooldown(frame)
                            else
                                frame.CD:Hide()
                            end

                        end

                    end

                end
            end

        end
    end

end
local function UpdatePet(self,event,unit)
    local start = GetTime()
    if unit == "player" then
        if UnitExists("pet") then
            local name = UnitName("pet")
            if not name then return end
            for i,frame in pairs(frames) do
                if frame.isPet then
                    if frame.spell ~= "" and name ~="" and (frame.spell:find(name) or name:find(frame.spell)) then
                        local startTime,duration = frame.CD:GetCooldownTimes()
                        startTime = (startTime or 0) / 1000
                        duration = (duration or 0) / 1000
                        
                        if frame.aura then
                            frame.totem:Show()
                            C_Timer.After(0.1,function()
                                    F:FireCallback(frame,"CUSTOM_SPELL_DURATION_END_PET")
                            end)
                        end
                        if duration == 0 and startTime == 0 then
                            local dur = C:GetPetDuration(frame.spell) or 0
                            if dur > 0 then
                                F:FireCallback(frame,"CUSTOM_SPELL_DURATION_START",start,dur)
                            end
                        end
                    end
                end
            end
        end
    end
end
local function UpdateCooldown()
    for i,v in pairs(frames) do 
        if not InCombatLockdown() then
            if v.aura and v.totem then
                v.totem:Show()
            end
        end
        if v.aura == false then
            F:UpdateCooldown(v)
        end

    end

end
F:RegisterCallback("CUSTOM_SPELL_DURATION_START",function(self,event,start,dur)
    self.Text:SetText("")
    self.CD:SetCooldown(start,dur)
    self.aura = true
    self.CD:Show()
    self:SetAlpha(C.config.AuraAlpha)
end)
F:RegisterCallback("CUSTOM_SPELL_DURATION_END",function(self,event)
        self:SetAlpha(C.config.CDAlpha)
        self.CD:SetCooldown(0,0)
        self.aura = false
        F:UpdateCooldown(self)
        if self.totem then self.totem:Hide() end
        if not C.config.showSpellCD then
            self.CD:Hide()
        end
end)
F:RegisterCallback("CUSTOM_SPELL_DURATION_END_PET",function(self,event)
    if not UnitExists("pet") then
        self.aura = false
        self:SetAlpha(C.config.CDAlpha)
        self.CD:SetCooldown(0,0)
        F:UpdateCooldown(self)
        self.totem:Hide()
    end
end)

local function UpdateMainFramePos(self)
    self:ClearAllPoints()
    local pos = C:VARGET("pos")
    self:SetPoint(unpack(pos))
end


local function init(self)
    self.mainFrame = mainFrame

    C:UpdateTalent()
    CreateButtons()
    local watchSpell = C:GetWatchSpells()
    mainFrame:SetSize((C.config.iconSize + C.config.spacing )* #watchSpell ,C.config.iconSize)
    F:FireCallback(mainFrame,"CUSTOM_MAINFRAME_CREATE")
    F:FireCallback(mainFrame,"CUSTOM_MAINFRAME_SIZE_UPDATE",mainFrame:GetSize())
    
    UpdateMainFramePos(mainFrame)

    F:RegisterCallback("PLAYER_TOTEM_UPDATE",UpdateTotem)
    F:RegisterCallback("UNIT_PET",UpdatePet)
    F:RegisterCallback("PLAYER_TALENT_UPDATE",function() 
        C:UpdateTalent()
        CreateButtons()
        local watchSpell = C:GetWatchSpells()
        mainFrame:SetSize((C.config.iconSize + C.config.spacing )* #watchSpell ,C.config.iconSize)
        F:FireCallback(mainFrame,"CUSTOM_MAINFRAME_SIZE_UPDATE",mainFrame:GetSize())
    end)

    F:RegisterCallback("CUSTOM_COOLDOWN_UPDATE",UpdateCooldown)
    mainFrame:SetScript("OnUpdate",function(self,elapsed)
        self.elapsed = (self.elapsed or 0) + elapsed
        if self.elapsed > .5 then
            F:FireCallback(self,"CUSTOM_COOLDOWN_UPDATE")
            self.elapsed = 0
        end
    end)
end

F:RegisterCallback("CUSTOM_ADDON_LOAD",init)
F:RegisterCallback("CUSTOM_ADDON_POSTLOAD",function(self,event)
    C:UpdateTalent()
    for i =1 , MAX_TOTEMS do 
        UpdateTotem(self,event,i)
    end
    UpdateMainFramePos(mainFrame)

end)

local C, F, L = unpack(ns)
if not F:IsLoaded() then return end

local CreateFrame,InCombatLockdown = CreateFrame,InCombatLockdown


local function init(self)
    local f = self.mover
    if not f then
        local f = CreateFrame("Frame",addonName.."MainFrameMover",self)
        f:SetMovable(true)
        self:SetMovable(true)
        self:SetUserPlaced(true)
        self:SetClampedToScreen(true)

        f:SetAllPoints()
        f:EnableMouse(true)
        f:RegisterForDrag("LeftButton")
        f:SetScript("OnDragStart", function(_) self:StartMoving() end)
        f:SetScript("OnDragStop", function(_)
            self:StopMovingOrSizing()
            local orig, _, tar, x, y = self:GetPoint()
            C:VARSET("pos",{orig,"UIParent",tar,x,y})
        end)
        f:SetFrameStrata("DIALOG")
        f:Hide()
        
        local texture = f:CreateTexture('ARTWORK')
        texture:SetColorTexture(1, 1, 1)
        texture:SetAlpha(0.5)
        texture:SetAllPoints()
        
        self.mover = f
    end
    mover = self.mover

    F.registerCMD("SPECIALTOTEMBARMOVER",{"specialtotembar","stb"},function()
        if InCombatLockdown() then
            UIErrorsFrame:AddMessage("请在战斗外调整位置")
            return
        end
        if mover:IsShown() then
            F:FireCallback(mover,"CUSTOM_MOVER_HIDE")
        else
            F:FireCallback(mover,"CUSTOM_MOVER_SHOW")
        end
        return true
    end)


end

F:RegisterCallback("CUSTOM_MOVER_SHOW",function(self)
    self:Show()
    self:EnableMouse(true)
end)
F:RegisterCallback("CUSTOM_MOVER_Hide",function(self)
    self:Hide()
    self:EnableMouse(false)
end)
F:RegisterCallback("CUSTOM_MAINFRAME_CREATE",init)

F:RegisterCallback("CUSTOM_MAINFRAME_SIZE_UPDATE",function(self,_,width,height)
    self.mover:SetSize(width,height)
end)

