function PetJournalSafariButtonOnLoad()
    PetJournalSafariButtonFrame:RegisterEvent("ADDON_LOADED");
    function PetJournalSafariButtonFrame:UpdateUsable()
        if (PlayerHasToy(92738)) then
            PetJournalSafariButtonFrame:UnregisterEvent("TOYS_UPDATED");
            PetJournalSafariButton:SetAttribute("type","item");
            PetJournalSafariButton:SetAttribute("item",select(1,GetItemInfo(92738)));
            PetJournalSafariButton.icon:SetVertexColor(1,1,1,1);
            PetJournalSafariButton.icon:SetDesaturated(false);
        end   
    end    
end

function PetJournalSafariButtonOnEvent(self, event, ...)
    if event=="ADDON_LOADED" and select(1,...)=="Blizzard_Collections" then
        PetJournalSafariButtonFrame:UnregisterEvent("ADDON_LOADED");
        PetJournalSafariButtonFrame:RegisterEvent("TOYS_UPDATED");
    elseif (event == "TOYS_UPDATED") then
        PetJournalSafariButtonFrame:UpdateUsable();
        return
    else 
        return
    end    
    PetJournalHealPetButton:SetPoint("CENTER",PetJournal,"TOPRIGHT",-64,-42);
    PetJournalSafariButton = CreateFrame("Button",PetJournalSafariButton,PetJournal,"SecureActionButtonTemplate,ActionButtonTemplate");
    PetJournalSafariButton:SetSize(36,36);
    PetJournalSafariButton:SetPoint("CENTER",PetJournal,"TOPRIGHT",-24,-42);
    
    PetJournalSafariButton.icon:SetTexture("interface\\icons\\inv_helm_cloth_petsafari_a_01");
    PetJournalSafariButton:SetScript("OnEnter",function(self)
            GameTooltip:SetOwner(self,"ANCHOR_RIGHT")
            GameTooltip:SetToyByItemID(92738)
        end)
    PetJournalSafariButton:SetScript("OnLeave",function(self)
            GameTooltip:Hide()
        end)

    PetJournalSafariButton.icon:SetVertexColor(0.5,0.5,0.5, 0.5);
    PetJournalSafariButton.icon:SetDesaturated(true);
    PetJournalSafariButtonFrame:UpdateUsable()    
end


