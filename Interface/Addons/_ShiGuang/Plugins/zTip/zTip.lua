--[[
	上官晓雾
]]--
local _G = getfenv(0)
local format = string.format
local strfind = string.find
local gsub = string.gsub
local _, i
--~ LoadAddOn("Blizzard_InspectUI")
local PRIMARY_TALENT = SPECIALIZATION.." : "
local SECONDARY_TALENT = TALENT.." : "
local lastlinenum

local print = function(...)
	if (zTip.god==1) then
		_G.print(...)
	end
end

zTip = CreateFrame("Frame", nil, GameTooltip)
-----------------默认设置修改处:
			------生命、魔法条材质
local GameBarTexture1 = "Interface\\RAIDFRAME\\Raid-Bar-Hp-Fill.blp"
local GameBarTexture2 = "Interface\\TargetingFrame\\UI-TargetingFrame-BarFill"
function zTip:GetDefault()
	return {
		-- 以下为参数设置
		-- 提示: 取值只有两种 -- 1. 数字 2. true / false
		-- true 表示开启, false表示关闭

		Anchor = 3,			-- Default: 0
			-- [false 使用系统默认位置(屏幕右下角)]
			-- [0为人物信息跟随鼠标，非人物（按钮之类）使用默认位置（屏幕右下角）]
			-- [1为屏幕上方，注意用OffsetX和OffsetY调整相对位置，非人物为默认位置（屏幕右下角）]
			-- [2为跟随鼠标，向上延展，非人物为默认位置]
			-- [3为全部跟随鼠标，非人物(按钮之类)为对象右上]
			-- [4为屏幕上方，注意用OffsetX和OffsetY调整相对位置，非人物为对象右上]
			-- [5为全部跟随鼠标，并向上延展，要正上方，将Offset调为0,0即可]

		OffsetX = 30, OffsetY = 30,		--位置偏移值（系统位置无效） Default: 30,30
		OrigPosX = 70, OrigPosY = 120,	--系统默认位置的偏移值（原版X=100, Y=160），要使用游戏默认设置为: false, false
		Scale = 0.9,					--提示缩放 Default: 1.1 取值：0~N.x		Game's Default: 1.0
		Fade = false,					--是否渐隐 Default: false       游戏默认设置为: true
		DisplayPvPRank = true,			--显示军衔[false 不显示 | true 显示] Default: false
		ShowIsPlayer = false,			--是否在等级行显示“（玩家）”字样	Default: false
		DisplayFaction = true,			--是否显示NPC声望等级。
		PlayerServer = true,			--是否显示玩家所属服务器. Default: true
		TargetOfMouse = true,			--显示对象的目标. Default: true
		TTargetOfMouse = true,			--显示对象的目标的目标
		ClassIcon = true,				--显示对象玩家/小宠物的职业/天赋图标。Default: true
		TalentIcon = true,				--显示天赋图标
		CombatHide = true,				--战斗中隐藏
		VividMask = false,				--立体化鼠标提示. Default: true
		ShowTalent = true,				--是否显示玩家天赋
		TargetedBy = true,				--是否显示关注目标
		ManaBAR = false,				--显示法力条
		HealthBAR = false,				--显示血量条
		NPCClass = true,				--显示NPC职业
		ItemLevel = true,				--显示物品等级
		ShowFaction = false,			--显示阵营字样(默认隐藏)
		ShowBarNum = true,				--显示生命法力条数字
		BarTexture = false,				--切换生命条材质
		GuildInfo = true,
		MiniNum = false,
		ShowLegend = true,		--显示7.0+橙装个数
	}
end

-------------------------------------------------------
-- Inspect protection codes for 6.0/WOD

-- 上官晓雾    2014-10
-- 来源 : Cloudy Unit Info
-------------------------------------------------------
--[[
	Cloudy Unit Info
	Copyright (c) 2013, Cloudyfa
]]
	--- Variables ---

local ScanUnit
local inspectDB = {GearDB = {},CZ={}, SpecDB = {}}
local artlist = {}
local currentID, currentGUID


