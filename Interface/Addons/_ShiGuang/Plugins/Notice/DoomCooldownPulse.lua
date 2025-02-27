--## Author: Woffle of Dark Iron[US]
local fadeInTime, fadeOutTime, maxAlpha, animScale, iconSize, holdTime, showSpellName, ignoredSpells, invertIgnored, remainingCooldownWhenNotified
local cooldowns, animating, watching, itemSpells = { }, { }, { }, { }
local GetTime = GetTime

local defaultSettings = {
    fadeInTime = 0.3,
    fadeOutTime = 0.6,
    maxAlpha = 0.85,
    animScale = 1.5,
    iconSize = 80,
    holdTime = 0,
    petOverlay = {1,1,1},
    showSpellName = nil,
    x = UIParent:GetWidth()*UIParent:GetEffectiveScale()/2,
    y = UIParent:GetHeight()*UIParent:GetEffectiveScale()/3,
    remainingCooldownWhenNotified = 0
}

local defaultSettingsPerCharacter = {
    ignoredSpells = "",
    invertIgnored = false
}

local DCP = CreateFrame("frame")
DCP:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
DCP:SetMovable(true)
DCP:RegisterForDrag("LeftButton")
DCP:SetScript("OnDragStart", function(self) self:StartMoving() end)
DCP:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    DCP_Saved.x = self:GetLeft()+self:GetWidth()/2
    DCP_Saved.y = self:GetBottom()+self:GetHeight()/2
    self:ClearAllPoints()
    self:SetPoint("CENTER",UIParent,"BOTTOMLEFT",DCP_Saved.x,DCP_Saved.y)
end)
DCP.TextFrame = DCP:CreateFontString(nil, "ARTWORK")
DCP.TextFrame:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
DCP.TextFrame:SetShadowOffset(2,-2)
DCP.TextFrame:SetPoint("CENTER",DCP,"CENTER")
DCP.TextFrame:SetWidth(210)
DCP.TextFrame:SetJustifyH("CENTER")
DCP.TextFrame:SetTextColor(1,1,1)

local DCPT = DCP:CreateTexture(nil,"BACKGROUND")
DCPT:SetAllPoints(DCP)

-----------------------
-- Utility Functions --
-----------------------
local function tcount(tab)
    local n = 0
    for _ in pairs(tab) do
        n = n + 1
    end
    return n
end

local function memoize(f)
    local cache = nil

    local memoized = {}

    local function get()
        if (cache == nil) then
            cache = f()
        end

        return cache
    end

    memoized.resetCache = function()
        cache = nil
    end

    setmetatable(memoized, {__call = get})

    return memoized
end

local function GetPetActionIndexByName(name)
    for i=1, NUM_PET_ACTION_SLOTS, 1 do
        if (GetPetActionInfo(i) == name) then
            return i
        end
    end
    return nil
end

local function RefreshLocals()
    fadeInTime = DCP_Saved.fadeInTime
    fadeOutTime = DCP_Saved.fadeOutTime
    maxAlpha = DCP_Saved.maxAlpha
    animScale = DCP_Saved.animScale
    iconSize = DCP_Saved.iconSize
    holdTime = DCP_Saved.holdTime
    showSpellName = DCP_Saved.showSpellName
    invertIgnored = DCP_SavedPerCharacter.invertIgnored
    remainingCooldownWhenNotified = DCP_Saved.remainingCooldownWhenNotified

    ignoredSpells = { }
    for _,v in ipairs({strsplit(",",DCP_SavedPerCharacter.ignoredSpells)}) do
        ignoredSpells[strtrim(v)] = true
    end
end

local function MergeTable(destination, source)
    for i, v in pairs(source) do
        if (destination[i] == nil) then
            destination[i] = v
        end
    end
end

local function InitializeSavedVariables()
    if (DCP_Saved == nil) then
        DCP_Saved = {}
    end

    if (DCP_SavedPerCharacter == nil) then
        DCP_SavedPerCharacter = {}
    end

    MergeTable(DCP_Saved, defaultSettings)
    MergeTable(DCP_SavedPerCharacter, defaultSettingsPerCharacter)
end

