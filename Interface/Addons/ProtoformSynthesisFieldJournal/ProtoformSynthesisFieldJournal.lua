local psfj = ProtoformSynthesisFieldJournal

BINDING_HEADER_PROTOFORMSYNTHESISFIELDJOURNAL = "Protoform Synthesis Field Journal"
BINDING_NAME_PROTOFORMSYNTHESISFIELDJOURNAL_TOGGLE = "Toggle Window"

SLASH_PROTOFORMSYNTHESISFIELDJOURNAL1 = "/psfj"
SlashCmdList["PROTOFORMSYNTHESISFIELDJOURNAL"] = function() psfj:Toggle() end

-- indexed by itemID, this is the data about each craftable itemID
-- some data is generated in the PreUpdate function: itemName, moteCount, glimmerName, glimmerCount, etc
psfj.data = {
    [189369] = {speciesID=3179,moteCost=300,glimmerID=189157,latticeID=189146}, -- Archetype of Animation
    [189380] = {speciesID=3207,moteCost=300,glimmerID=189158,latticeID=189155}, -- Archetype of Cunning
    [187795] = {speciesID=3174,moteCost=300,glimmerID=189159,latticeID=189156}, -- Archetype of Discovery
    [187713] = {speciesID=3169,moteCost=300,glimmerID=189160,latticeID=189153}, -- Archetype of Focus
    [189383] = {speciesID=3211,moteCost=300,glimmerID=189161,latticeID=189154}, -- Archetype of Malice
    [187928] = {speciesID=3197,moteCost=300,glimmerID=189162,latticeID=187634}, -- Archetype of Metamorphosis
    [187803] = {speciesID=3178,moteCost=300,glimmerID=189163,latticeID=189149}, -- Archetype of Motion
    [189375] = {speciesID=3189,moteCost=300,glimmerID=189164,latticeID=189147}, -- Archetype of Multiplicity
    [189381] = {speciesID=3201,moteCost=300,glimmerID=189165,latticeID=189152}, -- Archetype of Predation
    [189371] = {speciesID=3229,moteCost=300,glimmerID=189166,latticeID=187636}, -- Archetype of Renewal
    [189367] = {speciesID=3220,moteCost=300,glimmerID=189167,latticeID=189148}, -- Archetype of Satisfaction
    [189382] = {speciesID=3181,moteCost=300,glimmerID=189168,latticeID=187633}, -- Archetype of Serenity
    [189364] = {speciesID=3204,moteCost=300,glimmerID=189169,latticeID=189151}, -- Archetype of Survival
    [189377] = {speciesID=3233,moteCost=300,glimmerID=189170,latticeID=189145}, -- Archetype of Vigilance
    [189363] = {speciesID=3223,questID=65327,moteCost=250,glimmerID=189160,latticeID=187634}, -- Ambystan Darter
    [189365] = {speciesID=3224,questID=65332,moteCost=400,glimmerID=189163,latticeID=189151}, -- Fierce Scarabid
    [189374] = {speciesID=3232,questID=65357,moteCost=250,glimmerID=189166,latticeID=189147}, -- Leaping Leporid
    [189376] = {speciesID=3235,questID=65358,moteCost=150,glimmerID=189167,latticeID=189145}, -- Microlicid
    [189368] = {speciesID=3226,questID=65333,moteCost=350,glimmerID=189164,latticeID=189148}, -- Multichicken
    [187734] = {speciesID=3171,questID=65348,moteCost=350,glimmerID=189157,latticeID=189153}, -- Omnipotential Core
    [189373] = {speciesID=3231,questID=65354,moteCost=450,glimmerID=189159,latticeID=187636}, -- Prototickles
    [187733] = {speciesID=3170,questID=65351,moteCost=250,glimmerID=189169,latticeID=189153}, -- Resonant Echo
    [189378] = {speciesID=3222,questID=65359,moteCost=450,glimmerID=189168,latticeID=189145}, -- Shelly
    [189370] = {speciesID=3227,questID=65336,moteCost=400,glimmerID=189162,latticeID=189146}, -- Stabilized Geomental
    [189372] = {speciesID=3230,questID=65355,moteCost=400,glimmerID=189165,latticeID=187636}, -- Terror Jelly
    [187798] = {speciesID=3176,questID=65361,moteCost=350,glimmerID=189158,latticeID=189156}, -- Tunnel Vombata
    [189366] = {speciesID=3225,questID=65334,moteCost=200,glimmerID=189161,latticeID=189148}, -- Violent Poultrid
    [189379] = {speciesID=3234,questID=65360,moteCost=150,glimmerID=189170,latticeID=189155}, -- Viperid Menace
}

