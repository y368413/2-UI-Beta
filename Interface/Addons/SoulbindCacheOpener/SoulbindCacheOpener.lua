 -- Author: Nerino1
-- Create Date : 1/8/2021
-- Version 4.1

local _, L = ...;
SoulbindCacheOpener = {};

SoulbindCacheOpener.items = {
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
	self.frame:RegisterEvent("BAG_UPDATE");
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