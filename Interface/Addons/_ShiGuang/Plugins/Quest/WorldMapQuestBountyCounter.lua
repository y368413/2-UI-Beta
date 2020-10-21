---------------------------------------------------------------------------------------------------------	WorldMapQuestBountyCount Thanks WorldQuestTab
WorldMapQuestBountyCount = {}
function WorldMapQuestBountyCount:OnLoad()
    self.bountyCounterPool = CreateFramePool("FRAME", self, "BountyCounterTemplate");
    
	-- Auto emisarry when clicking on one of the buttons
	local bountyBoard = WorldMapFrame.overlayFrames[4];
	self.bountyBoard = bountyBoard;
	
	hooksecurefunc(bountyBoard, "OnTabClick", function(self, tab) 
		if (not MaoRUIPerDB["Misc"]["WorldQusetRewardIcons"] or tab.isEmpty) then return; end
		WRWorldQuestFrame.autoEmisarryId = bountyBoard.bounties[tab.bountyIndex];
	end, self)
	
	hooksecurefunc(bountyBoard, "RefreshSelectedBounty", function() 
		if (MaoRUIPerDB["Misc"]["WorldQusetRewardIcons"]) then
			self:UpdateBountyCounters();
		end
	end)
		
	-- Slight offset the tabs to make room for the counters
	hooksecurefunc(bountyBoard, "AnchorBountyTab", function(self, tab) 
		if (not MaoRUIPerDB["Misc"]["WorldQusetRewardIcons"]) then return end
		local point, relativeTo, relativePoint, x, y = tab:GetPoint(1);
		tab:SetPoint(point, relativeTo, relativePoint, x, y + 2);
	end)
end
		
function WorldMapQuestBountyCount:UpdateBountyCounters()
	self.bountyCounterPool:ReleaseAll();
	if (not MaoRUIPerDB["Misc"]["WorldQusetRewardIcons"]) then return end
	if (not self.bountyInfo) then
		self.bountyInfo = {};
	end
	for tab, v in pairs(self.bountyBoard.bountyTabPool.activeObjects) do
		self:AddBountyCountersToTab(tab);
	end
end

function WorldMapQuestBountyCount:RepositionBountyTabs()
	for tab, v in pairs(self.bountyBoard.bountyTabPool.activeObjects) do
		self.bountyBoard:AnchorBountyTab(tab);
	end
end

function WorldMapQuestBountyCount:AddBountyCountersToTab(tab)
	local bountyData = self.bountyBoard.bounties[tab.bountyIndex];
	
	if (bountyData) then
		local progress, goal = self.bountyBoard:CalculateBountySubObjectives(bountyData);
		if (progress == goal) then return end;
		
		-- Counters
		local offsetAngle = 32;
		local startAngle = 270;
		
		-- position of first counter
		startAngle = startAngle - offsetAngle * (goal -1) /2
		
		for i=1, goal do
			local counter = self.bountyCounterPool:Acquire();

			local x = cos(startAngle) * 16;
			local y = sin(startAngle) * 16;
			counter:SetPoint("CENTER", tab.Icon, "CENTER", x, y);
			counter:SetParent(tab);
			counter:Show();
			
			-- Light nr of completed
			if i <= progress then
				counter.icon:SetTexCoord(0, 0.5, 0, 0.5);
				counter.icon:SetVertexColor(1, 1, 1, 1);
				counter.icon:SetDesaturated(false);
			else
				counter.icon:SetTexCoord(0, 0.5, 0, 0.5);
				counter.icon:SetVertexColor(0.75, 0.75, 0.75, 1);
				counter.icon:SetDesaturated(true);
			end

			-- Offset next counter
			startAngle = startAngle + offsetAngle;
		end
	end
end