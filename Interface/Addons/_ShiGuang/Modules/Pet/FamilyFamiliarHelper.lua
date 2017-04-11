-- key binding globals for Bindings.xml
BINDING_HEADER_FAMILYFAMILIARHELPER = "|cFFBF00FF[宠物]|r队伍构成"
BINDING_NAME_FAMILYFAMILIARHELPER_TOGGLE = "    查看"

if select(4,GetBuildInfo())<=60200 then
	return -- this is for Legion only, don't do anything on WoD clients
end

--ShiGuangDB = {} -- savedvariable

local ffh = CreateFrame("Frame","FamilyFamiliarHelper",UIParent,"BasicFrameTemplateWithInset")
ffh:Hide()
ffh:SetMovable(true)
ffh:SetSize(460,368)
ffh:SetPoint("CENTER")
ffh:SetFrameStrata("HIGH")
ffh:SetFlattensRenderLayers(true) -- makes frame behave like toplevel without click-to-front bit

-- Family Familiar sub-achievement IDs in the order of PET_TYPE_SUFFIXes
-- 1=humanoid, 2=dragonkin, 3=flying, 4=undead, 5=critter, 6=magic, 7=elemental, 8=beast, 9=aquatic, 10=mechanical
ffh.achievementIDs = { 9692, 9689, 9691, 9695, 9688, 9693, 9690, 9687, 9686, 9694 }

-- lookup table for the 15 npcIDs involved in the achievement
ffh.notableNPCs = { ["98270"]=1, ["99210"]=1, ["105674"]=1, ["97804"]=1, ["99182"]=1,
										["104970"]=1, ["107489"]=1, ["104553"]=1, ["97709"]=1, ["99150"]=1,
										["105250"]=1, ["99035"]=1, ["99077"]=1, ["106552"]=1, ["105455"]=1 }

ffh.progress = {} -- indexed by criterea (npc name), sub-table of 10 types and whether completed
-- ie ffh.progress["Tiffany Nelson"]={nil,nil,true,nil,true,nil,nil,nil,nil,true}

ffh.list = {} -- numerically indexed list of criteria (npc name) for display sort purposes

ffh.firstRun = true -- becomes nil after the first setup

-- everything happens in the OnShow: the UI is setup if needed, achievements gathered, display updated
function ffh:OnShow()
	-- gather progress of achievements into ffh.progress
	for petType,achievementID in ipairs(ffh.achievementIDs) do
		for criteria=1,GetAchievementNumCriteria(achievementID) do
			local name,_,completed = GetAchievementCriteriaInfo(achievementID,criteria)
			if not ffh.progress[name] then -- name not encountered before, set up its table and add to list
				ffh.progress[name] = {}
				tinsert(ffh.list,name)
			end
			ffh.progress[name][petType] = completed
		end
	end
	ffh:Setup() -- set up the display if it hasn't been set up before
	-- now update display of pet type icons; completed are alpha 1, uncomplete alpha 0.1
	for i=1,#ffh.list do
		local name = ffh.list[i]
		for j=1,10 do
			ffh.ListButtons[i][j]:SetAlpha(ffh.progress[name][j] and 1 or 0.1)
		end
	end
	-- and total up pet types
	for i=1,10 do
		local total = 0
		for j=1,#ffh.list do
			if ffh.progress[ffh.list[j]][i] then
				total = total + 1
			end
		end
		-- if total is 12 or more, make it a green check
		total = total>11 and "\124TInterface\\RaidFrame\\ReadyCheck-Ready:18\124t" or total
		ffh.HeaderIcons[i].Total:SetText(total)
	end
	-- update checkbutton options and ESCability
	ffh:UpdateOptions()
end

local function headerOnEnter(self)
	GameTooltip:SetOwner(self,"ANCHOR_LEFT")
	GameTooltip:SetHyperlink(GetAchievementLink(ffh.achievementIDs[self:GetID()]))
	GameTooltip:Show()
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("BOTTOMRIGHT",ffh,"BOTTOMRIGHT",-6,32)
	GameTooltip:SetBackdrop(ffh.newTooltipBackdrop)
	GameTooltip:SetBackdropColor(0.05,0.05,0.05)
end

local function hideTooltip(self)
	GameTooltip:Hide()
	GameTooltip:SetBackdrop(ffh.oldTooltipBackdrop)
	GameTooltip:SetBackdropColor(0.09,0.09,0.2)
end

