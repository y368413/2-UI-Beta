local _,rematch = ...
local L = rematch.localization
local C = rematch.constants
local settings = rematch.settings
rematch.petCard = RematchPetCard

rematch.events:Register(rematch.petCard,"PLAYER_LOGIN",function(self)
    self.Title:SetText(L["Pet Card"])

    -- register cardManager behavior
    rematch.cardManager:Register("PetCard",self,{
        update = self.Update,
        lockUpdate = self.UpdateLock,
        pinUpdate = self.UpdatePinButton,
        shouldShow = self.ShouldShow
    })

	local font,size,flag = self.Content.Top.Name:GetFont()
	self.Content.Top.Name:SetFont(font,size+1,flag)

    self.Content.Front.Stats.AltFlipHelp.Text:SetFontObject("GameFontHighlightSmall")
    self.Content.Front.Stats.AltFlipHelp.Text:SetTextColor(0.6,0.6,0.6)

    self.Content.Back.Racial.DamageTaken:SetText(L["Damage\nTaken"])
	self.Content.Back.Racial.StrongFrom:SetText(L["from"])
	self.Content.Back.Racial.WeakFrom:SetText(L["from"])
	self.Content.Back.Racial.StrongAbilities:SetText(L["abilities"])
	self.Content.Back.Racial.WeakAbilities:SetText(L["abilities"])

    local breedSource,breedSourceName = rematch.breedInfo:GetBreedSource()
    if breedSource then
        self.Content.Front.Stats.BreedTable.Title:SetText(breedSource=="PetTracker" and L["Possible Breeds"] or L["Stats as \124cff0070ddRare\124r level 25"])
        self.Content.Front.Stats.BreedTable.Footer:SetText(format(L["All breed data pulled from %s%s\124r"],C.HEX_WHITE,breedSourceName))
        self.Content.Front.Stats.BreedTable.NoBreeds:SetText(L["No known breeds :("])
    end

    self.Content.Front.Stats.Buttons = {}

    -- lookup table of heights of various sections of the pet card; call petCard:ResetHeights() to reset all section heights to 0
    self.heights = {
        chrome = C.PET_CARD_CHROME_HEIGHT, -- the height of the frame outside the content (titlebar, border) never changes
    }

    self:Configure()

    -- create hook for using pet cards as links
    hooksecurefunc("SetItemRef",self.SetItemRef)

    rematch.menus:Register("AbilityMenu",{
        {title=rematch.petCard.GetAbilityNameByID},
        {text=L["Find Pets With This Ability"], func=rematch.petCard.FindPetsWithAbility},
    })
end)

-- returns the name of abilityID
function rematch.petCard:GetAbilityNameByID(abilityID)
    return (select(2,C_PetBattles.GetAbilityInfoByID(abilityID)))
end

-- summons pet view if not visible and searching for ability with abilityID
function rematch.petCard:FindPetsWithAbility(abilityID)
    local abilityName = rematch.petCard:GetAbilityNameByID(abilityID)
    if abilityName then
        rematch.layout:SummonView("pets")
        local exactSearch = '"'..abilityName..'"'
        rematch.filters:SetSearch(exactSearch)
        rematch.petsPanel.Top.SearchBox:SetText(exactSearch)
        rematch.petsPanel:Update()
    end
end

function rematch.petCard:Update(petID)
    if petID then
        self.petID = petID
    end

    -- before building the card, reset all heights to 0; the ultimate size of the card will depend on the height of each section
    self:ResetHeights()

    -- if this is a leveling, random or ignored pet card, it can't flip
    local petInfo = rematch.petInfo:Fetch(self.petID)

    if not petInfo.name then
        rematch.petCard:Hide()
    end

    if petInfo.isSpecialType then
        self.hardFlip = false
        self.softFlip = false
    end

    -- update top of card which is always shown, front or back
    self.Content.Top:Update()

    -- update back of pet card first, its content height isn't as fluid as the front's
    self.Content.Back.Source:Update() -- update pet source at top of back
    self.Content.Back.Racial:Update() -- update pet type details at bottom of back
    self.Content.Back.Lore:Update() -- update lore in middle of back

    -- update front of the pet card next, abilities first then do stats is three sections
    self.Content.Front.Abilities:Update() -- update abilities at bottom of front
    self.Content.Front.Stats:UpdateBottom() -- update hp/xp statusbar, card-wide collected versions and possible breeds
    self.Content.Front.Stats:UpdateTop() -- update species name and all stats buttons listed to left beneath it (must come after UpdateBottom to fit rows/columns properly)
    self.Content.Front.Stats:UpdateArt() -- update level pennant and background for stats
    self.Content.Front.Stats:UpdateModel() -- update model on front of card

    -- put a gold border around parts of the card (pet/type icons, abilities) that triggered a search hit
    self:UpdateSearchHits()

    -- the tallest side gets to be the height of the card, so it remains the same size when flipped
    local backHeight = self.heights.chrome + self.heights.top + self.heights.source + self.heights.lore + self.heights.racial
    local frontHeight = self.heights.chrome + self.heights.top + self.heights.statsTop + self.heights.statsBottom + self.heights.abilities

    self:SetHeight(max(backHeight,frontHeight))

    self:FlipCard() -- show front or back of card

    self:UpdatePinButton()
end

-- flips the pet card to the front or back depending on whether flip modifier key is down or soft/hardFlip
-- softFlip is when the mouse is over the pet or type icon at the top of the card
-- hardFlip is when the pet or type icon at the top of the card were clicked (so it stays flipped until flipped again or dismissed)
function rematch.petCard:FlipCard()

    local petInfo = rematch.petInfo:Fetch(self.petID)

    -- if flip key is used then show back (unless doing a hardFlip and already showing back; then show front)
    local isFlipKeyUsed = self:IsFlipKeyUsed()
    if not petInfo.isSpecialType and (isFlipKeyUsed or self.softFlip or self.hardFlip) and not (isFlipKeyUsed and self.hardFlip) then
        self.Content.Front:Hide()
        self.Content.Back:Show()
    else
        self.Content.Back:Hide()
        self.Content.Front:Show()
    end

    self.FlipButton:SetShown(not petInfo.isSpecialType and self.hardFlip) -- only show flip button when the card is hard flipped (not modifier/mouseover)
end

-- if the modifier key going down or up is also the PetCardFlipKey, then update the card to potentially flip it over
function rematch.petCard:MODIFIER_STATE_CHANGED(key,down)
    if self:IsFlipKeyUsed(key) then
        self:FlipCard()
    end
end

-- adjusts size of persistent elements when pet card is minimized or maximized
function rematch.petCard:Configure()
    if settings.PetCardMinimized then
        self.MinimizeButton:SetIcon("maximize")
        self.Content.Top:SetHeight(C.PET_CARD_TOP_MINIMIZED_HEIGHT)
        self.Content.Top.PetIcon:SetSize(C.PET_CARD_TOP_ICON_MINIMIZED_SIZE,C.PET_CARD_TOP_ICON_MINIMIZED_SIZE)
        self.Content.Top.TypeIcon:SetSize(C.PET_CARD_TOP_ICON_MINIMIZED_SIZE,C.PET_CARD_TOP_ICON_MINIMIZED_SIZE)
        self.Content.Top.PetIcon:SetPoint("TOPLEFT",4,-3)

        self.Content.Front.Abilities:SetHeight(C.PET_CARD_ABILITIES_MINIMIZED_HEIGHT)
        for i=1,6 do
            self.Content.Front.Abilities.Buttons[i]:SetHeight(28)
            self.Content.Front.Abilities.Buttons[i].Icon:SetSize(24,24)
            self.Content.Front.Abilities.Buttons[i].Border:SetSize(28,28)
            self.Content.Front.Abilities.Buttons[i].TypeDecal:SetSize(40,28)
        end
    else
        self.MinimizeButton:SetIcon("minimize")
        self.Content.Top:SetHeight(C.PET_CARD_TOP_NORMAL_HEIGHT)
        self.Content.Top.PetIcon:SetSize(C.PET_CARD_TOP_ICON_NORMAL_SIZE,C.PET_CARD_TOP_ICON_NORMAL_SIZE)
        self.Content.Top.TypeIcon:SetSize(C.PET_CARD_TOP_ICON_NORMAL_SIZE,C.PET_CARD_TOP_ICON_NORMAL_SIZE)
        self.Content.Top.PetIcon:SetPoint("TOPLEFT",4,-4)

        self.Content.Front.Abilities:SetHeight(C.PET_CARD_ABILITIES_NORMAL_HEIGHT)
        for i=1,6 do
            self.Content.Front.Abilities.Buttons[i]:SetHeight(32)
            self.Content.Front.Abilities.Buttons[i].Icon:SetSize(28,28)
            self.Content.Front.Abilities.Buttons[i].Border:SetSize(32,32)
            self.Content.Front.Abilities.Buttons[i].TypeDecal:SetSize(46,32)
        end
    end
