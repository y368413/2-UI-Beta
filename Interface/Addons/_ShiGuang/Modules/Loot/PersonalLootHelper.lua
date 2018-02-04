--## SavedVariables: PLH_NOTIFY_MODE, PLH_INCLUDE_BOE, PLH_MIN_QUALITY, PLH_MIN_ILVL, PLH_DEBUG, PLH_CURRENT_SPEC_ONLY, PLH_CHECK_CHARACTER_LEVEL, PLH_COORDINATE_ROLLS, PLH_NOTIFY_GROUP, PLH_HIGHLIGHT_RAID_FRAMES, PLH_HIGHLIGHT_SIZE


--[[
to easily populate these arrays:
	wowhead search trinkets -> usable by "whichever" -> added in expansion/patch; also ID > 0
	paste into OpenOffice
	=concatenate(b1;", -- ";d1)
	ensure curly quotes are off in tools -> autocorrect options -> localized options
	to obtain IDs: http://www.wowhead.com/items/armor/trinkets/role:1?filter=166:151;7:1;0:0#0-3+2
]]--	
local PLH_TRINKET_AGILITY_DPS = {
	-- 7.3 trinkets
	152288, -- 7.3 Raid - Antorus - Boss 11 - Trinket Ranged WS
	152285, -- 7.3 Raid - Antorus - Boss 11 - Trinket Melee Str WS
	152701, -- 7.3 Raid - Antorus - Boss 11 - Trinket Melee Agi WS
	151970, -- Vitality Resonator
	151969, -- Terminus Signaling Beacon
	151971, -- Sheath of Asara
	151968, -- Shadow-Singed Fang
	151964, -- Seeping Scourgewing
	151962, -- Prototype Personnel Decimator
	151961, -- Legionsteel Flywheel
	152093, -- Gorshalach's Legacy
	151963, -- Forgefiend's Fabricator
	151967, -- Electrostatic Lasso
	152782, -- Venerable Triad Statuette
	152781, -- Unblemished Sigil of Argus
	152783, -- Mac'aree Focusing Amethyst
	153172, -- Doomed Exarch's Memento
	
	-- 7.2.5 trinkets
	151190, -- Specter of Betrayal
	150526,	-- Shadowmoon Insignia
	150527,	-- Madness of the Betrayer

	-- 7.2 trinkets
	147275, -- Beguiler's Talisman
	144477, -- Splinters of Agronax
	147011, -- Vial of Ceaseless Toxins
	147012, -- Umbral Moonglaives
	147016, -- Terror From Below
	147017, -- Tarnished Sentinel Medallion
	147018, -- Spectral Thurible
	147009, -- Infernal Cinders
	147015, -- Engine of Eradication
	147010, -- Cradle of Anguish
	
	-- 7.1.5 and previously missed 7.1 trinkets
	142506, -- Eye of Guarm
	142166, -- Ethereal Urn
	
	-- 7.1 trinkets
	140027, -- Ley Spark
	142164, -- Toe Knee's Promise
	142160, -- Mrrgria's Favor
	142167, -- Eye of Command
	142165, -- Deteriorated Construct Core
	142159, -- Bloodstained Handkerchief
	142157, -- Aran's Relaxing Ruby

	137419, -- Chrono Shard
	133642, -- Horn of Valor
	141537, -- Thrice-Accursed Compass
	141482, -- Unstable Arcanocrystal
	140794, -- Arcanogolem Digit
	140806, -- Convergence of Fates
	140808, -- Draught of Souls
	140796, -- Entwined Elemental Foci
	140801, -- Fury of the Burning Sky
	140798, -- Icon of Rot
	140802, -- Nightblooming Frond
	136258, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Conquest
	136145, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Conquest
	139329, -- Bloodthirsty Instinct
	139334, -- Nature's Call
	139320, -- Ravaged Seed Pod
	139325, -- Spontaneous Appendages
	139323, -- Twisting Wind
	138224, -- Unstable Horrorslime
	135806, -- Legion Season 1Vindictive Gladiator's Insignia of Conquest
	135693, -- Legion Season 1Vindictive Gladiator's Insignia of Conquest
	136716, -- Caged Horror
	137459, -- Chaos Talisman
	137446, -- Elementium Bomb Squirrel Generator
	133641, -- Eye of Skovald
	137539, -- Faulty Countermeasure
	137329, -- Figurehead of the Naglfar
	137369, -- Giant Ornamental Pearl
	136975, -- Hunger of the Pack
	137357, -- Mark of Dargrul
	133644, -- Memento of Angerboda
	137541, -- Moonlit Prism
	137349, -- Naraxas' Spiked Tongue
	137312, -- Nightmare Egg Shell
	137306, -- Oakheart's Gnarled Root
	137433, -- Obelisk of the Void
	136715, -- Spiked Counterweight
	137367, -- Stormsinger Fulmination Charge
	137373, -- Tempered Egg of Serpentrix
	137406, -- Terrorbound Nexus
	140026, -- The Devilsaur's Bite
	137439, -- Tiny Oozeling in a Jar
	137537, -- Tirathon's Betrayal
	137486, -- Windscar Whetstone
	135919, -- Legion Season 1Vindictive Combatant's Insignia of Conquest
	136032, -- Legion Season 1Vindictive Combatant's Insignia of Conquest
	139630, -- Etching of SargerasDemon Hunter
	128958, -- Lekos' LeashDemon Hunter
	129044, -- Frothing Helhound's Fury
	131803 -- Spine of Barax
}

local PLH_TRINKET_INTELLECT_DPS = {
	-- 7.3 trinkets
	152288, -- 7.3 Raid - Antorus - Boss 11 - Trinket Ranged WS
	151970, -- Vitality Resonator
	151969, -- Terminus Signaling Beacon
	151971, -- Sheath of Asara
	151962, -- Prototype Personnel Decimator
	151955, -- Acrid Catalyst Injector
	152782, -- Venerable Triad Statuette
	152781, -- Unblemished Sigil of Argus
	152783, -- Mac'aree Focusing Amethyst
	153172, -- Doomed Exarch's Memento
	151310, -- Reality Breacher
	
	-- 7.2.5 trinkets
	150522,	-- The Skull of Gul'dan
	150388,	-- Hibernation Crystal
	
	-- 7.2 trinkets
	147276, -- Spellbinder's Seal
	144480, -- Dreadstone of Endless Shadows
	147019, -- Tome of Unraveling Sanity
	147016, -- Terror From Below
	147017, -- Tarnished Sentinel Medallion
	147018, -- Spectral Thurible
	147002, -- Charm of the Rising Tide
	
	-- 7.1.5 and previously missed 7.1 trinkets
	142166, -- Ethereal Urn

	-- 7.1 trinkets
	140031, -- Mana Spark
	142160, -- Mrrgria's Favor
	142165, -- Deteriorated Construct Core
	142157, -- Aran's Relaxing Ruby
	
	137419, -- Chrono Shard
	133642, -- Horn of Valor
	141482, -- Unstable Arcanocrystal
	141536, -- Padawsen's Unlucky Charm
	132970, -- Runas' Nearly Depleted Ley Crystal
	136038, -- Legion Season 1Vindictive Combatant's Insignia of Dominance
	135925, -- Legion Season 1Vindictive Combatant's Insignia of Dominance
	132895, -- The Watcher's Divine Inspiration
	137367, -- Stormsinger Fulmination Charge
	137398, -- Portable Manacracker
	121810, -- Pocket Void Portal
	137433, -- Obelisk of the Void
	137306, -- Oakheart's Gnarled Root
	137349, -- Naraxas' Spiked Tongue
	137541, -- Moonlit Prism
	137485, -- Infernal Writ
	137329, -- Figurehead of the Naglfar
	133641, -- Eye of Skovald
	137446, -- Elementium Bomb Squirrel Generator
	140030, -- Devilsaur Shock-Baton
	137301, -- Corrupted Starlight
	136716, -- Caged Horror
	121652, -- Ancient Leaf
	139326, -- Wriggling Sinew
	140809, -- Whispers in the Dark
	135699, -- Legion Season 1Vindictive Gladiator's Insignia of Dominance
	136151, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Dominance
	135812, -- Legion Season 1Vindictive Gladiator's Insignia of Dominance
	136264, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Dominance
	138224, -- Unstable Horrorslime
	139323, -- Twisting Wind
	139321, -- Swarming Plaguehive
	140804, -- Star Gate
	140800, -- Pharamere's Forbidden Grimore
	140798, -- Icon of Rot
	140801, -- Fury of the Burning Sky
	140792, -- Erratic Metronome
	139336 -- Bough of Corruption
}

local PLH_TRINKET_STRENGTH_DPS = {
	-- 7.3 trinkets
	152285, -- 7.3 Raid - Antorus - Boss 11 - Trinket Melee Str WS
	152701, -- 7.3 Raid - Antorus - Boss 11 - Trinket Melee Agi WS
	151968, -- Shadow-Singed Fang
	151964, -- Seeping Scourgewing
	151961, -- Legionsteel Flywheel
	152093, -- Gorshalach's Legacy
	151963, -- Forgefiend's Fabricator
	151967, -- Electrostatic Lasso
	152782, -- Venerable Triad Statuette
	152781, -- Unblemished Sigil of Argus
	152783, -- Mac'aree Focusing Amethyst
	153172, -- Doomed Exarch's Memento
	151307, -- Void Stalker's Contract
	
	-- 7.2.5 trinkets
	151190, -- Specter of Betrayal
	150526,	-- Shadowmoon Insignia
	150527,	-- Madness of the Betrayer

	-- 7.2 trinkets
	147278, -- Stalwart Crest
	144482, -- Fel-Oiled Infernal Machine
	147011, -- Vial of Ceaseless Toxins
	147012, -- Umbral Moonglaives
	147009, -- Infernal Cinders
	147015, -- Engine of Eradication
	147010, -- Cradle of Anguish
	
	-- 7.1.5 and previously missed 7.1 trinkets
	142166, -- Ethereal Urn
	142508, -- Chains of the Valorous

	-- 7.1 trinkets
	140035, -- Fluctuating Arc Capacitor
	142164, -- Toe Knee's Promise
	142167, -- Eye of Command
	142159, -- Bloodstained Handkerchief
	
	137419, -- Chrono Shard
	133642, -- Horn of Valor
	141482, -- Unstable Arcanocrystal
	141535, -- Ettin Fingernail
	137486, -- Windscar Whetstone
	136041, -- Legion Season 1Vindictive Combatant's Insignia of Victory
	135928, -- Legion Season 1Vindictive Combatant's Insignia of Victory
	137439, -- Tiny Oozeling in a Jar
	137406, -- Terrorbound Nexus
	129260, -- Tenacity of Cursed Blood
	136715, -- Spiked Counterweight
	137312, -- Nightmare Egg Shell
	121806, -- Mountain Rage Shaker
	121570, -- Might of the Forsaken
	133644, -- Memento of Angerboda
	137357, -- Mark of Dargrul
	140034, -- Impact Tremor
	136975, -- Hunger of the Pack
	137369, -- Giant Ornamental Pearl
	137539, -- Faulty Countermeasure
	137459, -- Chaos Talisman
	135815, -- Legion Season 1Vindictive Gladiator's Insignia of Victory
	135702, -- Legion Season 1Vindictive Gladiator's Insignia of Victory
	136154, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Victory
	136267, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Victory
	139328, -- Ursoc's Rending Paw
	139325, -- Spontaneous Appendages
	139320, -- Ravaged Seed Pod
	139334, -- Nature's Call
	140799, -- Might of Krosus
	140796, -- Entwined Elemental Foci
	140808, -- Draught of Souls
	140806, -- Convergence of Fates
	140790 -- Claw of the Crystalline Scorpid
}

local PLH_TRINKET_HEALER = {
	-- 7.3 trinkets
	152288, -- 7.3 Raid - Antorus - Boss 11 - Trinket Ranged WS
	151959, -- 7.3 Raid - Antorus - Boss 11 - Trinket Healer WS
	152702, -- 7.3 Raid - Antorus - Boss 11 - Trinket All WS
	151970, -- Vitality Resonator
	151969, -- Terminus Signaling Beacon
	151958, -- Tarratus Keystone
	151971, -- Sheath of Asara
	151962, -- Prototype Personnel Decimator
	151957, -- Ishkar's Felshield Emitter
	152289, -- Highfather's Machination
	151956, -- Garothi Feedback Conduit
	151960, -- Carafe of Searing Light
	151955, -- Acrid Catalyst Injector
	152782, -- Venerable Triad Statuette
	152781, -- Unblemished Sigil of Argus
	152783, -- Mac'aree Focusing Amethyst
	153172, -- Doomed Exarch's Memento
	
	-- 7.2.5 trinkets
	150523,	-- Memento of Tyrande
	150388,	-- Hibernation Crystal

	-- 7.2 trinkets
	147276, -- Spellbinder's Seal
	144480, -- Dreadstone of Endless Shadows
	147019, -- Tome of Unraveling Sanity
	147007, -- The Deceiver's Grand Design
	147016, -- Terror From Below
	147017, -- Tarnished Sentinel Medallion
	147018, -- Spectral Thurible
	147004, -- Sea Star of the Depthmother
	147002, -- Charm of the Rising Tide
	147005, -- Chalice of Moonlight
	147003, -- Barbaric Mindslaver
	147006, -- Archive of Faith
	
	-- 7.1.5 and previously missed 7.1 trinkets
	142166, -- Ethereal Urn
	142507, -- Brinewater Slime in a Bottle

	-- 7.1 trinkets
	140031, -- Mana Spark
	142160, -- Mrrgria's Favor
	142162, -- Fluctuating Energy
	142158, -- Faith's Crucible
	142165, -- Deteriorated Construct Core
	142157, -- Aran's Relaxing Ruby
	
	137419, -- Chrono Shard
	133642, -- Horn of Valor
	141482, -- Unstable Arcanocrystal
	141536, -- Padawsen's Unlucky Charm
	132970, -- Runas' Nearly Depleted Ley Crystal
	136038, -- Legion Season 1Vindictive Combatant's Insignia of Dominance
	135925, -- Legion Season 1Vindictive Combatant's Insignia of Dominance
	137452, -- Thrumming Gossamer
	132895, -- The Watcher's Divine Inspiration
	137367, -- Stormsinger Fulmination Charge
	137398, -- Portable Manacracker
	121810, -- Pocket Void Portal
	137433, -- Obelisk of the Void
	137306, -- Oakheart's Gnarled Root
	133766, -- Nether Anti-Toxin
	137349, -- Naraxas' Spiked Tongue
	133645, -- Naglfar Fare
	133646, -- Mote of Sanctification
	137541, -- Moonlit Prism
	137462, -- Jewel of Insatiable Desire
	137485, -- Infernal Writ
	137484, -- Flask of the Solemn Night
	137329, -- Figurehead of the Naglfar
	133641, -- Eye of Skovald
	137446, -- Elementium Bomb Squirrel Generator
	140030, -- Devilsaur Shock-Baton
	137301, -- Corrupted Starlight
	137540, -- Concave Reflecting Lens
	136716, -- Caged Horror
	137378, -- Bottled Hurricane
	121652, -- Ancient Leaf
	136714, -- Amalgam's Seventh Spine
	139326, -- Wriggling Sinew
	135812, -- Legion Season 1Vindictive Gladiator's Insignia of Dominance
	136264, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Dominance
	135699, -- Legion Season 1Vindictive Gladiator's Insignia of Dominance
	136151, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Dominance
	138222, -- Vial of Nightmare Fog
	138224, -- Unstable Horrorslime
	139323, -- Twisting Wind
	139321, -- Swarming Plaguehive
	140793, -- Perfectly Preserved Cake
	139333, -- Horn of Cenarius
	139330, -- Heightened Senses
	140803, -- Etraeus' Celestial Map
	140805, -- Ephemeral Paradox
	139322, -- Cocoon of Enforced Solitude
	139336, -- Bough of Corruption
	140795 -- Aluriel's Mirror
}

