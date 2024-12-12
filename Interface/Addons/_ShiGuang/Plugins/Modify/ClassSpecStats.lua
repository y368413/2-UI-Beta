<<<<<<< Updated upstream
--"Release Version Jan 2024 for Patch 11.0.2" by y368413
local IcyVeins_StatTable = {}
IcyVeins_StatTable["DEATHKNIGHT-250"] = "[Deathbringer]ï¼šItem Level > Haste(5%) > Critical Strike = Versatility = Mastery \n [San'layn]: Item Level > Haste > Critical Strike = Versatility = Mastery"
IcyVeins_StatTable["DEATHKNIGHT-251"] = "Critical Strike > Haste > Mastery > Versatility"
IcyVeins_StatTable["DEATHKNIGHT-252"] = "Haste > Mastery > Critical Strike > Versatility"

IcyVeins_StatTable["DEMONHUNTER-577"] = "[Single]: Agility > Critical Strike > Mastery > Haste > Versatility \n [Multi]: Agility > Critical Strike > Mastery > Versatility > Haste"
IcyVeins_StatTable["DEMONHUNTER-581"] = "Agility > Haste > Critical Strike = Versatility > Mastery"

IcyVeins_StatTable["DRUID-102"] = "Intellect > Mastery > Versatility > Haste > Critical Strike"
IcyVeins_StatTable["DRUID-103"] = "[Single]: Critical Strike = Mastery > Agility > Haste > Versatility \n [Multi]: Mastery > Critical Strike = Haste > Agility > Versatility"  --Mastery > Agility > Critical Strike > Versatility = Haste", "Multi-Target (Druid of the Claw)
IcyVeins_StatTable["DRUID-104"] = "[Survival]: Agility > Haste > Versatility > Mastery > Critical Strike \n [Damage]: Agility > Versatility = Haste = Critical Strike > Mastery"
IcyVeins_StatTable["DRUID-105"] = "[Raid]: Intellect > Haste > Mastery > Versatility > Critical Strike \n [Dungeon]: Intellect > Mastery = Haste > Versatility > Critical Strike"  --Intellect > Haste > Versatility > Critical Strike > Mastery", "Dungeon Damage Dealing

IcyVeins_StatTable["EVOKER-1467"] = "Intellect > Critical Strike > Versatility = Mastery = Haste"
IcyVeins_StatTable["EVOKER-1468"] = "[Raiding]: Intellect > Mastery > Critical Strike > Versatility > Haste \n [Mythic+]: Intellect > Critical Strike > Haste > Versatility > Mastery"
IcyVeins_StatTable["EVOKER-1473"] = "[Chronowarden]: Intellect > Haste (10%) > Mastery = Critical Strike > Haste > Versatility \n [Scalecommander]: Intellect > Haste (10%) > Mastery > Critical Strike = Haste > Versatility"

IcyVeins_StatTable["HUNTER-253"] = "[Single]: Haste > Critical Strike > Mastery > Versatility \n [Multi]: Mastery > Haste > Critical Strike > Versatility"
IcyVeins_StatTable["HUNTER-254"] = "Weapon Damage > Critical Strike > Mastery >  > Versatility > Haste"
IcyVeins_StatTable["HUNTER-255"] = "Mastery > Agility > Haste > Critical Strike > Versatility"

IcyVeins_StatTable["MAGE-62"] = "Intellect > Mastery = Haste â‰¥ Versatility â‰¥ Critical Strike"
IcyVeins_StatTable["MAGE-63"] = "Intellect > Haste > Versatility > Mastery > Critical Strike"
IcyVeins_StatTable["MAGE-64"] = "Intellect > Mastery > Haste > Critical Strike(33.34%) > Versatility"

IcyVeins_StatTable["MONK-268"] = "[Defensive]: Agility > Versatility = Mastery = Critical Strike > Haste \n [Offensive]: Agility > Versatility = Critical Strike > Mastery > Haste"
IcyVeins_StatTable["MONK-269"] = "Weapon Damage > Agility > Haste > Versatility > Critical Strike > Mastery"
IcyVeins_StatTable["MONK-270"] = "[Raid]: Intellect > Haste > Critical Strike > Versatility = Mastery \n [Mythic+]: Intellect > Haste > Critical Strike â‰¥ Mastery > Versatility"

