 -- Author: Nerino1
-- Create Date : 1/8/2021
<<<<<<< Updated upstream
-- Version 5.4
=======
-- Version 4.1
>>>>>>> Stashed changes

local _, L = ...;
SoulbindCacheOpener = {};

SoulbindCacheOpener.items = {
--Darkmoon Faire
	{ 	["name"] = "SoulbindCacheOpener_RideTicketBook", --"Ride Ticket Book"
		["id"] = 92788,
		["button"] = nil
	},
--Kyrian
	-- SoulBind
	{ 	["name"] = "SoulbindCacheOpener_CleansingRiteMaterials", --"Cleansing Rite Materials"
		["id"] = 183701,
		["button"] = nil
	},
	-- Calling
	{ 	["name"] = "SoulbindCacheOpener_tributeoftheascended", --Tribute of the Ascended"
		["id"] = 181372,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_tributeoftheparagon", --Tribute of the Paragon"
		["id"] = 181741,
		["button"] = nil
	},
	-- Paragon
	{ 	["name"] = "SoulbindCacheOpener_AscendedSupplies", --Ascended Supplies"
		["id"] = 180647,
		["button"] = nil
	},
	
-- Night Fae
	-- SoulBind
	{	 ["name"] = "SoulbindCacheOpener_NaturesSplendor", --"Nature's Splendor"
		["id"] = 183702,
		["button"] = nil
    },
	-- Calling
	{ 	["name"] = "SoulbindCacheOpener_bountyofthegrovewardens", --Bounty of the Grove Wardens"
		["id"] = 181475,
		["button"] = nil
	},
	{	 ["name"] = "SoulbindCacheOpener_tributeofthewildhunt", --Tribute of the Wild Hunt"
		["id"] = 181476,
		["button"] = nil
	},
	-- Paragon
	{ 	["name"] = "SoulbindCacheOpener_WildHuntSupplies", --Wild Hunt Supplies"
		["id"] = 180649,
		["button"] = nil
	},

-- Necrolord
	-- SoulBind
	{ 	["name"] = "SoulbindCacheOpener_BonesmithsSatchel", --"Bonesmith's Satchel"
		["id"] = 183703,
		["button"] = nil
    },
	-- Calling
	{	["name"] = "SoulbindCacheOpener_tributeoftheambitious", --Tribute of the Ambitious"
		["id"] = 181732,
		["button"] = nil
	},
	{	 ["name"] = "SoulbindCacheOpener_tributeofthedutybound", --Tribute of the Duty Bound"
		["id"] = 181733,
		["button"] = nil
	},
	-- Paragon
	{ 	["name"] = "SoulbindCacheOpener_SuppliesoftheUndyingArmy", --Supplies of the Undying Army"
		["id"] = 180646,
		["button"] = nil
	},
	-- Abomination
	{ 	["name"] = "SoulbindCacheOpener_SalvagedSupplies", --Salvaged Supplies"
		["id"] = 184843,
		["button"] = nil
	},

-- Venthyr
	-- SoulBind
	{ 	["name"] = "SoulbindCacheOpener_ExquisiteIngredients", --"Exquisite Ingredients"
		["id"] = 183699,
		["button"] = nil
    },
	-- Calling
	{ 	["name"] = "SoulbindCacheOpener_tributeofthecourt", --Tribute of the Court"
		["id"] = 181556,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_favorofthecourt", --Favor of the Court"
		["id"] = 181557,
		["button"] = nil
	},
	-- Paragon
	{ 	["name"] = "SoulbindCacheOpener_CourtofHarvestersSupplies", --Court of Harvesters Supplies"
		["id"] = 180648,
		["button"] = nil
	},

-- Command Table	
    { 	["name"] = "SoulbindCacheOpener_AdventurersMiningCache", --"Adventurer's Mining Cache"
		["id"] = 184635,
		["button"] = nil
    },
	{	["name"] = "ExtraGoodies_champions-mining-cache", --Champions Mining Cache"
		["id"] = 184641,
		["button"] = nil
	},
	{	["name"] = "ExtraGoodies_heros-mining-cache", --Heros Mining Cache"
		["id"] = 184646,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_AdventurersTailoringCache", --"Adventurer's Tailoring Cache"
		["id"] = 184630,
		["button"] = nil
    },
	{ 	["name"] = "ExtraGoodies_champions-tailoring-cache", --Champions Tailoring Cache"
		["id"] = 184639,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_heros-tailoring-cache", --Heros Tailoring Cache"
		["id"] = 184644,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_AdventurersEnchantingCache", --"Adventurer's Enchanting Cache"
		["id"] = 184631,
		["button"] = nil
    },
	{	["name"] = "ExtraGoodies_champions-enchanting-cache", --Champions Enchanting Cache"
		["id"] = 184643,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_heros-enchanting-cache", --Heros Enchanting Cache"
		["id"] = 184648,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_AdventurersHerbalismCache", --"Adventurer's Herbalism Cache"
		["id"] = 184634,
		["button"] = nil
    },
	{ 	["name"] = "ExtraGoodies_heros-herbalism-cache", --Heros Herbalism Cache"
		["id"] = 184647,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_champions-herbalism-cache", --Champions Herbalism Cache"
		["id"] = 184642,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_AdventurersSkinningCache", --"Adventurer's Skinning Cache"
		["id"] = 184636,
		["button"] = nil
    },
	{ 	["name"] = "ExtraGoodies_champions-skinning-cache", --Champions Skinning Cache"
		["id"] = 184640,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_heros-skinning-cache", --Heros Skinning Cache"
		["id"] = 184645,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_ChampionsFishCache", --"Champion's Fish Cache"
		["id"] = 184632,
		["button"] = nil
    },
	{ 	["name"] = "ExtraGoodies_heros-fish-cache", --Heros Fish Cache"
		["id"] = 184638,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_ChampionsMeatCache", --"Champion's Meat Cache"
		["id"] = 184633,
		["button"] = nil
    },
	{ 	["name"] = "ExtraGoodies_heros-meat-cache", --Heros Meat Cache"
		["id"] = 184637,
		["button"] = nil
	},

-- Queen's Conservatory
	{	["name"] = "SoulbindCacheOpener_novicessatchel", --Novices Satchel"
		["id"] = 180974,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_noviceslargesatchel", --Novices Large Satchel"
		["id"] = 180981,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_novicesstuffedsatchel", --Novices Stuffed Satchel"
		["id"] = 180985,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_novicesoverflowingsatchel", --Novices Overflowing Satchel"
		["id"] = 180989,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_journeymanssatchel", --Journeymans Satchel"
		["id"] = 180975,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_journeymanslargesatchel", --Journeymans Large Satchel"
		["id"] = 180980,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_journeymansstuffedsatchel", --Journeymans Stuffed Satchel"
		["id"] = 180984,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_journeymansoverflowingsatchel", --Journeymans Overflowing Satchel"
		["id"] = 180988,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_artisanssatchel", --Artisans Satchel"
		["id"] = 180976,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_artisanslargesatchel", --Artisans Large Satchel"
		["id"] = 180979,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_artisansstuffedsatchel", --Artisans Stuffed Satchel"
		["id"] = 180983,
		["button"] = nil
	},
	{ 	["name"] = "SoulbindCacheOpener_spirittenderssatchel", --Spirit Tenders Satchel"
		["id"] = 180977,
		["button"] = nil
	},
-- The Maw
	{	["name"] = "SoulbindCacheOpener_FallenAdventurersCache", --Fallen Adventurer's Cache"
		["id"] = 184395,
		["button"] = nil
	},
-- Torghast
	{	["name"] = "SoulbindCacheOpener_BloodedSatchel", --Blooded Satchel"
		["id"] = 171209,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_SatchelofNaturesBounty", --Satchel of Nature's Bounty"
		["id"] = 171210,
		["button"] = nil
	},
	{	["name"] = "SoulbindCacheOpener_VenthyrsCoinPurse", --Venthyr's Coin Purse"
		["id"] = 171211,
		["button"] = nil
	},
-- Revendreth
	{	["name"] = "SoulbindCacheOpener_PouchofShinies", --Pouch of Shinies"
		["id"] = 178128,
		["button"] = nil
	},
-- Blingtron
	{	["name"] = "ExtraGoodies_blingtron-4000-gift-package", --Blingtron 4000 Gift Package"
		["id"] = 86623,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_blingtron-5000-gift-package", --Blingtron 5000 Gift Package"
		["id"] = 113258,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_blingtron-6000-gift-package", --Blingtron 6000 Gift Package"
		["id"] = 132892,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_blingtron-7000-gift-package", --Blingtron 7000 Gift Package"
		["id"] = 168740,
		["button"] = nil
	},
-- Timewalking Cata?
	{ 	["name"] = "ExtraGoodies_cacheofnathriantreasures", --Cache of Nathrian Treasures - ilvl 200"
		["id"] = 184869,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_cacheofnathriantreasures", --Cache of Nathrian Treasures - ilvl 213"
		["id"] = 184868,
		["button"] = nil
	},
-- LFG Call to Arms
	{ 	["name"] = "ExtraGoodies_veiledsatchelofcooperation", --Veiled Satchel of Cooperation"
		["id"] = 184522,
		["button"] = nil
<<<<<<< Updated upstream
	},
	
-- Noblegarden
	{ 	["name"] = "ExtraGoodies_brightlycoloredegg", --Brightly Colored Egg"
		["id"] = 45072,
		["button"] = nil
	},
	
-- Added by Z	
	{	["name"] = "ExtraGoodies_GreaterDarkmoonPetSupplies", --Greater Darkmoon Pet Supplies"
		["id"] = 116062,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_TravelersPetSupplies", --Traveler's Pet Supplies"
		["id"] = 122535,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_BigBagofPetSupplies", --Big Bag of Pet Supplies"
		["id"] = 118697,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_DarkmoonPetSupplies", --Darkmoon Pet Supplies"
		["id"] = 91086,
		["button"] = nil
	},	

-- 9.1 Korthia
	{ 	["name"] = "ExtraGoodies_tormentorscache", --Tormentor's Cache"
		["id"] = 185972,
		["button"] = nil
	},	
	
	{ 	["name"] = "ExtraGoodies_AbandonedBrokerSatchel", --Abandoned Broker Satchel"
		["id"] = 187354,
		["button"] = nil
	},
-- Assault Rewards	
	{ 	["name"] = "ExtraGoodies_WarChestoftheUndyingArmy", --War Chest of the Undying Army"
		["id"] = 185992,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_WarChestoftheWildHunt", --War Chest of the Wild Hunt"
		["id"] = 185991,
		["button"] = nil
=======
>>>>>>> Stashed changes
	}
	,
	{ 	["name"] = "ExtraGoodies_AscendedWarChest", --Ascended War Chest"
		["id"] = 185993,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_HarvestersWarChest", --Harvester's War Chest"
		["id"] = 185990,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_DeathsAdvanceWarChest", --Death's Advance War Chest"
		["id"] = 186196,
		["button"] = nil
	},
	{ 	["name"] = "ExtraGoodies_DeathsAdvanceWarChest2", --Death's Advance War Chest 2"
		["id"] = 187543,
		["button"] = nil
	},
-- Added by modrogon
	{ 	["name"] = "ExtraGoodies_FeatherStuffedHelm", --Feather-Stuffed Helm"
		["id"] = 187440,
		["button"] = nil
	},

	{ 	["name"] = "ExtraGoodies_DivinersRuneChit", --Diviner's Rune Chit"
		["id"] = 185963,
		["button"] = nil
	},
	
--	{ 	["name"] = "ExtraGoodies_Korthian Armaments", --Korthian Armaments"
--		["id"] = 187187,
--		["button"] = nil
--	}

	{ 	["name"] = "ExtraGoodies_TalonPiercedMawswornLockbox", --Talon-Pierced Mawsworn Lockbox"
		["id"] = 187278,
		["button"] = nil
	},
	
--Korthia Cache

	{ 	["name"] = "ExtraGoodies_KorthianMeatCache", --Korthian Meat Cache"
		["id"] = 187577,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_KorthianSkinningCache", --Korthian Skinning Cache"
		["id"] = 187576,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_KorthianFishingCache", --Korthian Fishing Cache"
		["id"] = 187575,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_MysteriousGiftfromVenari", --Mysterious Gift from Ve'nari"
		["id"] = 187029,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_FeedersHandandKey", --Feeder's Hand and Key"
		["id"] = 186970,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_CacheofSanctumTreasures226", --Cache of Sanctum Treasures - 226"
		["id"] = 186531,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_CacheofSanctumTreasures239", --Cache of Sanctum Treasures - 239"
		["id"] = 186533,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_CacheofSanctumTreasures239", --Brokers' Overflowing Bucket"
		["id"] = 187574,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_BrokersEnchantingMoteofPotentiation", --Brokers' Enchanting Mote of Potentiation"
		["id"] = 187573,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_BrokersHerbalismMoteofPotentiation", --Brokers' Herbalism Mote of Potentiation"
		["id"] = 187572,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_BrokersTailoringMoteofPotentiation", --Brokers' Tailoring Mote of Potentiation"
		["id"] = 187569,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_BrokersSkinningMoteofPotentiation", --Brokers' Skinning Mote of Potentiation"
		["id"] = 187570,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_BrokersMiningMoteofPotentiation", --Brokers' Mining Mote of Potentiation"
		["id"] = 187571,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_LostMemento", --Lost Memento"
		["id"] = 187346,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledBoot", --Gold Filled Boot"
		["id"] = 186680,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledCrate", --Gold Filled Crate"
		["id"] = 186707,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_SmallKorthianSupplyChest", --Small Korthian Supply Chest"
		["id"] = 187551,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_DeathsAdvanceSupplies", --Death's Advance Supplies"
		["id"] = 186650,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledHat", --Gold Filled Hat"
		["id"] = 186706,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledWashBucket", --Gold Filled Wash Bucket"
		["id"] = 186688,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledPaintBrushCup", --Gold Filled Paint Brush Cup"
		["id"] = 186708,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledChalice", --Gold Filled Chalice"
		["id"] = 186705,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledSatchel", --Gold Filled Satchel"
		["id"] = 186691,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledBarrel", --Gold Filled Barrel"
		["id"] = 186690,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledHelmet", --Gold Filled Helmet"
		["id"] = 186692,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_GoldFilledWheelbarrow", --Gold Filled Wheelbarrow"
		["id"] = 186693,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_SuppliesoftheArchivistsCodex", --Supplies of the Archivists' Codex"
		["id"] = 187028,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_StygicCluster", --Stygic Cluster"
		["id"] = 187351,
		["button"] = nil
	},	
	

-- Brewfest

	{ 	["name"] = "ExtraGoodies_KegShapedTreasureChest", --Keg-Shaped Treasure Chest"
		["id"] = 117393,
		["button"] = nil
	},

--Hallows end

	{ 	["name"] = "ExtraGoodies_LootStuffedPumpkin", --Loot-Stuffed Pumpkin"
		["id"] = 149574,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_LootFilledPumpkinRare", --Loot-Filled Pumpkin (Rare)"
		["id"] = 54516,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_LootFilledPumpkinEpic", --Loot-Filled Pumpkin (Epic)"
		["id"] = 117392,
		["button"] = nil
	},
	
	{ 	["name"] = "ExtraGoodies_HandfulofTreats", --Handful of Treats"
		["id"] = 37586,
		["button"] = nil
	}

};

