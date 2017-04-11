------------------------------------------------------------
-- Core.lua
--
-- Abin
-- 2012/12/18
------------------------------------------------------------

local tostring = tostring
local pairs = pairs
local type = type
local wipe = wipe
local tinsert = tinsert
local tremove = tremove
local GetItemQualityColor = GetItemQualityColor
local ipairs = ipairs
local format = format
local GetTime = GetTime
local C_PetJournal = C_PetJournal
local LE_PET_JOURNAL_FILTER_COLLECTED = LE_PET_JOURNAL_FILTER_COLLECTED
local LE_PET_JOURNAL_FLAG_FAVORITES = LE_PET_JOURNAL_FLAG_FAVORITES
local LE_PET_JOURNAL_FILTER_NOT_COLLECTED = LE_PET_JOURNAL_FILTER_NOT_COLLECTED
local DEFAULT_CHAT_FRAME = DEFAULT_CHAT_FRAME

local addonName, addon = ...
_G[addonName] = addon
addon.version = GetAddOnMetadata(addonName, "Version") or "1.0"
addon.db = { teams = {} }

local L = addon.L

local HEALTH_THRESHOLD = 0.9
local SWITCH_TIMEOUT = 15

local thread = {}

function addon:Print(text, r, g, b)
	DEFAULT_CHAT_FRAME:AddMessage("|cffffff78"..L["title"]..":|r "..tostring(text), r or 0.5, g or 0.75, b or 1)
end

local function NameToTeam(name)
	local _, team
	for _, team in ipairs(addon.db.teams) do
		if team.name == name then
			return team
		end
	end
end

function addon:UpdateTeam(team)
	if type(team) == "string" then
		team = NameToTeam(team)
	end

	if type(team) == "table" then
		local i
		for i = 1, 3 do
			team["pet"..i], team["pet"..i.."ability1"], team["pet"..i.."ability2"], team["pet"..i.."ability3"] = C_PetJournal.GetPetLoadOutInfo(i)
		end
	end
end

function addon:GetPetInfo(petId)
	if type(petId) == "string" then
		local speciesId, customName, level, xp, maxXp, _, _, name, icon, petType = C_PetJournal.GetPetInfoByPetID(petId)
		if speciesId then
			if customName == "" or customName == name then
				customName = nil
			end

			local health, maxHealth, attack, speed, rarity = C_PetJournal.GetPetStats(petId)
			local link = C_PetJournal.GetBattlePetLink(petId)
			local r, g, b, colorCode = GetItemQualityColor(rarity - 1)
			return speciesId, customName, name, link, icon, level, petType, health, maxHealth, xp, maxXp, attack, speed, rarity, r, g, b, colorCode
		end
	end
end

function addon:FindPetInTeam(petId)
	local data = self.detailFrame.teamData
	if type(data) == "table" and type(petId) == "string" then
		local index, petData
		for index, petData in ipairs(data) do
			if petData.petId == petId then
				return index, petData
			end
		end
	end
end

function addon:SelectTeam(team)
	if type(team) == "string" then
		team = NameToTeam(team)
	end

	if type(team) == "table" then
		return thread.Start(team)
	end
end

function addon:IsTeamActive(team)
	if type(team) == "string" then
		team = NameToTeam(team)
	end

	if type(team) == "table" then
		local match = 1
		local i
		for i = 1, 3 do
			if team["pet"..i] then
				local petId, ability1, ability2, ability3 = C_PetJournal.GetPetLoadOutInfo(i)
				if petId ~= team["pet"..i] or ability1 ~= team["pet"..i.."ability1"] or ability2 ~= team["pet"..i.."ability2"] or ability3 ~= team["pet"..i.."ability3"] then
					return
				end
			else
				match = 0
			end
		end
		return match
	end
end

------------------------------------------------------------
-- Thread-like team process due to the feature of WOW that
-- pet/ability changes don't take effect immediately
------------------------------------------------------------

local processStartTime
local tempList = {}
local pendingData = {}
local frame = CreateFrame("Frame")

frame:Hide()
frame:SetScript("OnUpdate", function(self, elapsed)
	self.elapsed = (self.elapsed or 0) + elapsed
	if self.elapsed > 0.2 then
		self.elapsed = 0

		if GetTime() - processStartTime > SWITCH_TIMEOUT then
			addon:Print(L["team failed"])
			self:Hide()
			return
		end

		if thread.ProcessData() then
			self:Hide()
		end
	end
end)

function thread.VerifyAbilities(speciesId, speciesId2, ability1, ability2, ability3)
	if speciesId == speciesId2 then
		return 1
	end

	C_PetJournal.GetPetAbilityList(speciesId2, tempList)
	return (ability1 == tempList[1] or ability1 == tempList[4]) and (ability2 == tempList[2] or ability2 == tempList[5]) and (ability3 == tempList[3] or ability3 == tempList[6])