psfj.list = {} -- ordered list of itemIDs for display in the autoscrollframe

-- indexed by itemIDs, lookup table for reagents of interest (motes, glimmers, lattices)
psfj.reagents = {[188957] = true} -- 188957 is Genesis Mote
for _,info in pairs(psfj.data) do
    psfj.reagents[info.glimmerID] = true
    psfj.reagents[info.latticeID] = true
end

-- indexed by itemID, the count of that itemID in the reagent bank; only reagent itemIDs are tracked
psfj.bank = {}

-- called from slash command and bindings.xml, summons/dismisses the window
function psfj:Toggle()
    psfj:SetShown(not psfj:IsShown())
end

-- populates the list of items and updates the list; call whenever showing the window or anything has changed
-- if the reagent bank has possibly changed (showing for first time, reagent bank event) set updateReagentBank
function psfj:Update(updateReagentBank)
    if updateReagentBank then
        self:UpdateReagentBank()
    end
    psfj:PopulateList()
    psfj.List:Update()
end

--[[ events ]]

function psfj:PLAYER_LOGIN()
    -- adjust frame
    self.TitleText:SetText("Protoform Synthesis Field Journal")
    self.TitleText:SetPoint("TOP",-6,-5)
    self:SetMinResize(256,196)
    self:SetMaxResize(1024,768)

    -- setup autoscrollframe
    local scrollFrame = self.List
    scrollFrame.template = "ProtoformSynthesisFieldJournalListTemplate"
    scrollFrame.callback = self.FillListButton
    scrollFrame.preUpdateFunc = self.GatherButtonData
    scrollFrame.dynamicButtonHeight = self.GetButtonHeight
    scrollFrame.list = self.list

    -- add esc behavior: if dressupframe open, let esc go through to close it; otherwise close
    self.CloseButton:SetScript("OnKeyDown",function(self,key)
        if key==GetBindingKey("TOGGLEGAMEMENU") and not DressUpFrame:IsVisible() then
            self:SetPropagateKeyboardInput(false)
            self:Click() -- close
        else
            self:SetPropagateKeyboardInput(true)
        end
    end)

    -- broker launcher plugin
    local ldb = LibStub and LibStub.GetLibrary and LibStub:GetLibrary("LibDataBroker-1.1",true)
    if ldb then
        ldb:NewDataObject("ProtoformSynthesisFieldJournal",{type="launcher", icon="Interface\\Icons\\inv_progenitor_protoformsynthesis", tooltiptext="Protoform Synthesis Field Journal", OnClick=psfj.Toggle}) 
    end

end

-- these are only registered while window on screen and simply update the list
function psfj:BAG_UPDATE_DELAYED()
    self:Update()
end
psfj.QUEST_TURNED_IN = psfj.BAG_UPDATE_DELAYED
psfj.QUEST_LOG_UPDATE = psfj.BAG_UPDATE_DELAYED

-- this is only registered while window on screen and updates the reagent bank while it updates the list
function psfj:PLAYERREAGENTBANKSLOTS_CHANGED()
    self:Update(true)
end

-- if a dressup modifier key goes down or up while mouse is over the list
function psfj:MODIFIER_STATE_CHANGED()
    if MouseIsOver(self.List) then
        for _,button in ipairs(self.List.ScrollFrame.Buttons) do
            if GetMouseFocus()==button then
                if IsModifiedClick("DRESSUP") then
                    ShowInspectCursor()
                else
                    ResetCursor()
                end
                return
            end
        end
    end
