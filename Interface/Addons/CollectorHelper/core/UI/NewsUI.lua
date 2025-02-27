local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}


function CollectorHelper:InitNews()
    if settings.version ~= self.db.version then
        settings.version = self.db.version
        if settings.autoShowNews == true then
            self:ShowNews()
        end
    end
end


function CollectorHelper:ShowNews()
    if self.newsFrame == nil then
        self.newsFrame = self:frameBuilder({
            frameName = "CollectorHelper_News",
            parent = UIParent,
            width = 450,
            height = 450,
            point = {
                pos = "CENTER",
                x = 0,
                y = 0,
            },
            titleBuilder = {
                text = self:textCFormat(COLORS.yellow, "CollectorHelper Changelog - News"),
                point = {
                    pos = "TOP",
                    x = 0,
                    y = -8,
                }
            }
        })

        local checkbox = CreateFrame("CheckButton", nil, self.newsFrame, "InterfaceOptionsCheckButtonTemplate")
        checkbox:SetPoint("BOTTOMLEFT", 7, 7)
        checkbox.Text:SetText("Auto Open on New Changes")
        checkbox:SetChecked(settings.autoShowNews)

        local function OnCheckboxClick(self)
            if self:GetChecked() then
                settings.autoShowNews = true
                -- Code to enable the feature
                print("Feature Enabled")
            else
                settings.autoShowNews = false
                -- Code to disable the feature
                print("Feature Disabled")
            end
        end
        checkbox:SetScript("OnClick", OnCheckboxClick)

        self.newsFrame:SetMovable(true)
        self.newsFrame:EnableMouse(true)
        self.newsFrame:RegisterForDrag("LeftButton")
        self.newsFrame:SetScript("OnDragStart", self.newsFrame.StartMoving)
        self.newsFrame:SetScript("OnDragStop", self.newsFrame.StopMovingOrSizing)

        -- Close button for AH frame
        self:buttonBuilder({
            buttonName = "Collector_NewsCloseButton",
            parent = self.newsFrame,
            text = "Close",
            width = 100,
            height = 22,
            point = {
                pos = "BOTTOM",
                x = 0,
                y = 8,
            },
            onClickScript = function(_, button)
                if button == "LeftButton" then
                    self.newsFrame:Hide()
                end
            end
        })
        self:fontBuilder({
            parent = self.newsFrame,
            text = self:textCFormat(COLORS.yellow, "Made By Skarlex"),
            point = {
                pos = "BOTTOM",
                x = 150,
                y = 13,
            }
        })

        -- Create a scroll frame
        self.scrollFrame = CreateFrame("ScrollFrame", nil, self.newsFrame, "UIPanelScrollFrameTemplate")
        self.scrollFrame:SetPoint("TOPLEFT", self.newsFrame, "TOPLEFT", 10, -30)
        self.scrollFrame:SetPoint("BOTTOMRIGHT", self.newsFrame, "BOTTOMRIGHT", -30, 40)

        -- Create a content frame
        self.contentFrame = self:frameBuilder({
            frameName = "CollectorHelper_NewsContent",
            parent = self.scrollFrame,
            width = 430,
            height = 400,
            point = {
                pos = "CENTER",
                x = 0,
                y = 0,
            }
        })
        self.contentFrame:SetBackdropColor(0.1, 0.1, 0.1, 1)
        self.scrollFrame:SetScrollChild(self.contentFrame)

        -- Populate the content frame with news
        local offset = -10
        for _, version in ipairs(self.db.news) do
            local versionText = self.contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            versionText:SetPoint("TOPLEFT", self.contentFrame, "TOPLEFT", 10, offset)
            versionText:SetWidth(400)
            versionText:SetJustifyH("LEFT")
            versionText:SetText(version[1])
            offset = offset - versionText:GetHeight() - 10

            for i = 2, #version do
                local newsText = self.contentFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                newsText:SetPoint("TOPLEFT", self.contentFrame, "TOPLEFT", 20, offset)
                newsText:SetWidth(400)
                newsText:SetJustifyH("LEFT")
                newsText:SetText(version[i])
                offset = offset - newsText:GetHeight() - 5
            end
            offset = offset - 10
        end

        self.contentFrame:SetHeight(math.abs(offset))

        self.scrollFrame:UpdateScrollChildRect()
        self. scrollFrame:SetVerticalScroll(0)
        self.scrollFrame:SetScript("OnShow", function(self)
            self:SetVerticalScroll(0)
        end)
    else
        self.newsFrame:Show()
    end
end
