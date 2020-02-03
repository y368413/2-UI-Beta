local o = mOnWardrobe
if o.strings == nil then o.strings = {} end
local s = o.strings

for k,v in pairs({["Cloth"]=LE_ITEM_ARMOR_CLOTH,["Leather"]=LE_ITEM_ARMOR_LEATHER,["Mail"]=LE_ITEM_ARMOR_MAIL,["Plate"]=LE_ITEM_ARMOR_PLATE}) do
	s[k] = GetItemSubClassInfo(LE_ITEM_CLASS_ARMOR,v);
end

s["Page N"] = _G["PAGE_NUMBER"]
s["Progress"] = _G["PVP_PROGRESS_REWARDS_HEADER"]
s["Weapons"] = _G["AUCTION_CATEGORY_WEAPONS"]
s["Help"] = _G["HELP_LABEL"]
s["Yes"] = _G["YES"]
s["No"] = _G["NO"]
s["General"] = _G["GENERAL"]
s["Close"] = _G["CLOSE"]
s["Defaults"] = _G["DEFAULTS"]
s["Options"] = _G["OPTIONS"]
s["Instance"] = _G["INSTANCE"]
s["Other"] = _G["OTHER"]
s["Unknown"] = _G["UNKNOWN"]