do

	local GameTooltipFrame = CreateFrame ("GameTooltip", "zTipGameTooltipFrame", nil, "GameTooltipTemplate")

	
	local itemLevelPattern = _G.ITEM_LEVEL:gsub("%%d", "(%%d+)")
	function RewardRealItemLevelByLink(itemLink)
		if(itemLink)then
			GameTooltipFrame:SetOwner (WorldFrame, "ANCHOR_NONE")
			GameTooltipFrame:ClearLines()
			GameTooltipFrame:SetHyperlink(itemLink)
			local itemlevel = nil
			for i = 2, 6 do
				local label, text = _G["zTipGameTooltipFrameTextLeft"..i], nil
				if label then text=label:GetText() end
				if text then
					if itemlevel==nil then itemlevel = tonumber(text:match(itemLevelPattern)) end
				end
			end
			
			return itemlevel or 1
		end
	end
	function RewardRealItemLinkByInsID(unit,index)
		GameTooltipFrame:SetOwner (WorldFrame, "ANCHOR_NONE")
		GameTooltipFrame:ClearLines()
		GameTooltipFrame:SetInventoryItem(unit,index)
		return  select(2,GameTooltipFrame:GetItem())
	end
	function RewardRealItemLevelByInsID(unit,index)
		GameTooltipFrame:SetOwner (WorldFrame, "ANCHOR_NONE")
		GameTooltipFrame:ClearLines()
		if (GameTooltipFrame:SetInventoryItem(unit,index)) then
			local itemlevel = nil
			for i = 2, 6 do
				local label, text = _G["zTipGameTooltipFrameTextLeft"..i], nil
				if label then text=label:GetText() end
				if text then
					if itemlevel==nil then itemlevel = tonumber(text:match(itemLevelPattern)) end
				end
			end
			return itemlevel or 1,select(2,GameTooltipFrame:GetItem())
		end
	end
	local artitemLeveladd = "+(%d+)".._G.ITEM_LEVEL:gsub("%%d", "")
	function RewardRealArtItemLevelAdd(itemLink)
		if(itemLink)then
			GameTooltipFrame:SetOwner (WorldFrame, "ANCHOR_NONE")
			GameTooltipFrame:ClearLines()
			GameTooltipFrame:SetHyperlink(itemLink)
			local itemlevel = nil
			for i = 2, 6 do
				local label, text = _G["zTipGameTooltipFrameTextLeft"..i], nil
				if label then text=label:GetText() end
				if text then
					if itemlevel==nil then itemlevel = tonumber(text:match(artitemLeveladd)) end
				end
			end
			
			return itemlevel or 0
		end
	end

	local outline = CONTINUED;
	local nextInspectRequest = 0
	local lastInspectRequest = 0
	
	--- Create Frame ---
	CUIInspect = CreateFrame('Frame', 'CloudyUnitInfo')
	CUIInspect:RegisterEvent('UNIT_INVENTORY_CHANGED')
	CUIInspect:RegisterEvent('INSPECT_READY')

	--- Set Unit Info ---
	local function SetUnitInfo(gear, spec, cz)
		if (not gear) and (not spec) then return end
		
		local _, unit = GameTooltip:GetUnit()
		if (not unit) or (UnitGUID(unit) ~= currentGUID) then return end

		local gearLine, specLine
		for i = 2, GameTooltip:NumLines() do
			local line = _G['GameTooltipTextLeft' .. i]
			local text = line:GetText()

			if text and strfind(text, zTip.locStr.ItemLevel) then
				gearLine = line
			elseif text and strfind(text, PRIMARY_TALENT) then
				specLine = line
			end
		end
		if gear and zTipSaves.ItemLevel then
			gear = "|cffffff00"..zTip.locStr.ItemLevel.." : |r"..gear
			if (zTipSaves.ShowLegend and cz and cz~=0) then
				gear = gear.."|c"..RAID_CLASS_COLORS["DRUID"].colorStr..(cz and "("..(cz)..")" or "").."|r"
			end
			if gearLine then
				gearLine:SetText(gear)
			else
				if lastlinenum < GameTooltip:NumLines() then
					lastlinenum = lastlinenum + 1
					_G["GameTooltipTextLeft"..lastlinenum]:SetText(gear)
				else
					GameTooltip:AddLine(gear)
					lastlinenum = GameTooltip:NumLines()
				end
			end
		end

		if spec and zTipSaves.ShowTalent then
			if tonumber(spec) then	--spec已读取到
				if tonumber(spec)==0 then		--无专精
					spec = "|cffffff00"..PRIMARY_TALENT.."|r".."|cff00ff00["..NONE.."]|r"
				else							--有专精
					local _, specName, _, icon = GetSpecializationInfoByID(tonumber(spec))
					if zTipSaves.TalentIcon and icon then 			--是否使用icon
						icon = "|T"..icon..":12:12:0:0:10:10:0:10:0:10|t "
					else
						icon = ""
					end
					spec = "|cffffff00"..PRIMARY_TALENT.."|r"..icon.."|cff00ff00["..specName.."]|r"
				end
			else					--spec未读取到
				spec = "|cffffff00"..PRIMARY_TALENT.."|r".."|cff00ff00"..spec.."|r"
			end

			if specLine then
				specLine:SetText(spec)
			else
				if lastlinenum < GameTooltip:NumLines() then
					lastlinenum = lastlinenum + 1
					_G["GameTooltipTextLeft"..lastlinenum]:SetText(spec)
				else
					GameTooltip:AddLine(spec)
					lastlinenum = GameTooltip:NumLines()
				end
			end
		end
		GameTooltip:Show()
	end
	
	--- Unit Gear Info ---
	local function UnitGear(id)
		if (not id) or (UnitGUID(id) ~= currentGUID) then return end
		if (id == 'player') then
			_, ilvl = GetAverageItemLevel()
			if (ilvl > 0) then ilvl = string.format('%.1f', ilvl) end
			return ilvl;
		end
		
		local Visible = UnitIsVisible(id)
		local ulvl = UnitLevel(id)
		local class = select(2, UnitClass(id))

		local CZ = 0;
		
		local ilvl = 0
		local total, count, delay = 0, 16, nil
		local Artlevel = 0;
		local twohandlevel;
		for i = 1, 17 do
			if (i ~= 4) then
				local itemTexture = GetInventoryItemTexture(id, i)
				print(itemTexture,i,id)
				if itemTexture then
					local itemLink = GetInventoryItemLink(id, i)
					local isCZ = false;
					local level,quality,level,slot,texture;
					if (itemLink) then
						_, _, quality, level, _, _, _, _, slot, texture = GetItemInfo(itemLink)
						level = RewardRealItemLevelByLink(itemLink)
					else
						level,itemLink = RewardRealItemLevelByInsID(id,i)
						quality = GetInventoryItemQuality(id,i)
					end
					if(level>=895 and quality == 5) then
						CZ = CZ + 1
					end
					print(i,itemLink,level)
					if (not level) then
						print(i,"not level",itemLink)
						delay = true
					else
						if(quality==6 and level>=750) then
							if not Visible and (texture) and not artlist[texture] then	--进入游戏第一次,遇到了没缓存过的神器,直接再来一次ins
								delay = true
								artlist[texture] = true
							end 
							if(not Artlevel or Artlevel==0)then
								Artlevel = level - 750;
							end
							--[[
							if(itemLink) then
								local _, _, _, jewelId1, jewelId2, jewelId3, jewelId4 = strsplit(":",itemLink)
								 jewels = {
									tonumber(jewelId1) or false,
									tonumber(jewelId2) or false,
									tonumber(jewelId3) or false
								}
								
								-- local ssss="";
								-- local index = 0;
								-- for qwe in (itemLink..":"):gmatch("(.-)"..":") do
									-- index = index + 1;
									-- if(tonumber(qwe)) then
									-- ssss = ssss.."["..index..":"..qwe.."]";
									-- end
								-- end
								print("物品链接:",ssss)
								local outstr = ""
								for ari = 1,3 do
									local _,arlink = GetItemGem(itemLink,ari);
									if (arlink) then
										local arlevel = C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic(arlink)
										Artlevel = Artlevel + arlevel;
										outstr = outstr.."{"..ari..":"..arlevel.."}"
									else
										if(jewels[ari]) then	--若没有读取到圣物,再来一次ins
											print("圣物遗漏了")
											delay = true;
										end
									end
								end
								print(outstr)
							else
								-- if(not Artlevel or Artlevel==0)then
									-- Artlevel = level - 750;
								-- end
								print(id,i,"error")
							end]]
							print(Artlevel,delay,"啧啧",itemLink or "无链接")
							level = 750
						end
						
						if(itemLink)then
							print(itemLink,level)
						end
						
						if (not quality) or (not level) then
							print(i,"not quality not level")
							delay = true
						else
							total = total + level
						end
						if not slot or (slot == 'INVTYPE_2HWEAPON') or (slot == 'INVTYPE_RANGED') or (slot == 'INVTYPE_RANGEDRIGHT') then
							if (i==16) then
								twohandlevel = level
							elseif(i==17) then
								twohandlevel = 0
							end
						end
					end
				end
			end
		end
		print(delay,total,Artlevel,twohandlevel)
		if (not delay) then
				--Artlevel标记,神器,加上神器额外等级(level-750)*2
			if (Artlevel) then
				total =  total + Artlevel * 2
			end
				--双手武器标记,若副手为空,加twohandlevel(双手武器下副手如果拿其他道具,数据会错---狂暴战)
			if (twohandlevel) then
				total = total + twohandlevel
			end
			ilvl = total / 16

			if (ilvl > 0) then ilvl = string.format('%.1f', ilvl) end
		else
			print("next",GetTime(),ilvl)
			ilvl = nil
		end
		return ilvl,CZ
	end

	--- 读取天赋ID ---
	local function UnitSpecID(id)
		if (not id) or (UnitGUID(id) ~= currentGUID) then return end

		local specID
		if (id == 'player') then
			local specIndex = GetSpecialization()
			specID = specIndex and GetSpecializationInfo(specIndex) or 0
		else
			specID = GetInspectSpecialization(id)
		end
		return specID
	end
	--- Scan Current Unit ---
	function ScanUnit(id, forced)
		local cachedGear, cachedSpec, cachedCZ

		if UnitIsUnit(id, 'player') then
			cachedSpec = UnitSpecID('player')
			cachedGear, cachedCZ = UnitGear('player')
			SetUnitInfo(cachedGear or outline, cachedSpec or CONTINUED,cachedCZ)
		else
			print(id,UnitGUID(id),currentGUID,"开始ScanUnit")
			if (not id) or (UnitGUID(id) ~= currentGUID) then return end
			
			cachedGear = inspectDB.GearDB[currentGUID]
			cachedSpec = inspectDB.SpecDB[currentGUID]
			cachedCZ = inspectDB.CZ[currentGUID]
			
			if cachedGear or forced then
				SetUnitInfo(cachedGear or outline, cachedSpec,cachedCZ)
			end

			if not (IsShiftKeyDown() or forced) then
				if cachedGear and cachedSpec then return end
 				if UnitAffectingCombat('player') then return end
			end
			
 			if (not UnitIsVisible(id) and not id:find("party")) then return end
			if UnitIsDeadOrGhost('player') or UnitOnTaxi('player') then return end
			if InspectFrame and InspectFrame:IsShown() then return end
			
			print(id,UnitGUID(id),currentGUID,"ScanUnit中SetUnitInfo",lastInspectRequest)
			SetUnitInfo(outline, cachedSpec or CONTINUED,cachedCZ)

			-- local timeSinceLastInspect = GetTime() - lastInspectRequest
			-- if (timeSinceLastInspect >= 0) then
				-- nextInspectRequest = 1.5 - timeSinceLastInspect
			-- else
				-- nextInspectRequest = 1.5
			-- end
			
			CUIInspect:Show()
		end
	end

	local oldlastInspectRequest = 0;
	lastInspectRequest = GetTime()
	--- Handle Events ---
	CUIInspect:SetScript('OnEvent', function(self, event, ...)
		if (event == 'UNIT_INVENTORY_CHANGED') then
			local id = ...
			if (UnitGUID(id) == currentGUID) then
				ScanUnit(id, true)
			end
		elseif (event == 'INSPECT_READY') then
			local guid = ...
			if (oldlastInspectRequest == lastInspectRequest) then	--在一次NotifyInspect,后会多次触发INSPECT_READY
				return;
			else
				oldlastInspectRequest = lastInspectRequest;
			end
			print("隐藏CUIInspect")
			CUIInspect:Hide()
			if (guid ~= currentGUID) then return end
			print(GetTime(),"执行观察")
			local gear,CZ  = UnitGear(currentID)
			inspectDB.GearDB[currentGUID] = gear
			inspectDB.CZ[currentGUID] = CZ

			local spec = UnitSpecID(currentID)
			inspectDB.SpecDB[currentGUID] = spec


			if (not gear) or (not spec) then
			
				ScanUnit(currentID, true)
				
			else
				SetUnitInfo(gear, spec, CZ)
			end
		end
	end)
	
	CUIInspect:SetScript('OnUpdate', function(self, elapsed)
		-- nextInspectRequest = nextInspectRequest - elapsed
		outline = "等待.."
		-- if (nextInspectRequest > 0) then return end
		if(GetTime() - lastInspectRequest < 1.5) then return end
		
		-- print(currentID,currentID and UnitGUID(currentID),currentGUID)
		-- self:Hide()
		if currentID and (UnitGUID(currentID) == currentGUID) then
			lastInspectRequest = GetTime()
			outline = "观察.."
			print(lastInspectRequest,"开始观察",currentGUID)
			NotifyInspect(currentID)
		end
	end)
	CUIInspect:Hide()