local PLH_TRINKET_TANK = {
	-- 7.3 trinkets
	152287, -- 7.3 Raid - Antorus - Boss 11 - Trinket Tank WS
	151976, -- Riftworld Codex
	151978, -- Foe-Breaker Titanguard
	152645, -- Eye of
	151974, -- Eye of
	151977, -- Diima's Glacial Aegis
	151975, -- Apocalypse Drive
	152782, -- Venerable Triad Statuette
	152781, -- Unblemished Sigil of Argus
	152783, -- Mac'aree Focusing Amethyst
	153172, -- Doomed Exarch's Memento
	
	-- 7.2.5 trinkets
	150526,	-- Shadowmoon Insignia
	150527,	-- Madness of the Betrayer	
	
	-- 7.2 trinkets
	147278, -- Stalwart Crest
	147275, -- Beguiler's Talisman
	144477, -- Splinters of Agronax
	144482, -- Fel-Oiled Infernal Machine
	147026, -- Shifting Cosmic Sliver
	147024, -- Reliquary of the Damned
	147025, -- Recompiled Guardian Module
	147023, -- Leviathan's Hunger
	147022, -- Feverish Carapace
	
	-- 7.1.5 and previously missed 7.1 trinkets
	142506, -- Eye of Guarm
	142166, -- Ethereal Urn

	-- 7.1 trinkets
	140027, -- Ley Spark
	140035, -- Fluctuating Arc Capacitor
	142169, -- Raven Eidolon
	142168, -- Majordomo's Dinner Bell
	142161, -- Inescapable Dread
	
	137419, -- Chrono Shard
	133642, -- Horn of Valor
	141482, -- Unstable Arcanocrystal
	137315, -- Writhing Heart of Darkness
	136041, -- Legion Season 1Vindictive Combatant's Insignia of Victory
	135928, -- Legion Season 1Vindictive Combatant's Insignia of Victory
	136032, -- Legion Season 1Vindictive Combatant's Insignia of Conquest
	135919, -- Legion Season 1Vindictive Combatant's Insignia of Conquest
	140026, -- The Devilsaur's Bite
	129260, -- Tenacity of Cursed Blood
	137344, -- Talisman of the Cragshaper
	131803, -- Spine of Barax
	137440, -- Shivermaw's Jawbone
	137338, -- Shard of Rokmora
	137362, -- Parjesh's Medallion
	137538, -- Orb of Torment
	121806, -- Mountain Rage Shaker
	121570, -- Might of the Forsaken
	128958, -- Lekos' LeashDemon Hunter
	137430, -- Impenetrable Nerubian Husk
	140034, -- Impact Tremor
	133647, -- Gift of Radiance
	129044, -- Frothing Helhound's Fury
	136978, -- Ember of Nullification
	137400, -- Coagulated Nightwell Residue
	135702, -- Legion Season 1Vindictive Gladiator's Insignia of Victory
	136267, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Victory
	135815, -- Legion Season 1Vindictive Gladiator's Insignia of Victory
	136154, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Victory
	135693, -- Legion Season 1Vindictive Gladiator's Insignia of Conquest
	136258, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Conquest
	135806, -- Legion Season 1Vindictive Gladiator's Insignia of Conquest
	136145, -- Legion Season 1 EliteVindictive Gladiator's Insignia of Conquest
	139327, -- Unbridled Fury
	140791, -- Royal Dagger Haft
	138225, -- Phantasmal Echo
	140807, -- Infernal Contract
	139335, -- Grotesque Statuette
	139324, -- Goblet of Nightmarish Ichor
	140797, -- Fang of Tichcondrius
	139630, -- Etching of SargerasDemon Hunter
	140789 -- Animated Exoskeleton
}
local PLH_LONG_ADDON_NAME_PREFIX = '<' .. PLH_LONG_ADDON_NAME .. '> '
local PLH_SHORT_ADDON_NAME_PREFIX = '<PLH> '
PLH_ITEM_LEVEL_PATTERN = _G.ITEM_LEVEL
PLH_ITEM_LEVEL_PATTERN = PLH_ITEM_LEVEL_PATTERN:gsub('%%d', '(%%d+)')  -- 'Item Level (%d+)'
PLH_RELIC_TOOLTIP_TYPE_PATTERN = _G.RELIC_TOOLTIP_TYPE
PLH_RELIC_TOOLTIP_TYPE_PATTERN = PLH_RELIC_TOOLTIP_TYPE_PATTERN:gsub('%%s', '(.+)')  -- '(.+) Artifact Relic'
	  
local tooltip

local waitTable = {};     -- used by PLH_wait
local waitFrame = nil;    -- used by PLH_wait

local waitTable2 = {};     -- used by PLH_wait
local waitFrame2 = nil;    -- used by PLH_wait

local waitTable3 = {};     -- used by PLH_wait
local waitFrame3 = nil;    -- used by PLH_wait

local function CreateEmptyTooltip()
    local tip = CreateFrame('GameTooltip')
	local leftside = {}
	local rightside = {}
	local L, R
    for i = 1, 6 do
        L, R = tip:CreateFontString(), tip:CreateFontString()
        L:SetFontObject(GameFontNormal)
        R:SetFontObject(GameFontNormal)
        tip:AddFontStrings(L, R)
        leftside[i] = L
		rightside[i] = R
    end
    tip.leftside = leftside
	tip.rightside = rightside
    return tip
end

function PLH_GetRelicType(item)
	local relicType = nil
	
	if item ~= nil then
		tooltip = tooltip or CreateEmptyTooltip()
		tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
		tooltip:ClearLines()
		tooltip:SetHyperlink(item)

		local index = 1
		local t
		while not relicType and tooltip.leftside[index] do
			t = tooltip.leftside[index]:GetText()
			if t ~= nil then
--				relicType = t:match('(.+) Artifact Relic')
				relicType = t:match(PLH_RELIC_TOOLTIP_TYPE_PATTERN)				
			end
			index = index + 1
		end

		tooltip:Hide()
	end
	
	return relicType
end

function PLH_GetRealILVL(item)
	local realILVL = nil
	
	if item ~= nil then
		tooltip = tooltip or CreateEmptyTooltip()
		tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
		tooltip:ClearLines()
		tooltip:SetHyperlink(item)
		local t = tooltip.leftside[2]:GetText()
		if t ~= nil then
--			realILVL = t:match('Item Level (%d+)')
			realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
		end
		-- ilvl can be in the 2nd or 3rd line dependng on the tooltip; if we didn't find it in 2nd, try 3rd
		if realILVL == nil then
			t = tooltip.leftside[3]:GetText()
			if t ~= nil then
--				realILVL = t:match('Item Level (%d+)')
				realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
			end
		end
		tooltip:Hide()
		
		-- if realILVL is still nil, we couldn't find it in the tooltip - try grabbing it from getItemInfo, even though
		--   that doesn't return upgrade levels
		if realILVL == nil then
			_, _, _, realILVL, _, _, _, _, _, _, _ = GetItemInfo(item)
		end
	end
	
	if realILVL == nil then
		return 0
	else		
		return tonumber(realILVL)
	end
end

function PLH_GetFullName(name, realm)
	if name == nil then
		return nil
	elseif realm == nil then
		return name
	else
		return name .. '-' .. realm
	end
end

function PLH_GetUnitNameWithRealm(unit)
	local guid
	if unit ~= nil then
		guid = UnitGUID(unit)
	end
	if guid ~= nil then
		local _, _, _, _, _, name, realm = GetPlayerInfoByGUID(guid)
		if not realm or realm == '' then
			realm = GetRealmName()
		end
		return PLH_GetFullName(name, realm)
	else
		return nil
	end
end

function PLH_GetNameWithoutRealm(name)
	return (Ambiguate(name, 'short'))
end

-- given a name-realm combo, returns the GUID for that character
function PLH_GetUnitGUIDFromFullname(fullname)
	local guid = UnitGUID(fullname)
	if guid == nil then
		guid = UnitGUID(Ambiguate(fullname, 'short'))
	end
	return guid
end

function PLH_IsInLFR()
	return IsInGroup(LE_PARTY_CATEGORY_INSTANCE) and IsInRaid()
end

local function CanUseRaidWarning()
	return UnitIsGroupLeader('player') or UnitIsRaidOfficer('player')
end

local function GetBroadcastChannel(isHighPriority)
	local channel
	if IsInGroup() then
		if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then
			if CanUseRaidWarning() and isHighPriority then 
				channel = 'RAID_WARNING'
			else
				channel = 'INSTANCE_CHAT'
			end
		elseif IsInRaid() then
			if CanUseRaidWarning() and isHighPriority then 
				channel = 'RAID_WARNING'
			else
				channel = 'RAID'
			end
		else	
			channel = 'PARTY'
		end
	else
		channel = 'EMOTE'  -- for testing purposes
	end
	return channel
end

local function GetColoredMessage(message, color)
	if message ~= nil then
		message = color .. message   							-- set desired color at the start
		message = string.gsub(message, '|r', '|r' .. color)		-- set to our color if the message sets color to default (ex: end of an item link)
		message = message .. _G.FONT_COLOR_CODE_CLOSE			-- set color back to default
	end
	return message
end

function PLH_SendBroadcast(message, isHighPriority)
	SendChatMessage(PLH_SHORT_ADDON_NAME_PREFIX .. message, GetBroadcastChannel(isHighPriority))
end	

function PLH_SendWhisper(message, person)
	SendChatMessage(PLH_SHORT_ADDON_NAME_PREFIX .. message, 'WHISPER', nil, person)
end

function PLH_SendAlert(message)
	print(GetColoredMessage(PLH_SHORT_ADDON_NAME_PREFIX, _G.YELLOW_FONT_COLOR_CODE) .. GetColoredMessage(message, _G.GREEN_FONT_COLOR_CODE))
end	

function PLH_SendUserMessage(message)
	print(GetColoredMessage(PLH_SHORT_ADDON_NAME_PREFIX, _G.YELLOW_FONT_COLOR_CODE) .. GetColoredMessage(message, _G.LIGHTYELLOW_FONT_COLOR_CODE))
end	

