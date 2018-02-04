--local M, R, U, I = unpack(select(2, ...))
-------------------------------------------------------------------------------
-- 文件: SimpleInfo.lua ver 1.0  日期: 2010-12-11  作者: dugu@wowbox
-- 描述: 在屏幕中下方显示玩家(宠物)和目标(ToT)的基本信息  版权所有@多玩游戏网
-- Notes-zhCN: 在屏幕中心显示玩家和目标的简易状态信息  Author: Kill & dugu from duowan
-- Modified: 冰灵曦晓&七曜   Fix and DIY by y368413 for WOD、LEG
-------------------------------------------------------------------------------
BlinkHealth = LibStub("AceAddon-3.0"):NewAddon("SimpleInfo",  "AceEvent-3.0", "AceTimer-3.0");

-- Target name
local fntBig = CreateFont("SIFontBig");
fntBig:SetFont(STANDARD_TEXT_FONT, 22, "THICKOUTLINE");
-- Power, absolute health
local fntMedium = CreateFont("SIFontMedium");
fntMedium:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE");
fntMedium:SetTextColor(1, 0.65, 0.16); --(0.49,0.99,0)
fntMedium:SetShadowColor(0.25, 0.25, 0.25, 0.5);
fntMedium:SetShadowOffset(1, -1);
-- ToT, pet
local fntSmall = CreateFont("SIFontSmall");
fntSmall:SetFont(STANDARD_TEXT_FONT, 14, "OUTLINE");
fntSmall:SetTextColor(1, 0.65, 0.16);  --0.49,0.99,0
fntSmall:SetShadowColor(0.25, 0.25, 0.25, 0.5);
fntSmall:SetShadowOffset(1, -1);

BlinkHealth.digitTexCoords = {
	["1"] = {1, 20},
	["2"] = {21, 31},
	["3"] = {53, 30},
	["4"] = {84, 33},
	["5"] = {118, 30},
	["6"] = {149, 31},
	["7"] = {181, 30},
	["8"] = {212, 31},
	["9"] = {244, 31},
	["0"] = {276, 31},
	["%"] = {308, 17},
	["X"] = {326, 31},	-- Dead
	["G"] = {358, 36},	-- Ghost
	["Off"] = {395, 23},	-- Offline
	["height"] = 43,
	["texWidth"] = 512,
	["texHeight"] = 128
};

BlinkHealth.powerColor = {
	AMMOSLOT = {0.8, 0.6, 0},
	ENERGY = {1, 1, 0},
	FOCUS = {1, 0.5, 0.25},
	FUEL = {0, 0.55, 0.5},
	HAPPINESS = {0, 1, 1},
	MANA = {0.31, 0.45, 0.63},
	RAGE = {0.69, 0.31, 0.31},
	RUNES = {0.55, 0.57, 0.61},
	RUNIC_POWER = {0, 0.82, 1},
	FURY = { 0.5, 0.5, 0.25 },
	PAIN = { 0, 0.82, 1 }, --0.5, 0.5, 0.25
};


BlinkHealth['classMaxResourceBar'] = {
	['DEATHKNIGHT'] = 6,
	['PALADIN'] = 5,
	['WARLOCK'] = 5,
	['MONK'] = 6,
	['MAGE'] = 4,
	['ROGUE'] = 8,
	["DRUID"] = 5
}
BlinkHealth.classColor = {};
do
for k, v in pairs(RAID_CLASS_COLORS) do BlinkHealth.classColor[k] = {v.r, v.g, v.b}; end
end


