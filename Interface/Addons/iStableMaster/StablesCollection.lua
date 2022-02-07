-- Author      : MrExillion
-- Create Date : 3/8/2021 12:48:19 AM

debugEnabled = {
 switchstack_MoveEmptyAndOccupiedScrollSlots = false,
 all = false,
 presets_Swaps = false,
 unstableFunctionsOn = false,
}


firstOpen = true;

function DebugToggle(arg)

	debugEnabled[arg] = not debugEnabled[arg];

end
ExoticFamilies = {"Aqiri","Chimaera","Core Hound","Devilsaur","Spirit Beast","Worm","Shale Beast","Stone hound","Water Strider","Clefthoof","Carapid","Pterrordax"};
function IsStabledPetExotic(index) --returns true if petInStable with index is exotic
local l_ExoticFamilies = {"Aqiri","Chimaera","Core Hound","Devilsaur","Spirit Beast","Worm","Shale Beast","Stone Hound","Water Strider","Clefthoof","Carapid","Pterrordax"};
return tContains(l_ExoticFamilies,select(4,GetStablePetInfo(index)));

end

function IsExotic(family) --returns true family is exotic
local l_ExoticFamilies = {"Aqiri","Chimaera","Core Hound","Devilsaur","Spirit Beast","Worm","Shale Beast","Stone Hound","Water Strider","Clefthoof","Carapid","Pterrordax"};
return tContains(l_ExoticFamilies,family);

end

local tempPoint;
 --UIPanelWindows["PetStableFrame"] =				{ area = "left",			pushable = 7, allowOtherPanels = 1 };
--PetStableFrame:SetPoint("TOPLEFT",self:GetParent(),"TOPRIGHT",16,-200);
--UIPanelWindows["self:GetParent()"] =			{ area = "left",			pushable = 0, 	whileDead = 1, width = 733, allowOtherPanels = 1};

function StablesCollection_OnShow(self)
	
	self:GetParent():SetAttribute("UIPanelLayout-pushable", 0);
	self:GetParent():SetAttribute("UIPanelLayout-allowOtherPanels", 1);
--	PetStableFrame:SetAttribute("UIPanelLayout-pushable", 1);
	PetStableFrame:SetAttribute("UIPanelLayout-pushable", 1);
	PetStableFrame:SetAttribute("UIPanelLayout-allowOtherPanels", 1);
	PetStableFrame:ClearAllPoints();
	PetStableFrame:SetPoint("TOPLEFT",-500,-204);
	PopulateSquadScrollFrame();
	SelectedPresetUpdate();

end
--local StablesCollection = _G["StablesCollection"];
function StablesCollection_OnLoad(self)
self:RegisterEvent("PET_STABLE_UPDATE");
self:RegisterEvent("PET_STABLE_SHOW");
self:RegisterEvent("PET_STABLE_CLOSED");
self:RegisterEvent("ACTIVE_TALENT_GROUP_CHANGED");

PanelTemplates_SetNumTabs(self, 2);
PanelTemplates_SetTab(self, 1);
--PanelTemplates_ResizeTabsToFit(self, TABS_MAX_WIDTH);
	
hooksecurefunc("PetAbandon",function() local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");
						for i = 1, squadslimit do for j = 1, 5 do   if(GetStablePetInfo(j) == nil and iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] == j) then iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]  =  nil; end  end end end);

self:RegisterEvent("ADDON_LOADED");
--self:RegisterEvent("PLAYER_ENTERING_WORLD");
--StablesCollection = self;



--[[		
self:SetScript("OnEvent", function(self, event, ...)
			return self[event] and self[event](self, ...);
		end);

		local cjwidth = self:GetParent():GetWidth();

	--tempPoint = PetStableFrame:GetPoint(1);
	--PetStableFrame:ClearAllPoints();
	 --PetStableFrame:SetPoint("TOPLEFT",cjwidth + 20,-104);
	 --UIPanelWindows["PetStableFrame"] =				{ area = "left",			pushable = 7, allowOtherPanels = 1 };
	 --UIPanelWindows["self:GetParent()"] =			{ area = "left",			pushable = 0, 	whileDead = 1, width = 733, allowOtherPanels = 1};
	 --PetStableFrame:SetPoint("TOPLEFT",self:GetParent(),"TOPRIGHT",16,-200);
		
	 ]]

end


--self:GetParent().StablesCollection:SetScript("OnEvent",function(self, event, ...) StablesCollection_OnEvent(self, event, ...); end);


function StablesCollection_OnEvent(self, event, ...)
	local arg1 = ...;
	if(event == "ACTIVE_TALENT_GROUP_CHANGED") then 
	local currentSpec = GetSpecialization();
	GlobalSpecialization = currentSpecName[currentSpec];
			local localSpecValue = GlobalActiveSlotLoopValue;
		if(GlobalSpecialization == "Beast Mastery") then 
			GlobalActiveSlotLoopValue = 6;
			
		else
			GlobalActiveSlotLoopValue = 5;
			
		end
			iStableMasterDB["Dynamics"]["D_STABLES_COLLECTION"]["ActiveSlotLoopValue"] = GlobalActiveSlotLoopValue;
			if ActivePetSlotsCards ~= nil then 
			PopulateActiveCards();
			UpdateActiveCards();
			SetPetScrollTilesContent();
			--ReOrderScrollFrame("newTalents", GlobalActiveSlotLoopValue - localSpecValue);
			--ReOrderScrollFrame("default");

			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll(); 
				MasterFilterSort();
			end
			PopulateSquadScrollFrame();
			end
	end

	if( event == "ADDON_LOADED") then
		
		
		--self:GetParent():SetAttribute("UIPanelLayout-pushable", 0);
		--self:GetParent():SetAttribute("UIPanelLayout-allowOtherPanels", 1);
		
		--PetStableFrame:SetAttribute("UIPanelLayout-pushable", 1);
		--PetStableFrame:SetAttribute("UIPanelLayout-allowOtherPanels", 1);
		
		if(event == "ADDON_LOADED") then
			--InitFirstTab();
		
		end
		--StablesCollection:HookScript("OnShow", StablesCollection_OnLoad_CVSix());

	
	end
	


	if (event == "PET_STABLE_SHOW") then
		--print(self:GetParent():GetName());
		if(IsAtStableMaster()) then
			OpenStablesButton:Enable(); 
		end 
		-- moved this to a secure hook to avoid overlapping of frames on first open self:GetParent():SetAttribute("UIPanelLayout-pushable", 0);
		-- moved this to a secure hook to avoid overlapping of frames on first open self:GetParent():SetAttribute("UIPanelLayout-allowOtherPanels", 1);
		--self.petStablePage = PetStable.page;
		
		
		OpenStablesButton:SetText("Show Stables");
		if(nil == CurrentlySelectedPet) then
		--CurrentlySelectedPet = "ScrollElement1";

		end
	 --PetStableFrame:SetParent(UIParent);
	 --SetPetScrollTilesContent();
	 --SetPetModelView();
	 --ShowUIPanel(CollectionsJournal);
	 
	 --PlaySound(SOUNDKIT.UI_TOYBOX_TABS);
				--StablesCollection_Show();
	 --Stablesself:GetParent()_SetTab(self:GetParent(),6);
	 --Stablesself:GetParent()_SetTab(self:GetParent(), STABLE_COLLECTIONS_TAB_ID, STABLE_COLLECTIONS_TAB_ID);
	 --self:GetParent():SetTitle("Stables");
     --self:GetParent():SetPortraitToAsset("Interface\\Icons\\Ability_Physical_Taunt");
	 --PetStableFrame:Visibility(0);
	end
	if (event == "PET_STABLE_CLOSED") then
	 --PetStableFrame:ClearAllPoints();
	 --tempPoint = PetStableFrame:GetPoint(1);
	 --PetStableFrame:SetPoint(tempPoint);
	 if(not IsAtStableMaster()) then
		OpenStablesButton:Disable();
		OpenStablesButton:SetText("Stable Disabled");
	 end 
	 
	 end

	
	if (event == "PET_STABLE_UPDATE") then
	 if ActivePetSlotsCards ~= nil then 
	 -- fallback safety of squad info changed from stablemaster interface by blizzard
	 --UpdateSquadInfoOnStableUpdateEvent(); -- test basis
	 
	 --if PetStable.page ~= self.petStablePage then 
	-- hookOnDrag();
	-- end
	 SavePetInfoToWTF();
	 SetPetScrollTilesContent();
	 
	 SetPetModelView();
	 UpdateActiveCards();
	 -- add some condition here to fit option for hidden slots
	 if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
	else
	 ShowEmptyScrollSlots();
	 --MoveEmptySlotsToBottomOfScroll();
	 --HideEmptyScrollSlots();
	 MasterFilterSort();
	end
	 SelectedPresetUpdate();
	 end
	 
		 
	end
	

end



function iStableMaster_hookOnDrag() 


_G["PetStableFrame"]:HookScript("OnLeave", function() _G["PetStableFrame"].btnHover = nil; _G["PetStableFrame"].btnOrigin = nil; end);
_G["PetStableFrame"].IsDragging = false;
for i = 1,5 do 
_G["PetStableActivePet"..i]:HookScript("OnDragStart", function()
		
		if(not _G["PetStableFrame"].IsDragging) then
		_G["PetStableFrame"].IsDragging = true;
		_G["PetStableFrame"].btnOrigin = _G["PetStableFrame"].btnHover;

		end
end);

_G["PetStableActivePet"..i]:HookScript("OnEnter", function()
		_G["PetStableFrame"].btnHover = PetStable_GetPetSlot(i,true); 	
end);

--_G["PetStableActivePet"..i]:HookScript("OnMouseUp",
--			function(self, button)
--			if(button == "LeftButton") then 
--			local l_type, l_slotFrom = GetCursorInfo();
--			if  l_type == "pet" and _G["PetStableFrame"].btnHover == i then
--				if(IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][_G["PetStableFrame"].btnHover]))then
--				UpdateSquadCurrentSlots(l_slotFrom,_G["PetStableFrame"].btnHover);
--				print(l_slotFrom,_G["PetStableFrame"].btnHover);
--				end			
--			end
--			end
--			end);

end

for i = 1,10 do 
--_G["PetStableStabledPet"..i]:HookScript("OnLeave", function()


		--print(_G["PetStableFrame"].btnHover);


		--print(_G["PetStableFrame"].btnOrigin);			

		--_G["PetStableFrame"].btnHover = nil;

--end);

_G["PetStableStabledPet"..i]:HookScript("OnEnter", function()
	

	
	_G["PetStableFrame"].btnHover = PetStable_GetPetSlot(i,false); 	
	--print(_G["PetStableFrame"].btnHover);
	
end);



_G["PetStableStabledPet"..i]:HookScript("OnDragStart", function() 
		
		if(not _G["PetStableFrame"].IsDragging) then
		_G["PetStableFrame"].IsDragging = true;
		_G["PetStableFrame"].btnOrigin = _G["PetStableFrame"].btnHover;

		end
end);



--_G["PetStableStabledPet"..i]:HookScript("OnDragStart",
--			function(self, button)
--			if(button == "LeftButton") then 
--			local l_type, l_slotFrom = GetCursorInfo();
--			if (l_type == "pet" and _G["PetStableFrame"].btnHover == i ) then
--			--_G["PetStableFrame"].btnOrigin = l_slotFrom;	
--				--UpdateSquadCurrentSlots(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false));
				
--			--	print(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false),"DRAGSTART");
--			end
--			end
--			end);

--_G["PetStableStabledPet"..i]:HookScript("OnMouseUp",
--			function(self, button)
--			if(button == "LeftButton") then 
--			local l_type, l_slotFrom = GetCursorInfo();
--			if  l_type == "pet" and _G["PetStableFrame"].btnHover == i then
				
--				--UpdateSquadCurrentSlots(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false));
				
--				--print(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false),i);
--			end
--			end
--			end);



--_G["PetStableStabledPet"..i]:HookScript("OnDragStop",
--			function(self, button)
--			if(button == "LeftButton") then 
--			local l_type, l_slotFrom = GetCursorInfo();
--			if l_type == "pet" and _G["PetStableFrame"].btnHover == i then
				
--				--UpdateSquadCurrentSlots(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false));
				
--			--print(l_slotFrom,PetStable_GetPetSlot(_G["PetStableFrame"].btnHover, false),i);
--			end
--			end
--			end);


end


hooksecurefunc("SetPetSlot", function()

 if(debugEnabled.unstableFunctionsOn == false) then 
	return;
 end

			if(	_G["PetStableFrame"].btnHover ~= nil and _G["PetStableFrame"].IsDragging) then 
				if(_G["PetStableFrame"].btnOrigin ~= _G["PetStableFrame"].btnHover)then
				--print(_G["PetStableFrame"].btnOrigin,_G["PetStableFrame"].btnHover);
				UpdateSquadCurrentSlots(_G["PetStableFrame"].btnOrigin,_G["PetStableFrame"].btnHover);

				_G["PetStableFrame"].IsDragging = false;
				end
			end

end);


end


function UpdateSquadInfoOnStableUpdateEvent() 
for i = 1, 205 do
	local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
	
	if l_talent == nil then 
		l_talent = "N/A";
	end

	if l_name == nil then 
		l_name = "N/A";
	end

			for j = 1, 205 do
			 
				local j_icon = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["icon"];
				local j_name = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"];
				local j_level = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["level"];
				local j_family = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"];
				local j_talent = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["talent"];
				--local j_icon, j_name, j_level, j_family, j_talent = ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"]
	
				if(j_name == l_name and j_talent == l_talent and ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["Slot"] == i) then
					UpdateSquadCurrentSlots(i,j);
					print(i..", name: "..l_name..","..j..","..j_name);
					break;
		    end
	

	
		break;
	end


end



end



hooksecurefunc("PetRename", function() 
	 SavePetInfoToWTF();
	 if(self:IsShown())then
	 SetPetScrollTilesContent();	 
	 SetPetModelView();
	 UpdateActiveCards();
	 end 
	-- print(1);
	C_Timer.After(1.5, function()
	 SavePetInfoToWTF();
	 if(self:IsShown())then
	 SetPetScrollTilesContent();	 
	 SetPetModelView();
	 UpdateActiveCards(); 	 
	-- print(2);
	 end
	 end);

 end);

function SelectedPresetUpdate()
if iStableMasterStableDB["SavedSquads"] == nil then 
return;

end

local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");
local isActive = false;
for i = 1, squadslimit do
isActive = false;
	for j = 1, 6 do
		if(iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j] ~= nil) then
			if(j < 6) then 
				isActive = (iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["Slot"] == iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"]);
				if(debugEnabled[presets_Swap]) then
				print(isActive);
				end
			else 
				isActive = (iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["Slot"] == iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"]);
				if(debugEnabled[presets_Swap]) then
				print(isActive);
				end
			end 
				if(not isActive)then
					break;
				end
		end
		
		
	end
	
		if(isActive) then
		
		_G["Squad"..i.."selectedOverlayBL"]:Show();
		_G["Squad"..i.."selectedOverlayBR"]:Show();
		_G["Squad"..i.."selectedOverlayTL"]:Show();
		_G["Squad"..i.."selectedOverlayTR"]:Show();
		_G["Squad"..i.."selectedOverlayR"]:Show();
		_G["Squad"..i.."selectedOverlayL"]:Show();
		_G["Squad"..i.."selectedOverlayH"]:Show();
		else
		_G["Squad"..i.."selectedOverlayBL"]:Hide();
		_G["Squad"..i.."selectedOverlayBR"]:Hide();
		_G["Squad"..i.."selectedOverlayTL"]:Hide();
		_G["Squad"..i.."selectedOverlayTR"]:Hide();
		_G["Squad"..i.."selectedOverlayR"]:Hide();
		_G["Squad"..i.."selectedOverlayL"]:Hide();
		_G["Squad"..i.."selectedOverlayH"]:Hide();
		end
end

end


-- presetScrollFrame
function PopulateSquadScrollFrame()
if iStableMasterStableDB["SavedSquads"] == nil then
	return;
end

if(StablesCollectionPresetsFrameScrollFrame.scrollChild == nil) then
StablesCollectionPresetsFrameScrollFrame.scrollChild = CreateFrame("Frame", ScrollChild, StablesCollectionPresetsFrameScrollFrameScrollBar, BackdropTemplateMixin and "BackdropTemplate");
StablesCollectionPresetsFrameScrollFrame:SetScrollChild(StablesCollectionPresetsFrameScrollFrame.scrollChild);
StablesCollectionPresetsFrameScrollFrame.scrollChild:SetSize(127,42);
StablesCollectionPresetsFrameScrollFrame.scrollChild:SetHeight(StablesCollectionPresetsFrameScrollFrame:GetHeight());
end


local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");

StablesCollectionPresetsFrameScrollFrame.scrollChild:SetPoint(StablesCollectionPresetsFrameScrollFrame:GetPoint(1));
local point1, relativeTo1, relativePoint1, xOfs1, yOfs1 = StablesCollectionPresetsFrameScrollFrame.scrollChild:GetPoint(1);
		--StablesCollectionPresetsFrameScrollFrame.scrollChild:SetPoint(point1,relativeTo1,"TOPRIGHT",xOfs,-21);
--local point2, relativeTo2, relativePoint2, xOfs2, yOfs2 = StablesCollectionPresetsFrameScrollFrame.scrollChild:GetPoint(2);
	for i = 1, squadslimit do
		if(StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i] == nil) then
			
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i] = CreateFrame("Button", "Squad"..i ,StablesCollectionPresetsFrameScrollFrame.scrollChild, "SquadButtonTemplate");
		--StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i] = CreateFrame("Button", "Squad"..i ,StablesCollectionPresetsFrameScrollFrame.scrollChild);
		
		end
		--print("makeFrame");
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetPoint("TOPLEFT", StablesCollectionPresetsFrameScrollFrame.scrollChild, "TOPLEFT", 8,-((StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:GetHeight()-10)*(i-1))-2);
		--StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetPoint(point2, yOfs2,-(StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:GetHeight()*(i+1))-4);
		--StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetWidth(StablesCollectionPresetsFrameScrollFrame.scrollChild:GetWidth());
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetSize(128,42);
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetHeight(42);
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:SetWidth(128);
		StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..i]:HookScript("OnClick", function(self, button)
																	if button == "LeftButton" then ApplySquad(i); -- USING i Will cause problems if there are gaps in the presets
																	
																	elseif "RightButton" then -- MAKE DROP DOWN WITH DELETE OPTION HERE
																	
																	end
																	end);
	end
		if(StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..1] ~= nil) then
			StablesCollectionPresetsFrameScrollFrame.scrollChild:SetHeight((StablesCollectionPresetsFrameScrollFrame.scrollChild["SquadButton"..1]:GetHeight()-10)*(squadslimit+1)-20);
		end
end

-- scroll frame
function PopulateScrollFrame()

	if(_G["ScrollElement0"] ~= nil) then
		return;
	end

	ScrollFrameArrElem = {};

	local ElementSizeX = (StablesRightFrame.ScrollFrame:GetWidth());
	local ElementSizeY = 44;
	local mousePos = {x=0,y=0};

	
	StablesCollectionScrollbarMaxChildren = 205;
	--local maxSizeX = (StablesCollectionScrollbarMaxChildren + 0)* 127;
	local maxSizeY = (StablesCollectionScrollbarMaxChildren * (ElementSizeY+4))-((StablesCollectionScrollbarMaxChildren-2) * 4);

	ScrollFrameArrElem["ScrollElement0"] = CreateFrame("Frame", "ScrollElement0", StablesRightFrame.ScrollFrame.ScrollBar, BackdropTemplateMixin and "BackdropTemplate");
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	--ScrollFrameArrElem["ScrollElement0"]:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
 --          edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=true,tileSize=32,edgeSize=32,
 --          insets= {left=11,right=12,top=12,bottom=11}});

	StablesRightFrame.ScrollFrame:SetScrollChild(ScrollFrameArrElem["ScrollElement0"]);

for i=1,StablesCollectionScrollbarMaxChildren, 1 do 
 
 --[[
 obj:SetPoint(point, relativeFrame, relativePoint, ofsx, ofsy);
obj:SetPoint(point, relativeFrame, relativePoint);
obj:SetPoint(point, ofsx, ofsy);
obj:SetPoint(point);
 ]]
	--[[
	if (i == 1) then
	ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
	ScrollFrameArrElem["ScrollElement"..i]:SetSize(ElementSizeX,ElementSizeY);
	
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-4);

	ScrollFrameArrElem["ScrollElement"..i]:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
           edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=true,tileSize=32,edgeSize=32,
           insets= {left=11,right=12,top=12,bottom=11}});   

	elseif (i == 2) then 
	ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
	ScrollFrameArrElem["ScrollElement"..i]:SetSize(ElementSizeX,ElementSizeY);

	--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement"..(i-1)]:GetPoint(1);
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY+8)*(i-1));
	
	ScrollFrameArrElem["ScrollElement"..i]:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
           edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=true,tileSize=32,edgeSize=32,
           insets= {left=11,right=12,top=12,bottom=11}});


	else
	ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
	ScrollFrameArrElem["ScrollElement"..i]:SetSize(ElementSizeX,ElementSizeY);

	--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement"..(i-1)]:GetPoint(1);
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY+4)*(i-1));
	
	ScrollFrameArrElem["ScrollElement"..i]:SetBackdrop({bgFile="Interface\\DialogFrame\\UI-DialogBox-Background",
           edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=true,tileSize=32,edgeSize=32,
           insets= {left=11,right=12,top=12,bottom=11}});   


	end
	]]
	--if(iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then



			if(i > 0) then
				--ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", ActivePetSlotsCards["ActiveSlot"..i], ActivePetSlotsCards["ActiveSlot"..i], BackdropTemplateMixin and "BackdropTemplate");
				ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", "ScrollElement"..i, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
				local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
		
				ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-1))-4);
				ScrollFrameArrElem["ScrollElement"..i]:SetSize(ElementSizeX,ElementSizeY);
			



--				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnMouseDown", function() PetCardSelect(ScrollFrameArrElem["ScrollElement"..i]) SetSelectedHighlight() end);

	
--				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnEnter", function() ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(1); currentHover = tonumber(i); end);
--				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnLeave", function(self) ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(0);  currentHover = tonumber(i); end);
--				--ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseDown", function(self, button)
--				--																if button == "LeftButton" and not self.isMoving then
																		 
--				--																	pet_On_Drag(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"]);
--				--																	self.isMoving = true;
--				--																	end
--				--end);
--				ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseDown", function(self, button)
																	

--																	if button == "LeftButton" and not self.isMoving then																	 
																		

--																		mousePos.x, mousePos.y = GetCursorPosition();
--																		self.isLeftButtonDown = true;
																		
--																		clickedScrollFrame = tonumber(i);
																	
																		
--																	end
--				end);

--				--ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseUp",function(self, button)
--				--															if button == "LeftButton" and  self.isMoving then
--				--															local slot = self:GetName();
--				--																pet_On_Drop(currentHover);
--				--																--pet_On_Drop(tonumber(string.sub(slot, 14)));
--				--																self.isMoving = false;
--				--															end
--				--end);
--				ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseUp",function(self, button)
--																	if button == "LeftButton" and ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving then
--																		if(clickedScrollFrame ~= nil) then
--																		local slot = self:GetName();
--																		pet_On_Drop(currentHover);
--																		--pet_On_Drop(tonumber(string.sub(slot, 14)));
																		
--																		ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isLeftButtonDown = false;																		
																		
--																		ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving = false;
--																		clickedScrollFrame = nil;
--																		end
--																	end
--																	clickedScrollFrame = nil;
--																	clickedCardSocket = nil;

--				end);


--				--ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnDragStart", function() pet_On_Drag(ScrollFrameArrElem["ScrollElement"..i]["PetInfo"]["Slot"]) end);





			end


	--else
				
				--if(i>=GlobalActiveSlotLoopValue) then
				--ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", "ScrollElement"..i, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
					
				--	if(i == GlobalActiveSlotLoopValue-1 and GlobalActiveSlotLoopValue == 5) then
				--		--ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", ActivePetSlotsCards["ActiveSlot"..i], ActivePetSlotsCards["ActiveSlot"..i], BackdropTemplateMixin and "BackdropTemplate");
				
				--		local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
				--		ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-(GlobalActiveSlotLoopValue)))-4);
				--		--ScrollFrameArrElem["ScrollElement"..i]:Hide();
				--	else


				
				
			
				
				
				
--						ScrollFrameArrElem["ScrollElement"..i] = CreateFrame("Frame", "ScrollElement"..i, ScrollFrameArrElem["ScrollElement0"], BackdropTemplateMixin and "BackdropTemplate");
						local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
						ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-(GlobalActiveSlotLoopValue+1)))-4);
					--end

				ScrollFrameArrElem["ScrollElement"..i]:SetSize(ElementSizeX,ElementSizeY);
			
				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnMouseDown", function() PetCardSelect(ScrollFrameArrElem["ScrollElement"..i]) SetSelectedHighlight() end);

	
				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnEnter", function(self) ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(1); currentHover = tonumber(i); PetMouseOver(ScrollFrameArrElem["ScrollElementChild"..i],self,false); end);
				ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnLeave", function(self) ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(0);  currentHover = tonumber(i); PetMouseOver(ScrollFrameArrElem["ScrollElementChild"..i],self,true); end);


