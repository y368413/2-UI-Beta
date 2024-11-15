local _,ffh = ...

-- counts the completed sub-criteria of the given achievementID
local function countCompleted(achievementID)
    local count = 0
    for i=1,GetAchievementNumCriteria(achievementID) do
        if select(3,GetAchievementCriteriaInfo(achievementID,i)) then
            count = count + 1
        end
    end
    return count
end

-- returns true if the given achievementID is completed
local function isCompleted(achievementID)
    local completed = select(4,GetAchievementInfo(achievementID))
end

-- returns the progress of an achievementID (one of the main ones, not a criteria) as numCompleted, totalNeeded
local function getProgress(achievementID)
    local info = ffh.achievementInfo[achievementID]
    if not info then
        return
    end
    local numCriteria = GetAchievementNumCriteria(achievementID)
    local totalNeeded = info.criteriaNeeded * numCriteria
    -- if this achievementID is complete, no need to check criteria, everything complete
    if isCompleted(achievementID) then
        return totalNeeded, totalNeeded
    end
    -- otherwise, count the number of criteria completed in each...uh...criteria
    local numCompleted = 0
    for i=1,numCriteria do -- for main achievementIDs this is generally going to be 10 (one for each pet type)
        local criteriaID = select(8,GetAchievementCriteriaInfo(achievementID,i))
        local numAdded = 0
        if isCompleted(criteriaID) then -- if criteria completed, no need to count
            numAdded = info.criteriaNeeded
        elseif info.isNumericalCriteria then -- criteria not complete, add progress if a numerical criteria
            numAdded = select(4,GetAchievementCriteriaInfo(criteriaID,1))
        else -- criteria not complete, count up sub-criteria
            numAdded = countCompleted(criteriaID)
        end
        numCompleted = numCompleted + (min(numAdded or 0,info.criteriaNeeded))
    end
    return numCompleted, totalNeeded
end

 --[[ list button mixin ]]

FamilyFamiliarHelperAchievementListButtonMixin = {}

function FamilyFamiliarHelperAchievementListButtonMixin:OnLoad()
    self.ProgressBar:SetStatusBarColor(0,.6,0,1)
    self.ProgressBar:SetMinMaxValues(0, 100)
    self.ProgressBar:SetValue(50)
    self.ProgressBar:GetStatusBarTexture():SetDrawLayer("BORDER")

    self:SetBackdropBorderColor(0.5,0.5,0.5)
    self:SetBackdropColor(0,0,0,0)
end

function FamilyFamiliarHelperAchievementListButtonMixin:OnEnter()
    self.Highlight:Show()
    if self.achievementID and not ffh.settings.NoAchievementTooltip then
        local tooltip = FamilyFamiliarHelperTooltip
        local fx = ffh.frame:GetCenter()*ffh.frame:GetEffectiveScale()
        local ux = UIParent:GetCenter()*UIParent:GetEffectiveScale()
        tooltip:SetOwner(self,fx>ux and "ANCHOR_LEFT" or "ANCHOR_RIGHT")
        tooltip:SetHyperlink(GetAchievementLink(self.achievementID))
        tooltip:Show()
        tooltip.NineSlice:SetBorderColor(0.5,0.5,0.5,1)
        tooltip.NineSlice:SetCenterColor(0.05,0.05,0.05,1)
    end
end

function FamilyFamiliarHelperAchievementListButtonMixin:OnLeave()
    self.Highlight:Hide()
    FamilyFamiliarHelperTooltip:Hide()
end

function FamilyFamiliarHelperAchievementListButtonMixin:OnMouseDown()
    self.Highlight:Hide()
end

function FamilyFamiliarHelperAchievementListButtonMixin:OnMouseUp()
    if self:IsMouseMotionFocus() then
        self.Highlight:Show()
    end
end

-- click of an achievement list button opens the progress panel to the clicked achievementID
function FamilyFamiliarHelperAchievementListButtonMixin:OnClick()
    ffh.frame.AchievementsPanel:Hide()
    ffh.frame.ProgressPanel:Show()
    ffh.frame.ProgressPanel:Update(self.achievementID)
end

--[[ achievement panel mixin ]]

FamilyFamiliarHelperAchievementsPanelMixin = {}

 -- this updates the contents of the achievementsPanel (list of achievements)
function FamilyFamiliarHelperAchievementsPanelMixin:Update()
    ffh.settings.OpenAchievementID = nil -- save that we're on achievements panel
    ffh.frame.TitleText:SetText("Family Familiar Helper")
    for i,info in ipairs(ffh.achievementInfo) do
        if not self.Achievements[i] then
            self.Achievements[i] = CreateFrame("Button",nil,self,"FamilyFamiliarHelperAchievementListButtonTemplate")
            self.Achievements[i]:SetPoint("BOTTOMLEFT",self.Achievements[i-1],"TOPLEFT")
        end
        self.Achievements[i].achievementID = info.achievementID
        local _,name,_,_,_,_,_,_,_,icon = GetAchievementInfo(info.achievementID)
        self.Achievements[i].Name:SetText(name)
        self.Achievements[i].Icon.Texture:SetTexture(icon)
        local numCompleted,totalNeeded = getProgress(info.achievementID)
        self.Achievements[i].ProgressBar.Text:SetText(format("%d / %d",numCompleted,totalNeeded))
        local percent = floor(numCompleted*100/totalNeeded+0.5)
        self.Achievements[i].ProgressBar:SetValue(percent)
        if percent>=100 then
            self.Achievements[i].Percent.Check:Show()
            self.Achievements[i].Percent.Text:Hide()
        else
            self.Achievements[i].Percent.Text:SetText(format("%d%%",percent))
            self.Achievements[i].Percent.Check:Hide()
            self.Achievements[i].Percent.Text:Show()
        end
    end
    local height = #ffh.achievementInfo*50
    self:SetHeight(height)
    self:GetParent():SetHeight(height+30)
end

