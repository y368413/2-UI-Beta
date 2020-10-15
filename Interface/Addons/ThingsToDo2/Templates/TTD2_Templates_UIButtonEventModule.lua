ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
combiner class
the purpose of this template is to present a module which ultimately has an InsecureActionButton
but there are many limitations for InsecureActionButtons in combat.

So what we will do is to actually have two buttons: the std UIActionButton of the UIButtonChatModule
template and ADDITIONALLY a new InsecureActionButton.

The InsecButton cannot be created while in combat. So we have to hook :AddModuleButton() and check for CombatStatus.
If not in combat, we can create our InsecButton right away
If in combat, we will use the default ActionButton of the base module as a placeholder and disable it. The InsecButton will be created
upon leaving combat the next time.
]]

local super = Templates.EventModule
Templates.UIButtonEventModule = super:new()
local this = Templates.UIButtonEventModule

this.IsUIModule = true

function this:Initialise()

	self.Events = {}
	self.Events["PLAYER_REGEN_DISABLED"]	= true
	self.Events["PLAYER_REGEN_ENABLED"]		= true
end

function this:EventCondition()
	self:Init()
	
	--we can only receive events if the button is visible; which means either of both buttons
	return self:IsButtonVisible()
end

function this:ReceiveEvent(Event, Data)
	self:Init()
	
	if(Event == "PLAYER_REGEN_DISABLED") then
		self:DeactivateSecureButton()
	elseif(Event == "PLAYER_REGEN_ENABLED") then
		self:ActivateSecureButton()
	else
		self:ReceiveModuleEvent(Event, Data)
	end
end

function this:ModuleButtonCondition()
	self:Init()
	
	if(TTD2.Tools.SavedData:GetCharacterSetting("AllowSecureButtons") == false) then
		return false
	end
	return true
end

function this:AddModuleButton(ScrollFrame)
	self:Init()

	--conditions
	if((TTD2.Tools.SavedData:GetCharacterSetting("AllowSecureButtons") == false) or (self:ModuleButtonCondition() == false)) then
		self:HideButton()
		return
	end

	--first, add a std ActionButton that does nothing
	if(self.DummyButton == nil) then
		self.DummyButton = Templates.UIPanelButton:new()
	end
	
	self.DummyButton.ButtonText = (ScrollFrame:GetNumButtons() + 1)..": "..self.Name
	ScrollFrame:AddButtonToContentFrame(self.DummyButton)
	self.DummyButton:UpdateButtonText()
	
	--disable this button
	self.DummyButton.Frame:SetEnabled(false)
	
	--if we are out of combat, create the "real" button
	if(TTD2.Tools.Unit.IsPlayerInCombat() == false) then
		self:ActivateSecureButton()
	end
end

function this:ActivateSecureButton()
	self:Init()
	
	--we can only do this if the dummy button is correctly setup
	if((self.DummyButton == nil) or (self.DummyButton.Frame == nil)) then
		return
	end
	
	if(self.SecureButton == nil) then
		self.SecureButton = Templates.InsecureActionButton:new()
		self.SecureButton:Create()
	end

	self.SecureButton.FrameParent	= self.DummyButton.FrameParent
	self.SecureButton.ButtonPosY	= self.DummyButton.ButtonPosY
	self.SecureButton.ButtonText	= self.DummyButton.ButtonText
	
	self.SecureButton:UpdateButtonText()
	self.SecureButton:UpdateButtonParent()
	
	self.DummyButton.Frame:Hide()
	self.SecureButton.Frame:Show()
	
	self:UpdateSecureButton(self.SecureButton.Frame)
end

function this:DeactivateSecureButton()
	self:Init()
	
	if((self.SecureButton ~= nil) and (self.SecureButton.Frame ~= nil)) then	
		self.SecureButton.Frame:Hide()
	end
	
	if((self.DummyButton ~= nil) and (self.DummyButton.Frame ~= nil)) then
		self.DummyButton.Frame:Show()
	end
end

function this:HideButton()
	self:Init()
	
	if((self.SecureButton ~= nil) and (self.SecureButton.Frame ~= nil)) then	
		self.SecureButton.Frame:Hide()
	end
	
	if((self.DummyButton ~= nil) and (self.DummyButton.Frame ~= nil)) then
		self.DummyButton.Frame:Hide()
	end
end

function this:IsButtonVisible()
	self:Init()
	
	if((self.DummyButton ~= nil) and (self.DummyButton.Frame ~= nil) and (self.DummyButton.Frame:IsVisible() == true)) then
		return true
	end
	
	if((self.SecureButton ~= nil) and (self.SecureButton.Frame ~= nil) and (self.SecureButton.Frame:IsVisible() == true)) then
		return true
	end
	
	return false
end
