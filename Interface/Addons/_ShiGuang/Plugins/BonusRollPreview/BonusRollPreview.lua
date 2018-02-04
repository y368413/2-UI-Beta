local MAJOR, MINOR = 'EJ_Ext', 1
assert(LibStub, MAJOR .. ' requires LibStub')

local lib, oldMinor = LibStub:NewLibrary(MAJOR, MINOR)
if(not lib) then return end

local journalIDs = {
	-- 5.0 Pandaria
	[132205] = {322, 691}, -- Sha of Anger
	[132206] = {322, 725}, -- Salyis' Warband (Galleon)
	[136381] = {322, 814}, -- Nalak, The Storm God
	[137554] = {322, 826}, -- Oondasta
	[148317] = {322, 857}, -- Celestials (also encounterIDs 858, 859 and 860)
	[148316] = {322, 861}, -- Ordos, Fire-God of the Yaungol

	-- 5.0 Mogu'Shan Vaults
	[125144] = {317, 679}, -- The Stone Guard
	[132189] = {317, 689}, -- Feng the Accursed
	[132190] = {317, 682}, -- Gara'jal the Spiritbinder
	[132191] = {317, 687}, -- The Spirit Kings
	[132192] = {317, 726}, -- Elegon
	[132193] = {317, 677}, -- Will of the Emperor

	-- 5.0 Heart of Fear
	[132194] = {330, 745}, -- Imperial Vizier Zor'lok
	[132195] = {330, 744}, -- Blade Lord Tay'ak
	[132196] = {330, 713}, -- Garalon
	[132197] = {330, 741}, -- Wind Lord Mel'jarak
	[132198] = {330, 737}, -- Amber-Shaper Un'sok
	[132199] = {330, 743}, -- Grand Empress Shek'zeer

	-- 5.0 Terrace of Endless Spring
	[132200] = {320, 683}, -- Protectors of the Endless
	[132204] = {320, 683}, -- Protectors of the Endless (Elite)
	[132201] = {320, 742}, -- Tsulong
	[132202] = {320, 729}, -- Lei Shi
	[132203] = {320, 709}, -- Sha of Fear

	-- 5.0 Throne of Thunder
	[139674] = {362, 827}, -- Jin'rokh the Breaker
	[139677] = {362, 819}, -- Horridon
	[139679] = {362, 816}, -- Council of Elders
	[139680] = {362, 825}, -- Tortos
	[139682] = {362, 821}, -- Magaera
	[139684] = {362, 828}, -- Ji'kun, the Ancient Mother
	[139686] = {362, 818}, -- Durumu the Forgotten
	[139687] = {362, 820}, -- Primordious
	[139688] = {362, 824}, -- Dark Animus
	[139689] = {362, 817}, -- Iron Qon
	[139690] = {362, 829}, -- Twin Consorts (Empyreal Queens)
	[139691] = {362, 832}, -- Lei Shen, The Thunder King
	[139692] = {362, 831}, -- Ra-den

	-- 5.0 Siege of Orgrimmar
	[145909] = {369, 852}, -- Immerseus
	[145910] = {369, 849}, -- The Fallen Protectors
	[145911] = {369, 866}, -- Norushen
	[145912] = {369, 867}, -- Sha of Pride
	-- Galakras needs special handling
	[145914] = {369, 864}, -- Iron Juggernaut
	[145915] = {369, 856}, -- Kor'kron Dark Shaman
	[145916] = {369, 850}, -- General Nazgrim
	[145917] = {369, 846}, -- Malkorok
	[145919] = {369, 870}, -- Spoils of Pandaria
	[145920] = {369, 851}, -- Thok the Bloodthirsty
	[145918] = {369, 865}, -- Siegecrafter Blackfuse
	[145921] = {369, 853}, -- Paragons of the Klaxxi
	[145922] = {369, 869}, -- Garrosh Hellscream

	-- 6.0 Draenor
	[178847] = {557, 1291}, -- Drov the Ruiner
	[178849] = {557, 1211}, -- Tarina the Ageless
	[178851] = {557, 1262}, -- Rukhmar
	[188985] = {557, 1452}, -- Supreme Lord Kazzak

	-- 6.0 Highmaul
	[177521] = {477, 1128}, -- Kargath Bladefist
	[177522] = {477, 971}, -- The Butcher
	[177523] = {477, 1195}, -- Tectus
	[177524] = {477, 1196}, -- Brackenspore
	[177525] = {477, 1148}, -- Twin Ogron
	[177526] = {477, 1153}, -- Ko'ragh
	[177528] = {477, 1197}, -- Imperator Mar'gok

	-- 6.0 Blackrock Foundry
	[177529] = {457, 1161}, -- Gruul
	[177530] = {457, 1202}, -- Oregorger
	[177536] = {457, 1122}, -- Beastlord Darmac
	[177534] = {457, 1123}, -- Flamebender Ka'graz
	[177533] = {457, 1155}, -- Hans'gar and Franzok
	[177537] = {457, 1147}, -- Operator Thogar
	[177531] = {457, 1154}, -- The Blast Furnace
	[177535] = {457, 1162}, -- Kromog
	[177538] = {457, 1203}, -- The Iron Maidens
	[177539] = {457, 959},  -- Blackhand

	-- 6.0 Hellfire Citadel
	[188972] = {669, 1426}, -- Hellfire Assault
	[188973] = {669, 1425}, -- Iron Reaver
	[188974] = {669, 1392}, -- Kormrok
	[188975] = {669, 1432}, -- Hellfire High Council
	[188976] = {669, 1396}, -- Kilrogg Deadeye
	[188977] = {669, 1372}, -- Gorefiend
	[188978] = {669, 1433}, -- Shadow-Lord Iskar
	[188979] = {669, 1427}, -- Socrethar the Eternal
	[188980] = {669, 1391}, -- Fel Lord Zakuun
	[188981] = {669, 1447}, -- Xhul'horac
	[188982] = {669, 1394}, -- Tyrant Velhari
	[188983] = {669, 1395}, -- Mannoroth
	[188984] = {669, 1438}, -- Archimonde

	-- 6.0 Auchindoun
	[190154] = {547, 1185}, -- Vigilant Kaathar
	[190155] = {547, 1186}, -- Soulbinder Nyami
	[190156] = {547, 1216}, -- Azzakel
	[190157] = {547, 1225}, -- Teron'gor

	-- 6.0 Upper Blackrock Spire
	[190168] = {559, 1226}, -- Orebender Gor'ashan
	[190170] = {559, 1227}, -- Kyrak
	[190171] = {559, 1228}, -- Commander Tharbek
	[190172] = {559, 1229}, -- Ragewing the Untamed
	[190173] = {559, 1234}, -- Warlord Zaela

	-- 6.0 Shadowmoon Burial Grounds
	[190150] = {537, 1139}, -- Sadana Bloodfury
	[190151] = {537, 1168}, -- Nhallish
	[190152] = {537, 1140}, -- Bonemaw
	[190153] = {537, 1160}, -- Ner'zhul

	-- 6.0 The Everbloom
	[190158] = {556, 1214}, -- Witherbark
	[190159] = {556, 1207}, -- Ancient Protectors
	[190160] = {556, 1208}, -- Archmage Sol
	[190162] = {556, 1209}, -- Xeri'tac
	[190163] = {556, 1210}, -- Yalnu

	-- 6.0 Grimrail Depot
	[190147] = {536, 1138}, -- Rocketspark and Borka
	[190148] = {536, 1163}, -- Nitrogg Thundertower
	[190149] = {536, 1133}, -- Skylord Tovra

	-- 6.0 Iron Docks
	[190164] = {558, 1235}, -- Fleshrender Nok'gar
	[190165] = {558, 1236}, -- Grimrail Enforcers
	[190166] = {558, 1237}, -- Oshir
	[190167] = {558, 1238}, -- Skulloc

	-- 6.0 Skyreach
	[190142] = {476, 965}, -- Ranjit
	[190143] = {476, 966}, -- Araknath
	[190144] = {476, 967}, -- Rukhran
	[190146] = {476, 968}, -- High Sage Viryx

	-- 6.0 Bloodmaul Slag Mines
	[190138] = {385, 893}, -- Magmolatus
	[190139] = {385, 888}, -- Slave Watcher Crushto
	[190140] = {385, 887}, -- Roltall
	[190141] = {385, 889}, -- Gug'rokk

	-- 7.0 The Nighthold
	-- Grand Magistrix Elisande needs special handling
}