function SoulbindCacheOpener:updateButtons()
	self.previous = 0;
	local freeSpace = 0;
	for bag = 0, NUM_BAG_SLOTS do
		numberOfFreeSlots, BagType = GetContainerNumFreeSlots(bag);
		freeSpace = freeSpace + numberOfFreeSlots;
	end
	for i = 1, #self.items do
		self:updateButton(self.items[i].button,self.items[i].id,i,freeSpace);
	end
end

function SoulbindCacheOpener:updateButton(btn,id,num,freeSpace)
	local count = GetItemCount(id);
	if count > 0 then
		btn:ClearAllPoints();
		if SoulbindCacheOpenerDB.alignment == "LEFT" then
			if self.previous == 0 then
				btn:SetPoint("LEFT", self.frame, "LEFT", 0, 0);
			else
				btn:SetPoint("LEFT", self.items[self.previous].button, "RIGHT", 2, 0);
			end
		else
			if self.previous == 0 then
				btn:SetPoint("RIGHT", self.frame, "RIGHT", 0, 0);
			else
				btn:SetPoint("RIGHT", self.items[self.previous].button, "LEFT", -2, 0);
			end
		end
		if self.previous == 0 and SoulbindCacheOpenerDB.freeSpace then
			btn.freeSpaceFont:SetText("Free:"..freeSpace);
			btn.freeSpace:Show();
		else
			btn.freeSpaceFont:SetText("");
			btn.freeSpace:Hide();
		end
		self.previous = num;
		btn.countString:SetText(format("%d",count));
		btn.texture:SetDesaturated(false);
		btn:Show();
	elseif count == 0 then
		btn.countString:SetText("");
		btn.freeSpaceFont:SetText("");
		btn.freeSpace:Hide();
		btn.texture:SetDesaturated(true);
		btn:Hide();
	end
