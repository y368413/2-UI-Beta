local addonName, addon = ...
local L = LibStub("AceLocale-3.0"):NewLocale(addonName, "zhTW")
if not L then return end

--L["dialog.introduction"] = "功能介紹"
L["dialog.description"] = "當您在切換誓盟或專精時，將會根據下面預設的內容自動為您設置您的靈魂之絆和配裝方案。"

L["dialog.enable"] = "啟用"
L["dialog.default"] = "保持不變"

L["dialog.title.preset"] = "預設"
L["dialog.title.soulbind"] = "靈魂之絆"
L["dialog.title.equipmentset"] = "配裝方案"

L["dialog.err.invaildconfig"] = "無效的配置文件。"
L["dialog.err.invaildcovenant"] = "切換靈魂之絆時發生錯誤，無法獲取誓盟訊息。"
L["dialog.err.invaildsoulbind"] = "切換靈魂之絆時發生錯誤，無法獲取靈魂之絆訊息。"
L["dialog.err.changesoulbindfailed"] = "切換靈魂之絆時發生錯誤，切換失敗！"
L["dialog.err.activatesoulbind"] = "當前狀態下無法切換靈魂之絆。"
L["dialog.activate.soulbind"] = "當前生效靈魂之絆："

L["dialog.err.useequipmentset"] = "切換配裝方案時發生錯誤！請查看系統提示。"
L["dialog.err.invaildequipments"] = "切換配裝方案時發生錯誤，無法獲取配裝訊息。"
L["dialog.err.changeequipmentsetfailed"] = "切換配裝方案時發生錯誤，切換失敗！"
L["dialog.err.cantuseequipments"] = "當前狀態下無法切換配裝方案。"
L["dialog.activate.equipment"] = "當前生效配裝："

L["dialog.tip.changeequipmentset"] = addonName .. "檢測到您刪除了一套配裝方案。如果它是您的預設配置，請您及時前往自定義設置中更新配置，防止出錯！"

L["dialog.title.setting"] = "設置"

L["dialog.title.font"] = "文字設置"
L["dialog.font.name"] = "字體"
L["dialog.font.outline"] = "文字效果"
L["dialog.font.size"] = "文字大小"
L["dialog.font.shadow"] = "陰影效果"

L["dialog.title.display"] = "顯示設置"
L["dialog.display.time"] = "顯示時間"
L["dialog.display.delay"] = "延遲時間"

L["dialog.title.position"] = "顯示位置"
L["dialog.postion.xoffset"] = "X 偏移"
L["dialog.postion.yoffset"] = "Y 偏移"

L["dialog.title.test"] = "顯示測試文本"
L["dialog.test.name"] = "測試名稱"