IcyVeins_StatTable["PALADIN-65"] = "[Raid]: Intellect > Critical Strike > Haste > Mastery > Versatility \n [Mythic+]: Intellect > Critical Strike > Haste > Versatility > Mastery"
IcyVeins_StatTable["PALADIN-66"] = "[Defensive]: Strength > Haste â‰¥ Mastery â‰¥ Versatility > Critical Strike"
IcyVeins_StatTable["PALADIN-70"] = "Mastery > Strength > Critical Strike = Haste > Versatility"

IcyVeins_StatTable["PRIEST-256"] = "Intellect > Haste > Mastery > Critical Strike > Versatility"
IcyVeins_StatTable["PRIEST-257"] = "[Raid]: Intellect > Critical Strike = Mastery > Versatility > Haste \n [Mythic+]: Intellect > Critical Strike = Haste > Versatility > Mastery"
IcyVeins_StatTable["PRIEST-258"] = "Intellect > Haste > Mastery > Critical Strike > Versatility"

IcyVeins_StatTable["ROGUE-259"] = "Mastery > Critical Strike > Haste > Versatility"
IcyVeins_StatTable["ROGUE-260"] = "Versatility > Haste > Critical Strike > Mastery"
IcyVeins_StatTable["ROGUE-261"] = "Mastery > Versatility > Critical Strike > Haste"

IcyVeins_StatTable["SHAMAN-262"] = "[Lightning]: Intellect > Haste >> Critical Strike > Versatility >> Mastery \n [Fire]: Intellect > Haste >> Versatility > Mastery >> Critical Strike"
IcyVeins_StatTable["SHAMAN-263"] = "[Stormbringer]: Haste = Agility > Mastery > Critical Strike > Versatility \n [Totemic]: Agility = Haste > Mastery > Versatility > Critical Strike"
IcyVeins_StatTable["SHAMAN-264"] = "Intellect > Versatility = Critical Strike > Haste = Mastery" 

IcyVeins_StatTable["WARLOCK-265"] = "Intellect > Mastery = Critical Strike > Haste > Versatility"
IcyVeins_StatTable["WARLOCK-266"] = "Intellect > Haste(24%) > Critical Strike = Versatility > Mastery"
IcyVeins_StatTable["WARLOCK-267"] = "Haste = Critical Strike > Intellect > Mastery > Versatility"

IcyVeins_StatTable["WARRIOR-71"] = "Strength > Critical Strike > Haste > Mastery > Versatility"
IcyVeins_StatTable["WARRIOR-72"] = "Strength > Mastery > Haste > Versatility > Critical Strike"
IcyVeins_StatTable["WARRIOR-73"] = "Strength > Haste > Versatility = Critical Strike > Mastery"


local IcyVeins_StatTableFrame = CreateFrame("Frame",IcyVeins_StatTableFrame,UIParent, BackdropTemplateMixin and "BackdropTemplate")

function IcyVeins_StatTableFrame:CreateWin()
    if PaperDollFrame:IsVisible() then
        if not IcyVeins_STATSwin then
            IcyVeins_STATSwin = CreateFrame("Frame",IcyVeins_STATSwin,IcyVeins_StatTableFrame)
            --IcyVeins_StatTableFrame:SetBackdrop({bgFile = "Interface/Tooltips/UI-Tooltip-Background", edgeFile = "Interface/Tooltips/UI-Tooltip-Border", tile = true, tileSize = 16, edgeSize = 16, insets = { left = 1, right = 1, top = 1, bottom = 1 }}) 
            --IcyVeins_StatTableFrame:SetBackdropColor(0,0,0,1)
            IcyVeins_StatTableFrame:SetFrameStrata("TOOLTIP")
            IcyVeins_StatTableFrame:SetWidth(PaperDollFrame:GetWidth()-43) 
            IcyVeins_StatTableFrame:SetHeight(26)
            IcyVeins_StatTableFrame:ClearAllPoints()
            IcyVeins_StatTableFrame:SetPoint("BOTTOMRIGHT",PaperDollFrame,"TOPRIGHT",0,0)
            IcyVeins_StatTableFrame:SetParent(PaperDollFrame)
            IcyVeins_StatTableFrame:Show() 
    	    IcyVeins_STATStxt = IcyVeins_StatTableFrame:CreateFontString(nil,"OVERLAY","GameFontWhite") 
			IcyVeins_STATStxt:ClearAllPoints()
			IcyVeins_STATStxt:SetAllPoints(IcyVeins_StatTableFrame) 
			IcyVeins_STATStxt:SetJustifyH("CENTER")
			IcyVeins_STATStxt:SetJustifyV("MIDDLE")           
