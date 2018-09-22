--## Author: Vampyr78  ## Version: 1.2
local statPriorityStats = {}
if GetLocale() == "zhCN" then
STRENGTH = "力量"; AGILITY = "敏捷"; INTELLECT = "智力"; VERSATILITY = "全能"; ARMOR = "护甲"; HASTE = "急速"; MASTERY = "精通"; CRITICALSTRIKE = "爆击"; STAMINA = "耐力"; SPIRIT = "精神";
elseif GetLocale() == "zhTW" then
STRENGTH = "力量"; AGILITY = "敏捷"; INTELLECT = "智力"; VERSATILITY = "臨機應變"; ARMOR = "護甲"; HASTE = "加速"; MASTERY = "精通"; CRITICALSTRIKE = "致命一擊"; STAMINA = "耐力"; SPIRIT = "精神";
else
STRENGTH = "Strength"; AGILITY = "Agility"; INTELLECT = "Intellect"; VERSATILITY = "Versatility"; ARMOR = "Armor"; HASTE = "Haste"; MASTERY = "Mastery"; CRITICALSTRIKE = "Critical Strike"; STAMINA = "Stamina"; SPIRIT = "Spirit";	
end
--WARRIORArms
statPriorityStats[71] = "Strength > Haste > Critical Strike > Mastery > Versatility"
--WARRIORFury
statPriorityStats[72] = "Strength > Haste > Mastery > Versatility > Critical Strike"
--WARRIORProtection
statPriorityStats[73] = "Haste > Versatility = Mastery > Critical Strike > Strength"
--PALADINHoly
statPriorityStats[65] = "Intellect > Critical Strike > Mastery > Haste > Versatility"
statPriorityStats["Avenger"] = "Intellect > Critical Strike > Haste > Versatility > Mastery"
--PALADINProtection
statPriorityStats[66] = "Haste > Mastery > Versatility > Critical Strike"
--PALADINRetribution
statPriorityStats[70] = "Strength > Haste > Critical Strike = Versatility = Mastery"
--HUNTERBeast Mastery
statPriorityStats[253] = "Mastery > Haste > Critical Strike > Versatility"
--HUNTERMarksmanship
statPriorityStats[254] = "Mastery > Haste > Critical Strike > Versatility"
--HUNTERSurvival
statPriorityStats[255] = "Haste > Critical Strike > Versatility > Mastery"
--ROGUEAssassination
statPriorityStats[259] = "Agility > Haste > Critical Strike > Mastery > Versatility"
--ROGUEOutlaw
statPriorityStats[260] = "Agility > Haste > Versatility > Critical Strike > Mastery"
--ROGUESubtlety
statPriorityStats[261] = "Mastery > Critical Strike > Versatility > Haste"
--PRIESTDiscipline
statPriorityStats[256] = "Intellect > Haste > Critical Strike > Mastery > Versatility"
--PRIESTHoly
statPriorityStats[257] = "Intellect > Mastery > Critical Strike > Haste > Versatility"
--PRIESTShadow
statPriorityStats[258] = "Intellect > Critical Strike > Versatility > Haste = Mastery"
--SHAMANElemental
statPriorityStats[262] = "Intellect > Haste > Versatility > Critical Strike > Mastery"
--SHAMANEnhancement
statPriorityStats[263] = "Agility > Haste > Critical Strike = Versatility > Mastery"
--SHAMANRestoration
statPriorityStats[264] = "Intellect > Critical Strike > Versatility > Haste = Mastery"
--MAGEArcane
statPriorityStats[62] = "Intellect > Critical Strike > Haste > Mastery > Versatility"
--MAGEFire
statPriorityStats[63] = "Intellect > Mastery > Versatility > Haste > Critical Strike"
--MAGEFrost
statPriorityStats[64] = "Intellect > Critical Strike to 33.34% > Haste > Versatility > Mastery"
--WARLOCKAffliction
statPriorityStats[265] = "Mastery > Intellect > Haste > Critical Strike = Versatility"
--WARLOCKDemonology
statPriorityStats[266] = "Intellect > Haste > Critical Strike = Mastery > Versatility"
--WARLOCKDestruction
statPriorityStats[267] = "Intellect > Haste > Critical Strike = Mastery > Versatility"
--DRUIDBalance
statPriorityStats[102] = "Intellect > Haste > Critical Strike > Versatility > Mastery"
--DRUIDFeral
statPriorityStats[103] = "Agility > Haste > Critical Strike > Versatility > Mastery"
--DRUIDGuardian
statPriorityStats[104] = "Armor = Agility = Stamina > Mastery > Versatility > Haste > Critical Strike"
--DRUIDRestoration
statPriorityStats[105] = "Mastery = Haste > Intellect > Versatility > Critical Strike"
--MONKBrewmaster
statPriorityStats[268] = "Agility > Critical Strike = Versatility = Mastery > Haste"
--MONKMistweaver
statPriorityStats[270] = "Intellect > Critical Strike > Versatility > Haste > Mastery"
--MONKWindwalker
statPriorityStats[269] = "Agility > Versatility > Mastery > Critical Strike > Haste"
--DEATHKNIGHTBlood
statPriorityStats[250] = "Haste > Versatility > Mastery > Critical Strike"
--DEATHKNIGHTFrost
statPriorityStats[251] = "Mastery > Critical Strike > Versatility > Haste"
--DEATHKNIGHTUnholy
statPriorityStats[252] = "Haste > Critical Strike = Versatility > Mastery"
--DEMONHUNTERHavoc
statPriorityStats[577] = "Agility > Haste = Versatility > Critical Strike > Mastery"
--DEMONHUNTERVengeance
statPriorityStats[581] = "Agility > Haste > Versatility > Mastery > Critical Strike"

