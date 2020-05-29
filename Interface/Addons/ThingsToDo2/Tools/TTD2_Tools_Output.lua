ThingsToDo2 = ThingsToDo2 or {}
local TTD2 = ThingsToDo2

TTD2.Templates = TTD2.Templates or {}
local Templates = TTD2.Templates

TTD2.Tools = TTD2.Tools or {}
local Tools = TTD2.Tools

--[[
this librabry manages an output buffer. the buffer is made up of (Status:Content) pairs. Which values are allowed as
Status is defined by this library along with a chat symbol to use for it.

The buffer provides the following functions:
:ClearBuffer()
	resets the buffer to empty
:GetNumVisibleLines()
	returns how many lines ar visible with the currend savedData settings
:StoreLine(Status, Content, LineIndex)
	overwrites Line[LineIndex] with (Status:Content)
	LineIndex may be nil, in which case a new Line is appended at the end of the buffer
:PrintBuffer()
	Prints all valid lines in order, adding the Status chat-symbol in front of Content
:PrintModule(Module)
	Same as PrintBuffer() but will lead the output with a formated Module-Name-Line
	
Update:
When printing achievement criteria you often only want to print details if the "master" achievement
is also displayed. therefore, this Tool will be changed:

:StoreLine() - removed
:AddLine(Status, Content, Dependency)
	returns the index of the added line. Dependency may be nil. If Dependency is not nil,
	the line will not only check it's own status but also the status of the line given in this
	parameter. It is allowed to chain multiple dependencies BUT Dependency must be smaller than
	the line added by the actual function call.
	the idea is to check dependencies until we hit a false (not visible) dependency. Only if the
	complete dependency-chain is true (visible) the line will be visible.
:ChangeLine(LineIndex, Status, Content, Dependency)
	Changes the content of LineIndex to the specifies parameters. Any of them may be nil to not change
	the original value.
	to remove the original Dependency pass LineIndex for it.
:HasVisibleContent()
	loops over the buffer and returns true on the frst visible line, is therefore much faster than
	(GetNumVisibleLines() ~= 0).
	
Update2:
New Status: CompletedDependency

This status is only valid for lines with a dependency. If the dependency has Completed Status, the line
will not be printed.

The idea is that if an achievement requires all of its criteria to be met, there is no need to print all
of the completed individual criteria if the achievement itself is completed.
For these cases you can use CompletedDependency status.

Update3:
Deecided we do not need CompletedDependency; the case is almost identical to the combination of
having a Dependency and Status.Completed; there is no need for an additional status.
Also, we will disregard this additional filtering completely for now. If the user wants to see completed
he gets to see completed.

Update4:
Added indentation based on dependency to the output. I thought about adding actual child-lines instead of
dependent-lines...but that would make adding/changing lines later a little more difficult (you would
have to store the actual line object returned by :AddLine() and so on) and i think the curret way of
using dependencies is good enough, maybe even better. It is definetly more flexible, even if this
flexibility is not actually used.
]]

local super = Templates.Initialised
Tools.Output = super:new()
local this = Tools.Output

this.Status =
{
	Ignored =
	{ 
		Symbol	= Tools.Chat:Red("?"),
		Setting = false
	},
	ToDo =
	{
		Symbol	= Tools.Chat:Yellow("O"),
		Setting	= true
	},
	Completed =
	{
		Symbol	= Tools.Chat:Green("X"),
		Setting	= false
	},
	Done =
	{
		Symbol	= Tools.Chat:Red("X"),
		Setting = false
	},
	Rare =
	{
		Symbol	= Tools.Chat:Purple("O"),
		Setting	= false
	}
}

function this:Initialise()
	self.Lines = {}
	self.NextLine = 1
end

function this:UpdateStatusSettings()
	self:Init()
	
	self.Status.Completed.Setting	= Tools.SavedData:GetCharacterSetting("PrintCompleted")
	self.Status.Done.Setting		= Tools.SavedData:GetCharacterSetting("PrintDone")
	self.Status.Rare.Setting		= Tools.SavedData:GetCharacterSetting("RareSources")	
	return
