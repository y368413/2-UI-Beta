------------------------------------------------------------ImprovedLootFrame
local LovelyLootLoaded = IsAddOnLoaded("LovelyLoot") 
local ISMOP = select(4, GetBuildInfo()) >= 50000 

   LOOTFRAME_AUTOLOOT_DELAY = 0.5; 
   LOOTFRAME_AUTOLOOT_RATE = 0.1; 

if not LovelyLootLoaded then 

   -- Woah, nice coding, blizz. 
   -- Anchor something positioned at the top of the frame to the center of the frame instead, 
   -- and make it an anonymous font string so I have to work to find it 
   local i, t = 1, "Interface\\LootFrame\\UI-LootPanel" 

   while true do 
      local r = select(i, LootFrame:GetRegions()) 
      if not r then break end 
      if r.GetText and r:GetText() == ITEMS then 
         r:ClearAllPoints() 
         r:SetPoint("TOP", ISMOP and 12 or -12, ISMOP and -5 or -19.5) 
      elseif not ISMOP and r.GetTexture and r:GetTexture() == t then 
         r:Hide() 
      end 
      i = i + 1 
   end 

   if not ISMOP then 
      local top = LootFrame:CreateTexture("LootFrameBackdropTop") 
      top:SetTexture(t) 
      top:SetTexCoord(0, 1, 0, 0.3046875) 
      top:SetPoint("TOP") 
      top:SetHeight(78) 

      local bottom = LootFrame:CreateTexture("LootFrameBackdropBottom") 
      bottom:SetTexture(t) 
      bottom:SetTexCoord(0, 1, 0.9296875, 1) 
      bottom:SetPoint("BOTTOM") 
      bottom:SetHeight(18) 

      local mid = LootFrame:CreateTexture("LootFrameBackdropMiddle") 
      mid:SetTexture(t) 
      mid:SetTexCoord(0, 1, 0.3046875, 0.9296875) 
      mid:SetPoint("TOP", top, "BOTTOM") 
      mid:SetPoint("BOTTOM", bottom, "TOP") 
   end 
end 

-- Calculate base height of the loot frame 
local p, r, x, y = "TOP", "BOTTOM", 0, -4 
local buttonHeight = LootButton1:GetHeight() + abs(y) 
local baseHeight = LootFrame:GetHeight() - (buttonHeight * LOOTFRAME_NUMBUTTONS) 
if ISMOP and not LovelyLootLoaded then 
   baseHeight = baseHeight - 5 
end 

LootFrame.OverflowText = LootFrame:CreateFontString(nil, "OVERLAY", "GameFontRedSmall") 
local OverflowText = LootFrame.OverflowText 

OverflowText:SetPoint("TOP", LootFrame, "TOP", 0, -26) 
OverflowText:SetPoint("LEFT", LootFrame, "LEFT", 60, 0) 
OverflowText:SetPoint("RIGHT", LootFrame, "RIGHT", -8, 0) 
OverflowText:SetPoint("BOTTOM", LootFrame, "TOP", 0, -65) 

if LovelyLootLoaded then 
   OverflowText:SetPoint("LEFT", LootFrame, "RIGHT", 10, 0) 
   OverflowText:SetPoint("RIGHT", LootFrame, "RIGHT", -10 + LootFrame:GetWidth(), 0) 
end 

OverflowText:SetSize(1, 1) 

OverflowText:SetJustifyH("LEFT") 
OverflowText:SetJustifyV("TOP") 

OverflowText:SetText("Hit 50-mob limit! Take some, then re-loot for more.") 

OverflowText:Hide() 

local t = {} 
local function CalculateNumMobsLooted() 
   wipe(t) 

   for i = 1, GetNumLootItems() do 
      for n = 1, select("#", GetLootSourceInfo(i)), 2 do 
         local GUID, num = select(n, GetLootSourceInfo(i)) 
         t[GUID] = true 
      end 
   end 

   local n = 0 
   for k, v in pairs(t) do 
      n = n + 1 
   end 

   return n 
end 


local old_LootFrame_Show = LootFrame_Show 
function LootFrame_Show(self, ...) 
   local maxButtons = floor(UIParent:GetHeight()/LootButton1:GetHeight() * 0.7) 
   
   local num = GetNumLootItems() 
 
      if self.AutoLootTable then 
         num = #self.AutoLootTable 
      end 

      self.AutoLootDelay = 0.4 + (num * 0.05) 

   num = min(num, maxButtons) 

   LootFrame:SetHeight(baseHeight + (num * buttonHeight)) 
   for i = 1, num do 
      if i > LOOTFRAME_NUMBUTTONS then 
         local button = _G["LootButton"..i] 
         if not button then 
            button = CreateFrame("Button", "LootButton"..i, LootFrame, "LootButtonTemplate", i) 
         end 
         LOOTFRAME_NUMBUTTONS = i 
      end 
      if i > 1 then 
         local button = _G["LootButton"..i] 
         button:ClearAllPoints() 
         button:SetPoint(p, "LootButton"..(i-1), r, x, y) 
      end 
   end 

   if CalculateNumMobsLooted() >= 50 then 
      OverflowText:Show() 
   else 
      OverflowText:Hide() 
   end 

   
   return old_LootFrame_Show(self, ...) 
