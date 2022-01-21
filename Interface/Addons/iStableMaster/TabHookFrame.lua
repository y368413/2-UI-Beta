-- Author      : MrExillion
-- Create Date : 3/17/2021 8:33:42 PM




if( not IsAddOnLoaded("Blizzard_Collections")) then
				--LoadAddOn("Blizzard_Collections");			
end




local tabisHooked = false;
function HookTab()


	if(tabisHooked) then
	return;
	else

	C_STABLES_COLLECTION = {}
	D_STABLES_COLLECTION = {} 
	STABLE_COLLECTIONS_TAB_ID = 6;


	tabToBeNum = CollectionsJournal.numTabs + 1;
	iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["TabId"] = tabToBeNum;
	C_STABLES_COLLECTION["Title"] = iStableMasterDB["Constants"]["C_STABLES_COLLECTION"]["Title"];
	C_STABLES_COLLECTION["Tab"] = iStableMasterDB["Constants"]["C_STABLES_COLLECTION"]["Tab"];
	D_STABLES_COLLECTION["TabId"] = iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["TabId"];
	STABLE_COLLECTIONS_TAB_ID = D_STABLES_COLLECTION["TabId"];
	CollectionsJournalKids = { CollectionsJournal:GetChildren() };
	HookTabUpdateToOGTabs();
	TabHookFrame_OnLoad();

	tabisHooked = true;
	end
end





--local tabToBeNum = 1;
--for _, child in ipairs(CollectionsJournalKids) do
--	if(child:GetName() == child:GetParent():GetName()..child:GetID()) then
--	tabToBeNum = tabToBeNum + 1;

--	end


--end			
				
function HookTabUpdateToOGTabs()



for _, child in ipairs(CollectionsJournalKids) do
	local parentFrame = child:GetParent();
	local parentName = parentFrame:GetName();
	local matchingChildName = parentName.."Tab"..child:GetID();
	
	if(child:GetName() == matchingChildName) then
	
	--hooksecurefunc("CollectionsJournal_UpdateSelectedTab",function(child)HookCollectionsJournal_UpdateSelectedTab(child)end);
	child:HookScript("OnClick",function(child)HookCollectionsJournal_UpdateSelectedTab(child)end);
	
	end


end			

end






--[[
function GenerateAnotherTab()
				STABLE_COLLECTIONS_TAB_ID = (CollectionsJournal.numTabs + 1);
				PanelTemplates_SetNumTabs(CollectionsJournal,STABLE_COLLECTIONS_TAB_ID);
				local newTab = CreateFrame("Button", "CollectionsJournalTab"..STABLE_COLLECTIONS_TAB_ID, _G["CollectionsJournal"], "CollectionsJournalStablesTab",STABLE_COLLECTIONS_TAB_ID);
				--local newTab = _G["CollectionsJournalTabTemporary"];
				--local point, relativeTo, relativePoint, ofsX, ofsY = _G[newTab:GetName()]:GetPoint(1);
				_G[newTab:GetName()]:ClearAllPoints();
				_G[newTab:GetName()]:SetPoint("LEFT", "CollectionsJournalTab"..(CollectionsJournal.numTabs-1), "RIGHT", -16, 0);
				--_G[newTab:GetName()]:SetAllPoints();
				_G[newTab:GetName()]:SetText(STABLES_COLLECTION);

				--_G[newTab:GetName()]:SetID(STABLE_COLLECTIONS_TAB_ID);


				function NewOnClick(CollectionsJournal,self,STABLE_COLLECTIONS_TAB_ID)
				local STABLE_COLLECTIONS_TAB_ID = STABLE_COLLECTIONS_TAB_ID;

				StablesCollectionsJournal_SetTab(CollectionsJournal,self:GetID(),STABLE_COLLECTIONS_TAB_ID);
				PlaySound(SOUNDKIT.UI_TOYBOX_TABS);

				end



end
]]
function TabHookFrame_OnLoad()
				


				CollectionsJournalTab6:RegisterEvent("CVAR_UPDATE");

				CollectionsJournalTab6:SetID(STABLE_COLLECTIONS_TAB_ID);
				--CollectionsJournal:SetTitle(COLLECTIONS);
				--CollectionsJournal:SetPortraitToAsset("Interface\\Icons\\MountJournalPortrait");
				CollectionsJournalTab6:SetText(C_STABLES_COLLECTION["Tab"]);
				PanelTemplates_SetNumTabs(CollectionsJournal,STABLE_COLLECTIONS_TAB_ID);
				CollectionsJournalTab6:SetParent(CollectionsJournal);
				--CollectionsJournalTab6:SetAllPoints();
				CollectionsJournalTab6:ClearAllPoints();
				CollectionsJournalTab6:SetPoint("LEFT",CollectionsJournalTab5,"RIGHT",-16, 0);
				
				
				
				if (tonumber(GetCVar("petJournalTab")) ~= tabToBeNum) then				
				PanelTemplates_SetTab(CollectionsJournal, tonumber(GetCVar("petJournalTab")) or 1);
				
				--StablesCollection_Hide();
				elseif(tonumber(GetCVar("petJournalTab")) == tabToBeNum) then

				--PanelTemplates_SetNumTabs(CollectionsJournal,6);
				PanelTemplates_SetTab(CollectionsJournal, tonumber(GetCVar("petJournalTab")));
				--StablesCollectionsJournal_SetTab(CollectionsJournal, tonumber(GetCVar("petJournalTab")));
				StablesCollection_Show();
				CollectionsJournal:SetTitle(C_STABLES_COLLECTION["Title"]);
				CollectionsJournal:SetPortraitToAsset("Interface\\Icons\\Ability_Physical_Taunt");				
				
				end
				

				

				--_G["CollectionsJournalTab6"]:SetName("CollectionsJournalTab"..STABLE_COLLECTIONS_TAB_ID);
				

		--		hooksecurefunc(CollectionsJournalTab,"OnClick", StablesCollection_Show());