end

function rematch.petCard:UpdatePinButton()
    local isPinned = rematch.cardManager:IsCardPinned(self)
    self.PinButton:SetShown(isPinned)

    if isPinned then
        self.FlipButton:SetPoint("TOPLEFT",self.PinButton,"TOPRIGHT")
    else
        self.FlipButton:SetPoint("TOPLEFT",1,-1)
    end
end

function rematch.petCard:UpdateLock()
    if rematch.bottombar:IsVisible() then
        rematch.bottombar:Update()
    end
    -- if petsPanel up, select/unselect the card's petID
    if rematch.petsPanel:IsVisible() then
        rematch.petsPanel.List:Select("PetCard",rematch.petCard:IsVisible() and rematch.cardManager:IsCardLocked(rematch.petCard) and rematch.petCard.petID)
    end
    if rematch.queuePanel:IsVisible() then
        rematch.queuePanel.List:Select("PetCard",rematch.petCard:IsVisible() and rematch.cardManager:IsCardLocked(rematch.petCard) and rematch.queue:GetPetIndex(rematch.petCard.petID))
    end
    -- if pet is wrapped, locking the pet card (clicking the pet or clicking its link) will unwrap the pet
    if rematch.cardManager:IsCardLocked(rematch.petCard) then
        local petID = rematch.petCard.petID
        local petInfo = rematch.petInfo:Fetch(petID)
        if petInfo.needsFanfare then
            rematch.petCard.Content.Front.Stats.PetModel:StartUnwrapAnimation(function()
                C_PetJournal.ClearFanfare(petID)
                rematch.frame:Update()
                -- fix for weird issue where miniloadoutpanel doesn't update
                rematch.timer:Start(0.5,rematch.frame.Update,rematch.frame)
            end)
        end
    end
end

--[[ content update functions ]]

-- updates the pet icon, type icon and name at the top of the card (always displayed; on neither front nor back)
function rematch.petCard.Content.Top:Update()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    self.Back:SetDesaturated(not petInfo.isOwned)

    self.Name:SetText(petInfo.name)
    self.PetIcon:SetTexture(petInfo.icon)
    self.TypeIcon:SetTexture(petInfo.suffix and "Interface\\Icons\\Icon_PetFamily_"..petInfo.suffix or petInfo.icon)

    if settings.ColorPetNames and petInfo.color then
        self.Name:SetTextColor(petInfo.color.r,petInfo.color.g,petInfo.color.b)
    else
        self.Name:SetTextColor(1,0.82,0)
    end

    rematch.petCard.heights.top = settings.PetCardMinimized and C.PET_CARD_TOP_MINIMIZED_HEIGHT or C.PET_CARD_TOP_NORMAL_HEIGHT
end

-- updates the abilities on the bottom front of the card
function rematch.petCard.Content.Front.Abilities:Update()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    self.Back:SetDesaturated(not petInfo.isOwned)

    -- check whether this petID should display alternate text instead of abilities
    local altText
    if petInfo.idType=="leveling" then
        altText = L["When this team loads, your current leveling pet will go in this spot."]
    elseif petInfo.idType=="ignored" then
        altText = L["When this team loads, this spot will be ignored."]
    elseif petInfo.idType=="random" then
        altText = L["When this team loads, a random high level pet will go in this spot."]
    elseif petInfo.idType=="unnotable" then
        altText = L["The pets for this target are not recorded due to this target not being notable."]
    elseif not petInfo.canBattle then
        altText = BATTLE_PET_CANNOT_BATTLE
    end

    self.AltText:SetShown(altText and true or false)

    if altText then
        self.AltText:SetText(altText)
        for i=1,6 do
            self.Buttons[i]:Hide()
        end
    else
        local abilityList = petInfo.abilityList
        local teamID,teamAbility1,teamAbility2,teamAbility3 = rematch.petCard:GetTeamInfo() -- using altInfo within to avoid petInfo clobber
        local buttonIndex = 1
        -- some pets (like Gizmo) have abilities at indexes 2,4,6 but not 1,3,5; can't assume abilities are ordered starting at 1
        for i=1,6 do
            local abilityID = abilityList[i]
            if abilityID then
                local button = self.Buttons[buttonIndex]
                local _,name,icon,_,_,_,petType = C_PetBattles.GetAbilityInfoByID(abilityID)
                if name and icon then
                    button.abilityID = abilityID
                    button.Name:SetText(name)
                    button.Icon:SetTexture(icon)
                    if petType then
                        local x = ((petType-1)%4)*0.25
                        local y = floor((petType-1)/4)*0.25
                        button.TypeDecal:SetTexCoord(x,x+0.25,y,y+0.171875)
                        button.TypeDecal:Show()
                    else
                        button.TypeDecal:Hide()
                    end
                    button:Show()
                    if teamID then
                        -- if card is shown for a pet in a team, dim the ability if it's not used in the team
                        local compareAbility = (i-1)%3==0 and teamAbility1 or (i-1)%3==1 and teamAbility2 or (i-1)%3==2 and teamAbility3
                        rematch.petCard:DimAbility(button,compareAbility and compareAbility~=0 and not (abilityID==compareAbility)) --  or compareAbility==0 to have slots with no chosen ability both lit up
                    else
                        rematch.petCard:DimAbility(button,false)
                    end
                else
                    button.abilityID = nil
                    button:Hide()
                end
                buttonIndex = buttonIndex + 1
            end
        end
        -- hide ability buttons that aren't used
        for i=buttonIndex,6 do
            self.Buttons[i].abilityID = nil
            self.Buttons[i]:Hide()
        end

        -- if only 3 or less abilities shown, shift abilities towards center
        self.Buttons[1]:SetPoint("TOPLEFT",rematch.utils:GetSize(abilityList)<=3 and 63 or 4,-4)
    end

    rematch.petCard.heights.abilities = settings.PetCardMinimized and C.PET_CARD_ABILITIES_MINIMIZED_HEIGHT or C.PET_CARD_ABILITIES_NORMAL_HEIGHT
end

