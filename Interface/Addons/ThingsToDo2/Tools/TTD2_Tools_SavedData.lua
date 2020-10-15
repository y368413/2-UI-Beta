ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
The purpose of this tool is to handle our SavedVariables. Most importantly to default values not present in SavedVars
and remove deprecated values from SavedVars.

Update:
Added a Version field to AccountData; if the Version of the loaded data is smaller than the current version (or does not exist) all stored AccountData is discarded.
]]

local super = Templates.Base
Tools.SavedData = super:new()
local this = Tools.SavedData

function this:LoadCharacterSetting(Setting, Default)
	if(	(ThingsToDo2_CharacterData						~= nil) and 
		(ThingsToDo2_CharacterData.Settings				~= nil) and 
		(ThingsToDo2_CharacterData.Settings[Setting]	~= nil) ) then
		self.CharacterData.Settings[Setting] = ThingsToDo2_CharacterData.Settings[Setting]
	else
		self.CharacterData.Settings[Setting] = Default
	end
end

function this:LoadCharacterValue(Value, Default)
	if(	(ThingsToDo2_CharacterData						~= nil) and
		(ThingsToDo2_CharacterData.Values				~= nil) and
		(ThingsToDo2_CharacterData.Values[Value]		~= nil) ) then
		self.CharacterData.Values[Value] = ThingsToDo2_CharacterData.Values[Value]
	else
		self.CharacterData.Values[Value] = Default
	end
end

function this:VersionCheck()

	local CurrentVersion = 3

	if(	(ThingsToDo2_AccountData			~= nil) and
		(	(	(ThingsToDo2_AccountData.Version ~= nil) and (ThingsToDo2_AccountData.Version	< CurrentVersion)	) or (ThingsToDo2_AccountData.Version == nil)	)	)  then
		ThingsToDo2_AccountData = nil	--disregard the old data
	end
	
	--use current version for our data
	self.AccountData.Version = CurrentVersion
end

function this:LoadAccountCharacterTable()
	if(	(ThingsToDo2_AccountData			~= nil) and
		(ThingsToDo2_AccountData.Characters ~= nil) ) then
		self.AccountData.Characters = ThingsToDo2_AccountData.Characters
	else
		self.AccountData.Characters = {}
	end
end

function this:LoadAccountValue(Value, Default)
	if(	(ThingsToDo2_AccountData				~= nil) and
		(ThingsToDo2_AccountData.Values			~= nil) and
		(ThingsToDo2_AccountData.Values[Value]	~= nil) ) then
		self.AccountData.Values[Value] = ThingsToDo2_AccountData.Values[Value]
	else
		self.AccountData.Values[Value] = Default
	end
end

function this:LoadFromGlobals()
	--[[
	In this function, we create empty internal mirror-tables of the stored session data and then try and read the session data into them.
	Afterwards we set the session tables to those new mirror tables. We do this to ensure the tables do not get cluttered up with
	deprecated data. We may lose data this way in big updates, but the beneit of keeping the session data file "current" is bigger
	than that.
	]]
	
	--init all the table mirrors in a way that is robust against recalling this function multiple times
	--ThingsToDo2CharacterData
	self.CharacterData				= self.CharacterData				or {} 
	self.CharacterData.Settings		= self.CharacterData.Settings		or {}
	self.CharacterData.Values		= self.CharacterData.Values			or {}
	
	--ThingsToDo2_AccountData
	self.AccountData				= self.AccountData					or {}
	self.AccountData.Values			= self.AccountData.Values			or {}
	self:VersionCheck()
	
	--init all the settings which are reflected by checkboxes in the options frame
	self:LoadCharacterSetting("PrintCompleted", false)
	self:LoadCharacterSetting("PrintDone", false)
	self:LoadCharacterSetting("RareSources", true)
	self:LoadCharacterSetting("VerboseTomTom", false)
	self:LoadCharacterSetting("HideMinimapButton", false)
	self:LoadCharacterSetting("CharacterAchievements", false)
	self:LoadCharacterSetting("ParagonEmissary", true)
	self:LoadCharacterSetting("AchievementCompletionist", false)
	self:LoadCharacterSetting("XMogCompletionist", false)
	self:LoadCharacterSetting("PetCompletionist", false)
	self:LoadCharacterSetting("GoldenCages", false)
	self:LoadCharacterSetting("ArchaeologyAutoWaypoint", false)
	self:LoadCharacterSetting("AllowSecureButtons", true)
	self:LoadCharacterSetting("MPlusFeatHunter", true)
	self:LoadCharacterSetting("ResourcefulBonusRoll", false)
	self:LoadCharacterSetting("MPlusAccount", false)
	self:LoadCharacterSetting("MPlusAccountAlwaysShowStones", false)
	self:LoadCharacterSetting("TrackWarmode", false)
	self:LoadCharacterSetting("HorrificWaste", false)
	self:LoadCharacterSetting("DemandingVisions", false)
	self:LoadCharacterSetting("HorrificVisionTracker", true)
	
	self:LoadCharacterValue("MinimapPosition", 0.0)
	
	self:LoadAccountCharacterTable()
	
	self:LoadAccountValue("IncursionActive", false)
	self:LoadAccountValue("IncursionMap", 0)
	self:LoadAccountValue("IncursionEndTime", 0)
	
	--we read all the data we need, now point the SavedVariables onto our new tables to make sure if we ever deprecate options they will be properly removed from users of older versions
	ThingsToDo2_CharacterData	= self.CharacterData
	ThingsToDo2_AccountData		= self.AccountData
	
	return
end

function this:GetCharacterSetting(Setting)
	if(self.CharacterData.Settings[Setting] == nil) then
		Tools.Chat:Error("trying to read invalid character-setting: "..Setting)
	end
	
	return self.CharacterData.Settings[Setting]
end

function this:SetCharacterSetting(Setting, Data)
	if(self.CharacterData.Settings[Setting] == nil) then
		Tools.Chat:Error("trying to write invalid character-setting: "..Setting)
	end
	
	self.CharacterData.Settings[Setting] = Data
end

function this:GetCharacterValue(Value)
	if(self.CharacterData.Values[Value] == nil) then
		Tools.Chat:Error("trying to read invalid character-value: "..Value)
	end
	
	return self.CharacterData.Values[Value]
end

function this:SetCharacterValue(Value, Data)
	if(self.CharacterData.Values[Value] == nil) then
		Tools.Chat:Error("trying to write invalid character-value: "..Value)
	end
	
	self.CharacterData.Values[Value] = Data
end

function this:GetAccountCharacterTable()
	return self.AccountData.Characters
end

function this:ClearAccountCharacterTable()
	Tools.Chat:Warning("clearing all account-based character-data")
	
	print(self.AccountData.Characters)
	for k,v in pairs(self.AccountData.Characters) do
		print(k)
	end
	
	Tools.Table:Clear(self.AccountData.Characters)
	return
end

function this:GetAccountValue(Value)
	if(self.AccountData.Values[Value] == nil) then
		Tools.Chat:Error("trying to read invalid account-value: "..Value)
	end
	
	return self.AccountData.Values[Value]
end

function this:SetAccountValue(Value, Data)
	if(self.AccountData.Values[Value] == nil) then
		Tools.Chat:Error("trying to write invalid account-value: "..Value)
	end
	
	self.AccountData.Values[Value] = Data
end
