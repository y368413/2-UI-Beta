local _, T = ...

-- See https://www.townlong-yak.com/addons/master-plan/localization
local C, z, V, K = GetLocale(), nil
V =
    C == "zhCN" and { -- 136/136 (100%)
      "%.1f 队伍 / %.1f 任务", "激活%d", "已招募追随者%d", "总计%d", "%d |4队伍:队伍;", "%d |4任务:任务;", "%d 队伍剩余…", "%d/%d 进行任务完成", "%d时 %d分", "%s 经验",
      "获得 %s 经验", "%s 经验/时", "%s不是任一值得关注任务所需要的。", "%s是以下值得关注任务所需要的。", "%sk", "（+%d 未激活追随者）", "（有 %d）", "*", "+ %d 其它任务", "+%d 未激活（按 Alt 查看）",
      "预计 +%s 经验", "技能可被重新训练。", "已激活任务（%d）", "任务奖励将以邮件形式发送。", "当前全部特长是所需的。", "受影响数量", "当此追随者达到史诗品质时解锁一个附加随机技能。", "护甲等级：", "可用任务（%d）", "可用；期限：%s",
      "平均：", "最佳改善：", "比 %s 玩家更好（基于 %s 不确定的任务）。", "可以应对：", "成功几率", "角色已被添加到与交互时指挥台和要塞缓存列表。", "清除暂选队伍", "清除全部暂选队伍。", "点击查看升级选项", "全部完成",
      "完成队伍", "计算中，请稍后。", "考虑未激活追随者", "重新训练后可能反制：", "可以改善队伍：", "反制和特长组合", "当前应对：", "可取的奖励", "完成", "重复应对",
      "史诗技能", "预计奖励：", "专业船长", "期限：", "失败", "追随者概况", "追随者经验", "每小时追随者经验", "追随者激活此专长：", "有此专长的追随者：",
      "从海军任务：", "未来任务#%d", "队伍建议将被更新，以包括所选择的追随者。", "空闲", "空闲（满级）", "空闲舰船", "忽略", "已忽略", "已忽略追随者不包含在值得关注任务组中。", "忽略未激活追随者",
      "改善 %s |4值得关注任务:值得关注任务;。", "在预设队伍中", "未激活追随者将不会包含在建议队伍中。", "未激活追随者当有用时将只包含在建议队伍中。", "未激活追随者：", "立即", "上次下单：%s 前", "上次招募：%s 之前", "升级到史诗：", "幸运",
      "任务时间", "任务期限", "任务等级", "任务排序：", "值得关注任务", "最多队伍：", "最多任务：", "无进行任务", "没有可用组合", "无物品奖励。",
      "没有已完成任务可超过超过货币上限，与%s设置冲突。", "当前可知没有其它角色。", "没有舰船设备可以应对。", "当前专长没有用处。", "其它角色", "潜在应对能力：", "预计奖励优先", "成功几率优先", "种族", "就绪",
      "冗余", "多余的追随者：", "需要货币奖励", "%s |4值得关注任务:值得关注任务;所需。", "重新训练史诗：", "重新训练：", "奖励类型", "奖励：%s 经验", "选择一个重点追随者", "选择需要安装的设备",
      "选择需要替换的设备", "派遣暂选队伍", "设置暂选队伍", "已忽略", "开始任务", "统计", "成功", "建议队伍", "推荐组合", "时间跨度",
      "距离下次希望能够与要塞任务进行交互的时间。\n\n这可能会影响建议的队伍和任务排序顺序。", "临时忽略浪费货币和跳过完成任务，右击按钮，或点击以下单独任务按钮。", "取消忽略", "重选独特技能：", "可升级组件", "可用于|cffffffff%d 激活追随者:激活追随者;|r升级。", "在可用 %s 队伍于 %s 值得关注任务。", "武器等级：", "当一个任务奖励可提高追随者特长，队伍可以优先或预计奖励或任务的成功几率。", "背包里没有此物品。",
      "你没有追随者应对这种威胁。", "没有追随者激活这个专长。", "追随者没有重复的应对组合。", "无有此专长的追随者。", "你没有多余的背包空间。", "可能替换这些特长：",
    }
    or C == "zhTW" and { -- 136/136 (100%)
      "%.1f 隊伍 / %.1f 任務", "任用%d", "招募的追隨者%d", "總計%d", "%d |4隊伍:隊伍;", "%d |4任務:任務;", "%d 隊伍出發中...", "%d/%d執行任務完成", "%d小時 %d分", "%s 經驗值",
      "獲得 %s 經驗值", "%s 每小時經驗值", "%s不是任何一個重點任務所需要的。", "%s是以下重點任務所需要的。", "%sk", "(+%d 停用追隨者)", "(有 %d)", "*", "+ %d 其他任務", "+%d 停用的(按下Alt來觀看)",
      "經驗期望值: %s", "技能可被重新訓練。", "正在進行(%s)", "額外的任務獎勵可能會透過郵件寄送", "目前全部特長都是所需的。", "受影響的數額", "在追隨者達到史詩等級後將解鎖一個額外的隨機技能", "護甲等級：", "可執行的任務(%d)", "可用的；%s後到期",
      "平均:", "最佳改善:", "比 %s 玩家更好(基於 %s 不確定的任務)。", "反制於：", "成功機率", "角色已被加入列表當與指揮桌或要塞快取交互作用時。", "清除暫定隊伍", "取消所有暫定隊伍", "點擊檢視升級選項", "全部完成",
      "完成隊伍", "計算中，請稍候。", "考慮到停用的追隨者", "重新訓練後可以反制：", "可以改善的隊伍:", "計能與特長組合", "目前的反制:", "理想的獎勵", "完成", "重複技能",
      "第二技能", "預計獎勵：", "精英船長", "期限：", "失敗", "追隨者概況", "追隨者經驗值", "每小時經驗值", "啟用此特長的追隨者：", "有此特長的追隨者:",
      "從船艦任務：", "未來任務 #%d", "隊伍建議將根據被選擇的追隨者作更新。", "閒置", "閒置(最高等級)", "閒置船艦", "忽略", "已忽略", "已忽略的追隨者不會包含在重點任務隊伍中。", "忽略停用的追隨者",
      "改善 %s |4重點任務:重點任務;", "在暫定隊伍中", "停用的追隨者決不會包含在建議隊伍中。", "只有當停用的追隨者有益時才會包含在建議隊伍。", "停用的追隨者：", "馬上", "最後完成：%s前", "上次招募：%s 之前", "提升等級到史詩:", "幸運",
      "任務持續時間", "任務期限", "任務等級", "任務排序:", "重點任務", "最多隊伍:", "最多任務:", "無執行任務", "沒有可用的組合", "沒獲得戰利品。",
      "沒有不超過貨幣上限的任務可完成，違反 %s 的設置。", "沒有其他已知角色。", "沒有船艦有此裝備可以應對。", "目前的特長沒有用處。", "其他角色", "可能反制：", "預期獎勵優先", "成功機率優先", "種族", "完成",
      "冗餘", "多餘的追隨者：", "需要貨幣獎勵", "有需求在 %s |4重點任務:重點任務;。", "史詩重新訓練:", "重新訓練:", "獎勵類型", "獎勵: %s 經驗值", "選擇一個重點追隨者", "選擇裝備來安裝",
      "選擇裝備來替換", "派出所有暫定隊伍", "設置暫定隊伍", "略過", "開始任務", "統計", "成功", "建議隊伍", "建議的隊伍", "時間範圍",
      "距離你下次能回來與指派要塞任務的時間。\n\n這可能會改變建議的隊伍和任務排序。", "若要暫時忽略浪費的貨幣並完成略過的任務，用滑鼠右鍵點擊此按鈕，或左鍵點擊以下個別的任務。", "解除忽略", "非重複組合機會:", "升級裝備", "有可用的升級在|cffffffff%d 任用追隨者|r:任用追隨者;|r。", "%s重點任務有%s可用隊伍。", "武器等級：", "當任務獎勵可因追隨者特長而增長，隊伍可以優先考慮預期獎勵或任務成功機率。", "您的背包中沒這個東西。",
      "你沒有追隨者能反制此威脅", "你沒有啟用此特長的追隨者。", "您沒有重複技能組合的追隨者。", "你沒有追隨者具備此特長", "你的背包沒有足夠的空間", "或可替換這些特長：",
    } or nil