end
--------------------
--------------------
--------------------

zTipSaves = zTip:GetDefault()

-- 公会名和姓名的明暗度调整 Default: 0.86 暗一点（不可超过1！）
zTip.GuildColorAlpha = 0.86
local pet_r=1
local pet_b=0
local pet_g=1

-- localized strings
zTip.locStr = {}

-- record player's factions standingId
zTip.factions = {}
---:一些函数:---
-- 颜色转换
function zTip:GetHexColor(color)
	if not color then
		return "FFFFFF"
	-- elseif not color.colorStr then
	else
		return format("%2x%2x%2x",color.r*255,color.g*255,color.b*255)
		-- return color.colorStr
	end
end

	--Hook：GameTooltip渐隐
hooksecurefunc(GameTooltip, "FadeOut", function(self)
	if (not zTipSaves.Fade) then
		GameTooltip:Hide();
	end
end)

--[[	返回职业图标	]]
function zTip:GetClassIconForText(class,size)
	if not class then return end
	local  classiconCoord = CLASS_ICON_TCOORDS[class]
	if classiconCoord then
		local a1,a2,a3,a4 = classiconCoord[1]*100,classiconCoord[2]*100,classiconCoord[3]*100,classiconCoord[4]*100
		local ed
		if size and tonumber(size) < 0 then
			ed = a2..":"..a1..":"..a3..":"..a4.."|t "
		else
			ed = a1..":"..a2..":"..a3..":"..a4.."|t "
		end
		return "|TInterface\\WorldStateFrame\\Icons-Classes:"..(size or 12)..":"..(size or 12)..":0:0:100:100:"..ed
	end