--				ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseUp",function(self, button)
--																				if button == "LeftButton" and  self.isMoving then
--																					local slot = self:GetName();
--																					pet_On_Drop(currentHover);
--																					--pet_On_Drop(tonumber(string.sub(slot, 14)));																		
--																					self.isMoving = false;
--																				end
--				end);
	


				--ScrollFrameArrElem["ScrollElement"..i]:SetScript("OnDragStart", function() pet_On_Drag(ScrollFrameArrElem["ScrollElement"..i]["PetInfo"]["Slot"]) end);
	
	
			--end


	-- copypaste code below here
	


	
	ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseDown", function(self, button)
																	

																	if button == "LeftButton" and not self.isMoving then																	 
																		
																		
																		mousePos.x, mousePos.y = GetCursorPosition();
																		self.isLeftButtonDown = true;
																		
																		clickedScrollFrame = tonumber(i);
																	
																		
																	end
	end);


	ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnUpdate", function(self)
																	
																	if(self.tick == nil) then
																	self.tick = 0;
																	self.tickrate = 4;

																	end
																	local mousePosTempX, mousePosTempY = GetCursorPosition();

																	if(math.fmod(self.tick,self.tickrate) == 0) then
																		if(clickedScrollFrame ~= nil) then
																			if ((math.floor(mousePos.x*100) ~= math.floor(mousePosTempX*100)) or (math.floor(mousePos.y*100) ~= math.floor(mousePosTempY*100)) ) then
																			--print(mousePos.x, mousePos.y, mousePosTempX, mousePosTempY);
																			mousePos.x, mousePos.y = mousePosTempX, mousePosTempY;
																			ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].cursorMoved = true;
																			
																			else
																			--if(math.fmod(self.tick,self.tickrate) > 4) then
																			ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].cursorMoved = false;
																			--end
																			end
																	--print(mousePos.x.." - "..mousePos.y);
																	--print(mousePosTempX, mousePosTempY);
																			if(ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isLeftButtonDown and ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].cursorMoved and clickedScrollFrame ~= nil and ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving ~= true ) then
																			
																			pet_On_Drag(ScrollFrameArrElem["ScrollElementChild"..clickedScrollFrame]["PetInfo"]["Slot"]);
																			ShowEmptyStableSlotsOnDragOnly(true,"Down");
																			ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving = true;
																			end		
																		end
																	end
																	--print(self.cursorMoved);
																	self.tick = self.tick+1;
	end);
	
	ScrollFrameArrElem["ScrollElement"..i]:HookScript("OnMouseUp",function(self, button)

																	if button == "LeftButton" and ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving then
																		if(clickedScrollFrame ~= nil) then
																		local slot = self:GetName();
																		pet_On_Drop(currentHover);
																		
																		--pet_On_Drop(tonumber(string.sub(slot, 14)));
																		SubmitSearch(_G["StablesRightFrameEditBox"]);
																		ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isLeftButtonDown = false;																		
																		
																		ScrollFrameArrElem["ScrollElement"..clickedScrollFrame].isMoving = false;
																		clickedScrollFrame = nil;
																		ShowEmptyStableSlotsOnDragOnly(true,"Up");
																		end
																	end
																	clickedScrollFrame = nil;
																	clickedCardSocket = nil;

	end);
	
	
	--end






	--end
	--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement"..(i-1)]:GetPoint(1);
	
	
	
	
	--local bgfileid = select(7,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--local doesbgtile = select(9,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--	local insetspointR = select(1,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--		local insetspointT = select(2,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--			local insetspointL = select(4,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--				local insetspointB = select(7,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--local bgHeight = select(6,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--local bgWidth = select(3,C_Texture.GetAtlasInfo("PetList-ButtonBackground"));
	--ScrollFrameArrElem["ScrollElement"..i]:SetBackdrop({bgFile=bgfileid,
 --          edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=doesbgtile,tileSize=bgWidth,edgeSize=32,
 --          insets= {left=insetspointL,right=insetspointR,top=insetspointT,bottom=insetspointB}});   

		   --insets= {left=11,right=12,top=12,bottom=11}});   

	
	
	
 
end

	--local h1 = tonumber(select(3,ScrollFrameArrElem["ScrollElement"..1]:GetPoint(1)));
	--local h2 = tonumber(select(3,ScrollFrameArrElem["ScrollElement"..2]:GetPoint(1)));
	ScrollFrameArrElem["ScrollElementSizeY"] = ElementSizeY;
	ScrollFrameArrElem["ScrollElementSizeX"] = ElementSizeX;
	StablesRightFrame.ScrollFrame:SetScript("OnMouseWheel",NewScrollFrame_OnMouseWheel);
	
	
	
end

currentHover = 0;


function NewScrollFrame_OnMouseWheel(self,delta)
local valueScrollNew
	--Snap to n times height of content frame on mouse wheel input change
	if(delta > 0) then
	valueScrollNew = self:GetVerticalScroll() - (ScrollFrameArrElem["ScrollElementSizeY"]);
	else
	valueScrollNew = self:GetVerticalScroll() + (ScrollFrameArrElem["ScrollElementSizeY"]);
	end

	--If new value is not n times height of contents, then regulate to nearest. Can happen after scroll thumb mouse drag.
	if(valueScrollNew % ScrollFrameArrElem["ScrollElementSizeY"] ~= 0 ) then
		if(ScrollFrameArrElem["ScrollElementSizeY"] - valueScrollNew > 0) then
		valueScrollNew = valueScrollNew + valueScrollNew % ScrollFrameArrElem["ScrollElementSizeY"];
		else
		valueScrollNew = valueScrollNew - valueScrollNew % ScrollFrameArrElem["ScrollElementSizeY"];
		end
	end


if(valueScrollNew < 0) then
	valueScrollNew = 0;
elseif(valueScrollNew > self:GetVerticalScrollRange()) then
	valueScrollNew = self:GetVerticalScrollRange();
end

	self:SetVerticalScroll(valueScrollNew);
end

local backupAttempt = false;



function SetPetScrollTilesContent(filtermode)

	if(ScrollFrameArrElem == nil) then
		print("No Scroll Tiles were instantiated in: ScrollFrameArrElem[]: Trying again!");
		if(backupAttempt == false) then
		PopulateScrollFrame();
		PopulateActiveCards();
		backupAttempt = true;
		end

		return;
	end
	
if(filtermode == "default" or filtermode == nil) then
	
	
for i=1, StablesCollectionScrollbarMaxChildren,1 do 
	
	

	
	--local button = _G["PetStableStabledPet"..i];
	local petSlot = i;
	local petisStabled = nil;
		if(i < 6) then
		petSlot = PetStable_GetPetSlot(i, true);
		petisStabled = false;
		else
		petSlot = (i - 5);
		petisStabled = true;
		end

	local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
	
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] = {};
	
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] = l_icon;
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] = l_name;
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["level"] = l_level;
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"] = l_family;
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] = l_talent;	
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"] = i;
--	-- custom info

--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = false;
--	ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] = petisStabled;

		
		if(i < 6) then
			--if(iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(ScrollFrameArrElem["ScrollElementChild"..i] == nil) then
					ScrollFrameArrElem["ScrollElementChild"..i] = {};
				end
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] = {};
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["icon"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["name"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["level"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["family"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["talent"];
			-- custom info
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["favourite"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["inStables"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["Slot"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["abilities"];
			--end
		else
			
			if(ScrollFrameArrElem["ScrollElementChild"..i] == nil) then
				ScrollFrameArrElem["ScrollElementChild"..i] = {};
			end
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] = {};
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["icon"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["name"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["level"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["family"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["talent"];
			-- custom info
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["favourite"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["inStables"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["Slot"];
		ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["abilities"];
		
		end


		




	--if(i < GlobalActiveSlotLoopValue) then

		--if(iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
	
	--	end
	

--	else
	-- setUp Frame

		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"] == nil) then 
		--	if(iStableMasterOptionsDB["ScrollList"]["HideEmptyStableSlots"]) then
			--	if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] ~= nil) then
					ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement"..i], BackdropTemplateMixin and "BackdropTemplate");
			--	end

		--	else
		--		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement"..i], BackdropTemplateMixin and "BackdropTemplate");
				--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement"..i], "HunterPetListButtonTemplate");
			--end
		end
	
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:SetBackdrop({bgFile="Interface\\AddOns\\iStableMaster\\PetStable-Partsbuttonbg",
		--         edgeFile="Interface\\AddOns\\ZurichosUI\\UI-DialogBox-Border-ZurichoUISilver1", tile=false,tileSize=64,edgeSize=32,
		--         insets= {left=11,right=12,top=12,bottom=11}});

		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:SetSize(44,44);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:SetPoint("TOPLEFT",ScrollFrameArrElem["ScrollElement"..i],"TOPLEFT");

	
		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] ~= nil and ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] ~= "N/A") then
			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"] == nil) then
				ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:CreateTexture(nil,"ARTWORK");
				
			end
			if(ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"] == nil) then
			ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:CreateTexture(nil,"OVERLAY");
			end
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture(nil);
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetTexture(nil);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(0,0,0,0);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAlpha(1);
		
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"]);
		if(IsExotic(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"]))then
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetAlpha(1);
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetTexture("Interface\\COMMON\\FavoritesIcon");
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetVertexColor(0.5,0.1,1,1);
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetSize(36,36);
		ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"],"CENTER",14,8);
		--ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetFrameLevel(2030);
		end
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetFrameLevel(2020);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetSize(40,40);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAllPoints(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"],"CENTER");

		else
			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"] == nil) then
				ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:CreateTexture(nil,"ARTWORK");
			end
			if(ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"] == nil) then
			ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]:CreateTexture(nil,"OVERLAY");
			end
			ScrollFrameArrElem["ScrollElementChild"..i]["ExoticIconTexture"]:SetTexture(nil);
			ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture(nil);
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(nil);
			ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAlpha(1);
			ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture("Interface\\AddOns\\iStableMaster\\PetStable-Partsbuttonbg");
				
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture("Interface\\PetStableFrame\\PetStable-Parts");
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(1,1,1,1);
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexCoord(0.5,0.080078125,0,0.5,0,0.5,0,0.080078125);
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
			ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetSize(40,40);
			ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"],"CENTER");



		end
	
		
		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"] == nil) then 
			--print("line513: "..i);
			ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement"..i], BackdropTemplateMixin and "BackdropTemplate");
			--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"] = CreateFrame("Frame", nil, ScrollFrameArrElem["ScrollElement"..i], "HunterPetListButtonTemplate");
		end
	
		--[[ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:SetBackdrop({bgFile="",
		       edgeFile="", tile=false,tileSize=64,edgeSize=32,
			   insets= {left=11,right=12,top=12,bottom=11}});
				]]
		--print("line522: "..i);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:SetSize(ScrollFrameArrElem["ScrollElement"..i]:GetWidth()-44,46);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:SetPoint("TOPLEFT",ScrollFrameArrElem["ScrollElement"..i],"TOPLEFT",40,0);


	
		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"] == nil) then
			ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:CreateTexture(nil,"BACKGROUND");
		end

		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"] == nil) then
			ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal"); 
		end

		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:SetSize(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:GetWidth(),46);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:SetPoint("TOPLEFT", ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"],"TOPLEFT",4,0);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:SetText(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"]);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:SetWidth(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]["PetName"]:GetStringWidth());
	


		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetTexture(nil);
		
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetAlpha(1);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetAtlas("PetList-ButtonBackground");
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetSize(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:GetSize());
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAllPoints(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"],"CENTER");
		if(IsExotic(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"]))then
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(1,0,1,1);
		elseif (i <= 5) then
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(GetDBColour("Default","LightGreen"));
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(0,1,0,1);
		elseif (i == 6 and GlobalSpecialization == "Beast Mastery") then
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(0,0,1,1);
		elseif (ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"]) then
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(1,1,0,1);

		
		else


		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureBg"]:SetVertexColor(0.5,0.5,0.5,1);
		end
	
		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"] == nil) then
			ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:CreateTexture(nil,"OVERLAY",nil,2);
		end
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetTexture(nil);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(nil);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(0);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAtlas("PetList-ButtonHighlight");
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexture("Interface\\PetStableFrame\\PetStable-Parts");
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(1,1,1,1);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetTexCoord(0.5,0.080078125,0,0.5,0,0.5,0,0.080078125);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetSize(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:GetSize());
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"],"CENTER");

		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"] == nil) then
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"] = ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:CreateTexture(nil,"OVERLAY");
		end
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"]:SetTexture(nil);
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(0,0,0,0);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"]:SetAlpha(0);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"]:SetAtlas("PetList-ButtonSelect");
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"]:SetSize(ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"]:GetSize());
		--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAllPoints(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]);
		ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureSelected"]:SetPoint("CENTER",ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorFrame"],"CENTER");

		
		SetPetSpecIcon(i);
		 
	--end
	
end



	
	--LoadPetInfoFromWTF(ScrollFrameArrElem,"ScrollElementChild");

elseif(filtermode == "Family") then --[[ should be a table in future]]

	--LoadPetInfoFromWTF(ScrollFrameArrElem,"ScrollElementChild");

	-- Do Filters here:



else


end


if(_G["StablesRightFrameEditBox"]:GetText() ~= nil) then
	SubmitSearch(_G["StablesRightFrameEditBox"]);
elseif(iStableMasterOptionsDB["ScrollList"]["HideEmptyStableSlots"]) then
	if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
	else
	--MoveEmptySlotsToBottomOfScroll();
	--HideEmptyScrollSlots();
	MasterFilterSort();
	end

else
		if(GlobalActiveSlotLoopValue == 5) then
		--ReOrderScrollFrame("default");
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
				MasterFilterSort();
			end
		else
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
				MasterFilterSort();
				--ReOrderScrollFrame("default"); 
				--ReOrderScrollFrame("newTalents",1); 
			end
		end
	
end

end

 



--[[
StablesLeftFrame:SetBackdrop({bgFile="Interface\\DRESSUPFRAME\\DressingRoomHunter",
           edgeFile="Interface\\CHARACTERFRAME\\UI-Party-Border", tile=false,tileSize=256,edgeSize=16,
           insets= {left=9,right=6,top=9,bottom=9}});         
	]]	   

--OpenStablesButton:HookScript("OnClick",StablesOpen);

function OpenStablesButton_OnClick()

StablesOpen();

end



function StablesOpen()
local point, relativeTo, relativePoint, xOfs, yOfs = PetStableFrame:GetPoint(1);

						

		

	  if(xOfs == -500) then
	--if(PetStableFrame:IsShown() ~=true) then

		--ShowUIPanel(PetStableFrame);
		PetStableFrame:SetPoint("TOPLEFT",StablesCollection:GetParent():GetWidth()+50,-154);

	else

		--HideUIPanel(PetStableFrame);
		PetStableFrame:SetPoint("TOPLEFT",-500,-204);

	end
end

function OnSearchSubmit() 
	
	_G["StablesRightFrameEditBox"]:HookScript("OnEnterPressed", function(self) 
	SubmitSearch(self); -- this bit may fuck up future options as it calls default sorting
	


	end);
	_G["StablesRightFrameEditBox"]:HookScript("OnEditFocusGained", function(self) 
	local input = self:GetText();
	if(inpput == "" or input == nil or input == "Search") then
	self:SetText("");
	self:SetTextColor(hex2rgb("#FFFFFF"));
	-- insert clear button :Hide();
	end

	end);
	_G["StablesRightFrameEditBox"]:HookScript("OnEditFocusLost", function(self) 
	local input = self:GetText();
	if(input == nil or input == "") then
	SubmitSearch(self);  -- this bit may fuck up future options as it calls default sorting
	self:SetText("Search");
	self:SetTextColor(hex2rgb("#A9A9A9"));
	else
	self:SetTextColor(hex2rgb("#FFFFFF"));
	-- insert clear button :Show();
	end

	end);
	_G["StablesRightFrameEditBox"]:HookScript("OnEscapePressed", function(self)
	--if pcall(function(self) local input = self:GetText() end) then 
	local input = self:GetText();
	--else
	--local input = "";
	--end
	if(not(input == "Search" or input == nil or input == "")) then
		self:SetText(self.lastSearchSubmitted);
		SubmitSearch2(self,self.lastSearchSubmitted);

	else
		self:SetText("");
		SubmitSearch(self); -- this bit may fuck up future options as it calls default sorting		
	end

	end);

end




function SubmitSearch(self) 
	--if pcall(self:GetText()) then 
	--	local input = self:GetText();
	--	local startOfString, endOfString = string.find(input,input);
	--else
	--	local input = "";
	--	local startOfString = 0;
	--	local endOfString = 0;
	--end
	local input = self:GetText();
	local startOfString, endOfString = string.find(input,input);
	if(endOfString < 1 or endOfString == nil) then
--	ReOrderScrollFrame("default");
		if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
		else
				MasterFilterSort(input);
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
		end
	else 
	
	--ReOrderScrollFrame("searchString",input);
	MasterFilterSort(input);
	end   
	self:ClearFocus();
	if(input == nil or input == "") then
	self:SetText("Search");
	self:SetTextColor(hex2rgb("#A9A9A9"));
	end
	self.lastSearchSubmitted = input;
end

function SubmitSearch2(self,input) 
	--if pcall(self:GetText()) then 
	--	local input = self:GetText();
	--	local startOfString, endOfString = string.find(input,input);
	--else
	--	local input = "";
	--	local startOfString = 0;
	--	local endOfString = 0;
	--end
	
	local startOfString, endOfString = string.find(input,input);
	if(endOfString < 1 or endOfString == nil) then
	--ReOrderScrollFrame("default");
		if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				MasterFilterSort(input);
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
			end
	else 
	--ReOrderScrollFrame("searchString",input);
	MasterFilterSort(input);
	end   
	self:ClearFocus();
	if(input == nil or input == "") then
	self:SetText("Search");
	self:SetTextColor(hex2rgb("#A9A9A9"));
	end
	self.lastSearchSubmitted = input;
end





function SetBgForStablesCollection()
			

			--DEPRECATED!
		--[[
		local collectionFrame = StablesCollection;

		collectionFrame:SetPoint("TOPLEFT", self:GetParent());
		collectionFrame:SetPoint("BOTTOMRIGHT", self:GetParent());
		--collectionFrame.stablescollectionbg.ModelR1C1:SetPoint("TOP", -238, -85);
		--collectionFrame.stablescollectionbg.SlotsFrame:Show();
		collectionFrame.stablescollectionbg.BGCornerTopLeft:Hide();
		collectionFrame.stablescollectionbg.BGCornerTopRight:Hide();
		--collectionFrame.stablescollectionbg.WeaponDropDown:SetPoint("TOPRIGHT", -6, -22);
		--collectionFrame.stablescollectionbg.NoValidItemsLabel:Hide();
		--collectionFrame.FilterButton:SetText(FILTER);
		]]
end


--SetBgForStablesCollection();



--[[ GUIDE
function MountJournal_OnShow(self)
	MountJournal_FullUpdate(self);
	MountJournal_UpdateEquipment(self);
	self:GetParent():SetPortraitToAsset("Interface\\Icons\\MountJournalPortrait");

	local hasPendingItem = MountJournal_HasPendingMountEquipment(self);
	self.SlotButton:SetPendingApply(hasPendingItem);
	self.SlotButton.NewAlert:ValidateIsShown();
	EventRegistry:TriggerEvent("MountJournal.OnShow");
end


]]



function StablesCollection_Show()



StablesCollection:Show();
if (firstOpen) then 
InitPetInfoToWTF();
SavePetInfoToWTF();
PopulateCardContainer();
PopulateActiveCards();
PopulateScrollFrame();
UpdateActiveCards();
StablesLeftFrame:SetBackdrop("Interface\\DRESSUPFRAME\\DressingRoomHunter"); -- Set The Backdrop of the 3D-model to the selected file.
iStableMaster_hookOnDrag();
firstOpen = false;

end
	


PopulateCardContainer();
PopulateActiveCards();
UpdateActiveCards();
ActiveCardsContainerBg:SetVertexColor(GetDBColour("Default","LightGreen"));
	StablesCollection:SetParent(CollectionsJournal);
	StablesCollection:ClearAllPoints();
	StablesCollection:SetAllPoints();
CollectionsJournal:SetTitle(C_STABLES_COLLECTION["Title"]);
CollectionsJournal:SetPortraitToAsset("Interface\\Icons\\Ability_Physical_Taunt");
StablesToggleButtonTextUpdate();
--StablesCollectionFrame_SetContainer(StablesCollection);
--PetModel:SetModel(GetStablePetInfo(1))

CollectionsJournal:SetAttribute("UIPanelLayout-width", 1000);
CollectionsJournal:SetWidth(1000);
UpdateScrollFrameWidths(StablesRightFrame.ScrollFrame:GetWidth());
--SetPetScrollTilesContent();

PopulateScrollFrame();

SetPetScrollTilesContent();
SetSelectedHighlight()
SetPetModelView();
--EventRegistry:TriggerEvent("StablesCollection.OnShow")
if(not IsAtStableMaster()) then
		OpenStablesButton:Disable();
		OpenStablesButton:SetText("Stable Disabled");
	end
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else	
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();	 
				MasterFilterSort();
			end
end

function SetPetModelView() 
local namelengthDefault = 14;

StablesCollection.StablesLeftFrame:SetBackdrop({bgFile="Interface\\DRESSUPFRAME\\DressingRoomHunter",
           edgeFile="", tile=false,tileSize=264,edgeSize=32,
           insets= {left=3,top=3,right=-18,bottom=-9}});   --5,5

local firstIndex=1;
if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
	firstIndex = GlobalActiveSlotLoopValue + 1;
end



if(ScrollFrameArrElem["ScrollElement"..firstIndex] ~= nil) then

local fname = ScrollFrameArrElem["ScrollElement"..firstIndex]:GetName();
else
local fname = ActivePetSlotsCards["ActiveSlot"..firstIndex]["Socket"..firstIndex]:GetName();
namelengthDefault = 17;
end

if(CurrentlySelectedPet ~= nil) then
fname = CurrentlySelectedPet:GetName();

if(string.find(fname,"Socket") ~= nil) then
local startOfSocket, placeToSplit = string.find(fname,"Socket");
--print(placeToSplit + 1);
namelengthDefault = placeToSplit + 1;
elseif(string.find(fname,"ScrollElementChild") ~= nil) then
local startOfSocket, placeToSplit = string.find(fname,"ScrollElementChild");

namelengthDefault = placeToSplit + 1;
else

end
end




if(ScrollFrameArrElem["ScrollElement"..firstIndex] ~= nil and namelengthDefault==14) then





local indexNumber = 1;
if(fname ~= nil) then
indexNumber = tonumber(string.sub(fname, namelengthDefault));
end
local petSlot = nil;





if(ScrollFrameArrElem["ScrollElementChild"..indexNumber] ~= nil)then
petSlot = tonumber(ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["Slot"]);

end
local icon = nil;
local name = nil;
if(ScrollFrameArrElem["ScrollElementChild"..indexNumber] ~= nil)then
icon = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["icon"];
name = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["name"];

end
if(icon == nil or icon == "N/A") then
CollectionsPetStableModel:ClearModel();
--StablesCollection.StablesLeftFrame:SetBackdrop({bgFile="Interface\\DRESSUPFRAME\\DressingRoomHunter",
--           edgeFile="", tile=false,tileSize=264,edgeSize=32,
--           insets= {left=10,right=0,top=9,bottom=2}});
else
SetPetStablePaperdoll(CollectionsPetStableModel, petSlot);
end

else


local indexNumber = 1;
if(fname ~= nil) then
indexNumber = tonumber(string.sub(fname, namelengthDefault));
end

local petSlot = nil;
if(ActivePetSlotsCards["ActiveSlot"..indexNumber] ~= nil)then
petSlot = tonumber(ActivePetSlotsCards["ActiveSlot"..indexNumber]["PetInfo"]["Slot"]);

end
local icon = nil;
local name = nil;
if(ActivePetSlotsCards["ActiveSlot"..indexNumber] ~= nil)then
icon = ActivePetSlotsCards["ActiveSlot"..indexNumber]["PetInfo"]["icon"];
name = ActivePetSlotsCards["ActiveSlot"..indexNumber]["PetInfo"]["name"];

end
if(icon == nil or icon == "N/A") then
CollectionsPetStableModel:ClearModel();
--StablesCollection.StablesLeftFrame:SetBackdrop({bgFile="Interface\\DRESSUPFRAME\\DressingRoomHunter",
--           edgeFile="", tile=false,tileSize=264,edgeSize=32,
--           insets= {left=10,right=0,top=9,bottom=2}});
else
--print("Should show model");
SetPetStablePaperdoll(CollectionsPetStableModel, petSlot);
end
end
end


function StablesCollection_Hide()

PetStableFrame:SetPoint("TOPLEFT",-500,-204);
StablesToggleButtonTextUpdate();
CollectionsJournal:SetAttribute("UIPanelLayout-width", 703);
CollectionsJournal:SetWidth(703);
UpdateScrollFrameWidths(StablesRightFrame.ScrollFrame:GetWidth());
StablesCollection:Hide();
--EventRegistry:TriggerEvent("StablesCollection.OnHide")

end

function StablesCollection_OnLoad_CVSix()
-- DEPRECATED
if (tonumber(GetCVar("petJournalTab")) == 6) then
	self:GetParent():SetTitle("Stables");
	self:GetParent():SetPortraitToAsset("Interface\\Icons\\Ability_Physical_Taunt");
	StablesCollection_Show();
end

end



--FrameLeftFrame:SetAttribute("inherit",BackdropTemplateMixin and "BackdropTemplate");

--StablesCollection:HookScript("OnLoad", print((GetCVar("petJournalTab"))));
--[[
function StablesLeftFrame_OnLoad()
	
end

function Frame1_OnLoad()
	
end
]]
--[[
function StablesCollectionFrame_SetContainer(parent)
	local collectionFrame = StablesCollection;
	collectionFrame:SetParent(parent);
	collectionFrame:ClearAllPoints();
	if ( parent == self:GetParent() ) then
		collectionFrame:SetPoint("TOPLEFT", self:GetParent());
		collectionFrame:SetPoint("BOTTOMRIGHT", self:GetParent());
		collectionFrame.ItemsCollectionFrame.ModelR1C1:SetPoint("TOP", -238, -85);
		collectionFrame.ItemsCollectionFrame.SlotsFrame:Show();
		collectionFrame.ItemsCollectionFrame.BGCornerTopLeft:Hide();
		collectionFrame.ItemsCollectionFrame.BGCornerTopRight:Hide();
		collectionFrame.ItemsCollectionFrame.WeaponDropDown:SetPoint("TOPRIGHT", -6, -22);
		collectionFrame.ItemsCollectionFrame.NoValidItemsLabel:Hide();
		collectionFrame.FilterButton:SetText(FILTER);
		collectionFrame.ItemsTab:SetPoint("TOPLEFT", 58, -28);
		--WardrobeCollectionFrame_SetTab(collectionFrame.selectedCollectionTab);
]]	--[[
	elseif ( parent == WardrobeFrame ) then
		collectionFrame:SetPoint("TOPRIGHT", 0, 0);
		collectionFrame:SetSize(662, 606);
		collectionFrame.ItemsCollectionFrame.ModelR1C1:SetPoint("TOP", -235, -71);
		collectionFrame.ItemsCollectionFrame.SlotsFrame:Hide();
		collectionFrame.ItemsCollectionFrame.BGCornerTopLeft:Show();
		collectionFrame.ItemsCollectionFrame.BGCornerTopRight:Show();
		collectionFrame.ItemsCollectionFrame.WeaponDropDown:SetPoint("TOPRIGHT", -32, -25);
		collectionFrame.FilterButton:SetText(SOURCES);
		collectionFrame.ItemsTab:SetPoint("TOPLEFT", 8, -28);
		WardrobeCollectionFrame_SetTab(collectionFrame.selectedTransmogTab);
		]]
--[[	end
	collectionFrame:Show();
end
]]


function UpdateScrollFrameWidths(newWidth)
	PopulateScrollFrame();
	SetPetScrollTilesContent();


	for i=0,StablesCollectionScrollbarMaxChildren, 1 do 
	
	if(i==0) then
	ScrollFrameArrElem["ScrollElement"..i]:SetWidth(newWidth+8);
	else 
	if(ScrollFrameArrElem["ScrollElement"..i] ~= nil) then
	ScrollFrameArrElem["ScrollElement"..i]:SetWidth(newWidth);
	end
	end
	end
	--local h1 = tonumber(select(3,ScrollFrameArrElem["ScrollElement"..1]:GetPoint(1)));
	--local h2 = ronumber(select(3,ScrollFrameArrElem["ScrollElement"..2]:GetPoint(1)));

	


end


function RelocateCard() 



end

CurrentlySelectedPet = nil;


function PetCardSelect(caller)

CurrentlySelectedPet = caller;

SetPetModelView();
end


function StablesToggleButtonTextUpdate() 

local point, relativeTo, relativePoint, xOfs, yOfs = PetStableFrame:GetPoint(1);
 if(not IsAtStableMaster()) then
		OpenStablesButton:Disable();
		OpenStablesButton:SetText("Stable Disabled");
 else


if(xOfs == -500) then
OpenStablesButton:SetText("Hide Stables");

else
OpenStablesButton:SetText("Show Stables");

end
end

end


--hooksecurefunc("self:GetParent()_OnShow", function() StablesToggleButtonTextUpdate(); if(tonumber(GetCVar("petJournalTab")) == 6) then self:GetParent():SetPortraitToAsset("Interface\\Icons\\Ability_Physical_Taunt"); end  end);


function CollectionsPetStableModelShadow_OnLoad()
	
end



function PopulateCardContainer()

	if(ActivePetSlotsCards ~= nil)then
	return;
	end

	ActivePetSlotsCards = {};

	local ElementSizeX = 180;
--	local ElementSizeY = 167;
	local ElementSizeY = 187; -- experimental
	local PaddingX = ElementSizeX + 8;
	local PaddingY = ElementSizeY + 2; 
	local mousePos = {x=0,y=0};

	for i=1,6,1 do
	ActivePetSlotsCards["ActiveSlot"..i] = {};
	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i] = CreateFrame("Frame", "ActiveSlotSocket"..i,CardContainerFrame,"HunterPetCardBgTemplate")
	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetSize(ElementSizeX,ElementSizeY);
	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetBackdrop({bgFile="Interface\\AddOns\\iStableMaster\\BestiaAzerothica_CardBackground2",
           edgeFile="", tile=false,tileSize=167,edgeSize=32,
           insets= {left=8,right=8,top=8,bottom=8}});

	if(i<6)then
		if(IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]))then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetBackdropColor(GetDBColour("Default","DarkGreen"));
		end
	elseif(GlobalSpecialization == "Beast Mastery")then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetBackdropColor(GetDBColour("Default","DarkGreen"));

	else

	
	end


	if(i < 3)then
		if(i == 1) then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPLEFT",_G["CardContainerFrame"],"TOPLEFT", 4, -2)
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPRIGHT", CardContainerFrame, "TOPRIGHT", -4, -2)
		end
	elseif(i < 5)then
		if(i == 3) then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPLEFT", CardContainerFrame,"TOPLEFT", 4, -(PaddingY) + 11 )
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPRIGHT", CardContainerFrame,"TOPRIGHT", -4, -(PaddingY) + 11)
		end
	elseif(i < 7)then
		if(i == 5) then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPLEFT", CardContainerFrame,"TOPLEFT", 4, -(PaddingY * 2) + 22)
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetPoint("TOPRIGHT", CardContainerFrame,"TOPRIGHT", -4, -(PaddingY * 2) + 22)
		end
	end
	local spellKnown = false;
	if(i < 6) then
	 spellKnown = IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]);
	else
	
		if(GlobalSpecialization == "Beast Mastery")then
		spellKnown = select(4,GetTalentInfoBySpecialization(1, 1, 2));
		else
		spellKnown = false;
		end

	end

	if(spellKnown)then
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnMouseDown", function()  end);

		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnEnter", function() 
																--ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(1); 
																currentHover = tonumber(i);
																
		end);

		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnLeave", function(self)
																--ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(0); 
																currentHover = nil;
		end);
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i].tickrate = 4;
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i].tick = 0;
		--ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i].cursorMoved = false;
	
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnMouseDown", function(self, button)
																	PetCardSelect(ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]);
																	SetSelectedHighlight();

																	if button == "LeftButton" and not self.isMoving then																	 
																		 
																		--print(mousePos);
																		--print(mousePosTempX, mousePosTempY);
																		mousePos.x, mousePos.y = GetCursorPosition();
																		self.isLeftButtonDown = true;
																		
																		clickedCardSocket = tonumber(i);
																	
																		
																	end
	end);
	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnLoad", function(self) 
	
																		self.tick = 0;
																		self.tickrate = 4;
	end);

	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnUpdate", function(self)
																	
																	if(self.tick == nil) then
																	self.tick = 0;
																	self.tickrate = 4;

																	end
																	local mousePosTempX, mousePosTempY = GetCursorPosition();

																	if(math.fmod(self.tick,self.tickrate) == 0) then
																		if(clickedCardSocket ~= nil) then
																			if ((math.floor(mousePos.x*100) ~= math.floor(mousePosTempX*100)) or (math.floor(mousePos.y*100) ~= math.floor(mousePosTempY*100)) ) then
																			--print(mousePos.x, mousePos.y, mousePosTempX, mousePosTempY);
																			mousePos.x, mousePos.y = mousePosTempX, mousePosTempY;
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved = true;
																			
																			else
																			--if(math.fmod(self.tick,self.tickrate) > 4) then
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved = false;
																			--end
																			end
																	--print(mousePos.x.." - "..mousePos.y);
																	--print(mousePosTempX, mousePosTempY);
																			if(ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isLeftButtonDown and ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved and clickedCardSocket ~= nil and ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving ~= true ) then
																			
																			pet_On_Drag(ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["PetInfo"]["Slot"]);
																			
																			ShowEmptyStableSlotsOnDragOnly(true,"Down");
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving = true;
																			end		
																		end
																	end
																	--print(self.cursorMoved);
																	self.tick = self.tick+1;
	end);
	
	ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnMouseUp",function(self, button)
																	if button == "LeftButton" and ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving then
																		if(clickedCardSocket ~= nil) then
																		local slot = self:GetName();
																		pet_On_Drop(currentHover);
																		
																		SubmitSearch(_G["StablesRightFrameEditBox"]); 
																		--pet_On_Drop(tonumber(string.sub(slot, 14)));
																		
																		ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isLeftButtonDown = false;																		
																		
																		ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving = false;
																		clickedCardSocket = nil;
																		ShowEmptyStableSlotsOnDragOnly(true,"Up");
																		end
																	end
																	clickedCardSocket = nil;
																	clickedScrollFrame = nil;
	end);
	else
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnMouseDown", function() 
																	
		
		end);

		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnUpdate", function(self)
																	
																	if(self.tick == nil) then
																	self.tick = 0;
																	self.tickrate = 4;

																	end
																	local mousePosTempX, mousePosTempY = GetCursorPosition();

																	if(math.fmod(self.tick,self.tickrate) == 0) then
																		if(clickedCardSocket ~= nil) then
																			if ((math.floor(mousePos.x*100) ~= math.floor(mousePosTempX*100)) or (math.floor(mousePos.y*100) ~= math.floor(mousePosTempY*100)) ) then
																			--print(mousePos.x, mousePos.y, mousePosTempX, mousePosTempY);
																			mousePos.x, mousePos.y = mousePosTempX, mousePosTempY;
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved = true;
																			
																			else
																			--if(math.fmod(self.tick,self.tickrate) > 4) then
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved = false;
																			--end
																			end
																	--print(mousePos.x.." - "..mousePos.y);
																	--print(mousePosTempX, mousePosTempY);
																			if(ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isLeftButtonDown and ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].cursorMoved and clickedCardSocket ~= nil and ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving ~= true ) then
																			--pet_On_Drag(ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["PetInfo"]["Slot"])
																			ActivePetSlotsCards["ActiveSlot"..clickedCardSocket]["Socket"..clickedCardSocket].isMoving = true;
																			end		
																		end
																	end
																	--print(self.cursorMoved);
																	self.tick = self.tick+1;
	end);


		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnEnter", function() 
																--ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(1); 
																currentHover = tonumber(i);
																
		end);

		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnLeave", function(self)
																--ScrollFrameArrElem["ScrollElementChild"..i]["PetSelectorTextureHover"]:SetAlpha(0); 
																currentHover = nil;
		end);
	
		ActivePetSlotsCards["ActiveSlot"..i]["Socket"..i]:SetScript("OnMouseUp",function(self, button)
																	if button == "LeftButton" then
																		ClearCursor();
																		
																	end
																	clickedCardSocket = nil;
																	clickedScrollFrame = nil;
	end);

	end

	end

	