function BlinkHealth:OnEnable()
	self:RegisterEvent("PLAYER_TARGET_CHANGED");
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");		
	
	if (select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID" or select(2, UnitClass("player")) == "MONK") then	
		self:RegisterEvent("UNIT_POWER");		
	end

	self.frame["player"]:Show();
	self.handle = self:ScheduleRepeatingTimer("UpdateUnitValues", 0.05);
end

function BlinkHealth:OnDisable()
	self:UnregisterAllEvents();
	self:CancelTimer(self.handle, true);
	self.frame["player"]:Hide();
	self.frame["target"]:Hide();
end

function BlinkHealth:PLAYER_TARGET_CHANGED()
	self:UpdateUnitFrame();
	if (select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID") then
		self:UpdateComboPoints();
	end
end

function BlinkHealth:PLAYER_REGEN_DISABLED()
	self:UpdateUnitFrame();
end

function BlinkHealth:PLAYER_REGEN_ENABLED()
	self:UpdateUnitFrame();
end

function BlinkHealth:UNIT_POWER(event, unit)
	if (unit == "player") then self:UpdateComboPoints(); end
end


function BlinkHealth:CreateAnchorFrame()
	if (self.anchor) then return end

	self.anchor = CreateFrame("Button", "SimpleInfoAnchorFrame", UIParent);
	self.anchor:SetWidth(280);
	self.anchor:SetHeight(80);
	self.anchor:EnableMouse(true);
	self.anchor:SetMovable(true);
	self.anchor:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 236);
	local backdrop = {
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tileSize = 16, edgeSize = 16, tile = true,
		insets = {left = 4, right = 4, top = 4, bottom = 4}
	};		
	self.anchor:SetBackdrop(backdrop);
	self.anchor:SetBackdropColor(0.1, 0.1, 0.1, 0.65)
	self.anchor:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
	
	self.anchor.close = CreateFrame("Button", nil, self.anchor, "UIPanelCloseButton");
	self.anchor.close:SetPoint("TOPRIGHT", self.anchor, "TOPRIGHT", -5, -5);

	self.anchor.text = self.anchor:CreateFontString(nil, "OVERLAY");
	self.anchor.text:SetFontObject("SIFontSmall");
	self.anchor.text:SetJustifyH("CENTER");
	self.anchor.text:SetPoint("CENTER");
	self.anchor.text:SetText(UFRAMESTYLE_BLINKHEALTHTEXT_ANCHOR);
	self.anchor.text:SetTextColor(1, 1, 1);

	self.anchor:RegisterForClicks("LeftButtonDown", "RightButtonDown");
	self.anchor:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton") then
			self:StartMoving();
			self.isMoving = true;
		else
			self:Hide();
		end
		
	end);
	self.anchor:SetScript("OnMouseUp", function(self)
		if (self.isMoving) then
			self:StopMovingOrSizing();
		end		
	end);

	RegisterForSaveFrame(self.anchor);
	self.anchor:Hide();
end

function BlinkHealth:ToHexColor(r, g, b)
	return format("%02x%02x%02x", r*255, g*255, b*255);
end

function BlinkHealth:UpdateUnitFrame()
	if (UnitExists("target")) then
		self.frame["player"]:SetAlpha(1);
		self.frame["target"]:SetAlpha(1);
		self.frame["target"]:Show();
	else
		self.frame["player"]:SetAlpha(0.2);
		self.frame["target"]:SetAlpha(0.2);
		self.frame["target"]:Hide();
	end
end

function BlinkHealth:UpdateComboPoints()
	if select(2, UnitClass("player")) == "MONK" then
		local cur = UnitPower("player", SPELL_POWER_CHI)
		local max = BlinkHealth['classMaxResourceBar'][select(2, UnitClass("player"))]

		if cur and cur > 0 then
			self.Combo:Show();
			for i = 1, max do self.Combo[i]:Hide(); end		
			for i = 1, cur do self.Combo[i]:Show(); end
		else
			self.Combo:Hide();
		end
	else
	  local comboPoints = UnitPower("player", SPELL_POWER_COMBO_POINTS)
	  if (comboPoints and comboPoints > 0) then
		  self.Combo:Show();
		  for i=1, MAX_COMBO_POINTS do self.Combo[i]:Hide(); end
		  for i=1, comboPoints do self.Combo[i]:Show(); end
	  else
		  self.Combo:Hide();
	  end
	end
end