end
-- 级别上色
local lDiff,lRange, r, g, b
function zTip:GetDifficultyColor(level)
	lDiff = level - UnitLevel("player");
	lRange = GetQuestGreenRange()
	if (lDiff >= 0) then
		r = 1.00; b = 0.00;
		if lDiff < 10 then
			g = 1 - (lDiff*0.10)
		else
			g = 0.00
		end
	elseif ( -lDiff < lRange) then
		g = 1.00; b = 0.00;
		r = 1 - (-1.0*lDiff)/lRange
	elseif ( -lDiff == lRange ) then
		r = 0.50; g = 1.00; b = 0.50;
	else
		r = 0.75; g = 0.75; b = 0.75;
	end
	return format("%2x%2x%2x",r*255,g*255,b*255);
end

---:遮罩:---
function zTip:GetVividMask()
	local mask = _G["GameTooltipMask"]
	if mask then return mask end

	mask = GameTooltip:CreateTexture("GameTooltipMask")
	mask:SetTexture("Interface\\Tooltips\\UI-Tooltip-Background")
	mask:SetPoint("TOPLEFT", GameTooltip, "TOPLEFT", 4, -4)
	mask:SetPoint("BOTTOMRIGHT", GameTooltip, "TOPRIGHT", -4, -30)
	mask:SetBlendMode("ADD")
	mask:SetGradientAlpha("VERTICAL", 0, 0, 0, 0, 1, 1, 1, 0.66)
	mask:Hide()

	return mask
end

local updateTooltip = 2
----
	--Events
----
function zTip:OnUpdate(elapsed)
	-- offset to mouse
	if self.AnchorType then
		x,y = GetCursorPosition()
		uiscale = UIParent:GetScale()
		tipscale = GameTooltip:GetScale()
		x = (x + zTipSaves.OffsetX) / tipscale / uiscale
		GameTooltip:ClearAllPoints()
		if zTip.AnchorType == 2 then
			y = (y + zTipSaves.OffsetY) / tipscale / uiscale
			GameTooltip:SetPoint("BOTTOM", UIParent, "BOTTOMLEFT", x, y)
		else
			y = (y - zTipSaves.OffsetY) / tipscale / uiscale
			GameTooltip:SetPoint("TOPLEFT",UIParent,"BOTTOMLEFT", x, y)
		end
	end

	if UnitExists("mouseover") then
		-- refresh target of mouseover
		self:RefreshMouseOverTarget(elapsed)
	elseif self.unit and not zTipSaves.Fade and GameTooltip:IsOwned(UIParent) then
		GameTooltip:Hide()
	elseif not GameTooltipTextLeft1:GetText() and not GameTooltipTextRight1:GetText() then
		GameTooltip:Hide()
	end
	-- GameTooltipStatusBar.unit = self.unit
	-- if not self.unit  then GameTooltipStatusBar:Hide() end
end

function zTip:OnEvent(event, ...)
	if event == "PLAYER_LOGIN" then
		self:Init()
	elseif event == "PLAYER_ENTERING_WORLD" then
		GameTooltip:SetScale(zTipSaves.Scale)
	elseif event == "UPDATE_FACTION" then
		self:UpdatePlayerFaction()
	end
end
zTip:RegisterEvent("PLAYER_LOGIN")
zTip:SetScript("OnEvent",zTip.OnEvent)

--[[Initialize]]--
function zTip:Init()
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:SetScript("OnUpdate", self.OnUpdate)

	-- mask
		if zTipSaves.VividMask then
			zTip:GetVividMask():Show()
		end
		
	-- 加载蓝条
		-- :一个manabar的标准套路↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
		if (zTipSaves.ManaBAR) then
			GameTooltip.manabar = CreateFrame("StatusBar","GameTooltipManaBar",GameTooltip)
			GameTooltipManaBar:SetPoint("TOPLEFT",GameTooltipStatusBar,"BOTTOMLEFT",0,-5)
			GameTooltipManaBar:SetPoint("TOPRIGHT",GameTooltipStatusBar,"BOTTOMRIGHT",0,-5)
			GameTooltipManaBar:SetHeight(GameTooltipStatusBar:GetHeight())
			TextStatusBar_Initialize(GameTooltip.manabar)
			local textString=GameTooltipManaBar:CreateFontString(nil,"OVERLAY","GameFontHighlightSmallOutline")
			textString:SetPoint("CENTER")
			textString:SetTextHeight(14)
			textString:SetTextColor(1,1,1)
			GameTooltipManaBar.textLockable = 1;
			GameTooltipManaBar.disconnected=true
			GameTooltipManaBar:GetParent().noTextPrefix = true
			SetTextStatusBarText(GameTooltipManaBar,textString)
			UnitFrameManaBar_Initialize(nil,GameTooltipManaBar,textString,true)
			GameTooltipManaBar:Hide()
			GameTooltipManaBar:HookScript("OnUpdate",function(self)
				if not self.unit then
					GameTooltipManaBar:Hide()
					GameTooltipManaBar.pauseUpdates = true
				end
			end)


			if zTipSaves.ManaBAR then
				GameTooltipManaBar.pauseUpdates = false
			else
				GameTooltipManaBar.pauseUpdates = true
			end

			if zTipSaves.ShowBarNum then
				GameTooltipManaBar.lockShow = 1
			else
				GameTooltipManaBar.lockShow = 0
			end
		end

		-- 生命条文字
		local textString=GameTooltipStatusBar:CreateFontString(nil,"OVERLAY","GameFontHighlightSmallOutline")
		textString:SetPoint("CENTER")
		textString:SetTextHeight(14)
		textString:SetTextColor(1,1,1)
		GameTooltipStatusBar.zeroText = ""
		GameTooltipStatusBar.frequentUpdates = 1
		GameTooltipStatusBar.capNumericDisplay = true
		SetTextStatusBarText(GameTooltipStatusBar,textString)
		GameTooltipStatusBar:HookScript("OnValueChanged",function(self,value)
			if zTipSaves.HealthBAR and value then
				TextStatusBar_OnValueChanged(self, value);
			end
		end)
		
		if zTipSaves.HealthBAR then
			GameTooltipStatusBar.pauseUpdates = false
		else
			GameTooltipStatusBar.pauseUpdates = true
		end
		if zTipSaves.ShowBarNum then
			GameTooltipStatusBar.lockShow = 1
		else
			GameTooltipStatusBar.lockShow = 0
		end


		function zTip:ChangeBarTexture()
			local GameBarTexture
			if zTipSaves.BarTexture then
				GameBarTexture = "Interface\\RAIDFRAME\\Raid-Bar-Hp-Fill.blp"
			else
				GameBarTexture = "Interface\\TargetingFrame\\UI-TargetingFrame-BarFill.blp"
			end
			if (GameTooltipManaBar) then
				GameTooltipManaBar:SetStatusBarTexture(GameBarTexture)
			end
			GameTooltipStatusBar:SetStatusBarTexture(GameBarTexture)
		end
		zTip:ChangeBarTexture()

	GameTooltip:SetScale(1.2)		--不知名原因，需要调整一次大小，不然血条上的字体会异常难看
	-- Scripts

	GameTooltip:HookScript("OnTooltipSetUnit", function(self,...)
		zTip:OnTooltipSetUnit()
	end)

	GameTooltip:HookScript("OnTooltipCleared", function(self)
		GameTooltip_ClearMoney(self)
		GameTooltip_ClearStatusBars(self)
		zTip:OnGameTooltipHide()
	end)


	-- HOOKs
	hooksecurefunc("GameTooltip_SetDefaultAnchor", zTip.SetDefaultAnchor)
	--GameTooltip_SetDefaultAnchor = zTip.SetDefaultAnchor
	--GameTooltip_UnitColor = function(unit)
	--	return zTip:UnitColor(unit)
	--end

	-- Slash
	SLASH_ZTIPSLASH1 = "/ztip"
	SlashCmdList["ZTIPSLASH"] = function(msg)
		zTip:Slash(msg)
	end
