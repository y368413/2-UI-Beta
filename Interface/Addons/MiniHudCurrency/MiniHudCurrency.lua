local ADDONNAME = ...
local VERSION = C_AddOns.GetAddOnMetadata(ADDONNAME,"Version")
local F = {};

local targetName = "TokenFramePopup.CurrencyTransferToggleButton"
local popupSize = 0
local CurrencyHUDCheckBox = nil
local currencyList = {}
local LinkFormat = "|cff0070dd|Hcurrency:CURR_ID:0|h[CURR_NAME]|h|r";

function F.OnLoad(self)
	self:RegisterEvent("ADDON_LOADED");			--AddOn Loaded
	self:RegisterEvent("GLOBAL_MOUSE_UP");		--Mouse Button Up
	self:RegisterEvent("TRADE_CURRENCY_CHANGED");	
	self:RegisterEvent("CURRENCY_DISPLAY_UPDATE");
end

function F.OnEvent(self, event, ...)
	--print(event)
	if (event == "ADDON_LOADED") then
 		if (...) == ADDONNAME then
			DEFAULT_CHAT_FRAME:AddMessage(ADDONNAME.." "..VERSION.." Loaded.");
			if MiniHudCurrencySVPC ~= nil then currencyList = CopyTable(MiniHudCurrencySVPC) end;
			F.SetBackdropData(MHCurrency)
			for k,v in pairs(currencyList) do 
				v.Frame = CreateFrame("Frame", k, MHCurrencyFrame,"EntryTemplate")
			end
			F.Update();
		end
	elseif event == "GLOBAL_MOUSE_UP" then
		if TokenFramePopup:IsShown() then
			-- First time opening the popup frame
			if popupSize == 0 then 
				CurrencyHUDCheckBox = CreateFrame("CheckButton", "CurrencyHUDCheckBox", TokenFramePopup, "OptionsSmallCheckButtonTemplate" )
				CurrencyHUDCheckBox:SetPoint("TOPLEFT" , TokenFramePopup.BackpackCheckbox, "BOTTOMLEFT", 0, 4)
				TokenFramePopup.CurrencyTransferToggleButton:SetPoint("TOPLEFT" , CurrencyHUDCheckBox, "BOTTOMLEFT", 0, 2)
				CurrencyHUDCheckBox:SetSize(26,26)
				_G[CurrencyHUDCheckBox:GetName().."Text"]:SetText("|cffffffffTrack with |cff20B020MiniHUD|r");
				CurrencyHUDCheckBox:SetScript("OnClick", F.CheckBox)
				CurrencyHUDCheckBox:Show()
			end
			local buffer = 22
			if TokenFramePopup.CurrencyTransferToggleButton:IsShown() then 
				popupSize = 130 + buffer
			else
				popupSize = 100 + buffer
			end
			TokenFramePopup:SetHeight(popupSize)
			-- Get which token is selected
			-- Update the checkbox with the checked value of the currently selected currency.
			if currencyList[TokenFrame.selectedToken] ~= nil then
				CurrencyHUDCheckBox:SetChecked(currencyList[TokenFrame.selectedToken].Checked)
			else
				CurrencyHUDCheckBox:SetChecked(false)
			end
		end
	elseif event == "CURRENCY_DISPLAY_UPDATE" or event == "TRADE_CURRENCY_CHANGED" then
		F.Update()
	end
end

-- SetBackdrop - Applies backdrop data to the panel
function F.SetBackdropData(frame)
	frame:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true,
		tileEdge = true,
		tileSize = 16,
		edgeSize = 16,
		insets = { left = 5, right = 5, top = 5, bottom = 5 },
	})
	local backdropAlpha = 0.5
	frame:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b, backdropAlpha)
	frame:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b, backdropAlpha)
end

function F.CheckBox()
	local link = C_CurrencyInfo.GetCurrencyListLink(TokenFrame.selectedID)
	link = string.sub(link, string.find(link, ":") + 1, string.len(link))
	link = string.sub(link, 0, string.find(link, ":")-1)
	if currencyList[TokenFrame.selectedToken] ~= nil then
		currencyList[TokenFrame.selectedToken].Checked = CurrencyHUDCheckBox:GetChecked()
	else
		F.CreateFrame(link)
	end
	F.Update()
end

