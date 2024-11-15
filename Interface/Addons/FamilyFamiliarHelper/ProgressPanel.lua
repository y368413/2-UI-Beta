local _,ffh = ...

-- indexed by main achievementID, each criteria and a yes/no flag for whether it's complete
local matrix = {}
-- indexed by main achievementID, the names of the criteria achievements for sorting purposes
local criteriaNames = {}

local function addProgressToMatrix(achievementID,name,petType,completed)
    if not matrix[achievementID][name] then
        matrix[achievementID][name] = {}
        tinsert(criteriaNames[achievementID],name)
    end
    matrix[achievementID][name][petType] = completed
end

-- updates the matrix with names and completed status of the given achievementID
local function updateProgressMatrix(achievementID)
    local info = ffh.achievementInfo[achievementID]
    if not info then
        return
    end
    if not matrix[achievementID] or not criteriaNames[achievementID] then
        matrix[achievementID] = {}
        criteriaNames[achievementID] = {}
    end
    for petType,criteriaID in ipairs(info.criteriaIDs) do
        if info.isNumericalCriteria and info.criteriaNeeded then -- this uses a progress bar and not X criterias
            local _,_,_,battlesWon = GetAchievementCriteriaInfo(criteriaID,1)
            for i=1,info.criteriaNeeded do
                local name = format("%s #%2d", WIN, i)
                addProgressToMatrix(achievementID,name,petType,battlesWon>=i)
            end
        else -- a normal achievement with multiple sub-criteria
            for i=1,GetAchievementNumCriteria(criteriaID) do
                local name,_,completed = GetAchievementCriteriaInfo(criteriaID,i)
                addProgressToMatrix(achievementID,name,petType,completed)
            end
        end
    end
    -- sort criteria names so they display alphabetically
    table.sort(criteriaNames[achievementID])
end

FamilyFamiliarHelperProgressHeaderMixin = {}

function FamilyFamiliarHelperProgressHeaderMixin:OnEnter()
    if self.criteriaID then
        local tooltip = FamilyFamiliarHelperTooltip
        tooltip:SetOwner(self,"ANCHOR_LEFT")
        tooltip:SetHyperlink(GetAchievementLink(self.criteriaID))
        tooltip:Show()
        tooltip:ClearAllPoints()
        tooltip:SetPoint("BOTTOMRIGHT",self:GetParent(),"BOTTOMRIGHT",-6,5)
        tooltip.NineSlice.Center:SetTexture("Interface\\ChatFrame\\ChatFrameBackground")
        tooltip.NineSlice:SetBorderColor(0.5,0.5,0.5,1)
        tooltip.NineSlice:SetCenterColor(0.05,0.05,0.05,1)
    end
end

function FamilyFamiliarHelperProgressHeaderMixin:OnLeave()
    FamilyFamiliarHelperTooltip:Hide()
end

FamilyFamiliarHelperProgressListButtonMixin = {}

function FamilyFamiliarHelperProgressListButtonMixin:OnLoad()
    for i=1,10 do
        self.Icons[i]:ClearAllPoints()
        self.Icons[i]:SetPoint("RIGHT",-(10-i)*28,0)
        self.Icons[i]:SetTexture("Interface\\Icons\\Pet_Type_"..PET_TYPE_SUFFIX[i])
    end
end

function FamilyFamiliarHelperProgressListButtonMixin:OnEnter()
    self.Highlight:Show()
end

function FamilyFamiliarHelperProgressListButtonMixin:OnLeave()
    self.Highlight:Hide()
end


FamilyFamiliarHelperProgressBackMixin = {}

function FamilyFamiliarHelperProgressBackMixin:OnClick()
    ffh.frame.ProgressPanel:Hide()
    ffh.frame.AchievementsPanel:Show()
    ffh.frame.AchievementsPanel:Update()
end


FamilyFamiliarHelperProgressPanelMixin = {}

function FamilyFamiliarHelperProgressPanelMixin:OnLoad()
    for i=1,10 do
        self.HeaderButtons[i]:SetPoint("TOPRIGHT",self,"BOTTOMRIGHT",-(10-i)*28-2,-2)
        self.HeaderButtons[i].Icon:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[i])
    end
end

-- updates the progress panel (list of criteria and progress on each) for the given achievementID
function FamilyFamiliarHelperProgressPanelMixin:Update(achievementID)
    local info = ffh.achievementInfo[achievementID] 
    assert(type(info)=="table","AchievementID "..(achievementID or "nil").." is not a known achievement.")
    ffh.settings.OpenAchievementID = achievementID -- save which progress panel we're on

    local _,name = GetAchievementInfo(achievementID)
    ffh.frame.TitleText:SetText(name)

    -- update the progress matrix and criteria names
    updateProgressMatrix(achievementID)

    -- update list
    for i,name in ipairs(criteriaNames[achievementID]) do
        if not self.ListButtons[i] then
            self.ListButtons[i] = CreateFrame("Button",nil,self,"FamilyFamiliarHelperProgressListButtonTemplate")
            self.ListButtons[i]:SetPoint("TOPLEFT",self.ListButtons[i-1],"BOTTOMLEFT")
        end
        self.ListButtons[i].Name:SetText(name)
        self.ListButtons[i].name = name
        for j=1,10 do -- light up pet types in the row that have been completed
            self.ListButtons[i].Icons[j]:SetAlpha(matrix[achievementID][name][j] and 1 or 0.125)
        end
        self.ListButtons[i]:Show()
    end
    for i=#criteriaNames[achievementID]+1,#self.ListButtons do
        self.ListButtons[i]:Hide()
    end

    -- update totals
    for i=1,10 do
        local total = 0
        for j,name in ipairs(criteriaNames[achievementID]) do
            if matrix[achievementID][name][i] then
                total = total + 1
            end
        end
        local completed = select(4,GetAchievementInfo(info.criteriaIDs[i]))
        self.HeaderButtons[i].Text:SetText(completed and "\124TInterface\\RaidFrame\\ReadyCheck-Ready:18\124t" or total)
        self.HeaderButtons[i].criteriaID = info.criteriaIDs[i]
    end

    -- adjust window height for number of entries
    local height = #criteriaNames[achievementID]*20+11
    self:SetHeight(height)
    self:GetParent():SetHeight(height+58)
end