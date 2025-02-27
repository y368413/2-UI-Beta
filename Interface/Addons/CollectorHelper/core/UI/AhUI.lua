local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")
local COLORS = CollectorHelper.COLORS or {}

-- =========================================================================
-- AH frame
-- =========================================================================
function CollectorHelper:InitAHUI()
    -- Merchant frame AH extension
    self.ahFrame = self:frameBuilder({
        frameName = "CollectorHelper_MerchantSource_AH",
        parent = UIParent,
        width = 330,
        height = 400,
        point = {
            pos = "CENTER",
            x = 0,
            y = 0,
        },
        titleBuilder = {
            text = self:textCFormat(COLORS.yellow, "Collector Ah List"),
            point = {
                pos = "TOP",
                x = 0,
                y = -8,
            }
        }
    })

    -- Make the frame movable
    self.ahFrame:SetMovable(true)
    self.ahFrame:EnableMouse(true)
    self.ahFrame:RegisterForDrag("LeftButton")
    self.ahFrame:SetScript("OnDragStart", self.ahFrame.StartMoving)
    self.ahFrame:SetScript("OnDragStop", self.ahFrame.StopMovingOrSizing)

    self.ahFrame:Hide()

    -- Scrollable content for AH list
    self.ahScrollableContent = self:CreateScrollableContent({
        parent = self.ahFrame,
        width = 250,
        xwidth = 280,
        height = 320,
        xpos = 25,
        point = {
            pos = "TOPLEFT",
            x = 15,
            y = -37,
        }
    })

    -- Close button for AH frame
    self:buttonBuilder({
        buttonName = "Collector_MAHCloseButton",
        parent = self.ahFrame,
        text = "Close",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOMRIGHT",
            x = -13,
            y = 8,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                self.ahFrame:Hide()
            end
        end
    })

    -- Clear list button for AH frame
    self:buttonBuilder({
        buttonName = "Collector_MAHClearButton",
        parent = self.ahFrame,
        text = "Clear List",
        width = 100,
        height = 22,
        point = {
            pos = "BOTTOMLEFT",
            x = 13,
            y = 8,
        },
        onClickScript = function(_, button)
            if button == "LeftButton" then
                self.db.ahItems = {}
                self.ahScrollableContent.UpdateRows(self.db.ahItems)
            end
        end
    })
end
