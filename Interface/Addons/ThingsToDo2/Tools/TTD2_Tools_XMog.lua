ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
Transmogrification API
]]

local super = Templates.Base
Tools.XMog = super:new()
local this = Tools.XMog

function this:GetSourceFromItemString(ItemString)
	return (select(2, C_TransmogCollection.GetItemInfo(ItemString)))
end

function this:IsAppearanceCollectedBySource(SourceID)
	
	--debug test
	local SourceInfo = C_TransmogCollection.GetAppearanceInfoBySource(SourceID)
	if(SourceInfo == nil) then
		Tools.Chat:Error("character unable to use appearance of source: "..SourceID.." - "..(select(6, C_TransmogCollection.GetAppearanceSourceInfo(SourceID))))
	end
	
	--we need to consider the XMogCompletionist options here
	if(C_TransmogCollection.GetAppearanceInfoBySource(SourceID).sourceIsCollected == true) then
		--if we have this specific source, it's always true
		return true
	else
		if(C_TransmogCollection.GetAppearanceInfoBySource(SourceID).appearanceIsCollected == true) then
			--check the option
			if(Tools.SavedData:GetCharacterSetting("XMogCompletionist") == true) then
				return false
			else
				return true
			end
		else
			return false
		end
	end
end

function this:GetItemLinkFromSource(SourceID)
	return (select(6, C_TransmogCollection.GetAppearanceSourceInfo(SourceID)))
end