end



function PopulateActiveCards()
		if(ActivePetSlotsCards == nil ) then 
		return;
		end
		


	for i=1,6,1 do
			if(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"] == nil) then
				ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"] = {};
			end
		if(i<6) then
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["icon"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["name"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["level"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["family"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["talent"];

		-- custom info
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["favourite"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["inStables"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["Slot"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["abilities"];
		elseif(i==6) then
		--print(i);

		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["icon"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["name"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["level"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["family"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["talent"];
		
		-- custom info
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["favourite"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["inStables"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["Slot"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["abilities"];
		end
	end
		--ActivePetSlotsCards["Cards"] = {};

	local ElementSizeX = 180;
--	local ElementSizeY = 167;
	local ElementSizeY = 187; -- experimental
	local PaddingX = ElementSizeX + 8;
	local PaddingY = ElementSizeY + 3; 
	if(ActivePetSlotsCards == nil)then
		--PopulateCardContainer();
		return;
		
	end
	
	if(ActivePetSlotsCards["ActiveSlot1"]["Card1"] ~= nil and (GlobalSpecialization == "Beast Mastery" and ActivePetSlotsCards["ActiveSlot6"]["Card6"] ~= nil))then
	
	ActivePetSlotsCards["ActiveSlot6"]["Card6"]["RequiresFrame"]:Hide();
	return;
	elseif ( GlobalSpecialization == "Beast Mastery" and ActivePetSlotsCards["ActiveSlot1"]["Card1"] ~= nil and ActivePetSlotsCards["ActiveSlot6"]["Card6"] == nil)then
		swappedToBMFirstTime = true;
		-- Initiate card 6 and only card 6
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6] = CreateFrame("Frame", "ActiveSlotCard"..6,_G["ActiveSlotSocket"..6],"HunterPetCardBgTemplate");
		
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]:SetSize(ElementSizeX,ElementSizeY);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]:SetBackdrop({bgFile="Interface\\AddOns\\iStableMaster\\BestiaAzerothica_CardBackground2",
--           edgeFile="", tile=false,tileSize=167,edgeSize=32,
--           insets= {left=8,right=8,top=8,bottom=8}});

--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]:SetBackdropColor(GetDBColour("Default","Blue"));
--		--ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]:SetAlpha(1);
--		-- RequiresFrame
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["AnimalCompanionIcon"] = ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:CreateTexture(nil,"ARTWORK",nil, 3);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["AnimalCompanionIcon"]:SetTexture("Interface\\ICONS\\ABILITY_HUNTER_BESTIALDISCIPLINE");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["AnimalCompanionIcon"]:SetSize(64,64);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["AnimalCompanionIcon"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..6]["Card"..6],"CENTER",0,-20);

--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"] = ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"]:SetPoint("TOP",ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"],"TOP",0,-16);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"]:SetSize(ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:GetWidth(),24);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"] = ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"]:SetPoint("TOP",ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"],"TOP",0,-42);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"]:SetSize(ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:GetWidth(),24);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"]:SetText("Requires: Specialization - Beast Mastery");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text1"]:SetTextColor(1,0,0,1);
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"]:SetText("Requires: Talent - Animal Companion");
--		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]["Text2"]:SetTextColor(1,0,0,1);
		
		
		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:Hide();
		return;

	elseif(swappedToBMFirstTime and GlobalSpecialization ~= "Beast Mastery") then
		ActivePetSlotsCards["ActiveSlot"..6]["Card"..6]["RequiresFrame"]:Show();
		return;

	elseif(ActivePetSlotsCards["ActiveSlot1"]["Card1"] ~= nil) then
		return;
	else

	end



	for i=1,6,1 do
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i] = CreateFrame("Frame", "ActiveSlotCard"..i,_G["ActiveSlotSocket"..i],"HunterPetCardBgTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetSize(ElementSizeX,ElementSizeY);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdrop({bgFile="Interface\\AddOns\\iStableMaster\\BestiaAzerothica_CardBackground2",
           edgeFile="", tile=false,tileSize=167,edgeSize=32,
           insets= {left=8,right=8,top=8,bottom=8}});
	if(GlobalSpecialization == "Beast Mastery") then 
	
		if(i<6) then
			if(IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]))then
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","LightGreen"));
			else
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","BlackTintedBlue"));
			end
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","Blue"));
		end
	elseif(i<6) then

		if(IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]))then
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","LightGreen"));
			else
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","BlackTintedBlue"));
			end
	else
		
		--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetBackdropColor(GetDBColour("Default","Blue"));
	
	
	end
	
	if(i < 3)then
		if(i == 1) then
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPLEFT",_G["ActiveSlotSocket"..i],"TOPLEFT", 0, 0)
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPRIGHT", _G["ActiveSlotSocket"..i], "TOPRIGHT", 0, 0)
		end
	elseif(i < 5)then
		if(i == 3) then
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPLEFT", _G["ActiveSlotSocket"..i],"TOPLEFT", 0, 0)
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPRIGHT", _G["ActiveSlotSocket"..i],"TOPRIGHT", 0, 0)
		end
	elseif(i < 7)then
		if(i == 5) then
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPLEFT", _G["ActiveSlotSocket"..i],"TOPLEFT", 0, 0)
		else
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:SetPoint("TOPRIGHT", _G["ActiveSlotSocket"..i],"TOPRIGHT", 0, 0)
		end
	end

	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:SetSize(32,32);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"TOPLEFT",6,-6);

	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]["Icon"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	
	
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:SetSize((ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetWidth()-ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:GetWidth()-18),32);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:GetWidth()+6,-6);

	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormalLarge"); 
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); 
	
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:CreateTexture(nil,"BACKGROUND",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"]:SetTexture("Interface\\AddOns\\iStableMaster\\HeaderShadeAndGlow.blp");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:GetWidth(),32);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"]:SetTexCoord(0.16,0.9,0.45,0.50);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"],"TOPLEFT",0,0);
		--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]["Icon"]:SetTexture(iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["icon"]);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["HeaderBg"]:SetAlpha(0.5);
	-- Abilities
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"] = CreateFrame("FRAME", nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i], BackdropTemplateMixin and "BackdropTemplate");	
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetWidth(),86);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"],"BOTTOMLEFT",0,-5);
		--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:SetPoint("BOTTOMRIGHT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"TOPRIGHT",0,-5); -- Diet Frame doesn't exist yet.
		-- Family Abilities
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"] = CreateFrame("FRAME", nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"], BackdropTemplateMixin and "BackdropTemplate");	
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:SetSize((ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:GetWidth()/2)-4,86);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"],"TOPLEFT",0,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:SetPoint("BOTTOMRIGHT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"],"BOTTOMRIGHT",-(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:GetWidth()/2)-2,0);
			
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:CreateTexture(nil,"BACKGROUND",nil,2);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:SetTexture("Interface\\AddOns\\iStableMaster\\HeaderShadeAndGlow.blp");
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:GetWidth(),24);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:SetTexCoord(0.16,0.9,0.45,0.50);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"],"TOPLEFT",4,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:SetAlpha(0.5);

			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); 
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"],"CENTER",-7,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:GetWidth()-14,ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["HeaderBg"]:GetHeight());
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"]:SetFont("Fonts\FRIZQT__.TFF",10,"MONOCHROME");
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"]:SetTextColor(GetDBColour("Default","Blue"));
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["Name"]:SetText("Family Abilities");

	
		-- Spec Abilities
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"] = CreateFrame("FRAME", nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"], BackdropTemplateMixin and "BackdropTemplate");	
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:SetSize((ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:GetWidth()/2)-8,86);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"],"TOPLEFT",(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:GetWidth()/2)+2,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:SetPoint("BOTTOMRIGHT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"],"BOTTOMRIGHT",0,0);
			
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:CreateTexture(nil,"BACKGROUND",nil,2);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetTexture("Interface\\AddOns\\iStableMaster\\HeaderShadeAndGlow.blp");
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:GetWidth(),24);
			--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetTexCoord(0.16,0.9,0.425,0.63);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetTexCoord(0.16,0.9,0.45,0.50);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"],"TOPLEFT",-4,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:SetAlpha(0.5);

			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormalSmall"); 
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"],"CENTER",-7,0);
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:GetWidth()-4,ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["HeaderBg"]:GetHeight());
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"]:SetFont("Fonts\FRIZQT__.TFF",10, "MONOCHROME");
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"]:SetTextColor(GetDBColour("Default","Blue"));
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["Name"]:SetText("Specialzation Abilities");
			
			
			
			local numabilities = StringKeyTableLengthI(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["talent"]);
			if numabilities < 2 then
			numabilities = 2; -- THIS is a fix for empty active slots on load, this may be an issue for family abilities too especially since they can vary in number, likewise this will be an issue 2 if there someday is a third spec ability.
			end

			for j=1, numabilities do
				local ofsx = 0;
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"], BackdropTemplateMixin and "BackdropTemplate");
				if(j == 1) then
					ofsx = -j*13;
				else
					ofsx = (j-1)*13;
				end
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"],"CENTER",ofsx,0);	
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]:SetSize(24,24);
				
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]:CreateTexture(nil,"ARTWORK",nil,2);
			end	

			local numfamabilities = StringKeyTableLengthI(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"]);
			if numfamabilities < 2 then
			numfamabilities = 2; -- THIS is a fix for empty active slots on load, this may be an issue for family abilities too especially since they can vary in number, likewise this will be an issue 2 if there someday is a third spec ability.
			end

			for j=1, numfamabilities do
				local ofsx = 0;
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"], BackdropTemplateMixin and "BackdropTemplate");
				if(j == 1) then
					ofsx = -j*13;
				else
					ofsx = (j-1)*13;
				end
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"],"CENTER",ofsx,0);	
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:SetSize(24,24);
				
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]["Texture"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:CreateTexture(nil,"ARTWORK",nil,2);
			end	


			
	-- Diets
			
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetWidth(),48);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"BOTTOMLEFT",0,54);
	
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"BACKGROUND",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:SetTexture("Interface\\AddOns\\iStableMaster\\HeaderShadeAndGlow.blp");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:SetSize((ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:GetWidth()-8),14);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:SetTexCoord(0.16,0.9,0.45,0.50);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:SetPoint("TOPLEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"TOPLEFT",12,13);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:SetAlpha(0.5);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal"); 
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"],"CENTER",-7,0);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["HeaderBg"]:GetSize());
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"]:SetFont("Fonts\FRIZQT__.TFF",14,"MONOCHROME");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"]:SetTextColor(GetDBColour("Default","Blue"));
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Name"]:SetText("Diet");


	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].breadFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");	
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].cheeseFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fishFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fruitFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fungusFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].meatFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].mechanicalBitsFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawFishFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:CreateTexture(nil,"ARTWORK",nil,2);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawMeatFrame = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"], BackdropTemplateMixin and "BackdropTemplate");


	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"] = CreateFrame("FRAME",  nil, ActivePetSlotsCards["ActiveSlot"..i]["Card"..i], BackdropTemplateMixin and "BackdropTemplate");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetWidth(),ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetHeight());
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"CENTER",0,0);
	
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Hide();


	if(i==6)then
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Show();
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:SetAlpha(0.5);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["AnimalCompanionIcon"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:CreateTexture(nil,"ARTWORK",nil, 3);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["AnimalCompanionIcon"]:SetTexture("Interface\\ICONS\\ABILITY_HUNTER_BESTIALDISCIPLINE");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["AnimalCompanionIcon"]:SetSize(64,64);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["AnimalCompanionIcon"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"CENTER",0,-20);

	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetPoint("TOP",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"],"TOP",0,-16);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:GetWidth(),24);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"]:SetPoint("TOP",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"],"TOP",0,-42);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:GetWidth(),24);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetText("Requires: Specialization - Beast Mastery");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetTextColor(1,0,0,1);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"]:SetText("Requires: Talent - Animal Companion");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text2"]:SetTextColor(1,0,0,1);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Hide();
	end
	if(i==6 and GlobalSpecialization ~= "Beast Mastery")then
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Show();

	end

	--selected highlight
	if(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"] == nil) then
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:CreateTexture(nil,"OVERLAY");
	end
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"]:SetTexture(nil);
	--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetColorTexture(0,0,0,0);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"]:SetAlpha(0);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"]:SetAtlas("PetList-ButtonSelect");
	--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:GetSize());
	--ScrollFrameArrElem["ScrollElementChild"..i]["PetIconTexture"]:SetAllPoints(ScrollFrameArrElem["ScrollElementChild"..i]["PetIconFrame"]);
	ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Selected"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i],"CENTER");

	--ActivePetSlotsCards["ActiveSlot"..indexNumber]["Card"..indexNumber]["Selected"]



	if(i < 6)then
		if(not IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]))then
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Show();

		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["LockIconIcon"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:CreateTexture(nil,"ARTWORK",nil, 3);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["LockIconIcon"]:SetTexture("Interface\\PETBATTLES\\PetBattle-LockIcon");
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["LockIconIcon"]:SetSize(64,64);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["LockIconIcon"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"],"CENTER",0,0);

		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"] = ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:CreateFontString(nil,"OVERLAY","GameFontNormal");
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetPoint("TOP",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"],"TOP",0,-16);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:GetWidth(),24);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetFont("Fonts\FRIZQT__.TTF", 12, "MONOCHROME");
		local SpellName, SpellRank, icon, castTime, minRange, maxRange = GetSpellInfo(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetText("Requires: "..SpellName);
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]["Text1"]:SetTextColor(1,0,0,1);
		end
	end


	end
	UpdateActiveCards();
	
	

end


function UpdateActiveCards() 
	
	if(ActivePetSlotsCards == nil) then
		--print("stack trace");
		return;
	end
	if(iStableMasterStableDB["PetInfo"]["ActiveSlot"..1]["icon"] == nil ) then 
	SavePetInfoToWTF()

	end

	for i=1,6,1 do
			if(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"] == nil) then
				ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"] = {};
			end
		if(i<6) then
--		if iStableMasterStableDB["PetInfo"]["ActiveSlot"..i] == nil then
--		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
			
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = l_icon;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = l_name;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = l_level;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = l_family;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = l_talent;

--			-- custom info
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = false;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = false;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = i;
--			local l_abilities = {talent, family, bonus}
--			l_abilities["talent"] = l_iStableMasterDB["SpecializationAbilities"][l_talent];
--			l_abilities["family"] = l_iStableMasterDB["FamilyAbilities"][l_family];
--			l_abilities["bonus"] = {"N/A"}; --iStableMasterDB["SpecializationAbilities"][l_talent]; 

--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = l_abilities;



--		else

			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["icon"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["name"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["level"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["family"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["talent"];

			-- custom info
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["favourite"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["inStables"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["Slot"];
			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["abilities"];
		--end

		elseif(i==6) then
		--print(i);


--		if iStableMasterStableDB["PetInfo"]["ActiveSlot"..i] == nil then
			
--			local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);
			
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = l_icon;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = l_name;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = l_level;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = l_family;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = l_talent;

--			-- custom info
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = false;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = false;
--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = i;
			
			
--			local l_abilities = {talent, family, bonus}

--			l_abilities["talent"] = l_iStableMasterDB["SpecializationAbilities"][l_talent];
--			l_abilities["family"] = l_iStableMasterDB["FamilyAbilities"][l_family];
--			l_abilities["bonus"] = {"N/A"}; --iStableMasterDB["SpecializationAbilities"][l_talent]; 

--			ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = l_abilities;



--		else
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["icon"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["name"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["level"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["family"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["talent"];
		
		-- custom info
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["favourite"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["inStables"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["Slot"];
		ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"] = iStableMasterStableDB["PetInfo"]["StableSlot"..1]["abilities"];

		--end

		end
		
		



		--BM frame
		local hasAnimalCompanionTalent = select(4,GetTalentInfoBySpecialization(1, 1, 2));
		if((GlobalSpecialization ~= "Beast Mastery" and i == 6) or (not hasAnimalCompanionTalent and GlobalSpecialization == "Beast Mastery" and i == 6)) then 
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:Hide();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:Hide();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:Hide();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:Hide();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Show();
		elseif(i == 6) then
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:Show();
		ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["RequiresFrame"]:Hide();


		end

		if(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] == nil or ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] == "N/A") then
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Hide();
			if(GlobalSpecialization ~= "Beast Mastery" and i == 6) then 
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Show();
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:Hide();
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:Hide();
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:Hide();
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:Hide();
			end
			if(i < 6)then
				if(not IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][i]))then
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Show();
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]:Hide();
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:Hide();
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]:Hide();
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]:Hide();
				end
			end
		else
			ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]:Show();
				if(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] ~= nil and ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"] ~= "N/A") then
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]["Icon"]:SetTexture(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["icon"]);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]["Icon"]:SetSize(32,32);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"]["Icon"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["IconFrame"],"CENTER");
						
				end
				if(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] ~= nil and ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"] ~= "N/A") then
				
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetFont("Fonts\FRIZQT__.TTF", 14);
						--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetSize(string.len(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"])*8,42);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:GetWidth()-8,42);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetJustifyH("LEFT");
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetTextHeight(16);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetPoint("LEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"],"LEFT",0,5);	
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetText(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["name"]);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["Name"]:SetTextColor(GetDBColour("Default","Blue"));
				
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetFont("Fonts\FRIZQT__.TTF", 8, "MONOCHROME");
						--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetSize(string.len(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"])*8,24);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]:GetWidth()-8,42);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetJustifyH("LEFT");
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetPoint("LEFT",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"],"LEFT",0,-10);	
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetText(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["family"]);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["NameFrame"]["FamilyName"]:SetTextColor(GetDBColour("Default","Blue"));

				end

				
					for j=1,StringKeyTableLengthI(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["talent"]) do
					local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["talent"][j])
					local ofsx = 0;
						if icon ~= nil and icon ~= "N/A" and icon ~= "" then
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"]:SetTexture(icon);
						
						
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"]:SetSize(24,24);
						
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"]:SetVertexColor(1,1,1,1);

						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]:HookScript("OnLeave",function(self)spellMouseOver(self,nil,true)end);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]:HookScript("OnEnter",function(self)spellMouseOver(self,ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["talent"][j],false)end);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j],"CENTER", 0, 0);
						--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"].tooltipname = "|cFFFF0000Bread";
						end
					end
					

					for j=1,StringKeyTableLength(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"],"SpellIcon") do
							local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"][j])
							if icon == nil then
							ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:Hide();
							else
							ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:Show();
							end
					end

					for j=1,StringKeyTableLengthI(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"]) do
					local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"][j])
					local ofsx = 0;
						if icon ~= nil and icon ~= "N/A" and icon ~= "" then
						if ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"][j] == nil then
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:Hide();
						else
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:Show();
						end

						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]["Texture"]:SetTexture(icon);
						
						
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]["Texture"]:SetSize(24,24);
						
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]["Texture"]:SetVertexColor(1,1,1,1);

						

						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:HookScript("OnLeave",function(self)spellMouseOver(self,nil,true)end);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]:HookScript("OnEnter",function(self)spellMouseOver(self,ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["abilities"]["family"][j],false)end);
						ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j]["Texture"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["FamilyFrame"]["SpellIcon"..j],"CENTER", 0, 0);
						--ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["Abilities"]["SpecFrame"]["SpellIcon"..j]["Texture"].tooltipname = "|cFFFF0000Bread";
						
						end
						
					end


				if(GetStablePetFoodTypes(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"])~= nil) then

				local dietXSize, dietYSize = 20,20; 
				local points = {};
				points["4;5 - Standard"] = {}
				points["4;5 - Standard"]["x"] =	{
				-(dietXSize*1.5),
				-(dietXSize*0.5),
				(dietXSize*0.5),
				(dietXSize*1.5),
				-(dietXSize*2),
				-(dietXSize*1),
				0,
				(dietXSize*1),
				(dietXSize*2),
				};
				points["4;5 - Standard"]["y"] = {
				(dietYSize*0.5),
				(dietYSize*0.5),
				(dietYSize*0.5),
				(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				};
				points["5;4 - Standard"] = {}
				points["5;4 - Standard"]["x"] =	{
				-(dietXSize*2),
				-(dietXSize*1),
				0,
				(dietXSize*1),
				(dietXSize*2),
				-(dietXSize*1.5),
				-(dietXSize*0.5),
				(dietXSize*0.5),
				(dietXSize*1),
				};
				points["5;4 - Standard"]["y"] = {
				(dietYSize*0.5),
				(dietYSize*0.5),
				(dietYSize*0.5),
				(dietYSize*0.5),
				(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				};

				points["9x1 - Standard"] = {} --Does not fit in width.
				points["9x1 - Standard"]["x"] =	{
				-(dietXSize*3.5),
				-(dietXSize*2.5),
				-(dietXSize*1.5),
				-(dietXSize*0.5),
				(dietXSize*0.5),
				(dietXSize*1.5),
				(dietXSize*2.5),
				(dietXSize*3.5),
				-(dietXSize*4.5),
				};
				points["9x1 - Standard"]["y"] = {
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				-(dietYSize*0.5),
				};

				local foodarrtype = "4;5 - Standard";
				--local foodarrtype = "5;4 - Standard";

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_08");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][1],points[foodarrtype]["y"][1]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"].tooltipname = "|cFFFF0000Bread";
				
				
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].breadFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].breadFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:GetPoint(1));


				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].breadFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].breadFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_04");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][2],points[foodarrtype]["y"][2]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"].tooltipname = "|cFFFF0000Cheese";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].cheeseFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].cheeseFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].cheeseFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].cheeseFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_75");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][3],points[foodarrtype]["y"][3]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"].tooltipname = "|cFFFF0000Fish";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fishFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fishFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fishFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fishFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"].tooltipname,false)end);
				
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_19");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][4],points[foodarrtype]["y"][4]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"].tooltipname = "|cFFFF0000Fruit";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fruitFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fruitFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fruitFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fruitFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetTexture("Interface\\ICONS\\INV_Mushroom_07");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][5],points[foodarrtype]["y"][5]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"].tooltipname = "|cFFFF0000Fungus";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fungusFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fungusFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fungusFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].fungusFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_18");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][6],points[foodarrtype]["y"][6]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"].tooltipname = "|cFFFF0000Meat";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].meatFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].meatFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].meatFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].meatFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetTexture("Interface\\ICONS\\INV_Misc_Gear_08");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][7],points[foodarrtype]["y"][7]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"].tooltipname = "|cFFFF0000Mechanical Bits";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].mechanicalBitsFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].mechanicalBitsFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].mechanicalBitsFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].mechanicalBitsFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetTexture("Interface\\ICONS\\INV_Misc_Fish_07");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][8],points[foodarrtype]["y"][8]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"].tooltipname = "|cFFFF0000Raw Fish";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawFishFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawFishFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawFishFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawFishFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"].tooltipname,false)end);

				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_72");
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetSize(dietXSize,dietYSize);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetVertexColor(0.5,0.5,0.5,0.2);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetPoint("CENTER",ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],"CENTER",points[foodarrtype]["x"][9],points[foodarrtype]["y"][9]);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"].tooltipname = "|cFFFF0000Raw Meat";
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawMeatFrame:SetSize(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:GetSize());
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawMeatFrame:SetPoint(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:GetPoint(1));
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawMeatFrame:HookScript("OnLeave",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],nil,true)end);
				ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"].rawMeatFrame:HookScript("OnEnter",function()dietMouseOver(ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"],ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"].tooltipname,false)end);

				local DietList = { GetStablePetFoodTypes(ActivePetSlotsCards["ActiveSlot"..i]["PetInfo"]["Slot"]) };
				
				for j=1,9,1 do
					if(DietList[j] == "Bread") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"].tooltipname = "|cFF00FF00Bread";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_08");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Bread"]:SetVertexColor(0.5,0.5,0.5,1);
					elseif(DietList[j] == "Cheese") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"].tooltipname = "|cFF00FF00Cheese";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_04");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Cheese"]:SetVertexColor(0.5,0.5,0.5,1);
					
					elseif(DietList[j] == "Fish") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"].tooltipname = "|cFF00FF00Fish";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_75");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fish"]:SetVertexColor(0.5,0.5,0.5,1);

					elseif(DietList[j] == "Fruit") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"].tooltipname = "|cFF00FF00Fruit";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_19");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fruit"]:SetVertexColor(0.5,0.5,0.5,1);
					
					elseif(DietList[j] == "Fungus") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"].tooltipname = "|cFF00FF00Fungus";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetTexture("Interface\\ICONS\\INV_Mushroom_07");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Fungus"]:SetVertexColor(0.5,0.5,0.5,1);

					elseif(DietList[j] == "Meat") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"].tooltipname = "|cFF00FF00Meat";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_18");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Meat"]:SetVertexColor(0.5,0.5,0.5,1);

					elseif(DietList[j] == "Mechanical Bits") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"].tooltipname = "|cFF00FF00Mechanical Bits";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetTexture("Interface\\ICONS\\INV_Misc_Gear_08");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Mechanical Bits"]:SetVertexColor(0.5,0.5,0.5,1);

					elseif(DietList[j] == "Raw Fish") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"].tooltipname = "|cFF00FF00Raw Fish";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetTexture("Interface\\ICONS\\INV_Misc_Fish_07");
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Fish"]:SetVertexColor(0.5,0.5,0.5,1);
					elseif(DietList[j] == "Raw Meat") then
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetTexture(nil);
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"].tooltipname = "|cFF00FF00Raw Meat";
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetTexture("Interface\\ICONS\\INV_Misc_Food_72");																								
					ActivePetSlotsCards["ActiveSlot"..i]["Card"..i]["DietFrame"]["Raw Meat"]:SetVertexColor(0.5,0.5,0.5,1);
					end
				end

			end

		end


	end

