local CollectorHelper = LibStub("AceAddon-3.0"):GetAddon("CollectorHelper")

function CollectorHelper:InitNewsData()
    self.db.news = {
        {
            "##2.0.6",
            "- Fixed recipe learn merchant button for multiple pages"
        },
        {
            "##2.0.5",
            "- Added addon panel see '/ch options' command"
        },
        {
            "## 2.0.4",
            "- Updated merchant learn button for recipes"
        },
        {
            "## 2.0.3",
            "- Added Zul'Grurub recipes"
        },
        {
            "## 2.0.2",
            "- Added auto sync recipe on learn"
        },
        {
            "## 2.0.1",
            "- Main frame & scroll rows visual update"
        },
        {
            "## 2.0.0",
            "- Added ace3 lib.",
            "- Refactored code structure.",
            "- Code & memory optimisations",
            "- Updated merchant main UI",
            "- Added recipe sync & display on main frame",
        },
        {
            "## 1.7.2",
            "- Removed the automatic opening of recipe sync when vendor gossip is opened.",
            "- Added a Sync Recipe button to the merchant frame."
        },
        {
            "## 1.7.1",
            "Fixed nil error when primary profession not learned"
        },
        {
            "## 1.7.0",
            "- Redesigned the initial recipe check logic has been added in 1.6.0",
            "- Added recipe sync for primary professions and cooking, along with the display of total recipes and collected ones.",
            "- Added /ch recipe command",
            "- There may be issues with the recipe check.",
            "- Any issues or suggestions can be added in the CurseForge addon comment section."
        },
        {
            "## 1.6.0",
            "- Added support for recipes character based",
            "- Added recipes db until < 11.0.7"
        },
        {
            "## V1.5.9",
            "- Interface update"
        },
        {
            "## V1.5.8",
            "- Code update"
        },
        {
            "## V1.5.7",
            "- Interface update for new patch"
        },
        {
            "## V1.5.6",
            "- Fixed frame cost"
        },
        {
            "## V1.5.5",
            "- Fixed settings migration",
            "- Added lfr completion mark",
            "- Added option to block news autoshow on changes"
        },
        {
            "## V1.5.2",
            "- Fixed lfr check on history data from previous week"
        },
        {
            "## V1.5.0",
            "- Added Changelog frame",
            "- Code optimisations",
            "- Removed Equip button from boe items",
            "- Added Destroy button to boe items",
            "- Split functions into independent modules",
            "- Updated command list & display",
            "- Added LFR helper",
            "   1. Display shorter name on LFR option",
            "   2. Added tooltip with bosses in wing",
            "   3. Added track killed/total",
            "   4. Added color change for in progress",
            "   5. Added finished mark for LFR wing",
            "   6. Added support up to Shadowlands"
        },
        {
            "## V1.4.4",
            "- Added sell button for boe merchant items (warband collect faster)"
        },
        {
            "## V1.4.3",
            "- The War Within patch 11.0 supported."
        },
        {
            "## V1.4.2",
            "- Fixed buttons overlap on classic interface",
            "- Shorter button names"
        },
        {
            "## V1.4",
            "- Dynamic Row Item Recycling in Scroll View (performance)",
            "- Dynamic Scrollbar Visibility (UI look)",
            "- Updated cost frame display with buttons like type and highlight on hover",
            "- Added currency chat link on click",
            "- Updated UI",
            "- Changed buy all button for all pages",
            "- Changed cost/page to total merchant cost",
            "- Added AH window support for currency items that can be bought from AH",
            "- Command support",
            "- Support for ElvUI Shadow & Light default merchant view",
            "- Support for ElvUI Shadow & Light default merchant view as list"
        },
        {
            "## V1.3",
            "- Code update",
            "- Added toggle button for cost frame",
            "- Updated cost frame with list of items + tooltips"
        },
        {
            "## V1.2",
            "- Added ElvUI skin helper",
            "- Fixed transmog item sources from CanIMogIt solution",
            "- Frame/buttons better handle",
            "- Added BoE vendor items in bag with equip button from merchant item",
            "- Fixed equip button with skip confirmation",
            "- Added addon logo texture"
        },
        {
            "## V1.1",
            "- Money frame hide added",
            "- Pet filter added",
            "- Fix Miscellaneous for some items",
            "- Added required/current currency - percentage to collect display",
            "- Added show/hide collected button from merchant",
            "- Added handle for gold items",
            "- Fixed money / alter currency both visible on merchant",
            "- Fixed strange way API handles some items for transmog"
        },
        {
            "## V1.0",
            "Initial Release"
        }
    }
end