-- having 3 of the same function is very much a hack...multiple waits can happen during inspect loop, so we need different global vars to track separate timers
-- I could consolidate to a single function with a param determining which globals to use, but I'm not even sure this will
-- solve the inspect issues, hence the quick-and-dirty approach
function PLH_wait(delay, func, ...)
  if(type(delay)~='number' or type(func)~='function') then
  print('bad types')
    return false;
  end
  if(waitFrame == nil) then
    waitFrame = CreateFrame('Frame','WaitFrame', UIParent);
    waitFrame:SetScript('onUpdate',function (self,elapse)
      local count = #waitTable;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable,{delay,func,{...}});
  return true;
end

function PLH_wait2(delay, func, ...)
  if(type(delay)~='number' or type(func)~='function') then
  print('bad types')
    return false;
  end
  if(waitFrame2 == nil) then
    waitFrame2 = CreateFrame('Frame','WaitFrame2', UIParent);
    waitFrame2:SetScript('onUpdate',function (self,elapse)
      local count = #waitTable2;
      local i = 1;
      while(i<=count) do
        local waitRecord = tremove(waitTable2,i);
        local d = tremove(waitRecord,1);
        local f = tremove(waitRecord,1);
        local p = tremove(waitRecord,1);
        if(d>elapse) then
          tinsert(waitTable2,i,{d-elapse,f,p});
          i = i + 1;
        else
          count = count - 1;
          f(unpack(p));
        end
      end
    end);
  end
  tinsert(waitTable2,{delay,func,{...}});
  return true;
end

-----------------------------------------------------------------------
function PLH_CreateOptionsPanel()

	local VERTICAL_SPACE_BETWEEN_ELEMENTS = 15

	--[[ Main Panel ]]--
	local PLHConfigFrame = CreateFrame('Frame', 'PLHConfigFrame', InterfaceOptionsFramePanelContainer)
	PLHConfigFrame:Hide()
	PLHConfigFrame.name = PLH_LONG_ADDON_NAME
	InterfaceOptions_AddCategory(PLHConfigFrame)

	--[[ Title ]]--
	local TitleLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalLarge')
	TitleLabel:SetPoint('TOPLEFT', PLHConfigFrame, 'TOPLEFT', 16, -16)
	TitleLabel:SetText(PLH_ADDON_NOTE)

	-- [[ Version ]] --
	--local AddonVersion = GetAddOnMetadata("PersonalLootHelper", "Version")
	local VersionLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	VersionLabel:SetPoint('BOTTOMLEFT', TitleLabel, 'BOTTOMRIGHT', 8, 0)
	--VersionLabel:SetText('v' .. AddonVersion)

	--[[ Author ]]--
	local AuthorLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormalSmall')
	AuthorLabel:SetPoint('TOPRIGHT', PLHConfigFrame, 'TOPRIGHT', -16, -24)
	AuthorLabel:SetText(PLH_AUTHOR_NAME)

	--[[ PLH_INCLUDE_BOE ]]--
	PLH_IncludeBOECheckbox = CreateFrame('CheckButton', 'PLHIncludeBOE', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_IncludeBOECheckbox:SetPoint('TOPLEFT', TitleLabel, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_IncludeBOECheckbox:SetChecked(PLH_INCLUDE_BOE)

	local IncludeBOELabel = PLH_IncludeBOECheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	IncludeBOELabel:SetPoint('LEFT', PLH_IncludeBOECheckbox, 'RIGHT', 0, 0)
	IncludeBOELabel:SetText(PLH_INCLUDE_BOEITEM)

	--[[ PLH_CURRENT_SPEC_ONLY ]]--
	PLH_CurrentSpecOnlyCheckbox = CreateFrame('CheckButton', 'PLHCurrentSpecOnly', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CurrentSpecOnlyCheckbox:SetPoint('TOPLEFT', PLH_IncludeBOECheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_CurrentSpecOnlyCheckbox:SetChecked(PLH_CURRENT_SPEC_ONLY)

	local CurrentSpecOnlyLabel = PLH_CurrentSpecOnlyCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	CurrentSpecOnlyLabel:SetPoint('LEFT', PLH_CurrentSpecOnlyCheckbox, 'RIGHT', 0, 0)
	CurrentSpecOnlyLabel:SetText(PLH_SPEC_ONLY)

	--[[ PLH_NOTIFY_GROUP ]]--
	PLH_NotifyGroupCheckbox = CreateFrame('CheckButton', 'PLHNotifyGroup', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_NotifyGroupCheckbox:SetPoint('TOPLEFT', PLH_CurrentSpecOnlyCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_NotifyGroupCheckbox:SetChecked(PLH_NOTIFY_GROUP)

	local NotifyGroupLabel = PLH_NotifyGroupCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	NotifyGroupLabel:SetPoint('LEFT', PLH_NotifyGroupCheckbox, 'RIGHT', 0, 0)
	NotifyGroupLabel:SetText(PLH_NOTIFY_GROUPS)

	--[[ PLH_COORDINATE_ROLLS ]]--
	PLH_CoordinateRollsCheckbox = CreateFrame('CheckButton', 'PLHCoordinateRolls', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CoordinateRollsCheckbox:SetPoint('TOPLEFT', PLH_NotifyGroupCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_CoordinateRollsCheckbox:SetChecked(PLH_COORDINATE_ROLLS)

	PLH_CoordinateRollsLabel1 = PLH_CoordinateRollsCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	PLH_CoordinateRollsLabel1:SetPoint('LEFT', PLH_CoordinateRollsCheckbox, 'RIGHT', 0, 0)
	PLH_CoordinateRollsLabel1:SetText(PLH_COORDINATE_ROLL)

	PLH_CoordinateRollsLabel2 = PLH_CoordinateRollsCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	PLH_CoordinateRollsLabel2:SetPoint('TOPLEFT', PLH_CoordinateRollsLabel1, 'BOTTOMLEFT', 20, -10)
	PLH_CoordinateRollsLabel2:SetText(PLH_MANAGE_ROLLS)
	PLH_CoordinateRollsLabel2:SetWordWrap(true)
	PLH_CoordinateRollsLabel2:SetJustifyH('LEFT')
	PLH_CoordinateRollsLabel2:SetWidth(450)

	--[[ PLH_CHECK_CHARACTER_LEVEL ]]--
	PLH_CheckCharacterLevelCheckbox = CreateFrame('CheckButton', 'PLHCheckCharacterLevel', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_CheckCharacterLevelCheckbox:SetPoint('TOPLEFT', PLH_CoordinateRollsCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS*3)
	PLH_CheckCharacterLevelCheckbox:SetChecked(PLH_CHECK_CHARACTER_LEVEL)

	local CheckCharacterLevelLabel = PLH_CheckCharacterLevelCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	CheckCharacterLevelLabel:SetPoint('LEFT', PLH_CheckCharacterLevelCheckbox, 'RIGHT', 0, 0)
	CheckCharacterLevelLabel:SetText(PLH_NO_LOWLEVEL)

	--[[ PLH_HIGHLIGHT_RAID_FRAMES ]]--
	PLH_HighlightRaidFramesCheckbox = CreateFrame('CheckButton', 'PLHHighlightRaidFrames', PLHConfigFrame, 'InterfaceOptionsCheckButtonTemplate')
	PLH_HighlightRaidFramesCheckbox:SetPoint('TOPLEFT', PLH_CheckCharacterLevelCheckbox, 'BOTTOMLEFT', 0, -VERTICAL_SPACE_BETWEEN_ELEMENTS)
	PLH_HighlightRaidFramesCheckbox:SetChecked(PLH_HIGHLIGHT_RAID_FRAMES)

	local HighlightRaidFramesLabel = PLH_HighlightRaidFramesCheckbox:CreateFontString(nil, 'ARTWORK', 'GameFontHighlight')
	HighlightRaidFramesLabel:SetPoint('LEFT', PLH_HighlightRaidFramesCheckbox, 'RIGHT', 0, 0)
	HighlightRaidFramesLabel:SetText(PLH_SHOW_INRAID)

	--[[ PLH_HIGHLIGHT_SIZE ]]--
	PLH_HighlightSizeSlider = CreateFrame("Slider", "PLHHighlightSize", PLHConfigFrame, "OptionsSliderTemplate")
	PLHConfigFrame.ScalingSlider = slider
	PLH_HighlightSizeSlider:SetOrientation("HORIZONTAL")
	PLH_HighlightSizeSlider:SetMinMaxValues(10, 30)
	PLH_HighlightSizeSlider:SetValueStep(1)
	PLH_HighlightSizeSlider:SetObeyStepOnDrag(true)
	PLH_HighlightSizeSlider:SetWidth(180)
	PLH_HighlightSizeSlider:SetHeight(16)
	PLH_HighlightSizeSlider:SetPoint("LEFT", HighlightRaidFramesLabel, "RIGHT", 20, 0)
	_G[PLH_HighlightSizeSlider:GetName().."High"]:SetText(BINDING_NAME_CAMERAZOOMIN)
	_G[PLH_HighlightSizeSlider:GetName().."Low"]:SetText(BINDING_NAME_CAMERAZOOMOUT)
	_G[PLH_HighlightSizeSlider:GetName().."Text"]:SetText(EMBLEM_SYMBOL)
	PLH_HighlightSizeSlider:SetValue(PLH_HIGHLIGHT_SIZE)
	
	--[[ Thank you message ]] --
	local ThankYouLabel = PLHConfigFrame:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
	ThankYouLabel:SetPoint('BOTTOM', PLHConfigFrame, 'BOTTOM', 0, 48)
	ThankYouLabel:SetText(PLH_THANKS_ALL)
	ThankYouLabel:SetWidth(400)
	ThankYouLabel:SetWordWrap(true)

	--[[ OnShow Event]]
	PLHConfigFrame:SetScript('OnShow', function(frame)
		PLH_IncludeBOECheckbox:SetChecked(PLH_INCLUDE_BOE)
		PLH_CurrentSpecOnlyCheckbox:SetChecked(PLH_CURRENT_SPEC_ONLY)
		PLH_CheckCharacterLevelCheckbox:SetChecked(PLH_CHECK_CHARACTER_LEVEL)
		PLH_HighlightRaidFramesCheckbox:SetChecked(PLH_HIGHLIGHT_RAID_FRAMES)
		PLH_NotifyGroupCheckbox:SetChecked(PLH_NOTIFY_GROUP)
		PLH_CoordinateRollsCheckbox:SetChecked(PLH_COORDINATE_ROLLS)
		PLH_HighlightSizeSlider:SetValue(PLH_HIGHLIGHT_SIZE)
	end)

	--[[ Okay Action ]]--
	function PLHConfigFrame.okay(arg1, arg2, arg3, ...)
		PLH_INCLUDE_BOE = PLH_IncludeBOECheckbox:GetChecked()
		PLH_CURRENT_SPEC_ONLY = PLH_CurrentSpecOnlyCheckbox:GetChecked()
		PLH_CHECK_CHARACTER_LEVEL = PLH_CheckCharacterLevelCheckbox:GetChecked()
		PLH_HIGHLIGHT_RAID_FRAMES = PLH_HighlightRaidFramesCheckbox:GetChecked()
		PLH_NOTIFY_GROUP = PLH_NotifyGroupCheckbox:GetChecked()
		PLH_COORDINATE_ROLLS = PLH_CoordinateRollsCheckbox:GetChecked()
		PLH_HIGHLIGHT_SIZE = PLH_HighlightSizeSlider:GetValue()
		PLH_ResizeHighlights()
	end

end
------------------------------------------------------------
-- slash command
SLASH_PLHelperCommand1 = '/plh'

local NOTIFY_MODE_SELF = 1
local NOTIFY_MODE_GROUP = 2
local NOTIFY_MODE_COORDINATE_ROLLS = 3

local DEFAULT_NOTIFY_MODE = NOTIFY_MODE_SELF
local DEFAULT_INCLUDE_BOE = false
local DEFAULT_MIN_ILVL = 528  -- personal loot was introduced with Siege of Orgrimmar, which started at ilvl 528
local DEFAULT_MIN_QUALITY = 3  -- Rare
local DEFAULT_CURRENT_SPEC_ONLY = false
local DEFAULT_CHECK_CHARACTER_LEVEL = true
local DEFAULT_HIGHLIGHT_RAID_FRAMES = true
local DEFAULT_HIGHLIGHT_SIZE = 21

local TRADE_MESSAGE = 'TRADE'  -- added some hardcording in ProcessWhisper for various way people may offer to trade items; customize text there if needed (ex: foreign languages)
local DELAY_BETWEEN_ROLLS = 4 -- in seconds
local UNHIGHLIGHT_DELAY = 105  -- in seconds
local DELAY_BETWEEN_INSPECTIONS = 1  -- in seconds
local MAX_INSPECT_LOOPS = 4    -- maximum # of times to retry calling NotifyInspect on all members in the roster for whom we've cached fewer than the expected number of items
local NUM_EXPECTED_ITEMS = 15 -- number of items we expect each person to have equipped (based on having something in every gear) plus 3 relics
	-- slot; if we've cached fewer than that amount of items for a character, we'll include that character in additional
	-- inspect loops.
--local MAX_INSPECT_RETRIES = 2  -- maximum # of times to retry calling NotifyInspect for a specific character if we don't get an INSPECT_READY
local NUM_EXPECTED_RELICS_110 = 2
local NUM_EXPECTED_RELICS_101 = 1
local MAX_INSPECTS_PER_CHARACTER = 5
local MAX_NAMES_TO_SHOW = 4
local PLH_RELICSLOT = 1000  -- for indexing relics in groupInfoCache

local DEATH_KNIGHT = select(2, GetClassInfo(6))
local DEMON_HUNTER = select(2, GetClassInfo(12))
local DRUID = select(2, GetClassInfo(11))
local HUNTER = select(2, GetClassInfo(3))
local MAGE = select(2, GetClassInfo(8))
local MONK = select(2, GetClassInfo(10))
local PALADIN = select(2, GetClassInfo(2))
local PRIEST = select(2, GetClassInfo(5))
local ROGUE = select(2, GetClassInfo(4))
local SHAMAN = select(2, GetClassInfo(7))
local WARLOCK = select(2, GetClassInfo(9))
local WARRIOR = select(2, GetClassInfo(1))

local ValidGear = {
--	{ DEATH_KNIGHT, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
--	{ DEATH_KNIGHT, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
--	{ DEATH_KNIGHT, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_MAIL },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_PLATE },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE2H },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE2H },
	{ DEATH_KNIGHT, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD2H },

--	{ DEMON_HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ DEMON_HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ DEMON_HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ DEMON_HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_WARGLAIVE },

--	{ DRUID, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ DRUID, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ DRUID, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ DRUID, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE2H },

--	{ HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
--	{ HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_MAIL },
	{ HUNTER, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE2H },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD2H },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_BOWS },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_CROSSBOW },
	{ HUNTER, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_GUNS },

	{ MAGE, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ MAGE, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ MAGE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ MAGE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ MAGE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ MAGE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_WAND },

--	{ MONK, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ MONK, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ MONK, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ MONK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },

--	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
--	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
--	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_MAIL },
	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_PLATE },
	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ PALADIN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_SHIELD },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE2H },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE2H },
	{ PALADIN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD2H },

	{ PRIEST, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ PRIEST, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ PRIEST, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ PRIEST, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ PRIEST, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ PRIEST, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_WAND },

--	{ ROGUE, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ ROGUE, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ ROGUE, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_BOWS },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_CROSSBOW },
	{ ROGUE, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_GUNS },

--	{ SHAMAN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
--	{ SHAMAN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
	{ SHAMAN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_MAIL },
	{ SHAMAN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ SHAMAN, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_SHIELD },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE2H },
	{ SHAMAN, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE2H },

	{ WARLOCK, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
	{ WARLOCK, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ WARLOCK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ WARLOCK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ WARLOCK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ WARLOCK, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_WAND },

--	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_CLOTH },
--	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_LEATHER },
--	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_MAIL },
	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_PLATE },
	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_GENERIC },
	{ WARRIOR, LE_ITEM_CLASS_ARMOR, LE_ITEM_ARMOR_SHIELD },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE1H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_DAGGER },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_UNARMED },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE1H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_POLEARM },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_STAFF },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD1H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_AXE2H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_MACE2H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_SWORD2H },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_BOWS },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_CROSSBOW },
	{ WARRIOR, LE_ITEM_CLASS_WEAPON, LE_ITEM_WEAPON_GUNS }
}

local ValidRelics = {
	[250] = {RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_IRON}, -- Blood DK
	[251] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FROST}, -- Frost DK
	[252] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD}, -- Unholy DK

	[577] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FEL}, -- Havoc DH
	[581] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FEL}, -- Vengeance DH

	[102] = {RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_ARCANE}, -- Balance Druid
	[103] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Feral Druid
	[104] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Guardian Druid
	[105] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE}, -- Restoration Druid

	[253] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_IRON}, -- Beast Mastery Hunter
	[254] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_LIFE}, -- Marksmanship Hunter
	[255] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD}, -- Survival Hunter

	[62] = {RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_ARCANE}, -- Arcane Mage
	[63] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FIRE}, -- Fire Mage
	[64] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_ARCANE, RELIC_SLOT_TYPE_FROST}, -- Frost Mage

	[268] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON}, -- Brewmaster Monk
	[270] = {RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_WIND}, -- Mistweaver Monk
	[269] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Windwalker Monk

	[65] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_HOLY}, -- Holy Paladin
	[66] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_ARCANE}, -- Protection Paladin
	[70] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_HOLY}, -- Retribution Paladin

	[256] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_HOLY}, -- Discipline Priest
	[257] = {RELIC_SLOT_TYPE_HOLY, RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_HOLY}, -- Holy Priest
	[258] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Shadow Priest

	[259] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD}, -- Assassination Rogue
	[260] = {RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Outlaw Rogue
	[261] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FEL}, -- Subtlety Rogue

	[262] = {RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_WIND}, -- Elemental Shaman
	[263] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_WIND}, -- Enhancement Shaman
	[264] = {RELIC_SLOT_TYPE_LIFE, RELIC_SLOT_TYPE_FROST, RELIC_SLOT_TYPE_LIFE}, -- Restoration Shaman

	[265] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Affliction Warlock
	[266] = {RELIC_SLOT_TYPE_SHADOW, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_FEL}, -- Demonology Warlock
	[267] = {RELIC_SLOT_TYPE_FEL, RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_FEL}, -- Destruction Warlock

	[71] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_SHADOW}, -- Arms Warrior
	[72] = {RELIC_SLOT_TYPE_FIRE, RELIC_SLOT_TYPE_WIND, RELIC_SLOT_TYPE_IRON}, -- Fury Warrior
	[73] = {RELIC_SLOT_TYPE_IRON, RELIC_SLOT_TYPE_BLOOD, RELIC_SLOT_TYPE_FIRE}, -- Protection Warrior
}

-- IDs for following are from http://wow.gamepedia.com/API_GetInspectSpecialization
local PrimaryAttributes = {
	{ DEATH_KNIGHT, 'Any', ITEM_MOD_STRENGTH_SHORT },
	
	{ DEMON_HUNTER, 'Any', ITEM_MOD_AGILITY_SHORT },
	
	{ DRUID, 102, ITEM_MOD_INTELLECT_SHORT },			-- balance
	{ DRUID, 103, ITEM_MOD_AGILITY_SHORT },			-- feral
	{ DRUID, 104, ITEM_MOD_AGILITY_SHORT },			-- guardian
	{ DRUID, 105, ITEM_MOD_INTELLECT_SHORT },			-- restoration
	
	{ HUNTER, 'Any', ITEM_MOD_AGILITY_SHORT },
	
	{ MAGE, 'Any', ITEM_MOD_INTELLECT_SHORT },

	{ MONK, 268, ITEM_MOD_AGILITY_SHORT },				-- brewmaster
	{ MONK, 270, ITEM_MOD_INTELLECT_SHORT },			-- mistweaver
	{ MONK, 269, ITEM_MOD_AGILITY_SHORT },				-- windwalker
	
	{ PALADIN, 65, ITEM_MOD_INTELLECT_SHORT },			-- holy
	{ PALADIN, 66, ITEM_MOD_STRENGTH_SHORT },			-- protection
	{ PALADIN, 70, ITEM_MOD_STRENGTH_SHORT },			-- retribution

	{ PRIEST, 'Any', ITEM_MOD_INTELLECT_SHORT },
	
	{ ROGUE, 'Any', ITEM_MOD_AGILITY_SHORT },

	{ SHAMAN, 262, ITEM_MOD_INTELLECT_SHORT },			-- elemental
	{ SHAMAN, 263, ITEM_MOD_AGILITY_SHORT },			-- enhancement
	{ SHAMAN, 264, ITEM_MOD_INTELLECT_SHORT },			-- restoration
	
	{ WARLOCK, 'Any', ITEM_MOD_INTELLECT_SHORT },
	
	{ WARRIOR, 'Any', ITEM_MOD_STRENGTH_SHORT }
}
	
