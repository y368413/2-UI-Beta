-- $Id: Constants.lua 154 2018-09-18 15:18:12Z arith $
local _G = getfenv(0)
local constants = {}

constants.defaults = {
	profile = {
		show_currency = true,
		show_money = false,
		show_iconOnly = false,
		show_tooltip = true,
		hide_zero = true,
		breakupnumbers = true,
		icon_first = false,
		always_lock = false,
		hide_in_combat = false,
		hide_in_petbattle = false,
		hide_in_battleground = false,
		point = { "BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -6, 0 },
		scale = 1,
		alpha = 1,
		bgalpha = 0.1,
		tooltip_alpha = 0.9,
		tooltip_scale = 1,
		currencies = {
	  ["觉醒精华"] = true,
	  ["覺醒精華"] = true,
	  ["艾泽里特"] = true,
	  ["战争物资"] = true,
	  ["海员达布隆币"] = true,
	  ["战痕命运印记"] = true,
	  },
		items = {},
		maxItems = 0, -- 0 means un-limited
		--optionsCopied = false,
		currencyFormatConverted = false,
		showLowerDenominations = true,
	},
}

constants.items = {
	world_events = {
		49927, -- Love Token, Love is in the Air
		44791, -- Noblegarden Chocolate
		37829, -- Brewfest Prize Token
		33226, -- Tricky Treat
		23247, -- Burning Blossom, Midsummer Fire Festiva
		21100, -- Coin of Ancestry, Lunar Festiva
	},
	pvp = {
		137642, -- Mark of Honor
		103533, -- Vicious Saddle
		26045, -- HALAA_BATTLE_TOKEN 
		26044, -- HALAA_RESEARCH_TOKEN 
	},
	others = {
		162461, -- Sanguicell
		157796, -- Purified Titan Essence, added in 7.3.5.25807
		151568, -- Primal Sargerite, added in patch 7.3.0.24484
		124124, -- Blood of Sargeras
		124099, -- Blackfang Claw
		120945, -- Primal Spirit
		119819, -- Caged Mighty Clefthoof
		119817, -- Caged Mighty Riverbeast
		119815, -- Caged Mighty Wolf
		119814, -- Leathery Caged Beast
		119813, -- Furry Caged Beast
		119810, -- Meaty Caged Beast
		118100, -- Highmaul Relic
		117397, -- Nats Lucky Coin
		116415, -- Pet Charm
		113578, -- Hearty Soup Bone
		76061, -- Spirit of Harmony
		43089, -- Vrykul Bones
		28558, -- Spirit Shard, currency tokens dropped by bosses in the Auchindoun
	},
	professions = {
		[3908] = { -- Tailoring
			158378, -- Embroidered Deep Sea Satin
			152577, -- Deep Sea Satin
			152576, -- Tidespray Linen
			151567, -- Lightweave Cloth
			146711, -- Bolt of Starweave
			146710, -- Bolt of Shadowcloth
			127681, -- Sharp Spritethorn
			127037, -- Runic Catgut
			127004, -- Imbued Silkweave
			124437, -- Shal'dorei Silk
			111557, -- Sumptuous Fur
			111556, -- Hexweave Cloth
			98619, -- Celestial Cloth
			92960, -- Silkworm Cocoon
			82447, -- Imperial Silk
			82441, -- Bolt of Windwool Cloth
			72988, -- Windwool Cloth
			54440, -- Dreamcloth
			53643, -- Bolt of Embersilk Cloth
			53010, -- Embersilk Cloth
			42253, -- Iceweb Spider Silk
			41595, -- Spellweave
			41594, -- Moonshroud
			41593, -- Ebonweave
			41511, -- Bolt of Imbued Frostweave
			41510, -- Bolt of Frostweave
			38426, -- Eternium Thread
			33470, -- Frostweave Cloth
			24272, -- Shadowcloth
			24271, -- Spellcloth
			21881, -- Netherweb Spider Silk
			21877, -- Netherweave Cloth
			21845, -- Primal Mooncloth
			21844, -- Bolt of Soulcloth
			21842, -- Bolt of Imbued Netherweave
			21840, -- Bolt of Netherweave
			14342, -- Mooncloth
			14341, -- Rune Thread
			14256, -- Felcloth
			14227, -- Ironweb Spider Silk
			14048, -- Bolt of Runecloth
			14047, -- Runecloth
			10285, -- Shadow Silk
			8343, -- Heavy Silken Thread
			4339, -- Bolt of Mageweave
			4338, -- Mageweave Cloth
			4337, -- Thick Spider's Silk
			4306, -- Silk Cloth
			4305, -- Bolt of Silk Cloth
			4291, -- Silken Thread
			3182, -- Spider's Silk
			2997, -- Bolt of Woolen Cloth
			2996, -- Bolt of Linen Cloth
			2592, -- Wool Cloth
			2589, -- Linen Cloth
			2321, -- Fine Thread
			2320, -- Coarse Thread
		},
		[2575] = { -- Mining
			152513, -- Platinum Ore
			152512, -- Monelite Ore
			152579, -- Storm Silver Ore
			151564, -- Empyrium
			124444, -- Infernal Brimstone
			123919, -- Felslate
			123918, -- Leystone Ore
			115508, -- Draenic Stone
			109992, -- Blackrock Fragment
			109991, -- True Iron Nugget
			109119, -- True Iron Ore
			109118, -- Blackrock Ore
			108391, -- Titanium Ore Nugget
			108309, -- Pyrite Ore Nugget
			108308, -- Elementium Ore Nugget
			108307, -- Obsidium Ore Nugget
			108306, -- Saronite Ore Nugget
			108305, -- Cobalt Ore Nugget
			108304, -- Khorium Ore Nugget
			108302, -- Adamantite Ore Nugget
			108301, -- Fel Iron Ore Nugget
			108300, -- Mithril Ore Nugget
			108299, -- Truesilver Ore Nugget
			108298, -- Thorium Ore Nugget
			108297, -- Iron Ore Nugget
			108296, -- Gold Ore Nugget
			108294, -- Silver Ore Nugget
			97546, -- Kyparite Fragment
			97512, -- Ghost Iron Nugget
			72103, -- White Trillium Ore
			72094, -- Black Trillium Ore
			72093, -- Kyparite
			72092, -- Ghost Iron Ore
			53038, -- Obsidium Ore
			52185, -- Elementium Ore
			52183, -- Pyrite Ore
			36912, -- Saronite Ore
			36910, -- Titanium Ore
			36909, -- Cobalt Ore
			23427, -- Eternium Ore
			23426, -- Khorium Ore
			23425, -- Adamantite Ore
			23424, -- Fel Iron Ore
			22203, -- Large Obsidian Shard
			22202, -- Small Obsidian Shard
			12365, -- Dense Stone
			11370, -- Dark Iron Ore
			10620, -- Thorium Ore
			7912, -- Solid Stone
			7911, -- Truesilver Ore
			3858, -- Mithril Ore
			2838, -- Heavy Stone
			2836, -- Coarse Stone
			2835, -- Rough Stone
			2776, -- Gold Ore
			2775, -- Silver Ore
			2772, -- Iron Ore
			2771, -- Tin Ore
			2770, -- Copper Ore
		},
		[2108] = { -- Leatherworking
			152542, -- Hardened Tempest Hide
			153051, -- Mistscale
			154165, -- Calcified Bone
			154722, -- Tempest Hide
			152541, -- Coarse Leather
			153050, -- Shimmerscale
			154164, -- Blood-Stained Bone
			151566, -- Fiendish Leather
			124116, -- Felhide
			124115, -- Stormscale
			124113, -- Stonehide Leather
			112177, -- Nerubian Chitin Fragment
			112158, -- Icy Dragonscale Fragment
			112156, -- Blackened Dragonscale Fragment
			110611, -- Burnished Leather
			110610, -- Raw Beast Hide Scraps
			110609, -- Raw Beast Hide
			79101, -- Prismatic Scale
			72163, -- Magnificent Hide
			72162, -- Sha-Touched Leather
			72120, -- Exotic Leather
			56516, -- Heavy Savage Leather
			38558, -- Nerubian Chitin
			38557, -- Icy Dragonscale
			33568, -- Borean Leather
			33567, -- Borean Leather Scraps
			25649, -- Knothide Leather Scraps
			23793, -- Heavy Knothide Leather
			15416, -- Black Dragonscale
			15414, -- Red Dragonscale
			15412, -- Green Dragonscale
			15408, -- Heavy Scorpid Scale
			8170, -- Rugged Leather
			8169, -- Thick Hide
			8168, -- Jet Black Feather
			8165, -- Worn Dragonscale
			8154, -- Scorpid Scale
			8150, -- Deeprock Salt
			6471, -- Perfect Deviate Scale
			6470, -- Deviate Scale
			5785, -- Thick Murloc Scale
			5784, -- Slimy Murloc Scale
			5116, -- Long Tail Feather
			5082, -- Thin Kodo Leather
			4461, -- Raptor Hide
			4304, -- Thick Leather
			4235, -- Heavy Hide
			4234, -- Heavy Leather
			4232, -- Medium Hide
			2319, -- Medium Leather
			2318, -- Light Leather
			783, -- Light Hide
		},
		[7411] = { -- Enchanting
			152875, -- Gloom Dust
			152876, -- Umbra Shard
			152877, -- Veiled Crystal
			124442, -- Chaos Crystal
			124441, -- Leylight Shard
			124440, -- Arkhana
			111245, -- Luminous Shard
			113588, -- Temporal Crystal
			115504, -- Fractured Temporal Crystal
			115502, -- Small Luminous Shard
			109693, -- Draenic Dust
			105718, -- Sha Crystal Fragment
			102218, -- Spirit of War
			94289, -- Haunting Spirit
			80433, -- Blood Spirit
			74248, -- Sha Crystal
			74247, -- Ethereal Shard
			74250, -- Mysterious Essence
			74252, -- Small Ethereal Shard
			74249, -- Spirit Dust
			52721, -- Heavenly Shard
			52720, -- Small Heavenly Shard
			52722, -- Maelstrom Crystal
			52719, -- Greater Celestial Essence
			52555, -- Hypnotic Dust
			52718, -- Lesser Celestial Essence
			89738, -- Essence or Dust
			34053, -- Small Dream Shard
			34052, -- Dream Shard
			34057, -- Abyss Crystal
			34055, -- Greater Cosmic Essence
			34054, -- Infinite Dust
			22449, -- Large Prismatic Shard
			22450, -- Void Crystal
			34056, -- Lesser Cosmic Essence
			22446, -- Greater Planar Essence
			22448, -- Small Prismatic Shard
			22445, -- Arcane Dust
			20725, -- Nexus Crystal
			22447, -- Lesser Planar Essence
			14344, -- Large Brilliant Shard
			16203, -- Greater Eternal Essence
			16204, -- Illusion Dust
			14343, -- Small Brilliant Shard
			16202, -- Lesser Eternal Essence
			11176, -- Dream Dust
			11178, -- Large Radiant Shard
			11175, -- Greater Nether Essence
			11174, -- Lesser Nether Essence
			11177, -- Small Radiant Shard
			11139, -- Large Glowing Shard
			11137, -- Vision Dust
			11135, -- Greater Mystic Essence
			11134, -- Lesser Mystic Essence
			11138, -- Small Glowing Shard
			11082, -- Greater Astral Essence
			11084, -- Large Glimmering Shard
			11083, -- Soul Dust
			10998, -- Lesser Astral Essence
			10978, -- Small Glimmering Shard
			10939, -- Greater Magic Essence
			10940, -- Strange Dust
			10938, -- Lesser Magic Essence
			6218, -- Runed Copper Rod
			6217, -- Copper Rod
		},
		[2366] = { -- Herbalism
			152505, -- Riverbud
			152506, -- Star Moss
			152507, -- Akunda's Bite
			152508, -- Winter's Kiss
			152509, -- Siren's Pollen
			152510, -- Anchor Weed
			152511, -- Sea Stalk
			151565, -- Astral Glory
			129289, -- Felwort Seed
			129288, -- Starlight Rose Seed
			129287, -- Fjarnskaggl Seed
			129286, -- Foxflower Seed
			129285, -- Dreamleaf Seed
			129284, -- Aethril Seed
			128304, -- Yseralline Seed
			124106, -- Felwort
			124105, -- Starlight Rose
			124104, -- Fjarnskaggl
			124103, -- Foxflower
			124102, -- Dreamleaf
			124101, -- Aethril
			116053, -- Draenic Seeds
			109629, -- Talador Orchid Petal
			109628, -- Nagrand Arrowbloom Petal
			109627, -- Starflower Petal
			109626, -- Gorgrond Flytrap Ichor
			109625, -- Broken Fireweed Stem
			109624, -- Broken Frostweed Stem
			109129, -- Talador Orchid
			109128, -- Nagrand Arrowbloom
			109127, -- Starflower
			109126, -- Gorgrond Flytrap
			109125, -- Fireweed
			109124, -- Frostweed
			108365, -- Whiptail Stem
			108364, -- Twilight Jasmine Petal
			108363, -- Heartblossom Petal
			108362, -- Azshara's Veil Stem
			108361, -- Stormvine Stalk
			108360, -- Cinderbloom Petal
			108359, -- Fire Leaf Bramble
			108358, -- Deadnettle Bramble
			108357, -- Talandra's Rose Petal
			108356, -- Icethorn Bramble
			108355, -- Lichbloom Stalk
			108354, -- Tiger Lily Petal
			108353, -- Adder's Tongue Stem
			108352, -- Goldclover Leaf
			108351, -- Mana Thistle Leaf
			108350, -- Nightmare Vine Stem
			108349, -- Netherbloom Leaf
			108348, -- Ancient Lichen Petal
			108347, -- Terocone Leaf
			108346, -- Ragveil Cap
			108345, -- Dreaming Glory Petal
			108344, -- Felweed Stalk
			108343, -- Icecap Petal
			108342, -- Sorrowmoss Leaf
			108341, -- Mountain Silversage Stalk
			108340, -- Golden Sansam Leaf
			108339, -- Dreamfoil Blade
			108338, -- Gromsblood Leaf
			108337, -- Ghost Mushroom Cap
			108336, -- Blindweed Stem
			108335, -- Sungrass Stalk
			108334, -- Arthas' Tears Petal
			108333, -- Purple Lotus Petal
			108332, -- Firebloom Petal
			108331, -- Goldthorn Bramble
			108330, -- Stranglekelp Blade
			108329, -- Dragon's Teeth Stem
			108328, -- Fadeleaf Petal
			108327, -- Grave Moss Leaf
			108326, -- Khadgar's Whisker Stem
			108325, -- Liferoot Stem
			108324, -- Kingsblood Petal
			108323, -- Wild Steelbloom Petal
			108322, -- Bruiseweed Stem
			108321, -- Swiftthistle Leaf
			108320, -- Briarthorn Bramble
			108319, -- Earthroot Stem
			108318, -- Mageroyal Petal
			97624, -- Desecrated Herb Pod
			97623, -- Fool's Cap Spores
			97622, -- Snow Lily Petal
			97621, -- Silkweed Stem
			97620, -- Rain Poppy Petal
			97619, -- Torn Green Tea Leaf
			79011, -- Fool's Cap
			79010, -- Snow Lily
			72238, -- Golden Lotus
			72237, -- Rain Poppy
			72235, -- Silkweed
			72234, -- Green Tea Leaf
			52988, -- Whiptail
			52987, -- Twilight Jasmine
			52986, -- Heartblossom
			52985, -- Azshara's Veil
			52984, -- Stormvine
			52983, -- Cinderbloom
			39970, -- Fire Leaf
			37921, -- Deadnettle
			36908, -- Frost Lotus
			36907, -- Talandra's Rose
			36906, -- Icethorn
			36905, -- Lichbloom
			36904, -- Tiger Lily
			36903, -- Adder's Tongue
			36902, -- Constrictor Grass
			36901, -- Goldclover
			22797, -- Nightmare Seed
			22794, -- Fel Lotus
			22793, -- Mana Thistle
			22792, -- Nightmare Vine
			22791, -- Netherbloom
			22790, -- Ancient Lichen
			22789, -- Terocone
			22788, -- Flame Cap
			22787, -- Ragveil
			22786, -- Dreaming Glory
			22785, -- Felweed
			22710, -- Bloodthistle
			19727, -- Blood Scythe
			19726, -- Bloodvine
			13468, -- Black Lotus
			13467, -- Icecap
			13466, -- Sorrowmoss
			13465, -- Mountain Silversage
			13464, -- Golden Sansam
			13463, -- Dreamfoil
			8846, -- Gromsblood
			8845, -- Ghost Mushroom
			8839, -- Blindweed
			8838, -- Sungrass
			8836, -- Arthas' Tears
			8831, -- Purple Lotus
			8153, -- Wildvine
			4625, -- Firebloom
			3821, -- Goldthorn
			3820, -- Stranglekelp
			3819, -- Dragon's Teeth
			3818, -- Fadeleaf
			3369, -- Grave Moss
			3358, -- Khadgar's Whisker
			3357, -- Liferoot
			3356, -- Kingsblood
			3355, -- Wild Steelbloom
			2453, -- Bruiseweed
			2452, -- Swiftthistle
			2450, -- Briarthorn
			2449, -- Earthroot
			2447, -- Peacebloom
			785, -- Mageroyal
			765, -- Silverleaf
		},
	},
}

constants.itemCategories = {
	["world_events"] = BATTLE_PET_SOURCE_7,
	["pvp"] = PVP,
	["others"] = MISCELLANEOUS,
	["professions"] = TRADE_SKILLS,
}

constants.events = {
	"PLAYER_REGEN_ENABLED",
	"PLAYER_REGEN_DISABLED",
	"PET_BATTLE_OPENING_START",
	"PET_BATTLE_CLOSE",
	"BATTLEFIELDS_SHOW",
	"BATTLEFIELDS_CLOSED",
	"BAG_UPDATE",
	"TRADE_CURRENCY_CHANGED",
	"ARTIFACT_UPDATE",
	"ARTIFACT_XP_UPDATE",
	"TRADE_PLAYER_ITEM_CHANGED",
	"PLAYER_TRADE_CURRENCY",
	"CHAT_MSG_CURRENCY",
	"SHIPMENT_CRAFTER_REAGENT_UPDATE",
	"CURRENCY_DISPLAY_UPDATE",
	-- Money
	"PLAYER_MONEY",
	"PLAYER_TRADE_MONEY",
	"TRADE_MONEY_CHANGED",
	"SEND_MAIL_MONEY_CHANGED",
	"SEND_MAIL_COD_CHANGED",
	"TRIAL_STATUS_UPDATE",
	"CHAT_MSG_MONEY",
}





-- $Id: Core.lua 139 2018-04-26 08:51:25Z arith $
-----------------------------------------------------------------------
-- Upvalued Lua API.
-----------------------------------------------------------------------
-- Functions
local _G = getfenv(0)
local pairs, ipairs, select, unpack, type = _G.pairs, _G.ipairs, _G.select, _G.unpack, _G.type
local string, tonumber = _G.string, _G.tonumber
-- Libraries
local format, strsub, strlen, strgmatch = string.format, string.sub, string.len, string.gmatch
local floor, fmod = math.floor, math.fmod
-- WoW
local GameTooltip = _G.GameTooltip
local BreakUpLargeNumbers = _G.BreakUpLargeNumbers
local GetCurrencyListSize, GetCurrencyListInfo, GetCurrencyInfo = _G.GetCurrencyListSize, _G.GetCurrencyListInfo, _G.GetCurrencyInfo
local GetItemInfoInstant, GetItemCount, GetItemInfo = _G.GetItemInfoInstant, _G.GetItemCount, _G.GetItemInfo
local GetMoney = _G.GetMoney

-- ----------------------------------------------------------------------------
-- AddOn namespace.
-- ----------------------------------------------------------------------------
local LibStub = _G.LibStub
local LibCurrencyInfo = LibStub:GetLibrary("LibCurrencyInfo")
local AceDB = LibStub("AceDB-3.0")
local LDB_CurrencyTracking = LibStub:GetLibrary("LibDataBroker-1.1"):NewDataObject("CurrencyTracking", {
	type = "data source",
	text = CurrencyTracking_TITLE,
	label = CurrencyTracking_TITLE,
})

local CurrencyTracking = LibStub("AceAddon-3.0"):NewAddon("CurrencyTracking", "AceEvent-3.0")
CurrencyTracking.constants = constants
_G.CurrencyTracking = CurrencyTracking
local profile

-- local booleans, constants, and arrays
local isInLockdown = false		-- boolean to check if player is in combat
local isInBattleGround = false	-- boolean to check if player is in battleground
local CT_ORIG_GAMPTOOLTIP_SCALE = GameTooltip:GetScale()	-- to get the original GameTooltip's scaling value
local CT_CURRSTR = nil
local CURRENCIESLIST = {}		-- initialize currency list array
local numCurrencies = 0			-- initialize the number of currencies

-- codes adopted from Accountant_Classic
local function getFormattedValue(amount)
	if (amount and type(amount) == "number") then 
		local gold = floor(amount / (COPPER_PER_SILVER * SILVER_PER_GOLD))
		local goldDisplay = profile.breakupnumbers and BreakUpLargeNumbers(gold) or gold
		local silver = floor((amount - (gold * COPPER_PER_SILVER * SILVER_PER_GOLD)) / COPPER_PER_SILVER)
		local copper = fmod(amount, COPPER_PER_SILVER)
		
		local TMP_GOLD_AMOUNT_TEXTURE, TMP_SILVER_AMOUNT_TEXTURE, TMP_COPPER_AMOUNT_TEXTURE

		if (profile.icon_first) then
			TMP_GOLD_AMOUNT_TEXTURE 	= "|TInterface\\MoneyFrame\\UI-GoldIcon:%d:%d:2:0|t %s"
			TMP_SILVER_AMOUNT_TEXTURE 	= "|TInterface\\MoneyFrame\\UI-SilverIcon:%d:%d:2:0|t %02d"
			TMP_COPPER_AMOUNT_TEXTURE 	= "|TInterface\\MoneyFrame\\UI-CopperIcon:%d:%d:2:0|t %02d"

			if (profile.showLowerDenominations) then
				if (gold >0) then
					return format("|cffffffff"..TMP_GOLD_AMOUNT_TEXTURE.." "..TMP_SILVER_AMOUNT_TEXTURE.." "..TMP_COPPER_AMOUNT_TEXTURE.."|r", 0, 0, goldDisplay, 0, 0, silver, 0, 0, copper)
				elseif (silver >0) then 
					return format("|cffffffff"..TMP_SILVER_AMOUNT_TEXTURE.." "..TMP_COPPER_AMOUNT_TEXTURE.."|r", 0, 0, silver, 0, 0, copper)
				elseif (copper >0) then
					return format("|cffffffff"..TMP_COPPER_AMOUNT_TEXTURE.."|r", 0, 0, copper)
				else
					return ""
				end
			else
				return format("|cffffffff"..TMP_GOLD_AMOUNT_TEXTURE.."|r", 0, 0, goldDisplay)
			end
		else
			TMP_GOLD_AMOUNT_TEXTURE 	= "%s|TInterface\\MoneyFrame\\UI-GoldIcon:%d:%d:2:0|t"
			TMP_SILVER_AMOUNT_TEXTURE 	= "%02d|TInterface\\MoneyFrame\\UI-SilverIcon:%d:%d:2:0|t"
			TMP_COPPER_AMOUNT_TEXTURE 	= "%02d|TInterface\\MoneyFrame\\UI-CopperIcon:%d:%d:2:0|t"

			if (profile.showLowerDenominations) then
				if (gold >0) then
					return format(" |cffffffff"..TMP_GOLD_AMOUNT_TEXTURE.." "..TMP_SILVER_AMOUNT_TEXTURE.." "..TMP_COPPER_AMOUNT_TEXTURE.."|r", goldDisplay, 0, 0, silver, 0, 0, copper, 0, 0)
				elseif (silver >0) then 
					return format(" |cffffffff"..SILVER_AMOUNT_TEXTURE.." "..TMP_COPPER_AMOUNT_TEXTURE.."|r", silver, 0, 0, copper, 0, 0)
				elseif (copper >0) then
					return format(" |cffffffff"..COPPER_AMOUNT_TEXTURE.."|r", copper, 0, 0)
				else
					return ""
				end
			else
				return format(" |cffffffff"..TMP_GOLD_AMOUNT_TEXTURE.."|r", goldDisplay, 0, 0)
			end
		end
	end
end

-- Codes adopted from TitanPanel
local function addTooltipText(text)
	if ( text ) then
		-- Append a "\n" to the end 
		if ( strsub(text, -1, -1) ~= "\n" ) then
			text = text.."\n"
		end
		
		-- See if the string is intended for a double column
		for text1, text2 in strgmatch(text, "([^\t\n]*)\t?([^\t\n]*)\n") do
			if ( text2 ~= "" ) then
				-- Add as double wide
				GameTooltip:AddDoubleLine(text1, text2)
			elseif ( text1 ~= "" ) then
				-- Add single column line
				GameTooltip:AddLine(text1)
			else
				-- Assume a blank line
				GameTooltip:AddLine("\n")
			end			
		end
	end
end

-- Codes adopted from TitanCurrency and revised by arith
local function getTooltipText()
	local display = ""
	local tooltip = ""
	local cCount
	cCount = GetCurrencyListSize()
	for i = 1, cCount do 
		-- // GetCurrencyListInfo() syntax:
		-- // name, isHeader, isExpanded, isUnused, isWatched, count, icon = GetCurrencyListInfo(index)
		local name, isHeader, isUnused, count, icon, _
		name, isHeader, _, isUnused, _, count, icon = GetCurrencyListInfo(i)
		if ( isHeader ) then
			tooltip = tooltip..name.."\n"
		elseif ( (count >= 0) and not isUnused ) then
			if (icon ~= nil) then
				local icount = profile.breakupnumbers and BreakUpLargeNumbers(count) or count
				if (count == 0) then
					if (not profile.hide_zero) then
						display = " - "..name.."\t|cffff0000"..icount.." |r|T"..icon..":16|t"
					end
				else
					display = " - "..name.."\t|cffffffff"..icount.." |r|T"..icon..":16|t"
				end
			end
			-- trace(display)
			tooltip = strconcat(tooltip, display, "|r\n")
		end
	end 
	return tooltip    
end

local function button_OnMouseDown(self, buttonName)    
	-- Prevent activation when in combat or when lock is set to true
	if (isInLockdown or profile.always_lock) then
		return
	end
	if(CurrencyTracking.frame:IsVisible()) then
		-- Handle left button clicks
		if (buttonName == "LeftButton") then
			-- Hide tooltip while draging
			GameTooltip:Hide()
			CurrencyTracking.frame:StartMoving()
		elseif (buttonName == "RightButton") then
			CurrencyTracking:OpenOptions(self.isItem)
			GameTooltip_Hide()
		end
	end
end

local function button_OnMouseUp(self, buttonName)
	if (isInLockdown or profile.always_lock) then
		return
	end
	if(CurrencyTracking.frame:IsVisible()) then
		CurrencyTracking.frame:StopMovingOrSizing()
		local point, relativeTo, relativePoint, xOfs, yOfs = CurrencyTracking.frame:GetPoint()
		profile.point = { point, relativeTo, relativePoint, xOfs, yOfs }
	end
end

local function button_OnEnter(self)
	if (isInLockdown) then
		return
	end
	
	if(CurrencyTracking.frame:IsVisible()) then
		if (not GameTooltip:IsShown()) then
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT", -10, 0)
			GameTooltip:SetBackdropColor(0, 0, 0, profile.tooltip_alpha)
			GameTooltip:SetText("|cFFFFFFFF"..CurrencyTracking_TITLE, 1, 1, 1, nil, 1)
			local tooltip = getTooltipText()
			if (tooltip) then
				addTooltipText(tooltip)
			end
			GameTooltip:SetScale(profile.tooltip_scale)
			GameTooltip:Show()
		else
			GameTooltip:Hide()
		end
	end
end

local function button_OnLeave(self)
	GameTooltip_Hide()
	GameTooltip:SetScale(CT_ORIG_GAMPTOOLTIP_SCALE)
end

local function handleTrackedButtons(button, currencyID, itemID)
	if not button then return end
	local buttonName = button:GetName()
	local bi = tonumber(strsub(buttonName, strlen("CurrencyTrackingButton")+1))
	local maxItems = profile.maxItems or 0
	local nRow, nRowItem
	local rowHeight = 20
	
	if (maxItems == 0) then 
		nRow = 1
	else
		nRow = ( (bi - (bi % maxItems) ) / maxItems ) + 1
		nRowItem = bi % maxItems
		if nRowItem == 0 then nRowItem = maxItems end
	end
	
	local name, count, icon, _
	local width = 15
	if (currencyID) then 
		name, count, icon = GetCurrencyInfo(currencyID) 
	elseif (itemID) then
		name, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
		count = GetItemCount(itemID, true)
	end

	if (currencyID or itemID) then
		button.icon:SetTexture(icon or 0)
		if (profile.show_iconOnly) then
			button.count:Hide()
		else
			if (count and count == 0) then 
				button.count:SetText("|cffff0000"..count.."|r")
			elseif (count and count > 0) then
				count = profile.breakupnumbers and BreakUpLargeNumbers(count) or count
				button.count:SetText(count)
			else
				button.count:SetText("")
			end
			button.count:Show()
			width = button.count:GetStringWidth() + 10

			if (profile.icon_first) then
				button.icon:SetPoint("LEFT", 0, 0)
				if (not profile.show_iconOnly) then
					button.count:SetPoint("LEFT", button.icon, "RIGHT", 2, 0)
				end
			else
				if (profile.show_iconOnly) then
					button.icon:SetPoint("LEFT", 0, 0)
				else
					button.count:SetPoint("LEFT", 0, 0)
					button.icon:SetPoint("LEFT", button.count, "RIGHT", 2, 0)
				end
			end
		end
	else -- money
		button.icon:SetTexture(nil)
		button.count:SetText(getFormattedValue(GetMoney()))
		width = button.count:GetStringWidth()
	end
	
	button:SetWidth(width)
	if (bi == 1) then
		button:SetPoint("TOPRIGHT", 0, 0)
	else
		if (nRow == 1) then
			button:SetPoint("TOPRIGHT", _G["CurrencyTrackingButton"..bi-1], "TOPLEFT", profile.show_iconOnly and -21 or -12, 0)
		else
			if (nRowItem == 1) then
		button:SetPoint("TOPRIGHT", _G["CurrencyTrackingButton"..bi-maxItems], "TOPLEFT", 0, -rowHeight)
			else
				button:SetPoint("TOPRIGHT", _G["CurrencyTrackingButton"..bi-1], "TOPLEFT", profile.show_iconOnly and -21 or -12, 0)
			end
		end
	end
	button:SetScript("OnMouseDown", button_OnMouseDown)
	button:SetScript("OnMouseUp", button_OnMouseUp)
	if (currencyID and profile.show_tooltip) then
		button:SetScript("OnEnter", button_OnEnter)
	else
		button:SetScript("OnEnter", nil)
	end
	button:SetScript("OnLeave", button_OnLeave)
	button.highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
	button.highlight:SetWidth(width)
	button.highlight:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
	button.highlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
	button.isCurrency = currencyID and true or nil
	button.currencyID = currencyID or nil
	button.isMoney = (not currencyID and not itemID) and true or nil
	button.isItem = itemID and true or nil
	button.itemID = itemID or nil
	button.itemName = itemID and name or nil
	button.LinkButton.tooltipText = currencyID and LibCurrencyInfo:GetCurrencyTokenStrings(currencyID) or nil
	if (currencyID or itemID) then
		button.LinkButton:Show()
	else
		button.LinkButton:Hide()
	end
	button:Show()

end

local function currencyButton_Update()
	local nf = _G["CurrencyTrackingFrame"]
	local button
	local gwidth = 0
	local bi = 1

	-- tracked currencies
	for currencyID, v in pairs(profile["currencies"]) do
		if (currencyID and type(currencyID) == "number" and profile["currencies"][currencyID] == true) then
			local _, count = GetCurrencyInfo(currencyID)

			if (count >= 0) then
				if (profile.hide_zero and count == 0) then
					-- do nothing
				else
					button = _G["CurrencyTrackingButton"..bi]
					if not button then button = CreateFrame("Button", "CurrencyTrackingButton"..bi, nf, "CurrencyTrackingButtonTemplate") end
					handleTrackedButtons(button, currencyID)
					gwidth = gwidth + button:GetWidth()
					bi = bi + 1
				end
			end
		end
	end
	-- tracked items
	for itemID, v in pairs(profile["items"]) do
		if (itemID and profile["items"][itemID] == true) then
			local count = GetItemCount(itemID, true)
			if (profile.hide_zero and count == 0) then
				-- do nothing
			else
				button = _G["CurrencyTrackingButton"..bi]
				if not button then button = CreateFrame("Button", "CurrencyTrackingButton"..bi, nf, "CurrencyTrackingButtonTemplate") end
				handleTrackedButtons(button, nil, itemID)
				gwidth = gwidth + button:GetWidth()
				bi = bi + 1
			end
		end
	end
	-- handle money
	if (profile.show_money) then
		button = _G["CurrencyTrackingButton"..bi]
		if not button then button = CreateFrame("Button", "CurrencyTrackingButton"..bi, nf, "CurrencyTrackingButtonTemplate") end
		handleTrackedButtons(button)
		gwidth = gwidth + button:GetWidth()
		bi = bi + 1
	end

	nf:SetWidth(gwidth)

	button = _G["CurrencyTrackingButton"..bi]
	while button do
		button.icon:SetTexture(nil)
		button.count:SetText(nil)
		if (profile.show_iconOnly) then
			button.count:Hide()
		else
			button.count:Show()
		end
		button:SetWidth(0)
		button.isCurrency = nil
		button.isMoney = nil
		button.isItem = nil
		button.itemID = nil
		button.currencyID = nil
		button.itemName = nil
		button.LinkButton.tooltipText = nil
		button.LinkButton:Hide()
		button:Hide()
		bi = bi + 1
		button = _G["CurrencyTrackingButton"..bi]
	end
end

local function currencyString_Update()
	local currencystr = ""

	local CT_CURRENCY_TEXTURE

	-- tracked currencies
	for currencyID, v in pairs(profile["currencies"]) do
		if (currencyID and type(currencyID) == "number" and profile["currencies"][currencyID] == true) then
			local _, count, icon = GetCurrencyInfo(currencyID)
			if not icon then icon = 0 end -- somehow Legionfall War Supplies' icon is not available in 7.2.5.23959, this should temporary resolve the blocking issue
			
			if (count >= 0) then
				if (profile.hide_zero and count == 0) then
					-- do nothing
				else
					if (count == 0) then 
						if (profile.icon_first) then
							CT_CURRENCY_TEXTURE = "|T"..icon..":%d:%d:2:0|t "..RED_FONT_COLOR_CODE.."%s "..FONT_COLOR_CODE_CLOSE
						else
							CT_CURRENCY_TEXTURE = RED_FONT_COLOR_CODE.." %s"..FONT_COLOR_CODE_CLOSE.."|T"..icon..":%d:%d:2:0|t "
						end
					else
						if (profile.icon_first) then
							CT_CURRENCY_TEXTURE = "|T"..icon..":%d:%d:2:0|t "..HIGHLIGHT_FONT_COLOR_CODE.."%s "..FONT_COLOR_CODE_CLOSE
						else
							CT_CURRENCY_TEXTURE = HIGHLIGHT_FONT_COLOR_CODE.." %s"..FONT_COLOR_CODE_CLOSE.."|T"..icon..":%d:%d:2:0|t "
						end
					end
					count = profile.breakupnumbers and BreakUpLargeNumbers(count) or count
					if (profile.icon_first) then
						currencystr = currencystr..format(CT_CURRENCY_TEXTURE, 0, 0, count)
					else
						currencystr = currencystr..format(CT_CURRENCY_TEXTURE, count, 0, 0)
					end
				end
			end
		end
	end
	-- tracked items
	for itemID, v in pairs(profile["items"]) do
		if (itemID and profile["items"][itemID] == true) then
			local count = GetItemCount(itemID, true)
			local icon = select(10, GetItemInfo(itemID))

			if (profile.hide_zero and count == 0) then
				-- do nothing
			else
				local displayString
				if (profile.icon_first) then
					displayString = format("|T%d:%d:%d:2:0|t |cffffffff%d|r", icon, 16, 16, count)
				else
					displayString = format("|cffffffff%d|r|T%d:%d:%d:2:0|t ", count, icon, 16, 16)
				end
				
				currencystr = currencystr..displayString
			end
		end
	end
	-- return could be nil if no any currency being tracked
	return currencystr
end

local function getButtonText()
	local currencystr = currencyString_Update()

	if (currencystr) then 
		if (profile.show_money) then
			currencystr = currencystr..getFormattedValue(GetMoney())
		end
	else
		if (profile.show_money) then
			currencystr = getFormattedValue(GetMoney())
		else
			currencystr = CurrencyTracking_TITLE
		end
	end
	
	return currencystr
end

local function currencyUpdate()
	if (profile.show_currency) then currencyButton_Update() end

	local currencystr = getButtonText()
	if (currencystr ~= CT_CURRSTR) then
		LDB_CurrencyTracking.text = currencystr
		CT_CURRSTR = currencystr
	end
end

local function frame_OnUpdate(self)
	--currencyUpdate()
end

local function createCurrencyFrame()
	local f = CreateFrame("Frame")
	--f:SetScript("OnUpdate", frame_OnUpdate)
	
	local nf = _G["CurrencyTrackingFrame"]
	if not nf then nf = CreateFrame("Frame", "CurrencyTrackingFrame") end
	nf:SetParent("UIParent")
	nf:SetWidth(200)
	nf:SetHeight(20)
	nf.Texture = nf:CreateTexture(nil, "BACKGROUND")
	local point, relativeTo, relativePoint, ofsx, ofsy = unpack(profile.point)
	nf:SetPoint(point or "BOTTOMRIGHT", "UIParent", relativePoint or "BOTTOMRIGHT", ofsx or 0, ofsy or 0)
	--nf:SetClampedToScreen(true)
	nf:SetMovable(true)
	nf:EnableMouse(true)
	--nf:SetScript("OnUpdate", frame_OnUpdate)
	return nf
end

local function scanItems()
	for k, v in pairs(CurrencyTracking.constants.items) do
		if k == "professions" then
			for ka, profs in pairs(v) do
				for kb, itemID in ipairs(profs) do
					local name, icon, _
					name, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
				end
			end
		else
			for ka, itemID in ipairs(v) do
				local name, icon, _
				name, _, _, _, _, _, _, _, _, icon = GetItemInfo(itemID)
			end
		end
	end
end

local function setupLDB()
	-- LDB object setting up
	LDB_CurrencyTracking.icon = "Interface\\Icons\\timelesscoin"
	LDB_CurrencyTracking.OnClick = (function(self, button)
		if button == "LeftButton" then
			CurrencyTracking:OpenOptions()
		elseif button == "RightButton" then
		end
	end)

	LDB_CurrencyTracking.OnTooltipShow = (function(tooltip)
		if not tooltip or not tooltip.AddLine then return end
		local tooltiptxt = getTooltipText()
		GameTooltip:SetBackdropColor(0, 0, 0, profile.tooltip_alpha)
		GameTooltip:SetText(CurrencyTracking_TITLE, 1, 1, 1, nil, 1)
		if (tooltiptxt) then
			addTooltipText(tooltiptxt)
		end
		GameTooltip:SetScale(profile.tooltip_scale)
	end)
	
	LDB_CurrencyTracking.text = getButtonText()
end

local function frameRefresh()
	if( profile.show_currency == true) then
		CurrencyTracking.frame:Show()
		CurrencyTracking.frame:SetAlpha(profile.alpha)
		--CurrencyTracking.frame.Texture:SetColorTexture(0, 0, 0, profile.bgalpha)
		CurrencyTracking.frame:SetScale(profile.scale)
		--CurrencyTracking.frame:SetBackdropBorderColor(0, 1.0, 0, 1)
		--CurrencyTracking.frame:SetBackdropColor(0, 0, 1.0, 1)
		local bi = 1
		local button
		button = _G["CurrencyTrackingButton"..bi]
		while button and button:IsVisible() and button.icon:GetTexture() do
			if (profile.icon_first) then
				button.icon:SetPoint("LEFT", 0, 0)
				if (not profile.show_iconOnly) then
					button.count:SetPoint("LEFT", button.icon, "RIGHT", 2, 0)
				end
			else
				if (profile.show_iconOnly) then
					button.icon:SetPoint("LEFT", 0, 0)
				else
					button.count:SetPoint("LEFT", 0, 0)
					button.icon:SetPoint("LEFT", button.count, "RIGHT", 2, 0)
				end
			end
			bi = bi + 1
			button = _G["CurrencyTrackingButton"..bi]
		end
	else
		CurrencyTracking.frame:Hide()
	end
end

local function getNumberOfCurrencies()
	local n = 0
	for k,v in pairs(LibCurrencyInfo.data.CurrencyByCategory) do
		n = n + 1 + #v
	end
	
	return n
end

local function populateCurrencyList()
	if not CURRENCIESLIST then CURRENCIESLIST = {} end

	local i = 1
	local lang = GetLocale()
	for k,v in pairs(LibCurrencyInfo.data.CurrencyByCategory) do
		CURRENCIESLIST[i] = { isHeader = true, headerKey = k }
		i = i + 1
		for ka,id in ipairs(v) do
			CURRENCIESLIST[i] = { id = id }
			i = i + 1
		end
	end
end

-- temp function to convert the tracked currencies from recorded name to recorded the currency ID
local function convertTrackedCurrencies()
	if (profile.currencyFormatConverted) then
		return
	end
	for k, v in pairs(LibCurrencyInfo.data.Currencies) do
		local name = LibCurrencyInfo:GetCurrencyByID(k)
		
		if (profile["currencies"][name]) then
			profile["currencies"][k] = profile["currencies"][name]
			profile["currencies"][name] = nil
		end
	end
	
	-- further cleaning up
	for k, v in pairs(profile["currencies"]) do
		if (type(k) ~= "number") then
			profile["currencies"][k] = nil
		end
	end
	profile.currencyFormatConverted = true
end

function CurrencyTracking:OnInitialize()
	self.db = AceDB:New("CurrencyTrackingDB", CurrencyTracking.constants.defaults)
	profile = self.db.profile

	self.db.RegisterCallback(self, "OnProfileChanged", "Refresh")
	self.db.RegisterCallback(self, "OnProfileCopied", "Refresh")
	self.db.RegisterCallback(self, "OnProfileReset", "Refresh")

	--copyOptions()
	convertTrackedCurrencies()
	self:SetupOptions()
	self.frame = createCurrencyFrame()
	numCurrencies = getNumberOfCurrencies()
	populateCurrencyList()
end

function CurrencyTracking:OnEnable()
	for key, value in pairs( CurrencyTracking.constants.events ) do
		self:RegisterEvent( value )
	end

	setupLDB()
	scanItems() -- pre-scan items so that they will properly showed in option panel
	currencyUpdate()
	self:Refresh()
end

function CurrencyTracking:Refresh()
	profile = self.db.profile
	currencyUpdate()
	frameRefresh()
end

-- ///////////////////////////////////////////////////
-- Event handling
-- ///////////////////////////////////////////////////
local function hideFrame(key)
	if (profile.show_currency and profile[key]) then
		local nf = _G["CurrencyTrackingFrame"]
		nf:Hide()
	end
end

-- ///////////////////////////////////////////////////
-- Combat
-- Event fired whenever you enter combat
function CurrencyTracking:PLAYER_REGEN_DISABLED()
	isInLockdown = true
	hideFrame("hide_in_combat")
end

-- Event fired after ending combat
function CurrencyTracking:PLAYER_REGEN_ENABLED()
	isInLockdown = false
	
	local nf = _G["CurrencyTrackingFrame"]
	if (profile.show_currency and not nf:IsShown()) then
		if (isInBattleGround and profile.hide_in_battleground) then
			-- if player is in battleground and also set to auto-hide frame untile leave battle ground, 
			-- then we should not show the frame after player ending combat, so do nothing here!
		else
			nf:Show()
		end
	end
end

-- ///////////////////////////////////////////////////
-- Battleground
-- Event fired when the battlegrounds signup window is opened.
function CurrencyTracking:BATTLEFIELDS_SHOW()
	isInBattleGround = true
	hideFrame("hide_in_battleground")
end

-- Event fired when the battlegrounds signup window is closed.
function CurrencyTracking:BATTLEFIELDS_CLOSED()
	isInBattleGround = false
	
	local nf = _G["CurrencyTrackingFrame"]
	if (profile.show_currency and not nf:IsShown()) then
		nf:Show()
	end
end

-- ///////////////////////////////////////////////////
-- Pet battle
function CurrencyTracking:PET_BATTLE_OPENING_START()
	hideFrame("hide_in_petbattle")
end

function CurrencyTracking:PET_BATTLE_CLOSE()
	local nf = _G["CurrencyTrackingFrame"]
	if (profile.show_currency and not nf:IsShown()) then
		if (isInBattleGround and profile.hide_in_battleground) then
			-- if player is in battleground and also set to auto-hide frame untile leave battle ground, 
			-- then we should not show the frame right after pet battle ends, so do nothing here!
		else
			nf:Show()
		end
	end
end

-- Fired when a bags inventory changes.
function CurrencyTracking:BAG_UPDATE()
	currencyUpdate()
end

function CurrencyTracking:TRADE_CURRENCY_CHANGED()
	currencyUpdate()
end

-- This event fires whenever the data for an artifact has been updated, such as after completing a new one. 
function CurrencyTracking:ARTIFACT_UPDATE()
	currencyUpdate()
end

-- Event fired when gaining artifact power for the current equipped artifact weapon.
function CurrencyTracking:ARTIFACT_XP_UPDATE()
	currencyUpdate()
end

-- Fired when an item in the target's trade window is changed (items added or removed from trade).
function CurrencyTracking:TRADE_PLAYER_ITEM_CHANGED()
	currencyUpdate()
end

function CurrencyTracking:PLAYER_TRADE_CURRENCY()
	currencyUpdate()
end

-- Fires when you gain currency other than money (for example Chef's Awards or Champion's Seals). 
function CurrencyTracking:CHAT_MSG_CURRENCY()
	currencyUpdate()
end

function CurrencyTracking:SHIPMENT_CRAFTER_REAGENT_UPDATE()
	currencyUpdate()
end

-- Fired every time the UI need to draw the currencies list. 
function CurrencyTracking:CURRENCY_DISPLAY_UPDATE()
	currencyUpdate()
end

function CurrencyTracking:PLAYER_MONEY()
	currencyUpdate()
end
function CurrencyTracking:PLAYER_TRADE_MONEY()
	currencyUpdate()
end
function CurrencyTracking:TRADE_MONEY_CHANGED()
	currencyUpdate()
end
function CurrencyTracking:SEND_MAIL_MONEY_CHANGED()
	currencyUpdate()
end
function CurrencyTracking:SEND_MAIL_COD_CHANGED()
	currencyUpdate()
end
function CurrencyTracking:TRIAL_STATUS_UPDATE()
	currencyUpdate()
end
function CurrencyTracking:CHAT_MSG_MONEY()
	currencyUpdate()
end