-- the following encounters present different IDs based on client randomness (not entirely sure)
local incorrectJournalEntries = {
	-- 5.0
	[145913] = {369, 5}, -- Galakras
	-- 7.0
	[232444] = {786, 9}, -- Grand Magistrix Elisande
}

local Handler = CreateFrame('Frame')
Handler:RegisterEvent('PLAYER_LOGIN')
Handler:SetScript('OnEvent', function(self, event)
	self:UnregisterEvent(event)

	for spellID, data in next, incorrectJournalEntries do
		EJ_SelectInstance(data[1])
		journalIDs[spellID] = {data[1], (select(3, EJ_GetEncounterInfoByIndex(data[2])))}
	end
end)

function lib:GetJournalInfoForSpellConfirmation(spellID)
	-- this extends the API to also work for earlier expansions
	-- it also fixes incorrect data for certain encounters (see above)
	local instanceID, encounterID
	if(journalIDs[spellID]) then
		instanceID, encounterID = unpack(journalIDs[spellID])
	else
		instanceID, encounterID = GetJournalInfoForSpellConfirmation(spellID)
	end

	return instanceID, encounterID
end

local difficulties = {
	-- 5.0
	[322] = 3, -- World: Pandaria
	[317] = 4, -- Raid: Mogu'Shan Vaults
	[330] = 4, -- Raid: Heart of Fear
	[320] = 4, -- Raid: Terrace of Endless Spring
	[362] = 4, -- Raid: Throne of Thunder
	[369] = 4, -- Raid: Siege of Orgrimmar

	-- 6.0
	[557] = 14, -- World: Draenor
	[477] = 14, -- Raid: Highmaul
	[457] = 14, -- Raid: Blackrock Foundry
	[669] = 14, -- Raid: Hellfire Citadel
	[547] = 23, -- Dungeon: Auchindoun
	[385] = 23, -- Dungeon: Bloodmaul Slag Mines
	[536] = 23, -- Dungeon: Grimrail Depot
	[558] = 23, -- Dungeon: Iron Docks
	[537] = 23, -- Dungeon: Shadowmoon Burial Grounds
	[476] = 23, -- Dungeon: Skyreach
	[556] = 23, -- Dungeon: The Everbloom
	[559] = 23, -- Dungeon: Upper Blackrock Spire

	-- 7.0
	[882] = 14, -- World: Broken Isles
	[959] = 14, -- World: Invasion Points
	[768] = 14, -- Raid: The Emerald Nightmare
	[861] = 14, -- Raid: Trial of Valor
	[786] = 14, -- Raid: The Nighthold
	[875] = 14, -- Raid: Tomb of Sargeras
	[946] = 14, -- Raid: Antorus, the Burning Throne
	[777] = 23, -- Dungeon: Assault on Violet Hold
	[740] = 23, -- Dungeon: Black Rook Hold
	[900] = 23, -- Dungeon: Cathedral of Eternal Night
	[800] = 23, -- Dungeon: Court of Stars
	[762] = 23, -- Dungeon: Darkheart Thicket
	[716] = 23, -- Dungeon: Eye of Azshara
	[721] = 23, -- Dungeon: Halls of Valor
	[727] = 23, -- Dungeon: Maw of Souls
	[767] = 23, -- Dungeon: Neltharion's Lair
	[860] = 23, -- Dungeon: Return to Karazhan
	[726] = 23, -- Dungeon: The Arcway
	[707] = 23, -- Dungeon: Vault of the Wardens
	[945] = 13, -- Dungeon: The Seat of the Triumvirate
}