end

--factions
local name, standingId, isHeader, isCollapsed
function zTip:UpdatePlayerFaction()
	for i = 1, GetNumFactions() do
		name,_,standingId,_,_,_,_,_,isHeader,isCollapsed,_ = GetFactionInfo(i)
		if name and not isHeader then
			self.factions[name] = standingId
		end
	end
end



local reaction	-- self var used in several functions
local gender = UnitSex("player")

-- get the formated faction name
local label, str
function zTip:GetUnitFaction(unit, reaction)
	reaction = reaction or UnitReaction(unit, "player")
	if not reaction then return "" end

	if reaction == 7 then
		for i = GameTooltip:NumLines(),3,-1 do
			label = _G["GameTooltipTextLeft"..i]:GetText()
			if label and label ~= PVP and self.factions[label] then
				reaction = self.factions[label]
				break
			end
		end
	end
	str = GetText("FACTION_STANDING_LABEL"..reaction, gender)
	if reaction == 5 then str = format("|cff33CC33%s|r", str)
	elseif reaction == 6 then str = format("|cff33CCCC%s|r", str)
	elseif reaction == 7 then str = format("|cffFF6633%s|r", str)
	elseif reaction == 8 then str = format("|cffDD33DD%s|r", str)
--Add 4 lines. By YYSS
	elseif reaction == 1 then str = format("|cffFF4444%s|r", str)
	elseif reaction == 2 then str = format("|cffFF0000%s|r", str)
	elseif reaction == 3 then str = format("|cffFF7744%s|r", str)
	elseif reaction == 4 then str = format("|cffFFCC00%s|r", str)
	end

	return str
end

--[[	Positions		]]
local x,y,uiscale,tipscale
function zTip:SetDefaultAnchor(parent)
	self:SetOwner(parent, "ANCHOR_NONE");
	if zTipSaves.OrigPosX and zTipSaves.OrigPosY then
		self:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -zTipSaves.OrigPosX - 13, zTipSaves.OrigPosY);
	else
		self:SetPoint("BOTTOMRIGHT", "UIParent", "BOTTOMRIGHT", -CONTAINER_OFFSET_X - 13, CONTAINER_OFFSET_Y);
	end
	--self.default = 1;

	if zTipSaves.Anchor then
		if parent == UIParent then
			-- posiont will be set in update function
			if zTipSaves.Anchor == 0 or zTipSaves.Anchor == 3 then
				GameTooltip:ClearAllPoints()
				zTip.AnchorType = 1
			elseif zTipSaves.Anchor == 2 or zTipSaves.Anchor == 5 then
				GameTooltip:ClearAllPoints()
				zTip.AnchorType = 2
			end	
			if UnitExists("mouseover") then
				if zTipSaves.Anchor == 1 or zTipSaves.Anchor == 4 then -- on top
					zTip.AnchorType = nil
					uiscale = UIParent:GetScale()
					tipscale = self:GetScale()
					x = zTipSaves.OffsetX / tipscale / uiscale
					y = zTipSaves.OffsetY / tipscale / uiscale
					self:ClearAllPoints()
					self:SetPoint("TOP",UIParent,"TOP", x, -y)
				else -- follow cursor [0,2,3,5]
				end
				--如果目标是unit,刷新一次
				zTip:OnUpdate(0.01)
			else -- not unit 像是熔炉，信箱
				self:SetOwner(parent, "ANCHOR_CURSOR")
				zTip.AnchorType = nil
			end
		else -- not a unit tip, buttons or other
			if zTipSaves.Anchor > 2 or parent.unit and zTipSaves.Anchor~=0 then
				self:SetOwner(parent,"ANCHOR_RIGHT")
			else -- use default anchor (BottomRight to Screen)
			end
			if zTipSaves.Anchor == 2 then zTip.AnchorType = 2 end
		end
	else -- use deault
	end
end



local unit, guid
local bplayer, bdead, tapped
local text, levelline, tmp, tmp2
local unitrace, unitCreatureType
local guild, guildrank, guildid
local bbattlepet
local targetlinenum
local found, trueNum
--[[ MouseOver Target 目标]]
local mouseTarget,mouseTTarget
local function GetTarget(unit,tname,ic)
	local tip,name
	local unittarget = unit.."target"
	name = UnitName(unittarget)
	if name ~= tname then
		tname = name or UNKNOWNOBJECT
		local tmp, tmp2 = nil, nil
--~ 		local punit = gsub(unit,"target","")
--~ 		if not (punit~="target" and UnitExists(punit)) then punit = nil end

		tip = format("|cffFFFF00%s [|r", ic and "-->" or zTip.locStr.Targeting) -- '['
		-->>>
		-- 指向我自己
		if UnitIsUnit(unittarget, "player") then
			tip = format("%s |c00FF0000%s|r", tip, zTip.locStr.YOU)
		-- 指向他自己
		elseif unit and UnitIsUnit(unittarget,unit) then
			tip = format("%s |cffFFFFFF%s|r", tip, zTip.locStr.Self)
		-- 指向其它玩家
		elseif UnitIsPlayer(unittarget) then
			tmp, tmp2 = UnitClass(unittarget)
			if UnitIsEnemy(unittarget,"player") then
				-- red enemy player
				tip = format("%s |cffFF0000%s|r |cff%s(%s)|r", tip,tname,
					zTip:GetHexColor(RAID_CLASS_COLORS[(tmp2 or "")]), zTip:GetClassIconForText(tmp2,-1) or nil)
			else
				-- white friend player
				tip = format("%s |cff%s%s|r |cffFFFFFF(%s)|r", tip,
					zTip:GetHexColor(RAID_CLASS_COLORS[(tmp2 or "")]),
					tname,zTip:GetClassIconForText(tmp2,-1) or nil)
			end
		else
			tip = format("%s |cffFFFFFF%s|r", tip, tname)
		end
		-->>>
		tip = format("%s |cffFFFF00]|r", tip) -- ']'
	end
	return tip,tname
