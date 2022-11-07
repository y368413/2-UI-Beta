-----------------------
----LOCAL VARIABLES----
-----------------------


local ADDON_NAME, namespace = ...;
local functions = namespace.functions;
local variables = namespace.variables;
local actConfigWindow = CreateFrame("FRAME", "ActConfigWindow", UIParent);
local loadFrame = CreateFrame("FRAME");

-----------------------
--FUNCTION DEFINITIONS-
-----------------------


--Check button factory.
local function createCheckbutton(name, parent, x_loc, y_loc, displayname, tooltip)
	local checkbutton = CreateFrame("CheckButton", name, parent, "ChatConfigCheckButtonTemplate");
	checkbutton:SetPoint("TOPLEFT", x_loc, y_loc);
	_G[checkbutton:GetName().."Text"]:SetText(displayname);
	checkbutton.tooltip = tooltip;

	return checkbutton;
end

--Quality dropdown factory
local function qualityDropDownFactory(frame, frameDropDown, x_loc, y_loc, title)
	frame:SetPoint("TOPLEFT", x_loc, y_loc);
	frame:SetSize(100,200);

	frame.dropDown = frameDropDown;
	frame.dropDown:SetPoint("CENTER", frame, "CENTER", 0, -20);

	frame.dropDown.displayMode = "MENU";
	UIDropDownMenu_SetText(frame.dropDown, title);

	frame.dropDown.onClick = function(self, arg1, arg2, checked)
		frame.dropDown.quality = self.value;
	end

	frame.dropDown.initialize = function(self, level)
		local info = UIDropDownMenu_CreateInfo();

		for i = 1, #variables.itemQuality do
			local item = variables.itemQuality[i];
			_,_,_,hex = GetItemQualityColor(item.number);
			info.text = item.name;
			info.func = self.onClick;
			info.value = item.number;
			info.checked = info.value == frame.dropDown.quality;
			UIDropDownMenu_AddButton(info, level);
		end
	end
end

--Function for creating the roll setting frames.
local function editBoxFactory(frame, frameEditbox, x, y, title)
	frame:SetPoint("TOPLEFT", actConfigWindow, "TOPLEFT", x, y);
	frame:SetSize(100,200);

	--Create and set title of the setting.
	frame.title = frame:CreateFontString(nil,"OVERLAY");
	frame.title:SetFontObject("GameFontHighLight");
	frame.title:SetPoint("CENTER", frame, "CENTER", 0, 5);
	frame.title:SetText(title);

	--Create the editbox for the setting.
	frame.editBox = frameEditbox;
	frame.editBox:SetPoint("CENTER", frame, "CENTER", 0, -15);
	frame.editBox:SetSize(40,40);
	frame.editBox:SetAutoFocus(false);
	frame.editBox:SetFontObject("GameFontHighLight");
	frame.editBox:SetNumeric(true);
	frame.editBox:SetMaxLetters(4);
end

--Function for creating the mount setting frames.
local function mountEditBoxFactory(frame, frameEditbox, x, y, title, checkName)
	frame:SetPoint("TOPLEFT", actConfigWindow, "TOPLEFT", x, y);
	frame:SetSize(100,200);

	--Create and set title of the setting.
	frame.title = frame:CreateFontString(nil,"OVERLAY");
	frame.title:SetFontObject("GameFontHighLight");
	frame.title:SetPoint("CENTER", frame, "CENTER", 0, 5);
	frame.title:SetText(title);

	--Create the editbox for the setting.
	frame.editBox = frameEditbox;
	frame.editBox:SetPoint("CENTER", frame, "CENTER", 0, -15);
	frame.editBox:SetSize(130,20);
	frame.editBox:SetAutoFocus(false);
	frame.editBox:SetFontObject("GameFontHighLight");

	frame.editBox:SetScript("OnEnterPressed", function(self)
		local name = frame.editBox:GetText();
		local id = functions.getMountID(name);

		if not functions.knownMount(id) then
			print("Invalid mount name!");
		else
			frame.editBox.mountID = id;
		end

		frame.editBox:ClearFocus();
	end);

	local checkbutton = CreateFrame("CheckButton", checkName, frame, "ChatConfigCheckButtonTemplate");
	checkbutton:SetPoint("LEFT", frame, "LEFT", -42, -15);
	checkbutton.tooltip = "Enable/Disable this setting.";
