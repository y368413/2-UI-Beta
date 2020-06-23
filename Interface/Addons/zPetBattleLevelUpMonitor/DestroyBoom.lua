-- To use random hearthstone toys gathered through world events.
local frame = CreateFrame("Frame")
frame:RegisterEvent("BAG_UPDATE")
frame:SetScript("OnEvent", function(self, event)
	if event == "BAG_UPDATE" then
	for bag = 0,4 do
		for slot = 1, 32 do
			if (GetContainerItemID(bag,slot) == 169632) or (GetContainerItemID(bag,slot) == 169637) then
				PickupContainerItem(bag,slot)
				DeleteCursorItem()
			end
		end
	end
	end
end)