end

function this:ClearLines()
	self:Init()
	
	Tools.Table:Clear(self.Lines)
	self.NextLine = 1
end

function this:GetLine(LineIndex)
	self:Init()
	
	if(self.Lines[LineIndex] == nil) then
		Tools.Chat.Error("Output:GetLine(), LineIndex out of bounds: "..LineIndex.." ("..self.NextLine..")")
	end
	
	return self.Lines[LineIndex]
end

function this:IsVisibleLine(LineIndex, PreviousStatus)
	self:Init()

	self:UpdateStatusSettings()
	local Line = self:GetLine(LineIndex)
	
	if(Line.Status.Setting == false) then
		return false --if the status of this line is false/invisible then that is our return value no matter what
	else
		--[[
		if((Line.Status == self.Status.Completed) and (PreviousStatus == self.Status.Completed)) then
			return false
		end
		]]
		
		if(Line.Dependency == nil) then
			return Line.Status.Setting
		else
			return self:IsVisibleLine(Line.Dependency, Line.Status)
		end
	end
end

function this:HasVisibleLines()
	self:Init()
	
	for LineIndex,_ in ipairs(self.Lines) do
		if(self:IsVisibleLine(LineIndex) == true) then
			return true
		end
	end
	
	return false
end

function this:GetNumVisibleLines()
	self:Init()
	
	local NumVisibleLines = 0
	for LineIndex,_ in ipairs(self.Lines) do
		if(self:IsVisibleLine(LineIndex) == true) then
			NumVisibleLines = NumVisibleLines + 1
		end
	end
	
	return NumVisibleLines
end

function this:AddLine(LineStatus, LineContent, LineDependency)
	self:Init()
	
	if(Tools.Table:Contains(self.Status, LineStatus) == false) then
		Tools.Chat:Error("Output:Addline(), invalid LineStatus")
		local Nilval = nil
		Nilval[1] = true
	end
	
	local LineIndex = self.NextLine
	self.NextLine = self.NextLine + 1
	
	if( (LineDependency ~= nil) and (LineDependency >= LineIndex) ) then
		Tools.Chat.Error("Output:AddLine(), LineDependency must be less than current line.")
		local Nilval = nil
		Nilval[1] = true
	end
	
	self.Lines[LineIndex] = { Status = LineStatus, Content = LineContent, Dependency = LineDependency }
	return LineIndex
end

function this:ChangeLine(LineIndex, LineStatus, LineContent, LineDependency)
	self:Init()
	
	local Line		= self:GetLine(LineIndex)
	Line.Status		= LineStatus or Line.Status
	Line.Content	= LineContent or Line.Content
	Line.Dependency	= LineDependency or Line.Dependency
	
	if(Line.Dependency == LineIndex) then
		Line.Dependency = nil
	elseif( (LineDependency ~= nil) and (LineDependency >= LineIndex) ) then
		Tools.Chat.Error("Output:ChangeLine(), LineDependency must be less than LineIndex.")
	end
end

function this:IgnoreLine(LineIndex)
	self:Init()
	
	local Line	= self:GetLine(LineIndex)
	Line.Status	= self.Status.Ignored
end

function this:PrintBuffer()
	self:Init()
	
	for LineIndex,Line in ipairs(self.Lines) do
		if(self:IsVisibleLine(LineIndex) == true) then
			if(Line.Dependency == nil) then
				print(Line.Status.Symbol,Line.Content)
			else
				local Indentation = "  "
				local Dependency = self.Lines[Line.Dependency].Dependency
				while(Dependency ~= nil) do
					Dependency = self.Lines[Dependency].Dependency
					Indentation = Indentation.."   "
				end
				print(Indentation,Line.Status.Symbol,Line.Content)
			end
		end
	end
end

function this:PrintModule(Module)
	self:Init()
	
	print(Tools.Chat:GetColoredAddonTitle()..": "..Tools.Chat:Yellow(Module.Name))
	if(self:HasVisibleLines() == true) then
		self:PrintBuffer()
	else
		print("Nothing to do. Please refresh modules.")
	end
end
