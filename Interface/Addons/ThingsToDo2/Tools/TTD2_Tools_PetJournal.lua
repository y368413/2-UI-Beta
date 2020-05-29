ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
interface to the pet-journal API
]]

local super = Templates.Collection
Tools.PetJournal = super:new()
local this = Tools.PetJournal

function this:UpdateByID(ID)

	local Pet = self:GetByID(ID)
	
	--one time information
	if(Pet.Name == nil) then
		local PetInfo	= { C_PetJournal.GetPetInfoBySpeciesID(ID) }
		Pet.Name		= PetInfo[1]
		Pet.IsTradeable	= PetInfo[9]
		
		--getting the source out of the jurnal is a little complex; we only want the creature/container name
		local Start = string.find(PetInfo[5], "|r") --Start is where the color of the Info goes back to normal
		if(Start ~= nil) then
			Start = Start+2
		end
		local End = string.find(PetInfo[5], "|n", Start) --End is the first newline in the Info; if the Info only has one line End will be nil and that is valid
		if(End ~= nil) then
			End = End-1
		end
		if(Start == nil) then
			Tools.Chat:Error("could not find delimiter in source for PetID: "..ID)
		else
			Pet.Source	= string.sub(PetInfo[5], Start, End)
		end
	end
	
	--now the information that can change and therefore must always be updated
	local NumCollected	= { C_PetJournal.GetNumCollectedInfo(ID) }
	Pet.NumCollected	= NumCollected[1]
	Pet.NumLimit		= NumCollected[2]
	
	--the IsCollected status depends on options!
	if(	(Pet.NumCollected == 0) or
		((Tools.SavedData:GetCharacterSetting("GoldenCages") == true) and (Pet.IsTradeable == true)) or
		((Tools.SavedData:GetCharacterSetting("PetCompletionist") == true) and (Pet.NumCollected < Pet.NumLimit)) ) then
		Pet.IsCollected = false
	else
		Pet.IsCollected = true
	end
end