function F.CreateFrame(curID)
	local currencyInfo = C_CurrencyInfo.GetCurrencyInfo(curID)
	if currencyInfo.name == nil then return end;
	newframe = CreateFrame("Frame", currencyInfo.name, MHCurrencyFrame,"EntryTemplate")
	currencyList[currencyInfo.name] = {Info = currencyInfo, Checked = true, Frame = newframe, currencyID = curID}
end

function F.Update()
	if currencyList == nil then MHCurrency:Hide(); return; end;
	local list = ""
	local count = 1
	local lastFrame = nil
	for k,v in pairs(currencyList) do 
		if v.Checked then
			local info = C_CurrencyInfo.GetCurrencyInfo(v.currencyID)
			v.Info = info -- *** UPDATE CURRENCY DATA ***
			count = count + 1
			v.Frame:Show()
			v.Frame.Text:SetText(ITEM_QUALITY_COLORS[v.Info.quality].hex..v.Info.name)
			v.Frame.Value:SetText(v.Info.quantity..(v.Info.maxQuantity ~= 0 and ("/"..v.Info.maxQuantity) or ""))
			v.Frame.Icon:SetTexture(v.Info.iconFileID)
			if lastFrame == nil then
				v.Frame:SetPoint("TOPLEFT", MHCurrencyFrame, "TOPLEFT", 4,-4)
				else
				v.Frame:SetPoint("TOPLEFT", lastFrame, "BOTTOMLEFT", 0,-2)
			end
			lastFrame = v.Frame
		else 
			v.Frame:Hide()
		end
	end
	if count == 1 then 
		MHCurrency:Hide()
	else
		MHCurrency:Show()
	end
	MHCurrency:SetWidth(242);
	MHCurrency:SetHeight((count-1) * 18 + 8);
	MiniHudCurrencySVPC = CopyTable(currencyList)
end

function F.MultiCmdParse(msg)
	--handle empty msg
	if (msg == "") then
		return "";
	end
	local pos, size, main;
	local sub, find, len = string.sub, string.find, string.len;
	pos = find(msg, " ");
	if (pos == nil) then
		return msg; --handle single param commands
	end
	main = sub(msg, 0, pos - 1);
	size = len(msg);
	msg = sub(msg, pos + 1, size);
	local i = 0;
	local param = {};
	while ((msg ~= "") and (msg ~= " ") and (i < 30)) do
		pos = find(msg, " ");
		if (pos == nil) then
			param[i] = msg;
			break;
		else
			param[i] = sub(msg, 0, pos - 1);
			msg = sub(msg, pos + 1, size);
		end
		i = i + 1;
	end;
	return main, param;
end

SLASH_Currency1 = '/mhc';	--/Commands
function SlashCmdList.Currency(msg)
	local param = {};
	msg, param = F.MultiCmdParse(msg)
	if msg == nil or msg == ""  or msg == "help" then
		-- Show help text
		print("MiniHUD:Currency: Help")
		print("/mhc help - Show this help text.")
		print("/mhc reset - Reset Frame Position.")
		print("/mhc track [CurrencyID] - Add/Remove a specific currency to the tracking frame. Even if not in the Currency Pane. Must use ID.")
		print("/mhc clear - Clear saved variables.")
	elseif msg == "reset" then
		print("MiniHUD:Currency: Resetting frame position.")
		
		MHCurrency:ClearAllPoints()
		MHCurrency:SetPoint("CENTER", UIParent, "CENTER")
	elseif msg == "clear" then
		for k,v in pairs(currencyList) do 
			v.Checked = false;
			v.Frame:Hide()
		end
		currencyList = nil;
		-- ^ possible memory leak!!! Frames do not get deleted.
		F.Update()
		MiniHudCurrencySVPC = nil;
		print("MiniHUD:Currency: Clearinig saved variables.")
	elseif msg == "track" then
		if param[0] == nil then return end;
		local cInfo = C_CurrencyInfo.GetCurrencyInfo(param[0])
		if currencyList[cInfo.name] ~= nil then
			currencyList[cInfo.name].Checked = not currencyList[cInfo.name].Checked
		else 
			F.CreateFrame(param[0])
		end
		F.Update()
	end
end
_G[ADDONNAME] = F
--name, currentAmount, texture, earnedThisWeek, weeklyMax, totalMax, isDiscovered, rarity = GetCurrencyInfo(id or "currencyLink" or "currencyString")