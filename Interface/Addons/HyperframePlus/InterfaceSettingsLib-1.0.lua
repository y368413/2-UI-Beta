
-- Register Addon Table (Required) --
------------------------------------- 
	local Addon = HyperframePlusAddon           -- Addon Table (Table)
    local AddonName = Addon.AddonName           -- Addon Name (String)
    local AddonFileName = Addon.AddonFileName   -- Addon File Name (String)



-- Initialize Library --
------------------------ 
    local LIBRARY_ID, LIBRARY_VERSION = "InterfaceSettingsLib-1.0", 1

    local globalEnv = _G or getfenv(0)

    if globalEnv[LIBRARY_ID] and globalEnv[LIBRARY_ID].Version >= LIBRARY_VERSION then
        return
    end

    local InterfaceSettingsLib = globalEnv[LIBRARY_ID] or {}
    globalEnv[LIBRARY_ID] = InterfaceSettingsLib
    globalEnv["InterfaceSettingsLib"] = InterfaceSettingsLib
    globalEnv["ISL_"] = InterfaceSettingsLib

    InterfaceSettingsLib.Version = LIBRARY_VERSION
    InterfaceSettingsLib.Settings = InterfaceSettingsLib.Settings or {}




-- Settings Tables --
--------------------- 

    -- Parent 
        InterfaceSettingsLib[AddonName] = {}

    -- Checkboxes 
        InterfaceSettingsLib[AddonName].Checkboxes = {}

    -- Checkbox Sliders 
        InterfaceSettingsLib[AddonName].CheckboxSliders = {}

    -- Sliders 
        InterfaceSettingsLib[AddonName].Sliders = {}

    -- Categories 
        InterfaceSettingsLib[AddonName].Categories = {}

    -- Headers 
        InterfaceSettingsLib[AddonName].Headers = {}

    -- Buttons 
        InterfaceSettingsLib[AddonName].Buttons = {}

    -- Dropdowns 
        InterfaceSettingsLib[AddonName].Dropdowns = {}



-- Core Functions --
-------------------- 

    -- Register Addon Settings (Checkbox, Checkbox Slider, Dropdown) 
        local function ISL_RegisterAddonSetting(CategoryTable, UniqueName, VariableKey, AddonSettingsTable, VariableType, Name, DefaultValue)
            return Settings.RegisterAddOnSetting(CategoryTable, UniqueName, VariableKey, AddonSettingsTable, VariableType, Name, DefaultValue)
        end

    -- Register Initializer (Button) 
        local function ISL_RegisterInitializer(CategoryTable, Setting)
            SettingsInbound.RegisterInitializer(CategoryTable, Setting)
            return Setting
        end

    -- Set Default Value (Checkbox Slider) 
        local function ISL_SetDefaultValue(AddonSettingsTable, VariableKey, DefaultValue)
            if AddonSettingsTable[VariableKey] == nil then
                AddonSettingsTable[VariableKey] = DefaultValue
            end
        end

    -- Clean Strings
        local function CleanString(s)
            return s:gsub("^%s+", "")
                    :gsub("%s+$", "")
        end

	-- Round Slider Values
		local function Round(value, precision)
			local multiplier = 10 ^ (precision or 0)
			return math.floor(value * multiplier + 0.5) / multiplier
		end