function lib:GetBonusRollEncounterJournalLinkDifficulty(encounterID, instanceID)
	-- this extends the API to have correct fallback difficulty IDs
	local _, _, difficultyID = GetInstanceInfo()
	if(difficultyID ~= 0) then
		return difficultyID
	else
		if(encounterID == 1452) then
			-- Supreme Lord Kazzak thinks he's special
			return 15
		else
			return difficulties[instanceID] or 0
		end
	end
end




local EJ = LibStub('EJ_Ext')

-- sourced from _G
local LE_ITEM_CLASS_WEAPON = LE_ITEM_CLASS_WEAPON or 2
local LE_ITEM_CLASS_ARMOR = LE_ITEM_CLASS_ARMOR or 4
local LE_ITEM_ARMOR_RELIC = LE_ITEM_ARMOR_RELIC or 11
local LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL = LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL or 1

local ignoredSpells = {
	-- 7.0
	[232109] = true, -- Return to Karazhan: Nighbane (no EJ entry)
	[240042] = true, -- Arena 2v2 Weekly Quest
	[240048] = true, -- Arena 3v3 Weekly Quest
	[240052] = true, -- Battlegrounds 10v10 Weekly Quest
}

local specialItems = { -- non-equippable items confirmed available from bonus rolls
	-- https://twitter.com/olandgren/status/428229005221691392
	[89783] = true, -- Mount: Son of Galleon's Saddle
	[94228] = true, -- Mount: Reins of the Cobalt Primordial Direhorn
	[87771] = true, -- Mount: Reins of the Heavenly Onyx Cloud Serpent
	[95057] = true, -- Mount: Reins of the Thundering Cobalt Cloud Serpent
}

