------------------------------------------------------------ImprovedLootFrame
local wow_classic = WOW_PROJECT_ID and WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
	--LOOTFRAME_AUTOLOOT_DELAY = 0.5;
	--LOOTFRAME_AUTOLOOT_RATE = 0.1;
	
	-- Woah, nice coding, blizz.
	-- Anchor something positioned at the top of the frame to the center of the frame instead,
	-- and make it an anonymous font string so I have to work to find it
	local i = 1

	while true do
		local r = select(i, LootFrame:GetRegions())
		if not r then break end
		if r.GetText and r:GetText() == ITEMS then
			r:ClearAllPoints()
			r:SetPoint("TOP", 12, -5)
		end
		i = i + 1
-------BGRoll----------------##Author: NOGARUKA  ##Version: 2
local NeedList = {
[18231] = true,
[71951] = true,
[71952] = true,
[71953] = true,
}
local BGRoll = CreateFrame("Frame")
BGRoll:RegisterEvent("START_LOOT_ROLL")
BGRoll:RegisterEvent("CONFIRM_LOOT_ROLL")
BGRoll:SetScript("OnEvent", function(self, event, id, rt)
if event == 'START_LOOT_ROLL' then
	local _, Name, _, _, _, Need, Greed, _ = GetLootRollItemInfo(id)
	local Link = GetLootRollItemLink(id)
	local ItemID = tonumber(strmatch(Link, 'item:(%d+)'))
	if NeedList[ItemID] then
		if Need then
			print("→: ", (Name))
			RollOnLoot(id, 1)
		elseif Greed then
			print("→: ", (Name))
			RollOnLoot(id, 2)
		end
	end
end
if event == 'CONFIRM_LOOT_ROLL' then ConfirmLootRoll(id, rt) end
end)