-- Functions --
--------------- 

    -- Create Category 
        function InterfaceSettingsLib:CreateCategory(AddonName)

        -- Validate Input 
            if not AddonName or type(AddonName) ~= "string" then
                error("[InterfaceSettingsLib:CreateCategory]: 'AddonName' must be a string.")
            end

        -- Ensure AddonName Is Initialized 
            if not self[AddonName] or not self[AddonName].Categories then
                error("[InterfaceSettingsLib:CreateCategory]: 'AddonName' is not initialized under Register Addon Table.")
            end

        -- Create Vertical Layout Category 
            local Category, Layout = Settings.RegisterVerticalLayoutCategory(AddonName)

        -- Store Category And Layout 
            self[AddonName].Categories[Category:GetName()] = {
                Category = Category,
                Layout = Layout,
            }

        -- Register Category 
            Settings.RegisterAddOnCategory(Category)

        -- Return Category And Layout 
            return Category, Layout

        --[[ Example: 
                MyAddon_ParentCategory, MyAddon_ParentLayout = InterfaceSettingsLib:CreateCategory("My Addon")
        ]]--

        end

    -- Create Header 
        function InterfaceSettingsLib:CreateHeader(CategoryName, CustomName, HeaderName, HeaderTooltip)

        -- Validate Inputs 
            if not CategoryName or not CustomName or not HeaderName then
                error("[InterfaceSettingsLib:CreateHeader]: 'CategoryName', 'CustomName', and 'HeaderName' are required.")
            end
            if type(CategoryName) ~= "string" or type(CustomName) ~= "string" or type(HeaderName) ~= "string" then
                error("[InterfaceSettingsLib:CreateHeader]: 'CategoryName', 'CustomName', and 'HeaderName' must be strings.")
            end
            local CategoryData = self[AddonName].Categories[CategoryName]
            if not CategoryData then
                error("[InterfaceSettingsLib:CreateHeader]: Category '" .. CategoryName .. "' does not exist.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            if not self[AddonName] or not self[AddonName].Categories or not self[AddonName].Headers then
                error("[InterfaceSettingsLib:CreateHeader]: 'AddonName' is not initialized under Register Addon Table.")
            end

        -- Create Header 
            local Header = CreateSettingsListSectionHeaderInitializer(HeaderName, HeaderTooltip)

        -- Add Header To Layout 
            local Layout = CategoryData.Layout
            Layout:AddInitializer(Header)

         -- Create Unique Name 
            local UniqueName = (CustomName .. HeaderName):gsub("%s+", "")

        -- Store Header 
            HeaderTooltip = HeaderTooltip or ""
            self[AddonName].Headers[UniqueName] = {
                Header = Header,
                Tooltip = HeaderTooltip,
                ParentCategory = CategoryName,
            }

         -- Return Header 
            return Header

        --[[ Examples: 
                local Header = InterfaceSettingsLib:CreateHeader("My Addon", "Settings", "My Addon Settings" "My Settings Tooltip")
                local Header = InterfaceSettingsLib:CreateHeader("My Addon Subcategory", "Settings", "My Addon Settings")
        ]]--

        end

    -- Create Subcategory 
        function InterfaceSettingsLib:CreateSubcategory(ParentCategoryTable, SubcategoryName)

        -- Validate Inputs 
            if not ParentCategoryTable or not SubcategoryName then
                error("[InterfaceSettingsLib:CreateSubcategory]: 'ParentCategoryTable' and 'SubcategoryName' are required.")
            end
            if type(ParentCategoryTable) ~= "table" or type(SubcategoryName) ~= "string" then
                error("[InterfaceSettingsLib:CreateSubcategory]: 'ParentCategoryTable' must be a table, and 'SubcategoryName' must be a string.")
            end
            local ParentCategoryName = ParentCategoryTable:GetName()
            if not ParentCategoryName or not self[AddonName].Categories[ParentCategoryName] then
                error("[InterfaceSettingsLib:CreateSubcategory]: Parent category '" .. (ParentCategoryName or "unknown") .. "' does not exist.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            if not self[AddonName] or not self[AddonName].Categories then
                error("[InterfaceSettingsLib:CreateSubcategory]: 'AddonName' is not initialized under Register Addon Table.")
            end

        -- Create Subcategory And Layout 
            local ParentCategoryData = self[AddonName].Categories[ParentCategoryName]
            local Subcategory, SubcategoryLayout = Settings.RegisterVerticalLayoutSubcategory(
                ParentCategoryData.Category,
                SubcategoryName
            )

        -- Store Subcategory And Layout 
            self[AddonName].Categories[SubcategoryName] = {
                Category = Subcategory,
                Layout = SubcategoryLayout,
                Parent = ParentCategoryTable,
            }

        -- Return Subcategory And Layout 
            return Subcategory, SubcategoryLayout

        --[[ Example: 
                MyAddon_Subcategory, MyAddon_SubcategoryLayout = InterfaceSettingsLib:CreateSubcategory(MyAddon_ParentCategory, "My Addon Subcategory")
        ]]--

        end

    -- Create Checkbox 
        function InterfaceSettingsLib:CreateCheckbox(CategoryTable, CheckBoxName, UniqueName, VariableKey, AddonSettingsTable, DefaultValue, Tooltip, Callback)

        -- Validate Inputs 
            if type(CategoryTable) ~= "table" or type(CheckBoxName) ~= "string" or type(UniqueName) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckbox]: 'CategoryTable' must be a table, and 'CheckBoxName' and 'UniqueName' must be strings.")
            end
            if type(DefaultValue) ~= "boolean" then
                error("[InterfaceSettingsLib:CreateCheckbox]: 'DefaultValue' must be a boolean.")
            end
            if Callback and type(Callback) ~= "function" then
                error("[InterfaceSettingsLib:CreateCheckbox]: 'Callback' must be a function.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            self[AddonName] = self[AddonName] or {}
            self[AddonName].Checkboxes = self[AddonName].Checkboxes or {}

        -- Register Checkbox 
            local Setting = ISL_RegisterAddonSetting(CategoryTable, UniqueName, VariableKey, AddonSettingsTable, type(DefaultValue), CheckBoxName, DefaultValue)

        -- Set Callback 
            if Callback then
                Setting:SetValueChangedCallback(function(setting, value)
                    Callback(Setting, value)
                end)
            end

        -- Create Checkbox 
            local Checkbox = Settings.CreateCheckbox(CategoryTable, Setting, Tooltip)

        -- Store Checkbox 
            self[AddonName].Checkboxes[UniqueName] = Checkbox

        -- Return Checkbox 
            return Checkbox

        --[[ Example: 
            	local function MyAddon_OnCheckboxSettingChangedFunc(setting, value)
                    local CVarName = setting.variableKey
                    local CVarValue = value and 1 or 0
                    C_CVar.SetCVar(CVarName, CVarValue)
                end

			    local Checkbox = InterfaceSettingsLib:CreateCheckbox(
				    MyAddon_ParentCategory -OR- MyAddon_Subcategory,
				    "My Checkbox",
				    "Unique Name",
				    "Variable Name",
				    MyAddon_Settings,
				    true,
				    "This is a checkbox.",
				    function(setting, value)
					    MyAddon_OnCheckboxSettingChangedFunc(setting, value)
				    end
			    )
        ]]--

        end

    -- Create Button 
        function InterfaceSettingsLib:CreateButton(CategoryTable, ButtonName, ButtonText, Callback, Tooltip, AddSearchTags)

        -- Validate Inputs 
            if type(CategoryTable) ~= "table" or type(ButtonName) ~= "string" or type(ButtonText) ~= "string" then
                error("[InterfaceSettingsLib:CreateButton]: 'CategoryTable' must be a table, and 'ButtonName', and 'ButtonText' must be strings.")
            end
            if Callback and type(Callback) ~= "function" then
                error("[InterfaceSettingsLib:CreateButton]: 'Callback' must be a function.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            self[AddonName] = self[AddonName] or {}
            self[AddonName].Buttons = self[AddonName].Buttons or {}

        -- Create Button Setting 
            local Setting = CreateSettingsButtonInitializer(
                ButtonName,
                ButtonText,
                Callback,
                Tooltip,
                AddSearchTags
            )

        -- Create Unique Name 
            local UniqueName = CategoryTable:GetName() .. ButtonName
            UniqueName = UniqueName:gsub("%s+", "")

        -- Create Button 
            local Button = ISL_RegisterInitializer(CategoryTable, Setting)

        -- Store Button 
            self[AddonName].Buttons[UniqueName] = Button

        -- Return Button 
            return Button

        --[[ Example: 

	            local function OnButtonClick()
		            print("Button clicked!")
	            end

                local Button = InterfaceSettingsLib:CreateButton(
	                CategoryTable,
                    "ButtonName",
                    "ButtonText",
	                function()
		                OnButtonClick()
	                end,
	                "Tooltip",
	                false
                )
        ]]--

        end

    -- Create Dropdown 
        function InterfaceSettingsLib:MakeDropdown(CategoryTable, DropdownName, VariableKey, DefaultValue, Tooltip, DropdownOptions, AddonSettingsTable, Callback, Measurement)

        -- Validate Inputs 
            if type(CategoryTable) ~= "table" or type(DropdownName) ~= "string" or type(VariableKey) ~= "string" then
                error("[InterfaceSettingsLib:MakeDropdown]: 'CategoryTable' must be a table, and 'DropdownName', and 'VariableKey' must be strings.")
            end
            if not DropdownOptions or type(DropdownOptions) ~= "table" then
                error("[InterfaceSettingsLib:MakeDropdown]: 'DropdownOptions' must be a table.")
            end
            if Callback and type(Callback) ~= "function" then
                error("[InterfaceSettingsLib:MakeDropdown]: 'Callback' must be a function.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            self[AddonName] = self[AddonName] or {}
            self[AddonName].Dropdowns = self[AddonName].Dropdowns or {}

        -- Generate Dropdown Options 
            local function GetOptions()
                local container = Settings.CreateControlTextContainer()
                for i, option in ipairs(DropdownOptions) do
                    if not Measurement then
                        container:Add(i, option)
                    else
                        container:Add(i, option .. " " .. Measurement)
                    end
                end
                return container:GetData()
            end

        -- Register Dropdown 
            local setting = Settings.RegisterAddOnSetting(CategoryTable, DropdownName, VariableKey, AddonSettingsTable, type(DefaultValue), DropdownName, DefaultValue)
            setting.data = { Tooltip = Tooltip }

        -- Set Callback 
            if Callback then
                setting:SetValueChangedCallback(function(setting, value)
                    Callback(setting, value)
                end)
            end

        -- Create Unique Name 
            local UniqueName = DropdownName:gsub("%s+", "")

        -- Create Dropdown 
            local Dropdown = Settings.CreateDropdown(CategoryTable, setting, GetOptions, Tooltip)

        -- Store Dropdown 
            self[AddonName].Dropdowns[UniqueName] = Dropdown

        -- Return Dropdown 
            return Dropdown

        end

    -- Create Slider 
        function InterfaceSettingsLib:CreateSlider(CategoryTable, SliderName, UniqueName, VariableKey, DefaultValue, MinimumValue, MaximumValue, Step, Tooltip, AddonSettingsTable, Callback, UseDecimals)

        -- Validate Inputs 
            if type(CategoryTable) ~= "table" or type(SliderName) ~= "string" or type(UniqueName) ~= "string" or type(VariableKey) ~= "string" then
                error("[InterfaceSettingsLib:CreateSlider]: 'CategoryTable' must be a table, and 'SliderName', 'UniqueName', and 'VariableKey' must be strings.")
            end
            if not AddonSettingsTable or type(AddonSettingsTable) ~= "table" then
                error("[InterfaceSettingsLib:CreateSlider]: 'AddonSettingsTable' must be a table.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            self[AddonName] = self[AddonName] or {}
            self[AddonName].Sliders = self[AddonName].Sliders or {}

        -- Initialize Setting For New Users 
            if AddonSettingsTable[VariableKey] == nil then
                if UseDecimals == true then
                    AddonSettingsTable[VariableKey] = Round(DefaultValue, UseDecimals and 2 or 0)
                elseif not UseDecimals then
                    AddonSettingsTable[VariableKey] = DefaultValue
                end
            end

        -- Get Value 
            local function GetValue()
                local Setting = AddonSettingsTable[VariableKey]
                if Setting == nil then
                    if UseDecimals == true then
                        AddonSettingsTable[VariableKey] = Round(DefaultValue, UseDecimals and 2 or 0)
                    elseif not UseDecimals then
                        AddonSettingsTable[VariableKey] = DefaultValue
                    end
                end
                return AddonSettingsTable[VariableKey]
            end

        -- Set Value 
            local function SetValue(value)
                if UseDecimals == true then
                    AddonSettingsTable[VariableKey] = Round(value, 2)
                elseif not UseDecimals then
                    AddonSettingsTable[VariableKey] = value
                end
                
            end

        -- Register Slider 
            local Setting = Settings.RegisterProxySetting(CategoryTable, UniqueName, type(DefaultValue), SliderName, DefaultValue, GetValue, SetValue)

        -- Set Callback 
            if Callback and type(Callback) == "function" then
                Setting:SetValueChangedCallback(function(setting, value)
                    Callback(setting, value)
                end)
            end

        -- Create Options 
            local SliderOptions = Settings.CreateSliderOptions(MinimumValue, MaximumValue, Step)

            -- Custom Formatters
                if SliderName == "DSP Buffer Size" or SliderName == "Cache Size" then
                    SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                        return string.format("%d MB", value / (1024 * 1024))
                    end)
                elseif SliderName == "Shadow Texture Size" or SliderName == "Component Texture Cache Size" then
                    SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                        if value == 1536 then
                            return string.format("N/A")
                        else
                            return string.format("%d MB", value)
                        end
                    end)
                elseif SliderName == "Frame Buffer" then
                    SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                        if value == 1 then
                            return string.format("%d Frame", value)
                        else
                            return string.format("%d Frames", value)
                        end
                    end)
                elseif SliderName == "Max Cacheable Size" then
                    SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                        return string.format("%.2f MB", value / (1024 * 1024))
                    end)
                elseif SliderName == "Async Handler Timeout" or SliderName == "Async Thread Sleep" then
                    SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                        return string.format("%d ms", value)
                    end)
            -- Typical Formatter
                else
                    if UseDecimals == true then
                        SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value)
                            return string.format("%.2f", Round(value, 2))
                        end)
                    elseif not UseDecimals then
                        SliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)
                    end
                end

        -- Create Slider 
            local Slider = Settings.CreateSlider(CategoryTable, Setting, SliderOptions, Tooltip)

        -- Apply Slider Setting 
            if Callback then
                local sliderData = Slider:GetSetting()
                sliderData:TriggerValueChanged(sliderData:GetValue())
            end

        -- Store Slider 
            self[AddonName].Sliders[UniqueName] = Slider

        -- Return Slider 
            return Slider

        end

