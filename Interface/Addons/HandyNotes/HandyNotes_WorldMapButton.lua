-- HandyNotes Worldmap Button by fuba
--Version: 80300.01-Release ## Author: fuba
local HandyNotesWorldMapButtonFrame = CreateFrame("Frame");
local HandyNotesWorldMapButton = CreateFrame("Button", "HandyNotesWorldMapButton", WorldMapFrame.BorderFrame, "UIPanelButtonTemplate");
HandyNotesWorldMapButton:ClearAllPoints();
HandyNotesWorldMapButton:SetPoint("TOPRIGHT",-68,0);
HandyNotesWorldMapButton:SetSize(24, 24);
HandyNotesWorldMapButton:SetText("*");
HandyNotesWorldMapButton:RegisterForClicks("AnyUp");

local function SetIconTooltip(IsRev)
	if not WorldMapTooltip then return end
	WorldMapTooltip:Hide();
	WorldMapTooltip:SetOwner(HandyNotesWorldMapButton, "ANCHOR_BOTTOMLEFT");
	if HandyNotes:IsEnabled() then
		WorldMapTooltip:AddLine(HIDE..EMBLEM_SYMBOL, nil, nil, nil, nil, 1 );
	else
		WorldMapTooltip:AddLine(SHOW_MAP..ALL..EMBLEM_SYMBOL, nil, nil, nil, nil, 1 );
	end
	WorldMapTooltip:Show();
end

local function btnOnEnter(self, motion)
	SetIconTooltip(false);
end

local function btnOnLeave(self, motion)
	if WorldMapTooltip then
		WorldMapTooltip:Hide();
	end
end

local function btnOnClick(self)
	local db = LibStub("AceDB-3.0"):New("HandyNotesDB", defaults).profile;
	if HandyNotes:IsEnabled() then
		db.enabled = false
		HandyNotes:Disable();
	else
		db.enabled = true
		HandyNotes:Enable();
	end
	SetIconTooltip(false);
end

HandyNotesWorldMapButton:SetScript("OnClick", btnOnClick);
HandyNotesWorldMapButton:SetScript("OnEnter", btnOnEnter);
HandyNotesWorldMapButton:SetScript("OnLeave", btnOnLeave);
HandyNotesWorldMapButtonFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
HandyNotesWorldMapButtonFrame:SetScript("OnEvent", function(self, event, ...)
	if (event == "PLAYER_ENTERING_WORLD") then
			if HandyNotesWorldMapButton then
				HandyNotesWorldMapButton:Show();
			end;
	end
end)