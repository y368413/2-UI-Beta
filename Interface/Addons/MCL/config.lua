--------------------------------------------------------
-- Namespaces
--------------------------------------------------------
local MCL, core = ...;
core.Config = {};

local MCL_Load = core.Config;


local MCL_collectableMounts = 0
local MCL_u = 0
local MCL_rowC = 0
local MCL_x = 10
local MCL_y = -25
local MCL_MF
local MCL_currentFrame
local MCL_totalCollected
local MCL_complete
local MCL_totalc
local MCL_total
local MCL_mountCache = {}
local MCL_mountFrames = {}
local MCL_aCount = 0
local MCL_col = 0
local yTwo = -20

local function InitMounts()
	for b,n in pairs(core.mountList) do
		for h,j in pairs(n) do
			if(j.mounts) then
				for t = 1, #j.mounts do
					local MCL_cMount = C_MountJournal.GetMountFromItem(j.mounts[t])
					if MCL_cMount == nil then
						C_Timer.After(0, InitMounts)
						return
					end
				end
			end
		end
	end
	print("所有坐骑已载入!")
	MCL_Load.CreateMenu()
end

function MCL_Load:Toggle()
	if not MCLFrame then
		print(">>> MCL 加载中, 请稍候 <<<")
		InitMounts()
		return
	end
	MCLFrame:SetShown(not MCLFrame:IsShown());
end

function MCL_Load:CreateIcons(point, xOffset, yOffset, id, expID, collected, mount, mountID)
	mount = CreateFrame("Button", nil, expID, "BackdropTemplate")
	mount:SetPoint(point, expID, xOffset, yOffset)
	mount:SetSize(38, 38)
	mount.text = mount:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	mount.text:SetFont("Fonts\\FRIZQT__.TTF", 10)
	mount.text:SetPoint("BOTTOM", mount, "CENTER", 0, 0)
	mount.tex = mount:CreateTexture()
	mount.tex:SetAllPoints(mount)
	mount.tex:SetTexture(GetItemIcon(id))
	if collected then
		mount:SetBackdrop({
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 39,
		})
		mount:SetBackdropBorderColor(0, 1, 0)
	else
		mount:SetBackdrop({
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 39,
		})
		mount:SetBackdropBorderColor(1, 0, 0, 0.03)		
		mount.tex:SetVertexColor(0.75, 0.75, 0.75, 0.3);	
	end
	--Adding a tooltip for mounts
	local item, itemLink = GetItemInfo(id);
	mount:HookScript("OnEnter", function()
		if (itemLink) then
			GameTooltip:SetOwner(mount, "ANCHOR_TOP")
			GameTooltip:SetHyperlink(itemLink)
			mount:SetHyperlinksEnabled(true)
			_, description, source, _, mountTypeID, _, _, _, _ = C_MountJournal.GetMountInfoExtraByID(mountID)
			GameTooltip:AddLine(source)
			GameTooltip:Show()
		end
	end)
	mount:HookScript("OnLeave", function()
		GameTooltip:Hide()
	end)		
	return mount;
end
function MCL_Load:CreateMountIcons(point, xOffset, yOffset, expID, collected, icon, pos, spellID, mount)
	mount = CreateFrame("Button", nil, expID, "BackdropTemplate")
	mount:SetPoint(point, expID, xOffset, yOffset)
	mount:SetSize(38, 38)
	mount.text = mount:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	mount.text:SetFont("Fonts\\FRIZQT__.TTF", 10)
	mount.text:SetPoint("BOTTOM", mount, "CENTER", 0, 0)
	mount.tex = mount:CreateTexture()
	mount.tex:SetAllPoints(mount)
	mount.tex:SetTexture(icon)
	if collected then
		mount:SetBackdrop({
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 39,
		})
		mount:SetBackdropBorderColor(0, 1, 0)
	else
		mount:SetBackdrop({
			edgeFile = [[Interface\Buttons\WHITE8x8]],
			edgeSize = 39,
		})
		mount:SetBackdropBorderColor(1, 0, 0, 0.03)		
		mount.tex:SetVertexColor(0.75, 0.75, 0.75, 0.3);	
	end
	--Adding a tooltip for mounts
	mount:HookScript("OnEnter", function()
		if (spellID) then
			GameTooltip:SetOwner(mount, "ANCHOR_TOP")
			GameTooltip:SetSpellByID(spellID)
			GameTooltip:Show()
			mount:SetHyperlinksEnabled(true)
		end
	end)
	mount:HookScript("OnLeave", function()
		GameTooltip:Hide()
	end)	
	return mount;