local OffspecAttributes = {
	{ DRUID, 102, ITEM_MOD_AGILITY_SHORT },			-- balance
	{ DRUID, 103, ITEM_MOD_INTELLECT_SHORT },			-- feral
	{ DRUID, 104, ITEM_MOD_INTELLECT_SHORT },			-- guardian
	{ DRUID, 105, ITEM_MOD_AGILITY_SHORT },			-- restoration

	{ MONK, 268, ITEM_MOD_INTELLECT_SHORT },			-- brewmaster
	{ MONK, 270, ITEM_MOD_AGILITY_SHORT },				-- mistweaver
	{ MONK, 269, ITEM_MOD_INTELLECT_SHORT },			-- windwalker

	{ PALADIN, 65, ITEM_MOD_STRENGTH_SHORT },			-- holy
	{ PALADIN, 66, ITEM_MOD_INTELLECT_SHORT },			-- protection
	{ PALADIN, 70, ITEM_MOD_INTELLECT_SHORT },			-- retribution

	{ SHAMAN, 262, ITEM_MOD_AGILITY_SHORT },			-- elemental
	{ SHAMAN, 263, ITEM_MOD_INTELLECT_SHORT },			-- enhancement
	{ SHAMAN, 264, ITEM_MOD_AGILITY_SHORT }			-- restoration
	
}

-- note that the following is only valid for Legion; previously different weapons were possible (ex: feral staff vs. 2 fist weapons)
-- adding 3 for relics
local ExpectedItemCount = {			-- number of items expected by spec, assuming person has gear in every slot
	{ DEATH_KNIGHT, 250, 15 },			-- blood
	{ DEATH_KNIGHT, 251, 16 },			-- frost
	{ DEATH_KNIGHT, 252, 15 },			-- unholy
	
	{ DEMON_HUNTER, 577, 16 },			-- havoc
	{ DEMON_HUNTER, 581, 16 },			-- vengeance
	
	{ DRUID, 102, 15 },					-- balance
	{ DRUID, 103, 16 },					-- feral
	{ DRUID, 104, 16 },					-- guardian
	{ DRUID, 105, 15 },					-- restoration
	
	{ HUNTER, 253, 15 },					-- beast mastery
	{ HUNTER, 254, 15 },					-- marksmanship
	{ HUNTER, 255, 15 },					-- survival
	
	{ MAGE, 62, 15 },						-- arcane
	{ MAGE, 63, 16 },						-- fire
	{ MAGE, 64, 15 },						-- frost

	{ MONK, 268, 15 },					-- brewmaster
	{ MONK, 270, 15 },					-- mistweaver
	{ MONK, 269, 16 },					-- windwalker
	
	{ PALADIN, 65, 15 },					-- holy
	{ PALADIN, 66, 16 },					-- protection
	{ PALADIN, 70, 15 },					-- retribution

	{ PRIEST, 256, 15 },					-- discipline
	{ PRIEST, 257, 15 },					-- holy
	{ PRIEST, 258, 16 },					-- shadow
	
	{ ROGUE, 259, 16 },					-- assassination
	{ ROGUE, 260, 16 },					-- outlaw
	{ ROGUE, 261, 16 },					-- subtlety

	{ SHAMAN, 262, 16 },					-- elemental
	{ SHAMAN, 263, 16 },					-- enhancement
	{ SHAMAN, 264, 16 },					-- restoration
	
	{ WARLOCK, 256, 15 },					-- affliction
	{ WARLOCK, 266, 16 },					-- demonology
	{ WARLOCK, 267, 15 },					-- destruction
	
	{ WARRIOR, 71, 15 },					-- arms
	{ WARRIOR, 72, 16 },					-- fury
	{ WARRIOR, 73, 16 }					-- protection
}

-- set up Frames that will listen for events
local addonLoadedFrame
local lootReceivedEventFrame
local whisperReceivedEventFrame
local bnWhisperReceivedEventFrame
local rollReceivedEventFrame
local inspectReadyEventFrame
local rosterUpdatedEventFrame
local combatStatusChangedEventFrame
local rollDelayFrame
local highlightDelayFrame
local groupMemberInfoChangedEventFrame

-- set up variables that will track addon's status
local isEnabled = false
local delay = 0
local nextRollDelay = 0
local unhighlightDelay = 0
local priorCacheRefreshTime = 0

local whisperedItems = {}  -- list of items we've whispered to people; index is character name-realm, content is item

local numOfQueuedRollItems = 0;
local queuedRollOwners = {}
local queuedRollItems = {}

local currentRollOwner = nil
local currentRollItem = nil
local currentRolls = {}
local PLH_RANDOM_ROLL_RESULT_PATTERN = _G.RANDOM_ROLL_RESULT
	  PLH_RANDOM_ROLL_RESULT_PATTERN = PLH_RANDOM_ROLL_RESULT_PATTERN:gsub('%%s', '(.+)')
	  PLH_RANDOM_ROLL_RESULT_PATTERN = PLH_RANDOM_ROLL_RESULT_PATTERN:gsub('%%d %(%%d%-%%d%)', '(%%d+) %%((%%d+)%%-(%%d+)%%)')
	  PLH_RANDOM_ROLL_RESULT_PATTERN = '^' .. PLH_RANDOM_ROLL_RESULT_PATTERN .. '$'
local LOOT_ITEM_SELF_PATTERN = _G.LOOT_ITEM_SELF
	  LOOT_ITEM_SELF_PATTERN = LOOT_ITEM_SELF_PATTERN:gsub('%%s', '(.+)')
local LOOT_ITEM_PATTERN = _G.LOOT_ITEM
	  LOOT_ITEM_PATTERN = LOOT_ITEM_PATTERN:gsub('%%s', '(.+)')
	  
-- set up variables that will cache group member's information
local groupInfoCache = {}  -- array keyed by name-realm paired with a list of slotid-items
local maxInspectIndex = 0  -- the index of the last character in GetRaidRosterInfo(); must be < inspectIndex to start with so PopulateGroupInfoCache can start inspections
local inspectIndex = maxInspectIndex + 1    -- the index of the character within GetRaidRosterInfo() that we're currently inspecting
											-- defaulting to a higher value so PopulateGroupCache() knows to start a new inspection loop the first time it is called
local notifyInspectName = nil -- valued if we sent a request to inspect someone, nil otherwise
--local inspectRetries = 0  -- tracks how many times we've attempted to inspect a specific character without getting an INSPECT_READY result
local inspectLoop = MAX_INSPECT_LOOPS + 1 -- defaulting to a higher value so PopulateGroupCache() knows to start a new inspection loop the first time it is called

local raidFrameTextures = {}  -- array indexed by characterName-realmName, containing texture to be shown in raid frames (for loot identification)
local raidFrameTooltips = {}  -- array indexed by characterName-realmName, containing tooltip to be shown in raid frames (for loot identification)

-- indexes of array returned by GetFullItemInfo()
local FII_ITEM = "ITEM"									-- contains the actual item
local FII_NAME = "NAME"									-- return value 1 of Blizzard API call GetItemInfo()
local FII_LINK = "LINK"									-- return value 2 of Blizzard API call GetItemInfo()
local FII_QUALITY = "QUALITY"							-- return value 3 of Blizzard API call GetItemInfo()
local FII_BASE_ILVL = "BASE_ILVL"						-- return value 4 of Blizzard API call GetItemInfo()
local FII_REQUIRED_LEVEL = "REQUIRED_LEVEL"				-- return value 5 of Blizzard API call GetItemInfo()
local FII_TYPE = "TYPE"									-- return value 6 of Blizzard API call GetItemInfo()
local FII_SUB_TYPE = "SUB_TYPE"							-- return value 7 of Blizzard API call GetItemInfo()
local FII_MAX_STACK = "MAX_STACK"						-- return value 8 of Blizzard API call GetItemInfo()
local FII_ITEM_EQUIP_LOC = "ITEM_EQUIP_LOC"				-- return value 9 of Blizzard API call GetItemInfo()
local FII_TEXTURE = "TEXTURE"							-- return value 10 of Blizzard API call GetItemInfo()
local FII_VENDOR_PRICE = "VENDOR_PRICE"					-- return value 11 of Blizzard API call GetItemInfo()
local FII_CLASS = "CLASS"								-- return value 12 of Blizzard API call GetItemInfo()
local FII_SUB_CLASS = "SUB_CLASS"						-- return value 13 of Blizzard API call GetItemInfo()
local FII_BIND_TYPE = "BIND_TYPE"						-- return value 14 of Blizzard API call GetItemInfo()
local FII_EXPAC_ID = "EXPAC_ID"							-- return value 15 of Blizzard API call GetItemInfo()
local FII_ITEM_SET_ID = "ITEM_SET_ID"					-- return value 16 of Blizzard API call GetItemInfo()
local FII_IS_CRAFTING_REAGENT = "IS_CRAFTING_REAGENT"	-- return value 17 of Blizzard API call GetItemInfo()
local FII_IS_EQUIPPABLE = "IS_EQUIPPABLE"				-- true if the item is equippable, false otherwise
local FII_IS_RELIC = "IS_RELIC"							-- true if item is a relic, false otherwise
local FII_REAL_ILVL = "REAL_ILVL"						-- real ilvl, derived from tooltip
local FII_RELIC_TYPE = "RELIC_TYPE"						-- relic type, derived from tooltip
local FII_CLASSES = "CLASSES"							-- uppercase string of classes that can use the item (ex: tier); nil if item is not class-restricted

local PLH_CLASSES_ALLOWED_PATTERN = _G.ITEM_CLASSES_ALLOWED
	  PLH_CLASSES_ALLOWED_PATTERN = PLH_CLASSES_ALLOWED_PATTERN:gsub('%%s', '(.+)')  -- 'Classes: (.+)'
local tooltip

--[[
creates an empty tooltip that is ready to be populated with the information from an item
-- note: a complicated tooltip could have the following lines (ex):
	1 - Oathclaw Helm, nil
	2 - Mythic, nil
	3 - Item Level 735
	4 - Upgrade Level: 2/2, nil
	5 - Binds when picked up, nil
	6 - Head, Leather
	
	rows - how many rows of the tooltip to populate; prior to version 1.24 we only cared about the first 6 rows, but to find the "classes:" row we have to go much deeper
]]--
local function CreateEmptyTooltip(rows)
    local tip = CreateFrame('GameTooltip')
	local leftside = {}
	local rightside = {}
	local L, R
    for i = 1, rows do
        L, R = tip:CreateFontString(), tip:CreateFontString()
        L:SetFontObject(GameFontNormal)
        R:SetFontObject(GameFontNormal)
        tip:AddFontStrings(L, R)
        leftside[i] = L
		rightside[i] = R
    end
    tip.leftside = leftside
	tip.rightside = rightside
    return tip
end

local function GetFullItemInfo(item)
	fullItemInfo = {}
	if item ~= nil then
		fullItemInfo[FII_ITEM] = item
		
		-- determine the basic values from the Blizzard GetItemInfo() API call
		fullItemInfo[FII_NAME],
			fullItemInfo[FII_LINK],
			fullItemInfo[FII_QUALITY],
			fullItemInfo[FII_BASE_ILVL],
			fullItemInfo[FII_REQUIRED_LEVEL],
			fullItemInfo[FII_TYPE],
			fullItemInfo[FII_SUB_TYPE],
			fullItemInfo[FII_MAX_STACK],
			fullItemInfo[FII_ITEM_EQUIP_LOC],
			fullItemInfo[FII_TEXTURE],
			fullItemInfo[FII_VENDOR_PRICE],
			fullItemInfo[FII_CLASS],
			fullItemInfo[FII_SUB_CLASS],
			fullItemInfo[FII_BIND_TYPE],
			fullItemInfo[FII_EXPAC_ID],
			fullItemInfo[FII_ITEM_SET_ID],
			fullItemInfo[FII_IS_CRAFTING_REAGENT]
			= GetItemInfo(item)

		-- determine whether the item is equippable & whether it is a relic
		fullItemInfo[FII_IS_EQUIPPABLE] = IsEquippableItem(item)
		fullItemInfo[FII_IS_RELIC] = fullItemInfo[FII_CLASS] == LE_ITEM_CLASS_GEM and fullItemInfo[FII_SUB_CLASS] == LE_ITEM_ARMOR_RELIC

		-- we only need to determine other values if it's an equippable item or a relic
		if fullItemInfo[FII_IS_EQUIPPABLE] or fullItemInfo[FII_IS_RELIC] then

			-- set up the tooltip to determine values that aren't returned via GetItemInfo()
			local rows = 30
			if fullItemInfo[FII_IS_RELIC] then
				rows = 6  -- if it's a relic, we only need to inspect the first 6 rows
			end
			tooltip = tooltip or CreateEmptyTooltip(30)
			tooltip:SetOwner(UIParent, 'ANCHOR_NONE')
			tooltip:ClearLines()
			tooltip:SetHyperlink(item)
			local t
			local index

			-- determine the real iLVL
			local realILVL = nil
			t = tooltip.leftside[2]:GetText()
			if t ~= nil then
				realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
			end
			if realILVL == nil then  -- ilvl can be in the 2nd or 3rd line dependng on the tooltip; if we didn't find it in 2nd, try 3rd
				t = tooltip.leftside[3]:GetText()
				if t ~= nil then
					realILVL = t:match(PLH_ITEM_LEVEL_PATTERN)
				end
			end
			if realILVL == nil then  -- if we still couldn't find it (shouldn't happen), just use the ilvl we got from GetItemInfo()
				realILVL = fullItemInfo[FII_BASE_ILVL]
			end
			fullItemInfo[FII_REAL_ILVL] = tonumber(realILVL)

			-- if the item is a relic, determine the relic type
			local relicType = nil
			if fullItemInfo[FII_IS_RELIC] then
				index = 1
				while not relicType and tooltip.leftside[index] do
					t = tooltip.leftside[index]:GetText()
					if t ~= nil then
						relicType = t:match(PLH_RELIC_TOOLTIP_TYPE_PATTERN)				
					end
					index = index + 1
				end
			end
			fullItemInfo[FII_RELIC_TYPE] = relicType

			-- if the item is restricted to certain classes, determine which ones
			local classes = nil
			index = 1
			while not classes and tooltip.leftside[index] do
				t = tooltip.leftside[index]:GetText()
				if t ~= nil then
					classes = t:match(PLH_CLASSES_ALLOWED_PATTERN)
				end
				index = index + 1
			end
			if classes ~= nil then
				classes = string.upper(classes)
				classes = string.gsub(classes, " ", "")  -- remove space for DEMON HUNTER, DEATH KNIGHT
			end
			fullItemInfo[FII_CLASSES] = classes

			-- hide the tooltip now that we're done with it (is this really necessary?)
			tooltip:Hide()
		end
	end

	return fullItemInfo
end

local function GetExpectedRelicCount(level)
	if level ~= nil then
		if level == 110 then
			return NUM_EXPECTED_RELICS_110
		elseif level >= 101 and level < 110 then
			return NUM_EXPECTED_RELICS_101
		end
	end
	return 0
end

local function GetExpectedItemCount(class, spec, level)
	if class ~= nil and spec ~= nil and level ~= nil then
		if level >= 101 then   -- pre-Legion, classes could use different weapons; ex: feral used a staff instead of 2 fist weapons
								-- technically the change happens once the person gets their artifact, but we'll just simplify and
								-- expect Legion counts at 101 and above, and 15 items for 100 and earlier
			local i = 1
			while ExpectedItemCount[i] do
				if class == ExpectedItemCount[i][1] and spec == ExpectedItemCount[i][2] then
					return ExpectedItemCount[i][3]
				end
				i = i + 1
			end
		end
	end
	return NUM_EXPECTED_ITEMS
