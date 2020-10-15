local cql = ClassicQuestLog

cql.options.defaults = { -- default settings
    ShowTooltips = true,
    ShowResizeGrip = false,
    ShowLevels = false,
    SolidBackground = false,
    LockWindow = false,
    ShowFromObjectiveTracker = true,
}

--[[ savedvars ]]

ClassicQuestLogSettings = {} -- the savedvar

function cql.options:Initialize()
    ClassicQuestLogSettings = ClassicQuestLogSettings or {}
    for k,v in pairs(cql.options.defaults) do
        if cql.options:Get(k)==nil then
            cql.options:Set(k,v)
        end
    end
    cql.options.content.version:SetText(format("Version %s",GetAddOnMetadata("Classic Quest Log","Version")))
end

-- use this to get a setting
function cql.options:Get(setting)
    return ClassicQuestLogSettings[setting]
end

-- use this to set a setting
function cql.options:Set(setting,value)
    ClassicQuestLogSettings[setting] = value
end

--[[ ui ]]

function cql.options:ToggleOptions()
    if cql.mode=="options" then
        cql:SetMode("detail")
        PlaySound(SOUNDKIT.IG_QUEST_LOG_CLOSE)
    else
        cql:SetMode("options")
        PlaySound(SOUNDKIT.IG_QUEST_LOG_OPEN)
    end
end

function cql.options:OptionOnClick()
    local isChecked = self:GetChecked() and true
    PlaySound(isChecked and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
    cql.options:Set(self:GetParent().optVar,isChecked)
    cql.log:Update()
    cql.resizeGrip:SetShown(cql.options:Get("ShowResizeGrip"))
    if self:GetParent().optVar=="SolidBackground" then
        cql.options:UpdateColors()
    end
end

-- update the checks on the options to reflect current settings
function cql.options:Update()
    for k,v in pairs(cql.options.defaults) do
        if cql.options.content[k] then
            cql.options.content[k].check:SetChecked(cql.options:Get(k))
        end
    end
end

--[[ recoloring (SolidBackground option) ]]

-- for SolidBackground option, this table (indexed by FontString reference) contains the
-- original color of each region before it was recolored. Once an entry is in the table
-- it should not be updated!
cql.options.recoloredFontStrings = {}

-- called from login or changing setting; for periodic updates (eg cql:Update()) use UpdateDetailColors() only
function cql.options:UpdateColors()
    cql.options:UpdateDetailColors()
    local alpha = ClassicQuestLog.options:Get("SolidBackground") and 0 or 1
    cql.SealMaterialBG:SetAlpha(alpha)
    cql.detail.DetailBG:SetAlpha(alpha)
    cql.log.background:SetAlpha(alpha)
    cql.lore.background:SetAlpha(alpha)
    cql.options.background:SetAlpha(alpha)

    local vertex = alpha==0 and 0.6 or 1
    cql.options.content.headerBack:SetVertexColor(vertex,vertex,vertex)
    cql.lore.content.headerBack:SetVertexColor(vertex,vertex,vertex)
end

-- called during cql:UpdateLog() and 0.1 seconds after cql:OnHide()
function cql.options:UpdateDetailColors()
    -- if the log is on screen with the "Solid Background" option
    if cql:IsVisible() and cql.options:Get("SolidBackground") then
        -- the bulk of the text will be recursively colored
        cql:RecurseRecolor(QuestInfoQuestType)
        cql:RecurseRecolor(QuestInfoGroupSize)
        cql:RecurseRecolor(QuestInfoObjectivesText)
        cql:RecurseRecolor(QuestInfoDescriptionText)
        cql:RecurseRecolor(QuestInfoRewardsFrame)
        -- these three headers use the morpheus font and can be directly recolored
        cql.options:RecolorDetailText(QuestInfoTitleHeader,0.8,0.8,0.8)
        cql.options:RecolorDetailText(QuestInfoDescriptionHeader,0.8,0.8,0.8)
        cql.options:RecolorDetailText(QuestInfoRewardsFrame.Header,0.8,0.8,0.8)
        -- now recolor QuestInfoObjectivesFrame which has special handling
        cql.options:RecolorObjectivesText()
    elseif next(cql.options.recoloredFontStrings) then -- if the detail text has been recolored, un-recolor it
        -- go through table and SetTextColor back to the saved color
        for fontstring,color in pairs(cql.options.recoloredFontStrings) do
            fontstring:SetTextColor(unpack(color))
        end
        -- and wipe the table
        wipe(cql.options.recoloredFontStrings)
    end
 end

 -- completed objectives are greyed out so this section is handled differently
local completedSuffix = "%("..COMPLETE.."%)$" -- to save some garbage creation
function cql.options:RecolorObjectivesText()
    local index = 1
    local fontstring
    repeat
        fontstring = _G["QuestInfoObjective"..index]
        if fontstring then
            if (fontstring:GetText() or ""):match(completedSuffix) then
                cql.options:RecolorDetailText(fontstring,0.55,0.55,0.55)
            else
                cql.options:RecolorDetailText(fontstring,1,1,1)
            end
        end
        index = index + 1
    until not fontstring
end

-- this only ever gets called if SolidBackground is enabled; it colors the fontstring
-- after saving its original color (if it hasn't already been saved)
function cql.options:RecolorDetailText(fontstring,r,g,b,a)
    local font,height,flags = fontstring:GetFont()
    if flags=="OUTLINE" or fontstring:GetParent().NameFrame then
        return -- don't recolor outlined text (numbers) and text within NameFrames (item text)
    end
    -- if this fontstring's color hasn't been saved yet, store it in RecoloredFontStrings
    if not cql.options.recoloredFontStrings[fontstring] then
        cql.options.recoloredFontStrings[fontstring] = {fontstring:GetTextColor()}
    end
    fontstring:SetTextColor(r,g,b,a)
    fontstring:SetShadowColor(0,0,0,0) -- remove shadow too (this doesn't get restored but it's ok)
end
 

-- this accepts one or more frames and then recolors all FontStrings within the frame
-- or its descendents; TODO: reduce garbage creation (not a big deal, but kinda annoying)
function cql:RecurseRecolor(...)
    for i=1,select("#",...) do
        local object = select(i,...)
        if object:GetObjectType()=="FontString" then -- if a fontstring found
            cql.options:RecolorDetailText(object,1,0.82,0.5) -- color it pale gold
        elseif object.GetRegions then -- otherwise if this element has child regions
            for _,region in ipairs({object:GetRegions()}) do
                if region:GetObjectType()=="FontString" then
                    cql.options:RecolorDetailText(region,1,0.82,0.5)
                end
            end
            cql:RecurseRecolor(object:GetChildren())
        end
    end
end
