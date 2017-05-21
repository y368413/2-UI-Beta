local BRPns = {}
local BRPns_encounterInfo = BRPns_encounterInfo or {}
local BRPns_itemBlacklist = BRPns_itemBlacklist or {}
local BRPns_encounterBlacklist = BRPns_encounterBlacklist or {}
local BRPns_dynamicEncounters = BRPns_dynamicEncounters or {}

-- http://www.wowhead.com/spells=0?filter=na=Bonus;cr=84:109:16;crs=1:6:5
for spellID, encounterInfo in next, {
	--- World
	[132205] = {691, 322, 3}, -- Sha of Anger
	[132206] = {725, 322, 3}, -- Salyis' Warband (Galleon)
	[136381] = {814, 322, 3}, -- Nalak, The Storm God
	[137554] = {826, 322, 3}, -- Oondasta
	[148317] = {857, 322, 3}, -- Celestials (also encounterIDs 858, 859 and 860)
	[148316] = {861, 322, 3}, -- Ordos, Fire-God of the Yaungol

	--- Raids
	-- Mogu'Shan Vaults
	[125144] = {679, 317, nil, 4}, -- The Stone Guard
	[132189] = {689, 317, nil, 4}, -- Feng the Accursed
	[132190] = {682, 317, nil, 4}, -- Gara'jal the Spiritbinder
	[132191] = {687, 317, nil, 4}, -- The Spirit Kings
	[132192] = {726, 317, nil, 4}, -- Elegon
	[132193] = {677, 317, nil, 4}, -- Will of the Emperor

	-- Heart of Fear
	[132194] = {745, 330, nil, 4}, -- Imperial Vizier Zor'lok
	[132195] = {744, 330, nil, 4}, -- Blade Lord Tay'ak
	[132196] = {713, 330, nil, 4}, -- Garalon
	[132197] = {741, 330, nil, 4}, -- Wind Lord Mel'jarak
	[132198] = {737, 330, nil, 4}, -- Amber-Shaper Un'sok
	[132199] = {743, 330, nil, 4}, -- Grand Empress Shek'zeer

	-- Terrace of Endless Spring
	[132200] = {683, 320, nil, 4}, -- Protectors of the Endless
	[132204] = {683, 320, nil, 4}, -- Protectors of the Endless (Elite)
	[132201] = {742, 320, nil, 4}, -- Tsulong
	[132202] = {729, 320, nil, 4}, -- Lei Shi
	[132203] = {709, 320, nil, 4}, -- Sha of Fear

	-- Throne of Thunder
	[139674] = {827, 362, nil, 4}, -- Jin'rokh the Breaker
	[139677] = {819, 362, nil, 4}, -- Horridon
	[139679] = {816, 362, nil, 4}, -- Council of Elders
	[139680] = {825, 362, nil, 4}, -- Tortos
	[139682] = {821, 362, nil, 4}, -- Magaera
	[139684] = {828, 362, nil, 4}, -- Ji'kun, the Ancient Mother
	[139686] = {818, 362, nil, 4}, -- Durumu the Forgotten
	[139687] = {820, 362, nil, 4}, -- Primordious
	[139688] = {824, 362, nil, 4}, -- Dark Animus
	[139689] = {817, 362, nil, 4}, -- Iron Qon
	[139690] = {829, 362, nil, 4}, -- Twin Consorts (Empyreal Queens)
	[139691] = {832, 362, nil, 4}, -- Lei Shen, The Thunder King
	[139692] = {831, 362, nil, 4}, -- Ra-den

	-- Siege of Orgrimmar
	[145909] = {852, 369, nil, 4}, -- Immerseus
	[145910] = {849, 369, nil, 4}, -- The Fallen Protectors
	[145911] = {866, 369, nil, 4}, -- Norushen
	[145912] = {867, 369, nil, 4}, -- Sha of Pride
	-- Galakras needs special handling
	[145914] = {864, 369, nil, 4}, -- Iron Juggernaut
	[145915] = {856, 369, nil, 4}, -- Kor'kron Dark Shaman
	[145916] = {850, 369, nil, 4}, -- General Nazgrim
	[145917] = {846, 369, nil, 4}, -- Malkorok
	[145919] = {870, 369, nil, 4}, -- Spoils of Pandaria
	[145920] = {851, 369, nil, 4}, -- Thok the Bloodthirsty
	[145918] = {865, 369, nil, 4}, -- Siegecrafter Blackfuse
	[145921] = {853, 369, nil, 4}, -- Paragons of the Klaxxi
	[145922] = {869, 369, nil, 4}, -- Garrosh Hellscream
	
	------------------
		--- World
	[178847] = {1291, 557, 14}, -- Drov the Ruiner
	[178849] = {1211, 557, 14}, -- Tarina the Ageless
	[178851] = {1262, 557, 14}, -- Rukhmar
	[188985] = {1452, 557, 15}, -- Supreme Lord Kazzak

	--- Raids
	-- Highmaul
	[177521] = {1128, 477, nil, 14}, -- Kargath Bladefist
	[177522] = {971, 477, nil, 14}, -- The Butcher
	[177523] = {1195, 477, nil, 14}, -- Tectus
	[177524] = {1196, 477, nil, 14}, -- Brackenspore
	[177525] = {1148, 477, nil, 14}, -- Twin Ogron
	[177526] = {1153, 477, nil, 14}, -- Ko'ragh
	[177528] = {1197, 477, nil, 14}, -- Imperator Mar'gok

	-- Blackrock Foundry
	[177529] = {1161, 457, nil, 14}, -- Gruul
	[177530] = {1202, 457, nil, 14}, -- Oregorger
	[177536] = {1122, 457, nil, 14}, -- Beastlord Darmac
	[177534] = {1123, 457, nil, 14}, -- Flamebender Ka'graz
	[177533] = {1155, 457, nil, 14}, -- Hans'gar and Franzok
	[177537] = {1147, 457, nil, 14}, -- Operator Thogar
	[177531] = {1154, 457, nil, 14}, -- The Blast Furnace
	[177535] = {1162, 457, nil, 14}, -- Kromog
	[177538] = {1203, 457, nil, 14}, -- The Iron Maidens
	[177539] = {959, 457},   -- Blackhand

	-- Hellfire Citadel
	[188972] = {1426, 669, nil, 14}, -- Hellfire Assault
	[188973] = {1425, 669, nil, 14}, -- Iron Reaver
	[188974] = {1392, 669, nil, 14}, -- Kormrok
	[188975] = {1432, 669, nil, 14}, -- Hellfire High Council
	[188976] = {1396, 669, nil, 14}, -- Kilrogg Deadeye
	[188977] = {1372, 669, nil, 14}, -- Gorefiend
	[188978] = {1433, 669, nil, 14}, -- Shadow-Lord Iskar
	[188979] = {1427, 669, nil, 14}, -- Socrethar the Eternal
	[188980] = {1391, 669, nil, 14}, -- Fel Lord Zakuun
	[188981] = {1447, 669, nil, 14}, -- Xhul'horac
	[188982] = {1394, 669, nil, 14}, -- Tyrant Velhari
	[188983] = {1395, 669, nil, 14}, -- Mannoroth
	[188984] = {1438, 669, nil, 14}, -- Archimonde

	--- Dungeons
	-- Auchindoun (Mythic)
	[190154] = {1185, 547, 23}, -- Vigilant Kaathar
	[190155] = {1186, 547, 23}, -- Soulbinder Nyami
	[190156] = {1216, 547, 23}, -- Azzakel
	[190157] = {1225, 547, 23}, -- Teron'gor

	-- Upper Blackrock Spire (Mythic)
	[190168] = {1226, 559, 23}, -- Orebender Gor'ashan
	[190170] = {1227, 559, 23}, -- Kyrak
	[190171] = {1228, 559, 23}, -- Commander Tharbek
	[190172] = {1229, 559, 23}, -- Ragewing the Untamed
	[190173] = {1234, 559, 23}, -- Warlord Zaela

	-- Shadowmoon Burial Grounds (Mythic)
	[190150] = {1139, 537, 23}, -- Sadana Bloodfury
	[190151] = {1168, 537, 23}, -- Nhallish
	[190152] = {1140, 537, 23}, -- Bonemaw
	[190153] = {1160, 537, 23}, -- Ner'zhul

	-- The Everbloom (Mythic)
	[190158] = {1214, 556, 23}, -- Witherbark
	[190159] = {1207, 556, 23}, -- Ancient Protectors
	[190160] = {1208, 556, 23}, -- Archmage Sol
	[190162] = {1209, 556, 23}, -- Xeri'tac
	[190163] = {1210, 556, 23}, -- Yalnu

	-- Grimrail Depot (Mythic)
	[190147] = {1138, 536, 23}, -- Rocketspark and Borka
	[190148] = {1163, 536, 23}, -- Nitrogg Thundertower
	[190149] = {1133, 536, 23}, -- Skylord Tovra

	-- Iron Docks (Mythic)
	[190164] = {1235, 558, 23}, -- Fleshrender Nok'gar
	[190165] = {1236, 558, 23}, -- Grimrail Enforcers
	[190166] = {1237, 558, 23}, -- Oshir
	[190167] = {1238, 558, 23}, -- Skulloc

	-- Skyreach (Mythic)
	[190142] = {965, 476, 23}, -- Ranjit
	[190143] = {966, 476, 23}, -- Araknath
	[190144] = {967, 476, 23}, -- Rukhran
	[190146] = {968, 476, 23}, -- High Sage Viryx

	-- Bloodmaul Slag Mines (Mythic)
	[190138] = {893, 385, 23}, -- Magmolatus
	[190139] = {888, 385, 23}, -- Slave Watcher Crushto
	[190140] = {887, 385, 23}, -- Roltall
	[190141] = {889, 385, 23}, -- Gug'rokk
	
	----------------------------
		--- World
	[227128] = {1790, 822, 14}, -- Ana-Mouz
	[227129] = {1774, 822, 14}, -- Calamir
	[227130] = {1789, 822, 14}, -- Drugon the Frostblood
	[227131] = {1795, 822, 14}, -- Flotsam
	[227132] = {1770, 822, 14}, -- Humongris
	[227133] = {1769, 822, 14}, -- Levantus
	[227134] = {1783, 822, 14}, -- Na'zak the Fiend
	[227135] = {1749, 822, 14}, -- Nithogg
	[227136] = {1763, 822, 14}, -- Shar'thos
	[227137] = {1756, 822, 14}, -- The Soultakers
	[227138] = {1796, 822, 14}, -- Withered J'im
	[242969] = {1956, 822, 14}, -- Apocron
	[242970] = {1883, 822, 14}, -- Brutallus
	[242971] = {1884, 822, 14}, -- Malificus
	[242972] = {1885, 822, 14}, -- Si'vash

	--- Raids
	-- The Emerald Nightmare
	[221046] = {1703, 768, nil, 14}, -- Nythendra
	[221047] = {1738, 768, nil, 14}, -- Il'gynoth, Heart of Corruption
	[221048] = {1744, 768, nil, 14}, -- Elerethe Renferal
	[221049] = {1667, 768, nil, 14}, -- Ursoc
	[221050] = {1704, 768, nil, 14}, -- Dragons of Nightmare
	[221052] = {1750, 768, nil, 14}, -- Cenarius
	[221053] = {1726, 768, nil, 14}, -- Xavius

	-- Trial of Valor
	[232466] = {1819, 861, nil, 14}, -- Odyn
	[232467] = {1830, 861, nil, 14}, -- Guarm
	[232468] = {1829, 861, nil, 14}, -- Helya

	-- The Nighthold
	[232436] = {1706, 786, nil, 14}, -- Skorpyron
	[232437] = {1725, 786, nil, 14}, -- Chronomatic Anomaly
	[232438] = {1731, 786, nil, 14}, -- Trilliax
	[232439] = {1751, 786, nil, 14}, -- Spellblade Aluriel
	[232440] = {1762, 786, nil, 14}, -- Tichondrius
	[232441] = {1713, 786, nil, 14}, -- Krosus
	[232442] = {1761, 786, nil, 14}, -- High Botanist Tel'arn
	[232443] = {1732, 786, nil, 14}, -- Star Augur Etraeus
	-- Grand Magistrix Elisande needs special handling
	[232445] = {1737, 786, nil, 14}, -- Gul'dan

	-- Tomb of Sargeras
	-- [240655] = {1862, 875}, -- 1 Goroth
	-- [240656] = {1867, 875}, -- 2 Demonic Inquisition
	-- [240657] = {1856, 875}, -- 3 Harjatan
	-- [240658] = {1903, 875}, -- 4 Sisters of the Moon
	-- [240659] = {1861, 875}, -- 5 Mistress Sassz'ine
	-- [240660] = {1896, 875}, -- 6 The Desolate Host
	-- [240661] = {1897, 875}, -- 7 Maiden of Vigilance
	-- [240662] = {1873, 875}, -- 8 Fallen Avatar
	-- [240663] = {1898, 875}, -- 9 Kil'jaeden

	--- Dungeons
	-- Return to Karazhan (Mythic)
	[232102] = {1820, 860, 23}, -- Opera Hall: Wikket
	[232103] = {1826, 860, 23}, -- Opera Hall: Westfall Story
	[232104] = {1827, 860, 23}, -- Opera Hall: Beautiful Beast
	[232101] = {1825, 860, 23}, -- Maiden of Virtue
	[232099] = {1835, 860, 23}, -- Attumen the Huntsman
	[232100] = {1837, 860, 23}, -- Moroes
	[232105] = {1836, 860, 23}, -- The Curator
	[232106] = {1817, 860, 23}, -- Shade of Medivh
	[232107] = {1818, 860, 23}, -- Mana Devourer
	[232108] = {1838, 860, 23}, -- Viz'aduum the Watcher

	-- Assault on Violet Hold (Mythic)
	[226656] = {1693, 777, 23}, -- Festerface
	[226657] = {1694, 777, 23}, -- Shivermaw
	[226658] = {1702, 777, 23}, -- Blood-Princess Thal'ena
	[226659] = {1686, 777, 23}, -- Mindflayer Kaahrj
	[226660] = {1688, 777, 23}, -- Millificent Manastorm
	[226661] = {1696, 777, 23}, -- Anub'esset
	[226662] = {1711, 777, 23}, -- Sael'orn
	[226663] = {1697, 777, 23}, -- Fel Lord Betrug

	-- Black Rook Hold (Mythic)
	[226595] = {1518, 740, 23}, -- The Amalgam of Souls
	[226599] = {1653, 740, 23}, -- Illysanna Ravencrest
	[226600] = {1664, 740, 23}, -- Smashspite the Hateful
	[226603] = {1672, 740, 23}, -- Lord Kur'talos Ravencrest

	-- Court of Stars (Mythic)
	[226605] = {1718, 800, 23}, -- Patrol Captain Gerdo
	[226607] = {1719, 800, 23}, -- Talixae Flamewreath
	[226608] = {1720, 800, 23}, -- Advisor Melandrus

	-- Darkheart Thicket (Mythic)
	[226610] = {1654, 762, 23}, -- Archdruid Glaidalis
	[226611] = {1655, 762, 23}, -- Oakheart
	[226613] = {1656, 762, 23}, -- Dresaron
	[226615] = {1657, 762, 23}, -- Shade of Xavius

	-- Eye of Azshara (Mythic)
	[226618] = {1480, 716, 23}, -- Warlord Parjesh
	[226619] = {1490, 716, 23}, -- Lady Hatecoil
	[226621] = {1491, 716, 23}, -- King Deepbeard
	[226622] = {1479, 716, 23}, -- Serpentrix
	[226624] = {1492, 716, 23}, -- Wrath of Azshara

	-- Halls of Valor (Mythic)
	[226636] = {1485, 721, 23}, -- Hymdall
	[226626] = {1486, 721, 23}, -- Hyrja
	[226627] = {1487, 721, 23}, -- Fenryr
	[226629] = {1488, 721, 23}, -- God-King Skovald
	[226625] = {1489, 721, 23}, -- Odyn

	-- Maw of Souls (Mythic)
	[226637] = {1502, 727, 23}, -- Ymiron, the Fallen King
	[226638] = {1512, 727, 23}, -- Harbaron
	[226639] = {1663, 727, 23}, -- Helya

	-- Neltharion's Lair (Mythic)
	[226640] = {1662, 767, 23}, -- Rokmora
	[226641] = {1665, 767, 23}, -- Ularogg Cragshaper
	[226642] = {1673, 767, 23}, -- Naraxas
	[226643] = {1687, 767, 23}, -- Dargul the Underking

	-- The Arcway (Mythic)
	[226644] = {1497, 726, 23}, -- Ivanyr
	[226645] = {1498, 726, 23}, -- Corstilax
	[226646] = {1499, 726, 23}, -- General Xakal
	[226647] = {1500, 726, 23}, -- Nal'tira
	[226648] = {1501, 726, 23}, -- Advisor Vandros

	-- Vault of the Wardens (Mythic)
	[226649] = {1467, 707, 23}, -- Tirathon Saltheril
	[226652] = {1695, 707, 23}, -- Inquisitor Tormentorum
	[226653] = {1468, 707, 23}, -- Ash'golm
	[226654] = {1469, 707, 23}, -- Glazer
	[226655] = {1470, 707, 23}, -- Cordana Felsong

	-- Cathedral of Eternal Night (Mythic)
	[244782] = {1905, 900, 23}, -- Agronox
	[244783] = {1906, 900, 23}, -- Thrashbite the Scornful
	[244784] = {1904, 900, 23}, -- Domatrax
	[244786] = {1878, 900, 23}, -- Mephistroth
} do
	BRPns_encounterInfo[spellID] = encounterInfo
