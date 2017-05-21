local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:GetModule("Skins")

function module:CastBarSkin()
	if MaoRUISettingDB["Skins"]["CastBar"] then return end

-----------------------------------------------------------------castbar
------------------施法条位置&增强----感谢泡泡帮忙修复-------------------------------------
--[[ 玩家施法条 ]]
CastingBarFrame:ClearAllPoints()
CastingBarFrame:SetPoint("BOTTOMRIGHT", PlayerFrame, "TOPRIGHT", -3, -5) --0, 100
CastingBarFrame.SetPoint = function() end
CastingBarFrame:SetSize(333, 12)
CastingBarFrame:SetToplevel(false)
CastingBarFrame:SetFrameStrata("LOW")
CastingBarFrame:SetParent(PlayerFrame)
CastingBarFrame.Border:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
CastingBarFrame.Flash:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
CastingBarFrame.Text = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.Text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
CastingBarFrame.Text:SetPoint("TOPLEFT", CastingBarFrame, "BOTTOMLEFT", 0, -2)
CastingBarFrame.Icon:Show()
CastingBarFrame.Icon:SetSize(PlayerPortrait:GetSize())
    -- Hacky way to set spellicon
    local function setSpell(frame, event)
        if event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" then
            SetPortraitToTexture(CastingBarFrame.Icon, CastingBarFrame.Icon:GetTexture())
        end
    end
    CastingBarFrame:HookScript("OnEvent", setSpell)
CastingBarFrame.Icon:ClearAllPoints()
CastingBarFrame.Icon:SetPoint("CENTER", PlayerPortrait, "CENTER", 0, 0)  --_G[cbf.."Text"]
--[[ 目标施法条 ]]
TargetFrameSpellBar:ClearAllPoints()
TargetFrameSpellBar:SetPoint("BOTTOMLEFT", TargetFrame, "TOPLEFT", 3, -5) --0, 100
TargetFrameSpellBar.SetPoint = function() end
TargetFrameSpellBar:SetSize(310, 12)
TargetFrameSpellBar:SetToplevel(false)
TargetFrameSpellBar:SetFrameStrata("LOW")
TargetFrameSpellBar:SetParent(TargetFrame)
TargetFrameSpellBar.Border:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
TargetFrameSpellBar.Flash:SetTexture("Interface\\Addons\\_ShiGuang\\Media\\backdrop")
TargetFrameSpellBar.Text = TargetFrameSpellBar:CreateFontString(nil)
TargetFrameSpellBar.Text:SetFont(STANDARD_TEXT_FONT, 16, "OUTLINE")
TargetFrameSpellBar.Text:SetPoint("TOPRIGHT", TargetFrameSpellBar, "BOTTOMRIGHT", 0, -2)
TargetFrameSpellBar.Icon:Show()
TargetFrameSpellBar.Icon:SetSize(PlayerPortrait:GetSize())
    local function setSpell(frame, event)
        if event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_CHANNEL_START" then
            SetPortraitToTexture(TargetFrameSpellBar.Icon, TargetFrameSpellBar.Icon:GetTexture())
        end
    end
TargetFrameSpellBar:HookScript("OnEvent", setSpell)
TargetFrameSpellBar.Icon:ClearAllPoints()
TargetFrameSpellBar.Icon:SetPoint("CENTER", TargetFramePortrait, "CENTER", 0, 0)  --_G[cbf.."Text"]

--[[施法计时]]
CastingBarFrame.Time = CastingBarFrame:CreateFontString(nil)
CastingBarFrame.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
CastingBarFrame.Time:SetPoint("RIGHT", CastingBarFrame, "RIGHT", -6, 0)
CastingBarFrame.update = .1

TargetFrameSpellBar.Time = TargetFrameSpellBar:CreateFontString(nil)
TargetFrameSpellBar.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
TargetFrameSpellBar.Time:SetPoint("LEFT", TargetFrameSpellBar, "LEFT", 6, 0)
TargetFrameSpellBar.update = .1

FocusFrameSpellBar.Time = FocusFrameSpellBar:CreateFontString(nil)
FocusFrameSpellBar.Time:SetFont("Interface\\Addons\\_ShiGuang\\Media\\Fonts\\Pixel.ttf", 18, "OUTLINE")
FocusFrameSpellBar.Time:SetPoint("RIGHT", FocusFrameSpellBar, "RIGHT", 24, 0)
FocusFrameSpellBar.update = .1

CastingBarFrame:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue, 0)).." / "..format("%.1f", max(self.maxValue - self.value, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
TargetFrameSpellBar:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue - self.value, 0)).." / "..format("%.1f", max(self.maxValue, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
FocusFrameSpellBar:HookScript("OnUpdate", function(self, elapsed)
	if not self.Time then return end
	if self.update and self.update < elapsed then
		if self.casting then
			self.Time:SetText(format("%.1f", max(self.maxValue, 0)).." / "..format("%.1f", max(self.maxValue - self.value, 0)))
		elseif self.channeling then
			self.Time:SetText(format("%.1f", max(self.value, 0)))
		else
			self.Time:SetText("")
		end
		self.update = .1
	else
		self.update = self.update - elapsed
	end
end)
--[[施法延时显示]]
local  playertimer, targettimer, lagmeter
lagmeter = CastingBarFrame:CreateTexture(nil, "BACKGROUND");
lagmeter:SetHeight(CastingBarFrame:GetHeight());
lagmeter:SetWidth(0);
lagmeter:SetPoint("RIGHT", CastingBarFrame, "RIGHT", 0, 0);
lagmeter:SetColorTexture(1, 0, 0, 1); -- red color
hooksecurefunc(CastingBarFrame, "Show", function()
	down, up, lag = GetNetStats();
	local castingmin, castingmax = CastingBarFrame:GetMinMaxValues();
	local lagvalue = ( lag / 1000 ) / ( castingmax - castingmin );
	
	if ( lagvalue < 0 ) then
		lagvalue = 0; 
	elseif ( lagvalue > 1 ) then 
		lagvalue = 1; 
	end;
	
	lagmeter:SetWidth(CastingBarFrame:GetWidth() * lagvalue);
end);
--[[焦点施法条]]
hooksecurefunc(FocusFrameSpellBar, "Show", function()
    FocusFrameSpellBar:SetScale("1.1")
end)
FocusFrameSpellBar:SetStatusBarColor(0,0.45,0.9); FocusFrameSpellBar.SetStatusBarColor = function() end
end