local query = {}
local function tSize(t)
	-- I really want Lua 5.2
	local size = 0
	for _ in next, t do
		size = size + 1
	end

	return size
end

BonusRollPreviewMixin = {}
function BonusRollPreviewMixin:OnLoad()
	self:RegisterEvent('SPELL_CONFIRMATION_PROMPT')
	self:RegisterEvent('SPELL_CONFIRMATION_TIMEOUT')
	self:RegisterEvent('PLAYER_ENTERING_WORLD')
	self:RegisterEvent('PLAYER_LOGIN')
	self:SetBackdropColor(0, 0, 0, 0.8)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() - 2)

	-- TODO: consider preventing this frame to GroupLootContainer, but I'm afraid of taints
	--BonusRollFrame:ClearAllPoints()
	--BonusRollFrame:SetPoint('CENTER', BonusRollPreviewAnchor)
	--BonusRollFrame.ClearAllPoints = nop
	--BonusRollFrame.SetPoint = nop

	self.buttons = CreateFramePool('Button', self.ScrollFrame.ScrollChild, 'BonusRollPreviewButtonTemplate')
end

function BonusRollPreviewMixin:OnEvent(event, ...)
	if(event == 'EJ_DIFFICULTY_UPDATE') then
		-- difficulty to track has updated, update filter and item list
		self:UnregisterSafeEvent(event)
		self:UpdateItemFilter()
		self:UpdateItems()
	elseif(event == 'EJ_LOOT_DATA_RECIEVED') then
		if(self:GetParent():IsShown()) then
			if(tSize(query) == 0) then
				-- query is empty, bail out
				return self:UnregisterSafeEvent(event)
			end

			local itemID = ...
			if(EJ_IsLootListOutOfDate()) then
				-- entire list is considered out of date, wipe the query and start over
				table.wipe(query)
				self:UpdateItems()
			elseif(query[itemID]) then
				-- this sucks, but we have to restart the entire encounter to get accurate data
				-- by the data returns to the client the client might have changed parameters
				table.wipe(query)
				self:StartEncounter()
				-- self:UpdateItem(itemID)
			end
		end
	elseif(event == 'PLAYER_LOOT_SPEC_UPDATED') then
		-- we need to restart the entire encounter logic just in case the user
		-- has used the EncounterJournal before changing loot specializations.
		self:StartEncounter()
	elseif(event == 'SPELL_CONFIRMATION_PROMPT') then
		local spellID, confirmType, _, _, currencyID, difficultyID = ...
		if(confirmType ~= LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL) then
			return
		end

		if(not ignoredSpells[spellID]) then -- ignore blacklisted encounters
			local instanceID, encounterID = EJ:GetJournalInfoForSpellConfirmation(spellID)
			if(encounterID and select(2, GetCurrencyInfo(currencyID)) > 0) then
				if(not difficultyID) then
					-- get a fallback difficulty (should only happen with login prompts)
					difficultyID = EJ:GetBonusRollEncounterJournalLinkDifficulty(encounterID, instanceID)
				end

				self.difficultyID = difficultyID
				self.encounterID = encounterID
				self.instanceID = instanceID

				self:RegisterEvent('PLAYER_LOOT_SPEC_UPDATED')
				self:StartEncounter()

				-- show/hide list and handle
				self:SetShown(BonusRollPreviewDB.alwaysShow)
				self:UpdatePosition()
				BonusRollPreviewHandle:Show()
			end
		end
	elseif(event == 'SPELL_CONFIRMATION_TIMEOUT') then
		self:UnregisterEvent('EJ_LOOT_DATA_RECIEVED')
		self:UnregisterEvent('PLAYER_LOOT_SPEC_UPDATED')
		self:Hide()
		BonusRollPreviewHandle:Hide()
	elseif(event == 'PLAYER_ENTERING_WORLD') then
		-- check for any outstanding bonus rolls
		for _, info in next, GetSpellConfirmationPromptsInfo() do
			if(info and info.spellID) then
				self:OnEvent('SPELL_CONFIRMATION_PROMPT', info.spellID, info.confirmType, nil, nil, info.currencyID)
			end
		end
	elseif(event == 'PLAYER_LOGIN') then
		-- update anchor position and frame positions
		--BonusRollPreviewAnchor:ClearAllPoints()
		--BonusRollPreviewAnchor:SetPoint(unpack(BonusRollPreviewDB.anchor))
	end
