local Media = "Interface\\Addons\\aLoot\\Media\\"
local blank = "Interface\\Buttons\\WHITE8x8"
local edgetex = Media.."grow"
local CBTexture = Media.."PPTexture"
local width = 300


local function CreateBackdrop(parent, anchor, offset, alfa)
	local backdropshadow = {edgeFile = edgetex, edgeSize = offset, insets = 6 }
	local backdrop = {bgFile = blank, edgeFile = blank, edgeSize = 3}
	local frame = CreateFrame("Frame", nil, parent)
	local flvl = parent:GetFrameLevel()

	frame:SetFrameLevel(flvl == 0 and 1 or flvl - 1)

	frame:ClearAllPoints()
    frame:SetPoint("TOPLEFT", anchor, -offset, offset)
    frame:SetPoint("BOTTOMRIGHT", anchor, offset, -offset)
	
	if alfa > 0 then 
		frame:SetBackdrop(backdropshadow)
	else
		frame:SetBackdrop(backdrop)
	end
	
	frame:SetBackdropColor(0, 0, 0, alfa or 1)
	frame:SetBackdropBorderColor(0, 0, 0)
	
    return frame
end

local createCBTexture = function(frame, alpha)
	local f = frame
	if frame:GetObjectType() == "Texture" then f = frame:GetParent() end

	local bg = f:CreateTexture(nil, "BACKGROUND")
	bg:SetPoint("TOPLEFT", frame, 0, 0)
	bg:SetPoint("BOTTOMRIGHT", frame, 0, 0)
	bg:SetTexture("Interface\\Buttons\\WHITE8x8")
	bg:SetVertexColor(0, 0, 0)
	bg:SetAlpha(alpha or 1)
	return bg
end

local function createtext(f, fontsize, flag, center)
	local text = f:CreateFontString(nil, "OVERLAY")
	text:SetFont("Fonts\\FRIZQT__.TTF", fontsize, flag)
	text:SetJustifyH("CENTER")
	if center then
		text:SetAllPoints()
	end
	return text
end

local function ClickRoll(frame)
	RollOnLoot(frame.parent.rollid, frame.rolltype)
end

local function HideTip() GameTooltip:Hide() end
local function HideTip2() GameTooltip:Hide() ResetCursor() end

local rolltypes = {"need", "greed", "disenchant", [0] = "pass"}

local function SetTip(frame)
	GameTooltip:SetOwner(frame, "ANCHOR_RIGHT")
	GameTooltip:SetText(frame.tiptext)
	if not frame:IsEnabled() then
		GameTooltip:AddLine("|cff7FFF00"..frame.errtext)
	end
	for name,roll in pairs(frame.parent.rolls) do if roll == rolltypes[frame.rolltype] then GameTooltip:AddLine(name, 1, 1, 1) end end
	GameTooltip:Show()
end

local function SetItemTip(frame)
	if not frame.link then return end
	GameTooltip:SetOwner(frame, "ANCHOR_TOPLEFT")
	GameTooltip:SetHyperlink(frame.link)
	if IsShiftKeyDown() then GameTooltip_ShowCompareItem() end
	if IsModifiedClick("DRESSUP") then ShowInspectCursor() else ResetCursor() end
end

local function ItemOnUpdate(self)
	if IsShiftKeyDown() then GameTooltip_ShowCompareItem() end
	CursorOnUpdate(self)
end

local function LootClick(frame)
	if IsControlKeyDown() then DressUpItemLink(frame.link)
	elseif IsShiftKeyDown() then ChatEdit_InsertLink(frame.link) end
end

local cancelled_rolls = {}
local function OnEvent(frame, event, rollid)
	cancelled_rolls[rollid] = true
	if frame.rollid ~= rollid then return end
	frame.rollid = nil
	frame.time = nil
	frame:Hide()
end

local function StatusUpdate(frame)
	local t = GetLootRollTimeLeft(frame.parent.rollid)
	local perc = t / frame.parent.time
	frame.spark:SetPoint("CENTER", frame, "LEFT", perc * frame:GetWidth(), 0)
	frame:SetValue(t)