--[[
				if (not IsAddOnLoaded("Blizzard_Collections")) then



				LoadAddOn("Blizzard_Collections");


				end


				STABLE_COLLECTIONS_TAB_ID = (CollectionsJournal.numTabs + 1);
				PanelTemplates_SetNumTabs(CollectionsJournal,STABLE_COLLECTIONS_TAB_ID);
				local newTab = CreateFrame("Button", "CollectionsJournalTab"..STABLE_COLLECTIONS_TAB_ID, _G["CollectionsJournal"], "CollectionsJournalStablesTab",STABLE_COLLECTIONS_TAB_ID);
				--local newTab = _G["CollectionsJournalTabTemporary"];
				--local point, relativeTo, relativePoint, ofsX, ofsY = _G[newTab:GetName()]:GetPoint(1);
				_G[newTab:GetName()]:ClearAllPoints();
				_G[newTab:GetName()]:SetPoint("LEFT", "CollectionsJournalTab"..(CollectionsJournal.numTabs-1), "RIGHT", -16, 0);
				--_G[newTab:GetName()]:SetAllPoints();
				_G[newTab:GetName()]:SetText(STABLES_COLLECTION);

				--_G[newTab:GetName()]:SetID(STABLE_COLLECTIONS_TAB_ID);


				function NewOnClick(CollectionsJournal,self,STABLE_COLLECTIONS_TAB_ID)
				local STABLE_COLLECTIONS_TAB_ID = STABLE_COLLECTIONS_TAB_ID;

				StablesCollectionsJournal_SetTab(CollectionsJournal,self:GetID(),STABLE_COLLECTIONS_TAB_ID);
				PlaySound(SOUNDKIT.UI_TOYBOX_TABS);

				end



				--_G[newTab:GetName()]:SetScript("OnClick", function(self,STABLE_COLLECTIONS_TAB_ID)NewOnClick(self,STABLE_COLLECTIONS_TAB_ID) end);



				function InitFirstTab()
				]]
				
				--CollectionsJournalTab6:SetText(STABLES_COLLECTION["Tab"]);

				--CollectionsJournal_SetTab(self, tab)
				--_G[newTab:GetName()]:SetName("CollectionsJournalTab".._G[newTab:GetName()]:GetID());


				--[[
				for i=1,CollectionsJournal.numTabs,1 do

				if(i ~= STABLE_COLLECTIONS_TAB_ID) then

				_G["CollectionsJournalTab"..i]:SetScript("OnClick", function(self,STABLE_COLLECTIONS_TAB_ID)

				if(PanelTemplates_GetSelectedTab(CollectionsJournal):GetID() == STABLE_COLLECTIONS_TAB_ID) then
				NewOnClick(self,STABLE_COLLECTIONS_TAB_ID)
				else
				require(PanelTemplates_GetSelectedTab(CollectionsJournal):GetScript("OnClick"))

				end
				end);
				end
				end
				]]

				--[[
				for i=1,5,1 do
				_G["CollectionsJournalTab"..i]:SetScript("OnClick", function(self,...)
				StablesCollectionsJournal_SetTab(CollectionsJournal,self:GetID(),STABLE_COLLECTIONS_TAB_ID)
				PlaySound(SOUNDKIT.UI_TOYBOX_TABS)

				end);
				end
				]]
				--end

				--GenerateAnotherTab();
				
				