end

function SoulbindCacheOpener:createButton(btn,id)
	btn:Hide();
	btn:SetWidth(38);
	btn:SetHeight(38);
	btn:ClearAllPoints();
	btn:SetClampedToScreen(true);
	--Right click to drag
	btn:EnableMouse(true);
	btn:RegisterForDrag("RightButton");
	btn:SetMovable(true);
	btn:SetScript("OnDragStart", function(self) self:GetParent():StartMoving(); end);
	btn:SetScript("OnDragStop", function(self) 
			self:GetParent():StopMovingOrSizing();
			self:GetParent():SetUserPlaced(false);
			local point, relativeTo, relativePoint, xOfs, yOfs = self:GetParent():GetPoint();
			SoulbindCacheOpenerDB.position = {point, nil, relativePoint, xOfs, yOfs};
		end);
	--Setup macro
	btn:SetAttribute("type", "macro");
	btn:SetAttribute("macrotext", format("/use item:%d",id));
	btn.countString = btn:CreateFontString(btn:GetName().."Count", "OVERLAY", "NumberFontNormal");
	btn.countString:SetPoint("BOTTOMRIGHT", btn, -3, 2);
	btn.countString:SetJustifyH("RIGHT");
	btn.freeSpace = CreateFrame("Frame", btn:GetName().."FreeSpace", btn);
	btn.freeSpace:SetFrameStrata("BACKGROUND");
	btn.freeSpace:SetWidth(35);
	btn.freeSpace:SetHeight(10);
	btn.freeSpace.t = btn.freeSpace:CreateTexture(nil, "BACKGROUND");
	btn.freeSpace.t:SetTexture(0,0,0,.8);
	btn.freeSpace.t:SetAllPoints(true);
	btn.freeSpace.texture = btn.freeSpace.t;
	btn.freeSpace:SetPoint("TOPLEFT", btn, 1.5, -1);
	btn.freeSpaceFont = btn.freeSpace:CreateFontString(btn.freeSpace:GetName().."Font", "OVERLAY", "SystemFont_Tiny");
	btn.freeSpaceFont:SetPoint("CENTER", btn.freeSpace, 0, 0);
	btn.freeSpaceFont:SetJustifyH("LEFT");
	btn.icon = btn:CreateTexture(nil,"BACKGROUND");
	btn.icon:SetTexture(GetItemIcon(id));
	btn.icon:SetAllPoints(true);
	btn.texture = btn.icon;
	btn.texture:SetPoint("TOPLEFT", btn, -2, 1);
	
	--Tooltip
	btn:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self,"ANCHOR_TOP");
		GameTooltip:SetItemByID(format("%d",id));
		GameTooltip:SetClampedToScreen(true);
		GameTooltip:Show();
	  end);
	btn:SetScript("OnLeave",GameTooltip_Hide);
 end