end

local function CreateRollButton(parent, ntex, ptex, htex, rolltype, tiptext, ...)
	local f = CreateFrame("Button", nil, parent)
		f:SetPoint(...)
		f:SetWidth(25)
		f:SetHeight(25)
		f:SetNormalTexture(ntex)
		if ptex then f:SetPushedTexture(ptex) end
		f:SetHighlightTexture(htex)
		
		f.rolltype = rolltype
		f.parent = parent
		f.tiptext = tiptext
	
		f:SetScript("OnEnter", SetTip)
		f:SetScript("OnLeave", HideTip)
		f:SetScript("OnClick", ClickRoll)
		f:SetMotionScriptsWhileDisabled(true)
	
		local txt = createtext(f, 13, "OUTLINE", false)
			txt:SetPoint("CENTER", 0, rolltype == 2 and 2 or rolltype == 0 and 0 or 1)
			txt:SetTextColor(0,1,0)
	
	return f, txt
end

local function CreateRollFrame()
	local frame = CreateFrame("Frame", nil, UIParent)
		frame:SetWidth(width)
		frame:SetHeight(36)
		frame:SetScale(1)
		frame:SetBackdropColor(0, 0, 0, .9)
		frame:SetScript("OnEvent", OnEvent)
		frame:RegisterEvent("CANCEL_LOOT_ROLL")
		frame:Hide()

	local button = CreateFrame("Button", nil, frame)
		button:SetPoint("BOTTOMLEFT",frame,"BOTTOMLEFT", 0, 0)
		button:SetWidth(36)
		button:SetHeight(36)
		button:SetScript("OnEnter", SetItemTip)
		button:SetScript("OnLeave", HideTip2)
		button:SetScript("OnUpdate", ItemOnUpdate)
		button:SetScript("OnClick", LootClick)
		button:SetNormalTexture("Interface\\ICONS\\Ability_Ambush")
		button:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
		CreateBackdrop(button, button, 1, 0)
		frame.button = button
		frame.buttonborder = CreateBackdrop(button, button, 3, 1)

	local status = CreateFrame("StatusBar", nil, frame)
		status:SetWidth(width-40)
		status:SetHeight(15)
		status:SetPoint("BOTTOMLEFT", button, "BOTTOMRIGHT", 6, 8)
		status:SetScript("OnUpdate", StatusUpdate)
		status:SetFrameLevel(status:GetFrameLevel()-1)
		status:SetStatusBarTexture(CBTexture)
		status:SetStatusBarColor(.8, .8, .8, .9)
	
	local Ramik = CreateBackdrop(status, status, 1, .6)
	local BG = createCBTexture(Ramik, 0.5)
		BG:SetDrawLayer("BACKGROUND")
	
	status.parent = frame
	frame.status = status
	
	local spark = frame:CreateTexture(nil, "OVERLAY")
		spark:SetSize(14,14)
		spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		spark:SetBlendMode("ADD")
		status.spark = spark

	local need, needtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Dice-Up", "Interface\\Buttons\\UI-GroupLoot-Dice-Highlight", "Interface\\Buttons\\UI-GroupLoot-Dice-Down", 1, NEED, "BOTTOMLEFT", frame.status, "BOTTOMLEFT", 5, -7)
	
	local greed, greedtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Coin-Up", "Interface\\Buttons\\UI-GroupLoot-Coin-Highlight", "Interface\\Buttons\\UI-GroupLoot-Coin-Down", 2, GREED, "LEFT", need, "RIGHT", 0, -1)
	
	local de, detext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-DE-Up", "Interface\\Buttons\\UI-GroupLoot-DE-Highlight", "Interface\\Buttons\\UI-GroupLoot-DE-Down", 3, ROLL_DISENCHANT, "LEFT", greed, "RIGHT", 0, 1)
	
	local pass, passtext = CreateRollButton(frame, "Interface\\Buttons\\UI-GroupLoot-Pass-Up", "Interface\\Buttons\\UI-GroupLoot-Pass-Up", "Interface\\Buttons\\UI-GroupLoot-Pass-Down", 0, PASS, "BOTTOMRIGHT", frame.status, "BOTTOMRIGHT", 30, -5)
	
	frame.needbutt, frame.greedbutt, frame.disenchantbutt = need, greed, de
	frame.need, frame.greed, frame.pass, frame.disenchant = needtext, greedtext, passtext, detext
	
	local Text_Bop_BoE = createtext(frame, 11, "OUTLINE", false)
		Text_Bop_BoE:SetPoint("LEFT", de or greed, "RIGHT", 0, 2)
		frame.fsText_Bop_BoE = Text_Bop_BoE

	local Text_Loot_Name = createtext(frame, 11, "OUTLINE", false)
		Text_Loot_Name:SetPoint("LEFT", Text_Bop_BoE, "RIGHT", 0, 0)
		Text_Loot_Name:SetPoint("RIGHT", frame, "RIGHT", -5, 0)
		Text_Loot_Name:SetHeight(10)
		Text_Loot_Name:SetWidth(200)
		Text_Loot_Name:SetJustifyH("LEFT")
		frame.fsText_Loot_Name = Text_Loot_Name

	frame.rolls = {}

	return frame