K = V and {
      "%.1f groups / %.1f missions", "%d active", "%d followers recruited", "%d total", "%d |4group:groups;", "%d |4mission:missions;", "%d |4party:parties; remaining...", "%d/%d active missions complete", "%dh %dm", "%s XP",
      "%s XP gained", "%s XP/h", "%s is not required by any Missions of Interest.", "%s is required by the following Missions of Interest.", "%sk", "(+%d inactive followers)", "(have %d)", "*", "+ %d other missions", "+%d Inactive (hold ALT to view)",
      "+%s experience expected", "Abilities may be retrained.", "Active Missions (%d)", "Additional mission loot may be delivered via mail.", "All current traits are required.", "Amount affected by", "An additional random ability is unlocked when this follower reaches epic quality.", "Armor levels:", "Available Missions (%d)", "Available; expires in %s",
      "Average:", "Best Improvement:", "Better than %s of players (based on %s uncertain missions).", "Can be countered by:", "Chance of success", "Characters are added to this list when they interact with the Command Table or Garrison Cache.", "Clear Tentative Parties", "Clear all tentative parties.", "Click to view upgrade options", "Complete All",
      "Complete party", "Computing, please wait.", "Considering inactive followers", "Could be countered by re-rolling:", "Could improve groups for:", "Counter and Trait Combinations", "Current counters:", "Desirable rewards", "Done", "Duplicate counters",
      "Epic Ability", "Expected rewards:", "Expert Captain", "Expires in:", "Failed", "Follower Summary", "Follower experience", "Follower experience per hour", "Followers activating this trait:", "Followers with this trait:",
      "From Naval Missions:", "Future Mission #%d", "Group suggestions will be updated to include the selected follower.", "Idle", "Idle (max-level)", "Idle ships", "Ignore", "Ignored", "Ignored followers are not included in Missions of Interest groups.", "Ignoring inactive followers",
      "Improves %s |4Mission of Interest:Missions of Interest;.", "In Tentative Party", "Inactive followers are never included in suggested groups.", "Inactive followers are only included in suggested groups when they are beneficial.", "Inactive followers:", "Instant", "Last offered: %s ago", "Last recruited: %s ago", "Levelled to Epic:", "Luck",
      "Mission duration", "Mission expiration", "Mission level", "Mission order:", "Missions of Interest", "Most Groups:", "Most Missions:", "No active missions", "No groups available", "No loot received.",
      "No missions could be completed without exceeding currency caps, violating the %s setting.", "No other characters are currently known.", "No ships are equipped to handle this mechanic.", "Not useful with current traits.", "Other Characters", "Potential counters:", "Prioritizing expected reward", "Prioritizing success chance", "Races", "Ready",
      "Redundant", "Redundant followers:", "Require Currency Reward", "Required by %s |4Mission of Interest:Missions of Interest;.", "Retraining at Epic:", "Retraining:", "Reward type", "Reward: %s XP", "Select a follower to focus on", "Select equipment to install",
      "Select equipment to replace", "Send Tentative Parties", "Set tentative party", "Skipped", "Start Missions", "Statistics", "Success", "Suggested group", "Suggested groups", "Time Horizon",
      "Time until you next expect to be able to interact with garrison missions.\n\nThis may affect suggested groups and mission sorting order.", "To temporarily ignore wasted currency and complete the skipped missions, right-click this button, or left-click individual missions below.", "Unignore", "Unique ability rerolls:", "Upgradable gear", "Upgrades are available for |cffffffff%d |4active follower:active followers;|r.", "Usable in %s groups for %s Missions of Interest.", "Weapon levels:", "When a mission's reward can be increased by follower traits, groups can prioritize either the expected reward or mission success chance.", "You do not have this in your bags.",
      "You have no followers to counter this mechanic.", "You have no followers who activate this trait.", "You have no followers with duplicate counter combinations.", "You have no followers with this trait.", "You have no free bag slots.", "You may replace these traits:",
}

local L = K and {}
for i=1,K and #K or 0 do
	L[K[i]] = V[i]
end

T.L = L or nil