=======
--## Author: Reglohpri  ## Version: 1.53
local vars, Ld, La = {},{}, {}

vars.L = setmetatable({},{
    __index = function(t, s) return La[s] or Ld[s] or rawget(t,s) or s end
})

-- Ld means default (english) if no translation found. So we don't need a translation for "enUS" or "enGB".
Ld["Agi"] = "Agi"
Ld["Crit"] = "Crit"
Ld["Haste"] = "Haste"
Ld["Int"] = "Int"
Ld["Mastery"] = "Mastery"
Ld["Sta"] = "Stam"
Ld["Str"] = "Str"
Ld["Vers"] = "Vers"
Ld["Armor"] = "Armor"

if GetLocale() == "zhCN" then do end
	La["Agi"] = "Ãô½İ"
	La["Haste"] = "¼±ËÙ"
	La["Crit"] = "±©»÷"
	La["Int"] = "ÖÇÁ¦"
	La["Mastery"] = "¾«Í¨"
	La["Sta"] = "ÄÍÁ¦"
	La["Str"] = "Á¦Á¿"
	La["Vers"] = "È«ÄÜ"
	La["Armor"] = "¿ø¼×"
elseif GetLocale() == "zhTW" then do end
	La["Agi"] = "Ãô½İ"
	La["Haste"] = "¼ÓËÙ"
	La["Crit"] = "ÖÂÃü"
	La["Int"] = "ÖÇÁ¦"
	La["Mastery"] = "¾«Í¨"
	La["Sta"] = "ÄÍÁ¦"
	La["Str"] = "Á¦Á¿"
	La["Vers"] = "ÅR™C"
	La["Armor"] = "¿ø¼×"
end

local sFrameInit = false
local pHooked = false
local elapsedTime = 0

-- Changed for Patch 9.0.1 - Shadowlands
--stats_Frame = CreateFrame("Frame",stats_Frame,UIParent)
local stats_Frame = CreateFrame("Frame",stats_Frame,UIParent,"BackdropTemplate")

function stats_Frame:CreateWin()
    if PaperDollFrame:IsVisible() then
        if not stats_Window then
			stats_Window = CreateFrame("Frame",stats_Window,stats_Frame,"BackdropTemplate")

			stats_Frame:SetBackdropColor(0,0,0,1)
            stats_Frame:SetFrameStrata("TOOLTIP")
            stats_Frame:SetWidth(PaperDollFrame:GetWidth()-50)
			stats_Frame:SetHeight(21)

			stats_txt = stats_Frame:CreateFontString(nil,"OVERLAY","GameFontWhite")
			local ft = stats_txt
			ft:ClearAllPoints()
			ft:SetAllPoints(stats_Frame)
			ft:SetJustifyH("CENTER")
			ft:SetJustifyV("CENTER")
            stats_Frame:ClearAllPoints()
            stats_Frame:SetPoint("BOTTOMRIGHT",PaperDollFrame,"TOPRIGHT",0,0)
            stats_Frame:SetParent(PaperDollFrame)
            stats_Frame:Show()
>>>>>>> Stashed changes
        end
        return true
    end
    return false
end

<<<<<<< Updated upstream
function IcyVeins_StatTableFrame:Update()
    if IcyVeins_StatTableFrame:CreateWin() then
        local _, className = UnitClass("player")
        local sId, specName = GetSpecializationInfo(GetSpecialization())
        local s = IcyVeins_StatTable[className .. "-" .. sId]
        if s then
      -- H.Sch For multiple language
			s = gsub(s,"Intellect", SPEC_FRAME_PRIMARY_STAT_INTELLECT)
			s = gsub(s,"Critical Strike", STAT_CRITICAL_STRIKE)
			s = gsub(s,"Strength", SPEC_FRAME_PRIMARY_STAT_STRENGTH)
			s = gsub(s,"Agility", SPEC_FRAME_PRIMARY_STAT_AGILITY)
			s = gsub(s,"Stamina", ITEM_MOD_STAMINA_SHORT)
			s = gsub(s,"Versatility", STAT_VERSATILITY)
			s = gsub(s,"Haste", STAT_HASTE)
			s = gsub(s,"Mastery", STAT_MASTERY)
			s = gsub(s,"Armor", STAT_ARMOR)
			s = gsub(s,"Weapon Damage", DAMAGE_TOOLTIP)
			s = gsub(s,"Item Level", STAT_AVERAGE_ITEM_LEVEL)
            IcyVeins_STATStxt:SetText(s) 
        end               
    end
