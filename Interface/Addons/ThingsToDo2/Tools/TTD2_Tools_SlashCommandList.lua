if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

if(TTD2.Tools == nil) then
	TTD2.Tools = {}
end
local Tools = TTD2.Tools

Tools.SlashCommandList = {}
local this = Tools.SlashCommandList

--[[
]]

this.private = {}
function this:Register()
	this.private.GlobalAddonSlashPrefix = "THINGSTODOTWO"
	this.private.Commands =
	{
		"/ttd2",
		"/thingstodo2"
	}

	for k, Command in ipairs(self.private.Commands) do
		local NewCommand = "SLASH_"..self.private.GlobalAddonSlashPrefix..k
		if(_G[NewCommand] ~= nil) then
			Tools.Chat.Error("Trying to use a slash command that is already in use!")
			return
		end
		
		_G[NewCommand] = Command
	end
	
	if(SlashCmdList[self.private.GlobalAddonSlashPrefix] ~= nil) then
		Tools.Chat.Error("Trying to register slash prefix already in use!")
		return
	end
	
	SlashCmdList[self.private.GlobalAddonSlashPrefix] = self.private.SlashCommand
	
	return
end

function this.private.SlashCommand(Msg, EditBox)
	local LowerCaseMessage = string.lower(Msg)
	if((LowerCaseMessage == "resetpos") or (LowerCaseMessage == "resetposition")) then
		TTD2.Frames.Main:ResetPosition()
		TTD2.Frames.Options:ResetPosition()
	elseif(LowerCaseMessage == "clearaccdata") then
		Tools.SavedData:ClearAccountCharacterTable()
	else
		TTD2.Frames.Main:Toggle()
	end
	
	return
end