end

function TabHookFrame_OnEvent(self, event, ...)
	local arg1, arg2 = ...;

	if(event == "CVAR_UPDATE") then
		if(arg1 ~= "petJournalTab") then return; 
		else
			if(arg2 ~= STABLE_COLLECTIONS_TAB_ID) then
				--StablesCollection_Hide();


			end
		
		end


	
	end


end


function HookCollectionsJournal_UpdateSelectedTab(self) 

		
			
			local selected = CollectionsJournal_GetTab(self);

	--if (not CollectionsJournal_ValidateTab(selected)) then
	--	PanelTemplates_SetTab(self, 1);
	--	selected = 1;
	--end
	
	--MountJournal:SetShown(selected == 1);
	--PetJournal:SetShown(selected == 2);
	--ToyBox:SetShown(selected == 3);
	--HeirloomsJournal:SetShown(selected == 4);
	---- don't touch the wardrobe frame if it's used by the transmogrifier
	--if ( WardrobeCollectionFrame:GetParent() == self or not WardrobeCollectionFrame:GetParent():IsShown() ) then
	--	if ( selected == 5 ) then
	--		HideUIPanel(WardrobeFrame);
	--		WardrobeCollectionFrame_SetContainer(self);
	--	else
	--		WardrobeCollectionFrame:Hide();
	--	end
	--end


	--if ( selected == 1 ) then
	--	CollectionsJournalTitleText:SetText(MOUNTS);
	--elseif (selected == 2 ) then
	--	CollectionsJournalTitleText:SetText(PET_JOURNAL);
	--elseif (selected == 3 ) then
	--	CollectionsJournalTitleText:SetText(TOY_BOX);
	--elseif (selected == 4 ) then
	--	CollectionsJournalTitleText:SetText(HEIRLOOMS);
	--elseif (selected == 5 ) then
	--	CollectionsJournalTitleText:SetText(WARDROBE);
	--end
	if(selected == STABLE_COLLECTIONS_TAB_ID) then 
	StablesCollection_Show();
	else
	StablesCollection_Hide();

	end


	--HelpTip:HideAll(self);
	--if ShouldShowHeirloomTabHelpTip() then
	--	local helpTipInfo = {
	--		text = HEIRLOOMS_JOURNAL_TUTORIAL_TAB,
	--		buttonStyle = HelpTip.ButtonStyle.Close,
	--		cvarBitfield = "closedInfoFrames",
	--		bitfieldFlag = LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_TAB,
	--		targetPoint = HelpTip.Point.TopEdgeCenter,
	--		offsetY = -7,
	--	};
	--	HelpTip:Show(self, helpTipInfo, CollectionsJournalTab4);
	--elseif ShouldShowWardrobeTabHelpTip() then
	--	local helpTipInfo = {
	--		text = TRANSMOG_JOURNAL_TAB_TUTORIAL,
	--		buttonStyle = HelpTip.ButtonStyle.Close,
	--		cvarBitfield = "closedInfoFrames",
	--		bitfieldFlag = LE_FRAME_TUTORIAL_TRANSMOG_JOURNAL_TAB,
	--		targetPoint = HelpTip.Point.TopEdgeCenter,
	--		offsetY = -7,
	--	};
	--	HelpTip:Show(self, helpTipInfo, CollectionsJournalTab5);
	--end
end

		

--[[

function StablesLeftFrame_OnLoad(self) 
-- why?
end

--stabletabid = _G["stabletabid"];
]]





function StablesCollectionsJournal_SetTab(self, tab)



	if (tab ~= STABLE_COLLECTIONS_TAB_ID and tab < 6) then
	CollectionsJournal_SetTab(self, tab);
	
	elseif (tab == STABLE_COLLECTIONS_TAB_ID) then
	PanelTemplates_SetTab(self, tab);
	CollectionsJournal_UpdateSelectedTab(self);
	HookCollectionsJournal_UpdateSelectedTab(self);
	SetCVar("petJournalTab", tab);


	end


end
local function CollectionsJournal_SetTab(self, tab)
	PanelTemplates_SetTab(self, tab);
	SetCVar("petJournalTab", tab);
	CollectionsJournal_UpdateSelectedTab(self);
end




--function StablesCollectionsJournal_SetTab(self, tab, stabletabid)

--	local stabletabid = stabletabid;