end

--Updating the config windows values.
local function updateConfigWindow()
	actConfigWindow.minIlvl.editBox:SetNumber(actSettings.minIlvl)
	actConfigWindow.minQuality.dropDown.quality = actSettings.minQuality;
	actConfigWindow.maxQuality.dropDown.quality = actSettings.maxQuality;

	actConfigWindow.dragonFlyingMount.editBox.mountID = actSettings.dragonFlyingMount;
	actConfigWindow.defaultMount.editBox.mountID = actSettings.defaultMount;
	actConfigWindow.groundMount.editBox.mountID = actSettings.groundMount;
	actConfigWindow.altMount.editBox.mountID = actSettings.altMount;
	actConfigWindow.ctrlMount.editBox.mountID = actSettings.ctrlMount;

	_G["actDeArmor"]:SetChecked(actSettings.deArmor);
	_G["actDeWeapon"]:SetChecked(actSettings.deWeapon);

	_G["actDragonflyingMount"]:SetChecked(actMounts.dragonFlyingMountBool);
	_G["actDefaultMount"]:SetChecked(actMounts.defaultMountBool);
	_G["actGroundMount"]:SetChecked(actMounts.groundMountBool);
	_G["actAltMount"]:SetChecked(actMounts.altMountBool);
	_G["actCtrlMount"]:SetChecked(actMounts.ctrlMountBool);
	_G["actShiftMount"]:SetChecked(actMounts.shiftMountBool);

	local dragonFlying,_ = C_MountJournal.GetMountInfoByID(actMounts.dragonFlyingMount);
	local normal,_ = C_MountJournal.GetMountInfoByID(actMounts.defaultMount);
	local ground,_ = C_MountJournal.GetMountInfoByID(actMounts.groundMount);
	local alt,_ = C_MountJournal.GetMountInfoByID(actMounts.altMount);
	local ctrl,_ = C_MountJournal.GetMountInfoByID(actMounts.ctrlMount);
	local shift,_ = C_MountJournal.GetMountInfoByID(actMounts.shiftMount);

	actConfigWindow.dragonFlyingMount.editBox:SetText(dragonFlying);
	actConfigWindow.defaultMount.editBox:SetText(normal);
	actConfigWindow.groundMount.editBox:SetText(ground);
	actConfigWindow.altMount.editBox:SetText(alt);
	actConfigWindow.ctrlMount.editBox:SetText(ctrl);
	actConfigWindow.shiftMount.editBox:SetText(shift);
end

