local M, R, U, I = unpack(select(2, ...))
local statPriorityStats = {}
statPriorityStats["WARRIORArms"] = "Mastery > Haste > Versatility > Strength > CriticalStrike"
statPriorityStats["WARRIORFury"] = "[Haste 27%]  Mastery(40%) > Haste(33%) > Strength > Versatility > CriticalStrike"
statPriorityStats["WARRIORProtection"] = "Strength > Haste(30%) > Mastery > Versatility > CriticalStrike"
statPriorityStats["PALADINHoly"] = "Intellect > CriticalStrike > Versatility > Mastery > Haste"
statPriorityStats["PALADINProtection"] = "Haste > Versatility > Mastery > CriticalStrike"
statPriorityStats["PALADINRetribution"] = "Strength > Haste(20%) > CriticalStrike = Versatility > Mastery"
statPriorityStats["HUNTERBeast Mastery"] = "Agility > Mastery > Haste > CriticalStrike > Versatility"
statPriorityStats["HUNTERMarksmanship"] = "Haste(9%) > Mastery > Agility > CriticalStrike > Haste > Versatility"
statPriorityStats["HUNTERSurvival"] = "Haste > Mastery > CriticalStrike > Versatility > Mastery"
statPriorityStats["ROGUEAssassination"] = "Agility > Mastery > CriticalStrike = Versatility > Haste"
statPriorityStats["ROGUEExsanguinate"] = "Agility > Versatility = CriticalStrike > Mastery > Haste"
statPriorityStats["ROGUEOutlaw"] = "Agility > Versatility > CriticalStrike > Haste > Mastery"
statPriorityStats["ROGUESubtlety"] = "Agility > Mastery > Versatility > CriticalStrike > Haste"
statPriorityStats["PRIESTDiscipline"] = "Intellect > Haste > CriticalStrike > Mastery > Versatility"
statPriorityStats["PRIESTHoly"] = "Intellect > Mastery(30-45) > CriticalStrike = Haste > Versatility"
statPriorityStats["PRIESTShadow"] = "Haste(32%)> Mastery > CriticalStrike > Intellect > Haste > Versatility"
statPriorityStats["SHAMANElemental"] = "Intellect > Mastery(86.5%) > CriticalStrike > Haste > Versatility"
statPriorityStats["SHAMANIcefury"] = "Intellect > CriticalStrike = Mastery > Haste > Versatility"
statPriorityStats["SHAMANLightning"] = "Intellect > Haste > CriticalStrike > Mastery > Versatility"
statPriorityStats["SHAMANEnhancement"] = "Agility > Mastery > Haste > CriticalStrike > Versatility"
statPriorityStats["SHAMANRestoration"] = "Intellect > Mastery > CriticalStrike > Haste > Versatility"
statPriorityStats["MAGEArcane"] = "Intellect > Haste(22%) > Versatility(6.5%) > CriticalStrike > Mastery > Versatility"
statPriorityStats["MAGEFire"] = "CriticalStrike > Intellect > Mastery > Haste > Versatility"
statPriorityStats["MAGEFrost"] = "CriticalStrike(33.34%) > Intellect > Haste > Versatility > Mastery"
statPriorityStats["WARLOCKAffliction"] = "Mastery > CriticalStrike > Haste > Intellect > Versatility"
statPriorityStats["WARLOCKDemonology"] = "Haste > CriticalStrike > Mastery > Intellect > Versatility"
statPriorityStats["WARLOCKDestruction"] = "Intellect > Haste > CriticalStrike > Versatility > Mastery"
statPriorityStats["DRUIDBalance"] = "Haste > Mastery > Intellect > CriticalStrike > Versatility"
statPriorityStats["DRUIDFeral"] = "Agility > Mastery > CriticalStrike > Versatility > Haste"
statPriorityStats["DRUIDGuardian"] = "Armor > Versatility > Mastery > Haste > Agility > CriticalStrike"
statPriorityStats["DRUIDRestoration"] = "Intellect > Haste > CriticalStrike > Mastery > Versatility"
statPriorityStats["MONKBrewmaster"] = "Haste(30%) > CriticalStrike = Mastery = Versatility"
statPriorityStats["MONKMistweaver"] = "Intellect > CriticalStrike > Versatility > Haste > Mastery"
statPriorityStats["MONKFistweaver"] = "Intellect > Versatility > Haste > CriticalStrike > Mastery"
statPriorityStats["MONKWindwalker"] = "Agility > Mastery > Haste > CriticalStrike > Versatility"
statPriorityStats["DEATHKNIGHTBlood"] = "Haste > Versatility > CriticalStrike > Mastery"
statPriorityStats["DEATHKNIGHTFrost"] = "Strength > Haste(20%) > CriticalStrike(25%) > Versatility > CriticalStrike > Mastery"
statPriorityStats["DEATHKNIGHTSindragosa"] = "Strength > CriticalStrike(25%) > Haste(20%) > CriticalStrike > Versatility > Mastery"
statPriorityStats["DEATHKNIGHTUnholy"] = "Strength > Mastery > Haste(20%)> CriticalStrike = Versatility"
statPriorityStats["DEMONHUNTERHavoc"] = "CriticalStrike > Mastery > Agility > Haste > Versatility"
statPriorityStats["DEMONHUNTERVengeance"] = "Agility > Mastery > Versatility > Haste > CriticalStrike"

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
		if text then
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
			elseif class == "MONK" then
				if IsSpellKnown(210802) then
					text = statPriorityStats[class .. "Fistweaver"]
				end
			elseif class == "DEATHKNIGHT" then
				if IsSpellKnown(152279) then
					text = statPriorityStats[class .. "Sindragosa"]
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
end

local statPriorityFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityInspectFrame = CreateFrame("FRAME", nil, UIParent)
statPriorityText = statPriorityFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityInspectText = statPriorityInspectFrame:CreateFontString(nil, "OVERLAY", "GameFontWhite")
statPriorityFrame:RegisterEvent("ADDON_LOADED")
statPriorityFrame:RegisterEvent("SPELLS_CHANGED")
statPriorityFrame:RegisterEvent("INSPECT_READY");
statPriorityFrame:SetScript("OnEvent", statPriorityFrameOnEvent)