end

function BonusRollPreviewMixin:StartEncounter()
	-- start the encounter by selecting the encounter
	self:RegisterSafeEvent('EJ_DIFFICULTY_UPDATE')
	EJ_SelectInstance(self.instanceID)
	EJ_SetDifficulty(self.difficultyID) -- this will trigger EJ_DIFFICULTY_UPDATE
	EJ_SelectEncounter(self.encounterID)
end

function BonusRollPreviewMixin:UpdateItems()
	self:RegisterSafeEvent('EJ_LOOT_DATA_RECIEVED')
	self.buttons:ReleaseAll() -- reset and hide all buttons in the pool

	local numItems = 0
	for index = 1, EJ_GetNumLoot() do
		local itemID, encounterID, name, texture, slot, armorType, itemLink = EJ_GetLootInfoByIndex(index)
		-- for some reason the API returns all loot for the entire instance
		-- so we need to make sure we only list the ones for the selected encounter
		if(encounterID == self.encounterID) then
			local _, _, _, _, _, itemClass, itemSubClass = GetItemInfoInstant(itemID)
			-- only show equippable and special whitelisted items
			-- by filtering them by item class/subclass
			if(itemClass == LE_ITEM_CLASS_WEAPON or itemClass == LE_ITEM_CLASS_ARMOR or (itemClass == LE_ITEM_CLASS_GEM and itemSubClass == LE_ITEM_ARMOR_RELIC) or specialItems[itemID]) then
				-- add item to item count
				numItems = numItems + 1

				-- grab a button from the pool and position it
				local Button = self.buttons:Acquire()
				Button:SetPoint('TOPLEFT', 0, (numItems - 1) * -40)
				Button:SetPoint('TOPRIGHT', 0, (numItems - 1) * -40)
				Button:Show()

				-- update its data
				Button.itemLink = itemLink
				Button.itemID = itemID

				if(itemLink) then
					Button.Icon:SetTexture(texture)
					Button.Name:SetText(name)
					Button.Slot:SetText(slot)
					Button.Class:SetText(armorType)
				else
					-- item is not cached, show temporary information
					Button.Icon:SetTexture(QUESTION_MARK_ICON)
					Button.Name:SetText(RETRIEVING_ITEM_INFO)
					Button.Slot:SetText('')
					Button.Class:SetText('')

					-- add the item to our query list
					query[itemID] = index
				end
			end
		end
	end

	if(numItems == 0) then
		self:OnEvent('SPELL_CONFIRMATION_TIMEOUT')
		return
	end

	-- set height based on number of items, min 1, max 8
	local height = 10 + (numItems * 40)
	self:SetHeight(Clamp(height, 50, 330))

	-- update scrolling based on number of shown items
	if(numItems > 8) then
		self:EnableScrolling()
	else
		self:DisableScrolling()
	end
end

function BonusRollPreviewMixin:UpdateItemFilter()
	local _, _, classID = UnitClass('player')
	local lootSpecialization = GetLootSpecialization() or 0
	if(lootSpecialization == 0) then
		lootSpecialization = (GetSpecializationInfo(GetSpecialization() or 0)) or 0
	end

	EJ_SetLootFilter(classID, lootSpecialization)
end

function BonusRollPreviewMixin:RegisterSafeEvent(event)
	self:RegisterEvent(event)

	if(EncounterJournal) then
		-- if the EncounterJournal is loaded, prevent it from getting data and
		-- prevent our events from being triggered when we don't want to
		EncounterJournal:UnregisterEvent(event)
	end