end

function PLH_GetRelicCountFromCache(name)
	local relicCount = 0
	local characterDetails = groupInfoCache[name]
	if characterDetails ~= nil then
		if characterDetails[PLH_RELICSLOT + 1] ~= nil then
			relicCount = relicCount + 1
		end
		if characterDetails[PLH_RELICSLOT + 2] ~= nil then
			relicCount = relicCount + 1
		end
		if characterDetails[PLH_RELICSLOT + 3] ~= nil then
			relicCount = relicCount + 1
		end
	end
	return relicCount
end

-- only returns count of equippable items from cache; excludes relics and other cached info such as ClassName/Spec/Level
function PLH_GetItemCountFromCache(name)
	local itemCount = 0
	if groupInfoCache[name] ~= nil then
		for slotID, item in pairs (groupInfoCache[name]) do
			itemCount = itemCount + 1
		end
		itemCount = itemCount - 4 -- subtract 3 since everyone has ClassName and Spec and Level and InspectCount elements
		itemCount = itemCount - PLH_GetRelicCountFromCache(name)
	end
	return itemCount
end

-- Returns the item that character has equipped in slotID, based on the cache
local function GetEquippedItem(characterName, slotID)
	local item = nil
	if characterName == PLH_GetUnitNameWithRealm('player') then
		-- we can get the item directly
		item = GetInventoryItemLink('player', slotID)
	else
		-- we have to get the item from the cache
		local characterDetails = groupInfoCache[characterName]
		if characterDetails ~= nil then
			item = characterDetails[slotID]
		end
	end
	return item
end

local function GetEquippedRelic(characterName, relicNumber)
	local _, relic = nil
	if characterName == PLH_GetUnitNameWithRealm('player') then
		-- we can get the item directly
		local weapon = GetInventoryItemLink('player', INVSLOT_MAINHAND)
		_, relic = GetItemGem(weapon, relicNumber)
	else
		-- we have to get the item from the cache
		local characterDetails = groupInfoCache[characterName]
		if characterDetails ~= nil then
			relic = characterDetails[PLH_RELICSLOT + relicNumber]
		end
	end
	return relic
end

-- note that this will return a value based on player's class/spec, so it will switch if the primary attribute is mutable!
-- thus only use for cloaks/rings/necks/trinkets, sine those things are not mutable
local function GetItemPrimaryAttribute(item)
	local stats = GetItemStats(item)
	if stats ~= nil then
		for stat, value in pairs(stats) do
			if _G[stat] == ITEM_MOD_STRENGTH_SHORT or _G[stat] == ITEM_MOD_INTELLECT_SHORT or _G[stat] == ITEM_MOD_AGILITY_SHORT then
				return _G[stat]
			end
		end
	end
	return nil
end

-- TODO may need to limit this by ilvl?  ex: did cloaks only become mutable in Legion?
local function IsMutablePrimaryAttribute(itemEquipLoc)
	return itemEquipLoc == 'INVTYPE_HEAD'
		or itemEquipLoc == 'INVTYPE_SHOULDER'
		or itemEquipLoc == 'INVTYPE_CLOAK'
		or itemEquipLoc == 'INVTYPE_CHEST'
		or itemEquipLoc == 'INVTYPE_ROBE'
		or itemEquipLoc == 'INVTYPE_WAIST'
		or itemEquipLoc == 'INVTYPE_LEGS'
		or itemEquipLoc == 'INVTYPE_FEET'
		or itemEquipLoc == 'INVTYPE_WRIST'
		or itemEquipLoc == 'INVTYPE_HAND'
end

local function IsTrinketUsable(item, role)
	local itemLink = select(2, GetItemInfo(item))
	local itemID = string.match(itemLink, 'item:(%d+):')

	local trinketList = nil
	if role == 'AgilityDPS' then
		trinketList = PLH_TRINKET_AGILITY_DPS
	elseif role == 'IntellectDPS' then
		trinketList = PLH_TRINKET_INTELLECT_DPS
	elseif role == 'StrengthDPS' then
		trinketList = PLH_TRINKET_STRENGTH_DPS
	elseif role == 'Healer' then
		trinketList = PLH_TRINKET_HEALER
	elseif role == 'Tank' then
		trinketList = PLH_TRINKET_TANK
	end
	
	local i
	if trinketList ~= nil then
		for i = 1, #trinketList do
			if tostring(trinketList[i]) == itemID then
				return true
			end
		end
	end
	
	return false
end

local function IsRelic(item)
	local _, _, _, _, _, _, _, _, _, _, _, itemClass, itemSubclass = GetItemInfo(item)
	return itemClass == LE_ITEM_CLASS_GEM and itemSubclass == LE_ITEM_ARMOR_RELIC
end

local function IsValidRelicTypeForSpec(relicType, spec)
	local specRelics = ValidRelics[spec]
	if specRelics ~= nil then
		return ValidRelics[spec][1] == relicType or ValidRelics[spec][2] == relicType or ValidRelics[spec][3] == relicType
	else
		return false
	end
end

-- Returns false if the character cannot use the item.
local function IsEquippableItemForCharacter(fullItemInfo, characterName, currentSpecOnly)
	local isEquippableForClass = false
	local isEquippableForSpec = false
	local isEquippableForOffspec = false
	if fullItemInfo ~= nil and characterName ~= nil then
		if fullItemInfo[FII_IS_EQUIPPABLE] or fullItemInfo[FII_IS_RELIC] then
			local requiredLevel = fullItemInfo[FII_REQUIRED_LEVEL]
			local itemEquipLoc = fullItemInfo[FII_ITEM_EQUIP_LOC]
			local itemClass = fullItemInfo[FII_CLASS]
			local itemSubclass = fullItemInfo[FII_SUB_CLASS]
			local class
			local spec
			local characterLevel
			if characterName == PLH_GetUnitNameWithRealm('player') then
				_, class = UnitClass('player')
				spec = GetSpecializationInfo(GetSpecialization())
				characterLevel = UnitLevel('player')
			elseif groupInfoCache[characterName] ~= nil then
				class = groupInfoCache[characterName]['ClassName']
				spec = groupInfoCache[characterName]['Spec']
				characterLevel = groupInfoCache[characterName]['Level']
			else
				--PLH_SendDebugMessage('Unable to determine class and spec in InEquippableItemForCharacter()!!!! for ' .. characterName)
				return false  -- should never reach here, but if we do it means we're not looking up the player or anyone in cache
			end
			
			-- check if character is a high enough level to equip the item
			if PLH_CHECK_CHARACTER_LEVEL and requiredLevel > characterLevel then
				return false
			end
			
			isEquippableForClass = itemEquipLoc == 'INVTYPE_CLOAK' -- cloaks show up as type=armor, subtype=cloth, but they're equippable by all, so set to true if cloak
			local i = 1
			
			while not isEquippableForClass and ValidGear[i] do
				if class == ValidGear[i][1] and itemClass == ValidGear[i][2] and itemSubclass == ValidGear[i][3] then
					isEquippableForClass = true
				end
				i = i + 1
			end

			-- check whether to item is a class restricted item (ex: tier)
			if fullItemInfo[FII_CLASSES] ~= nil then
				if not string.find(class, fullItemInfo[FII_CLASSES]) then
					isEquippableForClass = false
				end
			end
			
			if isEquippableForClass then
				if itemEquipLoc == 'INVTYPE_TRINKET' then
					item = fullItemInfo[FII_ITEM]
					if spec == 105 or spec == 270 or spec == 65 or spec == 256 or spec == 257 or spec == 264 then
						isEquippableForSpec = IsTrinketUsable(item, 'Healer')					
					elseif spec == 250 or spec == 581 or spec == 104 or spec == 268 or spec == 66 or spec == 73 then
						isEquippableForSpec = IsTrinketUsable(item, 'Tank')
					elseif spec == 577 or spec == 103 or spec == 253 or spec == 254 or spec == 255 or spec == 269 or spec == 259 or spec == 260 or spec == 261 or spec == 263 then
						isEquippableForSpec = IsTrinketUsable(item, 'AgilityDPS')
					elseif spec == 251 or spec == 252 or spec == 70 or spec == 71 or spec == 72 then
						isEquippableForSpec = IsTrinketUsable(item, 'StrengthDPS')
					elseif spec == 102 or spec == 62 or spec == 63 or spec == 64 or spec == 258 or spec == 262 or spec == 265 or spec == 266 or spec == 267 then
						isEquippableForSpec = IsTrinketUsable(item, 'IntellectDPS')
					end
						
					if not currentSpecOnly and not isEquippableForSpec then
						if class == DEATH_KNIGHT or class == WARRIOR then
							isEquippableForOffspec = IsTrinketUsable(item, 'Tank') or IsTrinketUsable(item, 'StrengthDPS')
						elseif class == DEMON_HUNTER then
							isEquippableForOffspec = IsTrinketUsable(item, 'Tank') or IsTrinketUsable(item, 'AgilityDPS')
						elseif class == DRUID then
							isEquippableForOffspec = IsTrinketUsable(item, 'Tank') or IsTrinketUsable(item, 'AgilityDPS') or IsTrinketUsable(item, 'Healer') or IsTrinketUsable(item, 'IntellectDPS')
						elseif class == MONK then
							isEquippableForOffspec = IsTrinketUsable(item, 'Tank') or IsTrinketUsable(item, 'AgilityDPS') or IsTrinketUsable(item, 'Healer')
						elseif class == PALADIN then
							isEquippableForOffspec = IsTrinketUsable(item, 'Tank') or IsTrinketUsable(item, 'StrengthDPS') or IsTrinketUsable(item, 'Healer')
						elseif class == PRIEST then
							isEquippableForOffspec = IsTrinketUsable(item, 'Healer') or IsTrinketUsable(item, 'IntellectDPS')
						elseif class == SHAMAN then
							isEquippableForOffspec = IsTrinketUsable(item, 'Healer') or IsTrinketUsable(item, 'IntellectDPS') or IsTrinketUsable(item, 'AgilityDPS')
						end
					end
				else
					local itemPrimaryAttribute = GetItemPrimaryAttribute(fullItemInfo[FII_ITEM])
					if itemPrimaryAttribute == nil then
						isEquippableForSpec = true  -- if there's no primary attr (ex: ring/neck), then the item is equippable by everyone
					elseif IsMutablePrimaryAttribute(itemEquipLoc) then
						isEquippableForSpec = true	-- if the item is a piece of gear that has mutable primary stats then return true
					else
						-- otherwise we're going to check if the item's primary attribute is applicable for the character's spec
						i = 1
						while not isEquippableForSpec and PrimaryAttributes[i] do
							if class == PrimaryAttributes[i][1] and PrimaryAttributes[i][3] == itemPrimaryAttribute and (PrimaryAttributes[i][2] == 'Any' or PrimaryAttributes[i][2] == spec) then
								isEquippableForSpec = true
							end
							i = i + 1
						end

						if not currentSpecOnly and not isEquippableForSpec then
							-- now check to see if it's usable by an offspec
							i = 1
							while not isEquippableForSpec and OffspecAttributes[i] do
								if class == OffspecAttributes[i][1] and OffspecAttributes[i][3] == itemPrimaryAttribute and OffspecAttributes[i][2] == spec then
									isEquippableForOffspec = true
								end
								i = i + 1
							end
						end
					end
				end
			elseif fullItemInfo[FII_IS_RELIC] then
				local relicType = fullItemInfo[FII_RELIC_TYPE]
				isEquippableForSpec = IsValidRelicTypeForSpec(relicType, spec)
				isEquippableForClass = isEquippableForSpec
				if not currentSpecOnly and not isEquippableForSpec then
					if class == DEATH_KNIGHT then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 250) or IsValidRelicTypeForSpec(relicType, 251) or IsValidRelicTypeForSpec(relicType, 252)
					elseif class == DEMON_HUNTER then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 577) or IsValidRelicTypeForSpec(relicType, 581)
					elseif class == DRUID then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 102) or IsValidRelicTypeForSpec(relicType, 103) or IsValidRelicTypeForSpec(relicType, 104) or IsValidRelicTypeForSpec(relicType, 105)
					elseif class == HUNTER then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 253) or IsValidRelicTypeForSpec(relicType, 254) or IsValidRelicTypeForSpec(relicType, 255)
					elseif class == MAGE then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 62) or IsValidRelicTypeForSpec(relicType, 63) or IsValidRelicTypeForSpec(relicType, 64)
					elseif class == MONK then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 268) or IsValidRelicTypeForSpec(relicType, 270) or IsValidRelicTypeForSpec(relicType, 269)
					elseif class == PALADIN then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 65) or IsValidRelicTypeForSpec(relicType, 66) or IsValidRelicTypeForSpec(relicType, 70)
					elseif class == PRIEST then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 256) or IsValidRelicTypeForSpec(relicType, 257) or IsValidRelicTypeForSpec(relicType, 258)
					elseif class == ROGUE then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 259) or IsValidRelicTypeForSpec(relicType, 260) or IsValidRelicTypeForSpec(relicType, 261)
					elseif class == SHAMAN then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 262) or IsValidRelicTypeForSpec(relicType, 263) or IsValidRelicTypeForSpec(relicType, 264)
					elseif class == WARLOCK then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 265) or IsValidRelicTypeForSpec(relicType, 266) or IsValidRelicTypeForSpec(relicType, 267)
					elseif class == WARRIOR then
						isEquippableForOffspec = IsValidRelicTypeForSpec(relicType, 71) or IsValidRelicTypeForSpec(relicType, 72) or IsValidRelicTypeForSpec(relicType, 73)
					end
					isEquippableForClass = isEquippableForSpec or isEquippableForOffspec
				end
			end
		end
	end
--	PLH_SendDebugMessage('For ' .. characterName .. ' item ' .. item .. ' isEquippableForClass = ' .. tostring(isEquippableForClass) .. ' and isEquippableForSpec = ' .. tostring(isEquippableForSpec)  .. ' and isEquippableForOffspec = ' .. tostring(isEquippableForOffspec))
	
	return isEquippableForClass and (isEquippableForSpec or isEquippableForOffspec)
end

-- returns two variables:  true if the item is an upgrade over equippedItem (based on ilvl), equipped ilvl
local function IsAnUpgrade(itemILVL, equippedItem)
	local equippedILVL = PLH_GetRealILVL(equippedItem)
	if equippedILVL == 0 then
		-- this means we couldn't find an equippedItem
		return false, 0
	else
		return itemILVL > equippedILVL, equippedILVL
	end
end