end

--IcyVeins_StatTableFrame:RegisterEvent("SPELLS_CHANGED") 
IcyVeins_StatTableFrame:RegisterEvent("ADDON_LOADED") 
IcyVeins_StatTableFrame:SetScript("OnEvent", function(self, event)
    if event == "ADDON_LOADED" then
        IcyVeins_StatTableFrame:Update()
        PaperDollFrame:HookScript("OnShow", function() IcyVeins_StatTableFrame:Update() end)
    end
    --if event == "SPELLS_CHANGED" then
            --IcyVeins_StatTableFrame:Update()
    --end
end)
=======
function stats_Frame:Update()
    if GetSpecialization() == nil then
          return false
    end

	local specID = select(1,GetSpecializationInfo(GetSpecialization()))

    if stats_Frame:CreateWin() then
        local s = stats_Table[specID]

        if s then
            s = gsub(s,"Strength","Str")
            s = gsub(s,"Agility","Agi")
            s = gsub(s,"Intellect","Int")
            s = gsub(s,"Stamina","Stam")
            s = gsub(s,"Versatility","Vers")

			-- H.Sch For multiple language
			s = gsub(s,"Int", vars.L["Int"])
			s = gsub(s,"Crit", vars.L["Crit"])
			s = gsub(s,"Str", vars.L["Str"])
			s = gsub(s,"Agi", vars.L["Agi"])
			s = gsub(s,"Stam", vars.L["Sta"])
			s = gsub(s,"Vers", vars.L["Vers"])
			s = gsub(s,"Haste", vars.L["Haste"])
			s = gsub(s,"Mast", vars.L["Mastery"])
			s = gsub(s,"Armor", vars.L["Armor"])
			-- H.Sch End for multiple language
			statsw_txt:SetText(v)
            stats_txt:SetText(s)
        end
		sFrameInit = true
    end
end

stats_Frame:RegisterEvent("SPELLS_CHANGED")
stats_Frame:RegisterEvent("ADDON_LOADED")
stats_Frame:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
		stats_Frame:Update()
		PaperDollFrame:HookScript("OnShow", function() stats_Frame:Update() end)
		pHooked = true
    elseif event == "SPELLS_CHANGED" then
            stats_Frame:Update()
    end
end)

local delayTimer = CreateFrame("Frame")
delayTimer:SetScript("OnUpdate", function (self, elapsed)
	elapsedTime = elapsedTime + elapsed
	if (elapsedTime < 10) then
		return
	else
		elapsedTime = 0
	end

	if not sFrameInit then
		stats_Frame:Update()
		if not pHooked then
			PaperDollFrame:HookScript("OnShow", function() stats_Frame:Update() end)
			pHooked = true
		end
	end

end)

stats_Table["Version"] = "|cFFFAFA44Icy-Veins Stat Priorities:|cFF00EA00 07.03.2021|r"

--[[ Deathknight Blood]]
stats_Table[250] = "Item Level > Str > Vers > Haste > Crit > Mast"
--[[ Deathknight Frost]]
stats_Table[251] = "Str > Mast > Crit > Haste > Vers"
--[[ Deathknight Unholy]]
stats_Table[252] = "Str > Mast > Haste > (Crit / Vers)"

--[[ Druid Balance]]
stats_Table[102] = "KYR: Int > Mast > Haste > Vers > Crit \n NF: Int > Mast > Vers > Haste > Crit"
--[[ Druid Feral]]
stats_Table[103] =  "Agi > Crit > Mast > Vers > Haste"
--[[ Druid Guardian]]
stats_Table[104] = "Survival: (Armor/Agi/Stam)>Vers>Mast>Haste>Crit \n DPS Boost: Agi > Vers >= Haste >= Crit > Mast"
--[[ Druid Restoration]]
stats_Table[105] = "Raid: Int > Haste > (Mast = Crit = Vers) \n Dungeon: Int > (Mast = Haste) > Vers > Crit"