local function TrackItemSpell(itemID)
    local _, spellID = GetItemSpell(itemID)
    if (spellID) then
        itemSpells[spellID] = itemID
        return true
    else
        return false
    end
end

local function IsAnimatingCooldownByName(name)
    for i, details in pairs(animating) do
        if details[3] == name then
            return true
        end
    end

    return false
end

--------------------------
-- Cooldown / Animation --
--------------------------
local elapsed = 0
local runtimer = 0
local function OnUpdate(_,update)
    elapsed = elapsed + update
    if (elapsed > 0.05) then
        for id, v in pairs(watching) do
            if (GetTime() >= v[1] + 0.5) then
                local getCooldownDetails
                if (v[2] == "spell") then
                    getCooldownDetails = memoize(function()
                        local cooldown = C_Spell.GetSpellCooldown(v[3])
                        return {
                            name = C_Spell.GetSpellName(v[3]),
                            texture = C_Spell.GetSpellTexture(v[3]),
                            start = cooldown.startTime,
                            duration = cooldown.duration,
                            enabled = cooldown.isEnabled
                        }
                    end)
                elseif (v[2] == "item") then
                    getCooldownDetails = memoize(function()
                        local start, duration, enabled = C_Container.GetItemCooldown(id)
                        return {
                            name = GetItemInfo(id),
                            texture = v[3],
                            start = start,
                            duration = duration,
                            enabled = enabled
                        }
                    end)
                elseif (v[2] == "pet") then
                    getCooldownDetails = memoize(function()
                        local name, texture = GetPetActionInfo(v[3])
                        local start, duration, enabled = GetPetActionCooldown(v[3])
                        return {
                            name = name,
                            texture = texture,
                            isPet = true,
                            start = start,
                            duration = duration,
                            enabled = enabled
                        }
                    end)
                end

                local cooldown = getCooldownDetails()
                if ((ignoredSpells[cooldown.name] ~= nil or ignoredSpells[tostring(id)] ~= nil) ~= invertIgnored) then
                    watching[id] = nil
                else
                    if (cooldown.enabled ~= 0) then
                        if (cooldown.duration and cooldown.duration > 2.0 and cooldown.texture) then
                            cooldowns[id] = getCooldownDetails
                        end
                    end
                    if (not (cooldown.enabled == 0 and v[2] == "spell")) then
                        watching[id] = nil
                    end
                end
            end
        end
        for i,getCooldownDetails in pairs(cooldowns) do
            local cooldown = getCooldownDetails()
            if cooldown.start then
                local remaining = cooldown.duration-(GetTime()-cooldown.start)
                if (remaining <= remainingCooldownWhenNotified) then
                    if not IsAnimatingCooldownByName(cooldown.name) then
                        tinsert(animating, {cooldown.texture,cooldown.isPet,cooldown.name})
                    end
                    cooldowns[i] = nil
                end
            else
                cooldowns[i] = nil
            end
        end

        elapsed = 0
        if (#animating == 0 and tcount(watching) == 0 and tcount(cooldowns) == 0) then
            DCP:SetScript("OnUpdate", nil)
            return
        end
    end

    if (#animating > 0) then
        runtimer = runtimer + update
        if (runtimer > (fadeInTime + holdTime + fadeOutTime)) then
            tremove(animating,1)
            runtimer = 0
            DCP.TextFrame:SetText(nil)
            DCPT:SetTexture(nil)
            DCPT:SetVertexColor(1,1,1)
        else
            if (not DCPT:GetTexture()) then
                if (animating[1][3] ~= nil and showSpellName) then
                    DCP.TextFrame:SetText(animating[1][3])
                end
                DCPT:SetTexture(animating[1][1])
                if animating[1][2] then
                    DCPT:SetVertexColor(unpack(DCP_Saved.petOverlay))
                end
            end
            local alpha = maxAlpha
            if (runtimer < fadeInTime) then
                alpha = maxAlpha * (runtimer / fadeInTime)
            elseif (runtimer >= fadeInTime + holdTime) then
                alpha = maxAlpha - ( maxAlpha * ((runtimer - holdTime - fadeInTime) / fadeOutTime))
            end
            DCP:SetAlpha(alpha)
            local scale = iconSize+(iconSize*((animScale-1)*(runtimer/(fadeInTime+holdTime+fadeOutTime))))
            DCP:SetWidth(scale)
            DCP:SetHeight(scale)
        end
    end
end

--------------------
-- Event Handlers --
--------------------
function DCP:ADDON_LOADED()
    InitializeSavedVariables()
    RefreshLocals()
    self:SetPoint("CENTER",UIParent,"BOTTOMLEFT",DCP_Saved.x,DCP_Saved.y)
    self:UnregisterEvent("ADDON_LOADED")
end
DCP:RegisterEvent("ADDON_LOADED")

function DCP:SPELL_UPDATE_COOLDOWN()
    for i,getCooldownDetails in pairs(cooldowns) do
        getCooldownDetails.resetCache()
    end
end
DCP:RegisterEvent("SPELL_UPDATE_COOLDOWN")

function DCP:UNIT_SPELLCAST_SUCCEEDED(unit,lineID,spellID)
    if (unit == "player") then
        local itemID = itemSpells[spellID]
        if (itemID) then
            local texture = select(10, GetItemInfo(itemID))
            watching[itemID] = {GetTime(),"item",texture}
            itemSpells[spellID] = nil
        else
            watching[spellID] = {GetTime(),"spell",spellID}
        end

        if (not self:IsMouseEnabled()) then
            self:SetScript("OnUpdate", OnUpdate)
        end
    end
end
DCP:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")

function DCP:COMBAT_LOG_EVENT_UNFILTERED()
    local _,event,_,_,_,sourceFlags,_,_,_,_,_,spellID = CombatLogGetCurrentEventInfo()
    if (event == "SPELL_CAST_SUCCESS") then
        if (bit.band(sourceFlags,COMBATLOG_OBJECT_TYPE_PET) == COMBATLOG_OBJECT_TYPE_PET and bit.band(sourceFlags,COMBATLOG_OBJECT_AFFILIATION_MINE) == COMBATLOG_OBJECT_AFFILIATION_MINE) then
            local name = C_Spell.GetSpellName(spellID)
            local index = GetPetActionIndexByName(name)
            if (index and not select(6,GetPetActionInfo(index))) then
                watching[spellID] = {GetTime(),"pet",index}
            elseif (not index and spellID) then
                watching[spellID] = {GetTime(),"spell",spellID}
            else
                return
            end
            if (not self:IsMouseEnabled()) then
                self:SetScript("OnUpdate", OnUpdate)
            end
        end
    end
end
DCP:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")

function DCP:PLAYER_ENTERING_WORLD()
    local inInstance,instanceType = IsInInstance()
    if (inInstance and instanceType == "arena") then
        self:SetScript("OnUpdate", nil)
        wipe(cooldowns)
        wipe(watching)
    end
end
DCP:RegisterEvent("PLAYER_ENTERING_WORLD")

function DCP:PLAYER_SPECIALIZATION_CHANGED(unit)
    if (unit == "player") then
        wipe(cooldowns)
        wipe(watching)
    end
end
if WOW_PROJECT_ID == WOW_PROJECT_MAINLINE then
    DCP:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
end

hooksecurefunc("UseAction", function(slot)
    local actionType,itemID = GetActionInfo(slot)
    if (actionType == "item" and not TrackItemSpell(itemID)) then
        local texture = GetActionTexture(slot)
        watching[itemID] = {GetTime(),"item",texture}
    end
end)

hooksecurefunc("UseInventoryItem", function(slot)
    local itemID = GetInventoryItemID("player", slot);
    if (itemID and not TrackItemSpell(itemID)) then
        local texture = GetInventoryItemTexture("player", slot)
        watching[itemID] = {GetTime(),"item",texture}
    end
end)

hooksecurefunc(C_Container, "UseContainerItem", function(bag,slot)
    local itemID = C_Container.GetContainerItemID(bag, slot)
    if (itemID and not TrackItemSpell(itemID)) then
        local texture = select(10, GetItemInfo(itemID))
        watching[itemID] = {GetTime(),"item",texture}
    end
end)

-------------------
-- Options Frame --
-------------------

SlashCmdList["DOOMCOOLDOWNPULSE"] = function() if (not DCP_OptionsFrame) then DCP:CreateOptionsFrame() end DCP_OptionsFrame:Show() end
SLASH_DOOMCOOLDOWNPULSE1 = "/dcp"
SLASH_DOOMCOOLDOWNPULSE2 = "/cooldownpulse"
SLASH_DOOMCOOLDOWNPULSE3 = "/doomcooldownpulse"

function DCP:CreateOptionsFrame()
    local sliders = {
        { text = "图标大小", value = "iconSize", min = 30, max = 125, step = 5 },
        { text = "淡入时间", value = "fadeInTime", min = 0, max = 1.5, step = 0.1 },
        { text = "淡出时间", value = "fadeOutTime", min = 0, max = 1.5, step = 0.1 },
        { text = "最大透明度", value = "maxAlpha", min = 0, max = 1, step = 0.1 },
        { text = "最大透明度持续时间", value = "holdTime", min = 0, max = 1.5, step = 0.1 },
        { text = "动画缩放", value = "animScale", min = 0, max = 2, step = 0.1 },
        { text = "可用时间之前显示", value = "remainingCooldownWhenNotified", min = 0, max = 3, step = 0.1 },
    }

    local buttons = {
        { text = "关闭", func = function(self) self:GetParent():Hide() end },
        { text = "测试", func = function(self)
            DCP_OptionsFrameButton3:SetText("解锁")
            DCP:EnableMouse(false)
            RefreshLocals()
            tinsert(animating,{"Interface\\Icons\\Spell_Nature_Earthbind",nil,"Spell Name"})
            DCP:SetScript("OnUpdate", OnUpdate)
            end },
        { text = "解锁", func = function(self)
            if (self:GetText() == "解锁") then
                RefreshLocals()
                DCP:SetWidth(iconSize)
                DCP:SetHeight(iconSize)
                self:SetText("锁定")
                DCP:SetScript("OnUpdate", nil)
                DCP:SetAlpha(1)
                DCPT:SetTexture("Interface\\Icons\\Spell_Nature_Earthbind")
                DCP:EnableMouse(true)
            else
                DCP:SetAlpha(0)
                self:SetText("锁定")
                DCP:EnableMouse(false)
            end end },
        { text = "默认", func = function(self)
            for i,v in pairs(defaultSettings) do
                DCP_Saved[i] = v
            end
            for i,v in pairs(defaultSettingsPerCharacter) do
                DCP_SavedPerCharacter[i] = v
            end
            for i,v in pairs(sliders) do
                getglobal("DCP_OptionsFrameSlider"..i):SetValue(DCP_Saved[v.value])
            end
            DCP_OptionsFramePetColorBox:GetNormalTexture():SetVertexColor(unpack(DCP_Saved.petOverlay))
            DCP_OptionsFrameIgnoreTypeButtonWhitelist:SetChecked(false)
            DCP_OptionsFrameIgnoreTypeButtonBlacklist:SetChecked(true)
            DCP_OptionsFrameIgnoreBox:SetText("")
            DCP:ClearAllPoints()
            DCP:SetPoint("CENTER",UIParent,"BOTTOMLEFT",DCP_Saved.x,DCP_Saved.y)
            end },
    }

    local optionsframe = CreateFrame("frame","DCP_OptionsFrame",UIParent,BackdropTemplateMixin and "BackdropTemplate")
    optionsframe:SetBackdrop({
      bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
      edgeFile="Interface\\DialogFrame\\UI-DialogBox-Border",
      tile=1, tileSize=32, edgeSize=32,
      insets={left=11, right=12, top=12, bottom=11}
    })
    optionsframe:SetWidth(230)
    optionsframe:SetHeight(610)
    optionsframe:SetPoint("CENTER",UIParent)
    optionsframe:EnableMouse(true)
    optionsframe:SetMovable(true)
    optionsframe:RegisterForDrag("LeftButton")
    optionsframe:SetScript("OnDragStart", function(self) self:StartMoving() end)
    optionsframe:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    optionsframe:SetFrameStrata("FULLSCREEN_DIALOG")
    optionsframe:SetScript("OnHide", function() RefreshLocals() end)
    tinsert(UISpecialFrames, "DCP_OptionsFrame")

    local header = optionsframe:CreateTexture(nil,"ARTWORK")
    header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header.blp")
    header:SetWidth(350)
    header:SetHeight(68)
    header:SetPoint("TOP",optionsframe,"TOP",0,12)

    local headertext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormal")
    headertext:SetPoint("TOP",header,"TOP",0,-14)
    headertext:SetText("Doom_CooldownPulse")

    for i,v in pairs(sliders) do
        local slider = CreateFrame("slider", "DCP_OptionsFrameSlider"..i, optionsframe, "OptionsSliderTemplate")
        if (i == 1) then
            slider:SetPoint("TOP",optionsframe,"TOP",0,-50)
        else
            slider:SetPoint("TOP",getglobal("DCP_OptionsFrameSlider"..(i-1)),"BOTTOM",0,-35)
        end
        local valuetext = slider:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
        valuetext:SetPoint("TOP",slider,"BOTTOM",0,-1)
        valuetext:SetText(format("%.1f",DCP_Saved[v.value]))
        getglobal("DCP_OptionsFrameSlider"..i.."Text"):SetText(v.text)
        getglobal("DCP_OptionsFrameSlider"..i.."Low"):SetText(v.min)
        getglobal("DCP_OptionsFrameSlider"..i.."High"):SetText(v.max)
        slider:SetMinMaxValues(v.min,v.max)
        slider:SetValueStep(v.step)
        slider:SetObeyStepOnDrag(true)
        slider:SetValue(DCP_Saved[v.value])
        slider:SetScript("OnValueChanged",function()
            local value = slider:GetValue()
            DCP_Saved[v.value] = value
            RefreshLocals()
            valuetext:SetText(format("%.1f", value))
            if (DCP:IsMouseEnabled()) then
                DCP:SetWidth(DCP_Saved.iconSize)
                DCP:SetHeight(DCP_Saved.iconSize)
            end
        end)
    end

    local pettext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    pettext:SetPoint("TOPLEFT","DCP_OptionsFrameSlider"..#sliders,"BOTTOMLEFT",-15,-30)
    pettext:SetText("宠物颜色覆盖：")

    local petcolorselect = CreateFrame('Button',"DCP_OptionsFramePetColorBox",optionsframe)
    petcolorselect:SetPoint("LEFT",pettext,"RIGHT",10,0)
    petcolorselect:SetWidth(20)
    petcolorselect:SetHeight(20)
    petcolorselect:SetNormalTexture('Interface/ChatFrame/ChatFrameColorSwatch')
    petcolorselect:GetNormalTexture():SetVertexColor(unpack(DCP_Saved.petOverlay))
    petcolorselect:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:SetText("注意：如果你不希望宠物技能冷却有任何覆盖效果，请选择白色。") end)
    petcolorselect:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
    petcolorselect:SetScript('OnClick', function(self)
        local r, g, b = unpack(DCP_Saved.petOverlay)
        ColorPickerFrame:SetupColorPickerAndShow({
            swatchFunc = function(self) DCP_Saved.petOverlay={ColorPickerFrame:GetColorRGB()} petcolorselect:GetNormalTexture():SetVertexColor(ColorPickerFrame:GetColorRGB()) end,
            cancelFunc = function(self) DCP_Saved.petOverlay={r,g,b} petcolorselect:GetNormalTexture():SetVertexColor(unpack(DCP_Saved.petOverlay)) end,
            hasOpacity = false,
            r = r,
            g = g,
            b = b
        })
        ColorPickerFrame:SetPoint("TOPLEFT",optionsframe,"TOPRIGHT")
    end)

    local petcolorselectbg = petcolorselect:CreateTexture(nil, 'BACKGROUND')
    petcolorselectbg:SetWidth(17)
    petcolorselectbg:SetHeight(17)
    petcolorselectbg:SetTexture(1,1,1)
    petcolorselectbg:SetPoint('CENTER')

    local spellnametext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    spellnametext:SetPoint("TOPLEFT",pettext,"BOTTOMLEFT",0,-18)
    spellnametext:SetText("显示技能名称：")

    local spellnamecbt = CreateFrame("CheckButton","DCP_OptionsFrameSpellNameCheckButton",optionsframe,"UICheckButtonTemplate")
    spellnamecbt:SetPoint("LEFT",spellnametext,"RIGHT",6,0)
    spellnamecbt:SetChecked(DCP_Saved.showSpellName)
    spellnamecbt:SetScript("OnClick", function(self)
        local newState = self:GetChecked()
        self:SetChecked(newState)
        DCP_Saved.showSpellName = newState
        RefreshLocals()
    end)

    local ignoretext = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    ignoretext:SetPoint("TOPLEFT",spellnametext,"BOTTOMLEFT",0,-18)
    ignoretext:SetText("技能过滤器：")

    local ignoretypebuttonblacklist = CreateFrame("Checkbutton","DCP_OptionsFrameIgnoreTypeButtonBlacklist",optionsframe,"UIRadioButtonTemplate")
    ignoretypebuttonblacklist:SetPoint("TOPLEFT",ignoretext,"BOTTOMLEFT",0,-4)
    ignoretypebuttonblacklist:SetChecked(not DCP_SavedPerCharacter.invertIgnored)
    ignoretypebuttonblacklist:SetScript("OnClick", function()
        DCP_OptionsFrameIgnoreTypeButtonWhitelist:SetChecked(false)
        DCP_SavedPerCharacter.invertIgnored = false
        RefreshLocals()
    end)

    local ignoretypetextblacklist = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    ignoretypetextblacklist:SetPoint("LEFT",ignoretypebuttonblacklist,"RIGHT",4,0)
    ignoretypetextblacklist:SetText("黑名单")

    local ignoretypebuttonwhitelist = CreateFrame("Checkbutton","DCP_OptionsFrameIgnoreTypeButtonWhitelist",optionsframe,"UIRadioButtonTemplate")
    ignoretypebuttonwhitelist:SetPoint("LEFT",ignoretypetextblacklist,"RIGHT",10,0)
    ignoretypebuttonwhitelist:SetChecked(DCP_SavedPerCharacter.invertIgnored)
    ignoretypebuttonwhitelist:SetScript("OnClick", function()
        DCP_OptionsFrameIgnoreTypeButtonBlacklist:SetChecked(false)
        DCP_SavedPerCharacter.invertIgnored = true
        RefreshLocals()
    end)

    local ignoretypetextwhitelist = optionsframe:CreateFontString(nil,"ARTWORK","GameFontNormalSmall")
    ignoretypetextwhitelist:SetPoint("LEFT",ignoretypebuttonwhitelist,"RIGHT",4,0)
    ignoretypetextwhitelist:SetText("白名单")

    local ignorebox = CreateFrame("EditBox","DCP_OptionsFrameIgnoreBox",optionsframe,"InputBoxTemplate")
    ignorebox:SetAutoFocus(false)
    ignorebox:SetPoint("TOPLEFT",ignoretypebuttonblacklist,"BOTTOMLEFT",4,2)
    ignorebox:SetWidth(170)
    ignorebox:SetHeight(32)
    ignorebox:SetText(DCP_SavedPerCharacter.ignoredSpells)
    ignorebox:SetScript("OnEnter",function(self) GameTooltip:SetOwner(self, "ANCHOR_CURSOR") GameTooltip:SetText("注意：多个法术（技能）之间用逗号隔开。") end)
    ignorebox:SetScript("OnLeave",function(self) GameTooltip:Hide() end)
    ignorebox:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)
    ignorebox:SetScript("OnEditFocusLost",function(self)
        DCP_SavedPerCharacter.ignoredSpells = ignorebox:GetText()
        RefreshLocals()
    end)

    for i,v in pairs(buttons) do
        local button = CreateFrame("Button", "DCP_OptionsFrameButton"..i, optionsframe, "UIPanelButtonTemplate")
        button:SetHeight(24)
        button:SetWidth(75)
        button:SetPoint("BOTTOM", optionsframe, "BOTTOM", ((i%2==0 and -1) or 1)*45, 10 + ceil(i/2)*15 + (ceil(i/2)-1)*15)
        button:SetText(v.text)
        button:SetScript("OnClick", function(self) PlaySound(852) v.func(self) end)
    end
end
