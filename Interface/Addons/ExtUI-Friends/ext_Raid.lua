--========================================
-- 扩展团队框体。
-- 目前只是简单的更改了框体宽度。还没有做深度的变更。
--========================================
--========================================
-- 如果团队信息没打过，按钮是灰色的，更改成即使是没打过也可以显示，只是它是空的内容。
-- 之后将团队信息框体也做一个长度的扩展。
-- 需要添加，进入团队的时候执行一次ini_RaidGroup
--========================================

local first_enter_raid_flag = false

local function ini_RaidFrame()
	-- 团队面板的描述部分。RaidFrameRaidDescription被放在RaidFrameNotInRaid.XML
	local Raid_Width = FriendsFrame:GetWidth()
	local RaidDescriptionPanel = RaidFrameRaidDescription
	RaidDescriptionPanel:SetWidth(Raid_Width)
	RaidDescriptionPanel:SetPoint("TOPLEFT", 50 , -73)
end

local function ini_RaidGroup()

	if first_enter_raid_flag then
		return
	end

	local Button_Width = 338
	local num_RaidGroupButton = 40
	local num_RaidGroup = 8
	local num_RaidGroupSlot = 5

	local ofsx1 = 29
	local ofsx2 = 2
	local Level_width = 20
	local Class_width = 80
	local Name_width = Button_Width - Level_width - Class_width - ofsx1 - ofsx2 - ofsx2
	for i = 1, num_RaidGroupButton do
		local button = _G["RaidGroupButton"..i]
		button:SetWidth(Button_Width)

		local buttonName = _G["RaidGroupButton"..i.."Name"]
		local buttonLevel = _G["RaidGroupButton"..i.."Level"]
		local buttonClass = _G["RaidGroupButton"..i.."Class"]
		buttonLevel:SetWidth(Level_width)
		buttonLevel:SetPoint("LEFT", buttonLevel:GetParent(), "LEFT", ofsx1, 0)
		buttonClass:SetWidth(Class_width)
		buttonClass:SetPoint("LEFT", buttonLevel, "RIGHT", ofsx2, 0)
		buttonName:SetWidth(Name_width)
		buttonName:SetPoint("LEFT", buttonClass, "RIGHT", ofsx2, 0)
	end


	local SetFrameBG_Width = Button_Width + 6
	local SetFrameBG_height = 80
	for i = 1, num_RaidGroup do
		local Group = _G["RaidGroup"..i]
		Group:SetWidth(Button_Width)

		local GroupLabel = _G["RaidGroup"..i.."Label"]
		GroupLabel:SetWidth(Button_Width)

		local SetFrameBG = Group:CreateTexture("RaidGroupBG"..i, "BACKGROUND")
		SetFrameBG:SetPoint("TOPLEFT")
		SetFrameBG:SetSize(SetFrameBG_Width, SetFrameBG_height)
		SetFrameBG:SetTexture("Interface\\RaidFrame\\UI-RaidFrame-GroupOutline")
		SetFrameBG:SetTexCoord(0, 0.6640625, 0, 0.625)

		for j = 1, num_RaidGroupSlot do
			local Groupslot = _G["RaidGroup"..i.."Slot"..j]
			Groupslot:SetWidth(Button_Width)
		end
	end

	first_enter_raid_flag = true
end


local function event_deal(self, event)
	if event == "GROUP_ROSTER_UPDATE" then
		ini_RaidGroup()
	elseif ( event == "PLAYER_LOGIN" ) then
		if IsInRaid() then
			ini_RaidGroup()
		end
	end
end

ini_RaidFrame()

-- 由于未知的原因无法使用钩子函数钩住RaidGroupFrame_Update()
-- hooksecurefunc("RaidGroupFrame_Update", function ()
-- 	ini_RaidGroup()
-- end)

local frametemp = CreateFrame("Frame")
frametemp:SetScript("OnEvent", event_deal)
frametemp:RegisterEvent("GROUP_ROSTER_UPDATE")
frametemp:RegisterEvent("PLAYER_LOGIN")
-- frametemp:RegisterEvent("PLAYER_ENTERING_WORLD")