end

function BonusRollPreviewMixin:UnregisterSafeEvent(event)
	self:UnregisterEvent(event)

	if(EncounterJournal) then
		-- if the EncounterJournal is loaded, let it have its events back
		EncounterJournal:RegisterEvent(event)
	end
end

function BonusRollPreviewMixin:UpdateHandlePosition(collapsed)
	local Handle = BonusRollPreviewHandle
	Handle:ClearAllPoints()

	local downwards = BonusRollPreviewDB.fillDirection == 'DOWN'
	if(collapsed) then
		if(downwards) then
			Handle:SetPoint('TOP', BonusRollFrame, 'BOTTOM', 0, 2)
			Handle.Arrow:SetTexCoord(0, 0, 1/2, 0, 0, 1, 1/2, 1)
		else
			Handle:SetPoint('BOTTOM', BonusRollFrame, 'TOP', 0, -2)
			Handle.Arrow:SetTexCoord(1/2, 1, 0, 1, 1/2, 0, 0, 0)
		end
	else
		if(downwards) then
			Handle:SetPoint('BOTTOM', self, 0, -14)
			Handle.Arrow:SetTexCoord(1/2, 1, 1, 1, 1/2, 0, 1, 0)
		else
			Handle:SetPoint('TOP', self, 0, 14)
			Handle.Arrow:SetTexCoord(1, 0, 1/2, 0, 1, 1, 1/2, 1)
		end
	end

	Handle.TopLeft:SetShown(not downwards)
	Handle.TopCenter:SetShown(not downwards)
	Handle.TopRight:SetShown(not downwards)
	Handle.BottomLeft:SetShown(downwards)
	Handle.BottomCenter:SetShown(downwards)
	Handle.BottomRight:SetShown(downwards)
end

function BonusRollPreviewMixin:UpdatePosition()
	self:ClearAllPoints()
	if(BonusRollPreviewDB.fillDirection == 'DOWN') then
		self:SetPoint('TOP', self:GetParent(), 'BOTTOM')
	else
		self:SetPoint('BOTTOM', self:GetParent(), 'TOP')
	end

	self:UpdateHandlePosition(not self:IsShown())
end

function BonusRollPreviewMixin:ToggleLock()
	local Anchor = BonusRollPreviewAnchor
	Anchor:SetShown(not Anchor:IsShown())
end

function BonusRollPreviewMixin:EnableScrolling()
	local ScrollFrame = self.ScrollFrame
	ScrollFrame:EnableMouseWheel(true)
	ScrollFrame.ScrollChild:SetWidth(274 - ScrollFrame.Slider:GetWidth())

	-- set new scroll values
	local height = (10 + (self.buttons.numActiveObjects * 40)) - self:GetHeight()
	ScrollFrame.Slider:SetMinMaxValues(0, height)

	-- reset scroll to top
	ScrollFrame.Slider:SetValue(0)
	ScrollFrame.Slider:Show()
end

function BonusRollPreviewMixin:DisableScrolling()
	local ScrollFrame = self.ScrollFrame
	ScrollFrame:EnableMouseWheel(false)
	ScrollFrame.ScrollChild:SetWidth(274)
	ScrollFrame.Slider:Hide()
end

function BonusRollPreviewMixin:Toggle()
	self:SetShown(not self:IsShown())
	self:UpdateHandlePosition(not self:IsShown())
end

-------------------------------------------------------------------------------------------------
local Buttons = CreateFrame('Frame', (...) .. 'SpecButtons', BonusRollFrame)
Buttons:SetPoint('LEFT', BonusRollFrame.SpecIcon, 4, 4)
Buttons:Hide()

local function HideButtons()
	BonusRollFrame.SpecIcon:SetDesaturated(false)
	Buttons:Hide()
end

local function ShowButtons()
	BonusRollFrame.SpecIcon:SetDesaturated(true)
	Buttons:Show()
end

local function OnButtonClick(self)
	SetLootSpecialization(self:GetID())
	HideButtons()
end

local function OnButtonEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPRIGHT')
	GameTooltip:AddLine(self.tooltip, 1, 1, 1)
	GameTooltip:Show()
end

local Zone = CreateFrame('Frame', nil, BonusRollFrame)
Zone:SetAllPoints(BonusRollFrame.SpecIcon)
Zone.tooltip = SELECT_LOOT_SPECIALIZATION

