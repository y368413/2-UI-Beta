local _,ffh = ...
_familyfamiliarhelper = ffh -- in case anything outside this addon needs to reference something

-- key binding globals for Bindings.xml
BINDING_HEADER_FAMILYFAMILIARHELPER = "Family Familiar Helper"
BINDING_NAME_FAMILYFAMILIARHELPER_TOGGLE = "Toggle Family Familiar Helper"

local lastNotableNPC -- used to remember last notable NPC targeted; for the JustOnce option
local isMoving -- flag if window is moving

--[[ settings ]]

FamilyFamiliarHelperSettings = {} -- savedvar

-- default values for settings
local defaults = {
    NoEscape = false, -- whether ESC is ignored to close the window
    NoMove = false, -- whether the window can't be moved unless Shift is held
    AutoShow = true, -- whether frame automatically shown when a tamer is targeted
    JustOnce = false, -- whether the AutoShow only happens once until another tamer is targeted
    NoAchievementTooltip = false, -- whether the tooltip for main achievements is disabled
    ShowMinimapButton = false, -- whether to show the minimap button
}

-- metatable must remain empty for this to reliably work; which it will because setter never rawsets
local function getter(self,key)
    if FamilyFamiliarHelperSettings[key]==nil then -- if actual setting undefined, save a default value if one exists
        FamilyFamiliarHelperSettings[key] = defaults[key]
    end
    return FamilyFamiliarHelperSettings[key]
end

-- setter never does a rawset so table remains empty and __index always fires
local function setter(self,key,value)
    FamilyFamiliarHelperSettings[key] = value -- saving to savedvar instead
end

-- use ffh.settings to set/get savedvar values
ffh.settings = setmetatable({},{__index=getter, __newindex=setter})

--[[ timer for throttling events ]]

local timers = {}

ffh.timer = CreateFrame("Frame")
ffh.timer:Hide()
ffh.timer:SetScript("OnUpdate",function(self,elapsed)
    for func,remaining in pairs(timers) do
        remaining = remaining - elapsed
        if remaining < 0 then
            timers[func] = nil
            func(ffh.frame)
            if not next(timers) then
                self:Hide()
            end
        else
            timers[func] = remaining
        end
    end
end)

function ffh.timer:Start(duration,func)
    timers[func] = duration
    self:Show()
end

--[[ FamilyFamiliarHelperMainMixin for parent window ]]

FamilyFamiliarHelperMainMixin = {}

function FamilyFamiliarHelperMainMixin:OnLoad()
    self.TitleText:SetPoint("TOP",-6,-5)
    self.TitleText:SetText("Family Familiar Helper")
    ffh.frame = self
    -- make the close button watch for esc being hit to close if NoEscape disabled
    self.CloseButton:SetScript("OnKeyDown",function(self,key)
        if not ffh.settings.NoEscape and (key==GetBindingKey("TOGGLEGAMEMENU") or InCombatLockdown()) then
            self:GetParent():Hide()
            if not InCombatLockdown() then
                self:SetPropagateKeyboardInput(false)
            end
        elseif not InCombatLockdown() then
            self:SetPropagateKeyboardInput(true)
        end
    end)
    self:RegisterEvent("PLAYER_LOGIN")
    FamilyFamiliarHelperToggleWindow = FamilyFamiliarHelperFrame.Toggle
end

function FamilyFamiliarHelperMainMixin:OnMouseDown()
    if not ffh.settings.NoMove or IsShiftKeyDown() then
        isMoving = true
        self:StartMoving()
    end
end

function FamilyFamiliarHelperMainMixin:OnMouseUp()
    if isMoving then
        self:StopMovingOrSizing()
        isMoving = false
    end
end

-- toggles the window on the screen
function FamilyFamiliarHelperMainMixin:Toggle()
    ffh.frame:SetShown(not ffh.frame:IsVisible())
end

function FamilyFamiliarHelperMainMixin:OnShow()
    self:Update()
    self:RegisterEvent("CRITERIA_UPDATE")
    self:RegisterEvent("ACHIEVEMENT_EARNED")
end

