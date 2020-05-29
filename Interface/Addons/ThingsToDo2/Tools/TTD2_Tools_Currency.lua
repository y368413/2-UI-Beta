ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
currency collection
]]

local super = Templates.Collection
Tools.Currency = super:new()
local this = Tools.Currency

function this:UpdateByID(ID)

	local Currency = self:GetByID(ID)
	
	local CurrencyInfo = { GetCurrencyInfo(ID) }
	if(CurrencyInfo == nil or CurrencyInfo[1] == nil) then
		Tools.Chat:Error("failed to get info on currency: "..ID)
	end
	
	Currency.Name		= CurrencyInfo[1]
    Currency.Amount		= CurrencyInfo[2]
    Currency.TotalMax	= CurrencyInfo[6]
	Currency.Link		= GetCurrencyLink(ID, CurrencyInfo[2])
	
	if(Currency.Link == nil) then
		Tools.Chat:Error("failed to create link for currency: "..ID)
	end
	
	return
end