end

------------------------------------------------------------simplelootannouncer
local t = 1
local loottemp = {}
local sockets = {3, 497, 523, 563, 564, 565, 572} --564 only?
local warforged = {44, 448, 499, 546, 547, 560, 561, 562, 571} -- only 561 and 754-766?
--titanforged 1372-1672

local function Announce()
local masterlooterRaidID = select(3, GetLootMethod())
if (masterlooterRaidID ~= nil and UnitName("raid"..masterlooterRaidID) == UnitName("player")) or IsLeftControlKeyDown() then
local n = 0
local check = false
local loot = GetLootInfo()

for i = 1, GetNumLootItems() do
	if GetLootSlotType(i) == 1 then
		for j = 1, t do
			if GetLootSourceInfo(i) == loottemp[j] then 
				check = true
			break
			end
		end
	end
end


if check == false or IsLeftControlKeyDown() then

t = GetNumLootItems()
for i = 1, t do
	loot[i]["check"] = 0
	if GetLootSlotType(i) == 1 and loot[i]["quality"] >= 4 and not (bit.band(GetItemFamily(loot[i]["item"] or '') or 0, 0x0040) > 0) then
		local link = GetLootSlotLink(i)
		local ilvl = select(4, GetItemInfo(link))
		loot[i]["upgrade"] = ""
		local itemstring = string.match(link, "item[%-?%d:]+")
		local numbonuses = select(14, strsplit(":", itemstring))
		numbonuses = tonumber(numbonuses) or 0
		local bonus = {}
		for j = 1, numbonuses do
			bonus[j] = select(14 + j, strsplit(":", itemstring))
			bonus[j] = tonumber(bonus[j])
			for k = 1, #warforged do														--Warforged
				if bonus[j] == warforged[k] then
					loot[i]["upgrade"] = loot[i]["upgrade"]..":"..ilvl
				end
			end
			if 766 >= bonus[j] and bonus[j] >= 754 then														--Warforged
					loot[i]["upgrade"] = loot[i]["upgrade"]..":"..ilvl
			end												
			if 1672 >= bonus[j] and bonus[j] >= 1372 then													--Titanforged
					loot[i]["upgrade"] = loot[i]["upgrade"]..":"..ilvl
			end
			for k = 1, #sockets do															--Socket
				if bonus[j] == sockets[k] then
					loot[i]["upgrade"] = loot[i]["upgrade"].."<-插槽呦~"
				end
			end
			if bonus[j] == 40 then loot[i]["upgrade"] = loot[i]["upgrade"].." +"..STAT_AVOIDANCE end						--Avoidance
			if bonus[j] == 41 then loot[i]["upgrade"] = loot[i]["upgrade"].." +"..STAT_LIFESTEAL end						--Leech
			if bonus[j] == 42 then loot[i]["upgrade"] = loot[i]["upgrade"].." +"..STAT_SPEED end							--Speed
			if bonus[j] == 43 then loot[i]["upgrade"] = loot[i]["upgrade"].." +"..STAT_STURDINESS end						--Indestructible
		end
		loot[i]["check"] = 1
		for k = 1, i-1 do
			if loot[k]["item"] == loot[i]["item"] and loot[k]["upgrade"] == loot[i]["upgrade"] then
				loot[i]["check"] = 0
				loot[k]["quantity"] = loot[i]["quantity"] + loot[k]["quantity"]
			end
		end
	end
end

for i = 1, t do
	loot[i]["item"] = GetLootSlotLink(i)
	if loot[i]["check"] == 1 then
		n = n + 1
		if loot[i]["quantity"] == 1 then
			SendChatMessage(n..". "..loot[i]["item"]..loot[i]["upgrade"], "RAID")
		else
			SendChatMessage(n..". "..loot[i]["item"].."x"..loot[i]["quantity"].."  "..loot[i]["upgrade"], "RAID")
		end
	end
end

end

for i = 1, t do
	loottemp[i] = GetLootSourceInfo(i)
end

end
end

local SimpleLootAnnouncer = CreateFrame("Frame")
SimpleLootAnnouncer:RegisterEvent("LOOT_OPENED")
SimpleLootAnnouncer:SetScript("OnEvent", function(self, event)
	Announce()
end)

-------LootAnnouncerbutton----------------
local LootAnnouncerbutton = CreateFrame("Button","LootAnnouncerbutton",LootFrame,"UIPanelButtonTemplate")
LootAnnouncerbutton:RegisterEvent("LOOT_OPENED")
LootAnnouncerbutton:SetPoint('TOPRIGHT', -3, -21)
LootAnnouncerbutton:SetWidth(110)
LootAnnouncerbutton:SetHeight(21)
LootAnnouncerbutton:SetText("团队通报拾取")
LootAnnouncerbutton:SetScript("OnClick", function() Announce() end)