--Function for saving data from config window and closing it.
local function saveData()
	local minIlvl = actConfigWindow.minIlvl.editBox:GetNumber();
	local minQuality = actConfigWindow.minQuality.dropDown.quality;
	local maxQuality = actConfigWindow.maxQuality.dropDown.quality;

	local dragonFlyingMount = actConfigWindow.dragonFlyingMount.editBox.mountID;
	if not (dragonFlyingMount == nil or dragonFlyingMount == 0) then
		actMounts.dragonFlyingMount = dragonFlyingMount;
	end

	local defaultMount = actConfigWindow.defaultMount.editBox.mountID;
	if not (defaultMount == nil or defaultMount == 0) then
		actMounts.defaultMount = defaultMount;
	end

	local groundMount = actConfigWindow.groundMount.editBox.mountID;
	if not(groundMount == nil or groundMount == 0) then
		actMounts.groundMount = groundMount;
	end

	local altMount = actConfigWindow.altMount.editBox.mountID;
	if not (altMount == nil or altMount == 0) then
		actMounts.altMount = altMount;
	end

	local ctrlMount = actConfigWindow.ctrlMount.editBox.mountID; 
	if not (ctrlMount == nil or ctrlMount == 0) then
		actMounts.ctrlMount = ctrlMount;
	end

	local shiftMount = actConfigWindow.ctrlMount.editBox.mountID;
	if not (shiftMount == nil or shiftMount == 0) then
		actMounts.shiftMount = shiftMount;
	end

	if
		minIlvl == 0 or
		minQuality == 0 or
		maxQuality == 0 or
		minQuality > maxQuality
	then
		print("Error, invalid values");

		return;
	end

	actSettings.minIlvl = minIlvl;
	actSettings.minQuality = minQuality;
	actSettings.maxQuality = maxQuality;
	actSettings.deArmor = _G["actDeArmor"]:GetChecked();
	actSettings.deWeapon = _G["actDeWeapon"]:GetChecked();

	actMounts.dragonFlyingMountBool = _G["actDragonflyingMount"]:GetChecked();
	actMounts.defaultMountBool = _G["actDefaultMount"]:GetChecked();
	actMounts.groundMountBool = _G["actGroundMount"]:GetChecked();
	actMounts.altMountBool = _G["actAltMount"]:GetChecked();
	actMounts.ctrlMountBool = _G["actCtrlMount"]:GetChecked();
	actMounts.shiftMountBool = _G["actShiftMount"]:GetChecked();
end

--Function for resetting values to default.
local function setValuesToDefault()
	actConfigWindow.minIlvl.editBox:SetNumber(210);
	actConfigWindow.minQuality.dropDown.quality = 2;
	actConfigWindow.maxQuality.dropDown.quality = 2;

	_G["actDeArmor"]:SetChecked(false);
	_G["actDeWeapon"]:SetChecked(false);

	_G["actDragonflyingMount"]:SetChecked(true);
	_G["actDefaultMount"]:SetChecked(true);
	_G["actGroundMount"]:SetChecked(false);
	_G["actAltMount"]:SetChecked(true);
	_G["actCtrlMount"]:SetChecked(true);
	_G["actShiftMount"]:SetChecked(true);

	local dragonFlying, _ = C_MountJournal.GetMountInfoByID(1589);
	local default,_ = C_MountJournal.GetMountInfoByID(1222);
	local ground, _ = C_MountJournal.GetMountInfoByID(1222);
	local alt,_ = C_MountJournal.GetMountInfoByID(1039);
	local ctrl,_ = C_MountJournal.GetMountInfoByID(460);
	local shift,_ = C_MountJournal.GetMountInfoByID(407);

	actConfigWindow.dragonFlyingMount.editBox:SetText(dragonFlying);
	actConfigWindow.defaultMount.editBox:SetText(default);
	actConfigWindow.groundMount.editBox:SetText(ground);
	actConfigWindow.altMount.editBox:SetText(alt);
	actConfigWindow.ctrlMount.editBox:SetText(ctrl);
	actConfigWindow.shiftMount.editBox:SetText(shift);
end


-----------------------
-----EVENT HANDLING----
-----------------------


loadFrame:RegisterEvent("ADDON_LOADED");
loadFrame:SetScript("OnEvent", function(self, event, ...)
	local arg1,arg2,arg3,arg4 = ...;
	if event == "ADDON_LOADED" and arg1 == "Acts Functions" then		
		updateConfigWindow();
		loadFrame:UnregisterEvent("ADDON_LOADED");
	end
end);


-----------------------
-----CONFIG WINDOW-----
-----------------------


--Add config to standard wow interface window.
local category = Settings.RegisterCanvasLayoutCategory(actConfigWindow, "Act's Functions");
Settings.RegisterAddOnCategory(category);

--Create checkboxes.
createCheckbutton("actDeArmor", actConfigWindow, 12, -30, "Toggle Armor Disenchant", "If checked the addon will DE armor.");
createCheckbutton("actDeWeapon", actConfigWindow, 12, -60, "Toggle Weapon Disenchant", "If checked the addon will DE weapons.");