end

--[[ list ]]

-- fills the autoscrollframe reference list with itemIDs in the order they should be displayed
function psfj:PopulateList()
    local list = psfj.list
    -- no itemID is ever added or removed from the list after the first time; so only need to populate just once
    if #list==0 then
        for itemID,info in pairs(psfj.data) do
            tinsert(list,itemID)
        end
    end
    -- but we do want to sort it every time new schematics are possibly learned or names cached
    table.sort(list,psfj.SortList)
end

-- table.sort function used in PopulateList; sort known items to top then by name
function psfj.SortList(e1,e2)
    local info1 = psfj.data[e1]
    local info2 = psfj.data[e2]

    if info1 and not info2 then
        return true
    elseif not info1 and info2 then
        return false
    end

    -- sort known to top
    if info1.questID and not info2.questID then
        return false
    elseif not info1.questID and info2.questID then
        return true
    elseif info1.questID and info2.questID then
        local complete1 = C_QuestLog.IsQuestFlaggedCompleted(info1.questID)
        local complete2 = C_QuestLog.IsQuestFlaggedCompleted(info2.questID)
        if complete1 and not complete2 then
            return true
        elseif not complete1 and complete2 then
            return false
        end
    end

    -- sort by name next
    if info1.itemName and not info2.itemName then
        return true
    elseif not info1.itemName and info2.itemName then
        return false
    elseif info1.itemName~=info2.itemName then
        return info1.itemName < info2.itemName
    end

    -- if we reached here, likely the names were not cached, do a stable sort by itemID
    return e1 < e2
end

-- called from the autoscrollframe Update, this fills in each button(self) details for the given itemID
function psfj:FillListButton(itemID)
    local info = psfj.data[itemID]
    self.itemID = itemID
    self.speciesID = info.speciesID
    -- fill in icon and texts
    self.Icon:SetTexture(info.icon)
    self.Name:SetText(info.itemName)
    self.MoteButton.Text:SetText(info.moteText)
    self.GlimmerButton.Text:SetText(info.glimmerText)
    self.LatticeButton.Text:SetText(info.latticeText)
    -- desaturate/color stuff based on whether this is a known/unknown item
    local isUnknown = info.questID and not C_QuestLog.IsQuestFlaggedCompleted(info.questID) or false
    self.Icon:SetDesaturated(isUnknown)
    self.MoteButton.Icon:SetDesaturated(isUnknown)
    self.GlimmerButton.Icon:SetDesaturated(isUnknown)
    self.LatticeButton.Icon:SetDesaturated(isUnknown)
    self.MoteButton.Border:SetDesaturated(isUnknown)
    self.GlimmerButton.Border:SetDesaturated(isUnknown)
    self.LatticeButton.Border:SetDesaturated(isUnknown)
    self.Name:SetTextColor(psfj:GetButtonTextColor(isUnknown))
    self.MoteButton.Text:SetTextColor(psfj:GetButtonTextColor(isUnknown,info.moteCount))
    self.GlimmerButton.Text:SetTextColor(psfj:GetButtonTextColor(isUnknown,info.glimmerCount))
    self.LatticeButton.Text:SetTextColor(psfj:GetButtonTextColor(isUnknown,info.latticeCount))
    -- resize elements based on framewidth
    self.Name:SetWidth(psfj.maxNameWidth+psfj.padding)
    if psfj.alignReagents then -- if room for reagents to be aligned, use max width
        self.MoteButton:SetWidth(psfj.maxMoteWidth+24+psfj.padding)
        self.GlimmerButton:SetWidth(psfj.maxGlimmerWidth+24+psfj.padding)
        self.LatticeButton:SetWidth(psfj.maxLatticeWidth+24+psfj.padding)
    else -- otherwise use just enough width for reagent text + icon + padding
        self.MoteButton:SetWidth(info.moteWidth+24)
        self.GlimmerButton:SetWidth(info.glimmerWidth+24)
        self.LatticeButton:SetWidth(info.latticeWidth+24)
    end
    self.MoteButton:ClearAllPoints()
    if psfj.wideMode then -- if room for reagents to list to right of name, move reagents there
        self.Icon:SetSize(18,18)
        self.IconMask:SetSize(18,18)
        self.Name:SetPoint("LEFT",26,0)
        self.MoteButton:SetPoint("LEFT",self.Name,"RIGHT",4,0)
    else -- otherwise position reagents beneath name
        self.Icon:SetSize(42,42)
        self.IconMask:SetSize(42,42)
        self.Name:SetPoint("LEFT",48,9)
        self.MoteButton:SetPoint("BOTTOMLEFT",48,7)
    end