end

-- Galakras has two IDs (868, 881). (1743, 1872).
-- Pick whichever one the client wants to use at load.
BRPns_dynamicEncounters[145913] = {5, 369, nil, 4}
BRPns_dynamicEncounters[232444] = {9, 786, nil, 14}

for _, itemID in next, {
	-- Mounts
	87777, -- Reins of the Astral Cloud Serpent
	93666, -- Spawn of Horridon
	95059, -- Cluth of Ji-Kun
	104253, -- Kor'kron Juggernaut
		-- Mounts
	116771, -- Solar Spirehawk
	116660, -- Ironhoof Destroyer
	123890, -- Felsteel Annihilator
} do
	BRPns_itemBlacklist[itemID] = true
end

for _, spellID in next, {
	232109, -- Nightbane (no dungeon journal entry)
} do
	BRPns_encounterBlacklist[spellID] = true
end

----------------------------------
local itemButtons = {}
local BACKDROP = {
	bgFile = [[Interface\ChatFrame\ChatFrameBackground]], tile = true, tileSize = 16,
	edgeFile = [[Interface\Tooltips\UI-Tooltip-Border]], edgeSize = 16,
	insets = {left = 4, right = 4, top = 4, bottom = 4}
}

local Container = CreateFrame('Frame', 'BonusRollPreviewContainer', BonusRollFrame)
local Handle = CreateFrame('Button', 'BonusRollPreviewHandle', BonusRollFrame)