-- dims the ability (if it's not used for a team) if dim is true
function rematch.petCard:DimAbility(button,dim)
    if dim then
        button:SetAlpha(0.5)
        button.Name:SetTextColor(0.5,0.5,0.5)
        button.Icon:SetDesaturated(true)
        button.Icon:SetVertexColor(0.5,0.5,0.5)
        button.TypeDecal:SetDesaturated(true)
    else
        button:SetAlpha(1)
        button.Name:SetTextColor(1,0.82,0.5)
        button.Icon:SetDesaturated(false)
        button.Icon:SetVertexColor(1,1,1)
        button.TypeDecal:SetDesaturated(false)
    end
end

-- update the top part of stats: species name, stat buttons along left side (or two columns while minimized)
function rematch.petCard.Content.Front.Stats:UpdateTop()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    local xoff,yoff = C.PET_CARD_STAT_LEFT_MARGIN,-C.PET_CARD_STAT_TOP_MARGIN -- coordinates relative to TOPLEFT

    -- species name is topmost stat if pet is renamed and separate from others since it can wrap
    if petInfo.customName then
        self.SpeciesName:SetText(petInfo.speciesName)
        yoff = yoff - self.SpeciesName:GetStringHeight() - 2
        self.SpeciesName:Show()
    else
        self.SpeciesName:Hide()
    end

    rematch.petCard:ReleaseStatButtons()

    -- first look for any wide stats to display at top, these never display in columns when minimized
    for index,info in ipairs(rematch.petCardStats) do
        if info.isWide and rematch.utils:Evaluate(info.show,rematch.petCard,petInfo) then
            local button = rematch.petCard:CreateStatButton(button,index,petInfo)
            button:SetPoint("TOPLEFT",xoff,yoff)
            button:Show()
            yoff = yoff - C.PET_CARD_STAT_HEIGHT - 1
        end
    end

    -- next count how many remaining stats to display
    local numStats = 0
    for index,info in ipairs(rematch.petCardStats) do
        if not info.isWide and rematch.utils:Evaluate(info.show,rematch.petCard,petInfo) then
            numStats = numStats + 1
        end
    end

    -- next calculate number of rows (mostly for minimized, where there may be two columns)
    local numRows = numStats -- for maximized cards, number of rows is number of stats
    if settings.PetCardMinimized then
        numRows = ceil(numStats/2) -- two columns while minimized
        --if minimized and stat rows can extend further (card back is taller than front if stats evenly split into two columns),
        -- adjust numRows to use space
        local heights = rematch.petCard.heights
        local minHeight = (heights.source + heights.lore + heights.racial) - (heights.statsBottom + heights.abilities - yoff)
        if numRows*C.PET_CARD_STAT_HEIGHT < minHeight then
            numRows = floor(minHeight/(C.PET_CARD_STAT_HEIGHT+1))
        end
    end

    -- finally place the remaining normal-width stats
    local restartYOff = yoff -- for returning to on second row
    local minYOff = yoff -- most extended yOff will determine height of stats
    local row = 1
    for index,info in ipairs(rematch.petCardStats) do
        if not info.isWide and rematch.utils:Evaluate(info.show,rematch.petCard,petInfo) then
            local button = rematch.petCard:CreateStatButton(button,index,petInfo)
            button:SetPoint("TOPLEFT",xoff,yoff)
            button:Show()
            yoff = yoff - C.PET_CARD_STAT_HEIGHT - 1
            minYOff = min(yoff,minYOff)
            row = row + 1
            if row > numRows then
                row = 1
                xoff = xoff + C.PET_CARD_STAT_WIDTH_MEDIUM + C.PET_CARD_STAT_PADDING
                yoff = restartYOff
            end
        end
    end

    -- final height is the most extended y offset (minYOff) or if not minimized, minimium model height
    local height = 0
    if petInfo.isSpecialType then
        height = settings.PetCardMinimized and 64 or C.PET_CARD_MIN_MODEL_HEIGHT
    elseif minYOff~=-C.PET_CARD_STAT_TOP_MARGIN then -- if y offset didn't change at all, leave height at 0
        if not settings.PetCardMinimized then
            height = max(-minYOff,C.PET_CARD_MIN_MODEL_HEIGHT)
        else
            height = -minYOff
        end
    end

    --rematch.petCard.heights.statsTop = floor((minYOff==-C.PET_CARD_STAT_TOP_MARGIN and 0 or -minYOff)+0.5)
    rematch.petCard.heights.statsTop = floor(height+0.5)
end

-- update hp/xp statusbar, card-wide collected versions and possible breeds
function rematch.petCard.Content.Front.Stats:UpdateBottom()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    -- start laying out bottom of stats at these coordinates and going up
    local xoff,yoff = C.PET_CARD_STAT_LEFT_MARGIN,C.PET_CARD_STAT_BOTTOM_MARGIN -- coordinates relative to TOPLEFT

    -- xp bar if pet can level is under level 25
    if petInfo.xp and petInfo.maxXp and petInfo.level and petInfo.level<25 then
        self.XpBar:SetPoint("BOTTOMLEFT",xoff+2,yoff+2)
        self.XpBar:Show()
        rematch.utils:UpdateStatusBar(self.XpBar.Bar,petInfo.xp,petInfo.maxXp,C.PET_CARD_STATUS_BAR_WIDTH,C.XP_BAR_COLOR.r,C.XP_BAR_COLOR.g,C.XP_BAR_COLOR.b)
        self.XpBar.Text:SetText(format("XP: %d/%d (%s)",petInfo.xp,petInfo.maxXp,floor(petInfo.xp*100/petInfo.maxXp+0.5).."%"))
        self.XpBar.Text:SetShown(settings.PetCardAlwaysShowHPXPText)
        yoff = yoff + 14
    else
        self.XpBar:Hide()
    end
    -- hp bar if pet has health and is injured
    if petInfo.isInjured or (settings.PetCardAlwaysShowHPBar and petInfo.maxHealth and petInfo.maxHealth>0) then --and petInfo.health<petInfo.maxHealth then
        self.HpBar:SetPoint("BOTTOMLEFT",xoff+2,yoff+2)
        self.HpBar:Show()
        rematch.utils:UpdateStatusBar(self.HpBar.Bar,petInfo.health,petInfo.maxHealth,C.PET_CARD_STATUS_BAR_WIDTH,C.HP_BAR_COLOR.r,C.HP_BAR_COLOR.g,C.HP_BAR_COLOR.b)
        self.HpBar.Text:SetText(format("HP: %d/%d %s",petInfo.health,petInfo.maxHealth,petInfo.health==0 and format("%s(%s)\124r",C.HEX_RED,DEAD) or format("(%d%%)",floor(petInfo.health*100/petInfo.maxHealth+0.5))))
        self.HpBar.Text:SetShown(settings.PetCardAlwaysShowHPXPText)
        yoff = yoff + 14
    else
        self.HpBar:Hide()
    end
    -- "Hold [Alt] to view more etc"
    if not settings.HideMenuHelp and settings.PetCardFlipKey and settings.PetCardFlipKey~="None" and not petInfo.isSpecialType and not settings.PetCardMinimized then
        self.AltFlipHelp:SetPoint("BOTTOMLEFT",xoff,yoff)
        self.AltFlipHelp.Text:SetText(format(L["Hold [%s] to view more about this pet."],settings.PetCardFlipKey))
        self.AltFlipHelp:Show()
        local flipHeight = self.AltFlipHelp.Text:GetStringHeight()
        self.AltFlipHelp:SetHeight(flipHeight+2)
        yoff = yoff + flipHeight + 2
    else
        self.AltFlipHelp:Hide()
    end
    -- possible breeds only if breed addon is enabled
    local possibleBreedList = rematch.petCard:GetPossibleBreedList(petInfo)
    if possibleBreedList and not settings.PetCardMinimized and not settings.PetCardHidePossibleBreeds then
        self.PossibleBreeds:SetPoint("BOTTOMLEFT",xoff,yoff+2)
        self.PossibleBreeds.Text:SetText(possibleBreedList)
        self.PossibleBreeds:Show()
        local possibleBreedsHeight = self.PossibleBreeds.Text:GetStringHeight()
        self.PossibleBreeds:SetHeight(possibleBreedsHeight+4)
        yoff = yoff + possibleBreedsHeight + 4
    else
        self.PossibleBreeds:Hide()
    end
    -- collected if card is not minimized and pet is obtainable
    local collectedList = rematch.petCard:GetCollectedList(petInfo)
    if collectedList and not settings.PetCardMinimized and not settings.PetCardCompactCollected then
        self.Collected:SetPoint("BOTTOMLEFT",xoff,yoff+2)
        self.Collected.Text:SetText(collectedList)
        self.Collected:Show()
        local collectedHeight = self.Collected.Text:GetStringHeight()
        self.Collected:SetHeight(collectedHeight+4)
        yoff = yoff + collectedHeight + 4
    else
        self.Collected:Hide()
    end

    -- if yoff unchanged, bottom doesn't contribute anything to height
    rematch.petCard.heights.statsBottom = floor((yoff==C.PET_CARD_STAT_BOTTOM_MARGIN and 0 or yoff)+0.5)
end

-- update level pennant, background and model to right of stats
function rematch.petCard.Content.Front.Stats:UpdateArt()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    -- update level/rarity pennant in topright
    if petInfo.level and petInfo.canBattle then
        self.LevelPennant:Show()
        self.Level:Show()
        self.LevelLabel:Show()
        self.LevelPennant:SetVertexColor(petInfo.color.r,petInfo.color.g,petInfo.color.b)
        self.Level:SetText(petInfo.level)
    else
        self.LevelPennant:Hide()
        self.Level:Hide()
        self.LevelLabel:Hide()
    end

    -- calculate actual height of the stats (depends on whether back is taller than front)
    local heights = rematch.petCard.heights
    local frontHeight = heights.statsTop + heights.statsBottom + heights.abilities
    local backHeight = heights.source + heights.lore + heights.racial
    local statsHeight = frontHeight - heights.abilities + (backHeight>frontHeight and (backHeight-frontHeight) or 0) + 5
    local statsWidth = floor(self:GetWidth()+0.5)
    heights.fullStats = statsHeight

    -- background can take up full width/height of stats, whichever is the shorter dimension (bg is square always)
    local bgSize = min(statsWidth,statsHeight)

    -- expansion background
    local expansionCoords = petInfo.expansionID and C.EXPANSION_BG_TEXCOORDS[petInfo.expansionID]
    if settings.PetCardBackground=="Expansion" and expansionCoords and bgSize > 32 then
        local left,right,top,bottom = expansionCoords[1],expansionCoords[2],expansionCoords[3],expansionCoords[4]
        -- the expansion texture is 248px wide and 124px tall. the width never changes, but if the area available
        -- is less than 125px tall, the texture and its coords needs to be adjusted to cut them short
        if bgSize < 125 then
            self.ExpansionBackground:SetHeight(bgSize)
            self.ExpansionBackground:SetTexCoord(left,right,top,(bottom-top) * (bgSize/125) + top)
        else
            self.ExpansionBackground:SetHeight(125)
            self.ExpansionBackground:SetTexCoord(left,right,top,bottom)
        end
        self.ExpansionBackground:Show()
    else
        self.ExpansionBackground:Hide()
    end

    -- pet icon or portrait background
    if (settings.PetCardBackground=="Icon" or settings.PetCardBackground=="Portrait") and bgSize > 32 then
        if settings.PetCardBackground=="Icon" or petInfo.isSpecialType then
            self.PetBackground:SetTexture(petInfo.icon)
        else
            SetPortraitTextureFromCreatureDisplayID(self.PetBackground,petInfo.displayID)
        end
        self.FadeMask:SetSize(bgSize,bgSize)
        self.PetBackground:SetSize(bgSize,bgSize)
        self.PetBackground:Show()
    else
        self.PetBackground:Hide()
    end

    -- type icon background
    if settings.PetCardBackground=="Type" and petInfo.petType and petInfo.suffix and bgSize>32 then
        self.TypeBackground:SetTexture("Interface\\PetBattles\\PetIcon-"..petInfo.suffix)
        self.TypeBackground:SetSize(bgSize,bgSize)
        self.TypeBackground:Show()
    else
        self.TypeBackground:Hide()
    end

end

function rematch.petCard.Content.Front.Stats:UpdateModel()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)

    -- model is confined to the top part of stats but doesn't need to be square
    local modelHeight = rematch.petCard.heights.fullStats - rematch.petCard.heights.statsBottom - 6
    local modelWidth = max(min(modelHeight,floor(self:GetWidth()+0.5)),C.PET_CARD_MIN_MODEL_WIDTH)

    if not petInfo.displayID or settings.PetCardMinimized then
        self.PetModel:Hide()
        self.AltModel:Hide()
        self.displayID = nil
    elseif petInfo.petID~=self.petID or petInfo.displayID~=self.displayID or type(self.displayID)=="string" then
        self.petID = petInfo.petID
        self.displayID = petInfo.displayID
        if petInfo.speciesID then -- if this is an actual pet, use PetModel
            self.PetModel:SetSize(modelWidth,modelHeight)
            local modelSceneID = C_PetJournal.GetPetModelSceneInfoBySpeciesID(petInfo.speciesID)
            self.PetModel:TransitionToModelSceneID(modelSceneID,CAMERA_TRANSITION_TYPE_IMMEDIATE,CAMERA_MODIFICATION_TYPE_MAINTAIN,false)
            local actor = self.PetModel:GetActorByTag("unwrapped")
            if actor then
                actor:SetModelByCreatureDisplayID(petInfo.displayID)
                --actor:SetAnimationBlendOperation(LE_MODEL_BLEND_OPERATION_NONE)
                actor:SetAnimation(0,-1)
            end
            self.AltModel:Hide()
            self.PetModel:Show()
            self.PetModel:PrepareForFanfare(petInfo.needsFanfare)
        elseif type(petInfo.displayID)=="string" then -- this is a named m2 model, use AltModel instead
            self.AltModel:SetSize(modelWidth,modelHeight)
            self.AltModel:SetModel(petInfo.displayID)
            self.AltModel:SetCamDistanceScale(0.45)
            self.AltModel:SetPosition(0,0,0.25)
            self.PetModel:Hide()
            self.AltModel:Show()
        end
    end