end

-- rather than calculate values in the FillListButton(), this gathers data for all rows
-- before the list updates, so it can set a max width for variable-width text fields
function psfj:GatherButtonData()
    local notCached = false
    local needsSorted = false
    psfj.maxNameWidth = 0
    psfj.maxMoteWidth = 0
    psfj.maxGlimmerWidth = 0
    psfj.maxLatticeWidth = 0
    local notCached = false
    -- gather data for each itemID in the data
    for itemID,info in pairs(psfj.data) do
        -- names may not be cached (especially on cold login); names can be nil until cached
        if not info.itemName then
            info.itemName = GetItemInfo(itemID)
            if not info.itemName then
                notCached = true
            else
                needsSorted = true -- name loaded for first time, names need sorted
            end
        end
        if not info.glimmerName then
            info.glimmerName = GetItemInfo(info.glimmerID)
            if not info.glimmerName then
                notCached = true
            else -- strip out "Glimmer of " of glimmer name on English clients
                info.glimmerName = info.glimmerName:gsub("Glimmer of ","")
            end
        end
        if not info.latticeName then
            info.latticeName = GetItemInfo(info.latticeID)
            if not info.latticeName then
                notCached = true
            else -- strip out " Lattice" of lattice name on English clients
                info.latticeName = info.latticeName:gsub(" Lattice","")
            end
        end
        if not info.icon then
            info.icon = select(5,GetItemInfoInstant(itemID))
        end
        info.moteCount = psfj:GetItemCount(188957)
        info.glimmerCount = psfj:GetItemCount(info.glimmerID)
        info.latticeCount = psfj:GetItemCount(info.latticeID)

        info.moteText = format("%d/%d ",info.moteCount,info.moteCost)
        info.glimmerText = format("%d/1 %s",info.glimmerCount,info.glimmerName or "")
        info.latticeText = format("%d/1 %s",info.latticeCount,info.latticeName or "")

        info.nameWidth = psfj:UpdateMaxWidth("maxNameWidth",info.itemName)
        info.moteWidth = psfj:UpdateMaxWidth("maxMoteWidth",info.moteText)
        info.glimmerWidth = psfj:UpdateMaxWidth("maxGlimmerWidth",info.glimmerText)
        info.latticeWidth = psfj:UpdateMaxWidth("maxLatticeWidth",info.latticeText)
    end
    -- the purpose of doing everything was to get max widths. the following notes adjustments based on that
    local frameWidth = psfj:GetWidth()
    local reagentWidth = psfj.maxMoteWidth+psfj.maxGlimmerWidth+psfj.maxLatticeWidth
    psfj.alignReagents = (frameWidth-reagentWidth)>163 -- if wide enough to let reagents have fixed width
    psfj.wideMode = (frameWidth-reagentWidth-psfj.maxNameWidth)>148 -- if wide enough to let reagents list to right of itemName
    -- padding is a small space added to widths so cells take up more space when it widens beyond minimum thresholds
    psfj.padding = max(0,psfj.wideMode and (frameWidth-psfj.maxNameWidth-reagentWidth-148)/4 or (frameWidth-reagentWidth-163)/3)
    if notCached then -- if any names are blank, come back in half a second to try again
        C_Timer.After(0.5,psfj.Update)
    elseif needsSorted then
        table.sort(psfj.list,psfj.SortList) 
    end
