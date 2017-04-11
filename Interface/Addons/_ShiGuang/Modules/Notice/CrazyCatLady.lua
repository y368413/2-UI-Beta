local CrazyCatLady = CreateFrame("Frame") 
CrazyCatLady:RegisterEvent("UNIT_AURA") 
CrazyCatLady:RegisterEvent("PLAYER_DEAD")
CrazyCatLady:RegisterEvent("PLAYER_UNGHOST")

CrazyCatLady:SetScript("OnEvent", function(self, event, ...) 
  if not MaoRUISettingDB["Misc"]["CrazyCatLady"] then self:UnregisterAllEvents() return end
	if event == "PLAYER_DEAD" then
		PlaySoundFile("Sound/creature/Auriaya/UR_Auriaya_Death01.ogg", "Master")
	elseif event == "PLAYER_UNGHOST" then
		StopMusic()
	end
end)