function statPriorityFrameCreate(frame, text, parent)
	if parent:IsVisible() and UnitLevel("player") >= 55 then
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(parent:GetWidth() - 21)
		if parent == PaperDollFrame then frame:SetHeight(21) else frame:SetHeight(50) end
		text:ClearAllPoints()
		text:SetAllPoints(frame) 
		text:SetJustifyH("CENTER")
		text:SetJustifyV("CENTER")
		frame:ClearAllPoints()
		frame:SetPoint("BOTTOMRIGHT", parent, "TOPRIGHT",0,0)
		frame:SetParent(parent)
		frame:Show()
		return true
	end
	return false
end

function statPriorityFrameUpdate(frame, frameText, parent, unit)
	if parent ~= nil and statPriorityFrameCreate(frame, frameText, parent) then
		local temp, class = UnitClass(unit)
		local text
			if class == "PALADIN" then
				if IsSpellKnown(216331) then
					text = statPriorityStats["Avenger"]
				end
			end
			text = statPriorityStats[select(1,GetSpecializationInfo(GetSpecialization()))];
			text = gsub(text,"Strength",STRENGTH)
            text = gsub(text,"Agility",AGILITY)
            text = gsub(text,"Intellect",INTELLECT)
            text = gsub(text,"Versatility",VERSATILITY)
            text = gsub(text,"Armor",ARMOR)
            text = gsub(text,"Haste",HASTE)
            text = gsub(text,"Mastery",MASTERY)
            text = gsub(text,"Critical Strike",CRITICALSTRIKE) 
            text = gsub(text,"Stamina",STAMINA)
		frameText:SetText(text)
	end
end

local statPriorityFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityInspectFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityText = statPriorityFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityInspectText = statPriorityInspectFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityFrame:RegisterEvent("ADDON_LOADED")
statPriorityFrame:RegisterEvent("SPELLS_CHANGED")
statPriorityFrame:RegisterEvent("INSPECT_READY");
statPriorityFrame:SetScript("OnEvent", function(self, event)
	if event == "ADDON_LOADED" then
		self:UnregisterEvent("ADDON_LOADED")
		PaperDollFrame:HookScript("OnShow", function() statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player") end)
	elseif event == "SPELLS_CHANGED" then
		statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player")
	elseif event == "INSPECT_READY" then
		statPriorityFrameUpdate(statPriorityInspectFrame, statPriorityInspectText, InspectPaperDollFrame, "target")
	end
end)