local function ShouldFillDownwards()
	return (GetScreenHeight() - (BonusRollFrame:GetTop() or 200)) < 345
end

--- ItemButton
local function OnItemButtonClick(self)
	HandleModifiedItemClick(self.itemLink)
end

local function OnItemButtonEnter(self)
	GameTooltip:SetOwner(self, 'ANCHOR_TOPLEFT')
	GameTooltip:SetHyperlink(self.itemLink)
	Container:RegisterEvent('MODIFIER_STATE_CHANGED')
end

local function OnItemButtonLeave(self)
	GameTooltip:Hide()
	Container:UnregisterEvent('MODIFIER_STATE_CHANGED')
end

local function CreateItemButton(index)
	local Button = CreateFrame('Button', '$parentItemButton' .. index, Container.ScrollChild)
	Button:SetPoint('TOPLEFT', 6, (index - 1) * -40)
	Button:SetPoint('TOPRIGHT', -22, (index - 1) * -40)
	Button:SetHeight(38)

	local Icon = Button:CreateTexture('$parentIcon', 'BACKGROUND')
	Icon:SetPoint('TOPLEFT', 1, -1)
	Icon:SetSize(36, 36)
	Button.Icon = Icon

	local Background = Button:CreateTexture('$parentBackground', 'BORDER')
	Background:SetAllPoints()
	Background:SetTexture([[Interface\EncounterJournal\UI-EncounterJournalTextures]])
	Background:SetTexCoord(0.00195313, 0.62890625, 0.61816406, 0.66210938)
	Background:SetDesaturated(true)

	local Name = Button:CreateFontString('$parentName', 'ARTWORK', 'GameFontNormalMed3')
	Name:SetPoint('TOPLEFT', Icon, 'TOPRIGHT', 7, -4)
	Name:SetPoint('TOPRIGHT', -6, -4)
	Name:SetHeight(12)
	Name:SetJustifyH('LEFT')
	Button.Name = Name

	local Class = Button:CreateFontString('$parentClass', 'ARTWORK', 'GameFontHighlight')
	Class:SetPoint('BOTTOMRIGHT', -6, 5)
	Class:SetSize(0, 12)
	Class:SetJustifyH('RIGHT')
	Button.Class = Class

	local Slot = Button:CreateFontString('$parentSlot', 'ARTWORK', 'GameFontHighlight')
	Slot:SetPoint('BOTTOMLEFT', Icon, 'BOTTOMRIGHT', 7, 4)
	Slot:SetPoint('BOTTOMRIGHT', Class, 'BOTTOMLEFT', -15, 0)
	Slot:SetSize(0, 12)
	Slot:SetJustifyH('LEFT')
	Button.Slot = Slot

	Button:SetScript('OnClick', OnItemButtonClick)
	Button:SetScript('OnEnter', OnItemButtonEnter)
	Button:SetScript('OnLeave', OnItemButtonLeave)

	return Button