--[[ Hunter Beastmaster]]
stats_Table[253] = "Agi > Haste > (Crit / Vers) > Mast"
--[[ Hunter Marksmanship]]
stats_Table[254] = "Agi > Crit > Mast > (Vers / Haste)"
--[[ Hunter Survival]]
stats_Table[255] = "Agi > Haste > (Vers / Crit) > Mast"

--[[ Mage Arcane]]
stats_Table[62] = "Int > Crit > Mast > Vers > Haste"
--[[ Mage Fire]]
stats_Table[63] = "Int > Haste > Vers > Mast > Crit"
--[[ Mage Fros]]
stats_Table[64] = "Int > Crit 33.34% > Haste > Vers > Mast > Crit"

--[[ Monk Brewmaster]]
stats_Table[268] = "DEF: (Vers = Mast = Crit) > Haste > Agi \n OFF: (Vers = Crit) > Haste > Mast > Agi"
--[[ Monk Mistweaver]]
stats_Table[270] = "Raid: Int > Crit > Vers > Haste > Mast \n Dungeon Mythic+: Int > (Crit => Mast = Vers >= Haste)"
--[[ Monk Windwalker]]
stats_Table[269] = "Agi > Vers > Mast > Crit > Haste"

--[[ Paladin Holy]]
stats_Table[65] = "Int > Haste > Mast > Vers > Crit"
--[[ Paladin Protection]]
stats_Table[66] = "Haste > Mast > Vers > Crit"
--[[ Paladin Retribution]]
stats_Table[70] = "Str > (Haste ~= Vers ~= Mast ~= Crit)"

--[[ Priest Discipline]]
stats_Table[256] = "Int > Haste > Crit > Vers > Mast"
--[[ Priest Holy]]
stats_Table[257] = "Raid: Int > (Mast = Crit) > Vers > Haste \n Dungeon: Int > Crit > Haste > Vers > Mast"
--[[ Priest Shadow]]
stats_Table[258] = "Int > (Haste = Mast) > Crit > Vers"

--[[ Rogue Assassination]]
stats_Table[259] = "Raid: Haste > Crit > Vers > Mast > Agi \n Dungeon Mythic+: Crit > Vers > Mast > Haste > Agi"
--[[ Rogue Outlaw]]
stats_Table[260] = "Raid: Agi > Vers > Haste > Crit > Mast \n Dungeon Mythic+: Agi > Vers > Crit > Haste > Mast"
--[[ Rogue Subtlety]]
stats_Table[261] = "Single Target: Agi > Vers > Crit > Haste > Mast \n Multi Target: Agi > Crit > Vers > Mast > Haste"

--[[ Shaman Elemental]]
stats_Table[262] = "Int > Vers > Haste > Crit > Mast"
--[[ Shaman Enhancement]]
stats_Table[263] = "Agi > Haste > (Crit = Vers) > Mast"
--[[ Shaman Restoration]]
stats_Table[264] = "Int > (Vers = Crit) > (Haste = Mast)"

--[[ Warlock Affliction]]
stats_Table[265] = "Int > Mast > Haste > Crit > Vers"
--[[ Warlock Demonology]]
stats_Table[266] = "Int > Haste > Mast > (Crit = Vers)"
--[[ Warlock Destruction]]
stats_Table[267] = "Int > (Haste >= Mast) > Crit > Vers"

--[[ Warrior Arms]]
stats_Table[71] = "Str > Crit > Mast > Vers > Haste"
--[[ Warrior Fury]]
stats_Table[72] = "Str > Haste > Mast > Crit > Vers"
--[[ Warrior Protection]]
stats_Table[73] = "General: Haste > Vers > Mast > Crit > Str > Armor \n Mythic+: Haste > (Vers >= Crit) > Mast > Str > Armor"

--[[ Demon Hunter Havoc]]
stats_Table[577] = "Agi > (Haste = Vers) > Crit > Mast"
--[[ Demon Hunter Vengeance]]
stats_Table[581] = "Agi > (Haste >= Vers) > Crit > Mast"
>>>>>>> Stashed changes
