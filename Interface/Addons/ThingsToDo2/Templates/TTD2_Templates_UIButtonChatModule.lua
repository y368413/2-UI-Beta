ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

--[[
this is the most basic kind of TTD2-Module: It only has to implement a self:CreateOutput()
If any of this output is visible with the current options, the module-button is shown in the MainFrame
If no output is visible, the button is not shown.

Update:
Added a "PrepareData()" call before CreateOutput. Modules are supposed to return "false" if the data they need
for the output is not ready yet.
While any module can use this additional function to prepare its data for output, it is really only necessary
for modules that rely on tooltip data.
]]

local super = Templates.Initialised
Templates.UIButtonChatModule = super:new()
local this = Templates.UIButtonChatModule

this.IsUIModule = true
this.IsIgnored = false

function this:ModuleButtonCondition()
	self:Init()
	
	TTD2.Tools.Output:ClearLines()
	--if data is missing the module needs more time.
	if(self:PrepareData() == false) then
		return true
	end
	self:CreateOutput()
	return TTD2.Tools.Output:HasVisibleLines()
end

function this:ModuleButtonScript(Frame, Button, Down)
	self:Init()
	
	
	TTD2.Tools.Output:ClearLines()
	if(self:PrepareData() == false) then
		TTD2.Tools.Output:AddLine(TTD2.Tools.Output.Status.ToDo, "Still loading Data. Please wait a few seconds and retry.")
	else
		self:CreateOutput()
	end
	TTD2.Tools.Output:PrintModule(self)
end

function this:AddModuleButton(ScrollFrame)
	self:Init()
	
	if(self.IsIgnored) then
		return
	end
	
	if(self:ModuleButtonCondition() == false) then
		return
	end
	
	if(self.ModuleButton == nil) then
		self.ModuleButton = TTD2.Templates.UIPanelButton:new()
		self.ModuleButton.ButtonText = (ScrollFrame:GetNumButtons() + 1)..": "..self.Name
		self.ModuleButton.ButtonScriptFunction = self.ModuleButtonScript
		self.ModuleButton.ButtonScriptObject = self
		
		self.ModuleButton.ButtonScriptFunctionRightButton = self.IgnoreMe
		self.ModuleButton.ButtonScriptObjectRightButton = self
		
		ScrollFrame:AddButtonToContentFrame(self.ModuleButton)
	else
		self.ModuleButton.ButtonText = (ScrollFrame:GetNumButtons() + 1)..": "..self.Name
		ScrollFrame:AddButtonToContentFrame(self.ModuleButton)
		self.ModuleButton:UpdateButtonText()
	end
end

function this:IgnoreMe()
	self:Init()
	
	self.IsIgnored = true
	self.ModuleButton.Frame:Hide()	
end

function this:PrepareData()
	return true
end