end


local currentlyActiveHighlight = nil;
function SetSelectedHighlight() 
local namelengthDefault = 14;
local firstIndex=1;
if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
	firstIndex = GlobalActiveSlotLoopValue + 1;
end

if(ScrollFrameArrElem["ScrollElement"..firstIndex] ~= nil) then

local fname = ScrollFrameArrElem["ScrollElement"..firstIndex]:GetName();
else
local fname = ActivePetSlotsCards["ActiveSlot"..firstIndex]["Socket"..firstIndex]:GetName();
namelengthDefault = 17;
end

if(CurrentlySelectedPet ~= nil) then
fname = CurrentlySelectedPet:GetName();

if(string.find(fname,"ActiveSlotSocket") ~= nil) then
local startOfSocket, placeToSplit = string.find(fname,"ActiveSlotSocket");
--print(placeToSplit + 1);
namelengthDefault = placeToSplit + 1;
elseif(string.find(fname,"ScrollElementChild") ~= nil) then
local startOfSocket, placeToSplit = string.find(fname,"ScrollElementChild");

namelengthDefault = placeToSplit + 1;
else

end
end



if(ScrollFrameArrElem["ScrollElement"..firstIndex] ~= nil) then


local indexNumber = 1;
if(fname ~= nil) then
indexNumber = tonumber(string.sub(fname, namelengthDefault));
end
local petSlot = nil;
if(ScrollFrameArrElem["ScrollElementChild"..indexNumber] ~= nil)then
petSlot = tonumber(ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["Slot"]);

end
local icon = nil;
local name = nil;



if(ScrollFrameArrElem["ScrollElementChild"..indexNumber] ~= nil)then
--icon = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["icon"];
--name = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["name"];

if(currentlyActiveHighlight ~= nil) then
if(currentlyActiveHighlight < GlobalActiveSlotLoopValue + 1) then
ActivePetSlotsCards["ActiveSlot"..currentlyActiveHighlight]["Card"..currentlyActiveHighlight]["Selected"]:SetAlpha(0);
else
ScrollFrameArrElem["ScrollElementChild"..currentlyActiveHighlight]["PetSelectorTextureSelected"]:SetAlpha(0);
end
end

if(indexNumber < GlobalActiveSlotLoopValue + 1) then
ActivePetSlotsCards["ActiveSlot"..indexNumber]["Card"..indexNumber]["Selected"]:SetAlpha(1);

else
ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetSelectorTextureSelected"]:SetAlpha(1);

end

currentlyActiveHighlight = indexNumber;
end


if(ScrollFrameArrElem["ScrollElementChild"..indexNumber] == nil)then
--icon = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["icon"];
--name = ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetInfo"]["name"];

if(currentlyActiveHighlight ~= nil) then
if(currentlyActiveHighlight < GlobalActiveSlotLoopValue + 1) then
ActivePetSlotsCards["ActiveSlot"..currentlyActiveHighlight]["Card"..currentlyActiveHighlight]["Selected"]:SetAlpha(0);
else
ScrollFrameArrElem["ScrollElementChild"..currentlyActiveHighlight]["PetSelectorTextureSelected"]:SetAlpha(0);
end
end

if(indexNumber < GlobalActiveSlotLoopValue + 1) then
ActivePetSlotsCards["ActiveSlot"..indexNumber]["Card"..indexNumber]["Selected"]:SetAlpha(1);

else
ScrollFrameArrElem["ScrollElementChild"..indexNumber]["PetSelectorTextureSelected"]:SetAlpha(1);

end

currentlyActiveHighlight = indexNumber;
end




if(icon == nil or icon == "N/A") then
--CollectionsPetStableModel:ClearModel();
--StablesCollection.StablesLeftFrame:SetBackdrop({bgFile="Interface\\DRESSUPFRAME\\DressingRoomHunter",
--           edgeFile="", tile=false,tileSize=264,edgeSize=32,
--           insets= {left=10,right=0,top=9,bottom=2}});
else
--SetPetStablePaperdoll(CollectionsPetStableModel, petSlot);
end


else




end



end


local noloop = true;

function pet_On_Drag(arg)
	
	PickupStablePet(arg);
	if(noloop) then
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				MoveOccupiedSlotsToBottomOfScroll(); 
			end
	noloop = false;
	end

end

function pet_On_Drop(arg)
	
	
	local cursorType, petSlot = GetCursorInfo();
				if (cursorType == "pet") then
					--print(arg);
					--- I need to update the presets here.
--						local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");
--						for i = 1, squadslimit do
--							for j = 1, 6 do
--								if(iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] == petSlot) then
--									iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] = arg;



--								end
--							end
--						end
						
					SetPetSlot(petSlot, arg);
					UpdateSquadCurrentSlots(petSlot,arg);
					UpdateFavStatus(petSlot,arg)


					ClearCursor();
					noloop = true;
				end


	
	
	

end

function UpdateFavStatus(origin,target)

local temp = false;
temp = ScrollFrameArrElem["ScrollElementChild"..origin]["PetInfo"]["favourite"];
ScrollFrameArrElem["ScrollElementChild"..origin]["PetInfo"]["favourite"] = ScrollFrameArrElem["ScrollElementChild"..target]["PetInfo"]["favourite"];
ScrollFrameArrElem["ScrollElementChild"..target]["PetInfo"]["favourite"] = temp;

end




function SetPetSpecIcon(petSlot) 

--local specindexName = ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetInfo"]["talent"];
local specindexName = select(5,GetStablePetInfo(petSlot));
local specIndex = 0;
if(specindexName == "Ferocity") then
specIndex = 1;

elseif(specindexName == "Tenacity") then
specIndex = 2;

elseif(specindexName == "Cunning") then
specIndex = 3;

end


local id, name, description, icon, background, role = GetSpecializationInfo(specIndex, false , true);

--236159
if(ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"] == nil) then
																		     
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"] = ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSelectorFrame"]:CreateTexture(nil, "ARTWORK");  
end
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetPoint("RIGHT", ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSelectorFrame"], "RIGHT", 0, 0);
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetSize(44,44); 
--ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetSize(88,44); 
--ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetTexCoord(0,1,0.25,0.75);
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetTexture(icon);
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetBlendMode("ADD");
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetAlpha(0.6);
ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetMask("Interface\\PETBATTLES\\PetBattle-SelectedPetGlow");

	if(ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetInfo"]["icon"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetInfo"]["icon"] == nil) then
	ScrollFrameArrElem["ScrollElementChild"..petSlot]["PetSpecializationIcon"]:SetAlpha(0);
	end
end


--/run ReOrderScrollFrame("searchString","Bane") 
--/run ScrollFrameArrElem["ScrollElementChild"..10]["PetInfo"]["favourite"] = true; ReOrderScrollFrame("favourites");
--/run ScrollFrameArrElem["ScrollElementChild"..10]["PetInfo"]["favourite"] = true; ReOrderScrollFrame("favourites>search","Bane");
function FilterAfter(arrayin,firstScrollIndex,filtermode,...)
	local filter1, filter2, filter3, filter4 = ...;
	local tempArray = {};
	tempArray.length = StringKeyTableLengthI(tempArray)-1;
	print(filter1);



	if(filter1 ~= nil) then
		if(filter1 == "Cunning") then --for diffeerent mode add vs strict just swap the order of the loops in theory?
			for i = 1,firstScrollIndex-1 do
				--tempArray.length = tempArray.length+1;
				--tempArray[tempArray.length+1] = arrayin[i];
			end
			for i = 1,arrayin.length-1 do
				
				if(ScrollFrameArrElem["ScrollElementChild"..arrayin[i]]["PetInfo"]["talent"] ~= "Cunning") then
				tempArray.length = tempArray.length+1;
				tempArray[tempArray.length+1] = arrayin[i];
				
				
				

				end
			
			end
			for i = 1,arrayin.length-1 do
				if(ScrollFrameArrElem["ScrollElementChild"..arrayin[i]]["PetInfo"]["talent"] == "Cunning") then
				tempArray.length = tempArray.length+1;
				--ScrollFrameArrElem["ScrollElement"..arrayin[i]]:Hide();
				tempArray[tempArray.length+1] = arrayin[i];

				
				end
			
			end
		end
	end
	if(filter2 ~=nil) then end
	if(filter3 ~=nil) then end
	if(filter4 ~=nil) then end

	return  tempArray;

end




function ReOrderScrollFrame(swapby,input) 
	local swapindex = {};
	local firstScrollIndex = 1;
	swapindex["searchString"] = {};
	swapindex["favourites"] = {};
	swapindex["favourites>search"] = {};
	swapindex["search<favourites"] = {};
	

	if(swapby == "searchString") then	
		--print("inSearchString");
		--if(GlobalActiveSlotLoopValue == 5) then
		--ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 1;
		--else
		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement")
		--end
		swapindex.searchlength = StringKeyTableLengthI(swapindex["searchString"])-1;
		for i = 1,ScrollFrameArrElem.length-1  do 
			--print("inLoop");

			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] and (not input == nil)) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;					
				end
	
			end

			if(string.find(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"],input) ~= nil) then
			swapindex.searchlength = swapindex.searchlength+1;
			swapindex["searchString"][swapindex.searchlength+1] = i;
			--print(i);
			end
		end
		local endofindex;
		for i = 1,ScrollFrameArrElem.length-(firstScrollIndex)  do 
			
			if(string.find(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"],input) == nil) then

			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] ~= "N/A") then
			swapindex.searchlength = swapindex.searchlength+1;
			swapindex["searchString"][swapindex.searchlength+1] = i;
			endofindex = StringKeyTableLengthI(swapindex);
			end
			--print(i);
			end
		end
		for i = 1,ScrollFrameArrElem.length-(firstScrollIndex)  do 
			
			if(string.find(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"],input) == nil) then

			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == nil) then
			swapindex.searchlength = swapindex.searchlength+1;
			swapindex["searchString"][swapindex.searchlength+1] = i;
			end
			--print(i);
			end
		end
		--if(GlobalActiveSlotLoopValue == 6) then
		--ScrollFrameArrElem["ScrollElement"..6]:Hide();
		--else
		--ScrollFrameArrElem["ScrollElement"..6]:Show();
		--end
		local tempSwap = {};
--		for j = 1,ScrollFrameArrElem.length-(firstScrollIndex) do
--			if  ScrollFrameArrElem["ScrollElementChild"..swapindex["searchString"][j-firstScrollIndex]]["PetInfo"]["name"] ~= "N/A" then
--					tempSwap[StringKeyTableLengthI(tempSwap)+1] = swapindex["searchString"][j-firstScrollIndex];
			
--			end

--		end
--		for i = 1,ScrollFrameArrElem.length-(firstScrollIndex) do
--			if  ScrollFrameArrElem["ScrollElementChild"..swapindex["searchString"][i-firstScrollIndex]]["PetInfo"]["name"] ~= "N/A" then
--					tempSwap[StringKeyTableLengthI(tempSwap)+1] = swapindex["searchString"][i-firstScrollIndex];
			
--			end


--		end
		--swapindex["searchString"] = tempSwap;

		for i = 1,ScrollFrameArrElem.length-(firstScrollIndex) do
			
			
			local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			
			

			

			local j = swapindex["searchString"][i-firstScrollIndex];
			if(j ~= nil) then
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
			--if(GlobalActiveSlotLoopValue == 6 and i > 6) then
			
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
			--elseif(GlobalActiveSlotLoopValue == 5 and i > 5) then
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
			--else
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex)))-4);
			
			--end

			end
		end
		



	elseif(swapby == "favourites") then
	-- does not work
		if(GlobalActiveSlotLoopValue == 5) then
		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 2;
		else
		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 1;
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			--print("inLoop");

			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"]) then
			swapindex.favouriteslength = StringKeyTableLengthI(swapindex["favourites"]);
			swapindex["favourites"][swapindex.favouriteslength+1] = i;
			--print(i);
			end
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			if(not ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"]) then
			swapindex.favouriteslength = StringKeyTableLengthI(swapindex["favourites"]);
			swapindex["favourites"][swapindex.favouriteslength+1] = i;
			--print(i);
			end
		end


		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1 do
			local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			local j = swapindex["favourites"][i-GlobalActiveSlotLoopValue];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);

			end

		end
	elseif(swapby == "favourites>search") then
	--	ReOrderScrollFrame("default"); 
	--	ReOrderScrollFrame("searchString",input);
	--	ReOrderScrollFrame("favourites"); 

	if(GlobalActiveSlotLoopValue == 5) then
		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 2;
		else
		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 1;
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			--print("inLoop");

			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"]) then
			swapindex.favouritesthensearchlength = StringKeyTableLengthI(swapindex["favourites>search"]);
			swapindex["favourites>search"][swapindex.favouritesthensearchlength+1] = i;
			--print(i);
			end
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			if(not ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"]) then
			swapindex.favouritesthensearchlength = StringKeyTableLengthI(swapindex["favourites>search"]);
			swapindex["favourites>search"][swapindex.favouritesthensearchlength+1] = i;
			--print(i);
			end
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			--print("inLoop");
			local j = swapindex["favourites>search"][i-GlobalActiveSlotLoopValue];
			if(j ~= nil) then
				if(string.find(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"],input) ~= nil) then
				swapindex.searchafterfavouritelength = StringKeyTableLengthI(swapindex["search<favourites"]);
				swapindex["search<favourites"][swapindex.searchafterfavouritelength+1] = i;
				--print(i);
				end
			end
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1  do 
			--print("inLoop");
			local j = swapindex["favourites>search"][i-GlobalActiveSlotLoopValue];
			if(j ~= nil) then
				if(string.find(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"],input) == nil) then
				swapindex.searchafterfavouritelength = StringKeyTableLengthI(swapindex["search<favourites"]);
				swapindex["search<favourites"][swapindex.searchafterfavouritelength+1] = i;
				--print(i);
				end
			end
		end
		for i = GlobalActiveSlotLoopValue+1,ScrollFrameArrElem.length+GlobalActiveSlotLoopValue-1 do
			local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			local j = swapindex["search<favourites"][i-GlobalActiveSlotLoopValue];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
			end
		end

	elseif(swapby == "default") then

		ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	

		
	

		for i = 1,ScrollFrameArrElem.length-1 do
			
			local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];

			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;									
				end
	
			end
			ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);



			
			
			

			
			

		end
		
	elseif(swapby == "newTalents") then
		--if(GlobalActiveSlotLoopValue == 5) then
		
		----return;
		--ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
		----else
		----ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement") - 1;
		----end
		--local startI = 0;
		--if(input == -1) then
		----ScrollFrameArrElem["ScrollElement"..6]:Show();
		----ScrollFrameArrElem.length = ScrollFrameArrElem.length-1;
		-- startI = 1;
		--elseif(input == 1) then
		----ScrollFrameArrElem["ScrollElement"..6]:Hide();
		 
		----ScrollFrameArrElem.length = ScrollFrameArrElem.length+1;
		--end


--		for i = 1,ScrollFrameArrElem.length-1 do
			
			
			
--			local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
--			local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
--			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
			
--				if(i <= GlobalActiveSlotLoopValue) then
--					ScrollFrameArrElem["ScrollElement"..i]:Hide();
--					if(GlobalActiveSlotLoopValue == 6) then
--					ScrollFrameArrElem["ScrollElement"..6]:Hide();
--					else
--					ScrollFrameArrElem["ScrollElement"..6]:Show();

--					end
--				end
--			end



--			--if(GlobalActiveSlotLoopValue == 6 and i > 6) then
			
--			--ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
--			--elseif(GlobalActiveSlotLoopValue == 5 and i > 5) then
--			--ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
--			--else
--			ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i-1-(GlobalActiveSlotLoopValue)))-4);
			
--			--end
			

--		end
	
	end
	



	local maxSizeY = ((ScrollFrameArrElem.length-1-5)* (ScrollFrameArrElem["ScrollElementSizeY"]+4))-(((ScrollFrameArrElem.length-1)-2) * 4);
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	
	--print("completed");
end

function StringKeyTableLength(table,namespace)
local n = 0
    for k, v in pairs(table) do
		nsEnd = select(2,string.find(k,namespace))
		
        if(string.find(k,namespace) ~=nil) then
			if(tonumber(string.sub(k,nsEnd+1,nsEnd+1)) ~= nil) then 
				n = n + 1
			end
		end
    end
    return n
end

function StringKeyTableLengthI(table)
local n = 0
    for k, v in pairs(table) do
        
		n = n + 1
		
    end
    return n
end