end

local function CreateBorder(self)
    self.borders = self:CreateLine(nil, "BACKGROUND", nil, 0)
    local l = self.borders
    l:SetThickness(2)
    l:SetColorTexture(1, 1, 1, 0.4)
	l:SetStartPoint("BOTTOMLEFT")
	l:SetEndPoint("TOPLEFT")	
end

local function CreateFullBorder(self)
    if not self.borders then
        self.borders = {}
        for i=1, 4 do
            self.borders[i] = self:CreateLine(nil, "BACKGROUND", nil, 0)
            local l = self.borders[i]
            l:SetThickness(1)
            l:SetColorTexture(0, 0, 0, 1)
            if i==1 then
                l:SetStartPoint("TOPLEFT")
                l:SetEndPoint("TOPRIGHT")
            elseif i==2 then
                l:SetStartPoint("TOPRIGHT")
                l:SetEndPoint("BOTTOMRIGHT")
            elseif i==3 then
                l:SetStartPoint("BOTTOMRIGHT")
                l:SetEndPoint("BOTTOMLEFT")
            else
                l:SetStartPoint("BOTTOMLEFT")
                l:SetEndPoint("TOPLEFT")
            end
        end
    end
end

function MCL_Load:CategoryFrame(expT, relativeFrame, xOffset, yOffset, mtotal, col, breakRow)
	--Creating a frame to place expansion content in.
	local category = CreateFrame("Frame", nil, relativeFrame);
	local ySize = 0
	if mtotal > 10 then
		if mtotal > 20 then
			ySize = ySize + 90
		else
			ySize = ySize + 45
		end
	end
	local boxSize = 70 + ySize 
	category:SetSize(490, boxSize);
	category:SetPoint("TOPLEFT", relativeFrame,  xOffset, yOffset);
	category.title = category:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	category.title:SetPoint("TOPLEFT", 10, 0)
	category.title:SetText(expT)
	MCL_aCount = MCL_aCount+1
	CreateBorder(category)
	return category;
end
local function ScrollFrame_OnMouseWheel(self, delta)
	local newValue = self:GetVerticalScroll() - (delta * 50);
	
	if (newValue < 0) then
		newValue = 0;
	elseif (newValue > self:GetVerticalScrollRange()) then
		newValue = self:GetVerticalScrollRange();
	end
	
	self:SetVerticalScroll(newValue);
end

local function Tab_OnClick(self)
	PanelTemplates_SetTab(self:GetParent(), self:GetID());

	local scrollChild = MCL_MF.ScrollFrame:GetScrollChild();
	if(scrollChild) then
		scrollChild:Hide();
	end

	MCL_MF.ScrollFrame:SetScrollChild(self.content);
	self.content:Show();
	MCL_MF.ScrollFrame:SetVerticalScroll(0);
end

local function SetTabs(frame, numTabs, ...)
	frame.numTabs = numTabs;
	local contents = {};
	local frameName = frame:GetName();

	for i = 1, numTabs do

		local tab = CreateFrame("Button", frameName.."Tab"..i, frame, "MCLButtonTemplate");
		tab:SetID(i);
		tab:SetText(select(i, ...));
		tab:SetScript("OnClick", Tab_OnClick);
		tab.content = CreateFrame("Frame", nil, MCL_MF.ScrollFrame);		
		tab.content:SetSize(1100, 550);
		tab.content:Hide();

		table.insert(contents, tab.content);

		if (i == 1) then
			tab:SetPoint("TOPLEFT", MCL_MF, "BOTTOMLEFT", 5, 5);
		else
			tab:SetPoint("TOPLEFT", _G[frameName.."Tab"..(i-1)], "TOPRIGHT", 5, 0);
		end
	end

	Tab_OnClick(_G[frameName.."Tab1"]);

	return unpack(contents);
end