function BlinkHealth:UpdateUnitValues()
	local heal, maxheal, perh, petheal, petmax, name;
	local power, maxpower, powertype, _;
	-- player
	if (UnitHasVehicleUI("player")) then
		heal, maxheal = UnitHealth("pet"), UnitHealthMax("pet");
		local pType, powertype = UnitPowerType("pet")
		power, maxpower = UnitPower("pet", pType), UnitPowerMax("pet", pType);
		petheal, petmax = UnitHealth("player"), UnitHealthMax("player");
		name = UnitName("player");	-- petName
	else
		heal, maxheal = UnitHealth("player"), UnitHealthMax("player");
		local pType, powertype = UnitPowerType("player")
		power, maxpower = UnitPower("player", pType), UnitPowerMax("player", pType);
		petheal, petmax = UnitHealth("pet"), UnitHealthMax("pet");
		name = UnitName("pet");
	end
	
	perh = heal/maxheal * 100 + 0.5;
	self:SetPercentText("player", perh);
	local hexColor = self:ToHexColor(1, 0.65, 0.16);  --0.49,0.99,0
	heal, maxheal = self:FormatDigit(heal), self:FormatDigit(maxheal);
	self.frame["player"].heal:SetFormattedText("|cff%s%s/%s|r", hexColor, heal, maxheal);	
	if (type(maxpower) == "number" and maxpower > 0 and self.powerColor[powertype]) then		
		heaxColor = self:ToHexColor(unpack(self.powerColor[powertype]));
		power, maxpower = self:FormatDigit(power), self:FormatDigit(maxpower);
		self.frame["player"].power:SetFormattedText("|cff%s%s/%s|r", heaxColor, power, maxpower);
		self.frame["player"].power:Show();
	else
		self.frame["player"].power:Hide();
	end
	-- pet
	hexColor = self:ToHexColor(1, 0.65, 0.16);   --0.49,0.99,0
	if (type(petmax) == "number" and petmax > 0 and name) then
		perh = petheal/petmax*100+0.5
		self.frame["player"].pet:SetFormattedText("|cff%s%s^-^%d%%|r<", hexColor, name, perh);
		self.frame["player"].pet:Show();
	else
		self.frame["player"].pet:Hide();
	end
		
		if (UnitExists("player")) then
			local _, class = UnitClass("player");
			hexColor = self:ToHexColor(unpack(self.classColor[class]));
		else
			hexColor = self:ToHexColor(UnitSelectionColor("player"));
		end
		self.frame["player"].playername:SetFormattedText("|cff%s%s|r", hexColor, UnitName("player"));
		
	-- target
	local hexH, hexP;
	if (UnitExists("target")) then
		heal, maxheal = UnitHealth("target"), UnitHealthMax("target");
		local pType, powertype = UnitPowerType("target")
		power, maxpower = UnitPower("target", pType), UnitPowerMax("target", pType);
		name = UnitName("target");
		perh = heal/maxheal * 100 + 0.5;
		self:SetPercentText("target", perh);		
		heal, maxheal = self:FormatDigit(heal), self:FormatDigit(maxheal);
		local hexH = self:ToHexColor(1, 0.65, 0.16);   --0.49,0.99,0
		if (powertype and self.powerColor[powertype] and type(maxpower) == "number" and maxpower > 0) then
			hexP = self:ToHexColor(unpack(self.powerColor[powertype]));
			power, maxpower = self:FormatDigit(power), self:FormatDigit(maxpower);
			--self.frame["target"].heal:SetFormattedText("|cff%s%s/%s|r | |cff%s%s/%s|r", hexH, heal, maxheal, hexP, power, maxpower);
			self.frame["target"].heal:SetFormattedText("|cff%s%s/%s|r", hexH, heal, maxheal);
			self.frame["target"].power:SetFormattedText("|cff%s%s/%s|r", hexP, power, maxpower);
			self.frame["target"].power:Show();
		else
			self.frame["target"].heal:SetFormattedText("|cff%s%s/%s|r", hexH, heal, maxheal);
			self.frame["target"].power:Hide();
		end

		if (UnitIsPlayer("target")) then
			local _, class = UnitClass("target");
			hexColor = self:ToHexColor(unpack(self.classColor[class]));
		else
			hexColor = self:ToHexColor(UnitSelectionColor("target"));
		end
		self.frame["target"].name:SetFormattedText("|cff%s%s|r", hexColor, name);
	
		if (UnitExists("targettarget")) then
			heal, maxheal = UnitHealth("targettarget"), UnitHealthMax("targettarget");
			perh = heal/maxheal*100+0.5
			hexColor = self:ToHexColor(1, 0.65, 0.16);
			name = UnitName("targettarget");
			if (UnitIsUnit("targettarget", "player")) then
				name = " 你 <";
			end
			self.frame["target"].tot:SetFormattedText("|cff%s>%s★%d%%|r", hexColor, name, perh);
			self.frame["target"].tot:Show();
		else
			self.frame["target"].tot:Hide();
		end
	end
end

function BlinkHealth:SetDigit(texObj, digit)
	texObj:SetWidth(self.digitTexCoords[digit][2]);
	texObj:SetHeight(self.digitTexCoords["height"]);
	texObj:SetTexCoord(self.digitTexCoords[digit][1] / self.digitTexCoords["texWidth"], (self.digitTexCoords[digit][1] + self.digitTexCoords[digit][2]) / self.digitTexCoords["texWidth"], 0.0078125, 0.3359375);
	texObj:Show();
	texObj.fill:SetWidth(self.digitTexCoords[digit][2]);
	texObj.fill:SetHeight(self.digitTexCoords["height"]);
	texObj.fill:SetTexCoord(self.digitTexCoords[digit][1] / self.digitTexCoords["texWidth"], (self.digitTexCoords[digit][1] + self.digitTexCoords[digit][2]) / self.digitTexCoords["texWidth"], 0.34375, 0.671875);
	texObj.fill:Show();