function SoulbindCacheOpener:reset()
	SoulbindCacheOpenerDB = {["enable"] = true,["alignment"] = "LEFT",["freeSpace"] = false};
	self.frame:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	self:OnEvent("UPDATE");
end

function SoulbindCacheOpener:AddButton()
	self.frame:Show();
	SoulbindCacheOpener:updateButtons();
end

function SoulbindCacheOpener:OnEvent(event, ...)
	
	if event == "PLAYER_LOGIN" then
		self.frame:UnregisterEvent("PLAYER_LOGIN");
		SoulbindCacheOpenerDB = SoulbindCacheOpenerDB or {};
		--If DB is empty
		if next (SoulbindCacheOpenerDB) == nil then
			SoulbindCacheOpener:reset();
		end
	end 
	--Check for combat
	if UnitAffectingCombat("player") then
		return
	end

	SoulbindCacheOpener:AddButton();
end

------------------------------------------------
-- Slash Commands
------------------------------------------------
local function slashHandler(msg)
	msg = msg:lower() or "";
--	if (msg == "free") then
--		SoulbindCacheOpenerDB.freeSpace = not SoulbindCacheOpenerDB.freeSpace;
--		SoulbindCacheOpener:updateButtons();
	--	if SoulbindCacheOpenerDB.freeSpace then
	--		print("|cffffa500Soulbind Cache Opener|r: Displaying inventory space text on button.");
	--	else
	--		print("|cffffa500Soulbind Cache Opener|r: Hiding inventory space text on button.");
	--	end
	if (msg == "reset") then
		print("|cffffa500Soulbind Cache Opener|r: Resetting settings and position.");
		SoulbindCacheOpener:reset();
	else
		print("|cffffa500Soulbind Cache Opener|r: Commands for |cffffa500/SoulbindCacheOpener|r :");
	--	print("  |cffffa500 free|r - Toggle text on button for remaining inventory space.");
		print("  |cffffa500 reset|r - Reset all settings.");
	end
