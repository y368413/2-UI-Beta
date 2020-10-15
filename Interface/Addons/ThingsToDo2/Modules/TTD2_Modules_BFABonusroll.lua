ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Modules = TTD2.Modules or {}
local Modules = TTD2.Modules

--[[

]]

local super = Templates.UIButtonChatModule
Modules.BFABonusRoll = super:new()
local this = Modules.BFABonusRoll

this.Name = "[BFA] Bonus-Roll"

function this:Initialise()
	
	self.QuestIDs =
	{
		["WR"] = { [1] = 52837, [2] = 52840 },
		["Gold"] = { [1] = 52834, [2] = 52838 },
		["PvP"] = { [1] = 52835, [2] = 52839 }
	}

	self.Currency =
	{
		ID			= 1580, --BFA bonusroll currency
		WeeklyMax	= 2,
		WRID		= 1560
	}
	
	for _,CurrencyQuests in pairs(self.QuestIDs) do
		for _,QuestID in pairs(CurrencyQuests) do
			TTD2.Tools.Quest:AddByID(QuestID)
		end
	end
	
	TTD2.Tools.Currency:AddByID(self.Currency.ID)
	TTD2.Tools.Currency:AddByID(self.Currency.WRID)
	
	return
end

function this:CreateOutput()
	self:Init()
	
	for _,CurrencyQuests in pairs(self.QuestIDs) do
		for _,QuestID in pairs(CurrencyQuests) do
			TTD2.Tools.Quest:UpdateByID(QuestID)
		end
	end
	
	TTD2.Tools.Currency:UpdateByID(self.Currency.ID)
	TTD2.Tools.Currency:UpdateByID(self.Currency.WRID)
	
	local Out = TTD2.Tools.Output
	
	--cannot trade bonus rolls before 120
	if(TTD2.Tools.Unit:GetPlayerLevel() < 120) then
		return
	end
	
	local CurrencyInfo = TTD2.Tools.Currency:GetByID(self.Currency.ID)
	local Traded = 0
	for _,CurrencyQuests in pairs(self.QuestIDs) do
		for _,QuestID in pairs(CurrencyQuests) do
			if(TTD2.Tools.Quest:GetByID(QuestID).IsCompleted == true) then
				Traded = Traded + 1
			end
		end
	end
	
	local Text = CurrencyInfo.Link
	local ColorFunc = TTD2.Tools.Chat.Yellow
	if(Traded == self.Currency.WeeklyMax) then
		ColorFunc = TTD2.Tools.Chat.Green
	end
	Text = Text..ColorFunc(TTD2.Tools.Chat, "("..Traded.."/"..self.Currency.WeeklyMax..")")
	
	if(Traded == self.Currency.WeeklyMax) then
		Out:AddLine(Out.Status.Completed, Text)
	elseif(CurrencyInfo.Amount == CurrencyInfo.TotalMax) then
		Out:AddLine(Out.Status.Done, Text)
	elseif(TTD2.Tools.SavedData:GetCharacterSetting("ResourcefulBonusRoll") == true) then
		local WRQInfo250 = TTD2.Tools.Quest:GetByID(self.QuestIDs["WR"][1])
		local WRQInfo500 = TTD2.Tools.Quest:GetByID(self.QuestIDs["WR"][2])
		local WRInfo = TTD2.Tools.Currency:GetByID(self.Currency.WRID)
		if((WRQInfo250.IsCompleted == false) and (WRInfo.Amount >= 500)) then
			local QuestLine = Out:AddLine(Out.Status.ToDo, WRQInfo250.Link)
			Out:AddLine(Out.Status.ToDo, Text, QuestLine)
		elseif((WRQInfo500.IsCompleted == false) and (WRInfo.Amount >= 1000)) then
			local QuestLine = Out:AddLine(Out.Status.ToDo, WRQInfo500.Link)
			Out:AddLine(Out.Status.ToDo, Text, QuestLine)
		else
			local WRLine = Out:AddLine(Out.Status.Done, WRInfo.Link)
			Out:AddLine(Out.Status.ToDo, Text, WRLine)
		end
	else
		Out:AddLine(Out.Status.ToDo, Text)
	end
end