end

function thread.FindAlternative(speciesId, level, petType, attack, speed, rarity, ability1, ability2, ability3)
	C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED, true)
	C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FLAG_FAVORITES, false)
	C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED, false)
	C_PetJournal.ClearAllPetTypesFilter()
	C_PetJournal.SetAllPetSourcesChecked(true)
	C_PetJournal.SetPetTypeFilter(petType, true)
	C_PetJournal.ClearSearchFilter()

	local abilityList = {}
	local _, numPets = C_PetJournal.GetNumPets(false)
	local i
	for i = 1, numPets do
		local petId2, speciesId2, isOwned, _, level2, _, _, _, _, petType2, _, _, _, _, canBattle = C_PetJournal.GetPetInfoByIndex(i, false)
		if not petId2 or not isOwned then
			return
		end

		if canBattle and level2 == level and petType2 == petType and petId2 ~= pendingData.pet1 and petId2 ~= pendingData.pet2 and petId2 ~= pendingData.pet3 then
			local health2, maxHealth2, attack2, speed2, rarity2 = C_PetJournal.GetPetStats(petId2)
			if attack2 == attack and speed2 == speed and rarity2 == rarity and health2 and health2 / maxHealth2 > HEALTH_THRESHOLD and thread.VerifyAbilities(speciesId, speciesId2, ability1, ability2, ability3) then
				return petId2, C_PetJournal.GetBattlePetLink(petId2)
			end
		end
	end
end

function thread.ProcessData()
	local completed = 1
	local i
	for i = 1, 3 do
		local petId, ability1, ability2, ability3 = pendingData["altpet"..i] or pendingData["pet"..i], pendingData["pet"..i.."ability1"], pendingData["pet"..i.."ability2"], pendingData["pet"..i.."ability3"]
		if petId then
			local id, a1, a2, a3 = C_PetJournal.GetPetLoadOutInfo(i)
			if petId and petId ~= id then
				C_PetJournal.SetPetLoadOutInfo(i, petId)
				print("pet id not match: "..petId)
				completed = nil
			end

			if ability1 and ability1 ~= a1 then
				C_PetJournal.SetAbility(i, 1, ability1)
				print("spell 1 not match: "..ability1..", "..(a1 or ""))
				completed = nil
			end

			if ability2 and ability2 ~= a2 then
				C_PetJournal.SetAbility(i, 2, ability2)
				print("spell 2 not match: "..ability2..", "..(a2 or ""))
				completed = nil
			end

			if ability3 and ability3 ~= a3 then
				C_PetJournal.SetAbility(i, 3, ability3)
				print("spell 3 not match: "..ability3..", "..(a3 or ""))
				completed = nil
			end
		end
	end

	if completed then
		addon:Print(format(L["team completed"], pendingData.name or L["unnamed"]))
		local i
		for i = 1, 3 do
			local health, link, link2 = pendingData["health"..i], pendingData["link"..i], pendingData["altlink"..i]
			if health and link then
				if link2 then
					addon:Print(format(L["alt message"], link2, link, health * 100))
				else
					addon:Print(format(L["low health message"], link, health * 100))
				end
			end
		end

		if PetJournal:IsVisible() then
			PetJournal_UpdatePetLoadOut()
		end
	end

	return completed
end

function thread.Start(team)
	frame:Hide()

	if type(team) ~= "table" then
		return
	end

	wipe(pendingData)
	local k, v
	for k, v in pairs(team) do
		pendingData[k] = v
	end

	local count = 0
	local i
	for i = 1, 3 do
		local petId = pendingData["pet"..i]
		local speciesId, _, _, link, _, level, petType, health, maxHealth, _, _, attack, speed, rarity = addon:GetPetInfo(petId)
		if link then
			count = count + 1
			pendingData["link"..i] = link
			local healthPerc = health / maxHealth
			if healthPerc <= HEALTH_THRESHOLD then
				pendingData["health"..i] = healthPerc
				if addon.db.alternative then
					pendingData["altpet"..i], pendingData["altlink"..i] = thread.FindAlternative(speciesId, level, petType, attack, speed, rarity, pendingData["pet"..i.."ability1"], pendingData["pet"..i.."ability2"], pendingData["pet"..i.."ability3"])
				end
			end
		end
	end

	if count == 0 then
		return
	end

	if not thread.ProcessData() then
		addon:Print(format(L["team starts"], pendingData.name or L["unnamed"]))
		processStartTime = GetTime()
		frame:Show()
	end

	return count
end

SLASH_PETCOUNCIL1 = "/petcouncil"
SLASH_PETCOUNCIL2 = "/petc"

SlashCmdList["PETCOUNCIL"] = function(msg)
	addon:SelectTeam(msg)
end