--	if (tab < stabletabid) then
--	CollectionsJournal_SetTab(self,tab);
	
--	elseif (tab == stabletabid) then
--	--PanelTemplates_SetTab(self, tab);
--	StablesCollection_UpdateSelectedTab(self,stabletabid);
--	SetCVar("petJournalTab", stabletabid);


--	end


--end

function CollectionsJournal_GetSelectedTab(self)
	return PanelTemplates_GetSelectedTab(self);
end

--[[
function StaticStablesCollection_UpdateSelectedTab(self)

if(CollectionsJournal_GetTab(self) == 6)
then
StablesCollection_UpdateSelectedTab(self,6)

else
Collection_UpdateSelectedTab(self)

end


end

]]
--[[
function StablesCollection_UpdateSelectedTab(self, stabletabid)
	
	local selected = CollectionsJournal_GetTab(self);

	if(selected == stabletabid) then 
	StablesCollection:SetShown(true);
	return;
	else
	StablesCollection:SetShown(false);

	end


	if (not CollectionsJournal_ValidateTab(selected)) then
		PanelTemplates_SetTab(self,1);
		selected = 1;
	end
	
	MountJournal:SetShown(selected == 1);
	PetJournal:SetShown(selected == 2);
	ToyBox:SetShown(selected == 3);
	HeirloomsJournal:SetShown(selected == 4);
	-- don't touch the wardrobe frame if it's used by the transmogrifier
	if ( WardrobeCollectionFrame:GetParent() == self or not WardrobeCollectionFrame:GetParent():IsShown() ) then
		if ( selected == 5 ) then
			HideUIPanel(WardrobeFrame);
			WardrobeCollectionFrame_SetContainer(self);
		else
			WardrobeCollectionFrame:Hide();
		end
	end
	
	
	
	--StablesCollection:SetShown(selected == stabletabid);


	if ( selected == 1 ) then
		CollectionsJournalTitleText:SetText(MOUNTS);
	elseif (selected == 2 ) then
		CollectionsJournalTitleText:SetText(PET_JOURNAL);
	elseif (selected == 3 ) then
		CollectionsJournalTitleText:SetText(TOY_BOX);
	elseif (selected == 4 ) then
		CollectionsJournalTitleText:SetText(HEIRLOOMS);
	elseif (selected == 5 ) then
		CollectionsJournalTitleText:SetText(WARDROBE);
	elseif (selected == stabletabid) then
		CollectionsJournalTitleText:SetText(t_STABLES_COLLECTION["Title"]);
	end

  if(selected ~= stabletabid) then
	HelpTip:HideAll(self);
	if ShouldShowHeirloomTabHelpTip() then
		local helpTipInfo = {
			text = HEIRLOOMS_JOURNAL_TUTORIAL_TAB,
			buttonStyle = HelpTip.ButtonStyle.Close,
			cvarBitfield = "closedInfoFrames",
			bitfieldFlag = LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_TAB,
			targetPoint = HelpTip.Point.TopEdgeCenter,
			offsetY = -7,
		};
		HelpTip:Show(self, helpTipInfo, CollectionsJournalTab4);
	elseif ShouldShowWardrobeTabHelpTip() then
		local helpTipInfo = {
			text = TRANSMOG_JOURNAL_TAB_TUTORIAL,
			buttonStyle = HelpTip.ButtonStyle.Close,
			cvarBitfield = "closedInfoFrames",
			bitfieldFlag = LE_FRAME_TUTORIAL_TRANSMOG_JOURNAL_TAB,
			targetPoint = HelpTip.Point.TopEdgeCenter,
			offsetY = -7,
		};
		HelpTip:Show(self, helpTipInfo, CollectionsJournalTab5);
	end
  end
end

]]

--[[
local function ShouldShowHeirloomTabHelpTip()
	if GetCVarBitfield("closedInfoFrames", LE_FRAME_TUTORIAL_HEIRLOOM_JOURNAL_TAB) or Kiosk.IsEnabled() then
		return false;
	end

	if PetJournal_HelpPlate and HelpPlate_IsShowing(PetJournal_HelpPlate) then
		return false;
	end

	return C_Heirloom.ShouldShowHeirloomHelp();
end

local function ShouldShowWardrobeTabHelpTip()
	if GetCVarBitfield("closedInfoFrames", LE_FRAME_TUTORIAL_TRANSMOG_JOURNAL_TAB) or Kiosk.IsEnabled() then
		return false;
	end

	if PetJournal_HelpPlate and HelpPlate_IsShowing(PetJournal_HelpPlate) then
		return false;
	end

	return true;
end
]]