function MCL_Load:insertMountFromID(mountID, rowC, MCL_x, category, mFrame, aFrame, isFactionSpecific, faction, isCollected, playerFaction, icon)
	local mountName, spellID, icon, _, _, _, _, isFactionSpecific, faction, _, isCollected, mountID = C_MountJournal.GetMountInfoByID(mountID)
	if (isFactionSpecific == true and faction == playerFaction) or isFactionSpecific == false then
		if MCL_rowC > 0 then
			MCL_x = MCL_x+48
		end
		MCL_rowC = MCL_rowC+1
		MCL_u = MCL_u+1
		mountFrame = self:CreateMountIcons("TOPLEFT", MCL_x, MCL_y, aFrame, isCollected, icon, _, spellID)
		table.insert(MCL_mountFrames, mountFrame)
		MCL_collectableMounts = MCL_collectableMounts+1		
		if isCollected == true then
			MCL_totalc = MCL_totalc+1
			MCL_totalCollected = MCL_totalCollected+1
		end
		mountFrame:SetScript("OnMouseDown", function(self, button)
			if button == 'LeftButton' then
				DressUpMount(mountID)
			end			
			if button=='RightButton' then
				CastSpellByName(mountName);
			end
		end)		
		MCL_total = MCL_total+1
	end
	MCL_complete = true
	return MCL_rowC, MCL_x, MCL_complete
end		

function MCL_Load:insertMountFromItem(ID, rowC, MCL_x, category, mFrame, aFrame, mountID, isFactionSpecific, faction, isCollected, playerFaction, mountName)					
	if (isFactionSpecific == true and faction == playerFaction) or isFactionSpecific == false then
		if MCL_rowC > 0 then
			MCL_x = MCL_x+48
		end
		MCL_rowC = MCL_rowC+1
		MCL_u = MCL_u+1
		mountFrame = self:CreateIcons("TOPLEFT", MCL_x, MCL_y, ID, aFrame, isCollected, mFrame, mountID)
		table.insert(MCL_mountFrames, mountFrame)
		MCL_collectableMounts = MCL_collectableMounts+1									
		if isCollected == true then
			MCL_totalc = MCL_totalc+1
			MCL_totalCollected = MCL_totalCollected+1
		end
		local item, itemLink = GetItemInfo(ID);
		mountFrame:SetScript("OnMouseDown", function(self, button)
			if IsControlKeyDown() then
				if button == 'LeftButton' then
					DressUpMount(mountID)
				end
			elseif button=='LeftButton' then
				if (itemLink) then
					print(itemLink)
				end
			end
			if button=='RightButton' then
				CastSpellByName(mountName);
			end
		end)		
	--This will determine when to start a new row of mounts. Currently set to 6 mounts per row.								
		if(MCL_rowC == 10) then
			MCL_y = MCL_y-45
			MCL_x = 10
			MCL_rowC = 0
		end
		MCL_total = MCL_total+1
	end
	MCL_complete = true
	return MCL_rowC, MCL_x, MCL_complete		
end