end

function BlinkHealth:SetPercentText(unit, percent)	
	local health = self.frame[unit].health;	
	local hPerc = ("%d"):format(percent); --%d%%
	local len = string.len(hPerc);

	for i = 1, 4 do
		if i > len then
			health[5 - i]:Hide();
			health[5 - i].fill:Hide();
		else
			local digit;
			if unit == "player" then
				digit = string.sub(hPerc , -i, -i);
			else
				digit = string.sub(hPerc , i, i);
			end

			self:SetDigit(health[5 - i], digit);
		end
	end
	
	if (percent == 0.5) then
		for i = 1, 4 do			
			health[5 - i].fill:Hide();
		end
	end
end

function BlinkHealth:SetPercentTextColor(unit, r, g, b)
	local health = self.frame[unit].health;
	for i=1, 4 do
		health[i].fill:SetVertexColor(r, g, b);
	end
end

function BlinkHealth:FormatDigit(digit)
	if (digit >= 1e8) then
		return ("%0.1f"..DANWEI_YI):format(digit / 1e8);
	elseif (digit >= 1e4) then
		return ("%0.1f"..DANWEI_WAN):format(digit / 1e4);
	end
	return digit;
end

function BlinkHealth:ConstructHealth(unit)
	local this = self.frame[unit];
	local health = {}
	local healthFill = {}
	for i = 1, 4 do
		health[i] = this:CreateTexture(nil, "ARTWORK")
		health[i]:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\BlinkHealthText\\digits")
		health[i]:Hide()
		healthFill[i] = this:CreateTexture(nil, "OVERLAY")
		healthFill[i]:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\BlinkHealthText\\digits")
		healthFill[i]:SetVertexColor(1, 0.65, 0.16);  --0.49,0.99,0
		healthFill[i]:Hide()
		health[i].fill = healthFill[i];
	end

	if unit == "player" then
		health[4]:SetPoint("RIGHT");
		health[3]:SetPoint("RIGHT", health[4], "LEFT");
		health[2]:SetPoint("RIGHT", health[3], "LEFT");
		health[1]:SetPoint("RIGHT", health[2], "LEFT");
	else
		health[4]:SetPoint("LEFT");
		health[3]:SetPoint("LEFT", health[4], "RIGHT");
		health[2]:SetPoint("LEFT", health[3], "RIGHT");
		health[1]:SetPoint("LEFT", health[2], "RIGHT");
	end
		
	healthFill[4]:SetPoint("BOTTOM", health[4]);
	healthFill[3]:SetPoint("BOTTOM", health[3]);
	healthFill[2]:SetPoint("BOTTOM", health[2]);
	healthFill[1]:SetPoint("BOTTOM", health[1]);

	this.health = health;
	this.healthFill = healthFill;

	-- Power, heal
	local heal, power;
	heal = this:CreateFontString(nil, "OVERLAY");
	power = this:CreateFontString(nil, "OVERLAY");
	heal:SetFontObject("SIFontMedium");
	power:SetFontObject("SIFontMedium");
	if unit == "player" then 
		heal:SetPoint("TOPRIGHT", health[4], "BOTTOMRIGHT", 0, -2);
		power:SetPoint("BOTTOMRIGHT", this, "BOTTOMRIGHT", -80, 6);
	else
		--heal:SetPoint("BOTTOMLEFT", health[1], "BOTTOMRIGHT", 5, 0);
		heal:SetPoint("TOPLEFT", health[4], "BOTTOMLEFT", 6, -2);
		power:SetPoint("BOTTOMLEFT", this, "BOTTOMLEFT", 85, 6);
	end

	this.power = power;
	this.heal = heal;

	-- Name
	local name, playername, pet, tot;
	if (unit == "player") then
		pet = this:CreateFontString(nil, "OVERLAY");
		pet:SetFontObject("SIFontSmall");
		pet:SetPoint("BOTTOMRIGHT", health[4], "TOPRIGHT", 0, 6);
		this.pet = pet;
		
		playername = this:CreateFontString(nil, "OVERLAY");
		playername:SetFontObject("SIFontMedium");
		playername:SetPoint("BOTTOMRIGHT", power, "BOTTOMRIGHT", 0, 18);
		this.playername = playername;
	else
		name = this:CreateFontString(nil, "OVERLAY");
		name:SetFontObject("SIFontMedium");
		name:SetPoint("BOTTOMLEFT", power, "BOTTOMLEFT", 0, 18);
			
		tot = this:CreateFontString(nil, "OVERLAY");
		tot:SetFontObject("SIFontSmall");
		tot:SetPoint("BOTTOMLEFT", health[4], "TOPLEFT", 0, 6);
		this.tot = tot;		
	end

	this.name = name;