--[[

slider:SetFormatter(function(value)
    local megabytes = value / (1024 * 1024) -- Convert bytes to MB
    return string.format("%.2f MB", megabytes) -- Format as "XX.XX MB"
end)

-- Update the label's text using the formatter
slider:HookScript("OnValueChanged", function(self, value)
    self.Label.Right:SetText(self.formatter and self.formatter(value) or value)
end)

]]

    -- Create Checkbox Slider 
        function InterfaceSettingsLib:CreateCheckBoxSlider(CategoryTable, SliderName, VariableKey, SliderDefaultValue, SliderMin, SliderMax, SliderStep, SliderTooltip, CheckboxLabel, CheckboxDefaultValue, CheckboxTooltip, AddonSettingsTable, SliderCallback, CheckboxCallback)
            
        -- Validate Inputs 
            if type(CategoryTable) ~= "table" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'CategoryTable' must be a table.")
            end
            if type(SliderName) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'SliderName' must be a string.")
            end
            if type(VariableKey) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'VariableKey' must be a string.")
            end
            if type(SliderDefaultValue) ~= "number" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'SliderDefaultValue' must be a number.")
            end
            if type(SliderMin) ~= "number" or type(SliderMax) ~= "number" or type(SliderStep) ~= "number" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'SliderMin', 'SliderMax', and 'SliderStep' must be numbers.")
            end
            if type(CheckboxLabel) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'CheckboxLabel' must be a string.")
            end
            if CheckboxDefaultValue ~= nil and type(CheckboxDefaultValue) ~= "boolean" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'CheckboxDefaultValue' must be a boolean if provided.")
            end
            if SliderTooltip ~= nil and type(SliderTooltip) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'SliderTooltip' must be a string if provided.")
            end
            if CheckboxTooltip ~= nil and type(CheckboxTooltip) ~= "string" then
                error("[InterfaceSettingsLib:CreateCheckBoxSlider]: 'CheckboxTooltip' must be a string if provided.")
            end

        -- Ensure Addon Data Structure Is Properly Initialized 
            self[AddonName] = self[AddonName] or {}
            self[AddonName].CheckboxSliders = self[AddonName].CheckboxSliders or {}

        -- Create Unique Checkbox Names 
            local cbInternalName = VariableKey .. "_CheckBox"
            local CheckboxVariableKey = VariableKey .. "_CheckBox"
    
        -- Initialize Settings For New Users 
            CheckboxDefaultValue = CheckboxDefaultValue or Settings.Default.False
            ISL_SetDefaultValue(AddonSettingsTable, CheckboxVariableKey, CheckboxDefaultValue)
            ISL_SetDefaultValue(AddonSettingsTable, VariableKey, SliderDefaultValue)

        -- Get Slider Value 
            local function GetValue()
                return AddonSettingsTable[VariableKey] or SliderDefaultValue
            end

        -- Set Slider Value 
            local function SetValue(value)
                AddonSettingsTable[VariableKey] = value
            end

        -- Create Setting Initializer 
            local function CreateSettingsCheckBoxSliderInitializer(cbSetting, cbLabel, cbTooltip, sliderSetting, sliderOptions, sliderLabel, sliderTooltip)
                local data = {
                    name = cbLabel,
                    tooltip = cbTooltip,
                    cbSetting = cbSetting,
                    cbLabel = cbLabel,
                    cbTooltip = cbTooltip,
                    sliderSetting = sliderSetting,
                    sliderOptions = sliderOptions,
                    sliderLabel = sliderLabel,
                    sliderTooltip = sliderTooltip,
                }
                local initializer = Settings.CreateSettingInitializer("SettingsCheckboxSliderControlTemplate", data)
                initializer:AddSearchTags(cbLabel, sliderLabel)
                return initializer
            end

        -- Register Checkbox Slider 
            local function CreateCheckBoxSlider(category, cbSetting, cbLabel, cbTooltip, sliderSetting, sliderOptions, sliderLabel, sliderTooltip)
                local initializer = CreateSettingsCheckBoxSliderInitializer(cbSetting, cbLabel, cbTooltip, sliderSetting, sliderOptions, sliderLabel, sliderTooltip)
                local layout = SettingsPanel:GetLayout(category)
                layout:AddInitializer(initializer)
                return initializer
            end

        -- Register Checkbox Setting 
            local cbSetting = ISL_RegisterAddonSetting(CategoryTable, cbInternalName, CheckboxVariableKey, AddonSettingsTable, Settings.VarType.Boolean, CheckboxDefaultValue)
            if CheckboxCallback then
                cbSetting:SetValueChangedCallback(function(setting, value)
                    CheckboxCallback(setting, value)
                end)
            end

        -- Register Slider Setting 
            local setting = Settings.RegisterProxySetting(CategoryTable, VariableKey, Settings.VarType.Number, SliderName, SliderDefaultValue, GetValue, SetValue)
            if SliderCallback then
                setting:SetValueChangedCallback(function(setting, value)
                    SliderCallback(setting, value)
                end)
            end

        -- Create Slider Options 
            local options = Settings.CreateSliderOptions(SliderMin, SliderMax, SliderStep)
            options:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right)

        -- Create Checkbox Slider 
            local CheckboxSlider = CreateCheckBoxSlider(CategoryTable, cbSetting, CheckboxLabel, CheckboxTooltip, setting, options, SliderName, SliderTooltip)

        -- Store Checkbox Slider 
            self[AddonName].CheckboxSliders[VariableKey] = CheckboxSlider

        -- Return Checkbox Slider 
            return CheckboxSlider

        end