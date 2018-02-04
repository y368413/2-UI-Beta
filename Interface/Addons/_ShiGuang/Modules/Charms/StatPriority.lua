--## Author: Vampyr78  ## Version: 1.1.10
local M, R, U, I = unpack(select(2, ...))
local statPriorityStats = {}
statPriorityStats["WARRIORArms"] = "Mastery > Haste = Versatility = CriticalStrike > Strength"
statPriorityStats["WARRIORFury"] = "Haste(30%) > Mastery(40+%) > Versatility(3%) > CriticalStrike(25%) > Strength"
statPriorityStats["WARRIORProtection"] = "Strength > Haste(30%) > Mastery > Versatility > CriticalStrike"
statPriorityStats["PALADINHoly"] = "Intellect > CriticalStrike > Mastery > Versatility > Haste"
statPriorityStats["PALADINProtection"] = "Haste > Versatility(9%) > Mastery > CriticalStrike"
statPriorityStats["PALADINRetribution"] = "Mastery > Haste > Versatility > CriticalStrike = Strength"
statPriorityStats["HUNTERBeast Mastery"] = "CriticalStrike(50%) > Haste(18%) > Mastery(85%) > Versatility"
statPriorityStats["HUNTERMarksmanship"] = "Mastery > CriticalStrike > Haste > Versatility"
statPriorityStats["HUNTERSurvival"] = "Haste > CriticalStrike = Versatility > Mastery"
statPriorityStats["ROGUEAssassination"] = "Agility > Mastery > Versatility > CriticalStrike > Haste"
statPriorityStats["ROGUEExsanguinate"] = "Agility > Versatility > CriticalStrike > Mastery > Haste"
statPriorityStats["ROGUEOutlaw"] = "Versatility > Haste(20%) > Agility > CriticalStrike > Mastery"
statPriorityStats["ROGUESubtlety"] = "Agility > Mastery > Versatility > CriticalStrike > Haste"
statPriorityStats["PRIESTDiscipline"] = "Intellect > Haste > CriticalStrike > Mastery > Versatility"
statPriorityStats["PRIESTHoly"] = "Intellect > Mastery > CriticalStrike > Haste > Versatility"
statPriorityStats["PRIESTShadow"] = "Haste > CriticalStrike > Mastery > Versatility > Intellect"
statPriorityStats["SHAMANElemental"] = "Intellect > CriticalStrike > Mastery > Haste > Versatility"
statPriorityStats["SHAMANIcefury"] = "Intellect > CriticalStrike > Haste > Mastery = Versatility"
statPriorityStats["SHAMANLightning"] = "Intellect > CriticalStrike > Haste > Mastery = Versatility"
statPriorityStats["SHAMANEnhancement"] = "Haste = Mastery > Versatility > CriticalStrike > Agility"
statPriorityStats["SHAMANRestoration"] = "CriticalStrike > Versatility = Mastery = Haste > Intellect"
statPriorityStats["MAGEArcane"] = "Haste > Versatility > CriticalStrike > Mastery > Intellect"
statPriorityStats["MAGEFire"] = "Mastery > Haste = Versatility > Intellect > CriticalStrike"
statPriorityStats["MAGEFrost"] = "Versatility = Haste > CriticalStrike(33.34%) > Intellect > Mastery"
statPriorityStats["WARLOCKAffliction"] = "Mastery > Haste > CriticalStrike > Versatility > Intellect"
statPriorityStats["WARLOCKDemonology"] = "Haste(36%) > CriticalStrike = Mastery(50%) > Intellect > Versatility"
statPriorityStats["WARLOCKDestruction"] = "Haste > CriticalStrike > Intellect > Versatility > Mastery"
statPriorityStats["DRUIDBalance"] = "Mastery = Haste > CriticalStrike = Versatility > Intellect"
statPriorityStats["DRUIDFeral"] = "Versatility > CriticalStrike > Haste > Agility > Mastery"
statPriorityStats["DRUIDJagged"] = "Mastery > Versatility > CriticalStrike > Haste > Agility"
statPriorityStats["DRUIDGuardian"] = "Armor > Stamina > Versatility > Mastery > Haste > CriticalStrike > Agility"
statPriorityStats["DRUIDRestoration"] = "Haste(25%) > CriticalStrike(20%) > Mastery(20%) > Versatility > Intellect"
statPriorityStats["MONKBrewmaster"] = "Mastery = CriticalStrike = Versatility > Haste(14.3%)"
statPriorityStats["MONKMistweaver"] = "Intellect > CriticalStrike > Versatility > Haste > Mastery"
statPriorityStats["MONKFistweaver"] = "Intellect > Versatility > Haste > CriticalStrike > Mastery"
statPriorityStats["MONKWindwalker"] = "Agility > Mastery > Haste > CriticalStrike > Versatility"
statPriorityStats["DEATHKNIGHTBlood"] = "Haste(25%) > Versatility > CriticalStrike > Mastery"
statPriorityStats["DEATHKNIGHTFrost"] = "Strength > Mastery(40%) > Haste(30%) = CriticalStrike(30%) > Versatility"
statPriorityStats["DEATHKNIGHTUnholy"] = "Strength > Haste(26%) > Mastery > CriticalStrike = Versatility"
statPriorityStats["DEMONHUNTERHavoc"] = "CriticalStrike > Haste > Versatility > Agility > Mastery"
statPriorityStats["DEMONHUNTERVengeance"] = "Agility > Haste(20%) > Mastery > Versatility > CriticalStrike"