end
--------------
-- 连击点
function BlinkHealth:ConstructCombo()
	local this
	if select(2, UnitClass("player")) == "MONK" then
		this = self.frame["player"]
	else
		this = self.frame["target"]
	end
	self.Combo = CreateFrame("Frame", nil, this);
	self.Combo:SetWidth(80)
	self.Combo:SetHeight(16)
	self.Combo:SetPoint("TOPLEFT", this.heal, "BOTTOMLEFT", 0, 0);
	local bg, fill = {}, {};
	for i = 1, BlinkHealth['classMaxResourceBar'][select(2, UnitClass("player"))] do
		self.Combo[i] = CreateFrame("Frame", nil, self.Combo)
		self.Combo[i]:SetWidth(16)
		self.Combo[i]:SetHeight(16)
		if i == 1 then 
			self.Combo[i]:SetPoint("LEFT", self.Combo, "LEFT")
		else
			self.Combo[i]:SetPoint("LEFT", self.Combo[i - 1], "RIGHT") 
		end
		bg[i] = self.Combo[i]:CreateTexture(nil, "ARTWORK")
		bg[i]:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\BlinkHealthText\\combo.blp")
		bg[i]:SetTexCoord(0, 16 / 64, 0, 1)
		bg[i]:SetAllPoints(self.Combo[i])
		fill[i] = self.Combo[i]:CreateTexture(nil, "OVERLAY")
		fill[i]:SetTexture("Interface\\AddOns\\_ShiGuang\\Media\\Modules\\BlinkHealthText\\combo.blp")
		fill[i]:SetTexCoord(0.5, 0.75, 0, 1)
		fill[i]:SetVertexColor(1, 1, 0)
		fill[i]:SetAllPoints(self.Combo[i])
	end
	self.Combo:Hide();
	self.Combo.bg = bg;
	self.Combo.fill = fill;	
end

----------------------
function BlinkHealth:ConstructFrame(unit)
	self.frame[unit] = CreateFrame("Frame", "SimpleInfoPlayerFrame", UIParent);
	self.frame[unit]:SetWidth(200);
	self.frame[unit]:SetHeight(50);
	if (unit == "player") then
		self.frame[unit]:SetPoint("BOTTOMRIGHT", self.anchor, "BOTTOM", -160, 0);
------------------RightClickMenu-Player-------------------------
    local RightClickPlayer = CreateFrame("Button", nil, self.frame[unit]) 
     RightClickPlayer:SetPoint("TOPLEFT",0,0)
     RightClickPlayer:SetPoint("BOTTOMRIGHT",0,-16)
     RightClickPlayer:SetScript("OnMouseDown", function(self, button)
		    if button == "LeftButton" then
		      sendCmd("/click PlayerFrame LeftButton")
		    elseif button == "RightButton" then
          sendCmd("/click PlayerFrame RightButton") 
		    end
    end)
-------------------------------------------------------------
	else
		self.frame[unit]:SetPoint("BOTTOMLEFT", self.anchor, "BOTTOM", 160, 0);
		------------------RightClickMenu-Target------------------------
    local RightClickTarget = CreateFrame("Button", nil, self.frame[unit]) 
      RightClickTarget:SetPoint("TOPLEFT",0,0)
      RightClickTarget:SetPoint("BOTTOMRIGHT",0,-16)
      RightClickTarget:SetScript("OnMouseDown", function(self, button)
    if button == "LeftButton" then
			if CheckInteractDistance("target",1) then
				InspectUnit("target")
			end
		elseif button == "RightButton" then
        sendCmd("/click TargetFrame RightButton")
		elseif button == "MiddleButton" then
			if CheckInteractDistance("target",2) then
				InitiateTrade("target")
			end
		elseif button == "Button4" then
			if CheckInteractDistance("target",4) then
				FollowUnit(fullname, 1);
			end
		else
			if CheckInteractDistance("target",1) then
				InspectAchievements("target")
			end
		end
end)
-------------------------------------------------------------
	end
	self:ConstructHealth(unit);	
end