end

-- sets the text to a hidden and unbounded fontstring to get and record its max width
-- element can be "maxNameWidth","maxMoteWidth","maxGlimmerWidth","maxLatticeWidth"
function psfj:UpdateMaxWidth(element,text)
    if not text then
        return 0
    end
    local width
    if element=="maxNameWidth" then
        self.HiddenNameFontString:SetText(text)
        width = self.HiddenNameFontString:GetStringWidth()
        self[element] = max(self[element],width)
    else
        self.HiddenReagentFontString:SetText(text)
        width = self.HiddenReagentFontString:GetStringWidth()
        self[element] = max(self[element],width)
    end
    return width
end

-- returns r,g,b for the color of text on a button based on whether it's known and has a count
function psfj:GetButtonTextColor(unknown,count)
    if unknown then -- whether a name or reagent, grey text if unknown
        return 0.5,0.5,0.5
    elseif not count then -- known but a name (no count), gold text
        return 1,0.82,0
    elseif count > 0 then -- known reagent with more than 0, white text
        return 0.9,0.9,0.9
    else -- known reagent with count==0, grey text
        return 0.5,0.5,0.5
    end
end

-- dynamicButtonHeight for autoscrollframe just returns height based on wideMode
function psfj:GetButtonHeight(index)
    return psfj.wideMode and 24 or 48
end

--[[ item counts ]]

-- populates psfj.bank with the count of reagents in the reagent bank
function psfj:UpdateReagentBank()
    wipe(psfj.bank)
    for i=1,GetContainerNumSlots(-3) do
        local itemID = GetContainerItemID(-3,i)
        if itemID and psfj.reagents[itemID] then -- only care if this is a known reagent
            local _,count = GetContainerItemInfo(-3,i)
            psfj.bank[itemID] = (psfj.bank[itemID] or 0) + count
        end
    end
end

-- wrapper for GetItemCount to also include reagent bank
function psfj:GetItemCount(itemID)
    local count = GetItemCount(itemID)
    if psfj.bank[itemID] then
        count = count + psfj.bank[itemID]
    end
    return count
end

--[[ ui script handlers ]]

function psfj:OnEvent(event,...)
    if self[event] then
        self[event](self,...)
    end
end

function psfj:OnShow()
    self:Update(true)
    self:RegisterEvent("BAG_UPDATE_DELAYED")
    self:RegisterEvent("PLAYERREAGENTBANKSLOTS_CHANGED")
    self:RegisterEvent("QUEST_TURNED_IN")
    self:RegisterEvent("QUEST_LOG_UPDATE")
    self:RegisterEvent("MODIFIER_STATE_CHANGED")
end

function psfj:OnHide()
    self:UnregisterEvent("BAG_UPDATE_DELAYED")
    self:UnregisterEvent("PLAYERREAGENTBANKSLOTS_CHANGED")
    self:UnregisterEvent("QUEST_TURNED_IN")
    self:UnregisterEvent("QUEST_LOG_UPDATE")
    self:UnregisterEvent("MODIFIER_STATE_CHANGED")
end

function psfj:ListButtonOnEnter()
    self:SetBackdropBorderColor(0,0.75,1)
    if IsModifiedClick("DRESSUP") then
        ShowInspectCursor()
    else
        ResetCursor()
    end
end

function psfj:ListButtonOnLeave()
    self:SetBackdropBorderColor(0.3,0.3,0.3)
    ResetCursor()
end

function psfj:ListButtonOnClick()
    if IsModifiedClick("DRESSUP") then
        if InCombatLockdown() then
            UIErrorsFrame:AddMessage("You are in combat",1,0,0)
        elseif self.speciesID then
            local _,_,_,creatureID,_,_,_,_,_,_,_,displayID = C_PetJournal.GetPetInfoBySpeciesID(self.speciesID)
            DressUpBattlePet(creatureID,displayID,self.speciesID)
        end
    end
end