ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
provides TomTom related functions
]]

local super = Templates.Initialised
Tools.TomTom = super:new()
local this = Tools.TomTom

this.TomTomLinkType = "TTD2_TomTom_ChatLink"

function this.OnHyperlinkShowStatic(ChatFrame, Link, Text, Button)
	this:OnHyperlinkShow(ChatFrame, Link, Text, Button)
end

function this:Initialise()
	
	self.TomTom = nil
	if((_G.TomTom ~= nil) and (_G.TomTom.AddWaypoint ~= nil)) then
		self.TomTom = _G.TomTom
		self.OldHyperlinkShow = ChatFrame_OnHyperlinkShow
		ChatFrame_OnHyperlinkShow = this.OnHyperlinkShowStatic
	end
	
	self.TomTomLabel = "TomTomLink: "
end

function this:OnHyperlinkShow(ChatFrame, Link, Text, Button)
	self:Init()
	
	local _,_,LinkType,MapID, X, Y, Description = string.find(Link, "("..this.TomTomLinkType.."):(%d-):(.-):(.-):(.+)")
	if(LinkType ~= self.TomTomLinkType) then
		return self.OldHyperlinkShow(ChatFrame, Link, Text, Button)
	end
	
	if(Button == "RightButton") then
		return
	end

	MapID = tonumber(MapID)
	X = tonumber(X)
	Y = tonumber(Y)
	
	self:AddWaypoint(MapID, X, Y, Description)

	return
end

function this:CreateLink(MapID,X,Y,Description,LinkText)
	self:Init()
	
	if(LinkText == nil) then
		LinkText = Description
	end
	
	if(self.TomTom == nil) then
		return ("["..LinkText.."]")
	end
	
	local Link = (self.TomTomLinkType..":"..(MapID)..":"..(X)..":"..(Y)..":"..(Description))
	if(Tools.SavedData:GetCharacterSetting("VerboseTomTom") == true) then
		local MapGenealogy = Tools.Map:GetMapGenealogy(MapID, " >> ")
		return Tools.Chat:Gold("\124H"..Link.."\124h["..self.TomTomLabel..MapGenealogy.." >> "..Description.."]\124h")
	else
		local MapName = Tools.Map:GetNameByID(MapID)
		return Tools.Chat:Gold("\124H"..Link.."\124h["..self.TomTomLabel..MapName.." >> "..Description.."]\124h")
	end
end

function this:AddWaypoint(MapID, PosX, PosY, Title, Persistent)
	self:Init()
	
	--is TomTom installed?
	if(self.TomTom == nil) then
		return
	end
	
	if(Tools.Map:IsSameContinent(MapID) == false) then
		print(Tools.Chat:GetColoredAddonTitle()..": Different continent! Waypoint "..Tools.Chat:Red("NOT").." added!")
		if(Tools.SavedData:GetCharacterSetting("VerboseTomTom") == true) then
			print("You: "..Tools.Map:GetMapGenealogy(Tools.Map:GetCurrentMapID()))
			print("Target: "..Tools.Map:GetMapGenealogy(MapID))
		end
		return
	end
	
	if(Persistent == nil) then
		Persistent = false
	end
	
	local Options =
	{
		persistent	= Persistent,
		title		= Title		
	}	
	self.TomTom:AddWaypoint(MapID, PosX, PosY, Options)
	return
end

function this:IsActive()
	self:Init()
	
	return (self.TomTom ~= nil)
end