function BlinkHealth:CreateHitAnchor()
	if (self.HitAnchor) then return end

	self.HitAnchor = CreateFrame("Button", "SimpleInfoHitPointAnchorFrameNew", UIParent);
	self.HitAnchor:SetSize(100, 80);
	self.HitAnchor:EnableMouse(true);
	self.HitAnchor:SetMovable(true);
	self.HitAnchor:SetPoint("CENTER", UIParent, "CENTER", 121, -43);
	local backdrop = {
		bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tileSize = 16, edgeSize = 10, tile = true,
		insets = {left = 2, right = 2, top = 2, bottom = 2}
	};		
	self.HitAnchor:SetBackdrop(backdrop);
	self.HitAnchor:SetBackdropColor(0.1, 0.1, 0.1, 0.65)
	self.HitAnchor:SetBackdropBorderColor(0.5, 0.5, 0.5, 1)
	
	self.HitAnchor.close = CreateFrame("Button", nil, self.HitAnchor, "UIPanelCloseButton");
	self.HitAnchor.close:SetPoint("TOPRIGHT", self.HitAnchor, "TOPRIGHT", 1, 1);

	self.HitAnchor.text = self.HitAnchor:CreateFontString(nil, "OVERLAY");
	self.HitAnchor.text:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\REDCIRCL.ttf", 21, "OUTLINE");
	self.HitAnchor.text:SetPoint("LEFT", self.HitAnchor, "LEFT", 20, -5);
	self.HitAnchor.text:SetJustifyH("RIGHT");
	self.HitAnchor.text:SetTextColor(1.0, 0.69, 0.0);
	self.HitAnchor.text:SetText("5 hit");

	self.HitAnchor:RegisterForClicks("LeftButtonDown", "RightButtonDown");
	self.HitAnchor:SetScript("OnMouseDown", function(self, button)
		if (button == "LeftButton") then
			self:StartMoving();
			self.isMoving = true;
		else
			self:Hide();
		end
		
	end);
	self.HitAnchor:SetScript("OnMouseUp", function(self)
		if (self.isMoving) then
			self:StopMovingOrSizing();
		end		
	end);

	RegisterForSaveFrame(self.HitAnchor);
	self.HitAnchor:Hide();
end

function BlinkHealth:ConstructHitPoints()
	self:CreateHitAnchor();
	if (not self.hitPoint) then
		self.hitPoint = CreateFrame("Frame", nil, UIParent);
		self.hitPoint:SetWidth(100);
		self.hitPoint:SetHeight(80);
		self.hitPoint:SetPoint("CENTER", self.HitAnchor, "CENTER", 0, 0);
		
		self.hitPoint.text = self.hitPoint:CreateFontString(nil, "OVERLAY");
		self.hitPoint.text:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\REDCIRCL.ttf", 43, "OUTLINE");
		self.hitPoint.text:SetPoint("LEFT", self.HitAnchor, "LEFT", 20, -5);
		self.hitPoint.text:SetJustifyH("RIGHT");
		self.hitPoint.text:SetTextColor(1.0, 0.69, 0.0);
		self.hitPoint.text:SetText("");

		self.hitPoint.hit = self.hitPoint:CreateFontString(nil, "OVERLAY");
		self.hitPoint.hit:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\REDCIRCL.ttf", 14, "OUTLINE");
		self.hitPoint.hit:SetPoint("BOTTOMLEFT", self.hitPoint.text, "BOTTOMRIGHT", 5, 16);
		self.hitPoint.hit:SetTextColor(1.0, 0.69, 0.0);

		self.hitPoint.class = select(2, UnitClass("player"))

		self.hitPoint:SetScript("OnEvent", function(frame, event, unit, ...)
			if ( event == "PLAYER_TARGET_CHANGED" or (event == "UNIT_POWER" and unit == PlayerFrame.unit)) then
				local point
				if select(2, UnitClass("player")) == "MONK" then
					point = UnitPower("player", SPELL_POWER_CHI)
				else
					point = UnitPower("player", SPELL_POWER_COMBO_POINTS)
				end
				if (point > 0) then			
					self.hitPoint.text:SetText(point);
					self.hitPoint.hit:SetText("hit");
				else
					self.hitPoint.text:SetText("");
					self.hitPoint.hit:SetText("");
				end
			end
		end);
	end	
end

function BlinkHealth:ShowAnchor()
	self.anchor:Show();
end
function BlinkHealth:ToggleHitPoint(switch)
	self:ConstructHitPoints();
	if (switch) then
		self.hitPoint:RegisterEvent("PLAYER_TARGET_CHANGED");
		self.hitPoint:RegisterEvent("UNIT_POWER");
		self.hitPoint:Show();
		self.Combo:SetAlpha(0);
	else
		self.hitPoint:UnregisterEvent("PLAYER_TARGET_CHANGED");
		self.hitPoint:UnregisterEvent("UNIT_POWER");
		self.hitPoint:Hide();
		self.Combo:SetAlpha(1);
	end