end

local function GetItemButton(index)
	local ItemButton = itemButtons[index]
	if(not ItemButton) then
		ItemButton = CreateItemButton(index)
		itemButtons[index] = ItemButton
	end

	return ItemButton
end

--- Handle
local function UpdateHandle(collapsed)
	Handle:ClearAllPoints()
	Handle.collapsed = collapsed

	if(collapsed) then
		if(ShouldFillDownwards()) then
			Handle.Arrow:SetTexCoord(0, 0, 1/2, 0, 0, 1, 1/2, 1)
			Handle:SetPoint('TOP', BonusRollFrame, 'BOTTOM', 0, 2)
		else
			Handle.Arrow:SetTexCoord(1/2, 1, 0, 1, 1/2, 0, 0, 0)
			Handle:SetPoint('BOTTOM', BonusRollFrame, 'TOP', 0, -2)
		end
	else
		if(ShouldFillDownwards()) then
			Handle.Arrow:SetTexCoord(1/2, 1, 1, 1, 1/2, 0, 1, 0)
			Handle:SetPoint('BOTTOM', Container, 0, -14)
		else
			Handle.Arrow:SetTexCoord(1, 0, 1/2, 0, 1, 1, 1/2, 1)
			Handle:SetPoint('TOP', Container, 0, 14)
		end
	end