-- returns an appropriate SlotID for the given itemEquipLoc, or nil if it's not an item
-- if itemEquipLoc is a finger slot or trinket slot, we'll just return the first item
-- if itemEquipLoc is a weapon that can be in either slot (INVTYPE_WEAPON), we'll return the main hand
local function GetSlotID(itemEquipLoc)
	if itemEquipLoc == 'INVTYPE_HEAD' then return INVSLOT_HEAD
	elseif itemEquipLoc == 'INVTYPE_NECK' then return INVSLOT_NECK
	elseif itemEquipLoc == 'INVTYPE_SHOULDER' then return INVSLOT_SHOULDER
	elseif itemEquipLoc == 'BODY' then return INVSLOT_BODY
	elseif itemEquipLoc == 'INVTYPE_CHEST' then return INVSLOT_CHEST
	elseif itemEquipLoc == 'INVTYPE_ROBE' then return INVSLOT_CHEST
	elseif itemEquipLoc == 'INVTYPE_WAIST' then return INVSLOT_WAIST
	elseif itemEquipLoc == 'INVTYPE_LEGS' then return INVSLOT_LEGS
	elseif itemEquipLoc == 'INVTYPE_FEET' then return INVSLOT_FEET
	elseif itemEquipLoc == 'INVTYPE_WRIST' then return INVSLOT_WRIST
	elseif itemEquipLoc == 'INVTYPE_HAND' then return INVSLOT_HAND
	elseif itemEquipLoc == 'INVTYPE_FINGER' then return INVSLOT_FINGER1
	elseif itemEquipLoc == 'INVTYPE_TRINKET' then return INVSLOT_TRINKET1
	elseif itemEquipLoc == 'INVTYPE_CLOAK' then return INVSLOT_BACK
	elseif itemEquipLoc == 'INVTYPE_WEAPON' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_SHIELD' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_2HWEAPON' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_WEAPONMAINHAND' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_WEAPONOFFHAND' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_HOLDABLE' then return INVSLOT_OFFHAND
	elseif itemEquipLoc == 'INVTYPE_RANGED' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_THROWN' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_RANGEDRIGHT' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_RELIC' then return INVSLOT_MAINHAND
	elseif itemEquipLoc == 'INVTYPE_TABARD' then return INVSLOT_TABARD
	else return nil
	end
end

-- returns two variables:  true if the item is an upgrade over equippedItem (based on ilvl), equipped ilvl
-- note: doesn't check if item is equippable, so make sure you do that check beforehand
local function IsAnUpgradeForCharacter(fullItemInfo, characterName)
	local isAnUpgrade = false
	local equippedILVL = 0
	local itemEquipLoc = fullItemInfo[FII_ITEM_EQUIP_LOC]
	local itemRealILVL = fullItemInfo[FII_REAL_ILVL]
	
	if itemEquipLoc ~= nil and itemEquipLoc ~= '' then
		if itemEquipLoc == 'INVTYPE_FINGER' then
			local equippedItem0 = GetEquippedItem(characterName, 11)	-- 1st ring
			local equippedItem1 = GetEquippedItem(characterName, 12)  	-- 2nd ring
			isAnUpgrade = IsAnUpgrade(itemRealILVL, equippedItem0) or IsAnUpgrade(itemRealILVL, equippedItem1)
			equippedILVL = min(PLH_GetRealILVL(equippedItem0), PLH_GetRealILVL(equippedItem1))
		elseif itemEquipLoc == 'INVTYPE_TRINKET' then
			local equippedItem0 = GetEquippedItem(characterName, 13)	-- 1st trinket
			local equippedItem1 = GetEquippedItem(characterName, 14)	-- 2nd trinket
			isAnUpgrade = IsAnUpgrade(itemRealILVL, equippedItem0) or IsAnUpgrade(itemRealILVL, equippedItem1)
			equippedILVL = min(PLH_GetRealILVL(equippedItem0), PLH_GetRealILVL(equippedItem1))
		elseif itemEquipLoc == 'INVTYPE_WEAPON' then
			local equippedItem0 = GetEquippedItem(characterName, 16)		-- main hand
			local equippedItem1 = GetEquippedItem(characterName, 17)		-- off hand
			isAnUpgrade = IsAnUpgrade(itemRealILVL, equippedItem0) or IsAnUpgrade(itemRealILVL, equippedItem1)
			equippedILVL = min(PLH_GetRealILVL(equippedItem0), PLH_GetRealILVL(equippedItem1))
		else
			local slotID = GetSlotID(itemEquipLoc)
			local equippedItem =  GetEquippedItem(characterName, slotID)
			isAnUpgrade, equippedILVL = IsAnUpgrade(itemRealILVL, equippedItem)
		end
	elseif fullItemInfo[FII_IS_RELIC] then
		local relicType = fullItemInfo[FII_RELIC_TYPE]

		local relic1 = GetEquippedRelic(characterName, 1)
		local relic1ILVL = PLH_GetRealILVL(relic1)
		local relic1Type = PLH_GetRelicType(relic1)
		local relic2 = GetEquippedRelic(characterName, 2)
		local relic2ILVL = PLH_GetRealILVL(relic2)
		local relic2Type = PLH_GetRelicType(relic2)
		local relic3 = GetEquippedRelic(characterName, 3)
		local relic3ILVL = PLH_GetRealILVL(relic3)
		local relic3Type = PLH_GetRelicType(relic3)
		isAnUpgrade = (relicType == relic1Type and IsAnUpgrade(itemRealILVL, relic1))
			or (relicType == relic2Type and IsAnUpgrade(itemRealILVL, relic2))
			or (relicType == relic3Type and IsAnUpgrade(itemRealILVL, relic3))
		if relicType == relic1Type then
			equippedILVL = relic1ILVL
		end
		if relicType == relic2Type and (equippedILVL == 0 or relic2ILVL < equippedILVL) then
			equippedILVL = relic2ILVL
		end
		if relicType == relic3Type and (equippedILVL == 0 or relic3ILVL < equippedILVL) then
			equippedILVL = relic3ILVL
		end
	end
	return isAnUpgrade, equippedILVL
end

-- returns two variables:  first is true or false, second is list of people for whom the item may is an upgrade (by ilvl)
local function IsAnUpgradeForAnyCharacter(fullItemInfo)
	local isAnUpgrade, equippedILVL
	local isAnUpgradeForAnyCharacterNames = {}

	local index = 1
	local characterName
	while GetRaidRosterInfo(index) ~= nil do
		characterName = select(1, GetRaidRosterInfo(index))
		-- this characterName may be a full name-realm or it may just be a name, but the functions we're calling expect name-realm
		if not string.find(characterName, '-') then
			characterName = PLH_GetFullName(characterName, GetRealmName())
		end
		if IsEquippableItemForCharacter(fullItemInfo, characterName, PLH_CURRENT_SPEC_ONLY) then
			isAnUpgrade, equippedILVL = IsAnUpgradeForCharacter(fullItemInfo, characterName)
			if isAnUpgrade then