end

function BlinkHealth:ShowHitAnchor()
	self.HitAnchor:Show();
end

function BlinkHealth_SlashHandler(msg)
	local BHT_1 = "输入 /bht on 或 /bht off 开关插件\n";
	local BHT_2 = "输入 /bht m 调整位置\n";
	local BHT_3 = "输入 /bht hiton 或 /bht hitoff 是否显示数字连击点数\n";
	msg = string.lower(msg);
	local cmdtype, para1 = strsplit(" ", msg)
	local listSec = 0;
	if para1 ~= nil then
		listSec = tonumber(para1);
	end
	if (cmdtype == "on") then BlinkHealth:OnEnable();
	elseif (cmdtype == "off") then BlinkHealth:OnDisable();
	elseif (cmdtype == "move" or cmdtype == "m") then
			BlinkHealth:ShowAnchor();
			BlinkHealth:ShowHitAnchor();
  elseif (cmdtype == "hiton") then
		if (select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID" or select(2, UnitClass("player"))  == "MONK")then	
			BlinkHealth:ToggleHitPoint(true);
		--else
			--print"此功能只对盗贼、德鲁伊和武僧开放";
		end			
	elseif (cmdtype == "hitoff") then
		if (select(2, UnitClass("player")) == "ROGUE" or select(2, UnitClass("player")) == "DRUID" or select(2, UnitClass("player"))  == "MONK") then	
			BlinkHealth:ToggleHitPoint(false);
		--else
			--print"此功能只对盗贼、德鲁伊和武僧开放";
		end
	else 
		DEFAULT_CHAT_FRAME:AddMessage(BHT_1..BHT_2..BHT_3..BHT_4);
	end
end

function BlinkHealth:OnInitialize()
	self.frame = {};
	self:CreateAnchorFrame()
	self:ConstructFrame("player");
	self:ConstructFrame("target");
	if (select(2, UnitClass("player"))  == "ROGUE" or select(2, UnitClass("player"))  == "DRUID" or select(2, UnitClass("player"))  == "MONK") then		
		self:ConstructCombo();
		self:CreateHitAnchor();	-- 构建连击点
	end	
	self:UpdateUnitFrame();
	SlashCmdList["BLINKHEALTH"] = BlinkHealth_SlashHandler;
	SLASH_BLINKHEALTH1 = "/bht";
	--DEFAULT_CHAT_FRAME:AddMessage("BlinkHealthText已加载，配置命令/bht");
end

--------------Fivecombo-----------------------------------------------
local enaleAlert = true;
local OverlayedSpellID = {};
-- 盗贼
OverlayedSpellID["ROGUE"] = {
	2098,  --刺骨
	32645, --毒伤
	8647,  --破甲
	5171,  --切割
	408,   --肾击
	26679, --致命投掷
	1943,  --割裂
	73651, --恢复
	193316,
	199804,
	196819,
	195452,
	206237
};
-- 德鲁伊
OverlayedSpellID["DRUID"] = {
	52610,  --野蛮咆哮
	1079,   --割裂
	22568,  --割碎
	22570,  --凶猛撕咬
};
local function GetMaxPoints()
	local MAX_POINTS
	local _, _, classID = UnitClass("player")
	if classID == 4 then
		if IsPlayerSpell(193531) then
			MAX_POINTS = 6
		elseif IsPlayerSpell(14983) then
			MAX_POINTS = 5
		else
			MAX_POINTS = 5
		end
	elseif classID == 11 then
		if IsPlayerSpell(202157) or IsPlayerSpell(197490) or IsPlayerSpell(202155) or GetSpecialization() == 2 then
			MAX_POINTS = 5
		else
			MAX_POINTS = 0
		end
	else
		MAX_POINTS = 0
	end
	return MAX_POINTS
end
local function IsOverlayedSpell(spellID)
	local _, class = UnitClass("player");
	if (not OverlayedSpellID[class]) then return false end
	for i, id in ipairs(OverlayedSpellID[class]) do
		if (id == spellID) then
			return true;
		end
	end
	return false;
end
local function comboEventFrame_OnUpdate(self, elapsed)
	local countTime = self.countTime - elapsed;
	if (countTime <= 0) then
		local parent = self:GetParent();
		local points = UnitPower("player", SPELL_POWER_COMBO_POINTS)
		if (self.isAlert and points ~= GetMaxPoints()) then
			self:SetScript("OnUpdate", nil);
			ActionButton_HideOverlayGlow(parent);
			self.countTime = 0;
		end
		self.countTime = TOOLTIP_UPDATE_TIME;
	end
end
local function comboEventFrame_OnEvent(self, event, ...)
	local parent = self:GetParent();
	local points = UnitPower("player", SPELL_POWER_COMBO_POINTS)
	local spellType, id, subType  = GetActionInfo(parent.action);
	-- 如果是系统自身的提示，就不再处理
	if ( spellType == "spell" and IsSpellOverlayed(id) ) then
		return;
	elseif (spellType == "macro") then
		local _, _, spellId = GetMacroSpell(id);
		if ( spellId and IsSpellOverlayed(spellId) ) then
			return;
		end		
	end
	if (points == 5 and enaleAlert) then		
		if ( spellType == "spell" and IsOverlayedSpell(id) ) then
			ActionButton_ShowOverlayGlow(parent);
			self.isAlert = true;
			self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
		elseif ( spellType == "macro" ) then
			local _, _, spellId = GetMacroSpell(id);
			if ( spellId and IsOverlayedSpell(spellId) ) then
				ActionButton_ShowOverlayGlow(parent);
				self.isAlert = true;
				self:SetScript("OnUpdate", comboEventFrame_OnUpdate);
			else
				ActionButton_HideOverlayGlow(parent);
			end
		else
			ActionButton_HideOverlayGlow(parent);
		end
	else
		ActionButton_HideOverlayGlow(parent);
	end	
end
hooksecurefunc("ActionButton_OnUpdate", function(self, elapsed)
	if (self.comboAlert) then return end
	self.comboAlert = true;
	self.comboEventFrame = CreateFrame("Frame", nil, self);
	self.comboEventFrame.countTime = 0;
	self.comboEventFrame:RegisterEvent("UNIT_COMBO_POINTS");
	self.comboEventFrame:RegisterEvent("PLAYER_TARGET_CHANGED");
	self.comboEventFrame:SetScript("OnEvent", comboEventFrame_OnEvent);
end)

function FiveCombo_Toggle(switch)
	if (switch) then
		enaleAlert = true;
	else
		enaleAlert = false;
	end
end
---------------------------------------------------Function-------------------------------------------------
-- 定义配置
local Simple_Frames,sf = {},{};
-- 框架保存
local f = CreateFrame("Frame", nil, UIParent);
f:SetScript("OnUpdate", function(self, elapsed)
	for frame, _ in pairs(sf) do
		frame.duration = frame.duration - elapsed;
		if (frame.duration <= 0) then			
			Frame_Save(frame, frame.layout_id);
			sf[frame] = nil;
		end
	end
end);
function Frame_Save(frame, id)	
	if (frame and id) then
		local left = frame:GetLeft();
		local top = frame:GetTop();
		local width = frame:GetWidth();
		local height = frame:GetHeight();	
		
		if (left and top and width and height) then
			Simple_Frames[id] = {};
			Simple_Frames[id].X = math.floor(left + 0.5);
			Simple_Frames[id].Y = math.floor(top + 0.5);
			Simple_Frames[id].W = math.floor(width + 0.5);
			Simple_Frames[id].H = math.floor(height + 0.5);
		end
	end
end

-- 框架读取
function Frame_Load(frame, id)
	if (frame and Simple_Frames[id]) then
		frame:ClearAllPoints();
		frame:SetPoint("TOPLEFT", "UIParent", "BOTTOMLEFT", Simple_Frames[id].X, Simple_Frames[id].Y);
		frame:SetWidth(Simple_Frames[id].W);
		frame:SetHeight(Simple_Frames[id].H);		
	end
end
-- 框架悬停大小
function Frame_StopMovingOrSizing(self)
	if (self.originalStopMovingOrSizing) then
		self.originalStopMovingOrSizing(self);
	end
	self.duration = 1;
	sf[self] = true;	
end

-- 框架注册
function RegisterForSaveFrame(frame, id, no_load)
	assert(frame ~= nil, "frame must be assigned.");
	assert(type(frame) == "table", "RegisterForSaveFrame: the first parameter must be frame object.");

	if (not id) then
		id = frame:GetName();
	end

	assert(id ~= nil, "The frame has no name, can not be used as default id.");

	frame.layout_id = id;

	if (not frame.rfsf_hooked) then
		frame.rfsf_hooked = true;
		frame.originalStopMovingOrSizing = frame.StopMovingOrSizing;
		frame.StopMovingOrSizing = Frame_StopMovingOrSizing;
	end

	if (not no_load) then
		Frame_Load(frame, id);
	end
end