end

local function OnHandleClick(self)
	UpdateHandle(not self.collapsed)
	Container:SetShown(not self.collapsed)
end

function Container:CreateHandle()
	Handle:SetSize(64, 16)
	Handle:SetNormalTexture([[Interface\RaidFrame\RaidPanel-Toggle]])
	Handle:SetScript('OnClick', OnHandleClick)
	Handle.Arrow = Handle:GetNormalTexture()

	local HandleBackground = Handle:CreateTexture('$parentBackground', 'BACKGROUND')
	HandleBackground:SetAllPoints()
	HandleBackground:SetColorTexture(0, 0, 0, 0.8)

	local TopCenter = Handle:CreateTexture('$parentTopCenter', 'BORDER')
	TopCenter:SetPoint('TOP', 0, 4.5)
	TopCenter:SetSize(24, 12)
	TopCenter:SetTexture([[Interface\RaidFrame\RaidPanel-UpperMiddle]])
	Handle.TopCenter = TopCenter

	local TopRight = Handle:CreateTexture('$parentTopRight', 'BORDER')
	TopRight:SetPoint('TOPRIGHT', 4, 4)
	TopRight:SetSize(24, 20)
	TopRight:SetTexture([[Interface\RaidFrame\RaidPanel-UpperRight]])
	TopRight:SetTexCoord(0, 1, 0, 0.8)
	Handle.TopRight = TopRight

	local TopLeft = Handle:CreateTexture('$parentTopLeft', 'BORDER')
	TopLeft:SetPoint('TOPLEFT', -4, 4)
	TopLeft:SetSize(24, 20)
	TopLeft:SetTexture([[Interface\RaidFrame\RaidPanel-UpperLeft]])
	TopLeft:SetTexCoord(0, 1, 0, 0.8)
	Handle.TopLeft = TopLeft

	local BottomCenter = Handle:CreateTexture('$parentBottomCenter', 'BORDER')
	BottomCenter:SetPoint('BOTTOM', 0, -9)
	BottomCenter:SetSize(24, 12)
	BottomCenter:SetTexture([[Interface\RaidFrame\RaidPanel-BottomMiddle]])
	Handle.BottomCenter = BottomCenter

	local BottomRight = Handle:CreateTexture('$parentBottomRight', 'BORDER')
	BottomRight:SetPoint('BOTTOMRIGHT', 4, -6)
	BottomRight:SetSize(24, 22)
	BottomRight:SetTexture([[Interface\RaidFrame\RaidPanel-BottomRight]])
	BottomRight:SetTexCoord(0, 1, 0.1, 1)
	Handle.BottomRight = BottomRight

	local BottomLeft = Handle:CreateTexture('$parentBottomLeft', 'BORDER')
	BottomLeft:SetPoint('BOTTOMLEFT', -4, -6)
	BottomLeft:SetSize(24, 22)
	BottomLeft:SetTexture([[Interface\RaidFrame\RaidPanel-BottomLeft]])
	BottomLeft:SetTexCoord(0, 1, 0.1, 1)
	Handle.BottomLeft = BottomLeft
