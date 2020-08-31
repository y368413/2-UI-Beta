if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

if(TTD2.Tools == nil) then
	TTD2.Tools = {}
end
local Tools = TTD2.Tools

--[[
the main event dispatcher. TTD2.Modules are supervised automatically, all other EventModules must be added
manually by calling AddEventModule()
When CheckEventModules() is called, all supervised EventModules are tested for ShouldEventsBeRegistered() and
AreEventsRegistered(). If there is a mismatch, the dispatcher handles it.
]]

TTD2.Tools.EventDispatcher = {}
local this = TTD2.Tools.EventDispatcher

this.EventTable = {}

function this:Register()
	if(self.EventFrame ~= nil) then
		Tools.Chat.Error("StartUp() called when EventFrame was already created.")
		return
	end
	
	self.EventFrame = CreateFrame("Frame")
	self.EventFrame:SetScript("OnEvent", function(Frame, Event, Data, ...)
		self:OnEvent(Event, Data, ...)
		return
	end)	
	self.EventFrame:RegisterEvent("ADDON_LOADED")
	return
end

function this:OnEvent(Event, Data, ...)

	if(Event == "ADDON_LOADED") then
		if(Data == "ThingsToDo2") then --"ADDON_LOADED" events for other addons are not important for us and ignored
			
			--we only need ADDON_LOADED once, so remove it
			self.EventFrame:UnregisterEvent("ADDON_LOADED")
			
			Tools.SavedData:LoadFromGlobals()
			Tools.SlashCommandList:Register()
			TTD2.Frames.MinimapButton:Update()
			
			self:CheckModules()
		end
	else
	
		if(self.EventTable[Event] == nil) then
			Tools.Chat.Error("received unexpected event: "..Event)
			return
		end
		
		--Tools.Chat:Debug("event received: "..Event)
		for Listener, _ in pairs(self.EventTable[Event]) do
			Listener:ReceiveEvent(Event, Data, ...)
		end
	end
	
	return
end

function this:RegisterModuleEvents(Module)
	--debug
	if(self.EventFrame == nil) then
		TTD2.Tools.Chat.Error("Trying to register event before Dispatcher was started.")
	end
	
	for Event, _ in pairs(Module.Events) do
		if(self.EventTable[Event] == nil) then
			self.EventTable[Event] = {}
		end
		
		if(TTD2.Tools.Table:IsEmpty(self.EventTable[Event]) == true) then
			--print("registering event: ", Event)
			self.EventFrame:RegisterEvent(Event)
		end
		
		if((self.EventTable[Event][Module] ~= nil) or (Module.IsRegistered == true)) then
			TTD2.Tools.Chat.Error("Trying to register the same module twice.")
		end
		
		--use the Module as key
		self.EventTable[Event][Module] = true
	end
	Module.IsRegistered = true
end

function this:UnregisterModuleEvents(Module)
	--debug
	if(self.EventFrame == nil) then
		TTD2.Tools.Chat.Error("Trying to unregister event before Dispatcher was started.")
	end
	
	for Event, _ in pairs(Module.Events) do
		if((self.EventTable[Event] == nil) or (self.EventTable[Event][Module] == nil) or (Module.IsRegistered == false)) then
			TTD2.Tools.Chat.Error("Trying to unregister invalid module.")
		end
		
		self.EventTable[Event][Module] = nil
		
		if(TTD2.Tools.Table:IsEmpty(self.EventTable[Event]) == true) then
			--print("unregistering event: ", Event)
			self.EventFrame:UnregisterEvent(Event)
		end
	end
	Module.IsRegistered = false
end

function this:CheckModule(Module)
	if(Module.IsEventModule == true) then
		local ShouldBeRegistered = Module:EventCondition()
		if(Module.IsRegistered ~= ShouldBeRegistered) then
			if(ShouldBeRegistered == true) then
				self:RegisterModuleEvents(Module)			
			else
				self:UnregisterModuleEvents(Module)
			end
		end
	end
end

function this:CheckModules()
	for ModuleName, Module in pairs(TTD2.Modules) do
		self:CheckModule(Module)
	end
end