-- MoveEmpty still needs new discriminants as were added in search and default above
function MoveEmptySlotsToBottomOfScroll()
	local swapindex = {};
	local firstScrollIndex = 1;
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
	ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	swapindex.length = StringKeyTableLengthI(swapindex)-1;
	for i = 1,ScrollFrameArrElem.length do	
			--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			--local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;					
				end
	
			end


			--local j = swapindex[i+firstScrollIndex-1];
			--if(j ~= nil) then
			----ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--end
			local j = i + firstScrollIndex - 1;

			if(j < ScrollFrameArrElem.length) then
				if(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) then
				
					swapindex.length = swapindex.length+1;
					swapindex[swapindex.length] = j;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Not Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end


		
		--swapindex.lastNonEmptyIndex = swapindex.length;

		for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			if(j < ScrollFrameArrElem.length) then
				if(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) then
					swapindex.length = swapindex.length+1;
					swapindex[swapindex.length] = j;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end
	
		--local filterAppliedArray = FilterAfter(swapindex,firstScrollIndex,"","Cunning","","","");
		for i = 0,swapindex.length do
			
			--if(notverytrue) then
			--local j = filterAppliedArray[i];
			--print("J: "..j.." - I: "..swapindex[i]);
			--else
			--local j = swapindex[i];
			--end
			local j = swapindex[i];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:ClearAllPoints();
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i))-16);
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--print("J: "..j);
			else
			--print("J: nil");
			end



		end



end
function MoveOccupiedSlotsToBottomOfScroll()
	local swapindex = {};
	local firstScrollIndex = 1;
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
	ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	swapindex.length = StringKeyTableLengthI(swapindex)-1;
	for i = 1,ScrollFrameArrElem.length do	
			--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			--local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;					
				end
	
			end


			--local j = swapindex[i+firstScrollIndex-1];
			--if(j ~= nil) then
			----ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--end
			

			local j = i + firstScrollIndex - 1;

			if(j < ScrollFrameArrElem.length) then
				if(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) then
				
					swapindex.length = swapindex.length+1;
					swapindex[swapindex.length] = j;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end


		
		--swapindex.lastNonEmptyIndex = swapindex.length;

		for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			if(j < ScrollFrameArrElem.length) then
				if(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) then
					swapindex.length = swapindex.length+1;
					swapindex[swapindex.length] = j;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Not Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end
		if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
			print(swapindex.length);
		end
		for i = 0,ScrollFrameArrElem.length do
			
			if(firstScrollIndex > i ) then
			ScrollFrameArrElem["ScrollElement"..i]:SetPoint(point, 4,-(ElementSizeY*(i+(swapindex.length-1)))-4);
			
			end


			local j = swapindex[i];
			if(j ~= nil) then

			ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i))-4);
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--print("J: "..j);
			else
			--ScrollFrameArrElem["ScrollElement"..i]:ClearAllPoints();
			--print("J: nil");
			end



		end



end
function HideEmptyScrollSlots()
ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
local visibleCount = 0;
			


	for i = 1,ScrollFrameArrElem.length-1 do
			


			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == nil) then
			ScrollFrameArrElem["ScrollElement"..i]:Hide();
			else

				if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
					if(i <= GlobalActiveSlotLoopValue) then
						ScrollFrameArrElem["ScrollElement"..i]:Hide();
						if(GlobalActiveSlotLoopValue == 6) then
							ScrollFrameArrElem["ScrollElement"..6]:Hide();
							firstScrollIndex = 7;
						else
							ScrollFrameArrElem["ScrollElement"..6]:Show();
							firstScrollIndex = 6;
						end
				
					end
				else
					if(i <= 6) then
					ScrollFrameArrElem["ScrollElement"..i]:Show();
					firstScrollIndex = 1;									
					
					end
	
				end
				if(i>GlobalActiveSlotLoopValue) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				end
				visibleCount = visibleCount +1;
			
			
			end



	end
	local maxSizeY = ((visibleCount-5)* (ScrollFrameArrElem["ScrollElementSizeY"]+4))-(((visibleCount)-2) * 4);
	local minSizeY = (ScrollFrameArrElem["ScrollElementSizeY"]+4)*10;
	if(maxSizeY > minSizeY) then
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	end


end


function ShowEmptyScrollSlots()
ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
local visibleCount = 0;
	for i = 1,ScrollFrameArrElem.length-1 do
			if(i < GlobalActiveSlotLoopValue) then
			else
			if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == nil) then
			ScrollFrameArrElem["ScrollElement"..i]:Show();
			visibleCount = visibleCount +1;
			end
			end
	end


	local maxSizeY = ((visibleCount-5)* (ScrollFrameArrElem["ScrollElementSizeY"]+4))-(((visibleCount)-2) * 4);
	local minSizeY = (ScrollFrameArrElem["ScrollElementSizeY"]+4)*10;
	if(maxSizeY > minSizeY) then
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	end
	


end

function StablesCollectionBackgroundInsetFrame_OnLoad()
	
end


function ShowEmptyStableSlotsOnDragOnly(bool,state)

	if(bool) then 
	
		SavePetInfoToWTF();
		for i=1, StablesCollectionScrollbarMaxChildren,1 do 
		local petSlot = i;
		local petisStabled = nil;
			if(i < 6) then
			petSlot = PetStable_GetPetSlot(i, true);
			petisStabled = false;
			else
			petSlot = (i - 5);
			petisStabled = true;
			end
		local l_icon, l_name, l_level, l_family, l_talent = GetStablePetInfo(i);		
			if(i < 6) then
				--if(iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
					if(ScrollFrameArrElem["ScrollElementChild"..i] == nil) then
						ScrollFrameArrElem["ScrollElementChild"..i] = {};
					end
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] = {};
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["icon"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["name"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["level"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["family"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["talent"];
				-- custom info
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["favourite"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["inStables"];
				ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..petSlot]["Slot"];
				--end
			else
			
				if(ScrollFrameArrElem["ScrollElementChild"..i] == nil) then
					ScrollFrameArrElem["ScrollElementChild"..i] = {};
				end
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"] = {};
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["icon"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["icon"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["name"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["level"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["level"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["family"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["family"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["talent"];
				-- custom info
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["favourite"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["inStables"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["inStables"];
			ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["Slot"] = iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot]["Slot"];	
		
			end
		end

		if(state == "Up")then
		
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
			else
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
				MasterFilterSort("",false);
			end
		
		elseif(state == "Down")then	
			if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(false);
			else
				--ShowEmptyScrollSlots();
				MasterFilterSort("",true);
			end
		
		end
	end



	









end




	--local Test1_Data = 
	--{
	--	["level1_test_1"] =
	--	{
	--		[1] = { ["Families"] = {[1] = { ["sublevel 1"] = "subsublevel 1"; },[2] = { ["sublevel 2"] = "subsublevel 2"; },},},
	--		[2] = { ["name"] = {[1] = { ["sublevel 1"] = "subsublevel 1"; },[2] = { ["sublevel 2"] = "subsublevel 2"; },},},
	--	},
	--	["level1_test_2"] = 
 -- 		{	
	--		[1] = { ["name"] = {[1] = { ["sublevel 1"] = "subsublevel 1"; },[2] = { ["sublevel 2"] = "subsublevel 2"; },},},
	--		[2] = { ["name"] = {[1] = { ["sublevel 1"] = "subsublevel 1"; },[2] = { ["sublevel 2"] = "subsublevel 2"; },},},
	--	},
	--}
function StablesCollectionFilterDropDown_Initialize(self, level)
	
	local info = UIDropDownMenu_CreateInfo();
	info.keepShownOnClick = true;	
	
--	level = level or 1;
	
--	if (level == 1) then
--     for key, subarray in pairs(Test1_Data) do
--       local info = UIDropDownMenu_CreateInfo();
--       info.hasArrow = true; -- creates submenu
--       info.notCheckable = true;
--       info.text = key;
--       info.value = {
--         ["Level1_Key"] = key;
--       };
--       UIDropDownMenu_AddButton(info, level);
--     end -- for key, subarray
--   end -- if level 1

		--local fampagesnum = 1;
		--local famperpagesnum = 1;
	local nestingcheck = false;
	if(level ~= nil) then

	if(level > 1) then
	nestingcheck = (level == UIDROPDOWNMENU_MENU_VALUE["sublayer"] and UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1);
	--print(nestingcheck,level, UIDROPDOWNMENU_MENU_VALUE["sublayer"], UIDROPDOWNMENU_MENU_VALUE["SubLevel"]);
	end
	end
		
	

	if level == 1 then
		

		info.text = "Filters ON/OFF";
		info.func = 	function(_, _, _, value)
							--C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED, value);
							SetFilterValue("AnyFilter", value);
							UpdateScrollListMainCall();

						end
		info.checked = GetFilterValue("AnyFilter");--C_PetJournal.IsFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED);
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level);

		info.disabled = nil;

		--info.text = NOT_COLLECTED;
		--info.func = 	function(_, _, _, value)
		--					--C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED, value);
		--				end
		--info.checked = true;--C_PetJournal.IsFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED);
		--info.isNotRadio = true;
		--UIDropDownMenu_AddButton(info, level);

		info.checked = 	nil;
		info.isNotRadio = nil;
		info.func =  nil;
		info.hasArrow = true;
		info.notCheckable = true;

		info.text = "Families";
		info.value = {["SubLevel"] = 1, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

		info.text = "Specialization";
		info.value = {["SubLevel"] = 2, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

		info.text = "Diet";
		info.value = {["SubLevel"] = 3, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

		info.text = "Other";
		info.value = {["SubLevel"] = 4, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

	elseif (level == 2 or nestingcheck) then
		if (UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1 )then
			if(UIDROPDOWNMENU_MENU_VALUE["sublayer"] == 1) then
				info.hasArrow = false;
				info.isNotRadio = true;
				info.notCheckable = true;
			
				info.text = CHECK_ALL;
				info.func = function()
								--C_PetJournal.SetAllPetTypesChecked(true);
								--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							end
				UIDropDownMenu_AddButton(info, level);
	
				info.text = UNCHECK_ALL;
				info.func = function()
								--C_PetJournal.SetAllPetTypesChecked(false);
								--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							end
				UIDropDownMenu_AddButton(info, level);
				


			info.notCheckable = false;


			local numTypes = 59;--C_PetJournal.GetNumPetTypes();
			local ownedFamilies = {}; -- should be moved to somewhere more general
			ownedFamilies.length = StringKeyTableLengthI(ownedFamilies);
							
			for j=1,ScrollFrameArrElem.length-1 do
					local seen = true; -- bit turned on its head but it filters out not opts in
					local limit
					if(ownedFamilies.length < 2)then
					limit = 1;
					else
					limit = ownedFamilies.length-1;
					end 
					for i=1,limit do
						if(ownedFamilies.length > 0 and ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= "N/A")then
						if(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= ownedFamilies[i])then
						--if(l_DB_families[i] ~= ownedFamilies[i])then


						seen = false;

						end
						

						elseif(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= "N/A") then
						ownedFamilies.length = ownedFamilies.length+1;
						ownedFamilies[ownedFamilies.length] = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"];
						--print(ownedFamilies[ownedFamilies.length]);
						end
					end	
						if(not seen) then
						ownedFamilies.length = ownedFamilies.length+1;
						ownedFamilies[ownedFamilies.length] = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"];
					
						end
			end

			
			
--			local Level1_Key = UIDROPDOWNMENU_MENU_VALUE["SubLevel"];
--			subarray = Test1_Data[Level1_Key];
			
--			for key, subsubarray in pairs(subarray) do
--				local info = UIDropDownMenu_CreateInfo();
--				info.hasArrow = false; -- no submenues this time
--				info.notCheckable = true;
--				info.text = subsubarray["name"];
----				use info.func to set a function to be called at "click"
--			    info.value = {
--				["Level1_Key"] = Level1_Key;
--				["Sublevel_Key"] = key;
--				};
--			UIDropDownMenu_AddButton(info, level);
--			end
			--for i = famperpagesnum or 1,ownedFamilies.length-1 do
			for i = famperpagesnum or 1, (UIDROPDOWNMENU_MENU_VALUE["sublayer"] * 10) * 2.0 or StringKeyTableLengthI(l_DB_families)-1 do
				local addbuttonlevel = 1 + select(1,math.modf(i/20));



				if (mod(i,20)==0) then
					local info = UIDropDownMenu_CreateInfo();
					info.text = (famperpagesnum or 20).."-"..i*2 - 1
					info.hasArrow = true;
					info.notCheckable = true;
					--info.func = function() fampagesnum = nil; famperpagesnum = nil; end;
					info.checked = nil;
					if(fampagesnum == nil) then fampagesnum = i; end
					fampagesnum = fampagesnum+1;
					--famperpagesnum = i+1;		
					info.value = {["SubLevel"] = 1;	["sublayer"] =  addbuttonlevel +1;	};
					
					info.checked = 	nil;
					info.isNotRadio = nil;
					info.func =  nil;
					info.hasArrow = true;
					info.notCheckable = true;
					--print(addbuttonlevel, info.value["SubLevel"], info.value["sublayer"], level);
					UIDropDownMenu_AddButton(info,level);
					break;			
				end

				--info.notCheckable = false;
				--info.hasArrow = false;				
				----info.text = ownedFamilies[i];				
				--info.text = l_DB_families[i];
				--info.func = function(_, _, _, value) end
				--info.checked = function() return false;	end
								
				--UIDropDownMenu_AddButton(info,level);				
				
			end
				for i = famperpagesnum or 1, (UIDROPDOWNMENU_MENU_VALUE["sublayer"] * 10) * 2.0 or StringKeyTableLengthI(l_DB_families)-1 do
				local addbuttonlevel = 1 + select(1,math.modf(i/20));
								info.notCheckable = false;
				info.hasArrow = false;				
				--info.text = ownedFamilies[i];				
				info.text = l_DB_families[i];
				info.func = function(_, _, _, value)
							
							SetFilterValue(tostring(l_DB_families[i]), value);
							UpdateScrollListMainCall();
				
				end
				info.checked = GetFilterValue(tostring(l_DB_families[i]));
				
								
				UIDropDownMenu_AddButton(info,level);				
				
				end
		elseif(UIDROPDOWNMENU_MENU_VALUE["sublayer"] >= 3) then
				--print(UIDROPDOWNMENU_MENU_VALUE["sublayer"]);
				info.hasArrow = false;
				info.isNotRadio = true;
				info.notCheckable = true;
				info.text = CHECK_ALL;
				info.func = function()
								local layer = UIDROPDOWNMENU_MENU_VALUE["sublayer"];
								local k = 1;
									for j = 1, 19 or select(1,math.modf((StringKeyTableLengthI(l_DB_families)-1)/layer)) do
									
									--print(famperpagesnum);
									
									
									k = k + 1;
									local trimstart = 2;
									if(select(1,math.modf((StringKeyTableLengthI(l_DB_families)-1)/layer)) < 19 ) then
									trimstart = 1;
									end

									SetFilterValue(tostring(l_DB_families[layer*10+j]), true);
									UpdateScrollListMainCall();

									_G["DropDownList"..layer .."Button"..k+trimstart .."Check"]:Show();
									_G["DropDownList"..layer .."Button"..k+trimstart .."UnCheck"]:Hide();
									_G["DropDownList"..layer .."Button"..k+trimstart].checked = GetFilterValue(l_DB_families[layer*10+j]);
									end
								--C_PetJournal.SetAllPetTypesChecked(true);
								--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);

								
							end
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_VALUE["sublayer"]);
	
				info.text = UNCHECK_ALL;
				info.func = function()
								local layer = UIDROPDOWNMENU_MENU_VALUE["sublayer"];
								local k = 1;
									for j = 1, 19 or select(1,math.modf((StringKeyTableLengthI(l_DB_families)-1)/layer)) do
									
									--print(famperpagesnum);
									
									
									k = k + 1;
									local trimstart = 2;
									if(select(1,math.modf((StringKeyTableLengthI(l_DB_families)-1)/layer)) < 19 ) then
									trimstart = 1;
									end

									SetFilterValue(l_DB_families[layer*10+j], false);
									UpdateScrollListMainCall();

									_G["DropDownList"..layer .."Button"..k+trimstart .."Check"]:Hide();
									_G["DropDownList"..layer .."Button"..k+trimstart .."UnCheck"]:Show();
									_G["DropDownList"..layer .."Button"..k+trimstart].checked = GetFilterValue(tostring(l_DB_families[layer*10+j]));
									end

								--C_PetJournal.SetAllPetTypesChecked(false);
								--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 1, 2);
							end
				UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_VALUE["sublayer"]);
				


			info.notCheckable = false;


			local numTypes = 59;--C_PetJournal.GetNumPetTypes();
			local ownedFamilies = {}; -- should be moved to somewhere more general
			ownedFamilies.length = StringKeyTableLengthI(ownedFamilies);
							
			for j=1,ScrollFrameArrElem.length-1 do
					local seen = true; -- bit turned on its head but it filters out not opts in
					local limit
					if(ownedFamilies.length < 2)then
					limit = 1;
					else
					limit = ownedFamilies.length-1;
					end 
					for i=1,limit do
						if(ownedFamilies.length > 0 and ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= "N/A")then
						if(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= ownedFamilies[i])then
						--if(l_DB_families[i] ~= ownedFamilies[i])then


						seen = false;

						end
						

						elseif(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"] ~= "N/A") then
						ownedFamilies.length = ownedFamilies.length+1;
						ownedFamilies[ownedFamilies.length] = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"];
						--print(ownedFamilies[ownedFamilies.length]);
						end
					end	
						if(not seen) then
						ownedFamilies.length = ownedFamilies.length+1;
						ownedFamilies[ownedFamilies.length] = ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["family"];
					
						end
			end

			
			
--			local Level1_Key = UIDROPDOWNMENU_MENU_VALUE["SubLevel"];
--			subarray = Test1_Data[Level1_Key];
			
--			for key, subsubarray in pairs(subarray) do
--				local info = UIDropDownMenu_CreateInfo();
--				info.hasArrow = false; -- no submenues this time
--				info.notCheckable = true;
--				info.text = subsubarray["name"];
----				use info.func to set a function to be called at "click"
--			    info.value = {
--				["Level1_Key"] = Level1_Key;
--				["Sublevel_Key"] = key;
--				};
--			UIDropDownMenu_AddButton(info, level);
--			end
			--for i = famperpagesnum or 1,ownedFamilies.length-1 do
			for i = ((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-2) * 10)* 2.0 + 1, ((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-1) * 10  ) *2.0 or StringKeyTableLengthI(l_DB_families)-1 do
				local addbuttonlevel = 2 + select(1,math.modf(i/20));
				info.notCheckable = false;
				info.hasArrow = false;				
				--info.text = ownedFamilies[i];				
				info.text = l_DB_families[i];
				info.func = function(_, _, _, value) 
				
							SetFilterValue(l_DB_families[i], value);
							UpdateScrollListMainCall();

				end
				info.checked = GetFilterValue(l_DB_families[i]);
				
				local lastIndex = 19;
				if(StringKeyTableLengthI(l_DB_families)-1 < i+19) then
					lastIndex = StringKeyTableLengthI(l_DB_families)-1;
					else
					lastIndex = i+19;

				end	
				if(i == lastIndex + 1)then
				break;
				end
				--UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_VALUE["sublayer"]);		
				
				if (mod(i,20)==0) then
					
					local info = UIDropDownMenu_CreateInfo();
					

					info.text = (((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-1) * 10) *2.0 or 1).."-"..lastIndex;
					info.hasArrow = true;
					info.notCheckable = true;
					--info.func = function() fampagesnum = nil; famperpagesnum = nil; end;
					info.checked = nil;
					if(fampagesnum == nil) then fampagesnum = i; end
					fampagesnum = fampagesnum+1;
					--famperpagesnum = i+1;		
					info.value = {["SubLevel"] = 1;	["sublayer"] = addbuttonlevel;	};

					info.checked = 	nil;
					info.isNotRadio = nil;
					info.func =  nil;
					info.hasArrow = true;
					info.notCheckable = true;
					--print(addbuttonlevel, info.value["SubLevel"], info.value["sublayer"], level);
					UIDropDownMenu_AddButton(info,level);
					break;			
				end

						
				
			end
			end
				for i = ((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-2) * 10)* 2.0 + 1, ((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-1) * 10  ) *2.0 or StringKeyTableLengthI(l_DB_families)-1 do


				local addbuttonlevel = 2 + select(1,math.modf(i/20));
				info.notCheckable = false;
				info.hasArrow = false;				
				--info.text = ownedFamilies[i];				
				info.text = l_DB_families[i];
				info.func = function(_, _, _, value)
				
							SetFilterValue(l_DB_families[i], value);
							UpdateScrollListMainCall();
				
				end
				info.checked = GetFilterValue(l_DB_families[i]);
				
				local lastIndex = 19;
				if(StringKeyTableLengthI(l_DB_families)-1 < i+19) then
					lastIndex = StringKeyTableLengthI(l_DB_families)-1;
					else
					lastIndex = i+19;

				end	
				if(i == lastIndex + 1)then
				break;
				end
				if (mod(i,20)==0) then
					
					local info = UIDropDownMenu_CreateInfo();
					

					--info.text = (((UIDROPDOWNMENU_MENU_VALUE["sublayer"]-1) * 10) *2.0 or 1).."-"..lastIndex;
					info.hasArrow = true;
					info.notCheckable = true;
					--info.func = function() fampagesnum = nil; famperpagesnum = nil; end;
					info.checked = nil;
					if(fampagesnum == nil) then fampagesnum = i; end
					fampagesnum = fampagesnum+1;
					--famperpagesnum = i+1;		
					info.value = {["SubLevel"] = 1;	["sublayer"] = addbuttonlevel;	};

					info.checked = 	nil;
					info.isNotRadio = nil;
					info.func =  nil;
					info.hasArrow = true;
					info.notCheckable = true;
					--print(addbuttonlevel, info.value["SubLevel"], info.value["sublayer"], level);
					--UIDropDownMenu_AddButton(info,level);
					break;			
				end
				
				if( info.text ~= nil) then
				UIDropDownMenu_AddButton(info,UIDROPDOWNMENU_MENU_VALUE["sublayer"]);
				end
				end


		elseif UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 2 then
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;

			info.text = CHECK_ALL;
			info.func = function()
							--C_PetJournal.SetAllPetSourcesChecked(true);
							--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 2, 2);
							local numSources = 3;
							for i=1,numSources do
							local specString = ""..select(2,GetSpecializationInfo(i, false , true));
							--print(specString);
							SetFilterValue(specString, true);
							UpdateScrollListMainCall();
							_G["DropDownList"..2 .."Button"..i+2 .."Check"]:Show();
							_G["DropDownList"..2 .."Button"..i+2 .."UnCheck"]:Hide();
							local specString = ""..select(2,GetSpecializationInfo(i, false , true));
							_G["DropDownList"..2 .."Button"..i+2].checked = GetFilterValue(specString);
							end
							
							
							--UIDropDownMenu_Refresh(StablesRightFrameFilterBtnFilterDropDown,2,2);

						end
			UIDropDownMenu_AddButton(info, level);

			info.text = UNCHECK_ALL;
			info.func = function()
							local numSources = 3;
							for i=1,numSources do
							local specString = ""..select(2,GetSpecializationInfo(i, false , true));
							--print(specString);
							_G["DropDownList"..2 .."Button"..i+2 .."Check"]:Hide();
							_G["DropDownList"..2 .."Button"..i+2 .."UnCheck"]:Show();
							SetFilterValue(specString, false);
							UpdateScrollListMainCall();
							local specString = ""..select(2,GetSpecializationInfo(i, false , true));
							_G["DropDownList"..2 .."Button"..i+2].checked = GetFilterValue(specString);
							end
							
							
							--UIDropDownMenu_Refresh(StablesRightFrameFilterBtnFilterDropDown,2,2);
							--C_PetJournal.SetAllPetSourcesChecked(false);
							--UIDropDownMenu_Refresh(PetJournalFilterDropDown, 2, 2);
						end
			UIDropDownMenu_AddButton(info, level);

			info.notCheckable = false;
			local numSources = 3; --C_PetJournal.GetNumPetSources();
			for i=1,numSources do
				info.text = select(2,GetSpecializationInfo(i, false , true));

				info.func = function(_, _, _, value)
							local specString = ""..select(2,GetSpecializationInfo(i, false , true));
							--print(specString);
							SetFilterValue(specString, value);
							UpdateScrollListMainCall();
							
							

							--C_PetJournal.SetPetSourceChecked(i, value);
						end
				local specString = ""..select(2,GetSpecializationInfo(i, false , true));
				info.checked = GetFilterValue(specString);
				
								
							
									
				UIDropDownMenu_AddButton(info, level);
			end
		elseif UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 3 then
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true;
			local listOfFoods = {"Bread", "Meat", "Raw Meat","Fish","Raw Fish","Fungus","Mechanical Bits","Fruit","Cheese"}
			info.text = CHECK_ALL;
				info.func = function(value)
								
								
								for i=1,#listOfFoods  do
									--print(specString);

									local buttonDBref = listOfFoods[i];
									--print(tostring(buttonDBref));
									_G["DropDownList"..2 .."Button"..i+2 .."Check"]:Show();
									_G["DropDownList"..2 .."Button"..i+2 .."UnCheck"]:Hide();
									SetFilterValue(buttonDBref, true);
									UpdateScrollListMainCall();
									_G["DropDownList"..2 .."Button"..i+2].checked = GetFilterValue(buttonDBref);
								end
							end
				UIDropDownMenu_AddButton(info, level);
	
				info.text = UNCHECK_ALL;
				info.func = function()
								
								for i=1,#listOfFoods do
									--print(specString);

									local buttonDBref = listOfFoods[i];
									_G["DropDownList"..2 .."Button"..i+2 .."Check"]:Hide();
									_G["DropDownList"..2 .."Button"..i+2 .."UnCheck"]:Show();
									SetFilterValue(buttonDBref, false);
									UpdateScrollListMainCall();
									_G["DropDownList"..2 .."Button"..i+2].checked = GetFilterValue(buttonDBref);
								end
							end
				UIDropDownMenu_AddButton(info, level);


			info.notCheckable = false;
			for i=1,#listOfFoods do
			info.text = listOfFoods[i];
			info.func = function(_,_,_,value)
							
							SetFilterValue(listOfFoods[i],value);
							UpdateScrollListMainCall();
						end
			info.checked = GetFilterValue(listOfFoods[i]);
			UIDropDownMenu_AddButton(info, level);

			end

--			info.text = "Bread";
--			info.func = function(value)
							
--							SetFilterValue("Bread", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Bread");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Meat";
--			info.func = function(value)
							
--							SetFilterValue("Meat", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Meat");			
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Raw Meat";
--			info.func = function(value)
							
--							SetFilterValue("Raw Meat", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Raw Meat");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Fish";
--			info.func = function(value)
							
--							SetFilterValue("Fish", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Fish");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Raw Fish";
--			info.func = function(value)
							
--							SetFilterValue("Raw Fish", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Raw Fish");
--			UIDropDownMenu_AddButton(info, level);
--			info.text = "Fungi";
--			info.func = function(value)
							
--							SetFilterValue("Fungi", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Fungi");
--			UIDropDownMenu_AddButton(info, level);
--			info.text = "Mechanical Bits";
--			info.func = function(value)
							
--							SetFilterValue("Mechanical Bits", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Mechanical Bits");
--			UIDropDownMenu_AddButton(info, level);
--			info.text = "Fruit";
--			info.func = function(value)
							
--							SetFilterValue("Fruit", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Fruit");
--			UIDropDownMenu_AddButton(info, level);
--			info.text = "Cheese";
--			info.func = function(value)
							
--							SetFilterValue("Cheese", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Cheese");
--			UIDropDownMenu_AddButton(info, level);

		elseif UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 4 then
			info.hasArrow = false;
			info.isNotRadio = true;
			info.notCheckable = true;
			info.keepShownOnClick = true;
			local listOfOthers = {"Named","Favourite", "Rarity", "Exotic"}
			info.text = CHECK_ALL;
				info.func = function()
								
								iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] = true;
								_G["DropDownList"..2 .."Button"..3].checked = iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"];
								_G["DropDownList"..2 .."Button"..3 .."Check"]:Show();
								_G["DropDownList"..2 .."Button"..3 .."UnCheck"]:Hide();
								for i=1,#listOfOthers do
									--print(specString);
									
									local buttonDBref = listOfOthers[i];
									_G["DropDownList"..2 .."Button"..i+3 .."Check"]:Show();
									_G["DropDownList"..2 .."Button"..i+3 .."UnCheck"]:Hide();
									SetFilterValue(buttonDBref, true);
									UpdateScrollListMainCall();
									_G["DropDownList"..2 .."Button"..i+3].checked = GetFilterValue(tostring(buttonDBref));
								end
							end
				UIDropDownMenu_AddButton(info, level);
	
				info.text = UNCHECK_ALL;
				info.func = function()
								

									iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] = false;
									_G["DropDownList"..2 .."Button"..3].checked = iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"];
									_G["DropDownList"..2 .."Button"..3 .."Check"]:Hide();
									_G["DropDownList"..2 .."Button"..3 .."UnCheck"]:Show();
								for i=1,#listOfOthers do
									--print(specString);
									

									local buttonDBref = listOfOthers[i];
									_G["DropDownList"..2 .."Button"..i+3 .."Check"]:Hide();
									_G["DropDownList"..2 .."Button"..i+3 .."UnCheck"]:Show();
									SetFilterValue(buttonDBref, false);
									UpdateScrollListMainCall();
									_G["DropDownList"..2 .."Button"..i+3].checked = GetFilterValue(tostring(buttonDBref));

								end
							end
				UIDropDownMenu_AddButton(info, level);
			
			info.notCheckable = false;



			info.text = "ActiveSlots";
			info.func = function(value)
							iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] = not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"];
							UpdateScrollListMainCall();
						end
			info.checked = iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"];
			UIDropDownMenu_AddButton(info, level);

			for i=1, #listOfOthers do
			if(listOfOthers[i] == "Named") then

			info.text = "Re-named";
			else
			info.text = listOfOthers[i];
			end
			
			info.func = function(_,_,_,value)
							
							SetFilterValue(listOfOthers[i], value);
							UpdateScrollListMainCall();
						end
			info.checked = GetFilterValue(listOfOthers[i]);
			UIDropDownMenu_AddButton(info, level);
			end


--			info.text = "Renamed";
--			info.func = function(value)
							
--							SetFilterValue("Named", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Named");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Favourite";
--			info.func = function(value)
							
--							SetFilterValue("Favourite", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Favourite");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Rarity";
--			info.func = function(value)
							
--							SetFilterValue("Rarity", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Rarity");
--			UIDropDownMenu_AddButton(info, level);

--			info.text = "Exotic";
--			info.func = function(value)
							
--							SetFilterValue("Exotic", value);
--							UpdateScrollListMainCall();
--						end
--			info.checked = GetFilterValue("Exotic");
--			UIDropDownMenu_AddButton(info, level);
		end
	end
end

function StablesCollectionSortDropDown_Initialize(self, level)
	
	local info = UIDropDownMenu_CreateInfo();
	info.keepShownOnClick = true;	
	
--	level = level or 1;
	
--	if (level == 1) then
--     for key, subarray in pairs(Test1_Data) do
--       local info = UIDropDownMenu_CreateInfo();
--       info.hasArrow = true; -- creates submenu
--       info.notCheckable = true;
--       info.text = key;
--       info.value = {
--         ["Level1_Key"] = key;
--       };
--       UIDropDownMenu_AddButton(info, level);
--     end -- for key, subarray
--   end -- if level 1

		--local fampagesnum = 1;
		--local famperpagesnum = 1;
	local nestingcheck = false;
	if(level ~= nil) then

	if(level > 1) then
	nestingcheck = (level == UIDROPDOWNMENU_MENU_VALUE["sublayer"] and UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1);
	--print(nestingcheck,level, UIDROPDOWNMENU_MENU_VALUE["sublayer"], UIDROPDOWNMENU_MENU_VALUE["SubLevel"]);
	end
	end
		
	

	if level == 1 then
		

		info.text = "Sort ON/OFF";
		info.func = 	function(_, _, _, value)
							--C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED, value);
							SetSortingValue("AnySort", value);
							UpdateScrollListMainCall();

						end
		info.checked = GetSortingValue("AnySort");--C_PetJournal.IsFilterChecked(LE_PET_JOURNAL_FILTER_COLLECTED);
		info.isNotRadio = true;
		UIDropDownMenu_AddButton(info, level);

		info.disabled = nil;

		--info.text = NOT_COLLECTED;
		--info.func = 	function(_, _, _, value)
		--					--C_PetJournal.SetFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED, value);
		--				end
		--info.checked = true;--C_PetJournal.IsFilterChecked(LE_PET_JOURNAL_FILTER_NOT_COLLECTED);
		--info.isNotRadio = true;
		--UIDropDownMenu_AddButton(info, level);

		info.checked = 	nil;
		info.isNotRadio = nil;
		info.func =  nil;
		info.hasArrow = true;
		info.notCheckable = true;

		info.text = "Primary Sort";
		info.value = {["SubLevel"] = 1, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

		info.text = "Secondary Sort";
		info.value = {["SubLevel"] = 2, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

		info.text = "Tertiary Sort";
		info.value = {["SubLevel"] = 3, ["sublayer"] = 1};
		UIDropDownMenu_AddButton(info, level);

	elseif (level == 2 or nestingcheck) then
		for i = 1, #iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"] do
			local direction = " - Ascending";

			info.func = function(_, _, _, value) 
			local sortpriority = {};
			--	if type(GetSortPriority(1,2,3)) == "table" then
			--		sortpriority = GetSortPriority(1,2,3);
					--print(GetSortPriority(1));
		--		elseif type(GetSortPriority(1,2,3)) == "boolean" then 
					--print ("Bool DO SOMETHING!")
		--			sortpriority = {};
							

							if iStableMasterDB["ActiveSorts"]["CurrentSort"].primary == 0 then
			--						sortpriority[#sortpriority+1] = "ActiveSlots";
							else
			--						sortpriority[#sortpriority+1] = iStableMasterDB["ActiveSorts"]["CurrentSort"].primary;
							end
							
							if iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary == 0 then
				--					sortpriority[#sortpriority+1] = "Family";
							else
				--					sortpriority[#sortpriority+1] = iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary;

							end
					
							
							if(iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary == 0) then
					--				sortpriority[#sortpriority+1] = "Name";
							else
							--		sortpriority[#sortpriority+1] = iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary;
							end

			--	else

		--		end
			--print(type( GetSortPriority(1,2,3) ), #sortpriority);
		--	print(sortpriority[1],sortpriority[2],sortpriority[3]);
			if(UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1) then
			--	SetSortPriority(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],sortpriority[2],sortpriority[3]);
			SetSortPriority(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],nil,nil)
			elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 2)then
		--		SetSortPriority(sortpriority[1],iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],sortpriority[3]);
			SetSortPriority(nil,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],nil)
			elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 3)then
		--		SetSortPriority(sortpriority[1],sortpriority[2],iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]);
			SetSortPriority(nil,nil,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i])
			end
				


			--print((GetSortPriority(1,2,3)[UIDROPDOWNMENU_MENU_VALUE["SubLevel"]] == iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]))
			--if type(GetSortPriority(UIDROPDOWNMENU_MENU_VALUE["SubLevel"])) == "table" then
			--SetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],GetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i])*-1);
				
					--SetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],GetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]));
			--			local p1 = "Family";
			--			local p2 = "Specialization";
			--			local p3 = "Name";
			--			if(type(GetSortPriority(1,2,3)) == "table") then
			--				p1 = GetSortPriority(1,2,3)[1];		
			--			end
			--			if(type(GetSortPriority(1,2,3)) == "table") then
			--				p2 = GetSortPriority(1,2,3)[2]; -- not sure about this way of indexing				
			--			end
			---			if(type(GetSortPriority(1,2,3)) == "table") then
			--				p3 = GetSortPriority(1,2,3)[3]; -- not sure about this way of indexing
			--			end
			--			--/run print(iStableMasterDB.ActiveSorts.CurrentSort.primary);
			--			
			--			if(UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1) then
			--			iStableMaster:Print("|cc224488f DEBUG: ".."|ccff2222fWarning:|cffffffff "..iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],(p2 or "nil"),(p3 or "nil"));
			--				SetSortPriority(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],p2,p3);
							
		--				elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"]==2) then
		--				iStableMaster:Print("|cc224488f DEBUG: ".."|ccff2222fWarning:|cffffffff "..(p1 or "nil"),iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],(p3 or "nil"));
		--					SetSortPriority(p1,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],p3);
		--				elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"]==3) then
		--				iStableMaster:Print("|cc224488f DEBUG: ".."|ccff2222fWarning:|cffffffff "..(p1 or "nil"),(p2 or "nil"),iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]);
		--					SetSortPriority(p1,p2,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]);
		--				else
		--					--SetSortPriority("Family",nil,nil);
		--						
		--				end

				

		--	elseif(GetSortPriority(1,2,3)[UIDROPDOWNMENU_MENU_VALUE["SubLevel"]] == iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]) then
		--	SetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],GetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i])*-1);
		--	else
		--				local p1 = "Family";
		--				local p2 = nil;
		--				local p3 = nil;
		--				if(GetSortPriority(1) == "String") then
		--					p1 = GetSortPriority(1);		
		--				end
		--				if(GetSortPriority(2) == "String") then
		--					p2 = GetSortPriority(2); -- not sure about this way of indexing				
		--				end
		--				if(GetSortPriority(3) == "String") then
		--					p3 = GetSortPriority(3); -- not sure about this way of indexing
		--				end


		--		if(UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1) then
		--			SetSortPriority(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],p2,p3);
		--		elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"]==2) then
		--			SetSortPriority(p1,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i],p3);
		--		elseif(UIDROPDOWNMENU_MENU_VALUE["SubLevel"]==3) then
		--			SetSortPriority(p1,p2,iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]);
		--		else
		--			SetSortPriority(p1,p2,p3);

		--		end
		--	end
			MasterFilterSort();
			end;
		
			if GetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]) == 0 then
			direction = " - No Direction";
			elseif(GetSortDirection(iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]) < 0) then
			direction = " - Descending";
			end
			info.text = iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]..direction;
			--iStableMaster:Print("|cc224488f DEBUG: |cffffffff".. GetSortPriority(1,2,3)[UIDROPDOWNMENU_MENU_VALUE["SubLevel"]]);--GetSortingValue(GetSortPriority(UIDROPDOWNMENU_MENU_VALUE["SubLevel"])), "Comparing to:", iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]);
			
			--if GetSortPriority(UIDROPDOWNMENU_MENU_VALUE["SubLevel"]) ~= "String" then
			--info.checked = false;
		--	else
			
			
				if UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 3 then
				info.checked = (iStableMasterDB.ActiveSorts.CurrentSort.tertiary == (iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]));
				elseif UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 2 then 
				info.checked = (iStableMasterDB.ActiveSorts.CurrentSort.secondary == (iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]));
				elseif UIDROPDOWNMENU_MENU_VALUE["SubLevel"] == 1 then 
				info.checked = (iStableMasterDB.ActiveSorts.CurrentSort.primary == (iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]));
				else
				end
				
			
			--info.checked = ((GetSortPriority(1,2,3)[UIDROPDOWNMENU_MENU_VALUE["SubLevel"]]) == (iStableMasterDB["ActiveSorts"]["ReverseLookUpIndex"][i]));
		--	end
			info.isNotRadio = false;
			info.hasArrow = false;
			info.notCheckable = false;
			UIDropDownMenu_AddButton(info, level);

		end	
	end
