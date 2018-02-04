----------------------------------------## Version: 1.3.1-- Mingy by Sonaza-- http://sonaza.com----------------------------------------

local Mingy = {
	Frame = nil,
	--RewardButton = nil,
	RewardIndex = nil,
	QuestRewardsNum = 0,
	QuestRewardRarity = 0,
};

function Mingy:Initialize()
	if(ShiGuangDB.MingyDB == nil) then
		ShiGuangDB.MingyDB = {
			Enabled = true,
			AutoComplete = false,
		}
	end
	
	Mingy.Frame:RegisterEvent("QUEST_ITEM_UPDATE");
	Mingy.Frame:RegisterEvent("QUEST_COMPLETE");
	Mingy.Frame:RegisterEvent("QUEST_FINISHED");
	Mingy.Frame:RegisterEvent("QUEST_DETAIL");
		
	--Mingy.RewardButton	= CreateFrame("button", nil, UIParent, "UIPanelButtonTemplate");
	--Mingy.RewardButton:SetWidth(120);
	--Mingy.RewardButton:SetHeight(22);
	--Mingy.RewardButton:SetPoint("BOTTOMRIGHT", "QuestFrame", "BOTTOMRIGHT", -6, 4);
	--Mingy.RewardButton:SetText("选最贵的");
	--Mingy.RewardButton:SetScript("OnClick", Mingy.ChooseReward);
	--Mingy.RewardButton:SetFrameStrata("DIALOG");
	
	--Mingy.RewardButton:Hide();
	
	SLASH_MINGY1 = "/mingy";
	SlashCmdList["MINGY"] = function(msg) Mingy:ConsoleHandler(msg); end
	
end

function Mingy:Load()
	Mingy.Frame	= CreateFrame("Frame");
	Mingy.Frame:SetScript("OnEvent", Mingy.EventHandler);
	Mingy.Frame:RegisterEvent("ADDON_LOADED");
end

function Mingy:ConsoleHandler(command)	
	command	= string.lower(command);
	if(command == "toggle") then	
		if(ShiGuangDB.MingyDB.Enabled == true) then
			ShiGuangDB.MingyDB.Enabled	= false;
			DEFAULT_CHAT_FRAME:AddMessage("|cffeca100Mingy:|r |cffbc3100Disabled|r");
		else
			ShiGuangDB.MingyDB.Enabled	= true;
			DEFAULT_CHAT_FRAME:AddMessage("|cffeca100Mingy:|r |cff31bc00Enabled|r");
		end		
		DEFAULT_CHAT_FRAME:AddMessage("|cffeca100-- Mingy Usage --|r");
		DEFAULT_CHAT_FRAME:AddMessage("|cff61bee0/mingy|r - Shows Mingy's usage");
		DEFAULT_CHAT_FRAME:AddMessage("|cff61bee0/mingy toggle|r - Toggle Mingy ("..Mingy:FormatStateText(ShiGuangDB.MingyDB.Enabled)..")");
	end
end

function Mingy:ChooseReward()
	if(Mingy.QuestRewardsNum <= 1) then
		return;
	end
	local itemFrame	= _G["QuestInfoRewardsFrameQuestInfoItem" .. Mingy.RewardIndex];	
	QuestInfoFrame.itemChoice			= Mingy.RewardIndex;
	QuestFrameRewardPanel.itemChoice	= Mingy.RewardIndex;
	-- GetQuestReward(QuestFrameRewardPanel.itemChoice);
	QuestInfoItemHighlight:SetPoint("TOPLEFT", itemFrame, "TOPLEFT", -8, 7);
	QuestInfoItemHighlight:Show();
end

function Mingy:ScanRewards(event)
	if(Mingy.QuestRewardsNum > 1) then
		local failed = false;
		local rewardIndex;
		for rewardIndex = 1, Mingy.QuestRewardsNum do						
			local rewardLink	= GetQuestItemLink("choice", rewardIndex);		
			if(rewardLink == nil) then			
				failed = true;			
			else			
				local _, _, rarity, _, _, _, _, _, _, _, goldValue = GetItemInfo(rewardLink);	
				-- Choose only items that are common, uncommon or rare
				if(rarity <= 4) then
					if(Mingy.QuestRewardRarity <= rarity) then
						Mingy.QuestRewardRarity = rarity;
					end				
					if(goldValue >= Mingy.HighestGold) then
						Mingy.HighestGold		= goldValue;
						Mingy.HighestItemLink	= rewardLink;
						Mingy.HighestIndex		= rewardIndex;
					end
				end		
			-- Mingy.QuestRewards[rewardIndex] = rewardLink;
			end
		end	
		if(not failed and Mingy.HighestIndex > 0 and Mingy.HighestGold > 0) then	
			Mingy.RewardIndex = Mingy.HighestIndex;
			--Mingy.RewardButton:Show();	
			local rewardTextFrame = QuestInfoRewardsFrame.ItemChooseText;		
			rewardTextFrame:SetText(Mingy.HighestItemLink .. " " .. Mingy:FormatGoldText(Mingy.HighestGold) .. "|n|n" .. rewardTextFrame:GetText());
			-- if(ShiGuangDB.MingyDB.AutoComplete == true) then				
			-- 	Mingy:ChooseReward();			
			-- 	button	= _G["QuestFrameCompleteQuestButton"];
			-- 	if(button) then button:Click() end			
			-- end			
		end
	else	
		--Mingy.RewardButton:Hide();	
	end
end

function Mingy:EventHandler(event, ...)
	local arg1, arg2, arg3 = ...;
	if(event == "ADDON_LOADED") then
		Mingy:Initialize();
	end
	if(event == "QUEST_ITEM_UPDATE" and ShiGuangDB.MingyDB.Enabled and Mingy.RewardIndex == nil) then
		Mingy:ScanRewards(event);
	end
	if(event == "QUEST_COMPLETE" and ShiGuangDB.MingyDB.Enabled) then	
		Mingy.HighestGold, Mingy.HighestItemLink, Mingy.HighestIndex = 0, 0, 0;
		Mingy.RewardIndex = nil;		
		Mingy.QuestRewardsNum	= GetNumQuestChoices();		
		Mingy:ScanRewards(event);	
	end
	--if(event == "QUEST_FINISHED" or event == "QUEST_DETAIL") then		
		--Mingy.RewardButton:Hide();		
	--end
end

Mingy:Load();

function Mingy:FormatGoldText(money)
	local gold = floor(money / 10000);
	local silver = floor((money - gold * 10000) / 100);
	local copper = mod(money, 100);	
	if(gold > 0) then
		return format(GOLD_AMOUNT_TEXTURE.." "..SILVER_AMOUNT_TEXTURE.." "..COPPER_AMOUNT_TEXTURE, gold, 0, 0, silver, 0, 0, copper, 0, 0);
	elseif(silver > 0) then
		return format(SILVER_AMOUNT_TEXTURE.." "..COPPER_AMOUNT_TEXTURE, silver, 0, 0, copper, 0, 0);
	else
		return format(COPPER_AMOUNT_TEXTURE, copper, 0, 0);
	end
end

function Mingy:FormatStateText(state)
	if(state) then
		return "|cff31bc00Enabled|r";
	else
		return "|cffbc3100Disabled|r";
	end
end