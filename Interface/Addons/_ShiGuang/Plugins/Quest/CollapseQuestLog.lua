--## Author: Coop ## Version: 01.00
local CollapseQuestLog = CreateFrame("Button", "CollapseButton", QuestScrollFrame, 'UIPanelButtonTemplate')
  CollapseQuestLog:SetSize(24,24)
  CollapseQuestLog:SetPoint("TOPRIGHT",-16,26)
  CollapseQuestLog:SetText("*")
  CollapseQuestLog:RegisterForClicks("LeftButtonUp")
  CollapseQuestLog:SetScript("OnClick", function() CollapseQuestHeader(0) end)
  