end

fistclick = false; -- for some reason this doesnt work anymore.
function openiStablesMasterSettings()
			if(firstclick == false) then
					if(not InterfaceOptionsFrame:IsShown()) then
						InterfaceOptionsFrame_OpenToCategory(iStableMasterSettingsFrame.name);				
						InterfaceOptionsFrame_OpenToCategory(iStableMasterSettingsFrame.name);
						fistclick = true;
					else
						HideUIPanel(InterfaceOptionsFrame);
					end
			else
					if(not InterfaceOptionsFrame:IsShown()) then
						InterfaceOptionsFrame_OpenToCategory(iStableMasterSettingsFrame.name);
						InterfaceOptionsFrame_OpenToCategory(iStableMasterSettingsFrame.name);		-- added to make up for unfunctioning logic
					else
						HideUIPanel(InterfaceOptionsFrame);
					end
			end
end

dietTooltip = CreateFrame('GameTooltip', "dietToolTip", nil, "GameTooltipTemplate");

function dietMouseOver(parent,text,state)
if(state) then 
GameTooltip:ClearLines();
GameTooltip:Hide();
else
if(not GameTooltip:IsShown()) then


GameTooltip:SetOwner(parent,"ANCHOR_CURSOR");
GameTooltip:AddLine("");
GameTooltip:SetText("Diet: ","|cFFFFFFFF",true);
GameTooltip:AddLine("");
GameTooltip:AddLine("|cFFFFFFFF"..text);

--print("Hello World");
GameTooltip:Show();
end
end
end


function spellMouseOver(parent,details,state)
if(state) then 
GameTooltip:ClearLines();
GameTooltip:Hide();
else
if(not GameTooltip:IsShown()) then


GameTooltip:SetOwner(parent,"ANCHOR_CURSOR");
GameTooltip:AddLine("");
GameTooltip:SetHyperlink("spell:"..details);

--print("Hello World");
GameTooltip:Show();
end
end
end



function PetMouseOver(parent,owner,state)
if(state) then 
GameTooltip:ClearLines();
GameTooltip:Hide();
else
if(not GameTooltip:IsShown() and parent["PetInfo"]["name"] ~= "N/A") then


GameTooltip:SetOwner(owner,"ANCHOR_CURSOR");
GameTooltip:AddLine("");
GameTooltip:SetText(parent["PetInfo"]["name"]..": ","|cFFFFFFFF",true);
if(IsExotic(parent["PetInfo"]["family"]))then
GameTooltip:AddLine("");
GameTooltip:AddLine("|cFFFFFFFF".."Exotic");
end
GameTooltip:AddLine("");
GameTooltip:AddLine("|cFFFFFFFF".."Family: "..parent["PetInfo"]["family"]);
GameTooltip:AddLine("");
GameTooltip:AddLine("|cFFFFFFFF".."Specialization: "..parent["PetInfo"]["talent"]);
GameTooltip:AddLine("");
GameTooltip:AddLine("|cFFFFFFFF".."Level "..parent["PetInfo"]["level"]);
 local nullcheck = parent["PetInfo"]["abilities"];
if nullcheck ~= nil then
	if(StringKeyTableLengthI(parent["PetInfo"]["abilities"]["talent"]) > 0) then

		for i=1,StringKeyTableLengthI(parent["PetInfo"]["abilities"]["talent"]) do
			GameTooltip:AddLine("");
			local name, rank, icon, castTime, minRange, maxRange = GetSpellInfo(parent["PetInfo"]["abilities"]["talent"][i]);
			if name ~= nil then
			GameTooltip:AddLine(name);
			end
			if icon ~= nil then
			GameTooltip:AddTexture(icon);
			end
				
		end
	end
end



--print("Hello World");
GameTooltip:Show();
end
end
end



function SaveActivePetsAsSquad() 

			if(iStableMasterStableDB["SavedSquads"] == nil) then
			iStableMasterStableDB["SavedSquads"] = {};

			end
--			if(StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad") == 0) then 
--			iStableMasterStableDB["SavedSquads"]["Squad"..1] = {}

--			end
			local indexToSaveAt = 1;
			for i = 1, StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad")+1 do
				--print(i);
				if(iStableMasterStableDB["SavedSquads"]["Squad"..i] == nil) then
				iStableMasterStableDB["SavedSquads"]["Squad"..i] = {};
				indexToSaveAt = i;
				break;
				end

			end
			local listToPrint = "";

--			print(indexToSaveAt);
			for i = 1,6 do
				if( i < 6 )then
					if(iStableMasterStableDB["PetInfo"]["ActiveSlot"..i]["name"] ~= "N/A") then
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i] = iStableMasterStableDB["PetInfo"]["ActiveSlot"..i];
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["CurrentSlot"] = i;
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["Slot"] = i;
					if(i == 1) then
					listToPrint = "Squad Saved: "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["name"];
					else
					listToPrint = listToPrint..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["name"];
					end
					else
					if(i == 1) then
					listToPrint = "Squad Saved: EmptySlot"..i;
					else
					listToPrint = listToPrint..", EmptySlot"..i;
					end
					
					end

				else
					if(iStableMasterStableDB["PetInfo"]["StableSlot"..1]["name"] ~= "N/A") then
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i] = iStableMasterStableDB["PetInfo"]["StableSlot1"];
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["CurrentSlot"] = i;
						iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["Slot"] = i;
					if(i == 1) then
					listToPrint = "Squad Saved: "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["name"];
					else
					listToPrint = listToPrint..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..i]["name"];
					end
					else
					if(i == 1) then
					listToPrint = "Squad Saved: EmptySlot"..i;
					else
					listToPrint = listToPrint..", EmptySlot"..i;
					end
					end
				end
				
			
			end
			
			PopulateSquadScrollFrame();
			--iStableMaster:Print("Squad Saved: "..iStableMasterStableDB["SavedSquads"]["Squad"..2]["Pet"..1]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..2]["Pet"..2]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..2]["Pet"..3]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..2]["Pet"..4]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..2]["Pet"..5]["name"]..".");
			iStableMaster:Print(listToPrint);
--			iStableMaster:Print("Squad Saved: "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..1]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..2]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..3]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..4]["name"]..", "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..5]["name"].."."); -- And AnimalCompanion Slot: "..iStableMasterStableDB["SavedSquads"]["Squad"..indexToSaveAt]["Pet"..6]["name"]..".");

end


function DeleteSquad(index)


	iStableMasterStableDB["SavedSquads"]["Squad"..index] = nil;


end


function FindKeyByTableAndValue(table,value)


    for k, v in pairs(table) do
		
        if(tContains(table,value)) then
	    return table[k];
		end
    end




end


function ApplySquad(squadindex)
	-- failsafe incase anyone plays with the functions:
		if(squadindex > StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad")) then 
		return;
		end
	-- actual function
	for i = 1, 6 do

		if( iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i] ~= nil ) then
			if(iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["Slot"] ~= iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["CurrentSlot"] and iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["name"] ~= "N/A") then
				
				C_Timer.After(0.5*i,function() SetPetSlot(iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["CurrentSlot"], iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["Slot"]); if(debugEnabled[presets_Swaps]) then print(iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["CurrentSlot"].."to slot"..iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["Slot"]); end UpdateSquadCurrentSlots(iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["CurrentSlot"],iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["Slot"]);end);
				---i need to add a safety for exotic pets here when not specced as beast mastery
				--if(not GlobalSpecialization == "Beast Mastery") then -- i think this causes an issue to have outside UpdateSquadeCurrentSlots as it prevents it from being called properly
				----and exits the function. Break might also fix the issue but since its checked in the method to be called later it shouldnt be needed.
				--if(tContains(ExoticFamilies,iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["family"])) then
				--return;
				--end					 
				--end												
	            --iStableMasterStableDB["SavedSquads"]["Squad"..squadindex]["Pet"..i]["CurrentSlot"] = i; -- updates own current slot to be the target slot

			end
		end

	end

end

function UpdateSquadCurrentSlots(slot,newSlot) 
	if(not IsAtStableMaster()) then
		return; 
	end 

	if( iStableMasterStableDB["SavedSquads"] == nil ) then 

	return;

	end


	if(newSlot < 6) then
			if(not IsSpellKnown(iStableMasterDB["Constants"]["CALL_PET_SPELL_IDS"][newSlot])) then
				return;
			end
			if(not GlobalSpecialization == "Beast Mastery") then -- prevents false tracking when drag and drop eventually fails on exotic creatues while not specced as Beast Mastery
				if(IsStabledPetExotic(newSlot) or IsStabledPetExotic(slot)) then
					return;
				end
			end
			
			
	end
	
				local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");
						for i = 1, squadslimit do																
							for j = 1, 6 do
								if(iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j] ~= nil) then		
									if(iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] == newSlot) then -- takes target being moved's currentSlot's value and set the target at destination's new CurrentSlot
										iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] = slot;

									elseif(iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] == slot) then -- updates own current slot to be the target slot
										iStableMasterStableDB["SavedSquads"]["Squad"..i]["Pet"..j]["CurrentSlot"] = newSlot;
									end
								end
							end
						end
		
end



function WipeAllSquads() 

local squadslimit = StringKeyTableLength(iStableMasterStableDB["SavedSquads"],"Squad");
						for i = 1, squadslimit do
							
							DeleteSquad(i)

						end
						
end


function SetAsFavourite(petIndex)

ScrollFrameArrElem["ScrollElementChild"..petIndex]["PetInfo"]["favourite"] = true;
if(petIndex < 6) then
iStableMasterStableDB["PetInfo"]["ActiveSlot"..petIndex]["favourite"] = true;
elseif(petIndex == 6 and GlobalSpecialization == "Beast Mastery") then
iStableMasterStableDB["PetInfo"]["ActiveSlot"..petIndex]["favourite"] = true;
else
iStableMasterStableDB["PetInfo"]["StableSlot"..petSlot-5]["favourite"] = true;
end


end


function SetAsFavouriteSafe(i)
ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["favourite"] = true;
iStableMasterStableDB["PetInfo"]["StableSlot"..i]["favourite"] = true;
end



------------
-- FILTERS
-- SCROLL LIST BEHAVIOUR
-----------
function HideNonFilterSpecs(flip)


ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
local visibleCount = 0;
			


	for i = 1,ScrollFrameArrElem.length-1 do
			
			
			local includeflip = false;
			if(flip == true) then
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == nil ) == flip or not GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"]));
			else
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == nil ) == flip and not GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"]));
			end 

			if(includeflip) then
			ScrollFrameArrElem["ScrollElement"..i]:Hide();
			else

				if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
					if(i <= GlobalActiveSlotLoopValue) then
						ScrollFrameArrElem["ScrollElement"..i]:Hide();
						if(GlobalActiveSlotLoopValue == 6) then
							ScrollFrameArrElem["ScrollElement"..6]:Hide();
							firstScrollIndex = 7;
						else
							ScrollFrameArrElem["ScrollElement"..6]:Show();
							firstScrollIndex = 6;
						end
				
					end
				else
					if(i <= 6) then
					ScrollFrameArrElem["ScrollElement"..i]:Show();
					firstScrollIndex = 1;									
					
					end
	
				end
				if(i>GlobalActiveSlotLoopValue) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				end
				visibleCount = visibleCount +1;
			
			
			end



	end

	local maxSizeY = ((visibleCount-5)* (ScrollFrameArrElem["ScrollElementSizeY"]+4))-(((visibleCount)-2) * 4);
	local minSizeY = (ScrollFrameArrElem["ScrollElementSizeY"]+4)*10;
	if(maxSizeY > minSizeY) then
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	end


end

function MoveHiddenSpecsToBottomOfScroll(flip)
	local swapindex = {};
	local firstScrollIndex = 1;
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
	ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	swapindex.length = StringKeyTableLengthI(swapindex)+1;
	--print(point);
	



	for i = 1,ScrollFrameArrElem.length do	
			--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			--local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;					
				end
	
			end


			--local j = swapindex[i+firstScrollIndex-1];
			--if(j ~= nil) then
			----ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--end
			local j = i + firstScrollIndex - 1;
			

			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			if(flip == true) then
			includeflip = (		(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) == flip and GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["talent"])	);
			else
			includeflip = (		(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) == flip 	);
			end
				if(includeflip)  then
					

					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Not Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end


		
		--swapindex.lastNonEmptyIndex = swapindex.length;

		for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			
			


			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			if(flip == true) then
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip or not GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["talent"]));

			else

			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip and GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["talent"]));

			end

				if(includeflip) then
					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length .."] = "..swapindex[swapindex.length]);
					end
				end
			end
		end
	
	for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			
			


			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			if(flip == true) then
			includeflip = (false);

			else

			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip and not GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["talent"]));

			end

				if(includeflip) then
					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end



		--local filterAppliedArray = FilterAfter(swapindex,firstScrollIndex,"","Cunning","","","");
		
		

		for i = 1, swapindex.length do
			
			--if(notverytrue) then
			--local j = filterAppliedArray[i];
			--print("J: "..j.." - I: "..swapindex[i]);
			--else
			--local j = swapindex[i];
			--end
			local j = swapindex[i];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:ClearAllPoints();
			if(i == 1) then
			k = ElementSizeY*(i-1);
			else
			k = ElementSizeY*(i-1);
			end
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint("TOPLEFT", ScrollFrameArrElem["ScrollElement"..0],"TOPLEFT", 4,-ElementSizeY*(i-1)-16);

			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--print("J: "..j);
			else
			--print("J: nil");
			end

			--ScrollFrameArrElem["ScrollElement"..17]:SetPoint(select(1,ScrollFrameArrElem["ScrollElement0"]:GetPoint(1)), 4,-(44*(1-1))-16);

		end