Zone:SetScript('OnLeave', function()
	GameTooltip_Hide()

	if(not Buttons:IsMouseOver()) then
		HideButtons()
	end
end)

Zone:SetScript('OnEnter', function(self)
	OnButtonEnter(self)

	if(not Buttons:IsShown()) then
		if(not self.initialized) then
			local numSpecs = GetNumSpecializations()
			for index = 1, numSpecs do
				local specID, name, _, texture = GetSpecializationInfo(index)

				local Button = CreateFrame('Button', '$parentButton' .. index, Buttons)
				Button:SetPoint('LEFT', index * 28, 0)
				Button:SetSize(22, 22)
				Button:SetScript('OnClick', OnButtonClick)
				Button:SetScript('OnEnter', OnButtonEnter)
				Button:SetScript('OnLeave', GameTooltip_Hide)
				Button:SetNormalTexture(texture)
				Button:SetHighlightTexture([[Interface\Minimap\UI-Minimap-ZoomButton-Highlight]])
				Button:SetID(specID)
				Button.tooltip = name

				-- BUG: mouse gets stuck on this border and won't hide the container
				local Border = Button:CreateTexture('$parentBorder', 'OVERLAY')
				Border:SetPoint('TOPLEFT', -6, 6)
				Border:SetSize(58, 58)
				Border:SetTexture([[Interface\Minimap\Minimap-TrackingBorder]])
			end

			local width, height = self:GetSize()
			Buttons:SetSize((numSpecs * 28) + width, height)

			self.initialized = true
		end

		ShowButtons()
	end
end)

Buttons:SetScript('OnLeave', function(self)
	if(not Zone:IsMouseOver() and not Buttons:IsMouseOver()) then
		HideButtons()
	end
end)


hooksecurefunc('BonusRollFrame_StartBonusRoll', function()
	-- Need to force show the SpecIcon when the player
	-- has no chosen loot specialization.
	local lootSpecialization = GetLootSpecialization()
	if(not lootSpecialization or lootSpecialization == 0) then
		local specID, _, _, texture = GetSpecializationInfo(GetSpecialization() or 0)
		if(specID) then
			BonusRollFrame.SpecIcon:SetTexture(texture)
			BonusRollFrame.SpecIcon:Show()
			BonusRollFrame.SpecRing:Show()
		end
	end
end)



------------------------------------------------------------------------------------------------------
local defaults = {
	--anchor = {'CENTER', 'UIParent', 'CENTER', 0, 0},
	alwaysShow = false,
	fillDirection = 'UP'
}

local Options = LibStub('Wasabi'):New('|cff8080ff[拾取]|r拾取提示', 'BonusRollPreviewDB', defaults)
Options:Initialize(function(self)
	local Title = self:CreateTitle()
	Title:SetPoint('TOPLEFT', 16, -16)
	Title:SetText('|cff8080ff[拾取]|r拾取提示')

	local Description = self:CreateDescription()
	Description:SetPoint('TOPLEFT', Title, 'BOTTOMLEFT', 0, -8)
	Description:SetText(BRP_Description) --:gsub('/brp %w+', '|cff9999ff%1|r')

	local AlwaysShow = self:CreateCheckButton('alwaysShow')
	AlwaysShow:SetPoint('TOPLEFT', Description, 'BOTTOMLEFT', 0, -20)
	AlwaysShow:SetText(BRP_AlwaysShow)

	local FillDirection = self:CreateDropDown('fillDirection')
	FillDirection:SetPoint('TOPLEFT', AlwaysShow, 'BOTTOMLEFT', 0, -10)
	FillDirection:SetText(BRP_FillDirection)
	FillDirection:SetValues({
		UP = '↑',
		DOWN = '↓',
	})
end)

_G['SLASH_' .. '|cff8080ff[拾取]|r拾取提示' .. '1'] = '/brp'
SlashCmdList['|cff8080ff[拾取]|r拾取提示'] = function(msg)
	msg = msg:lower()

	if(msg == 'unlock' or msg == 'lock') then
		BonusRollPreview:ToggleLock()
	elseif(msg == 'reset') then
		--BonusRollPreviewDB.anchor = CopyTable(defaults.anchor)
		BonusRollPreview:OnEvent('PLAYER_LOGIN')
	else
		Options:ShowOptions()
	end
end