function FamilyFamiliarHelperMainMixin:OnHide()
    self:UnregisterEvent("ACHIEVEMENT_EARNED")
    self:UnregisterEvent("CRITERIA_UPDATE")
end

function FamilyFamiliarHelperMainMixin:OnEvent(event,...)
    if self[event] then
        self[event](self,...)
    end
end

function FamilyFamiliarHelperMainMixin:PLAYER_LOGIN()
    if ffh.settings.AutoShow then
        self:RegisterEvent("PLAYER_TARGET_CHANGED")
    end
	local ldb = LibStub and LibStub:GetLibrary("LibDataBroker-1.1",true)
    if ldb then
        ldb:NewDataObject("FamilyFamiliarHelper",{ type="launcher", icon="Interface\\Icons\\Icon_PetFamily_Beast", iconCoords={0.075,0.925,0.075,0.925}, tooltiptext="Family Familiar Helper", OnClick=ffh.frame.Toggle })
	end
    FamilyFamiliarHelperMinimapButton:Setup()
    -- slash handler (/ffh to toggle window)
    SlashCmdList["FFH"] = ffh.frame.Toggle
    SLASH_FFH1 = "/ffh"
end

-- only registered with AutoShow option is enabled, watches for notable NPCs being targeted to show the window
function FamilyFamiliarHelperMainMixin:PLAYER_TARGET_CHANGED()
    if not ffh.settings.AutoShow then
        return -- in theory should never happen, just being safe
    end
    local npcID = tonumber((UnitGUID("target") or ""):match(".-%-%d+%-%d+%-%d+%-%d+%-(%d+)"))
    if npcID and ffh.notableNPCs[npcID] then -- this is a notable NPC
        -- if JustOnce enabled and we already interacted with this target, leave
        if npcID==lastNotableNPC and ffh.settings.JustOnce then
            return
        end
        lastNotableNPC = npcID
        local achievementID = ffh.notableNPCs[npcID]
        -- if this achievementID has already been completed, don't show window
        if select(4,GetAchievementInfo(achievementID)) then
            return
        end
        -- check if this target has completed all criteria it can for this achievementID
        -- NOTE: this assumes criteria names are same as npc names which may not always be the case!
        -- in this event, the window will always be shown
        local targetName = UnitName("target")
        local allCompleted = true
        local found = false -- it's possible criteria name and npc name don't match (Addius the Tormentor vs Addius the Tormenter)
        for i=1,GetAchievementNumCriteria(achievementID) do
            local criteriaID = select(8,GetAchievementCriteriaInfo(achievementID,i))
            for j=1,GetAchievementNumCriteria(criteriaID) do
                local name,_,completed = GetAchievementCriteriaInfo(criteriaID,j)
                if name==targetName then
                    found = true -- found a criteria that matches npc name
                    if not completed then
                        allCompleted = false -- if something is incomplete then it's not all complete
                    end
                end
            end
        end
        if allCompleted and found then
            return -- all criteria completed
        end
        -- if we reached here, open the progress panel at the achievementID
        ffh.settings.OpenAchievementID = achievementID
        ffh.frame:Show()
        ffh.frame:Update()
    end
end

function FamilyFamiliarHelperMainMixin:CRITERIA_UPDATE()
    ffh.timer:Start(1,self.Update) -- wait a second before doing an update in case of event spam
end

function FamilyFamiliarHelperMainMixin:ACHIEVEMENT_EARNED()
    ffh.timer:Start(1,self.Update)
end

-- updates the UI based on the OpenAchievementID setting; nil if home achievements panel should be shown,
-- and an achievementID if the progress panel should be shown
function FamilyFamiliarHelperMainMixin:Update()
    local openAchievementID = ffh.settings.OpenAchievementID
    if not openAchievementID or openAchievementID==0 or not ffh.achievementInfo[openAchievementID] then
        self.ProgressPanel:Hide()
        self.AchievementsPanel:Show()
        self.AchievementsPanel:Update()
    else
        self.AchievementsPanel:Hide()
        self.ProgressPanel:Show()
        self.ProgressPanel:Update(openAchievementID)
    end
end