--Create frames to hold the minIlvl setting.
actConfigWindow.minIlvl = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.minIlvl.editBox = CreateFrame("EditBox", nil, actConfigWindow.minIlvl, "InputBoxTemplate");
editBoxFactory(actConfigWindow.minIlvl, actConfigWindow.minIlvl.editBox, 25, -10, "Min ilvl for DE:");

--Create quality dropdowns
actConfigWindow.minQuality = CreateFrame("frame", nil, actConfigWindow);
actConfigWindow.minQuality.dropDown = CreateFrame("frame", nil, actConfigWindow.minQuality, "UiDropDownMenuTemplate");
qualityDropDownFactory(actConfigWindow.minQuality, actConfigWindow.minQuality.dropDown, -35, -45, "Minimum Quality");

actConfigWindow.maxQuality = CreateFrame("frame", nil, actConfigWindow);
actConfigWindow.maxQuality.dropDown = CreateFrame("frame", nil, actConfigWindow.maxQuality, "UiDropDownMenuTemplate");
qualityDropDownFactory(actConfigWindow.maxQuality, actConfigWindow.maxQuality.dropDown, -35, -85, "Maximum Quality");

--Create mount editboxes
actConfigWindow.dragonFlyingMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.dragonFlyingMount.editBox = CreateFrame("EditBox", nil, actConfigWindow.dragonFlyingMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.dragonFlyingMount, actConfigWindow.dragonFlyingMount.editBox, 45, -130, "Dragonflying Mount:", "actDragonflyingMount");

actConfigWindow.defaultMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.defaultMount.editBox = CreateFrame("EditBox", nil, actConfigWindow.defaultMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.defaultMount, actConfigWindow.defaultMount.editBox, 45, -170, "Default Mount:", "actDefaultMount");

actConfigWindow.groundMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.groundMount.editBox = CreateFrame("Editbox", nil, actConfigWindow.groundMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.groundMount, actConfigWindow.groundMount.editBox, 45, -210, "Ground Mount:", "actGroundMount");

actConfigWindow.altMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.altMount.editBox = CreateFrame("EditBox", nil, actConfigWindow.altMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.altMount, actConfigWindow.altMount.editBox, 45, -250, "ALT Mount:", "actAltMount");

actConfigWindow.ctrlMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.ctrlMount.editBox = CreateFrame("EditBox", nil, actConfigWindow.ctrlMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.ctrlMount, actConfigWindow.ctrlMount.editBox, 45, -290, "CTRL Mount:", "actCtrlMount");

actConfigWindow.shiftMount = CreateFrame("Frame", nil, actConfigWindow);
actConfigWindow.shiftMount.editBox = CreateFrame("EditBox", nil, actConfigWindow.shiftMount, "InputBoxTemplate");
mountEditBoxFactory(actConfigWindow.shiftMount, actConfigWindow.shiftMount.editBox, 45, -330, "SHIFT Mount:", "actShiftMount");


--Create and set title of the setting.
actConfigWindow.title = actConfigWindow:CreateFontString(nil,"OVERLAY");
actConfigWindow.title:SetFontObject("GameFontNormalLarge");
actConfigWindow.title:SetPoint("TOPLEFT", actConfigWindow, "TOPLEFT", 15, -5);
actConfigWindow.title:SetText(GetAddOnMetadata("Acts Functions", "Title") .. " version: " .. GetAddOnMetadata("Acts Functions", "Version"));

actConfigWindow:Hide();
actConfigWindow:SetScript("OnShow", function(self) updateConfigWindow(); end);
actConfigWindow:SetScript("OnHide", function(self) saveData(); end);


-----------------------
---GLOBAL FUNCTIONS----
-----------------------


--Create a "global" config toggle function so the settings window can be opened from the init.lua file code.
function functions.toggleActConfig()
	Settings.OpenToCategory(category:GetID());
end
