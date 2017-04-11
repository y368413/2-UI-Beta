----------------------------------------------------------------------
-- 	Digital_Utopia 
-- 	Last updated: 6/26/2013
----------------------------------------------------------------------

--	Initialise variables
	local hks
	local PVPT1;
	local PVPT2;
	local dummyFrame = CreateFrame("FRAME","hkFrame");
	dummyFrame:RegisterEvent("PVPQUEUE_ANYWHERE_SHOW");
	dummyFrame:RegisterEvent("PLAYER_PVP_KILLS_CHANGED");
	local function eventHandler(self, event, ...)
		hks=GetStatistic(588);
		if(event=="PVPQUEUE_ANYWHERE_SHOW")then
		if(hklabel == nil and hkval == nil)then
			PVPT1 = PVPQueueFrame:CreateFontString("hklabel", 'ARTWORK',"HonorKillsNormal")
			PVPT1:SetPoint("TOPLEFT",60,-40);
			PVPT1:SetText("击杀人头");
			PVPT2 = PVPQueueFrame:CreateFontString("hkval",'ARTWORK',"HonorKillsWhite")
			PVPT2:SetPoint("TOPLEFT",136,-40);
		end
		PVPT2:SetText(hks);
		end
		if(event=="PLAYER_PVP_KILLS_CHANGED")then
			if(PVPUIFrame ~= nil)then
				if(PVPUIFrame:IsVisible()==true)then
					PVPT2:SetText(hks);
				end
			end
		end
	end
	dummyFrame:SetScript("OnEvent",eventHandler);
	
	
	
	
-- 	Show HK heading
	--local PVPT1 = PVPUIFrame:CreateFontString(nil, 'ARTWORK', "GameFontNormal")
	--PVPT1:SetPoint("TOPRIGHT",-80,-38)
	--PVPT1:SetText("HKs")

-- 	Show HK placeholder for stat
	--local PVPT2 = PVPUIFrame:CreateFontString(nil, 'ARTWORK', "GameFontHighlight")
	--PVPT2:SetPoint("LEFT",PVPT1,"LEFT",30,0)

-- 	Run code when PVP frame is shown
	--PVPUIFrame:HookScript("OnShow", function()

-- Get current number of honorable kills from stats
		hks = GetStatistic(588)

-- Move honor text to the left
		--PVPFrameCurrency:ClearAllPoints();
		--PVPFrameCurrency:SetPoint("TOPLEFT",PVPUIFrame,"TOPLEFT",110,-20)

-- Show HKs to the right
		--PVPT2:SetText(hks)

--end)