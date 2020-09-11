local isBagUpdateRequested = false
local waitingOnBagUpdate = {}
local atGuild = false

local Version = nil
if select(4, GetAddOnInfo('Combuctor')) then
		Version = GetAddOnMetadata('Combuctor', 'Version')
		CaerdonWardrobe:RegisterAddon('Combuctor', { isBags = true, hookDefaultBags = true })
end

if Version then

	local function OnUpdateSlot(self)
		local bag, slot = self:GetBag(), self:GetID()

		if self.info.cached then
			CaerdonWardrobe:UpdateButtonLink(self.info.link, "ItemLink", nil, self, { showMogIcon = true, showBindStatus = true, showSellables = true } )
		else
			if bag ~= "vault" then
				local tab = GetCurrentGuildBankTab()
				if atGuild and tab == bag then
					local itemLink = GetGuildBankItemLink(tab, slot)
					bag = "GuildBankFrame"
					slot = { tab = tab, index = slot }
					CaerdonWardrobe:UpdateButtonLink(itemLink, bag, slot, self, { showMogIcon = true, showBindStatus = true, showSellables = true } )
					ScheduleItemUpdate(itemID, bag, slot, self)
				else
					local itemLink = GetContainerItemLink(bag, slot)
					CaerdonWardrobe:UpdateButtonLink(itemLink, bag, slot, self, { showMogIcon = true, showBindStatus = true, showSellables = true } )
				end
			end
		end
	end

	local function OnEvent(self, event, ...)
		local handler = self[event]
		if(handler) then
			handler(self, ...)
		end
	end

	local function HookCombuctor()
		hooksecurefunc(Combuctor.Item, "Update", OnUpdateSlot)
	end

	local CaerdonWardrobeFrame = CreateFrame("FRAME")

	CaerdonWardrobeFrame:SetScript("OnEvent", OnEvent)
	-- CaerdonWardrobeFrame:RegisterEvent("TRANSMOG_COLLECTION_ITEM_UPDATE")

	HookCombuctor()

	function CaerdonWardrobeFrame:ADDON_LOADED(name)
	end

	function CaerdonWardrobeFrame:TRANSMOG_COLLECTION_ITEM_UPDATE()
	    if Combuctor.sets then
	        Combuctor:UpdateFrames()
	    end
	end

	function CaerdonWardrobeFrame:GUILDBANKFRAME_OPENED()
		atGuild = true
	end

	function CaerdonWardrobeFrame:GUILDBANKFRAME_CLOSED()
		atGuild = false
	end
end

--[[CaerdonWardrobeConfigMixin = {}
CaerdonWardrobeConfigGeneralMixin = {}

function CaerdonWardrobeConfigMixin:OnLoad()
    self.name = "Caerdon Wardrobe"
	-- self.okay = PropagateErrors(self.OnSave)
	-- self.cancel = PropagateErrors(self.OnCancel)
	-- self.default = PropagateErrors(self.OnResetToDefaults)
	-- self.refresh = PropagateErrors(self.OnRefresh)

	-- InterfaceOptions_AddCategory(self)
end

function CaerdonWardrobeConfigGeneralMixin:OnLoad()
    self.name = "General"
    self.parent = "Caerdon Wardrobe"
	-- InterfaceOptions_AddCategory(self)
end]]