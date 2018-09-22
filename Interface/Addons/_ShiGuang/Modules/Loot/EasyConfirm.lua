
--------------------------------------------------------------------------------
--- Author: SirMarklan  ## SavedVariables: EasyConfirmProfile ## Version: 8.0.1.1  -- Shift + Alt + C to confirm/ok/yes a PopUp Message
--------------------------------------------------------------------------------

function EasyConfirm()
	StaticPopup1Button1:Click()
	StaticPopup2Button1:Click()
	StaticPopup3Button1:Click()
	StaticPopup4Button1:Click()
	QuestFrameAcceptButton:Click()
	QuestFrameCompleteQuestButton:Click()
	QuestFrameCompleteButton:Click()
	LFGDungeonReadyDialogEnterDungeonButton:Click()
	GossipFrameGreetingGoodbyeButton:Click()
	--PVPReadyDialogEnterBattleButton:Click()
end

local BtnEasyConfirm = CreateFrame("Button", 'BtnEasyConfirm', nil)
BtnEasyConfirm:RegisterForClicks("AnyDown")
BtnEasyConfirm:SetScript("OnEvent", function() SetBindingClick("SHIFT-ALT-C", BtnEasyConfirm:GetName()) end)
BtnEasyConfirm:RegisterEvent("PLAYER_LOGIN")
BtnEasyConfirm:SetScript("OnClick", function() EasyConfirm() end)