end

--- Container
local function OnScrollUpClick(self)
	local Slider = self:GetParent()
	Slider:SetValue(Slider:GetValue() - Slider:GetHeight() / 3)
end

local function OnScrollDownClick(self)
	local Slider = self:GetParent()
	Slider:SetValue(Slider:GetValue() + Slider:GetHeight() / 3)
end

local function OnSliderValueChanged(self, value)
	local min, max = self:GetMinMaxValues()
	if(value == min) then
		self.ScrollUp:Disable()
	else
		self.ScrollUp:Enable()
	end

	if(value == max) then
		self.ScrollDown:Disable()
	else
		self.ScrollDown:Enable()
	end

	local Scroll = self:GetParent()
	Scroll:SetVerticalScroll(value)
	Scroll:GetScrollChild():SetPoint('TOP', 0, value)
end

local function OnScrollMouseWheel(self, alpha)
	if(alpha > 0) then
		self.Slider:SetValue(self.Slider:GetValue() - self.Slider:GetHeight() / 3)
	else
		self.Slider:SetValue(self.Slider:GetValue() + self.Slider:GetHeight() / 3)
	end
end

function Container:CreateFrame()
	local ScrollChild = CreateFrame('Frame', '$parentScrollChild', self)
	ScrollChild:SetHeight(1) -- Completely ignores this value, bug?
	self.ScrollChild = ScrollChild

	local Scroll = CreateFrame('ScrollFrame', '$parentScrollFrame', self)
	Scroll:SetPoint('TOPLEFT', 0, -6)
	Scroll:SetPoint('BOTTOMRIGHT', 0, 6)
	Scroll:SetScrollChild(ScrollChild)
	Scroll:SetScript('OnMouseWheel', OnScrollMouseWheel)

	self:SetWidth(286)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() - 2)
	self:SetBackdrop(BACKDROP)
	self:SetBackdropColor(0, 0, 0, 0.8)
	self:SetBackdropBorderColor(2/3, 2/3, 2/3)

	local Slider = CreateFrame('Slider', '$parentScrollBar', Scroll)
	Slider:SetPoint('TOPRIGHT', -5, -16)
	Slider:SetPoint('BOTTOMRIGHT', -5, 14)
	Slider:SetWidth(16)
	Slider:SetFrameLevel(self:GetFrameLevel() + 10)
	Slider:SetScript('OnValueChanged', OnSliderValueChanged)
	Scroll.Slider = Slider
	self.Slider = Slider

	local Thumb = Scroll:CreateTexture('$parentThumbTexture')
	Thumb:SetSize(16, 24)
	Thumb:SetTexture([[Interface\Buttons\UI-ScrollBar-Knob]])
	Thumb:SetTexCoord(1/4, 3/4, 1/8, 7/8)
	Slider:SetThumbTexture(Thumb)

	local ScrollUp = CreateFrame('Button', '$parentScrollUpButton', Slider)
	ScrollUp:SetPoint('BOTTOM', Slider, 'TOP')
	ScrollUp:SetSize(16, 16)
	ScrollUp:SetNormalTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Up]])
	ScrollUp:SetDisabledTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Disabled]])
	ScrollUp:SetHighlightTexture([[Interface\Buttons\UI-ScrollBar-ScrollUpButton-Highlight]])
	ScrollUp:GetNormalTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollUp:GetDisabledTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollUp:GetHighlightTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollUp:GetHighlightTexture():SetBlendMode('ADD')
	ScrollUp:SetScript('OnClick', OnScrollUpClick)
	Slider.ScrollUp = ScrollUp

	local ScrollDown = CreateFrame('Button', '$parentScrollDownButton', Slider)
	ScrollDown:SetPoint('TOP', Slider, 'BOTTOM')
	ScrollDown:SetSize(16, 16)
	ScrollDown:SetNormalTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Up]])
	ScrollDown:SetDisabledTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Disabled]])
	ScrollDown:SetHighlightTexture([[Interface\Buttons\UI-ScrollBar-ScrollDownButton-Highlight]])
	ScrollDown:GetNormalTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollDown:GetDisabledTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollDown:GetHighlightTexture():SetTexCoord(1/4, 3/4, 1/4, 3/4)
	ScrollDown:GetHighlightTexture():SetBlendMode('ADD')
	ScrollDown:SetScript('OnClick', OnScrollDownClick)
	Slider.ScrollDown = ScrollDown

	local Empty = self:CreateFontString('$parentPlaceholder', 'ARTWORK', 'GameFontHighlight')
	Empty:SetPoint('TOPLEFT', 10, 0)
	Empty:SetPoint('BOTTOMRIGHT', -10, 0)
	Empty:SetText('This encounter has no possible items for your current class and/or specialization.')
	self.Empty = Empty