function statPriorityFrameOnEvent(self, event)
	if event == "ADDON_LOADED" then
		self:UnregisterEvent("ADDON_LOADED")
		PaperDollFrame:HookScript("OnShow", function() statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player") end)
	elseif event == "SPELLS_CHANGED" then
		statPriorityFrameUpdate(self, statPriorityText, PaperDollFrame, "player")
	elseif event == "INSPECT_READY" then
		statPriorityFrameUpdate(statPriorityInspectFrame, statPriorityInspectText, InspectPaperDollFrame, "target")
	end
end

function statPriorityFrameCreate(frame, text, parent)
	if parent:IsVisible() and UnitLevel("player") >= 55 then
		frame:SetFrameStrata("TOOLTIP")
		frame:SetWidth(parent:GetWidth() - 21)
		if parent == PaperDollFrame then
			frame:SetHeight(21)
		else
			frame:SetHeight(50)
		end
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

function GetSpecializationName(id)
	local spec = ""
	if id == 62 then 
		spec = "Arcane"
	elseif id == 63 then 
		spec = "Fire"
	elseif id == 64 then 
		spec = "Frost"
	elseif id == 65 then 
		spec = "Holy"
	elseif id == 66 then 
		spec = "Protection"
	elseif id == 70 then 
		spec = "Retribution"
	elseif id == 71 then 
		spec = "Arms"
	elseif id == 72 then 
		spec = "Fury"
	elseif id == 73 then 
		spec = "Protection"
	elseif id == 102 then 
		spec = "Balance"
	elseif id == 103 then 
		spec = "Feral"
	elseif id == 104 then 
		spec = "Guardian"
	elseif id == 105 then 
		spec = "Restoration"
	elseif id == 250 then 
		spec = "Blood"
	elseif id == 251 then 
		spec = "Frost"
	elseif id == 252 then 
		spec = "Unholy"
	elseif id == 253 then 
		spec = "Beast Mastery"
	elseif id == 254 then 
		spec = "Marksmanship"
	elseif id == 255 then 
		spec = "Survival"
	elseif id == 256 then 
		spec = "Discipline"
	elseif id == 257 then 
		spec = "Holy"
	elseif id == 258 then 
		spec = "Shadow"
	elseif id == 259 then 
		spec = "Assassination"
	elseif id == 260 then 
		spec = "Outlaw"  --Combat
	elseif id == 261 then 
		spec = "Subtlety"
	elseif id == 262 then 
		spec = "Elemental"
	elseif id == 263 then 
		spec = "Enhancement"
	elseif id == 264 then 
		spec = "Restoration"
	elseif id == 265 then 
		spec = "Affliction"
	elseif id == 266 then 
		spec = "Demonology"
	elseif id == 267 then 
		spec = "Destruction"
	elseif id == 268 then 
		spec = "Brewmaster"
	elseif id == 269 then 
		spec = "Windwalker"
	elseif id == 270 then 
		spec = "Mistweaver"
	elseif id == 577 then 
		spec = "Havoc"
	elseif id == 581 then 
		spec = "Vengeance"
	end
	return spec
end

function statPriorityFrameUpdate(frame, frameText, parent, unit)
	if parent ~= nil and statPriorityFrameCreate(frame, frameText, parent) then
		local name = UnitName("player")
		local temp, class = UnitClass(unit)
		local spec
		local text
		if parent == PaperDollFrame then
			spec = GetSpecializationInfo(GetSpecialization())
			spec = GetSpecializationName(spec)
			text = statPriorityStats[class .. spec];
			if class == "ROGUE" then
				if IsSpellKnown(200806) then
					text = statPriorityStats[class .. "Exsanguinate"]
				end
			elseif class == "SHAMAN" then
				if IsSpellKnown(210714) then
					text = statPriorityStats[class .. "Icefury"]
				elseif IsSpellKnown(210689) then
					text = statPriorityStats[class .. "Lightning"]
				end
			elseif class == "DRUID" then
				if IsSpellKnown(202032) then
					text = statPriorityStats[class .. "Jagged"]
				end
			elseif class == "MONK" then
				if IsSpellKnown(210802) then
					text = statPriorityStats[class .. "Fistweaver"]
				end
			end
			if statPriorityStats[name..spec] ~= nil then
				text = statPriorityStats[name..spec]
			end
			      text = gsub(text,"Strength",STRENGTH)
            text = gsub(text,"Agility",AGILITY)
            text = gsub(text,"Intellect",INTELLECT)
            text = gsub(text,"Versatility",VERSATILITY)
            text = gsub(text,"Armor",ARMOR)
            text = gsub(text,"Haste",HASTE)
            text = gsub(text,"Mastery",MASTERY)
            text = gsub(text,"CriticalStrike",CRIT) 
            text = gsub(text,"Stamina",STAMINA)
		else
			spec = GetSpecializationName(GetInspectSpecialization(unit))
			text = statPriorityStats[class .. spec];
			if statPriorityStats[name..spec] ~= nil and class == UnitClass("player") then
				text = statPriorityStats[name..spec]
			end
		end
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
statPriorityFrame:SetScript("OnEvent", statPriorityFrameOnEvent)
