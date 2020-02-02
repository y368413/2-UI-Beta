local NoItsNot = CreateFrame("Frame")
NoItsNot:RegisterEvent("ADDON_LOADED")
NoItsNot:SetScript("OnEvent", function(_, event)
	if event == "ADDON_LOADED" then
	  NoItsNot:UnregisterEvent("ADDON_LOADED")
		function TalentMicroButtonAlert:Show()
			TalentMicroButtonAlert:Hide();
		end
		TalentMicroButtonAlert:Hide();
		--function CharacterMicroButtonAlert:Show()
			--CharacterMicroButtonAlert:Hide();
		--end
		--CharacterMicroButtonAlert:Hide();
		--function CollectionsMicroButtonAlert:Show()
			--CollectionsMicroButtonAlert:Hide();
		--end
		--CollectionsMicroButtonAlert:Hide();
	end
end)