end

-- vytvorenie docasneho onka na urcenie novej polohy lootframe
local anchor = CreateFrame("Button", "lootgroup", UIParent)
	anchor:SetWidth(width)
	anchor:SetHeight(20)
	CreateBackdrop(anchor, anchor, 2, .5)
	anchor:SetPoint("CENTER", UIParent, "CENTER" , 0, 250)

local label = createtext(anchor, 14, "OUTLINE", true)
	label:SetText("Move me, noob!")

	anchor:SetScript("OnClick", anchor.Hide)

	anchor:SetScript("OnDragStart", anchor.StartMoving)
	anchor:SetScript("OnDragStop", anchor.StopMovingOrSizing)

	anchor:SetMovable(true)
	anchor:EnableMouse(true)
	anchor:SetUserPlaced(true)
	anchor:RegisterForDrag("LeftButton")
	anchor:RegisterForClicks("RightButtonUp")
	anchor:Hide()

local frames = {}

local f = CreateRollFrame() -- Create one for good measure
	f:SetPoint("TOPLEFT", next(frames) and frames[#frames] or anchor, "BOTTOMLEFT", 0, -4)
	table.insert(frames, f)

local function GetFrame()
	for i,f in ipairs(frames) do
		if not f.rollid then return f end
	end

	local f = CreateRollFrame()
	f:SetPoint("TOPLEFT", next(frames) and frames[#frames] or anchor, "BOTTOMLEFT", 0, -4)
	table.insert(frames, f)
	return f
end

local function FindFrame(rollid)
	for _,f in ipairs(frames) do
		if f.rollid == rollid then return f end
	end
end

local typemap = {[0] = 'pass', 'need', 'greed', 'disenchant'}
local function UpdateRoll(i, rolltype)
	local num = 0
	local rollid, itemLink, numPlayers, isDone = C_LootHistory.GetItem(i)

	if isDone or not numPlayers then return end

	local f = FindFrame(rollid)
	if not f then return end

	for j=1,numPlayers do
		local name, class, thisrolltype = C_LootHistory.GetPlayerInfo(i, j)
		f.rolls[name] = typemap[thisrolltype]
		if rolltype == thisrolltype then num = num + 1 end
	end

	f[typemap[rolltype]]:SetText(num)
end


local function START_LOOT_ROLL(rollid, time)
	if cancelled_rolls[rollid] then return end

	local f = GetFrame()
		f.rollid = rollid
		f.time = time
		for i in pairs(f.rolls) do f.rolls[i] = nil end
		f.need:SetText(0)
		f.greed:SetText(0)
		f.pass:SetText(0)
		f.disenchant:SetText(0)

		local texture, name, count, quality, bop, canNeed, canGreed, canDisenchant, reasonNeed, reasonGreed, reasonDisenchant, deSkillRequired = GetLootRollItemInfo(rollid)
		local color = ITEM_QUALITY_COLORS[quality]
	
		f.button:SetNormalTexture(texture)
		f.button.link = GetLootRollItemLink(rollid)

	if canNeed then
		f.needbutt:Enable()
		f.needbutt:SetAlpha(1.0)
		SetDesaturation(f.needbutt:GetNormalTexture(), false)
	else
		f.needbutt:Disable()
		f.needbutt:SetAlpha(0.35)
		SetDesaturation(f.needbutt:GetNormalTexture(), true)
		f.needbutt.errtext = _G["LOOT_ROLL_INELIGIBLE_REASON"..reasonNeed]
	end

	if canGreed then
		f.greedbutt:Enable()
		f.greedbutt:SetAlpha(1.0)
		SetDesaturation(f.greedbutt:GetNormalTexture(), false)
	else
		f.greedbutt:Disable()
		f.greedbutt:SetAlpha(0.35)
		SetDesaturation(f.greedbutt:GetNormalTexture(), true)
		f.greedbutt.errtext = _G["LOOT_ROLL_INELIGIBLE_REASON"..reasonGreed]
	end

	if canDisenchant then
		f.disenchantbutt:Enable()
		f.disenchantbutt:SetAlpha(1.0)
		SetDesaturation(f.disenchantbutt:GetNormalTexture(), false)
	else
		f.disenchantbutt:Disable()
		f.disenchantbutt:SetAlpha(0.35)
		SetDesaturation(f.disenchantbutt:GetNormalTexture(), true)
		f.disenchantbutt.errtext = format(_G["LOOT_ROLL_INELIGIBLE_REASON"..reasonDisenchant], deSkillRequired)
	end

	f.fsText_Bop_BoE:SetText(bop and "BoP - " or "BoE - ")
	f.fsText_Bop_BoE:SetVertexColor(bop and 1 or .3, bop and .3 or 1, bop and .1 or .3)

	local color = ITEM_QUALITY_COLORS[quality]
		f.fsText_Loot_Name:SetVertexColor(color.r, color.g, color.b)
		f.fsText_Loot_Name:SetText(name)

	f:SetBackdropBorderColor(color.r, color.g, color.b, 1)
	f.buttonborder:SetBackdropBorderColor(color.r, color.g, color.b, 1)
	f.status:SetStatusBarColor(color.r, color.g, color.b, .7)

	f.status:SetMinMaxValues(0, time)
	f.status:SetValue(time)

	f:SetPoint("CENTER", WorldFrame, "CENTER")
	f:Show()
end
local function LOOT_HISTORY_ROLL_CHANGED(rollindex, playerindex)
	local _, _, rolltype = C_LootHistory.GetPlayerInfo(rollindex, playerindex)
	UpdateRoll(rollindex, rolltype)
end

anchor:RegisterEvent("ADDON_LOADED")
anchor:SetScript("OnEvent", function(frame, event, addon)

	anchor:UnregisterEvent("ADDON_LOADED")
	anchor:RegisterEvent("START_LOOT_ROLL")
	anchor:RegisterEvent("LOOT_HISTORY_ROLL_CHANGED")
	UIParent:UnregisterEvent("START_LOOT_ROLL")
	UIParent:UnregisterEvent("CANCEL_LOOT_ROLL")

	anchor:SetScript("OnEvent", function(frame, event, ...)
		if event == "LOOT_HISTORY_ROLL_CHANGED" then return LOOT_HISTORY_ROLL_CHANGED(...)
		else return START_LOOT_ROLL(...) end
	end)
end)


SlashCmdList["TEKSLOOT"] = function() if anchor:IsVisible() then anchor:Hide() else anchor:Show() end end
SLASH_TEKSLOOT1 = "/loot"