end
local function SetMouseTarget(text)
	local result
	if not UnitExists(zTip.unittarget) then
		mouseTarget = nil
		result = nil
	else
		local tip
		tip, mouseTarget = GetTarget(zTip.unit,mouseTarget)

		if tip then
			result = tip
		end
	end
	return result
end
local function SetMouseTTarget(text)
	local result
	if not UnitExists(zTip.unittarget.."target") then
		mouseTTarget = nil
		result = nil
	else
		local tip
		tip, mouseTTarget = GetTarget(zTip.unittarget,mouseTTarget,true)
		if tip then
			result = tip
		end
	end
	return result
end
--[[	目标刷新		]]
function zTip:RefreshMouseOverTarget(elapsed)
	-- timer, refresh every 0.5s
	self.timer = (self.timer or 0.1) + elapsed
	if self.timer < 0.1 then return end
	self.timer = 0


	if not zTipSaves.TargetOfMouse then return end
	if not targetlinenum then return end

	local text
	text = _G["GameTooltipTextLeft"..targetlinenum]
	if not text then return end

	text.dtxtt = SetMouseTarget(text)


	if zTipSaves.TTargetOfMouse then
		text.dtxttt=SetMouseTTarget(text)
	else
		text.dtxttt=nil
	end

	if text.dtxtt then
		text:SetText(text.dtxtt..(text.dtxttt or ""))
		text:Show()
		GameTooltip:Show()
	end

end

--[[	设置目标		]]
function zTip:OnTooltipSetUnit()
--~ 	BOSS战中隐藏
	if zTipSaves.CombatHide and UnitExists("boss1") then GameTooltip:Hide() end

	zTip.unit = zTip:OnMouseOverUnit(GameTooltip:GetUnit())
	if zTip.unit then
		if not zTipSaves.HealthBAR then GameTooltipStatusBar:Hide() end
		zTip.unittarget = zTip.unit.."target"
		if (GameTooltipManaBar) then
			if UnitExists(zTip.unit) and zTipSaves.ManaBAR and not UnitIsDeadOrGhost(zTip.unit) then
				_, GameTooltipManaBar.unit = GameTooltip:GetUnit()
				if GameTooltipManaBar.unit then
					GameTooltipManaBar.pauseUpdates = false
					UnitFrameManaBar_Update(GameTooltipManaBar,GameTooltipManaBar.unit)
				end
			end
		end
	elseif (GameTooltipManaBar) then
		GameTooltipManaBar:Hide()
		GameTooltipManaBar.pauseUpdates = true
	end
end

--[[	清理目标目标	]]
function zTip:OnGameTooltipHide()
	targetlinenum = nil
	trueNum = nil
	mouseTarget = nil
	mouseTTarget = nil
	zTip.AnchorType = nil
	zTip.timer = nil
	zTip.unit = nil
	zTip.unittarget = nil
	if zTip.icon then zTip.icon:Hide() end
	if zTip.peticon then zTip.peticon:Hide() end
	if zTip.talenticon then zTip.talenticon:Hide() end
		if (GameTooltipManaBar) then
			GameTooltipManaBar:Hide()
			GameTooltipManaBar.pauseUpdates = true
		end
		GameTooltipStatusBar.unit = nil
		GameTooltipStatusBar:Hide()
end


--[[	第一行名字上色 	]]
local DEFCOLOR = { r = 0.5, g = 0.5, b = 1.0 }
function zTip:UnitColor(unit, bdead, tapped, reaction,bbattlepet)
	bdead = bdead or UnitHealth(unit) <= 0 and (not bplayer or UnitIsDeadOrGhost(unit))
	tapped = tapped or UnitIsTapDenied(unit)
	reaction = reaction or UnitReaction(unit, "player")
	local ISPLAYER = UnitIsPlayer(unit)
	if tapped or bdead then
		r = 0.55;g = 0.55;b = 0.55
	elseif bbattlepet then
		r,g,b = 0.8,0.5,0.8
	elseif ISPLAYER or UnitPlayerControlled(unit) then
		if ( UnitCanAttack(unit, "player") ) then
			if ( not UnitCanAttack("player", unit) ) then
				--purple, caution, only they can attack
				r = 1.0;g = 0.4;b = 1.0
			else
				-- Hostile players are red
				r = 1.0;g = 0.0;b = 0.0
			end
		elseif ( UnitCanAttack("player", unit) ) then
			-- Players we can attack but which are not hostile are yellow
			r = 1.0;g = 1.0;b = 0.0
		-- elseif (UnitIsPVP(unit) and not UnitIsPVPSanctuary(unit) and not UnitIsPVPSanctuary("player")) then
			-- -- Players we can assist but are PvP flagged are green
			-- r = 0.0;g = 1.0;b = 0.0
		else

			local color = ISPLAYER and RAID_CLASS_COLORS[select(2,UnitClass(unit))] or DEFCOLOR
			r, g, b = color.r, color.g, color.b
		end

	elseif reaction then
		-- mob/npc
		if reaction < 4 then -- harm
			r,g,b = 1,0.3,0.22
		elseif reaction > 4 then -- friendly
			r,g,b = 0,1,0
		else -- nature
			r,g,b = 1,1,0
		end
	else -- normal
		r,g,b = 1,1,1
	end
	return r,g,b
end

--[[	修改tip整体格式 ]]
local tip
function zTip:OnMouseOverUnit(name,unit)
	if not unit then return;end
	-- hack to fix problems
	if unit == "npc" then unit = "mouseover" end
--[[
	local values and initials
--]]
	bplayer = UnitIsPlayer(unit)
	name = name or UnitName(unit)
	guid = UnitGUID(unit)
	--~ 是否是战宠
	bbattlepet = (UnitIsWildBattlePet(unit) or UnitIsBattlePetCompanion(unit))
	--~ 尸体，排除猎人假死
	bdead = UnitHealth(unit) <= 0 and (not bplayer or UnitIsDeadOrGhost(unit))
	tapped = UnitIsTapDenied(unit)

	-- 1 憎恨 2 敌对 3 冷淡 4 中立 5 友好 6 尊敬 7 崇敬/崇拜
	reaction = UnitReaction(unit, "player")

	local OldName=_G[GameTooltip:GetName().."TextLeft1"]:GetText()
