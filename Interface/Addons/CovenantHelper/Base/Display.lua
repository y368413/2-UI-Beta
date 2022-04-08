local addonName, addon = ...
local E, L = unpack(_G[addonName])
local Module = E:NewModule("Display")
local LibSharedMedia = LibStub("LibSharedMedia-3.0")
local ActConfigHelper, ActConfigHelperMinor = LibStub('LibAceConfigHelper')
local DEFAULT_FONT_NAME = LibSharedMedia:GetDefault("font")

E.Display = Module

function Module:ShowMessage(text, font, fontSize, outline, shadow)
    if not font then
        font = E.Config:GetValue({ "fontname" }) or DEFAULT_FONT_NAME
    end
    if not fontSize then
        fontSize = E.Config:GetValue({ "fontSize" }) or 52
    end
    if not outline then
        outline = E.Config:GetValue({"fontOutline"}) or "THICKOUTLINE"
    end

    if not shadow then
        shadow = E.Config:GetValue({"fontShadow"}) or false
    end
    
	if outline == "NONE" then
		outline = ""
	end

    local frame = self.frame

    local fs = self.fontString
    if not fs then
        fs = frame:CreateFontString(nil, "ARTWORK", "SystemFont_Shadow_Small")
        self.fontString = fs
    end

    fs:SetFont(LibSharedMedia:Fetch("font", font), fontSize, outline)

    if shadow then
        fs:SetShadowColor(0, 0, 0, 1)
    else
        fs:SetShadowColor(0, 0, 0, 0)
    end

	if r and g and b then
		fs:SetTextColor(r, g, b)
	else
		fs:SetTextColor(1, 1, 1)
	end

    fs:ClearAllPoints()
    fs:SetPoint("CENTER", frame, "CENTER", E.Config:GetValue({ "xOffset" }) or 0, E.Config:GetValue({ "yOffset" }) or 0)
	fs:SetText(text)
    frame:SetFrameLevel(1)

    fs:Show()
    frame:Show()

    self:Cancel()

    local displayTime = E.Config:GetValue({ "displayTime" }) or E.DEFAULT_DISPLAY_TIME

    --启动一个新的定时器，来显示文本，到期自动消失
    self.timer = C_Timer.NewTimer(displayTime, function()
        frame:Hide()
        self.timer = nil
    end)
end

function Module:Cancel()
    --如果有正在显示中的文本
    if self.timer then
        if self.timer:IsCancelled() then
            return
        end

        --取消上一次定时器
        self.timer:Cancel()
        self.timer = nil
    end
end

function Module:ShowTestMessage()
    local covenantID = math.random(1,4)

    local message = 
    L["dialog.activate.soulbind"] .. E:formatCovenantStrings(L['dialog.test.name'], covenantID) .. "\n" ..
    L["dialog.activate.equipment"] .. L['dialog.test.name']

    return self:ShowMessage(message)
end

function Module:CreateOptions()
    local setting = ActConfigHelper:Group(L["dialog.title.setting"], nil, 20, nil,
        function(info) 
            local name = info[#info]
            local value = E.Config:GetValue({ name }) 
            return value
        end,
        function(info, value)
            local name = info[#info]
            E.Config:SetValue({name}, value)

            self:ShowTestMessage()
        end
    )

    E.Options.args.setting = setting

    --测试按钮
    local testBtn = ActConfigHelper:Execute(L['dialog.title.test'], nil, 5, function()
        self:ShowTestMessage()
    end)

    setting.args.testBtn = testBtn

    --字体设置
    local font = ActConfigHelper:Group(L["dialog.title.font"], nil, 10, nil)
    font.inline = true

    font.args.fontname = ActConfigHelper:SharedMediaFont(L["dialog.font.name"], nil, 1, nil)
    font.args.fontOutline = ActConfigHelper:FontFlags(L["dialog.font.outline"], nil, 2)
    font.args.fontSize = ActConfigHelper:Range(L["dialog.font.size"], nil, 3, { min = 24, max = 96, step = 1 })
    font.args.fontShadow = ActConfigHelper:Toggle(L["dialog.font.shadow"], nil, 4)

    setting.args.font = font

    --显示设置
    local display = ActConfigHelper:Group(L["dialog.title.display"], nil, 11, nil)
    display.inline = true

    display.args.displayTime = ActConfigHelper:Range(L["dialog.display.time"], nil, 1, { min = 5, max = 60, step = 1 })
    display.args.delayTime = ActConfigHelper:Range(L["dialog.display.delay"], nil, 2, { min = 1, max = 10, step = 1 })
    
    local position = ActConfigHelper:Group(L["dialog.title.position"], nil, 3, nil)
    local screenWidth, screenHeight = 4096 , 2160--math.ceil(GetScreenWidth() / 20) * 20, math.ceil(GetScreenHeight() / 20) * 20;
    position.inline = true

    position.args.xOffset = ActConfigHelper:Range(L["dialog.postion.xoffset"], nil, 1, { min = -screenWidth, max = 4 * screenWidth, step = 1, softMax = screenWidth, bigStep = 1 })
    position.args.yOffset = ActConfigHelper:Range(L["dialog.postion.yoffset"], nil, 2, { min = -screenHeight, max = 4 * screenHeight, step = 1, softMax = screenHeight, bigStep = 1 })

    display.args.position = position

    setting.args.display = display
end

function Module:CreateFrame()
    local frame = CreateFrame("FRAME", nil, UIParent)
    frame:Hide()
    frame:SetFrameStrata("HIGH")
    frame:SetToplevel(true)
    frame:SetPoint("CENTER")
    frame:SetWidth(0.0001)
    frame:SetHeight(0.0001)
    self.frame = frame
end

function Module:OnInitialize()

    self.timer = nil

    self:CreateFrame()
    self:CreateOptions()

end