function MCL_Load:CreateMenu()
    if not IsAddOnLoaded("Blizzard_Collections") then
        LoadAddOn("Blizzard_Collections")
    end
    MCL_MF = CreateFrame("Frame", "MCLFrame", UIParent, "MCLFrameTemplateWithInset");
    MCL_MF.Bg:SetVertexColor(0,0,0,0.8)
    MCL_MF.TitleBg:SetVertexColor(0.1,0.1,0.1,0.8)
    MCL_MF:Hide()
	--Master Frame for addon
	MCL_MF:SetMovable(true)
	MCL_MF:EnableMouse(true)
	MCL_MF:RegisterForDrag("LeftButton")
	MCL_MF:SetScript("OnDragStart", MCL_MF.StartMoving)
	MCL_MF:SetScript("OnDragStop", MCL_MF.StopMovingOrSizing)
	MCL_MF:SetFrameStrata("DIALOG")

	--MCL Frame settings
	MCL_MF:SetSize(1200, 600); -- width, height
	MCL_MF:SetPoint("CENTER", UIParent, "CENTER"); -- point, relativeFrame, relativePoint, xOffset, yOffset
	MCL_MF:EnableMouse(true)
	MCL_MF:SetHyperlinksEnabled(true)
	MCL_MF:SetScript("OnHyperlinkClick", ChatFrame_OnHyperlinkShow)
	CreateFullBorder(MCL_MF)

	--Creating title for frame
	MCL_MF.title = MCL_MF:CreateFontString(nil, "OVERLAY", "GameFontHighlight");
	MCL_MF.title:SetPoint("LEFT", MCL_MF.TitleBg, "LEFT", 5, 2);
	MCL_MF.title:SetText("Mount Collection Log");

	MCL_MF.ScrollFrame = CreateFrame("ScrollFrame", nil, MCL_MF, "UIPanelScrollFrameTemplate");
	MCL_MF.ScrollFrame:SetPoint("TOPLEFT", MCL_MF.Bg, "TOPLEFT", 4, -7);
	MCL_MF.ScrollFrame:SetPoint("BOTTOMRIGHT", MCL_MF.Bg, "BOTTOMRIGHT", -3, 6);
	MCL_MF.ScrollFrame:SetClipsChildren(true);
	MCL_MF.ScrollFrame:SetScript("OnMouseWheel", ScrollFrame_OnMouseWheel);	

	MCL_MF.ScrollFrame.ScrollBar:ClearAllPoints();
	MCL_MF.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", MCL_MF.ScrollFrame, "TOPRIGHT", -8, -19);
	MCL_MF.ScrollFrame.ScrollBar:SetPoint("BOTTOMRIGHT", MCL_MF.ScrollFrame, "BOTTOMRIGHT", -8, 17);

	local MCL_playerFaction
	local MCL_playerFactionStr = UnitFactionGroup("player")
	if MCL_playerFactionStr == "Alliance" then
		MCL_playerFaction = 1
		MCL_playerFactionStr = "联盟"
	else
		MCL_playerFaction = 0
		MCL_playerFactionStr = "部落"
	end

	MCL_totalCollected = 0

	local MCL_classic, MCL_tbc, MCL_wotlk, MCL_cata, MCL_mop, MCL_wod, MCL_legion, MCL_bfa, MCL_sl, MCL_racial, MCL_professions, MCL_pvp, MCL_worldevents, MCL_promotion, MCL_other, MCL_unobtainable = SetTabs(MCL_MF, 16, "经典", "燃烧的远征", "巫妖王之怒", "大地的裂变", "熊猫人之谜", "德拉诺之王", "军团再临", "争霸艾泽拉斯", "暗影国度", MCL_playerFactionStr, "专业", "PVP", "世界事件", "促销", "其他", "绝版");

	local MCL_sections = {
		MCL_classic,
		MCL_tbc,
		MCL_wotlk,
		MCL_cata,
		MCL_mop,
		MCL_wod,
		MCL_legion,
		MCL_bfa,
		MCL_sl,
		MCL_racial,
		MCL_professions,
		MCL_pvp,
		MCL_worldevents,
		MCL_promotion,
		MCL_other,
		MCL_unobtainable
	}
	local MCL_sectionStrings = {
		"经典",
		"燃烧的远征",
		"巫妖王之怒",
		"大地的裂变",
		"熊猫人之谜",
		"德拉诺之王",
		"军团再临",
		"争霸艾泽拉斯",
		"暗影国度",
		MCL_playerFactionStr,
		"专业",
		"PVP",
		"世界事件",
		"促销",
		"其他",
		"绝版"
	}