--[[
	New Way
--]]
	tip, text, levelline, foundpvp, foundfact, tmp, tmp2 = nil
	local pvplinenum,factlinenum=nil
	--[[ Serch and Delete ]]
	trueNum = GameTooltip:NumLines()
	lastlinenum = trueNum
	for i = 2, trueNum do
		text = _G[GameTooltip:GetName().."TextLeft"..i]
		tip = text:GetText()
		if tip then
			--~ 查找等级行
			if not levelline and (strfind(tip, LEVEL) or strfind(tip,"Pet Level")) then
				levelline = i
			-- 删除阵营字符
			elseif not zTipSaves.ShowFaction and (tip == FACTION_ALLIANCE or tip == FACTION_HORDE) then
				text:SetText()
				foundfact = true
				factlinenum = i
--~ 				_G["GameTooltipTextLeft"..i]:Hide()
				lastlinenum = lastlinenum - 1
			-- 删除PVP字符
			elseif tip == PVP then
				text:SetText()
				pvplinenum = i
				lastlinenum = lastlinenum - 1
			-- 能否驯服
			elseif tip == TAMEABLE then
				text:SetText( format("|cff00FF00%s|r", tip) )
			elseif tip == NOT_TAMEABLE then
				text:SetText( format("|cffFF6035%s|r", tip) )
			end
		end
	end
	-- insert target line
	if zTipSaves.TargetOfMouse then
		if lastlinenum >= GameTooltip:NumLines() then
			GameTooltip:AddLine("zTip -- target line")
			targetlinenum = GameTooltip:NumLines()
		else
			targetlinenum = lastlinenum + 1
		end
		lastlinenum = targetlinenum
		text = _G["GameTooltipTextLeft"..targetlinenum]
		if text then
			text:SetText()
		else
			targetlinenum = nil
		end
	end

	if UnitLevel(unit) > 9 and CanInspect(unit) then
		currentID, currentGUID = unit, UnitGUID(unit)
		ScanUnit(unit)
	end

	-- Add "Targeted By" line
	if zTipSaves.TargetedBy then
		local num= GetNumGroupMembers()
		if (num > 0) then
			local players, counter = "", 0
			for i = 1,num do
				local unit1 = (UnitName("raid"..i) and "raid"..i or "party"..i)
				if (UnitIsUnit(unit1.."target",unit)) and (not UnitIsUnit(unit1,"player")) then
					if (mod(counter + 3,6) == 0) then
						players = players.."\n"
					end
					local color = RAID_CLASS_COLORS[select(2,UnitClass(unit1))]
					players = ("%s|cff%.2x%.2x%.2x%s|r, "):format(players,color.r*255,color.g*255,color.b*255,UnitName(unit1))
					counter = (counter + 1)
				end
			end
			if (players ~= "") then
--~ 	--------------------------------------------
				if lastlinenum >= GameTooltip:NumLines() then
					GameTooltip:AddLine("zTip -- targetedby line")
					lastlinenum = GameTooltip:NumLines()
				else
					if zTipSaves.ShowTalent then
						lastlinenum = lastlinenum + 1
					end
					if zTipSaves.ItemLevel then
						lastlinenum = lastlinenum + 1
					end
				end
				text = _G["GameTooltipTextLeft"..lastlinenum]
				if text then
					text:SetText(zTip.locStr.TargetedBy.." (|cffffffff"..counter.."|r): "..players:sub(1,-5))

				else
--~ 					lastlinenum = nil
				end
			end
		end
	end

	--[[ 等级行涂改 ]]
	if levelline then
		-- 表示 等级,尸体(如果死亡)
		if bbattlepet then
			tmp=UnitBattlePetLevel(unit)
			tmp2=format(TOOLTIP_WILDBATTLEPET_LEVEL_CLASS,"","")
		else
			tmp=UnitLevel(unit)
			tmp2 = ""
		end

		if bdead then
			if tmp > 0 then
				tmp2 = format("|cff888888%d %s|r", tmp, CORPSE)
			else
				tmp2 = format("|cff888888?? %s|r", CORPSE)
			end
		elseif ( tmp > 0 ) then
			-- Color level number
			if UnitCanAttack("player", unit) or UnitCanAttack(unit, "player") then
				tmp2 = format("|cff%s%d|r", zTip:GetDifficultyColor(tmp), tmp)
			else
				-- normal color
				tmp2 = format("%s|cff3377CC%d|r",tmp2,tmp)
			end
		else
			-- Target is too high level to tell
			tmp2 = "|cffFF0000 ??|r"
		end

		-- 种族, 职业/ creature type/ creature family(pet)
		unitrace = UnitRace(unit)
		unitCreatureType = UnitCreatureType(unit)
		if unitrace and bplayer then
			--race, it is a player
			if UnitFactionGroup(unit) == UnitFactionGroup("player") then
				tmp = "00FF33"
			else
				tmp = "FF3300"  -- 敌对阵营种族为暗红
			end
			tmp2 = format("%s |cff%s%s|r", tmp2, tmp, unitrace)
			-- class
			_, tmp = UnitClass(unit)
			local c = RAID_CLASS_COLORS[(tmp or "")]
			-- if(c) then
				-- GameTooltip:SetBackdropBorderColor(c.r,c.g,c.b)
			-- end
			tmp = zTip:GetHexColor(c)
			tmp2 = format("%s |cff%s%s|r ", tmp2, tmp, _)
		elseif UnitPlayerControlled(unit) or bbattlepet then
			--creature family, its is a pet
			if bbattlepet then --判断是否是战斗宠物
				-- petType
				local petType=UnitBattlePetType(unit)
				tmp=_G["BATTLE_PET_NAME_"..petType]
				tmp2 = format("%s %s ",tmp2,tmp or "")
			else
				tmp2 = format("%s %s ",tmp2,(UnitCreatureFamily(unit) or unitCreatureType or "") )
			end
		elseif unitCreatureType then
			--creature type, it is a mob or npc
			if unitCreatureType == zTip.locStr.NotSpecified then unitCreatureType = zTip.locStr.Specified end	--"未指定"替换为更通顺的"神秘物种"
			tmp2 = format("%s |cffFFFFFF%s|r", tmp2, unitCreatureType)
			if zTipSaves.NPCClass then
				local SYSCType,SYSCID = select(2,UnitClass(unit))
				tmp2 = format("%s |cff%s%s|r ", tmp2, zTip:GetHexColor(RAID_CLASS_COLORS[SYSCType]), GetClassInfoByID(SYSCID))
			end
			if zTipSaves.DisplayFaction and reaction and reaction > 0 then
				tmp2 = format("%s %s ", tmp2, zTip:GetUnitFaction(unit,reaction))
			end
		else
			tmp2 = format("%s %s ",tmp2,UKNOWNBEING)
		end
		tip = tmp2

		-- special info
		tmp = nil
		tmp2 = ""
		if bplayer then
			if zTipSaves.ShowIsPlayer then
				tmp2 = format("(%s)",PLAYER)
			end
		elseif not UnitPlayerControlled(unit) then
			tmp = UnitClassification(unit) -- Elite status
			--if tmp and tmp ~= "normal" and UnitHealth(unit) > 0 then
			if tmp and tmp ~= "normal" then
				if tmp == "elite" then
					tmp2 = format("|cffFFFF33(%s)|r", ELITE)
				elseif tmp == "worldboss" then
					tmp2 = format("|cffFF0000(%s)|r", BOSS)
				elseif tmp == "rare" then
					tmp2 = format("|cffFF66FF(%s)|r", zTip.locStr.Rare)
				elseif tmp == "rareelite" then
					tmp2 = format("|cffFFAAFF(%s%s)|r", zTip.locStr.Rare, ELITE)
				else
					tmp2 = format("(%s)", tmp) -- unknown type
				end
			end
		end
		_G["GameTooltipTextLeft"..levelline]:SetText( format("%s%s",tip,tmp2) )
	end

	--[[ First Line, rewrite name ]]
	if bplayer or bbattlepet then
		-- 军衔
		tip = ""
		if not zTipSaves.DisplayPvPRank then
			GameTooltipTextLeft1:SetText( format("%s%s", tip, name ) )
		else
			GameTooltipTextLeft1:SetText( format("%s%s", tip, (UnitPVPName(unit) or name) ) )
		end
	end

	--[[ Second Line, Rewrite / Insert guild and/or realm name ]]
	tip = nil
	guild, guildrank, guildid = GetGuildInfo(unit)
	if bplayer then
		-- 工会
		if guild then
			tip = "<"..guild.."> "..(zTipSaves.GuildInfo and (guildrank.."("..guildid..")") or "")
		end
		-- 服务器
		_, tmp = UnitName(unit)
		if zTipSaves.PlayerServer and (tmp and tmp~="" or tip) then
			if tmp and tip then
				tmp2 = " @ "
			else
				tmp2 = ""
			end
			tip = format("%s|cff00EEEE%s%s|r", tip or "", tmp2, tmp or "")
		end
		if tip then
			if guild then
				GameTooltipTextLeft2:SetText(tip)
			else
				GameTooltipTextLeft1:SetText(GameTooltipTextLeft1:GetText().." - "..tmp)
			end
		end
	end

	-- classicon
	local cicon = ""
	if zTipSaves.ClassIcon then
		if bbattlepet then
			local petType=UnitBattlePetType(unit)
			cicon = "|TInterface\\Icons\\Pet_TYPE_"..PET_TYPE_SUFFIX[petType]..":12:12:0:0:10:10:0:10:0:10|t "
		elseif unitrace and bplayer then
			local cls = select(2,UnitClass(unit))
			cicon = zTip:GetClassIconForText(cls)
		end
	end


	--[[ Colors ]]