end

SlashCmdList.SoulbindCacheOpener = function(msg) slashHandler(msg) end;
SLASH_SoulbindCacheOpener1 = "/SoulbindCacheOpener";
SLASH_SoulbindCacheOpener2 = "/SCO";

--Helper functions
local function cout(msg, premsg)
	premsg = premsg or "[".."Soulbind Cache Opener".."]"
	print("|cFFE8A317"..premsg.."|r "..msg);
end

local function coutBool(msg,bool)
	if bool then
		print(msg..": true");
	else
		print(msg..": false");
	end
end

--Main Frame
SoulbindCacheOpener.frame = CreateFrame("Frame", "SoulbindCacheOpener_Frame", UIParent);
SoulbindCacheOpener.frame:Hide();
SoulbindCacheOpener.frame:SetWidth(120);
SoulbindCacheOpener.frame:SetHeight(39);
SoulbindCacheOpener.frame:SetClampedToScreen(true);
SoulbindCacheOpener.frame:SetFrameStrata("BACKGROUND");
SoulbindCacheOpener.frame:SetMovable(true);
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_ENTERING_WORLD");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_REGEN_ENABLED");
SoulbindCacheOpener.frame:RegisterEvent("PLAYER_LOGIN");
SoulbindCacheOpener.frame:RegisterEvent("BAG_UPDATE");

SoulbindCacheOpener.frame:SetScript("OnEvent", function(self,event,...) SoulbindCacheOpener:OnEvent(event,...) end);
SoulbindCacheOpener.frame:SetScript("OnShow", function(self,event,...) 
	--Restore position
	self:ClearAllPoints();
	if SoulbindCacheOpenerDB and SoulbindCacheOpenerDB.position then
		self:SetPoint(SoulbindCacheOpenerDB.position[1],UIParent,SoulbindCacheOpenerDB.position[3],SoulbindCacheOpenerDB.position[4],SoulbindCacheOpenerDB.position[5]);
	else
		self:SetPoint('CENTER', UIParent, 'CENTER', 0, 0);
	end
 end);
---Create button for each item
for i = 1, #SoulbindCacheOpener.items do
	SoulbindCacheOpener.items[i].button = CreateFrame("Button", SoulbindCacheOpener.items[i].name, SoulbindCacheOpener.frame, "SecureActionButtonTemplate,ActionButtonTemplate");
	SoulbindCacheOpener:createButton(SoulbindCacheOpener.items[i].button,SoulbindCacheOpener.items[i].id);
end