-- update "frame" with new information to display
	local MCL_catFrame = {}
	local MCL_a = {}
	--Creating a frame to place expansion content in.
	--For each value section and category run this loop
	local function LoadData()
		if #MCL_mountFrames > 0 then
			for k,v in pairs(MCL_mountFrames) do
				v:UnregisterAllEvents()
				v:ClearAllPoints()
				v:Hide()
			end
		end
		if #MCL_a > 0 then
			for k,v in pairs(MCL_a) do
				v:UnregisterAllEvents()
				v:ClearAllPoints()
				v:Hide()
			end
		end		
		MCL_collectableMounts = 0
		MCL_totalCollected = 0
		MCL_u = 0
		MCL_rowC = 0
		MCL_x = 10
		MCL_y = -25
		MCL_complete = 0
		MCL_totalc = 0
		MCL_total = 0
		local MCL_breakRow = 0
		local MCL_width = 0
		for k,v in pairs(core.sectionNames) do
			--Reset location of frames
			yTwo = -20
			local xTwo = 20
			MCL_rowC = 0
			local frameName = MCL_MF:GetName()
			--Cycle through each section and check if database entry matches any string.
			for s = 1, #MCL_sectionStrings do
				MCL_col = 0
				if v.name == MCL_sectionStrings[s] then
					for i = 1, #v.category do
						for b,n in pairs(core.mountList) do
							if n.name == MCL_sectionStrings[s] then
								for h,j in pairs(n) do
									if j.name == v.category[i] then
										if j.mounts or j.mountID then
											MCL_width = (#j.mounts + #j.mountID)
											break
										end
									end
								end
							end
						end
						MCL_currentFrame = MCL_Load:CategoryFrame(v.category[i], MCL_sections[s], xTwo, yTwo, MCL_width, MCL_col, MCL_breakRow)
						if MCL_width >= 11 and MCL_width <= 20 then
							MCL_breakRow = 1
						elseif MCL_width > 20 then
							MCL_breakRow = 2
						end
						if MCL_col == 0 then
							xTwo = 520
							MCL_col = 1
						else
							xTwo = 20
							yTwo = yTwo - 80
							MCL_col = 0
							if MCL_breakRow > 0 then
								local breakPoint = 45 * MCL_breakRow
								yTwo = yTwo - breakPoint
							end
							MCL_breakRow = 0
						end				
						table.insert(MCL_a, MCL_currentFrame)
						MCL_rowC = 0
						MCL_x = 10
						MCL_y = -25
						for b,n in pairs(core.mountList) do
							if n.name == MCL_sectionStrings[s] then
								for h,j in pairs(n) do
									if j.name == v.category[i] then
										if j.mounts then
											MCL_total = 0
											MCL_totalc = 0
											for t = 1, #j.mountID do
												if j.mountID[t] then											
													local _, _, icon, _, _, _, _, isFactionSpecific, faction, _, isCollected, mountID = C_MountJournal.GetMountInfoByID(j.mountID[t])
													MCL_rowC, MCL_x, MCL_complete = MCL_Load:insertMountFromID(j.mountID[t], MCL_rowC, MCL_x, v.category[i], MCL_mountFrames[MCL_u], MCL_currentFrame, isFactionSpecific, faction, isCollected, MCL_playerFaction)
												end					
											end													
											for t = 1, #j.mounts do
												if C_MountJournal.GetMountFromItem(j.mounts[t]) then
													local mountID = C_MountJournal.GetMountFromItem(j.mounts[t])
													local mountName, spellID, icon, _, _, _, _, isFactionSpecific, faction, _, isCollected, mountID = C_MountJournal.GetMountInfoByID(mountID)
													MCL_rowC, MCL_x, MCL_complete = MCL_Load:insertMountFromItem(j.mounts[t], MCL_rowC, MCL_x, v.category[i], MCL_mountFrames[MCL_u], MCL_currentFrame, mountID, isFactionSpecific, faction, isCollected, MCL_playerFaction, mountName)	
												end								
											end
											if MCL_currentFrame then
												MCL_currentFrame.title:SetText(v.category[i].." ("..MCL_totalc.."/"..MCL_total..")")
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
		MCL_MF.title:SetText("Mount Collection Log |  已收集 "..MCL_totalCollected);
	end
	LoadData()
	MCL_MF:SetScript("OnShow", function()
		LoadData()
	end)	
	tinsert(UISpecialFrames, "MCLFrame")	
end

local f = CreateFrame("Frame")
local login = true
 
local function createMCLicon()
	mountJournalFrame = CreateFrame("Button", nil, MountJournal.MountCount, "BackdropTemplate")
	mountJournalFrame:SetPoint("RIGHT", 50, 0)
	mountJournalFrame:SetSize(40, 20)
	mountJournalFrame.text = mountJournalFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	mountJournalFrame.text:SetPoint("CENTER", 1, 0)	
	mountJournalFrame.text:SetText("MCL")
	mountJournalFrame.bg = mountJournalFrame:CreateTexture(nil, "BACKGROUND");
	mountJournalFrame.bg:SetAllPoints(true);
	mountJournalFrame.bg:SetColorTexture(0.25, 0.52, 0.9, 1);
	mountJournalFrame:SetScript("OnClick", function(self, button, down)
		MCL_Load:Toggle()
	end)
end


local function onevent(self, event, arg1, ...)
    if(login and ((event == "ADDON_LOADED" and name == arg1) or (event == "PLAYER_LOGIN"))) then
        login = nil
        f:UnregisterEvent("ADDON_LOADED")
        f:UnregisterEvent("PLAYER_LOGIN")
	    if not IsAddOnLoaded("Blizzard_Collections") then
	        LoadAddOn("Blizzard_Collections")
	    end        
        InitMounts()
        createMCLicon()
    end
end
 
f:RegisterEvent("ADDON_LOADED")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", onevent)