end

--- Hooks
local function HookSetPoint()
	Container:ClearAllPoints()

	if(ShouldFillDownwards()) then
		Container:SetPoint('TOP', BonusRollFrame, 'BOTTOM')

		Handle.Arrow:SetTexCoord(0, 0, 1/2, 0, 0, 1, 1/2, 1)
		Handle.TopCenter:Hide()
		Handle.TopRight:Hide()
		Handle.TopLeft:Hide()
		Handle.BottomCenter:Show()
		Handle.BottomRight:Show()
		Handle.BottomLeft:Show()
	else
		Container:SetPoint('BOTTOM', BonusRollFrame, 'TOP')

		Handle.Arrow:SetTexCoord(1/2, 1, 0, 1, 1/2, 0, 0, 0)
		Handle.TopCenter:Show()
		Handle.TopRight:Show()
		Handle.TopLeft:Show()
		Handle.BottomCenter:Hide()
		Handle.BottomRight:Hide()
		Handle.BottomLeft:Hide()
	end

	UpdateHandle(true)
end

--- Logic
function Container:StartEncounter()
	for index, button in next, itemButtons do
		button:Hide()
	end

	EJ_SelectInstance(self.instanceID)
	EJ_SelectEncounter(self.encounterID)

	if(not self.difficulty) then
		-- This should only ever happen in raids, everything else is hardcoded
		self.difficulty = select(3, GetInstanceInfo())
	end

	if(not self.difficulty or self.difficulty == 0) then
		-- Fallback difficulty, for PEW
		self.difficulty = self.fallbackDifficulty
	end

	self:RegisterEvent('EJ_DIFFICULTY_UPDATE')
	if(EncounterJournal) then
		EncounterJournal:UnregisterEvent('EJ_DIFFICULTY_UPDATE')
	end

	EJ_SetDifficulty(self.difficulty)
end

function Container:UpdateItems()
	if(not self:IsEventRegistered('EJ_LOOT_DATA_RECIEVED')) then
		self:RegisterEvent('EJ_LOOT_DATA_RECIEVED')
	end

	if(EncounterJournal) then
		EncounterJournal:UnregisterEvent('EJ_LOOT_DATA_RECIEVED')
	end

	local numItems = 0
	for index = 1, EJ_GetNumLoot() do
		local itemID, encounterID, name, texture, slot, armorType, itemLink = EJ_GetLootInfoByIndex(index)
		if(not itemLink) then
			-- Let the client receive the data
			return
		end

		if(not BRPns_itemBlacklist[itemID]) then
			numItems = numItems + 1

			local ItemButton = GetItemButton(numItems)
			ItemButton.Icon:SetTexture(texture)
			ItemButton.Name:SetText(name)
			ItemButton.Slot:SetText(slot)
			ItemButton.Class:SetText(armorType)
			ItemButton.itemLink = itemLink
			ItemButton:Show()
		end
	end

	if(self:IsEventRegistered('EJ_LOOT_DATA_RECIEVED')) then
		self:UnregisterEvent('EJ_LOOT_DATA_RECIEVED')
	end

	if(EncounterJournal) then
		EncounterJournal:RegisterEvent('EJ_LOOT_DATA_RECIEVED')
	end

	self:SetHeight(math.min(330, math.max(50, 10 + (numItems * 40))))

	if(numItems > 0) then
		local height = (10 + (numItems * 40)) - self:GetHeight()
		self.Slider:SetMinMaxValues(0, height > 0 and height or 0)
		self.Slider:SetValue(0)

		if(numItems > 8) then
			self:EnableMouseWheel(true)
			self.Slider:Show()
			self.ScrollChild:SetWidth(286)
		else
			self:EnableMouseWheel(false)
			self.Slider:Hide()
			self.ScrollChild:SetWidth(302)
		end

		self.Empty:Hide()
	else
		self.Empty:Show()
		self:EnableMouseWheel(false)
		self.Slider:Hide()
		self.ScrollChild:SetWidth(302)
	end