end


function UpdateFilterSpecs(bool)
if( GetFilterValue("AnyFilter")) then
	--MoveHiddenSpecsToBottomOfScroll(bool);
	--HideNonFilterSpecs(bool);
	MasterFilterSort("",not bool);
	

end

end
function UpdateFilterDiets(bool)
if( GetFilterValue("AnyFilter")) then
	--MoveHiddenDietsToBottomOfScroll(bool);
	--HideNonFilterDiets(bool);
	MasterFilterSort("",not bool);
	

end

end





function UpdateScrollListMainCall()
if(GetFilterValue("AnyFilter")) then
				UpdateFilterSpecs(true);
else
				--HideEmptyScrollSlots();
				--MoveEmptySlotsToBottomOfScroll();
				MasterFilterSort();

end

end

function HideNonFilterDiets(flip)


ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
local visibleCount = 0;
			


	for i = 1,ScrollFrameArrElem.length-1 do
			
			
			local includeflip = false;
			local dietList = { GetStablePetFoodTypes(i) };
			local filterFood = GetFilterValue("Diets");
			local hasFood = true;
			for count = 1,9 do 
				if(not filterFood[dietList[count]]) then
					local hasFood = false;
				end

			end
			if(flip == true) then
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == nil ) == flip or not hasFood);
			else
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["talent"] == nil ) == flip and not hasFood);
			end 

			if(includeflip) then
			ScrollFrameArrElem["ScrollElement"..i]:Hide();
			else

				if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
					if(i <= GlobalActiveSlotLoopValue) then
						ScrollFrameArrElem["ScrollElement"..i]:Hide();
						if(GlobalActiveSlotLoopValue == 6) then
							ScrollFrameArrElem["ScrollElement"..6]:Hide();
							firstScrollIndex = 7;
						else
							ScrollFrameArrElem["ScrollElement"..6]:Show();
							firstScrollIndex = 6;
						end
				
					end
				else
					if(i <= 6) then
					ScrollFrameArrElem["ScrollElement"..i]:Show();
					firstScrollIndex = 1;									
					
					end
	
				end
				if(i>GlobalActiveSlotLoopValue) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				end
				visibleCount = visibleCount +1;
			
			
			end



	end

	local maxSizeY = ((visibleCount-5)* (ScrollFrameArrElem["ScrollElementSizeY"]+4))-(((visibleCount)-2) * 4);
	local minSizeY = (ScrollFrameArrElem["ScrollElementSizeY"]+4)*10;
	if(maxSizeY > minSizeY) then
	ScrollFrameArrElem["ScrollElement0"]:SetSize((StablesRightFrame.ScrollFrame:GetWidth()),maxSizeY);
	end


end


function MoveHiddenDietsToBottomOfScroll(flip)




local swapindex = {};
	local firstScrollIndex = 1;
	local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
	ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	swapindex.length = StringKeyTableLengthI(swapindex)+1;
	--print(point);
	



	for i = 1,ScrollFrameArrElem.length do	
			--local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
			--local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];
			if(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
				if(i <= GlobalActiveSlotLoopValue) then
					ScrollFrameArrElem["ScrollElement"..i]:Hide();
					if(GlobalActiveSlotLoopValue == 6) then
					ScrollFrameArrElem["ScrollElement"..6]:Hide();
					firstScrollIndex = 7;
					else
					ScrollFrameArrElem["ScrollElement"..6]:Show();
					firstScrollIndex = 6;
					end
				
				end
			else
				if(i <= 6) then
				ScrollFrameArrElem["ScrollElement"..i]:Show();
				firstScrollIndex = 1;					
				end
	
			end


			--local j = swapindex[i+firstScrollIndex-1];
			--if(j ~= nil) then
			----ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			
			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--end
			local j = i + firstScrollIndex - 1;
			

			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			local dietList = { GetStablePetFoodTypes(j) };
			local filterFood = GetFilterValue("Diets");
			local hasFood = true;
			for count = 1,9 do 
				if(not filterFood[dietList[count]]) then
					local hasFood = false;
				end

			end
			


			if(flip == true) then
			includeflip = (		(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) == flip and hasFood	);
			else
			includeflip = (		(not(ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil)) == flip 	);
			end
				if(includeflip)  then
					

					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Not Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end


		
		--swapindex.lastNonEmptyIndex = swapindex.length;

		for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			
			


			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			local DietList = { GetStablePetFoodTypes(j) };
			local filterFood = GetFilterValue("Diets");
			local hasFood = true;
			for count = 1,9 do 
				if(not filterFood[DietList[count]]) then
					local hasFood = false;
				end

			end
			if(flip == true) then
			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip or not hasFood);

			else

			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip and hasFood);

			end

				if(includeflip) then
					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length .."] = "..swapindex[swapindex.length]);
					end
				end
			end
		end
	
	for i = 1,ScrollFrameArrElem.length  do 
			local j = i + firstScrollIndex - 1;
			
			


			if(j < ScrollFrameArrElem.length) then
			local includeflip = false;
			local DietList = { GetStablePetFoodTypes(j) };
			local filterFood = GetFilterValue("Diets");
			local hasFood = true;
			for count = 1,9 do 
				if(not filterFood[DietList[count]]) then
					local hasFood = false;
				end

			end

			if(flip == true) then
			includeflip = (false);

			else

			includeflip = ((ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == "N/A" or ScrollFrameArrElem["ScrollElementChild"..j]["PetInfo"]["name"] == nil ) == flip and not hasFood);

			end

				if(includeflip) then
					swapindex[swapindex.length] = j;
					swapindex.length = swapindex.length+1;
					if(debugEnabled[switchstack_MoveEmptyAndOccupiedScrollSlots]) then
						print("Empty: "..j.." - swapindex["..swapindex.length+1 .."] = "..swapindex[swapindex.length+1]);
					end
				end
			end
		end



		--local filterAppliedArray = FilterAfter(swapindex,firstScrollIndex,"","Cunning","","","");
		
		

		for i = 1, swapindex.length do
			
			--if(notverytrue) then
			--local j = filterAppliedArray[i];
			--print("J: "..j.." - I: "..swapindex[i]);
			--else
			--local j = swapindex[i];
			--end
			local j = swapindex[i];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:ClearAllPoints();
			if(i == 1) then
			k = ElementSizeY*(i-1);
			else
			k = ElementSizeY*(i-1);
			end
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint("TOPLEFT", ScrollFrameArrElem["ScrollElement"..0],"TOPLEFT", 4,-ElementSizeY*(i-1)-16);

			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--print("J: "..j);
			else
			--print("J: nil");
			end

			--ScrollFrameArrElem["ScrollElement"..17]:SetPoint(select(1,ScrollFrameArrElem["ScrollElement0"]:GetPoint(1)), 4,-(44*(1-1))-16);

		end


end





---  OVERALL MASTER PLAN FOR SORTING

--Using stack splitting we can filter out all the things that are not set to true in the filters, and add those together in the top of a list, while sorting the stack which contains only the filtered content, and then put the Empty slots either first or last

----- Stack 0 -----
--	/		\
--Stack 1  Stack 2	   Filter 1
--			/	--
--		/		--	
--	/			--
--Stack 1.1 Stack 2.2  Filter 2
--			/	--
--		/		--	
--	/			--
--Stack 1.2 Stack 2.3  Filter 3



-- (Stack 0 : EMPTY) > (Stack 2.3 :SORT) > (Stack 1.2 :HIDE)
--     1					   ....						2
------------------------------------------------------------


function MasterFilterSort(input,shouldflip)
--print(5443);
-- Variable declaration
local flip = shouldflip or false;
local stack0 = {};
local stack1 = {};
local stack2 = {};
local stack3 = {};
local point, relativeTo, relativePoint, xOfs, yOfs = ScrollFrameArrElem["ScrollElement0"]:GetPoint(1);
	local ElementSizeY = ScrollFrameArrElem["ScrollElementSizeY"];