--				PLH_SendDebugMessage(item .. ' is an ilvl upgrade for ' .. characterName)
				isAnUpgradeForAnyCharacterNames[#isAnUpgradeForAnyCharacterNames + 1] = PLH_GetNameWithoutRealm(characterName) .. ' (' .. equippedILVL .. ')'
			end
		end
		index = index + 1
	end

	return #isAnUpgradeForAnyCharacterNames > 0, isAnUpgradeForAnyCharacterNames
end

local function IsPlayerInUpgradeList(list)
	if list ~= nil then
		local playerName = UnitName('player')
		for i = 1, #list do
			if string.sub(list[i], 1, string.len(playerName)) == playerName then  -- see if string starts with 'playername '; ex: 'Madone (690)'
				return true
			end
		end
	end
	return false
end

-- creates a copy of the table
local function ShallowCopy(t)
	local t2 = {}
	for k, v in pairs(t) do
		t2[k] = v
	end
	return t2
end

-- returns the names from the given array, with 'and others' if array size > limit
local function GetNames(namelist, limit)
	local names = ''
	if namelist ~= nil then
		if limit == nil then  -- no limit; show all names
			limit = #namelist
		end
		if namelist[1] ~= nil then
			-- sort the array by ilvl first
			local sortedNamelist = namelist
			if #namelist > 1 then
				local copiedNamelist = ShallowCopy(namelist)  -- we will destroy elements in the list while sorting, so copy it
				sortedNamelist = {}
				local lowestILVL
				local lowestIndex
				local ilvl
				local i = 1
				local size = #copiedNamelist
				while i <= size do
					lowestILVL = 1000000
					lowestIndex = 1  -- we could be sorting a list without ilvls, in which case just keep the same order
					for j = 1, #copiedNamelist do
						if copiedNamelist[j] ~= nil then
							ilvl = string.match(copiedNamelist[j], '(%d+)')
							if ilvl ~= nil then
								ilvl = tonumber(ilvl)
								if ilvl < lowestILVL then
									lowestILVL = ilvl
									lowestIndex = j
								end
							end
						end
					end
					table.insert(sortedNamelist, table.remove(copiedNamelist, lowestIndex))
					i = i + 1
				end
			end
		
			names = sortedNamelist[1]
			local maxnames = min(#sortedNamelist, limit)
			for i = 2, maxnames do
				if #sortedNamelist == 2 then
					names = names .. ' '
				else
					names = names .. ', '
				end
				if i == #sortedNamelist then -- last person
					names = names .. '& '
				end
				names = names .. sortedNamelist[i]
			end
			if #sortedNamelist > limit then
				names = names .. ' & ...'
			end
		end
	end
	return names
end

local function PlayerCanCoordinateRolls()
	return (UnitIsGroupLeader('player') or UnitIsGroupAssistant('player')) and not PLH_IsInLFR()
end

local function UnhighlightRaidFrames()
	for characterName, texture in pairs(raidFrameTextures) do
		texture:Hide()
	end
	for characterName, tooltip in pairs(raidFrameTooltips) do
		tooltip:SetScript("OnEnter", nil)
		tooltip:SetScript("OnEvent", nil)
		tooltip:UnregisterAllEvents()
		tooltip:Hide()
	end
end

local function StartUnhighlightRaidFramesTimer()
	highlightDelayFrame:SetScript('OnUpdate', function(self, elapsed)
		unhighlightDelay = unhighlightDelay + elapsed
		if unhighlightDelay >= UNHIGHLIGHT_DELAY then
			UnhighlightRaidFrames()
			highlightDelayFrame:SetScript('OnUpdate', nil)
			unhighlightDelay = 0
		end
	end)
end

function PLH_ResizeHighlights()
	for characterName, texture in pairs(raidFrameTextures) do
		raidFrameTextures[characterName]:SetWidth(PLH_HIGHLIGHT_SIZE)
		raidFrameTextures[characterName]:SetHeight(PLH_HIGHLIGHT_SIZE)
	end
	for characterName, tooltip in pairs(raidFrameTooltips) do
		raidFrameTooltips[characterName]:SetWidth(PLH_HIGHLIGHT_SIZE)
		raidFrameTooltips[characterName]:SetHeight(PLH_HIGHLIGHT_SIZE)
	end
end

function PLH_ApplyFrameTexture(frame, characterName, item)
	local unitName = PLH_GetUnitNameWithRealm(frame.unit)

	if characterName == unitName then
		-- create the texture to display in the raid frames
		if not raidFrameTextures[characterName] then
			raidFrameTextures[characterName] = frame:CreateTexture(nil, "OVERLAY")
			raidFrameTextures[characterName]:SetPoint("BOTTOM", 0, 2) 
			raidFrameTextures[characterName]:SetWidth(PLH_HIGHLIGHT_SIZE)
			raidFrameTextures[characterName]:SetHeight(PLH_HIGHLIGHT_SIZE)
		end
--		local file_id = GetSpellTexture(60650)  -- spell id for "titanium seal of dalaran"
		local itemTexture = select(10, GetItemInfo(item))
		raidFrameTextures[characterName]:SetTexture(itemTexture)

		-- create the tooltip to display when the cursor is over the texture
		if not raidFrameTooltips[characterName] then
			raidFrameTooltips[characterName] = CreateFrame("Frame", frame:GetName() .. "itemTooltip", frame)
			raidFrameTooltips[characterName]:SetPoint("BOTTOM", 0, 2)
			raidFrameTooltips[characterName]:SetWidth(PLH_HIGHLIGHT_SIZE)
			raidFrameTooltips[characterName]:SetHeight(PLH_HIGHLIGHT_SIZE)
		end

		raidFrameTooltips[characterName]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
			GameTooltip:SetHyperlink(item)
			GameTooltip:Show()
			-- the following sets up the listener for the shift key to toggle display of the item comparison
			raidFrameTooltips[characterName]:SetScript("OnEvent", function(self, event, arg, ...)
				if raidFrameTooltips[characterName]:IsShown() and event == "MODIFIER_STATE_CHANGED" and (arg == "LSHIFT" or arg == "RSHIFT") then
					GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
					GameTooltip:SetHyperlink(item)
					GameTooltip:Show()
				end
			end)
			raidFrameTooltips[characterName]:RegisterEvent("MODIFIER_STATE_CHANGED")
		end)		

		raidFrameTooltips[characterName]:SetScript("OnLeave", function(self)
			raidFrameTooltips[characterName]:SetScript("OnEvent", nil)
			raidFrameTooltips[characterName]:UnregisterAllEvents()
			GameTooltip:Hide()
		end)

		raidFrameTextures[characterName]:Show()
		raidFrameTooltips[characterName]:Show()
		
	end
end

-- TODO implement for players to whom you can trade as well (keep in mind someone may both trade and receive an item)
-- TODO what if a single person loots multiple useful items?  (ex: end of m+)
local function HighlightRaidFrames(characterName, item)
	if PLH_HIGHLIGHT_RAID_FRAMES then
		CompactRaidFrameContainer_ApplyToFrames(CompactRaidFrameContainer, "normal", PLH_ApplyFrameTexture, characterName, item)
		StartUnhighlightRaidFramesTimer()
	end
end

-- Determines whether item is not an upgrade for the person who looted the item, and is an upgrade for someone else in the group
-- If that's the case, performs the action based on the users' selected Notify Mode
local function PerformNotify(fullItemInfo, characterName)
	local isAnUpgradeForLooter, equippedILVL = IsAnUpgradeForCharacter(fullItemInfo, characterName)
	if PLH_COORDINATE_ROLLS and PlayerCanCoordinateRolls() then
		whisperedItems[characterName] = fullItemInfo[FII_ITEM]  -- use full name-realm since that what we'll get when we look it up from the whisper
--		if #isAnUpgradeForAnyCharacterNames > 1 then  -- more than 1 person can use the item
--					PLH_SendWhisper('You can trade ' .. item .. ', which is an ilvl upgrade for ' .. names .. '. Reply \'' .. TRADE_MESSAGE .. '\' to initiate rolls for this item.', characterName)
--		end
	end
	if equippedILVL > 0 and not isAnUpgradeForLooter then
		-- we now know the item can be traded by the person who received it, so let's check to see if anyone can actually
		--    use the item as an upgrade
		local isAnUpgradeForAnyCharacter, isAnUpgradeForAnyCharacterNames = IsAnUpgradeForAnyCharacter(fullItemInfo)
		if isAnUpgradeForAnyCharacter then
			local names = GetNames(isAnUpgradeForAnyCharacterNames, MAX_NAMES_TO_SHOW)
			item = fullItemInfo[FII_ITEM]

			if PLH_NOTIFY_GROUP then
				if not PLH_IsInLFR() then
					PLH_SendBroadcast(PLH_GetNameWithoutRealm(characterName) .. ' 可以交易 ' .. item .. ', 给 ' .. names)
				end
			end

			if characterName == PLH_GetUnitNameWithRealm('player') then  -- player can trade an item
				PLH_SendAlert('^-^ ' .. item .. ' → ' .. names)
				--UIErrorsFrame:AddMessage('你的 ' .. item .. ' 可以交易给 ' .. names,1,0,0,5)
				RaidNotice_AddMessage(RaidWarningFrame, '^-^ ' .. item .. ' → ' .. names, ChatTypeInfo["SYSTEM"]);
				PlaySound(600)  -- 'GLUECREATECHARACTERBUTTON'
			elseif IsPlayerInUpgradeList(isAnUpgradeForAnyCharacterNames) then  -- player can receive an item
				--PLH_SendAlert(PLH_GetNameWithoutRealm(characterName) .. ' → ' .. item .. ' ^-^ ')
				--UIErrorsFrame:AddMessage(PLH_GetNameWithoutRealm(characterName) .. ' 的 ' .. item .. ' 可交易，对你有用！',1,0,0,5)
				RaidNotice_AddMessage(RaidWarningFrame, PLH_GetNameWithoutRealm(characterName) .. ' → ' .. item .. ' ^-^ ', ChatTypeInfo["SYSTEM"]);
				PlaySound(888)  -- 'LEVELUP'
				HighlightRaidFrames(characterName, item)
			end
		end
	end
end

-- returns true if the item should be evaluated for potential trades based on the following criteria:
--   1. item is equippable
--   2. ilvl is >= min ilvl from preferences
--   3. quality is >= min quality from preferences
--   4. item is BoP, or user specified to include BoE items in preferences
local function ShouldBeEvaluated(fullItemInfo)
	if not fullItemInfo[FII_IS_EQUIPPABLE] and not fullItemInfo[FII_IS_RELIC] then
		return false
	else
		if fullItemInfo[FII_REAL_ILVL] < PLH_MIN_ILVL then
			return false
		else
			if fullItemInfo[FII_QUALITY] < PLH_MIN_QUALITY then
				return false
			else
				if fullItemInfo[FII_BIND_TYPE] ~= LE_ITEM_BIND_ON_ACQUIRE and not (fullItemInfo[FII_BIND_TYPE] == LE_ITEM_BIND_ON_EQUIP and PLH_INCLUDE_BOE) then
					return false
				else
					return true
				end
			end
		end
	end
end

local function LootReceivedEvent(self, event, ...)
	local message, _, _, _, looter = ...
	
--	local _, _, lootedItem = string.find(message, '(|.+|r)')
	
	local lootedItem = message:match(LOOT_ITEM_SELF_PATTERN)
	if lootedItem == nil then
		_, lootedItem = message:match(LOOT_ITEM_PATTERN)
	end
	
	if lootedItem then
		local fullItemInfo = GetFullItemInfo(lootedItem)
		if ShouldBeEvaluated(fullItemInfo) then
			if not string.find(looter, '-') then
				looter = PLH_GetUnitNameWithRealm(looter)
			end
			PerformNotify(fullItemInfo, looter)
		end
	end
end	

local function QueueItem(sender, item)
	queuedRollOwners[numOfQueuedRollItems] = sender
	queuedRollItems[numOfQueuedRollItems] = item
	numOfQueuedRollItems = numOfQueuedRollItems + 1
end

local function AskForRolls()
	if currentRollItem == nil and numOfQueuedRollItems > 0 then
		currentRollOwner = queuedRollOwners[numOfQueuedRollItems - 1]
		currentRollItem = queuedRollItems[numOfQueuedRollItems - 1]
		numOfQueuedRollItems = numOfQueuedRollItems - 1
		
		local fullItemInfo = GetFullItemInfo(currentRollItem)
		local description = " ("
		if fullItemInfo[FII_REAL_ILVL] ~= nil then
			description = description .. fullItemInfo[FII_REAL_ILVL] .. " "
		end
		if fullItemInfo[FII_IS_RELIC] and fullItemInfo[FII_RELIC_TYPE] ~= nil then
			description = description .. fullItemInfo[FII_RELIC_TYPE] .. " Relic"
		else
			if fullItemInfo[FII_CLASS] == LE_ITEM_CLASS_ARMOR then
				if fullItemInfo[FII_SUB_CLASS] == LE_ITEM_ARMOR_GENERIC or fullItemInfo[FII_ITEM_EQUIP_LOC] == "INVTYPE_CLOAK" then
					description = description .. _G[fullItemInfo[FII_ITEM_EQUIP_LOC]]
				else
					description = description .. fullItemInfo[FII_SUB_TYPE] .. " " .. _G[fullItemInfo[FII_ITEM_EQUIP_LOC]]
				end
			else
				description = description .. fullItemInfo[FII_SUB_TYPE]
			end
			
		end
		description = description .. ")"
		PLH_SendBroadcast('Roll ' .. currentRollItem .. description .. ' ←  ' .. PLH_GetNameWithoutRealm(currentRollOwner), true)

		local FiveSecondWarningDisplayed = false
		local FifteenSecondWarningDisplayed = false
		
		rollDelayFrame:SetScript('OnUpdate', function(self, elapsed)
			delay = delay + elapsed
--			if currentRollItem == nil then
				-- that means the user forced rolls to end, so we can stop the countdown; relying on PLH_EndRolls() to clean us up
--			elseif delay >= 15 and not FifteenSecondWarningDisplayed then
			if delay >= 15 and not FifteenSecondWarningDisplayed then
				PLH_SendBroadcast('15s →' .. currentRollItem, false)
				FifteenSecondWarningDisplayed = true
			elseif delay >= 25 and not FiveSecondWarningDisplayed then
				PLH_SendBroadcast('5s →' .. currentRollItem, false)
				FiveSecondWarningDisplayed = true
			elseif delay >= 30 then
				-- force an end to the rolls
				PLH_EndRolls()
			end
		end)
	end
end

local function ClearRolls()
	currentRollOwner = nil
	currentRollItem = nil
	currentRolls = {}
	queuedRollOwners[numOfQueuedRollItems] = nil
	queuedRollItems[numOfQueuedRollItems] = nil
end

-- not local, because it has to be callable by the global slash command
function PLH_EndRolls()
	-- clear the countdown for the existing roll
	rollDelayFrame:SetScript('OnUpdate', nil)
	delay = 0
	
	-- determine the winner(s)
	local winners = nil
	local highRoll = 0
	for name, roll in pairs(currentRolls) do
		roll = tonumber(roll)
		if winners == nil or roll > highRoll then
			winners = { name }
			highRoll = roll
		elseif winners ~= nil and roll == highRoll then
			table.insert(winners, name)
		end
	end
	
	-- notify everyone of the results of the rolls
	if winners ~= nil then
		if #winners > 1 then
			PLH_SendBroadcast(GetNames(winners) .. ' *-* ' .. currentRollItem .. ' ← ' .. PLH_GetNameWithoutRealm(currentRollOwner) .. ' - ' .. highRoll, true)
		else
			PLH_SendBroadcast(winners[1] .. ' ^-^ ' .. currentRollItem .. ' ← ' .. PLH_GetNameWithoutRealm(currentRollOwner) .. ' - ' .. highRoll, true)
		end
	else
		PLH_SendBroadcast('GG： ' .. currentRollItem .. ' ← ' .. PLH_GetNameWithoutRealm(currentRollOwner), true)
	end

	-- if there's another roll to do, let's delay a few seconds before starting the next roll
	if (numOfQueuedRollItems > 0) then
		rollDelayFrame:SetScript('OnUpdate', function(self, elapsed)
			nextRollDelay = nextRollDelay + elapsed
			if nextRollDelay >= DELAY_BETWEEN_ROLLS then
				rollDelayFrame:SetScript('OnUpdate', nil)
				nextRollDelay = 0
				ClearRolls()
				AskForRolls()
			end
		end)
	else			
		ClearRolls()
	end	
end

local function GetItemFromQueueByPlayer(player)
	for key, value in pairs(queuedRollOwners) do
		if value == player then
			return queuedRollItems[key]
		end
	end
	return nil
end

local function ProcessWhisper(message, sender)
	if PLH_COORDINATE_ROLLS and PlayerCanCoordinateRolls() then
		if not string.find(sender, '-') then
			sender = PLH_GetUnitNameWithRealm(sender)
		end
		-- if the person whispered 'trade [item]' or '[item] trade', then add the item to the array so we can process it
		local _, _, whisperedItem = string.find(message, 'trade (|.+|r)')
		if whisperedItem == nil then
			_, _, whisperedItem = string.find(message, 'Trade (|.+|r)')
		end
		if whisperedItem == nil then
			_, _, whisperedItem = string.find(message, 'TRADE (|.+|r)')
		end
		if whisperedItem == nil then
			_, _, whisperedItem = string.find(message, '(|.+|r) trade')
		end
		if whisperedItem == nil then
			_, _, whisperedItem = string.find(message, '(|.+|r) Trade')
		end
		if whisperedItem == nil then
			_, _, whisperedItem = string.find(message, '(|.+|r) TRADE')
		end
		if whisperedItem ~= nil then
			whisperedItems[sender] = whisperedItem
		end
		message = string.upper(message)
		if whisperedItem ~= nil or message == TRADE_MESSAGE or message == '\'' .. TRADE_MESSAGE .. '\'' then
			if whisperedItems[sender] ~= nil then
				local item = whisperedItems[sender]
				whisperedItems[sender] = nil
				QueueItem(sender, item)
				-- if we're still rolling for another item, let the person know their item is queued
				if currentRollItem ~= nil then
					PLH_SendWhisper('Thank you! ' .. item .. ' Roll', sender)
				else 
					AskForRolls()
				end
			elseif currentRollOwner == sender then
				PLH_SendWhisper( currentRollItem .. ' Roll', sender)
			else
				local item = GetItemFromQueueByPlayer(sender)
				if item then
					PLH_SendWhisper(item .. ' Rolling', sender)
				else
					PLH_SendWhisper('沒有你拾取装备记录！如果你仍然想要交易装备，可以密 ' .. UnitName('player') .. ' \'交易 [装备链接結]\' ', sender)
				end
			end
		end
	end
end

local function WhisperReceivedEvent(self, event, ...)
	local message, sender = ...

	ProcessWhisper(message, sender)
end

local function BNWhisperReceivedEvent(self, event, ...)
	local message = ...

	local bnetIDAccount = select(13, ...)
	local bnetIDGameAccount = select(6, BNGetFriendInfoByID(bnetIDAccount));
	local _, sender, _, realmName = BNGetGameAccountInfo(bnetIDGameAccount)

	if realmName ~= nil then
		sender = sender .. '-' .. realmName
	end
	
	ProcessWhisper(message, sender)
end

local function RollReceivedEvent(self, event, ...)
	if currentRollItem ~= nil then
		local message = select(1, ...)
		if message then
--			local name, roll, minRoll, maxRoll = message:match('^(.+) rolls (%d+) %((%d+)%-(%d+)%)$')
			local name, roll, minRoll, maxRoll = message:match(PLH_RANDOM_ROLL_RESULT_PATTERN)
			if name then
				local fullname = PLH_GetUnitNameWithRealm(name)
				if minRoll ~= '1' or maxRoll ~= '100' then
					PLH_SendBroadcast(name .. ' R ' .. minRoll .. ' - ' .. maxRoll .. '；不算。', false)
				elseif currentRolls[name] ~= nil then
					PLH_SendBroadcast(name .. ' R了太多次；只算第一次 ' .. currentRolls[name] .. '。', false)
				elseif fullname ~= nil and not IsEquippableItemForCharacter(GetFullItemInfo(currentRollItem), fullname, false) then
					PLH_SendBroadcast(name .. ' 不能使用 ' .. currentRollItem .. '；不算。', false)
				else 
					currentRolls[name] = roll
				end
			end		
		end
	end
end

-- note that GetLootMethod() only works if you're in a party or in a raid.  If you're in an instance (i.e. queued via LFR),
--   then loot method is automatically personal loot
local function IsPersonalLoot()
	local isInstance, instanceType = IsInInstance()
	return (IsInGroup(LE_PARTY_CATEGORY_INSTANCE) or (IsInGroup() and GetLootMethod() == 'personalloot'))
		and (instanceType == "party" or instanceType == "raid")
end

local function ResetVariables()
	delay = 0
	nextRollDelay = 0

	whisperedItems = {}

	numOfQueuedRollItems = 0;
	queuedRollOwners = {}
	queuedRollItems = {}

	currentRollOwner = nil
	currentRollItem = nil
	currentRolls = {}

	groupInfoCache = {}
end

-- The following uses GetInventoryItemLink() to look up unit's equipped items.  That method can only be called for
--   the player, or within the scope of an INSPECT_READY event for other group members.
local function UpdateGroupInfoCache(unit)
	local name = PLH_GetUnitNameWithRealm(unit)

	if name ~= nil then
		local characterDetails
		if groupInfoCache[name] == nil then
			characterDetails = {}
			local _, class = UnitClass(unit)
			characterDetails['ClassName'] = class
			local spec = GetInspectSpecialization(unit)
			characterDetails['Spec'] = spec
			local level = UnitLevel(unit)
			characterDetails['Level'] = level
			characterDetails['InspectCount'] = 0
		else
			characterDetails = groupInfoCache[name]
--			spec = GetInspectSpecialization(unit)
			if characterDetails['InspectCount'] ~= nil then
				characterDetails['InspectCount'] = characterDetails['InspectCount'] + 1
			end
		end
		
		local updatedItemCount = 0
		local item
		for i = _G.INVSLOT_FIRST_EQUIPPED, _G.INVSLOT_LAST_EQUIPPED do
			if i ~= _G.INVSLOT_BODY and i ~= INVSLOT_TABARD then -- ignore shirt and tabard slots
				item = GetInventoryItemLink(UnitName(unit), i)
				if item ~= nil then
					if characterDetails[i] == nil or characterDetails[i] ~= item then
--					PLH_SendDebugMessage('      adding/updating item ' .. item)			
						updatedItemCount = updatedItemCount + 1
						characterDetails[i] = nil  -- remove existing first
						characterDetails[i] = item
						characterDetails['InspectCount'] = 0  -- if we actually updated something, reset the inspect counter
					end
					
					-- if we're adding the weapon, also add relics
					if i == _G.INVSLOT_MAINHAND or i == _G.INVSLOT_OFFHAND then
						item = select(2, GetItemInfo(item))  -- hack since relics may not be loaded into cache right away, query the item again
						local _, relic1 = GetItemGem(item, 1)
						if relic1 ~= nil then
							characterDetails[PLH_RELICSLOT + 1] = relic1
						end
						local _, relic2 = GetItemGem(item, 2)
						if relic2 ~= nil then
							characterDetails[PLH_RELICSLOT + 2] = relic2
						end
						local _, relic3 = GetItemGem(item, 3)
						if relic3 ~= nil then
							characterDetails[PLH_RELICSLOT + 3] = relic3
						end
					end
				end
			end
		end

		-- If we didn't find any items (ex: when player first starts the game), don't add this person to the cache unless it's first time (for class/etc)
		if updatedItemCount > 0 or groupInfoCache[name] == nil then
			groupInfoCache[name] = nil  -- remove any existing entry first
			groupInfoCache[name] = characterDetails
		end
	end
end

-- returns true if the characterName is in the raid/party
local function IsCharacterInGroup(characterFullname)
	local index = 1
	local name = select(1, GetRaidRosterInfo(index))
	while name ~= nil do
		if name == characterFullname then
			return true
		end
		-- RaidRosterInfo will only give us name by itself if the character is on the same realm as the player, so check that scenario too
		if PLH_GetFullName(name, GetRealmName()) == characterFullname then
			return true
		end
		index = index + 1
		name = select(1, GetRaidRosterInfo(index))
	end
	return false
end

-- returns true if group member was able to be inspected; false otherwise
local function InspectGroupMember(characterName)
	if characterName ~= nil and characterName ~= UnitName('player') then   -- no need to inspect ourselves
		if CanInspect(characterName) then -- and UnitIsConnected(characterName) - not necessary to include this check since we're including distance check
--			if CheckInteractDistance(characterName, 1) then  -- this API call has not been changed by Blizz to match the new larger inspect radius
			if UnitIsVisible(characterName) then
				NotifyInspect(characterName)
				notifyInspectName = characterName
				PLH_wait2(DELAY_BETWEEN_INSPECTIONS, PLH_InspectNextGroupMember)
				return true
			end
		end
	end
	return false
end

-- An Inspect Loop (managed by inspectLoop) is a complete iteration of inspection for every member in the group.  
-- 		Will only attempt to inspect characters whose count of cached items is lower than expected.
--      The goal of this loop is to work around the limitation whereby the inspect API doesn't necessarily provide us
--      all items equipped by the character.
-- not local, because it is called by (and calls) InspectGroupMember(characterName), which is defined above
function PLH_InspectNextGroupMember()
	-- attempt the inspect the next person; if they're not inspectable, move onto the next

	-- Removed this inside-loop retry logic.  It works, but in testing it very rarely accomplished its goal; usually the retry attempts
	--    to inspect failed just like the original attempt.  We now have inspectLoop logic build in, which will still
	--    give the cache more opportunities to be updated - so no need for the retries here
	-- Retry logic
--	if notifyInspectName ~= nil then   -- InspectReady didn't get called for the person we queued
--		if inspectRetries < MAX_INSPECT_RETRIES then
--			PLH_SendDebugMessage('Retrying inspection for ' .. notifyInspectName)
--			inspectRetries = inspectRetries + 1
--			if InspectGroupMember(notifyInspectName) then  -- we triggered a notify, so don't do the while loop
--				return true  -- exit this function so we don't attempt to inspect the next character
--			end
--		end
		-- if we get to here, then it's time to give up on inspecting this character - either we couldn't even trigger a
		--    NotifyInspect, or we already triggered the max # of NotifyInspects and didn't get an InspectReady response
		notifyInspectName = nil  -- even though we commented out the retry logic, we still want to nullify notifyInspectName
			-- since it's unlikely we'll get an INSPECT_READY at this point (3 seconds after calling NotifyInspect)
--		inspectRetries = 0
--	end

	-- Call InspectGroupMember for the next person in the group
	local characterName
	local queuedAnInspection = false
	local expectedItemCount
	local expectedRelicCount
	local class
	local spec
	local level
	local inspectCount
	while inspectIndex <= maxInspectIndex  and not queuedAnInspection do
		characterName = select(1, GetRaidRosterInfo(inspectIndex))
		if characterName ~= nil then  -- safeguard; character may have left the roster between the time we started the call and now
			local numCachedItems = 0
			local numCachedRelics = 0
			local fullname = characterName 		--characterName may or may not have realm.  we want to preserve it the way it is for the call to InspectGroupMember,
												--   but need the name-realm version of the name to look up the element in the cache
			if not string.find(fullname, '-') then
				fullname = PLH_GetFullName(characterName, GetRealmName())
			end
			
			if fullname ~= nil then
				expectedItemCount = NUM_EXPECTED_ITEMS
				expectedRelicCount = 0
				inspectCount = 0
				if groupInfoCache[fullname] ~= nil then
					numCachedItems = PLH_GetItemCountFromCache(fullname)
					numCachedRelics = PLH_GetRelicCountFromCache(fullname)
					class = groupInfoCache[fullname]['ClassName']
					spec = groupInfoCache[fullname]['Spec']
					level = groupInfoCache[fullname]['Level']
					inspectCount = groupInfoCache[fullname]['InspectCount']
					expectedItemCount = GetExpectedItemCount(class, spec, level)
					expectedRelicCount = GetExpectedRelicCount(level)
				end

--				if inspectCount >= MAX_INSPECTS_PER_CHARACTER then
--					PLH_SendDebugMessage('Discontinuing inspections for ' .. fullname .. ' due to max inspect limit')
--				end
				if inspectCount < MAX_INSPECTS_PER_CHARACTER and (numCachedItems < expectedItemCount or numCachedRelics < expectedRelicCount) then  -- if we've already cached 15 or more items, don't bother refreshing
					queuedAnInspection = InspectGroupMember(characterName)
				end
			end
		end
		inspectIndex = inspectIndex + 1
	end
	
	-- The following logic is meant to work around a limitation of the inspect API.  When you inspect a character, you're
	-- not guaranteed to actually receive all of their equipped items back!  To work around this limitation, we will
	-- perform additional loops of inspecting each character if the number of items we've cached for them is fewer than
	-- the expected number of items that someone would equip (15 items for a person using a 1-hander, +1 element for the
	-- ClassName that we're storing in the cache)
	if inspectIndex > maxInspectIndex then -- that means we just completed our current loop
		if inspectLoop < MAX_INSPECT_LOOPS then
			-- let's start the next loop
			inspectIndex = 1  -- we're triggering the call to the 1st member via PLH_InspectNextGroupMember below; increment
				-- the inspectIndex counter so the next element that gets picked up when we come back into PLH_InspectNextGroupMember
				-- is the 2nd
			inspectLoop = inspectLoop + 1
			if queuedAnInspection then
				-- if we just queued someone for inspection, we don't need to do anything else to start the new loop since InspectGroupMember will call PLH_InspectNextGroupMember()
			else  -- otherwise start the new loop immediately
				PLH_InspectNextGroupMember()
			end
		elseif not queuedAnInspection then
			-- we've finished all loops
--			PLH_PrintCache()
		end
	end
	
end

-- note that the INSPECT_READY event may have been triggered by WoW or by another addon
--   for example, WoW triggers it when a person in inspect range swaps their gear
local function InspectReadyEvent(self, event, ...)
	local guid = select(1, ...)
	local _, _, _, _, _, name, realm = GetPlayerInfoByGUID(guid)

	if notifyInspectName ~= nil and (notifyInspectName == name or notifyInspectName == PLH_GetFullName(name, realm)) then  -- confirm this InspectReadyEvent is for the person we triggered for inspection.
		UpdateGroupInfoCache(name)  -- only update the cache if we requested the inspect, otherwise the wrong cache entry could be updated!
		-- if we triggered the inspection, clear the flags that we had set
		ClearInspectPlayer()  -- note that we only want to call ClearInspectPlayer() if we're the ones who queued up
			-- the inspection; otherwise, we'll prevent whoever wanted to inspect the player from seeing data...for
			-- example, a player using the UI to inpect a player would see all empty slots if we called ClearInspectPlayer()!
		notifyInspectName = nil  -- clear this flag since we're done inspecting the person
	end
end

local function PopulateGroupInfoCache()
	local now = time()
	
	if now - priorCacheRefreshTime > 3 then  -- only refresh if prior refresh was more than 3 seconds ago
		priorCacheRefreshTime = now
	
		-- remove characters from the cache if they're no long in the raid/party
		for name, details in pairs (groupInfoCache) do
			if not IsCharacterInGroup(name) then
				groupInfoCache[name] = nil
			end
		end

		if IsInGroup() then
			-- If we're already doing an inspect loop, don't interupt it; just do nothing with the request to
			-- PopulateGroupInfoCache() and let the inspect loop continuue on its way!  If the inspectIndex > maxInspectIndex
			-- and inspectLoop > MAX_INSPECT_LOOPS, then we know we've finished all inspections for all loops, so
			-- we can start a brand new loop!
			if inspectIndex > maxInspectIndex and inspectLoop >= MAX_INSPECT_LOOPS then
--				PLH_SendDebugMessage('Refreshing cache')
				inspectIndex = 1
				inspectLoop = 1
				maxInspectIndex = GetNumGroupMembers()
				PLH_InspectNextGroupMember()
			end
		end
	end
end

local function Enable()
	ResetVariables()
	isEnabled = true
	lootReceivedEventFrame:RegisterEvent('CHAT_MSG_LOOT')
	--whisperReceivedEventFrame:RegisterEvent('CHAT_MSG_WHISPER')
	--bnWhisperReceivedEventFrame:RegisterEvent('CHAT_MSG_BN_WHISPER')
	rollReceivedEventFrame:RegisterEvent('CHAT_MSG_SYSTEM')
	inspectReadyEventFrame:RegisterEvent('INSPECT_READY')
	combatStatusChangedEventFrame:RegisterEvent('PLAYER_REGEN_DISABLED')   -- player entered combat
	groupMemberInfoChangedEventFrame:RegisterEvent('PLAYER_SPECIALIZATION_CHANGED')
	groupMemberInfoChangedEventFrame:RegisterEvent('UNIT_INVENTORY_CHANGED')
end

local function Disable()
	isEnabled = false
	lootReceivedEventFrame:UnregisterAllEvents()
	-- keep the following listeners enabled so people can still use the roll coordinate mode during master looter (ex: for BoE drops)
	--whisperReceivedEventFrame:UnregisterAllEvents()
	--bnWhisperReceivedEventFrame:UnregisterAllEvents()
	rollReceivedEventFrame:UnregisterAllEvents()
	inspectReadyEventFrame:UnregisterAllEvents()
	combatStatusChangedEventFrame:UnregisterAllEvents()
	groupMemberInfoChangedEventFrame:UnregisterAllEvents()
	groupInfoCache = {}
end

local function EnableOrDisable()
	local shouldBeEnabled = IsPersonalLoot()
	if not isEnabled and shouldBeEnabled then	
		--PLH_SendDebugMessage('...Enabling PLH')
		Enable()
	elseif isEnabled and not shouldBeEnabled then
		--PLH_SendDebugMessage('...Disabling PLH')
		Disable()
	end
	if isEnabled then 
		--PLH_SendDebugMessage('...Calling PopulateGroupInfoCache()')
		PopulateGroupInfoCache()
	end
end

local function GroupMemberInfoChangedEvent(self, event, ...)
	local unit = ...
	if unit == 'player' then
		-- do nothing
	else
		-- update cache
		local name = PLH_GetUnitNameWithRealm(unit)
		if name ~= nil then
			groupInfoCache[name] = nil
			if event == 'UNIT_INVENTORY_CHANGED' then
				-- we need to do another inspect to refresh the cache
				PopulateGroupInfoCache()  -- don't want to mess with any existing cache refresh flow by inspecting this specific character,
					-- so trigger general refresh, which will refresh this character since we've nullified their entry
			else  -- PLAYER_SPECIALIZATION_CHANGED
				-- spec change already gives us the inspect info
				UpdateGroupInfoCache(unit)
			end
		end
	end
end

local function RosterUpdatedEvent(self, event, ...)
	-- the following is a bit of a hack to work around a Blizzard issue.  While the player is logging in, IsInGroup()
	-- is false.  If the user is already in a group (for example, logging back in after a disconnect or doing a /reload),
	-- A ROSTER_UPDATE event triggers.  However, IsInGroup() is not immediately set to true when the event fires!
	-- So if we get a ROSTER_UPDATE event and we're currently disabled, lets wait 1 second to make sure IsInGroup()
	-- gives us the correct value.  Similar behavoir occurred in LFR testing where people joining/leaving the group
	-- may not have been automatically available.  Hence the delay.
	PLH_wait(2, EnableOrDisable)
end

-- triggered when the player enters or leaves combat status, which are the perfect times to refresh the cache since
--    the people who will be eligible for loot should be close enough to be inspected
local function CombatStatusChangedEvent(self, event, ...)
	if isEnabled then
		PopulateGroupInfoCache()
	end
end

function SlashCmdList.PLHelperCommand(msg, editbox)
	if msg == nil or msg == '' then
		InterfaceOptionsFrame_OpenToCategory(PLH_LONG_ADDON_NAME)
		InterfaceOptionsFrame_OpenToCategory(PLH_LONG_ADDON_NAME)  -- hack; called twice to get around Blizz bug of it not opening to correct page right away
	elseif msg == 'endroll' then
		if currentRollItem ~= nil then
			if nextRollDelay > 0 then
				PLH_SendUserMessage('稍等...等待下次R。')
			else
--				PLH_SendBroadcast(UnitName('player') .. ' ended rolls', false)
				PLH_EndRolls()
			end
		else
			PLH_SendUserMessage('There are currently no items being rolled for')
		end
--	elseif msg == 'test' then
--		PLH_UnitTest()
	else
		PLH_SendUserMessage('未知的指令。\n  [/plh]  ：  设置。\n  [/plh endroll]  ： 结束R。')
	end
end

local function Initialize(self, event, addonName, ...)
	if addonName == '_ShiGuang' then
		--PLH_SendDebugMessage('PLH Initializing')
		
		if PLH_MIN_QUALITY == nil then
			PLH_NOTIFY_MODE = DEFAULT_NOTIFY_MODE
			PLH_INCLUDE_BOE = DEFAULT_INCLUDE_BOE
			PLH_MIN_ILVL = DEFAULT_MIN_ILVL
			PLH_MIN_QUALITY = DEFAULT_MIN_QUALITY
			--PLH_DEBUG = DEFAULT_DEBUG
			PLH_CURRENT_SPEC_ONLY = DEFAULT_CURRENT_SPEC_ONLY
		end
		
		-- need global variable option added in version 1.21
		if PLH_CHECK_CHARACTER_LEVEL == nil then
			PLH_CHECK_CHARACTER_LEVEL = DEFAULT_CHECK_CHARACTER_LEVEL
			PLH_COORDINATE_ROLLS = (PLH_NOTIFY_MODE == NOTIFY_MODE_COORDINATE_ROLLS)
			PLH_NOTIFY_GROUP = (PLH_NOTIFY_MODE == NOTIFY_MODE_GROUP or PLH_NOTIFY_MODE == NOTIFY_MODE_COORDINATE_ROLLS)
			PLH_HIGHLIGHT_RAID_FRAMES = DEFAULT_HIGHLIGHT_RAID_FRAMES
			PLH_HIGHLIGHT_SIZE = DEFAULT_HIGHLIGHT_SIZE
		end
		
		if lootReceivedEventFrame == nil then

			lootReceivedEventFrame = CreateFrame('Frame')
			lootReceivedEventFrame:SetScript('OnEvent', LootReceivedEvent)

			whisperReceivedEventFrame = CreateFrame('Frame')
			whisperReceivedEventFrame:SetScript('OnEvent', WhisperReceivedEvent)

			bnWhisperReceivedEventFrame = CreateFrame('Frame')
			bnWhisperReceivedEventFrame:SetScript('OnEvent', BNWhisperReceivedEvent)

			rollReceivedEventFrame = CreateFrame('Frame')
			rollReceivedEventFrame:SetScript('OnEvent', RollReceivedEvent)

			inspectReadyEventFrame = CreateFrame('Frame')
			inspectReadyEventFrame:SetScript('OnEvent', InspectReadyEvent)

			rosterUpdatedEventFrame = CreateFrame('Frame')
			rosterUpdatedEventFrame:SetScript('OnEvent', RosterUpdatedEvent)
			rosterUpdatedEventFrame:RegisterEvent('GROUP_ROSTER_UPDATE')
			rosterUpdatedEventFrame:RegisterEvent('ZONE_CHANGED_NEW_AREA')
			rosterUpdatedEventFrame:RegisterEvent('PLAYER_ENTERING_WORLD')
			
			groupMemberInfoChangedEventFrame = CreateFrame('Frame')
			groupMemberInfoChangedEventFrame:SetScript('OnEvent', GroupMemberInfoChangedEvent)
			
			combatStatusChangedEventFrame = CreateFrame('Frame')
			combatStatusChangedEventFrame:SetScript('OnEvent', CombatStatusChangedEvent)

			rollDelayFrame = CreateFrame('Frame')
			highlightDelayFrame = CreateFrame('Frame')

			-- enable listeners here so people can use the loot coordination feature even for master loot (ex: for BoE drops)
			whisperReceivedEventFrame:RegisterEvent('CHAT_MSG_WHISPER')
			bnWhisperReceivedEventFrame:RegisterEvent('CHAT_MSG_BN_WHISPER')
		end
		
		PLH_CreateOptionsPanel()		
	end
end

--Initialize()
addonLoadedFrame = CreateFrame('Frame')
addonLoadedFrame:SetScript('OnEvent', Initialize)
addonLoadedFrame:RegisterEvent('ADDON_LOADED')