end

function Container:UpdateItemFilter()
	local _, _, classID = UnitClass('player')
	local lootSpecialization = GetLootSpecialization()
	if(not lootSpecialization or lootSpecialization == 0) then
		lootSpecialization = (GetSpecializationInfo(GetSpecialization() or 0)) or 0
	end

	EJ_SetLootFilter(classID, lootSpecialization)
end

--- Events
function Container:EJ_DIFFICULTY_UPDATE(event)
	if(EncounterJournal) then
		EncounterJournal:RegisterEvent(event)
	end

	self:UnregisterEvent(event)
	self:UpdateItemFilter()
	self:UpdateItems()
end

function Container:EJ_LOOT_DATA_RECIEVED(event)
	if(BonusRollFrame:IsShown()) then
		self:UpdateItems()
	end
end

function Container:PLAYER_LOOT_SPEC_UPDATED()
	-- We need to restart the entire encounter in case the user has
	-- used the Adventure Guide before changing loot specializations.
	self:StartEncounter()
end

function Container:SPELL_CONFIRMATION_PROMPT(event, spellID, confirmType, _, _, currencyID)
	if(confirmType == LE_SPELL_CONFIRMATION_PROMPT_TYPE_BONUS_ROLL) then
		self:Hide()
		Handle:Hide()

		local encounterInfo = BRPns_encounterInfo[spellID]
		if(encounterInfo) then
			local _, count = GetCurrencyInfo(currencyID)
			if(count > 0) then
				self:RegisterEvent('PLAYER_LOOT_SPEC_UPDATED')

				self.encounterID = encounterInfo[1]
				self.instanceID = encounterInfo[2]
				self.difficulty = encounterInfo[3]
				self.fallbackDifficulty = encounterInfo[4]
				self:StartEncounter()

				Handle:Show()
				UpdateHandle(true)
			end
		elseif(not BRPns_encounterBlacklist[spellID]) then
			--print('|cffff8080'':|r Found an unknown spell [' .. spellID .. ']. Please report this, with boss name!')
			print('|cffff8080报错了:|r  [' .. spellID .. ']. 去汇报给作者吧!')
		end
	end
end

function Container:PLAYER_ENTERING_WORLD(event)
	for _, info in next, GetSpellConfirmationPromptsInfo() do
		if(info) then
			self:SPELL_CONFIRMATION_PROMPT(event, info.spellID, info.confirmType, nil, nil, info.currencyID)
		end
	end
end

function Container:SPELL_CONFIRMATION_TIMEOUT()
	self:UnregisterEvent('PLAYER_LOOT_SPEC_UPDATED')
end

function Container:MODIFIER_STATE_CHANGED()
	if(IsModifiedClick('COMPAREITEMS') or GetCVarBool('alwaysCompareItems')) then
		GameTooltip_ShowCompareItem()
	else
		for _, shoppingTooltip in next, GameTooltip.shoppingTooltips do
			shoppingTooltip:Hide()
		end
	end

	if(IsModifiedClick('DRESSUP')) then
		ShowInspectCursor()
	else
		ResetCursor()
	end
end

function Container:PLAYER_LOGIN()
	self:CreateFrame()
	self:CreateHandle()

	self:RegisterEvent('SPELL_CONFIRMATION_PROMPT')
	self:RegisterEvent('SPELL_CONFIRMATION_TIMEOUT')

	hooksecurefunc(BonusRollFrame, 'SetPoint', HookSetPoint)

	-- Inject odd encounters
	for spellID, data in next, BRPns_dynamicEncounters do
		EJ_SelectInstance(data[2])
		BRPns_encounterInfo[spellID] = {
			(select(3, EJ_GetEncounterInfoByIndex(data[1]))),
			data[2],
			data[3],
			data[4],
		}
	end
end

Container:RegisterEvent('PLAYER_LOGIN')
Container:RegisterEvent('PLAYER_ENTERING_WORLD')
Container:SetScript('OnEvent', function(self, event, ...)
	self[event](self, event, ...)
end)

---------------------------------
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