end

-- bottom back of the card with pet type name, racial ability and damage taken
function rematch.petCard.Content.Back.Racial:Update()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)
    if not petInfo.petType or petInfo.isSpecialType then
        return 0 -- no info about petTypes that don't exist or aren't an actual pet
    end

    self.TypeName:SetText(petInfo.petTypeName)
    self.TypeIcon:SetTexture("Interface\\PetBattles\\PetIcon-"..petInfo.suffix)

    self.StrongType:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[C.HINTS_DEFENSE[petInfo.petType][1]])
    self.WeakType:SetTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[C.HINTS_DEFENSE[petInfo.petType][2]])

    -- some elements hidden when pet card minimized
    local notMinimized = not settings.PetCardMinimized
    self.TypeName:SetShown(notMinimized)
    self.TypeIcon:SetShown(notMinimized)
    self.TypeNameDoodadLeft:SetShown(notMinimized)
    self.TypeNameDoodadRight:SetShown(notMinimized)
    self.Racial:SetShown(notMinimized)

    self.Back:SetDesaturated(not petInfo.isOwned)

    -- set height based on whether minimized and height of racial text
    local height
    if settings.PetCardMinimized then
        height = floor(C.PET_CARD_RACIAL_MINIMIZED_HEIGHT+0.5)
    else
        self.Racial:SetText(settings.PetCardMinimized and "" or petInfo.passive)
        height = floor((C.PET_CARD_RACIAL_NORMAL_HEIGHT + self.Racial:GetStringHeight())+0.5)
    end
    self:SetHeight(height)

    rematch.petCard.heights.racial = height
end