--~ 第一行名字上色，并调整第一行
	r,g,b = zTip:UnitColor(unit, bdead, tapped, reaction,bbattlepet)
	if bbattlepet then
		GameTooltipTextLeft1:SetText(cicon..OldName)
	else
		GameTooltipTextLeft1:SetText(cicon..format("|cff%2x%2x%2x",r*255,g*255,b*255)..GameTooltipTextLeft1:GetText().."|r")
	end


--~ 给第二行上色
	if tip or (levelline and levelline > 2) then
		if bdead or tapped then -- 尸体或已被攻击
			GameTooltipTextLeft2:SetTextColor(0.55,0.55,0.55)
		elseif bbattlepet then
			if levelline~=3 then
				GameTooltipTextLeft1:SetTextColor(pet_r,pet_g,pet_b)----宠物修改名颜色
				GameTooltipTextLeft2:SetTextColor(r,g,b)
			end
		else
			GameTooltipTextLeft2:SetTextColor(r*zTip.GuildColorAlpha,g*zTip.GuildColorAlpha,b*zTip.GuildColorAlpha)
		end
	end
--~ 标记本工会为亮色
--	if bplayer and guild == GetGuildInfo("player") then
--		GameTooltipTextLeft2:SetTextColor(0.9, 0.5, 0.9)
--	end
	if bplayer and guild then
		if guild == GetGuildInfo("player") then
			GameTooltipTextLeft2:SetTextColor(0.9, 0.5, 0.9)
		else
			GameTooltipTextLeft2:SetTextColor(1.0, 1.0, 1.0)
		end
	end

--[[
	done
--]]
 	for el = GameTooltip:NumLines(),1,-1 do
 		if not _G["GameTooltipTextLeft"..el]:GetText() then
 			_G["GameTooltipTextLeft"..el]:Hide()
		else
			break
 		end
 	end
	return unit
end

--[[	Slash Command	]]
function zTip:Slash(msg)
	local param1 = string.lower(msg)
	if (param1 == "cc") then		--/ztip cc清空天赋缓存
		wipe(inspectDB)
		collectgarbage("collect")
		inspectDB = {GearDB = {}, SpecDB = {}}
		DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r "..zTip.locStr.ResetCache, 1,1,0)
	elseif (param1 == "ct") then
		if (UnitIsPlayer("target")) then
			local name = UnitName("target")
			local guid = UnitGUID("target")
			if inspectDB[SpecDB][guid] then
				inspectDB[SpecDB][guid] = nil
				DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r |cff"..zTip:GetHexColor(RAID_CLASS_COLORS[select(2,UnitClass("target"))])..name.."|r 的天赋缓存已被清空");
			else
				DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r 未找到 |cff"..zTip:GetHexColor(RAID_CLASS_COLORS[select(2,UnitClass("target"))])..name.."|r 的天赋缓存");
			end
		else
			DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r 没有目标或目标不是玩家");
		end
	elseif (param1 == "pp") then
		local n=0
		for k,v in pairs(inspectDB) do
			n=n+1;
		end
		DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r inspectDB="..n);
	else
		collectgarbage("collect")
		UpdateAddOnMemoryUsage()
		DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r Toggle Option Window", 1,1,0)
		DEFAULT_CHAT_FRAME:AddMessage("|cff00FFFFzTip:|r "..format("%.2f",GetAddOnMemoryUsage("zTip")).." KB", 1,1,0)
		if not zTipOption then return end
		if not zTipOption.ready then zTipOption:Init() end
		if not zTipOption:IsShown() then zTipOption:Show() end
	end
end