do
	ScrollFrameArrElem.length = StringKeyTableLength(ScrollFrameArrElem,"ScrollElement");
	stack0.length = StringKeyTableLengthI(stack0)+1;
	stack1.length = StringKeyTableLengthI(stack1)+1;
	stack2.length = StringKeyTableLengthI(stack2)+1;
	stack3.length = StringKeyTableLengthI(stack3)+1;
	end
	--Variable declaration END

	-- Find All Empty Slots
	do
	for i = 1,ScrollFrameArrElem.length-1 do	
		ScrollFrameArrElem["ScrollElement"..i]:Show();
		if(ScrollFrameArrElem["ScrollElementChild"..i]["PetInfo"]["name"] == "N/A") then
		stack0[#stack0+1] = i;
		--stack0.length = stack0.length+1;
		else
		stack1[#stack1+1] = i;
		--stack1.length = stack1.length+1;

		end


		
	end
	end
	if(GetFilterValue("AnyFilter")) then

	-- DietsFilter
	do
		for i = 1,#stack1 do		
			
			local dietList = { GetStablePetFoodTypes(stack1[i]) };
			local filterFood = GetFilterValue("Diets");
			local hasFood = false;
			for count = 1,9 do 
				if(filterFood[dietList[count]]) then  -- this might be wrong
					hasFood = true;

				end
					--print(dietList[count], filterFood[dietList[count]], hasFood);
			end
			if(hasFood) then
			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			else
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;
			

			end
		
		end
		
		end	
			
	
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1);
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length;
		end
		wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2);
		end
		-- Update Done
		
	-- SpecFilter
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			if(GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["talent"])) then

			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			else
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;

			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done
	
	
	
	--print("5547");
	
	-- FamilyFilter
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			if(GetFilterValue(ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["family"])) then

			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			else
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;

			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done



		-- RenamedFilter ( IF checked show renamed, if unchecked do not show renamed.) I should have a show renamed only too)
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			-- if(GetFilterValue("Named") and ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["name"] ~= ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["family"]) then
			if(GetFilterValue("Named") ) then
			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			elseif(not GetFilterValue("Named") and ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["name"] ~= ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["family"]) then
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;
			else
			stack2[#stack2+1] = stack1[i];

			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done

		-- ActiveSlotsFilter ( IF checked show Activeslots, if unchecked do not show Active Slots. I should have a show ActiveSlots only too?)
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			-- if(GetFilterValue("Named") and ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["name"] ~= ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["family"]) then
			if(iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"]) then
			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			elseif(not iStableMasterOptionsDB["ScrollList"]["ShowActiveSlots"] and stack1[i] <= GlobalActiveSlotLoopValue ) then

--			if(i <= GlobalActiveSlotLoopValue) then
--					ScrollFrameArrElem["ScrollElement"..i]:Hide();
--					if(GlobalActiveSlotLoopValue == 6) then
--					ScrollFrameArrElem["ScrollElement"..6]:Hide();
--					firstScrollIndex = 7;
--					else
--					ScrollFrameArrElem["ScrollElement"..6]:Show();
--					firstScrollIndex = 6;
--					end
				
--				end
--			else
--				if(i <= 6) then
--				ScrollFrameArrElem["ScrollElement"..i]:Show();
--				firstScrollIndex = 1;					
--				end

			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;
			else
			stack2[#stack2+1] = stack1[i];

			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done


		-- FavouritesFilter
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			if(GetFilterValue("Favourite")) then

			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			elseif(not GetFilterValue("Favourite") and ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["favourite"]) then
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;
			else
			stack2[#stack2+1] = stack1[i];

			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done



	-- ExoticFilter ( IF checked show exotic, if unchecked do not show exotic.) I should have a show exotic only too)
	do
		for i = 1,#stack1 do		
	--		print(5519,stack1[i]);
			if(GetFilterValue("Exotic")) then

			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
			elseif(not GetFilterValue("Exotic") and IsExotic(ScrollFrameArrElem["ScrollElementChild"..stack1[i]]["PetInfo"]["family"])) then
			stack3[#stack3+1] = stack1[i];
			--stack3.length = stack3.length+1;
			
			else
			stack2[#stack2+1] = stack1[i];


			end	
		end
		
		end	
	--	print(5532);
		-- UpdateStack1
		do
		--wipe(stack1);
		stack1 = {};
		--stack1.length = StringKeyTableLengthI(stack1)+1;
		for i = 1,#stack2 do	
		stack1[#stack1+1] = stack2[i];
		--stack1.length = stack1.length+1;
		end
		--wipe(stack2);
		stack2 = {};
		--stack2.length = StringKeyTableLengthI(stack2)+1;
		end
		-- Update Done
	
	
	
	end -- filtersend
	-- sort filtered stack
	-- This is where Search is included as the outer most layer.
	
		-- Sort Variable declaration and init
		
		local sortpriority = {iStableMasterDB["ActiveSorts"]["CurrentSort"].primary,iStableMasterDB["ActiveSorts"]["CurrentSort"].secondary,iStableMasterDB["ActiveSorts"]["CurrentSort"].tertiary} 
		if type(GetSortPriority(1,2,3)) == "table" then
			--sortpriority =  GetSortPriority(1,2,3);	
		
		end
		--print(sortpriority[1],sortpriority[2],sortpriority[3]);
		local subSortIntervals1 = {};
		local subStack1 = {};
		--subStack1.length = StringKeyTableLengthI(subStack1)+1;
		local subSortIntervals2 = {};
		local subStack2 = {};
		--subStack2.length = StringKeyTableLengthI(subStack2)+1;
		local subSortIntervals3 = {};
		local subStack3 = {};
		--subStack3.length = StringKeyTableLengthI(subStack3)+1;
		local subSortIntervals4 = {};
		local subStack4 = {};
		--subStack4.length = StringKeyTableLengthI(subStack4)+1;
		local subSortIntervals5 = {};
		local subStack5 = {};
		--subStack5.length = StringKeyTableLengthI(subStack5)+1;
		local subSortIntervals6 = {};
		local subStack6 = {};
		--subStack6.length = StringKeyTableLengthI(subStack6)+1;
		local subSortIntervals7 = {};
		local subStack7 = {};
	--	subStack7.length = StringKeyTableLengthI(subStack7)+1;
		local subSortIntervals8 = {};
		local subStack8 = {};
	--	subStack8.length = StringKeyTableLengthI(subStack8)+1;

		StackOfIndiciesAndWeights = {Weight = {}, Value={}, Param={}};

		for i = 1,#stack1 do
		StackOfIndiciesAndWeights.Weight[stack1[i]] = 0;
		StackOfIndiciesAndWeights.Value[i] = stack1[i];
		StackOfIndiciesAndWeights.Param[i] = nil;
		end
		subStack1ParamStack = {};
		subStack2ParamStack = {};
		subStack3ParamStack = {};
		
		-- Sort Variable declaration and init END
		do

		for i=0,3 do
			
			-- Drop subsortintervals. Instead we sort every time, and add weights that are spaced 205^i such that sorting by weights will sort all layers correctly. Reset the Weights every call at the very first thing in the loop.
			repeat
			if((input == "N/A" or input == nil or input == "") and i == 0) then 
			--iStableMaster:Print("|cc224488f DEBUG: |fffffff"..""); 
			--iStableMaster:Print("|cc884422f DEBUG: |ccfffffff".." "..(input or ""));
			break end;
			
			

			if(i == 0 and input ~= "N/A" and input ~= nil and input ~= "") then --search function here
			
			subStack1 = stack1;
			--print("Substack length: " ..#subStack1)
			
				for j = 1,#subStack1  do 
					if(string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"],input) ~= nil) then
						--for h = 1,#subStack1  do 
			
							--if(string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[h]]["PetInfo"]["name"],input) == nil) then
							
								subStack1ParamStack[#subStack1ParamStack+1] = select(1,string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"],input));
								--print("Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"].." Score: "..subStack1ParamStack[#subStack1ParamStack].." Input: "..input);
								subStack2ParamStack[#subStack2ParamStack+1] = select(2,string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"],input)) - select(1,string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"],input));
								subStack2[#subStack2+1] = subStack1[j];
								--print("Test this output: " .. subStack1ParamStack[#subStack1ParamStack]);
								
								--subStack2.length = subStack2.length +1;
								--print("paramstack length: "..subStack1ParamStack[#subStack1ParamStack]);
							--end
						--end			
				
				--	end
					elseif(string.find(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"],input) == nil) then
							
							
							
							
							subStack3[#subStack3+1] = subStack1[j];
							--subStack3.length = subStack3.length +1;
					end
				end

				subStack2, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,1);
				--subStack3ParamStack = select(1,BubbleSortTableAndParamtableByParamtable(subStack2,subStack2ParamStack,-1));
				for j = 1, #subStack2 do
			--	 print("Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack2[j]]["PetInfo"]["name"].." Score: "..subStack1ParamStack[j]);
				end
				for j = 1, #subStack3 do
					if(#subStack1ParamStack == 0) then 
		--				print("Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack3[j]]["PetInfo"]["name"].." Score: "..1);
					else 
			--			print("Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack3[j]]["PetInfo"]["name"].." Score: "..(subStack1ParamStack[1]+1));
					end
				end
		--		for j=1, #subStack2 do
				 
	--				for k =1, #subStack2-1 do 
	--				if(subStack1ParamStack[k] == subStack1ParamStack[k+1]) then 
							
		--					local swap;
		--					local swapE;
		--					local swapD;
							--print("compare j: "..l_equivalentParamTable[j].." With j+1: ", l_equivalentParamTable[j+1]);
	--						if(subStack2ParamStack[k] > subStack2ParamStack[k+1]) then
							--swap
	--						swap = subStack2[k];
	---						subStack2[k] = subStack2[k+1];
	--						subStack2[k+1] = swap;

			

	--						swapE = subStack2ParamStack[k];
--							subStack2ParamStack[k] = subStack2ParamStack[k+1];
		--					subStack2ParamStack[k+1] = swapE;
							
		--					swapD = subStack1ParamStack[k];
		--					subStack1ParamStack[k] = subStack1ParamStack[k+1];
		--					subStack1ParamStack[k+1] = swapD;
		--					end
		--				end
		--				end
		--		end



				--print("Substack1 length: " ..#subStack1);
			--	print("Substack2 length: " ..#subStack2);
				--print("Substack3 length: " ..#subStack3);
			-- when the search matching has been completed do a stable sort:
			--wipe(subStack1);
			--print(#subStack1ParamStack);
			--for prntI=1, #subStack2 do
			--print(subStack2[prntI]);
			--end
			--local tempStackForParams = subStack1ParamStack;		
			local WorstMachedCharPos = 1;
			for j = 1, #subStack2 do
		
			if ( WorstMachedCharPos <= subStack1ParamStack[j]) then 
			WorstMachedCharPos = subStack1ParamStack[j]+1
			end
			--	print("|cff4b705a Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack2[j]]["PetInfo"]["name"].." Score: ".. subStack1ParamStack[j]);

			end

			for j = 1, #subStack3 do
								subStack2[#subStack2+1] = subStack3[j];
								subStack1ParamStack[#subStack1ParamStack+1] = WorstMachedCharPos;
				end 
			for j = 1,#subStack2 do

			--print("|cff4b705a Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"].." Score: ".. subStack1ParamStack[j]);
			end
			subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,1);
			--print(#subStack1);
				
				
			for j=1, #subStack1 do 
		--	print("|cff4b705a Name: "..ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["name"].." Score: ".. subStack1ParamStack[j]);
			end
				-- subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack);
				StackOfIndiciesAndWeights.Value = subStack1;
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i,subStack1);
					--		print(#StackOfIndiciesAndWeights.Weight);
							for j = 1, #StackOfIndiciesAndWeights.Weight do
							--print("Index: "..StackOfIndiciesAndWeights.Value[j].."Weight: "..StackOfIndiciesAndWeights.Weight[j]);
							end


			--subStack1.length = StringKeyTableLengthI(subStack1)+1;
			--for prntI=1, #subStack1 do
			--print(subStack1[prntI]);
			--end
			--print(#tempStackForParams);
			--/run MasterFilterSort("Boar")
			
			--for prntI=1, #subStack3 do
			--print(subStack3[prntI]);
			--end
			



			--subSortIntervals1 = SetSubSortRanges(subStack1, "name");
			--subSortIntervals1 = SetSubSortRanges(subStack1, "search", subStack1ParamStack);
			--for j=1,#subSortIntervals1 do
			--print(table.concat(subSortIntervals1[j],"; "));
			--end
			--subStack8 = subStack3;
			--for prntI=1, #subStack8 do
			--print(subStack8[prntI]);
			--end
			
			--subStack8.length = StringKeyTableLengthI(subStack8)+1;
			
			--wipe(subStack3);
			--subStack3 = {};
			--print("Length of Substack8: "..#subStack8);
			--subStack3.length = StringKeyTableLengthI(subStack3)+1;
			--subSortIntervals8 = SetSubSortRanges(subStack8, "name");
			--subSortIntervals8 = SetSubSortRanges(subStack8, "search", subStack1ParamStack);
			--wipe(subStack1ParamStack);
			
			elseif i == 1 then
				if #subStack1+1 == 1 then -- checks if substack 1 is empty because i = 0 returned no matches
					subStack1 = stack1; -- if above is true, then it sets SubStack to match stack1 as if i = 1 is the first sort.
					

				end
			elseif i == 2 then
				 
				  
			elseif i == 3 then

			else
			--- nothing
			end

			

			if( not GetSortingValue("AnySort")) then --this is where we sort stack 1 and ofc wipe stack2 at the end if its been used. The sorting parameters can be one of many
			
			break;
			else
			--print("debug in loop"); 
				if(i == 1) then 
					iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting is still in development, and not everything is working as intended. It is also reccomended that you clear your saved variables in: |cc00ff00f".." 'World of Warcraft\\_retail_\\WTF\\Account\\{accountnumber}\\SavedVariables\\iStableMaster.lua' ".."|cffffffff For the best results.");		
				end
			end
  if(i~=0) then
			subStack1 = stack1;

			if type(GetSortPriority(1,2,3)) == "boolean" then
			break;
			end
--			print(sortpriority[i],i);
		--	print("im supposed to debug", i);
			if sortpriority[i] == "Expansions" then
				iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");			

			elseif sortpriority[i] == "Specialization" then
				--print(sortpriority[i],i);
			--Specialization = {Cunning = 1, Tenacity = 2,Ferocity = 3, Direction < 0 > Direction}
				subStack1ParamStack = {};
				subStack2 = {};
				for j = 1,#subStack1  do 
								subStack1ParamStack[#subStack1ParamStack+1] = GetSortingValue("Specializations",ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["talent"]);
								subStack2[#subStack2+1] = subStack1[j];
								
								--print("paramstack length: "..subStack1ParamStack[#subStack1ParamStack]);
							
					
					
					end
					subStack1 = {};
					subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,GetSortingValue("Specializations","Direction"));
					--subSortIntervals1 = SetSubSortRanges(subStack1, "search", subStack1ParamStack);
					

				StackOfIndiciesAndWeights.Value = subStack1;
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
				--print(StackOfIndiciesAndWeights.Param);
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i, subStack1);
			


			elseif sortpriority[i] == "Name" then
				--print(sortpriority[i],i);
				
			-- name sorting here
								
					subStack1ParamStack = {};
					subStack2 = {};
					if(GetSortingValue("Name") > 0) then
					subStack2 = NameSortAZ(subStack1);
					else
					subStack2 = NameSortZA(subStack1);
					end
					for j = 1,#subStack1  do 
								subStack1ParamStack[#subStack1ParamStack+1] = j;
								--subStack2[#subStack2+1] = NameSortAZ(subStack1);
								
								--print("paramstack length: "..subStack1ParamStack[#subStack1ParamStack]);
							
					
					
					end

					subStack1 = {};
					subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,1);
					--subSortIntervals1 = SetSubSortRanges(subStack1, "search", subStack1ParamStack);
					

				StackOfIndiciesAndWeights.Value = subStack1
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
			--	print(StackOfIndiciesAndWeights.Param);
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i, subStack1);
										

			elseif sortpriority[i] == "Family" then 
				--print(sortpriority[i],i);
			
				subStack1ParamStack = {};
				subStack1 = {};
				subStack1 = stack1;
				subStack2 = {};
				for j = 1,#subStack1 do 
								subStack1ParamStack[#subStack1ParamStack+1] = GetSortingValue("Family",ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["family"]) or -1;
								subStack2[#subStack2+1] = subStack1[j];
								if(GetSortingValue("Family",ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["family"]) == nil) then 
								--print(subStack1[j]);
								--print(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"].name);
								iStableMaster:Print("An Error has been spottet in your WTF folder: Please check the |cc00ff00f".." 'World of Warcraft\\_retail_\\WTF\\Account\\{accountnumber}\\SavedVariables\\iStableMaster.lua'".."|ccfffffff ".."while the game is closed and correct the family name for:"..ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"].name.." Or delete the file, but this will reset all your preferences too");
								end
								--print("|cc3355fff paramstack["..#subStack1ParamStack.."]: "..subStack1ParamStack[#subStack1ParamStack]);
								--print("|cc6622666 subStack2["..#subStack2.."]: "..subStack2[#subStack2]);
					
					
					end
					subStack1 = {};
					--print(#subStack2,#subStack1ParamStack);
					subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,GetSortingValue("Family","Direction"));
			--		subSortIntervals1 = SetSubSortRanges(subStack1, "search", subStack1ParamStack);
				
				StackOfIndiciesAndWeights.Value = subStack1;
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i,subStack1);

			elseif sortpriority[i] == "Diets" then

			--- this might need a rework
			--print(sortpriority[i],i);
			
				subStack1ParamStack = {};
				subStack1 = {};
				subStack1 = stack1;
				subStack2 = {};
				for j = 1,#subStack1 do 
								subStack1ParamStack[#subStack1ParamStack+1] = GetSortingValue("Diet",ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["diet"]) or -1;
								subStack2[#subStack2+1] = subStack1[j];
								if(GetSortingValue("Diet",ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"]["diet"]) == nil) then 
								--print(subStack1[j]);
								--print(ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"].name);
								iStableMaster:Print("|cc224488f DEBUG: ".."|ccff2222fWarning:|ccfffffff  An Error has been spottet in your WTF folder: Please check the |cc00ff00f".." 'World of Warcraft\\_retail_\\WTF\\Account\\{accountnumber}\\SavedVariables\\iStableMaster.lua'".."|ccfffffff ".."while the game is closed and correct the diet spelling for:"..ScrollFrameArrElem["ScrollElementChild"..subStack1[j]]["PetInfo"].diet.." Or delete the file, but this will reset all your preferences too");
								end
								--print("|cc3355fff paramstack["..#subStack1ParamStack.."]: "..subStack1ParamStack[#subStack1ParamStack]);
								--print("|cc6622666 subStack2["..#subStack2.."]: "..subStack2[#subStack2]);
					
					
					end
					subStack1 = {};
					--print(#subStack2,#subStack1ParamStack);
					subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack,GetSortingValue("Diet","Direction"));
			--		subSortIntervals1 = SetSubSortRanges(subStack1, "search", subStack1ParamStack);
				
				StackOfIndiciesAndWeights.Value = subStack1;
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i,subStack1);
			elseif sortpriority[i] == "Favourites" then
			iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		

			elseif sortpriority[i] == "Exotic" then
			iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		
			elseif sortpriority[i] == "Renamed" then
			iStableMaster:Print("|cfff8c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		


			elseif sortpriority[i] == "Rarity" then
			iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		
			elseif sortpriority[i] == "ActiveSlots" then
			iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		
			elseif sortpriority[i] == "AnimalCompanion" then
			iStableMaster:Print("|cfff88c00Attention:|cffffffff Sorting of "..sortpriority[i].." are not yet implemented");		
			end
			
			


			--- THIS IS A PASTE FROM ABOVE IN ELSIF == "NAME", code below may be changed. This bit is troublesome, because i now need to prep for additional layers. If I just SetSubSortRanges based on Name the issue is that if it wasn't Name last time, i will unsort the previous one on the next one, while keeping this one intact.
				-- So I somehow need to merge the SubSortIntervals by tracking its history, maybe I can use GetSortingValue(sortpriority[i-1]) beyond i = 0 when search true where it is Name.
				-- Maybe a function that merges the interval by poking "holes" in the list, and adapts based on whether i is 1 or 2 and if search conditions were met. This needs to be repeated with the appropriate variance in each category or made completely independent with the get call.
			
			
				--wipe(subStack1);
			--	subStack1 = subStack2;
			--	subStack1.length = StringKeyTableLengthI(subStack1)+1;
			--	subSortIntervals2 = subSortIntervals1;
		--		subSortIntervals1 = SetSubSortRanges(subStack1, "name");		

--			for j=1,stack2.length do
--				if(string.find(ScrollFrameArrElem["ScrollElementChild"..stack1[j]]["PetInfo"]["name"],ScrollFrameArrElem["ScrollElementChild"..stack2[j]]["PetInfo"]["name"])) then -- im not sure about this logic here
--					if(i == 1) then
--					subStack1[subStack1.length] = stack2[j];
--					subStack1.length = subStack1.length +1;
--					elseif(i == 2) then
--					local temp = subStack1;
--					wipe(subStack1);
--					subStack1 = {};
--					stack1.length = StringKeyTableLengthI(stack1)+1;

--					else

--					end
--				else
--					if(i == 1) then
--					subStack2[subStack2.length] = stack2[j];
--					subStack2.length = subStack2.length +1;
--					elseif(i == 2) then

--					else

--					end
						--- I need to split the stacks here such that i 1 primary gets sorted but i 1 secondary is also sorted in i 2 both these are then split again for level 3 sort. so that means 
						-- I need to add serch in this structure too
						-- i = 0        1=1;
						--				no match => 2 layer incresed same principle as below			
					---- i = 1			 1
								 --- /       \
								 ---1.1	      1.2
				--  i = 2			2.1         2.2
						---		   /  \	        /   \
							--2.11   2.12      2.21  2.22
				-- i = 3	  3.1     3.2        3.3      3.4
						---  /   \    /   \      /   \     /   \
						--3.11  3.12 3.21 3.22 3.31 3.32  3.41  3.42
				-- eol     1     2    3    4    5    6    7      8

				-- join in numeric order
							
				--end
			--end
			 
	
  end
	 --- This should take care of all itterations of Sort, as long as the SubStack 1 has been correctly set it should add the weights, here and then we sort the final thing based on the weights.
					
				if(subStack1 == {}) then 
				
				iStableMaster:Print("|cc224488f DEBUG: ".."|ccff2222fWarning:|cffffffff There is no subStack1 Saved for layer: "..i);
				
				else
				-- subStack1, subStack1ParamStack = BubbleSortTableAndParamtableByParamtable(subStack2,subStack1ParamStack);
				StackOfIndiciesAndWeights.Value = subStack1;
				StackOfIndiciesAndWeights.Param = subStack1ParamStack;
				--StackOfIndiciesAndWeights.Weight = StackOfIndiciesAndWeights[StackOfIndiciesAndWeights.Value[j]].Weight;
				StackOfIndiciesAndWeights.Weight = weighted_Sorting(StackOfIndiciesAndWeights, i,subStack1);
				
				--print("Last weights: "..#StackOfIndiciesAndWeights.Weight);
	
				end
	until true; 
	end
		
		---- Deprecated merge
		----- if(#subStack1~=0) then
		----	 for mergerI=1,#subStack8 do
		----	 subStack1[#subStack1+1] = subStack8[mergerI];
		----	 end
			--	print(#subStack1);
			 --for i = 1,#subStack8 do
				--print("subStack8: "..subStack8[i]);
			 --end
			 --for i = 1,#subStack1 do
				--print("To Be Stack 1: "..subStack1[i]);
			 --end
			
		----	 wipe(stack1);
		----	 stack1 = subStack1;
			 --for i = 1,#stack1 do
				--print(stack1[i]);
			 --end
	----		 stack1.length = StringKeyTableLengthI(stack1)+1;
			-- wipe(subStack1);
			-- wipe(subStack2);
			-- wipe(subStack8);
		--	 for i = 1,#stack1 do
			--	print(stack1[i]);
		--	 end
	---	end
		--- DEPRECATION FIELD END
		
			--	print("#Weigth: " ..#StackOfIndiciesAndWeights.Weight);
				sortOutParamStack = {};
				for i=1, #stack1 do
				sortOutParamStack[i] = StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[i]];
					if(StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[i]] == nil) then 
						sortOutParamStack[i] = 0;
					end
			--	print("|ccff44222 sortOutParamStack["..i.."]: "..sortOutParamStack[i]);
				end
				--stack1 = {};
				
				

				stack1 =  select(1,BubbleSortTableAndParamtableByParamtable(StackOfIndiciesAndWeights.Value,sortOutParamStack,nil));
				for j = 1, #stack1 do
				
				if(input == "N/A" or input == nil or input == "" and (StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[j]] == nil or ScrollFrameArrElem["ScrollElementChild"..StackOfIndiciesAndWeights.Value[j]]["PetInfo"]["name"] == nil or ScrollFrameArrElem["ScrollElementChild"..StackOfIndiciesAndWeights.Value[j]]["PetInfo"]["family"]) ) then 
				else
				--print("Weigths: " ..StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[j]]..", Name: "..ScrollFrameArrElem["ScrollElementChild"..StackOfIndiciesAndWeights.Value[j]]["PetInfo"]["name"]..", Spec: "..ScrollFrameArrElem["ScrollElementChild"..StackOfIndiciesAndWeights.Value[j]]["PetInfo"]["talent"]..", Family: "..ScrollFrameArrElem["ScrollElementChild"..StackOfIndiciesAndWeights.Value[j]]["PetInfo"]["family"]);
				end
				end		
	
	end
	-- sort end
	
	-- join stacks
	do
	if(flip)then--flip) then -- add empty either at top or bottom
		for i = 1,#stack1 do -- Add the filtered and sorted elements to the Empty stack
			stack0[#stack0+1] = stack1[i];
			--stack0.length = stack0.length+1;
			

		end

		for i = 1, #stack0 do
			stack2[#stack2+1] = stack0[i];
			--stack2.length = stack2.length+1;

		end


	else
		for i = 1, #stack0 do -- Add the Empty to the filtered and sorted elements stack
			stack1[#stack1+1] = stack0[i];
			ScrollFrameArrElem["ScrollElement"..stack0[i]]:Hide();
			--stack1.length = stack1.length+1;
			--stack2.length = stack2.length+1;

		end
		
		for i = 1, #stack1 do
			stack2[#stack2+1] = stack1[i];
			--stack2.length = stack2.length+1;
		end


	end
	

	for i = 1, #stack3 do -- Join the outfiltered and hidden elements with the visible and sorted stack
	--break;
	stack2[#stack2+1] = stack3[i];
	--stack2.length = stack2.length;
	ScrollFrameArrElem["ScrollElement"..stack3[i]]:Hide();

	end
	end
	--join stacks end

	--MoveAllElements Into Place
	do
	for i = 1, #stack2 do
			
			--if(notverytrue) then
			--local j = filterAppliedArray[i];
			--print("J: "..j.." - I: "..swapindex[i]);
			--else
			--local j = swapindex[i];
			--end
			local j = stack2[i];
			if(j ~= nil) then
			ScrollFrameArrElem["ScrollElement"..j]:ClearAllPoints();
			if(i == 1) then
			k = ElementSizeY*(i-1);
			else
			k = ElementSizeY*(i-1);
			end
			ScrollFrameArrElem["ScrollElement"..j]:SetPoint("TOPLEFT", ScrollFrameArrElem["ScrollElement"..0],"TOPLEFT", 4,-ElementSizeY*(i-1)-16);

			--ScrollFrameArrElem["ScrollElement"..j]:SetPoint(point, 4,-(ElementSizeY*(i-1-(firstScrollIndex-1)))-4);
			--print("J: "..j);
			else
			--print("J: nil");
			end

			--ScrollFrameArrElem["ScrollElement"..17]:SetPoint(select(1,ScrollFrameArrElem["ScrollElement0"]:GetPoint(1)), 4,-(44*(1-1))-16);

		end



	end
	--MoveAllElements Into Place End

end

function NameSortAZ(tableIn)


local inputstack = {};
local l_tempStack = {}
--l_tempStack.length = StringKeyTableLengthI(l_tempStack)+1;
					
					for j=1,#tableIn do
						inputstack[j] = ScrollFrameArrElem["ScrollElementChild"..tableIn[j]]["PetInfo"]["name"];
						--print(ScrollFrameArrElem["ScrollElementChild"..tableIn[j]]["PetInfo"]["name"], j);
					end
					local unsafeSortedStack = AlphabeticalSort(inputstack);
					for j=1,#tableIn do
						for jj=1,#tableIn do
						--print(ScrollFrameArrElem["ScrollElementChild"..tableIn[jj]]["PetInfo"]["name"], unsafeSortedStack[jj]);
							if(ScrollFrameArrElem["ScrollElementChild"..tableIn[jj]]["PetInfo"]["name"] == unsafeSortedStack[j])then
							local seen = false;
								for k=1,#l_tempStack do 
									if l_tempStack[k] == tableIn[jj] then
										seen = true;
									end
								end
								if(seen == false) then 
								--print(jj,tableIn[jj]);
								l_tempStack[#l_tempStack+1] = tableIn[jj];
								--l_tempStack.length =l_tempStack.length.length +1;
								break;
								end
							end
						end
					end
					--for j=1,#l_tempStack do
					
						--print("Stak out: "..l_tempStack[j], "Unstable Sorted stack"..unsafeSortedStack[j]);
					--end
					


	return l_tempStack;
	--return unsafeSortedStack;
end

function NameSortZA(tableIn)


local inputstack = {};
local l_tempStack = {}
--l_tempStack.length = StringKeyTableLengthI(l_tempStack)+1;
					
					for j=#tableIn,1,-1 do
						
						inputstack[#inputstack+1] = ScrollFrameArrElem["ScrollElementChild"..tableIn[j]]["PetInfo"]["name"];
						--print(ScrollFrameArrElem["ScrollElementChild"..tableIn[j]]["PetInfo"]["name"], j);
					end
					

					local unsafeSortedStack = AlphabeticalSort(inputstack);
					for j=1,#tableIn do
						for jj=1,#tableIn do
						--print(ScrollFrameArrElem["ScrollElementChild"..tableIn[jj]]["PetInfo"]["name"], unsafeSortedStack[jj]);
							if(ScrollFrameArrElem["ScrollElementChild"..tableIn[jj]]["PetInfo"]["name"] == unsafeSortedStack[j])then
							local seen = false;
								for k=1,#l_tempStack do 
									if l_tempStack[k] == tableIn[jj] then
										seen = true;
									end
								end
								if(seen == false) then 
								--print(jj,tableIn[jj]);
								l_tempStack[#l_tempStack+1] = tableIn[jj];
								--l_tempStack.length =l_tempStack.length.length +1;
								break;
								end
							end
						end
					end
					--for j=1,#l_tempStack do
					
						--print("Stak out: "..l_tempStack[j], "Unstable Sorted stack"..unsafeSortedStack[j]);
					--end
					local flipstack = {};
					for j=#l_tempStack,1,-1 do
					flipstack[#flipstack+1] = l_tempStack[j];
					end



	return flipstack;
	--return unsafeSortedStack;
end


  function AlphabeticalSort(input)
      local buffer = {}
      for i=1,#input do
         
		 buffer[i] = input[i];
      end

      table.sort(buffer)
      return buffer;
	  --print(table.concat(buffer));
   end
   function setContains(set, key)
    return set[key] ~= nil
	end

   

  function SetSubSortRanges(tableIn, paramIn, searchParamStack)
	



   local l_SubSortSets = {};
   l_SubSortSets[1] = {};

   local currentInterval = 1;
	for i=2,#tableIn do
			print(i,#tableIn, "i, Length");
		if paramIn == "search" then		
			--if #searchParamStack < 1 then break; end;
		--	print("SetSubSortRanges()>compare i: "..searchParamStack[i-1].." With i+1: ", searchParamStack[i]);
			if searchParamStack[i] == searchParamStack[i-1] then
				if i == #tableIn then
					l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i];
				else
				l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i-1];
				end
			else			
				currentInterval = currentInterval+1;
				l_SubSortSets[currentInterval] = {};
				if i == #tableIn then
					l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i];
				else
				l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i-1];
				end
		
			end
		
		else
	
			if ScrollFrameArrElem["ScrollElementChild"..tableIn[i-1]]["PetInfo"][paramIn] == ScrollFrameArrElem["ScrollElementChild"..tableIn[i]]["PetInfo"][paramIn] then
				
				if i == #tableIn then
					l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i];
				else
				l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i-1];
				end
			else			
				currentInterval = currentInterval+1;
				l_SubSortSets[currentInterval] = {};
				if i == #tableIn then
					l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i];
				else
					l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = tableIn[i-1];
				end
			end
		
		end
			
	end
	
	for i=1,#l_SubSortSets do
		print("SetSubSortRanges()>SubSortSets: "..table.concat(l_SubSortSets[i],";"));
	end
   return l_SubSortSets;


   
end


function MakeSubSortStacks(tableIn, paramIn)
 
	-- Perhaps make a dictionary for tha param in here.

   local l_SubSortSets = {};
   l_SubSortSets[1] = {};
   local currentInterval = 1;
	for i=1,#tableIn-1 do
		
		if ScrollFrameArrElem["ScrollElementChild"..tableIn[i]]["PetInfo"][paramIn] == ScrollFrameArrElem["ScrollElementChild"..tableIn[i+1]]["PetInfo"][paramIn] then
			

				l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = i;
				l_SubSortSets[currentInterval][#l_SubSortSets[currentInterval]+1] = i+1;

			
		elseif ScrollFrameArrElem["ScrollElementChild"..tableIn[i]]["PetInfo"][paramIn] ~= ScrollFrameArrElem["ScrollElementChild"..tableIn[i+1]]["PetInfo"][paramIn] then
				currentInterval = currentInterval +1;
				l_SubSortSets[currentInterval] = {};

			end
		end
	
	
   return l_SubSortSets;


   
end



function MergeSubSortRanges(rangesInPrevious,rangesInCurrent,previousParam,currentParam)
		if(rangesInPrevious == rangesInCurrent) then
		 return rangesInCurrent;
		end
			-- here i need to make a loop that "pokes holes" while not running out of index


end



--- FUNCTIONS I INTEND TO ADD TO A LIB:

function BubbleSortTableAndParamtableByParamtable(tableToSort,equivalentParamTable,inverse) 
	if not #tableToSort == #equivalentParamTable then
		return;
	end
	local l_tableToSort = tableToSort;
	local l_equivalentParamTable = equivalentParamTable;
	--print(equivalentPramTable[1]);

	local flip = inverse;

	if flip == nil then
	 inverse = 1;
	end
	
	
	if inverse < 0 then
	for i=1,#l_tableToSort do
		for j=1,#l_tableToSort-1 do 
			local swap;
			local swapE;
			--print("compare j: "..l_equivalentParamTable[j].." With j+1: ", l_equivalentParamTable[j+1]);
			if(l_equivalentParamTable[j] < l_equivalentParamTable[j+1]) then
			--swap
			swap = l_tableToSort[j];
			l_tableToSort[j] = l_tableToSort[j+1];
			l_tableToSort[j+1] = swap;

			

			swapE = l_equivalentParamTable[j];
			l_equivalentParamTable[j] = l_equivalentParamTable[j+1];
			l_equivalentParamTable[j+1] = swapE;





			end
		
		
		end


	end

	elseif inverse == nil or inverse > 0 then

	for i=1,#l_tableToSort do
		for j=1,#l_tableToSort-1 do 
			local swap;
			local swapE;
			--print("compare j: "..l_equivalentParamTable[j].." With j+1: ", l_equivalentParamTable[j+1]);
			if(l_equivalentParamTable[j] > l_equivalentParamTable[j+1]) then
			--swap
			swap = l_tableToSort[j];
			l_tableToSort[j] = l_tableToSort[j+1];
			l_tableToSort[j+1] = swap;

			

			swapE = l_equivalentParamTable[j];
			l_equivalentParamTable[j] = l_equivalentParamTable[j+1];
			l_equivalentParamTable[j+1] = swapE;





			end
		
		
		end


	end
	end
	for i=1,#l_tableToSort do
		--print("Params sorted: "..l_equivalentParamTable[i], "TableSorted: "..l_tableToSort[i]);
	end
	return l_tableToSort, l_equivalentParamTable;



end



-- weighted sorting -- i am unsure whether or not there should be 205 values at all times, or wether key with the same equity should have the same value.
-- 0-204 [+1]
-- 205-42.024 [+205]
-- 42.025-8.615.124 [+42.025]
-- 8.615.125-1.767.100.625 [+8.615.125]

lastPass = -1;
-- function weighted_Sorting(Table, ListTable, i) -- DataTable = Table, ListTable = list of indexes sorted/in order, i = sorting layer 
function weighted_Sorting(TableWithKeys, i,subStack1) -- new way is to just parse in the values and weights through the same table, i sorting layer still.  I am now tainting the same value so arg is irrellevant but required
 -- WeightIncrement = {8.615.125, 42.025, 205, 1};
	--print("hello world");
	--print(#TableWithKeys.Value, #TableWithKeys.Param, #TableWithKeys.Weight);
 -- if ( Table[slot x].value == Table[slot x-1].value ) then do

 --		ListTable[index - 1].weight =  ListTable[index].weight; elseif then 
 
 --		ListTable[index - 1].weight = ListTable[index].weight + WeightIncrement[i];
  if(i == 0 and lastPass ~= -1 )then

  lastPass = -1;
  

  end
 if(i == lastPass or i > 3 or i == nil) then return StackOfIndiciesAndWeights; end;
 -- end

 -- BubbleSortTableAndParamtableByParamtable(ListTable[index],ListTable[index].weight,inverse)  -- In the future the variable  for each parameter can be parsed here, so the each sort can be flipped individually
 -- Implementation below this line ---
 local index = i +1;

-- WeightIncrement = {8615125, 42025, 205, 1};
--  WeightIncrement = {74220378765625,1766100625, 42025, 1};
  WeightIncrement = {100000000000,1000000, 1000, 1};
 --print(WeightIncrement[index]);
	-- input of recently sorted stack is parsed here.
	local l_TableWithKeys = {Weight ={}};
--print(l_TableWithKeys.Value[1]);
	
  for k =1, #subStack1-1,1 do -- from 205 (if that is the length) to 0. Need to double check index range is not never 0.
  if(k == 1) then 
 if(index <= 1 or StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[1]] == nil) then 
 l_TableWithKeys.Weight[1] = WeightIncrement[index];
 --print("This one too"..index..", "..WeightIncrement[index]);
 else
--	print("This one "..index..", "..StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[1]]);
 l_TableWithKeys.Weight[1] = WeightIncrement[index] + StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[1]];
 end
 
 end
   -- The  making sure exist is not relevant here anyway, setting and reseeting it before the layer loop.

 --  if(ListTable[k-1].weight == nil) then  -- Make sure that there is a number to add an increment to
--	ListTable[k-1].weight = 0;
--	end
 -- if(ListTable[k].weight == nil) then  -- Make sure that there is a number to add an increment to
--	ListTable[k].weight = 0;
--	end
	

  if ( StackOfIndiciesAndWeights.Param[StackOfIndiciesAndWeights.Value[k]] == StackOfIndiciesAndWeights.Param[StackOfIndiciesAndWeights.Value[k+1]] ) then -- Compare the value of sorting. -- NB: Define value or make it interpretable
  l_TableWithKeys.Weight[k+1] =  l_TableWithKeys.Weight[k]; 
 -- print(l_TableWithKeys.Weight[k+1], index, WeightIncrement[index]);
  else
  l_TableWithKeys.Weight[k+1] = l_TableWithKeys.Weight[k] + WeightIncrement[index]; 
 -- print(l_TableWithKeys.Weight[k+1], index, WeightIncrement[index]);
  end
--print(l_TableWithKeys.Weight[k]);
 end
 lastPass = i;
 for k=1,#l_TableWithKeys.Weight do 
--	StackOfIndiciesAndWeights.Weight[k] = l_TableWithKeys.Weight[k] +  TableWithKeys.Weight[k];
	--l_TableWithKeys.Weight[k] = (l_TableWithKeys.Weight[k] + TableWithKeys.Weight[k]);
	if(StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[k]] ~= nil) then
	StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[k]] =  StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[k]] + l_TableWithKeys.Weight[k];
	 else
	 StackOfIndiciesAndWeights.Weight[StackOfIndiciesAndWeights.Value[k]] = l_TableWithKeys.Weight[k];
	 end
--	 print("Returns: "..l_TableWithKeys.Weight[k], index, WeightIncrement[index]);
 end
 return StackOfIndiciesAndWeights;

end

function weighted_SortingTaint(i) -- new way is to just parse in the values and weights through the same table, i sorting layer still. 
 -- WeightIncrement = {8.615.125, 42.025, 205, 1};
	--print("hello world");
	--print(#TableWithKeys.Value, #TableWithKeys.Param, #TableWithKeys.Weight);
 -- if ( Table[slot x].value == Table[slot x-1].value ) then do

 --		ListTable[index - 1].weight =  ListTable[index].weight; elseif then 
 
 --		ListTable[index - 1].weight = ListTable[index].weight + WeightIncrement[i];
  if(i == 0 and lastPass ~= -1 )then

  lastPass = -1;
  

  end
 if(i == lastPass or i > 3) then return TableWithKeys; end;
 -- end

 -- BubbleSortTableAndParamtableByParamtable(ListTable[index],ListTable[index].weight,inverse)  -- In the future the variable  for each parameter can be parsed here, so the each sort can be flipped individually
 -- Implementation below this line ---
 local index = i +1;

 -- WeightIncrement = {8615125, 42025, 205, 1};
--   WeightIncrement = {74220378765625,1766100625, 42025, 1};
    WeightIncrement = {100000000000,1000000, 1000, 1};
 print(WeightIncrement[index], index);
	-- input of recently sorted stack is parsed here.
	 l_TableWithKeys = TableWithKeys;
--print(l_TableWithKeys.Value[1]);

  for k =1, #l_TableWithKeys.Value-1,1 do -- from 205 (if that is the length) to 0. Need to double check index range is not never 0.
  if(k == 1) then 
 if(index <= 1) then 
 TableWithKeys.Weight[1] = WeightIncrement[index];
 else
 print("This one"..TableWithKeys.Weight[1]);
 TableWithKeys.Weight[1] = WeightIncrement[index] + TableWithKeys.Weight[1];
 end
 
 end
   -- The  making sure exist is not relevant here anyway, setting and reseeting it before the layer loop.

 --  if(ListTable[k-1].weight == nil) then  -- Make sure that there is a number to add an increment to
--	ListTable[k-1].weight = 0;
--	end
 -- if(ListTable[k].weight == nil) then  -- Make sure that there is a number to add an increment to
--	ListTable[k].weight = 0;
--	end
	

  if ( l_TableWithKeys.Param[l_TableWithKeys.Value[k]] == l_TableWithKeys.Param[l_TableWithKeys.Value[k+1]] ) then -- Compare the value of sorting. -- NB: Define value or make it interpretable
  l_TableWithKeys.Weight[k+1] =  l_TableWithKeys.Weight[k]; 
  else
  l_TableWithKeys.Weight[k+1] = l_TableWithKeys.Weight[k] + WeightIncrement[index]; 
  print(l_TableWithKeys.Weight[k+1], index, WeightIncrement[index]);
  end
--print(l_TableWithKeys.Weight[k]);
 end
 lastPass = i;
 for k=1,#l_TableWithKeys.Weight do 
	TableWithKeys.Weight[k] = l_TableWithKeys.Weight[k] +  TableWithKeys.Weight[k];
	--l_TableWithKeys.Weight[k] = (l_TableWithKeys.Weight[k] + TableWithKeys.Weight[k]);

 end
 return l_TableWithKeys;

end


--- END OF SECTION 
if(IsAddOnLoaded("AspectOfTheHunter")) then
-- Maybe use AspectOfTheHunter as Optional Dependency for spell data?

end