function rematch.petCard.Content.Back.Source:Update()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)
    local sourceText = petInfo.sourceText
    -- shrink font if source text is very long (some pets like spiders list nearly every zone in the game!)
    local sourceLength = (sourceText or ""):len()
    if sourceLength>0 then
        sourceText = sourceText:gsub("\124n$","")
        if settings.PetCardMinimized then -- if minimized, strip out newlines if minimized
            sourceText = sourceText:gsub("\124n"," ")
        end
    end
    if sourceLength>300 or settings.PetCardMinimized then
        self.Text:SetFontObject("GameFontHighlightSmall")
        if sourceLength>500 then -- if text is really really long, cut it short
            sourceText = sourceText:sub(1,500).."..."
        end
    else
        self.Text:SetFontObject("GameFontHighlight")
    end
    -- append expansion to the source (unless Show Expansion On Front is checked or there's no expansion)
    if not settings.PetCardShowExpansionStat and petInfo.expansionName then
        local padchar = settings.PetCardMinimized and " " or "\n"
        sourceText = sourceText..padchar.."\124cffffd200Expansion: "..rematch.utils:GetFormattedExpansionName(petInfo.expansionID)
    end
    if petInfo.isSpecialType then
        sourceText = nil
    elseif not petInfo.isObtainable then
        sourceText = L["This is an opponent pet."]
    end
    self.Text:SetText(sourceText)
    local height = floor((sourceText and self.Text:GetStringHeight()+C.PET_CARD_STAT_TOP_MARGIN*2+4 or 0)+0.5)
    self:SetHeight(height)

    rematch.petCard.heights.source = height
end

-- updates the middle back section of the card, flavor text about the pet
function rematch.petCard.Content.Back.Lore:Update()
    local petInfo = rematch.petInfo:Fetch(rematch.petCard.petID)
    local loreText = petInfo.loreText
    self.Text:SetFontObject(settings.BoringLoreFont and "SystemFont_Med1" or "RematchPetCardLoreFont")
    self.Text:SetText(loreText)
    self.Back:SetDesaturated(not petInfo.isOwned)
    if petInfo.isObtainable then
        self.Back:SetVertexColor(1,1,1)
    else
        self.Back:SetVertexColor(0.25,0.25,0.25)
    end
    local height = floor(((loreText and loreText:len()>0) and self.Text:GetStringHeight()+C.PET_CARD_STAT_TOP_MARGIN*2 or 0)+0.5)
    for _,doodad in pairs(self.CornerDoodads) do -- hide little bracket things if lore section too small
        doodad:SetShown(height>20)
        doodad:SetDesaturated(not petInfo.isOwned)
    end

    rematch.petCard.heights.lore = height
end

--[[ pet card supporting functions ]]

-- resets all changable heights of pet card sections
function rematch.petCard:ResetHeights()
    self.heights.top = 0
    self.heights.source = 0
    self.heights.lore = 0
    self.heights.racial = 0
    self.heights.abilities = 0
    self.heights.statsTop = 0
    self.heights.statsBottom = 0
end

-- returns true if the modifier key assigned to the flip key is down; or if key is given then whether that was a modifier key.
-- (MODIFIER_STATE_CHANGED will flip a card based on the flip key going up or down)
function rematch.petCard:IsFlipKeyUsed(key)
    local flipKey = settings.PetCardFlipKey

    if not key then -- if no key given, then check if a modifier key is down
        key = (IsAltKeyDown() and "ALT") or (IsShiftKeyDown() and "SHIFT") or (IsControlKeyDown() and "CTRL")
    end

    if flipKey=="None" then
        return false -- if flipkey is "None", don't bother
    elseif flipKey=="Alt" then
        return key=="LALT" or key=="RALT" or key=="ALT"
    elseif flipKey=="Shift" then
        return key=="LSHIFT" or key=="RSHIFT" or key=="SHIFT"
    elseif flipKey=="Ctrl" then
        return key=="LCTRL" or key=="RCTRL" or key=="CTRL"
    end
end

-- used by card manager, return true if the subject is a petID that has a card
function rematch.petCard:ShouldShow(subject)
    local petInfo = rematch.petInfo:Fetch(subject)
    return petInfo.idType~="empty" and petInfo.idType~="unknown" and type(petInfo.name)=="string"
end

-- returns a formatted list of possible breeds, or nil if not applicable
function rematch.petCard:GetPossibleBreedList(petInfo)
    if petInfo and petInfo.isObtainable and petInfo.canBattle and rematch.breedInfo:GetBreedSource() then
        local list
        if not petInfo.possibleBreedNames or #petInfo.possibleBreedNames==0 then
            list = UNKNOWN
        else
            list = table.concat(petInfo.possibleBreedNames,rematch.breedInfo:GetBreedFormat()==C.BREED_FORMAT_ICONS and " " or ", ")
        end
        return format("%s: \124cffe5e5e5%s",L["Possible Breeds"],list)
    end
end

-- returns a formatted Collected (0/3) along with the list of pets collected (rarity/level/breed)
local collectedPets = {} -- reused table of collected pets
function rematch.petCard:GetCollectedList(petInfo)
    if petInfo and petInfo.count and petInfo.isObtainable then
        local collected = petInfo.countColor..format(ITEM_PET_KNOWN,petInfo.count,petInfo.maxCount) -- Collected (0/3) bit
        if not petInfo.canBattle or petInfo.count==0 then
            return collected -- for non-battle or uncollected pets, don't list out levels and breeds, just collected count
        end
        wipe(collectedPets)
        for petID in rematch.roster:AllOwnedPets() do
            local altInfo = rematch.altInfo:Fetch(petID)
            if altInfo.speciesID==petInfo.speciesID then
                if altInfo.breedName then
					tinsert(collectedPets,format("%s%d %s",altInfo.color.hex,altInfo.level,altInfo.breedName))
				else
					tinsert(collectedPets,format("%s%s %d",altInfo.color.hex,LEVEL,altInfo.level))
				end
			end
<<<<<<< Updated upstream
        end
		return format("%s: %s",collected,table.concat(collectedPets,rematch.breedInfo:GetBreedFormat()==C.BREED_FORMAT_ICONS and " " or ", "))
    end
=======
		end
		info.Collected:SetText(format("%s: %s",collected,table.concat(collectedPets,rematch:GetBreedFormat()=="icon" and " " or ", ")))
		info.Collected:ClearAllPoints()
		info.Collected:SetPoint("BOTTOMLEFT",info,"BOTTOMLEFT",8,ybottom)
		ybottom = ybottom + info.Collected:GetStringHeight()+4
		info.Collected:Show()
	end

	local middle = card.Front.Middle

	-- update model in middle front of card
	if middle.ModelScene then
		middle.LevelingModel:Hide()
		if isSpecial then -- if this is a card for a leveling pet (or ignored or random)
			middle.ModelScene:Hide()
		local m2 = isSpecial=="ignored" and "Interface\\Buttons\\talktomered.m2" or isSpecial=="random" and "Interface\\Buttons\\talktomequestionmark.m2" or "Interface\\Buttons\\talktomequestion_ltblue.m2"
		C_Timer.After(0,function() -- not sure why this delay is necessary to set model
			middle.LevelingModel:Show()
			middle.LevelingModel:SetModel(m2)
		end)
		elseif petInfo.displayID~=card.displayID or card.forceSceneChange then
			middle.ModelScene:Show()
			middle.LevelingModel:Hide()
			card.displayID = petInfo.displayID
			local cardSceneID,loadoutSceneID = C_PetJournal.GetPetModelSceneInfoBySpeciesID(petInfo.speciesID)
			middle.ModelScene:TransitionToModelSceneID(cardSceneID, CAMERA_TRANSITION_TYPE_IMMEDIATE, CAMERA_MODIFICATION_TYPE_DISCARD, card.forceSceneChange)
			local actor = middle.ModelScene:GetActorByTag("unwrapped")
			if actor then
				actor:SetModelByCreatureDisplayID(petInfo.displayID)
				actor:SetAnimationBlendOperation(LE_MODEL_BLEND_OPERATION_NONE)
			end
			card.forceSceneChange = nil
			-- only PrepareForFanfare if fanfare ever observed to avoid loading Blizzard_Collections
			if petInfo.needsFanfare then
				middle.ModelScene:PrepareForFanfare(petInfo.needsFanfare)
			else -- if pet was previous wrapped and no longer needs fanfare, hide wrapped actor
				local wrappedActor = middle.ModelScene:GetActorByTag("wrapped")
				if wrappedActor then
					wrappedActor:Hide()
				end
			end
		end
	end

	-- stats along left of card
	card.statIndex = 1
	card.ypos = -4
	-- wipe existing stats
	for _,button in pairs(card.statButtons) do
		button:Hide()
	end
	-- add pet's real name in first line if it has a custom name
	if petInfo.customName then
		info.RealName:SetText(petInfo.speciesName)
		card.ypos = card.ypos - info.RealName:GetStringHeight() - 6
	end
	info.RealName:SetShown(petInfo.customName and true)

	-- revoked or can't summon get top billing
	if petInfo.isRevoked then
		card:AddStat(L["\124cffff0000Revoked"],"Interface\\Buttons\\UI-GroupLoot-Pass-Down",0,1,0,1,L["Revoked"],L["This pet has been revoked, which means Blizzard withdrew your ability to use this pet.\n\nThis commonly happens when a pets no longer meet a condition for ownership, such as the Core Hound Pup requiring an authenticator attached to the account."])
	end
	if not petInfo.isSummonable and petInfo.owned then
		card:AddStat(L["Can't Summon"],"Interface\\Buttons\\UI-GroupLoot-Pass-Down",0,1,0,1,L["Can't Summon"],L["This pet can't be summoned.\n\nA common reason is a faction restriction, such as the opposing faction's version of the Moonkin Hatchling."])
	end

	-- actual stats here
	if petInfo.idType=="pet" then -- this is a pet player owns
		if petInfo.isSlotted then
			card:AddStat(L["Slotted"],"Interface\\RaidFrame\\ReadyCheck-Ready",0,1,0,1,L["Slotted"],L["This pet is loaded in one of the three battle pet slots."])
		end
		if petInfo.isFavorite then
			card:AddStat(L["Favorite"],"Interface\\Common\\FavoritesIcon",0.125,0.71875,0.09375,0.6875,L["Favorite"],L["This pet is marked as a Favorite from its right-click menu."])
		end
	end
	if petInfo.canBattle and petInfo.power and petInfo.power>0 then
		local healthText = petInfo.health==0 and format("%s0/%d (%s)",rematch.hexRed,petInfo.maxHealth,DEAD) or petInfo.health<petInfo.maxHealth and format("%s%d/%d (%d%%)",rematch.hexRed,petInfo.health,petInfo.maxHealth,petInfo.health/petInfo.maxHealth*100) or petInfo.maxHealth
		card:AddStat(healthText,"Interface\\PetBattles\\PetBattle-StatIcons",0.5,1,0.5,1,PET_BATTLE_STAT_HEALTH,PET_BATTLE_TOOLTIP_HEALTH_MAX)
		card:AddStat(petInfo.power,"Interface\\PetBattles\\PetBattle-StatIcons",0,0.5,0,0.5,PET_BATTLE_STAT_POWER,PET_BATTLE_TOOLTIP_POWER)
		card:AddStat(petInfo.speed,"Interface\\PetBattles\\PetBattle-StatIcons",0,0.5,0.5,1,PET_BATTLE_STAT_SPEED,PET_BATTLE_TOOLTIP_SPEED)
		local r,g,b,hex = GetItemQualityColor(petInfo.rarity-1)
		card:AddStat(format("\124c%s%s",hex,_G["BATTLE_PET_BREED_QUALITY"..(min(6,petInfo.rarity))]),"Interface\\PetBattles\\PetBattle-StatIcons",0.5,1,0,0.5,PET_BATTLE_STAT_QUALITY,PET_BATTLE_TOOLTIP_RARITY)
		info.LevelBG:SetVertexColor(r,g,b)
	end

	if petInfo.breedName then
		card:AddStat(petInfo.breedName,"Interface\\AchievementFrame\\UI-Achievement-Progressive-Shield",0.09375,0.578125,0.140625,0.625,L["Breed"],format(L["Determines how stats are distributed.  All breed data is pulled from your installed %s%s\124r addon."],rematch.hexWhite,GetAddOnMetadata(rematch:GetBreedSource(),"Title") or rematch:GetBreedSource()))
	end

	if settings.ShowSpeciesID and petInfo.speciesID then
		card:AddStat(petInfo.speciesID,"Interface\\WorldMap\\Gear_64Grey",0.1,0.9,0.1,0.9,L["Species ID"],L["All versions of this pet share this unique \"species\" number."])
	end

	if petInfo.isLeveling then
		card:AddStat(L["Leveling"],"Interface\\AddOns\\Rematch\\Textures\\footnotes",0.125,0.25,0,0.25,L["Leveling"],L["This pet is in Rematch's leveling queue."])
	end

	if petInfo.inTeams then
	   	card:AddStat(format(L["%d Teams"],petInfo.numTeams),"Interface\\AddOns\\Rematch\\Textures\\footnotes",0.5,0.625,0.5,0.75,L["Teams"],format(L["%s Click to search for all teams that include this pet."],rematch.LMB),card.TeamsStatOnClick)
	end

	if petInfo.isObtainable then
		card:AddStat(SEARCH,"Interface\\Minimap\\Tracking\\None",0,1,0,1,SEARCH,format(L["%s Click to search for all versions of this pet."],rematch.LMB),card.SearchStatOnClick)
	end

	-- abilities
	--local teamSlot,teamKey = parent:GetID() -- if abilities from team list, get team's key
	local teamSlot, teamKey = parent.petSlot
	teamSlot = tonumber(teamSlot)
	if teamSlot and teamSlot>0 and teamSlot<4 then
		teamKey = parent:GetParent().key
	end

	local abilities = card.Front.Bottom.Abilities

	-- cleanup any previous abilities
	for i=1,6 do
		abilities[i]:Hide()
		abilities[i].Hint:Hide()
		card:DesaturateAbility(abilities[i],false)
	end
	
	if petInfo.canBattle then
		for i=1,6 do
			if petInfo.abilityList[i] then
				local _,abilityName,abilityIcon,_,abilityDescription,_,abilityType,noHints = C_PetBattles.GetAbilityInfoByID(petInfo.abilityList[i])
				if abilityName then
					abilities[i].abilityID = petInfo.abilityList[i]
					abilities[i].Name:SetText(abilityName)
					abilities[i].Icon:SetTexture(abilityIcon)
					rematch:FillPetTypeIcon(abilities[i].Type,abilityType)
					abilities[i]:Show()
					-- desaturate unused pets if this is for a team pet in the team list
					if teamKey then
						local found
						for j=1,3 do
							if RematchSaved[teamKey][teamSlot][j+1]==petInfo.abilityList[i] then
								found = true
							end
						end
						if not found then
							card:DesaturateAbility(abilities[i],true)
						end
					end
					-- for battle unit frames, UpdatePetCardAbility will show strong/weak hints and return true if not found
					if parent:GetParent()==PetBattleFrame and C_PetBattles.IsPlayerNPC(2) and rematch.Battle:UpdatePetCardAbility(abilities[i],petInfo.abilityList[i],abilityType,parent.petOwner,parent.petIndex) then
						card:DesaturateAbility(abilities[i],true)
					end
					-- show search hits if this is for the pet panel (and if any filters apply)
					if forPetPanel then
						if roster.searchMask and roster.searchMask~="" and abilityDescription and (abilityName:match(roster.searchMask) or abilityDescription:match(roster.searchMask)) then
							-- if name or description matches search, show its SearchHit silver border
							abilities[i].SearchHit:Show()
						elseif roster:IsFilterUsed("Similar") and roster:GetFilter("Similar",petInfo.abilityList[i]) then
							-- if "Similar" filter used and this ability is among the abilities, show its SearchHit
							abilities[i].SearchHit:Show()
						elseif roster:IsFilterUsed("Strong") and not noHints then
							-- show the SearchHit if this ability is Strong Vs the filtered types
							for typeIndex in pairs(settings.Filters.Strong) do
								if rematch.hintsDefense[typeIndex][1] == abilityType then
									abilities[i].SearchHit:Show()
								end
							end
						end
					end
				end
			end
		end
	end
	card.Front.Bottom.CantBattle:SetShown(not petInfo.canBattle)
	if isSpecial=="leveling" then
		card.Front.Bottom.CantBattle:SetText(L["When this team loads, your current leveling pet will go in this spot."])
   elseif isSpecial=="ignored" then
      card.Front.Bottom.CantBattle:SetText(L["When this team loads, this spot will be ignored."])
   elseif isSpecial=="random" then
      card.Front.Bottom.CantBattle:SetText(L["When this team loads, a random high level pet will go in this spot."])
	else
		card.Front.Bottom.CantBattle:SetText(BATTLE_PET_CANNOT_BATTLE)
	end

	-- finally if this is for the pet panel, see if search hit should be shown on title buttons
	if forPetPanel then
		-- show search hit on pet icon if search text is in pet's sourceText
		if roster.searchMask and ((sourceText or ""):match(roster.searchMask) or (petInfo.name or ""):match(roster.searchMask) or (petInfo.customName or ""):match(roster.searchMask)) then
			card.Title.Icon.SearchHit:Show()
		end
		-- show search hit on type icon if "Touch vs" or "Types" filter used
		if roster:IsFilterUsed("Tough") or roster:IsFilterUsed("Types") then
			card.Title.Type.SearchHit:Show()
		end
	end

	--[[ Back ]]

	local backHeight = 0 -- measuring height of back of card too in case lore needs more room
	if not isSpecial then -- leveling pets have no back of card
		local sourceText = petInfo.sourceText
		if petInfo.expansionID then
			sourceText = sourceText .. "\n\124cffffd200" .. EXPANSION_FILTER_TEXT .. ":\124r " .. petInfo.expansionName
		end
		-- shrink font if source text is very long (some pets like spiders list nearly every zone in the game!)
		local sourceLength = (sourceText or ""):len()
		if sourceLength>300 then
			card.Back.Source.Text:SetFontObject("GameFontHighlightSmall")
			if sourceLength>500 then -- if text is really really long, cut it short
				sourceText = sourceText:sub(1,500).."..."
			end
		else
			card.Back.Source.Text:SetFontObject("GameFontHighlight")
		end
		if not petInfo.isObtainable then
			sourceText = L["This is an opponent pet."]
		end

		rematch:FillPetTypeIcon(card.Back.Bottom.StrongType,rematch.hintsDefense[petInfo.petType][1],"Interface\\PetBattles\\PetIcon-")
		rematch:FillPetTypeIcon(card.Back.Bottom.WeakType,rematch.hintsDefense[petInfo.petType][2],"Interface\\PetBattles\\PetIcon-")

		card.Back.Source.Text:SetText(format("%s%s%s",sourceText,petInfo.isTradable and "" or "\n\124cffff0000"..BATTLE_PET_NOT_TRADABLE,petInfo.isUnique and "\n\124cffffd200"..ITEM_UNIQUE or ""))
		local sourceHeight = card.Back.Source.Text:GetStringHeight()+16
		card.Back.Source:SetHeight(sourceHeight)
		card.Back.Middle.Lore:SetText(petInfo.loreText)
		card.Back.Bottom.TypeName:SetText(_G["BATTLE_PET_NAME_"..petInfo.petType])
		rematch:FillPetTypeIcon(card.Back.Bottom.TypeIcon,petInfo.petType,"Interface\\PetBattles\\PetIcon-")
		local racial = select(5,C_PetBattles.GetAbilityInfoByID(PET_BATTLE_PET_TYPE_PASSIVES[petInfo.petType]))
		racial = racial:match("^.-\r\n(.-)\r"):gsub("%[percentage.-%]%%","4%%")
		card.Back.Bottom.Racial:SetText(racial)
		local bottomHeight = card.Back.Bottom.Racial:GetStringHeight()+104
		card.Back.Bottom:SetHeight(bottomHeight)
		-- total heights of back components; will stretch card height to fit this if needed
		backHeight = 78 + sourceHeight + bottomHeight + card.Back.Middle.Lore:GetStringHeight()+24
	end

	--[[ Leftovers ]]

	-- desaturate BGs for missing pets
	if petInfo.idType=="pet" then
		card.Title.TitleBG:SetDesaturated(false)
		card.Front.Bottom.AbilitiesBG:SetDesaturated(false)
		card.Back.Bottom.BottomBG:SetDesaturated(false)
	else
		card.Title.TitleBG:SetDesaturated(true)
		card.Front.Bottom.AbilitiesBG:SetDesaturated(true)
		card.Back.Bottom.BottomBG:SetDesaturated(true)
	end

	-- adjust abilities for pets with only 3 abilities (unobtainable ones, but not always)
	-- example: Manos/Fatos/Hanos have 3 abilities each; Erris' Sprouts/Runts/Prince Charming have 6
	-- however some opponent pets have weird abilitylists: Kiazor the Destroyer has 1,2,5; Scuttles has 1,2,4!
	-- so both columns will show if there's any ability in the 4th, 5th or 6th slot
	local bothColumns = petInfo.abilityList and (petInfo.abilityList[4] or petInfo.abilityList[5] or petInfo.abilityList[6]) and true
	for i=1,3 do
		local abilityOffset = bothColumns and 7 or 54
		local abilityWidth = bothColumns and 114 or 140
		card.Front.Bottom.Abilities[i]:SetPoint("BOTTOMLEFT",abilityOffset,(3-i)*34+7)
		card.Front.Bottom.Abilities[i]:SetWidth(abilityWidth)
	end

	-- position the card
	card:UpdateLockState()
	card:ClearAllPoints()
	if parent==FloatingBattlePetTooltip then -- if parent is the "link" pet card
		if settings.PetCardItemRefXPos then
			card:SetPoint("CENTER",UIParent,"BOTTOMLEFT",settings.PetCardItemRefXPos,settings.PetCardItemRefYPos)
		else
			card:SetPoint("CENTER",UIParent,"CENTER",0,-200)
		end
		card.PinButton:Hide()
	elseif settings.FixedPetCard and settings.PetCardXPos then -- otherwise if the card is pinned
		card:SetPoint("CENTER",UIParent,"BOTTOMLEFT",settings.PetCardXPos,settings.PetCardYPos)
		card.PinButton:Show()
	elseif parent:GetParent()==PetBattleFrame then -- otherwise if this card is for a battle UI unit
		rematch.Battle:AnchorPetCardToBattleUnit(parent)
		card.PinButton:Hide()
	else -- for all others do a smart anchor to the parent
		rematch:SmartAnchor(card,parent,nil,22)
		card.PinButton:Hide()
	end
	-- adjust card height to fit max of front height, back height or 416(standard size)
	if middle.ModelScene then
		card:SetHeight(max(190+max(abs(card.ypos),middle.ModelScene:GetHeight()+2)+ybottom,backHeight,416))
	else
		card:SetHeight(max(190+abs(card.ypos)+ybottom,backHeight,416))
	end

	-- save parent and petID to recreate card if needed
	card.parent = parent
	card.petID = petID

	-- show the card
	card:FlipCardIfAltDown()
	rematch:AdjustScale(card)
	card:Show()
>>>>>>> Stashed changes
end

-- releases all stat buttons from the button pool
function rematch.petCard:ReleaseStatButtons()
    for _,button in ipairs(self.Content.Front.Stats.Buttons) do
        button.isUsed = nil
        button:Hide()
    end
end

-- creates and returns a stat button from the button pool
function rematch.petCard:GetStatButton()
    local parent = self.Content.Front.Stats
    for _,button in ipairs(parent.Buttons) do
        if not button.isUsed then
            button.isUsed = true
            return button
        end
    end
    -- if reached here, all existing buttons used, create a new one
    local button = CreateFrame("Button",nil,parent,"RematchPetCardStatTemplate")
    tinsert(parent.Buttons,button)
    button.isUsed = true
    return button
end

-- fetches a stat button and fills its icon, text to the rematch.petCardStats[statIndex] for the petInfo
-- returns the button if fetched so the calling function can anchor it
function rematch.petCard:CreateStatButton(button,statIndex,petInfo)
    local button = rematch.petCard:GetStatButton()
    local info = rematch.petCardStats[statIndex]
    assert(type(info)=="table","Malformed stat at index "..(statIndex or "nil"))
    button:SetID(statIndex)

    button.Icon:SetTexture(rematch.utils:Evaluate(info.icon,rematch.petCard,petInfo))
    local left,right,top,bottom = 0,1,0,1
    if info.iconCoords then
        if type(info.iconCoords)=="function" then
            left,right,top,bottom = info.iconCoords(rematch.petCard,petInfo)
        elseif type(info.iconCoords)=="table" and #info.iconCoords==4 then
            left,right,top,bottom = info.iconCoords[1],info.iconCoords[2],info.iconCoords[3],info.iconCoords[4]
        end
    end
    button.Icon:SetTexCoord(left,right,top,bottom)
    button.Text:SetWidth(0)
    button.Text:SetText(rematch.utils:Evaluate(info.value,rematch.petCard,petInfo))
    local textWidth = button.Text:GetStringWidth()
    if textWidth > 175 then -- 175 width max to text to prevent running over edge of card
        button.Text:SetWidth(175)
    end
    button:SetWidth(max(C.PET_CARD_STAT_WIDTH_MEDIUM,20+min(textWidth,175)+2))
    return button
end

-- shows the breed table (tooltip-like frame displaying possible breeds and their stats for each breed)
function rematch.petCard:ShowBreedTable(parent)
    local btable = rematch.petCard.Content.Front.Stats.BreedTable

    local petInfo = rematch.petInfo:Fetch(self.petID)
    local breedTable = rematch.breedInfo:GetBreedTable(petInfo.speciesID)
    local petBreed = petInfo.breedID

	for _,row in ipairs(btable.Rows) do
		row:Hide()
	end
    btable.Highlight:Hide()

    for index,info in ipairs(breedTable) do
        if not btable.Rows[index] then
            btable.Rows[index] = CreateFrame("Frame",nil,btable,"RematchBreedTableRowTemplate")
            btable.Rows[index]:SetPoint("TOPLEFT",8,-50-(index-1)*16)
        end
		local row = btable.Rows[index]
		row.Breed:SetText(rematch.breedInfo:GetBreedNameByID(info[1]))
		row.Health:SetText(info[2])
		row.Power:SetText(info[3])
		row.Speed:SetText(info[4])

        if petBreed==info[1] then -- if breed in row is same as pet card pet, then highlight it
            btable.Highlight:SetPoint("TOPLEFT",row,2,0)
            btable.Highlight:SetPoint("BOTTOMRIGHT",row,-2,0)
            btable.Highlight:Show()
        end
        row:Show()
    end

    -- if no breeds known, display "No known breeds :("
    if #breedTable==0 then
        btable.NoBreeds:Show()
        btable:SetHeight(32+87)
    else -- otherwise adjust height based on number of breeds listed
        btable.NoBreeds:Hide()
        btable:SetHeight(16*#breedTable+87)
    end

    -- position tooltip-like window next to the parent (breed stat button or possible breeds text)
    btable:ClearAllPoints()
    local corner,opposite = rematch.utils:GetCorner(rematch.utils:GetFrameForReference(parent),UIParent)
    btable:SetPoint(corner,parent,opposite)

    btable:Show()
end

function rematch.petCard:HideBreedTable()
    rematch.petCard.Content.Front.Stats.BreedTable:Hide()
end

--[[ titlebar button clicks ]]

function rematch.petCard.PinButton:OnClick()
    rematch.cardManager:Unpin(self:GetParent())
end

function rematch.petCard.FlipButton:OnClick()
    rematch.petCard.hardFlip = false
    rematch.petCard:Update()
end

function rematch.petCard.MinimizeButton:OnClick()
    settings.PetCardMinimized = not settings.PetCardMinimized
    self:GetParent():Configure()
    self:GetParent():Update()
end

--[[ script handlers ]]

function rematch.petCard:OnMouseDown()
    rematch.cardManager.OnMouseDown(self)
end

function rematch.petCard:OnMouseUp()
    rematch.cardManager.OnMouseUp(self)
end

function rematch.petCard:OnDoubleClick()
    self.MinimizeButton:OnClick()
end

function rematch.petCard:OnShow()
    rematch.events:Register(self,"MODIFIER_STATE_CHANGED",self.MODIFIER_STATE_CHANGED)
end

function rematch.petCard:OnHide()
    rematch.events:Unregister(self,"MODIFIER_STATE_CHANGED")
    self.softFlip = false
    self.hardFlip = false
    rematch.petCard:UpdateLock()
end

function rematch.petCard.Content.Front.Stats.PossibleBreeds:OnEnter()
    self.Highlight:Show()
    rematch.petCard:ShowBreedTable(self)
end

function rematch.petCard.Content.Front.Stats.PossibleBreeds:OnLeave()
    self.Highlight:Hide()
    rematch.petCard:HideBreedTable()
end

--[[ seach hits ]]

function rematch.petCard:UpdateSearchHits()
    local petInfo = rematch.petInfo:Fetch(self.petID)
    self.Content.Top.PetIcon.SearchHit:SetShown(self:IsPetNameSearchHit(petInfo))
    self.Content.Top.TypeIcon.SearchHit:SetShown(self:IsPetTypeSearchHit(petInfo))
    local abilityList = petInfo.abilityList
    if abilityList then
        for i=1,#abilityList do
            self.Content.Front.Abilities.Buttons[i].SearchHit:SetShown(self:IsAbilitySearchHit(petInfo,abilityList[i]))
        end
    end
end

-- returns true if a search is happening and the speciesName, customName or sourceText match the search
function rematch.petCard:IsPetNameSearchHit(petInfo)
    local pattern = rematch.filters:Get("Search","Pattern")
    if pattern then
        if petInfo.speciesName and petInfo.speciesName:match(pattern) then
            return true
        elseif petInfo.customName and petInfo.customName:match(pattern) then
            return true
        elseif petInfo.sourceText and petInfo.sourceText:match(pattern) then
            return true
        end
    end
    return false
end

-- returns true if a Type or Tough Vs filter is happening and the pet type is one of the results
function rematch.petCard:IsPetTypeSearchHit(petInfo)
    if petInfo.petType and rematch.filters:Get("Types",petInfo.petType) then
        return true
    elseif petInfo.toughVs and rematch.filters:Get("Tough",petInfo.toughVs) then
        return true
    end
    return false
end

-- returns true if a search is happening and the abilityName or abilityDescription matches the search,
-- or a StrongVs or Similar filter is happening and the ability is one of the results
function rematch.petCard:IsAbilitySearchHit(petInfo,abilityID)
    if not abilityID then
        return false
    end
    local pattern = rematch.filters:Get("Search","Pattern")
    local _,name,_,_,description,_,petType,noHints = C_PetBattles.GetAbilityInfoByID(abilityID)
    if pattern then
        if name and name:match(pattern) then
            return true
        elseif description and description:match(pattern) then
            return true
        end
    end
    if petInfo.strongVs and petInfo.strongVs[abilityID] and rematch.filters:Get("Strong",petInfo.strongVs[abilityID]) then
        return true
    elseif rematch.filters:Get("Similar",abilityID) then
        return true
    end
    return false
end

-- returns the teamID,ability1,ability,ability3 for the pet the pet card is anchored to, if any
function rematch.petCard:GetTeamInfo()
    if self:IsVisible() then
        local relativeTo = rematch.cardManager:GetRelativeTo(rematch.petCard)
        local teamID = relativeTo and relativeTo.teamID
        local team = teamID and rematch.savedTeams[teamID]
        if team then
            for i=1,3 do
                if team.pets[i]==self.petID then
                    -- found pet in team, return teamID and abilities used for this pet
                    --local ability1,ability2,ability3 = rematch.petTags:GetAbilities(team.tags[i])
                    return teamID,rematch.petTags:GetAbilities(team.tags[i]) -- returns teamID,ability1,ability2,ability3
                end
            end
            -- if reached here, didn't find the pet, just return teamID
            return teamID
        end
    end
end

-- hook of the function that calls SetItemRef to show the FloatingBattlePetTooltip
-- note the dot notation! (SetItemRef doesn't pass a parent frame)
function rematch.petCard.SetItemRef(link,text,button)
    if settings.PetCardForLinks and not IsModifiedClick("CHATLINK") and link:match("battlepet:%d+:%d+:%d+:%d+:%d+:%d+:.+") then
		FloatingBattlePetTooltip:Hide()
        local petID = link:match("(BattlePet-%d-[^:]+)") -- pull out petID from link if there is one
        local petInfo = rematch.petInfo:Fetch(petID)
        if petInfo.isOwned then
            link = petID -- the linked pet is owned, show the card for owned pet rather than link
        end
        if not rematch.petCard:IsVisible() or rematch.petCard.petID~=link then
            rematch.cardManager:SetItemRefMode(rematch.petCard)
            rematch.cardManager:ShowCard(rematch.petCard,link)
        else
            rematch.cardManager:HideCard(rematch.petCard)
        end
    end
end