-- called during the OnShow: sets up the display if it hasn't been setup already
function ffh:Setup()
	if ffh.firstRun then
		ffh.firstRun = nil
		table.sort(ffh.list) -- sort the name of the criteria
		ffh.TitleText:SetText(format("Family Familiar Helper \124cffa0a0a0v%s","1.0.4"))
		ffh.TitleText:SetPoint("TOP",-6,-5)
		ffh.InsetBg:SetPoint("BOTTOMRIGHT",-6,32)
		-- set up rows
		ffh.ListButtons = {}
		for i=1,#ffh.list do
			ffh.ListButtons[i] = ffh:CreateListButton(i)
			ffh.ListButtons[i]:SetPoint("TOPLEFT",11,-36-i*20+26)
			ffh.ListButtons[i].Name:SetText(ffh.list[i])
			ffh.ListButtons[i].name = ffh.list[i]
			for j=1,10 do
				ffh.ListButtons[i][j] = ffh.ListButtons[i]:CreateTexture(nil,"ARTWORK")
				ffh.ListButtons[i][j]:SetSize(22,22)
				ffh.ListButtons[i][j]:SetPoint("RIGHT",-(10-j)*28,0)
				ffh.ListButtons[i][j]:SetTexture("Interface\\Icons\\Pet_Type_"..PET_TYPE_SUFFIX[j])
				ffh.ListButtons[i][j]:SetAlpha(0.1)
			end
		end
		-- set up header icons
		ffh.HeaderIcons = {}
		for i=1,10 do
			local button = CreateFrame("Button",nil,ffh)
			ffh.HeaderIcons[i] = button
			button:SetSize(28,28)
			button:SetPoint("TOP",ffh.ListButtons[#ffh.list][i],"BOTTOM",0,-6)
			button:SetNormalTexture("Interface\\PetBattles\\PetIcon-"..PET_TYPE_SUFFIX[i])
			local normal = button:GetNormalTexture()
			normal:SetTexCoord(0.4921875,0.796875,0.50390625,0.65625)
			normal:SetVertexColor(0.5,0.5,0.5)
			button:SetHighlightTexture("Interface\\PetBattles\\PetBattleHUD")
			local highlight = button:GetHighlightTexture()
			highlight:SetTexCoord(0.884765625,0.943359375,0.681640625,0.798828125)
			button.Total = button:CreateFontString(nil,"OVERLAY","GameFontNormalLargeOutline")
			button.Total:SetPoint("CENTER",ffh.HeaderIcons[i],"CENTER",0,0)
			button.Total:SetTextColor(1,1,1)
			button:SetID(i)
			button:SetScript("OnEnter",headerOnEnter)
			button:SetScript("OnLeave",hideTooltip)
		end
		-- total label to left of headers
		local total = ffh:CreateFontString(nil,"ARTWORK","GameFontNormalLarge")
		total:SetText(TOTAL)
		total:SetPoint("RIGHT",ffh.HeaderIcons[1].Total,"LEFT",-14,0)
		-- option checkboxes
		local lock = ffh:CreateCheck("Locked","Lock Window","While checked, this window cannot be dismissed with the ESCape key, nor can it be dragged around the screen unless [Shift] is held.")
		lock:SetPoint("BOTTOMLEFT",8,4)
		local autoShow = ffh:CreateCheck("AutoShow","Auto Show","While checked, anytime you target one of the Family Familiar tamers, this window will show.\n\nIf this is unchecked you can still summon the window with the \124cffffffff/ffh\124r command or key binding.")
		autoShow:SetPoint("LEFT",lock,"RIGHT",-4,0)
		local justOnce = ffh:CreateCheck("JustOnce","Just Once","While checked, Auto Show will summon the window only the first time you target a Family Familiar tamer, until you've moved on to another tamer.")
		justOnce:SetPoint("LEFT",autoShow,"RIGHT",-4,0)
	end
end

function ffh:OnHide()
	ffh:UpdateESCability(true)
end

local function listOnEnter(self) self.Back:Show() end
local function listOnLeave(self) self.Back:Hide() end

-- formerly a template
function ffh:CreateListButton(index)
	local button = CreateFrame("Button",nil,ffh)
	button:SetSize(436,20)
	button.Name = button:CreateFontString(nil,"ARTWORK","GameFontHighlight")
	button.Name:SetSize(162,20)
	button.Name:SetPoint("LEFT",2,0)
	button.Name:SetJustifyH("LEFT")
	button.Back = button:CreateTexture(nil,"BACKGROUND")
	button.Back:SetAllPoints(true)
	button.Back:SetColorTexture(0.25,0.75,1.0,0.15)
	button.Back:Hide()
	-- highlight is a frame with a 1px gold border
	button.Highlight = CreateFrame("Frame",nil,button)
	button.Highlight:SetBackdrop({edgeFile="Interface\\ChatFrame\\ChatFrameBackground",edgeSize=1})
	button.Highlight:SetBackdropBorderColor(1,0.82,0,0.75)
	button.Highlight:SetPoint("TOPLEFT",-2,2)
	button.Highlight:SetPoint("BOTTOMRIGHT",2,-2)
	button:SetScript("OnEnter",listOnEnter)
	button:SetScript("OnLeave",listOnLeave)
	return button
end

--[[ Handler stuff ]]

-- slash handler (/ffh to toggle window)
SlashCmdList["FFH"] = function() ffh:SetShown(not ffh:IsVisible()) end
SLASH_FFH1 = "/ffh"

-- event/script handlers
ffh:SetScript("OnShow",ffh.OnShow)
ffh:SetScript("OnHide",ffh.OnHide)
ffh:SetScript("OnMouseDown",function(self)
	if not ShiGuangDB.Locked or IsShiftKeyDown() then
		self:StartMoving()
	end
end)
ffh:SetScript("OnMouseUp",function(self)
	self:StopMovingOrSizing()
end)

ffh:SetScript("OnEvent",function(self,event,...)
	ffh[event](self,...)
end)

function ffh:PLAYER_LOGIN()
	for var,default in pairs({AutoShow=true,JustOnce=true}) do
		if ShiGuangDB[var]==nil then
			ShiGuangDB[var] = default
		end
	end
	ffh:UpdateOptions()
	ffh.oldTooltipBackdrop = GameTooltip:GetBackdrop()
	ffh.newTooltipBackdrop = CopyTable(ffh.oldTooltipBackdrop)
	ffh.newTooltipBackdrop.bgFile = "Interface\\ChatFrame\\ChatFrameBackground"
end
ffh:RegisterEvent("PLAYER_LOGIN")

-- registered if AutoShow enabled; if one of the notableNPCs is targeted then summons window
-- unless it's already been summoned or JustOnce is unchecked.
function ffh:PLAYER_TARGET_CHANGED()
	local npcID
	if UnitExists("target") then
		local guid = UnitGUID("target")
		if guid then
			npcID = guid:match(".-%-%d+%-%d+%-%d+%-%d+%-(%d+)")
			if ffh.notableNPCs[npcID] and (not ShiGuangDB.JustOnce or npcID~=ffh.lastInteracted) then
				ffh.lastInteracted = npcID
				ffh:Show()
			end
		end
	end
	-- if window is up, highlight current target
	if ffh:IsVisible() then
		ffh:UpdateHighlight()
	end
end

-- called when window shown and target changes while window up; to highlight the targeted tamer
function ffh:UpdateHighlight()
	local target = UnitName("target")
	for _,button in ipairs(ffh.ListButtons) do
		button.Highlight:SetShown(button.name==target)
	end
end

--[[ Options ]]

-- run at PLAYER_LOGIN, OnShow and checkOnClick to update whether PLAYER_TARGET_CHANGED
-- is registered, the on-screen checkbuttons and the ESCability of the window.
-- run at PLAYER_LOGIN and checkOnClick: registers/unregisters for the targeting event based on AutoShow
-- and whether the frame is in UISpecialFrames
function ffh:UpdateOptions()
	local settings = ShiGuangDB
	local registered = ffh:IsEventRegistered("PLAYER_TARGET_CHANGED")
	if settings.AutoShow and not registered then
		ffh:RegisterEvent("PLAYER_TARGET_CHANGED")
	elseif not settings.AutoShow and registered then
		ffh:UnregisterEvent("PLAYER_TARGET_CHANGED")
	end
	if ffh:IsVisible() then
		ffh.Locked:SetChecked(settings.Locked)
		ffh.AutoShow:SetChecked(settings.AutoShow)
		ffh.JustOnce:SetChecked(settings.JustOnce)
		ffh.JustOnce:SetShown(settings.AutoShow)
		ffh:UpdateESCability()
		ffh:UpdateHighlight()
	end
end

-- OnEnter of one of the checkbuttons shows its tooltip to explain what it does
local function checkOnEnter(self)
	GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
	GameTooltip:AddLine(self.tooltipTitle,1,1,1)
	GameTooltip:AddLine(self.tooltipBody,nil,nil,nil,true)
	GameTooltip:Show()
	GameTooltip:ClearAllPoints()
	GameTooltip:SetPoint("BOTTOMLEFT",ffh,"BOTTOMLEFT",6,32)
	GameTooltip:SetBackdrop(ffh.newTooltipBackdrop)
	GameTooltip:SetBackdropColor(0.05,0.05,0.05)
end

-- OnClick will toggle the settings and update
local function checkOnClick(self)
	ShiGuangDB[self.var] = self:GetChecked() and true -- make sure it's true/false
	ffh:UpdateOptions()
end

function ffh:CreateCheck(name,title,body)
	ffh[name] = CreateFrame("CheckButton",nil,ffh,"UICheckButtonTemplate")
	ffh[name]:SetSize(26,26)
	ffh[name]:SetScript("OnEnter",checkOnEnter)
	ffh[name]:SetScript("OnLeave",hideTooltip)
	ffh[name]:SetScript("OnClick",checkOnClick)
	ffh[name].tooltipTitle = title
	ffh[name].tooltipBody = body
	ffh[name].var = name
	return ffh[name]
end

-- while Locked is unchecked, the frame only exists in UISpecialFrames while it's on screen
function ffh:UpdateESCability(hide)
	if ShiGuangDB.Locked or not ffh:IsVisible() or hide then
		for i=#UISpecialFrames,1,-1 do
			if UISpecialFrames[i]=="FamilyFamiliarHelper" then
				tremove(UISpecialFrames,i)
			end
		end
	elseif not tContains(UISpecialFrames,"FamilyFamiliarHelper") then
		tinsert(UISpecialFrames,"FamilyFamiliarHelper")
	end
end
