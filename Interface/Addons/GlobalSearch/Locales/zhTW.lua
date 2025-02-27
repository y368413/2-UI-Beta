local L = LibStub("AceLocale-3.0"):NewLocale("GlobalSearch", "zhTW")
if not L then return end

L["achievements_search_provider_desc"] = "列出所有成就。包括已獲得、未獲得、階段性成就在 UI 中尚不可見的後續成就、或未完成的隱藏成就。"
--[[Translation missing --]]
--[[ L["appearance"] = "Appearance"--]] 
L["bags"] = "背包"
L["bags_search_provider_desc"] = "列出所有背包中可用的物品。"
L["boss_from_instance"] = "%s (%s)"
--[[Translation missing --]]
--[[ L["bosses"] = "Bosses"--]] 
L["building_achievement_cache"] = "正在建立快取，通常會在 15 秒內完成。在這個操作完成之前，畫面幀數會受到影響。"
L["calendar"] = "行事曆"
--[[Translation missing --]]
--[[ L["clear_recent_items"] = "Clear Recent Items"--]] 
--[[Translation missing --]]
--[[ L["does_show_keybind_toggle"] = "Keybind Hides When Shown"--]] 
--[[Translation missing --]]
--[[ L["does_show_keybind_toggle_desc"] = "When the search bar is shown, the show keybind will instead hide the search bar."--]] 
--[[Translation missing --]]
--[[ L["done"] = "Done"--]] 
L["dungeon_difficulty_x"] = "地城副本難度：%s"
L["emotes"] = "表情"
--[[Translation missing --]]
--[[ L["enabled_map_types"] = "Enabled Map Types"--]] 
L["enabled_providers"] = "列表來源"
L["encounter_journal_search_provider_desc"] = "列出地城手冊裡所有的副本和首領。"
L["equipment_sets"] = "裝備管理員"
--[[Translation missing --]]
--[[ L["font"] = "Font"--]] 
--[[Translation missing --]]
--[[ L["frame_strata"] = "Frame Strata"--]] 
--[[Translation missing --]]
--[[ L["global_search"] = "GlobalSearch"--]] 
L["guilds_and_communities"] = "公會和社群"
--[[Translation missing --]]
--[[ L["height"] = "Height"--]] 
--[[Translation missing --]]
--[[ L["help_text_font"] = "Help Text Font"--]] 
--[[Translation missing --]]
--[[ L["hyperlink"] = "Hyperlink"--]] 
--[[Translation missing --]]
--[[ L["instance_options_search_provider_desc"] = "Provides dungeon/raid difficulty controls."--]] 
--[[Translation missing --]]
--[[ L["instance_types"] = "Instance Types"--]] 
--[[Translation missing --]]
--[[ L["instances"] = "Instances"--]] 
--[[Translation missing --]]
--[[ L["interface_options_search_provider_desc"] = "Provides all options in Game Menu > Interface > Game. Selecting an option will open its options tab."--]] 
--[[Translation missing --]]
--[[ L["item_types"] = "Item Types"--]] 
--[[Translation missing --]]
--[[ L["keybinding_help"] = [=[Close: %s
Select Item: ENTER
Link Item in Chat: %s
Previous Item: %s
Next Item: %s
Previous Page: %s
Next Page: %s]=]--]] 
--[[Translation missing --]]
--[[ L["keybinding_in_use"] = "Keybinding %s is already in use by GlobalSearch."--]] 
--[[Translation missing --]]
--[[ L["legacy_raid_difficulty_x"] = "Legacy Raid Difficulty: %s"--]] 
--[[Translation missing --]]
--[[ L["list_floors_separately"] = "List Floors Separately"--]] 
--[[Translation missing --]]
--[[ L["map_with_floor"] = "%s: %s"--]] 
--[[Translation missing --]]
--[[ L["maps"] = "Maps"--]] 
L["minimap_tracking"] = "小地圖追蹤"
--[[Translation missing --]]
--[[ L["monochrome"] = "Monochrome"--]] 
--[[Translation missing --]]
--[[ L["mounts_search_provider_desc"] = "Provides all known mounts."--]] 
--[[Translation missing --]]
--[[ L["none"] = "None"--]] 
L["not_bound"] = "未綁定"
--[[Translation missing --]]
--[[ L["number_of_recent_items"] = "Number of Recent Items"--]] 
--[[Translation missing --]]
--[[ L["outline"] = "Outline"--]] 
L["page_x_of_x"] = [=[第 %d/%d 頁

]=]
--[[Translation missing --]]
--[[ L["pets_search_provider_desc"] = "Provides all known pets."--]] 
--[[Translation missing --]]
--[[ L["position"] = "Position"--]] 
--[[Translation missing --]]
--[[ L["preload_cache"] = "Preload Cache"--]] 
L["preload_cache_delay_sec"] = "預載快取延遲（秒）"
--[[Translation missing --]]
--[[ L["preload_cache_delay_sec_desc"] = "Delay after login in seconds before preloading the cache."--]] 
--[[Translation missing --]]
--[[ L["preload_cache_desc"] = "The item cache will be slowly built up in the background after logging in. This stops the game from freezing for a second when opening the search for the first time in most cases."--]] 
L["provider_options"] = "列表選項"
L["raid_difficulty_x"] = "團隊副本難度：%s"
L["rebuild_cache"] = "重建快取"
--[[Translation missing --]]
--[[ L["remove_from_recent_items"] = "Remove from Recent Items"--]] 
--[[Translation missing --]]
--[[ L["results_per_page"] = "Results per Page"--]] 
L["select_next_item"] = "選擇下一項"
--[[Translation missing --]]
--[[ L["select_next_page"] = "Select Next Page"--]] 
L["select_previous_item"] = "選擇上一項"
--[[Translation missing --]]
--[[ L["select_previous_page"] = "Select Previous Page"--]] 
--[[Translation missing --]]
--[[ L["show_help"] = "Show Help"--]] 
--[[Translation missing --]]
--[[ L["show_help_desc"] = "If enabled, the GlobalSearch keybindings will be shown when the search has no results."--]] 
L["show_mouseover_tooltip"] = "顯示浮動提示資訊"
--[[Translation missing --]]
--[[ L["show_mouseover_tooltip_desc"] = "If enabled, mousing over a search result will show the tooltip for the item under the cursor rather than the selected item."--]] 
--[[Translation missing --]]
--[[ L["size"] = "Size"--]] 
L["slash_commands"] = "斜槓指令"
--[[Translation missing --]]
--[[ L["slash_commands_search_provider_desc"] = "Provides all slash commands. When a command is selected, it will be run as is with no arguments. It is not possible to pass any arguments to the command when running it through GlobalSearch."--]] 
--[[Translation missing --]]
--[[ L["spells_search_provider_desc"] = "Provides all usable spells."--]] 
L["system_options"] = "系統選項"
L["system_options_search_provider_desc"] = "列出遊戲選項中的所有選項。"
--[[Translation missing --]]
--[[ L["task_queue_time_allocation_ms"] = "Task Queue Time Allocation (ms)"--]] 
--[[Translation missing --]]
--[[ L["task_queue_time_allocation_ms_desc"] = "Maximum amount of time per frame in milliseconds that can be spent on background tasks, such as building caches."--]] 
--[[Translation missing --]]
--[[ L["thick"] = "Thick"--]] 
--[[Translation missing --]]
--[[ L["thin"] = "Thin"--]] 
--[[Translation missing --]]
--[[ L["tooltip_font"] = "Tooltip Font"--]] 
L["toys"] = "玩具"
L["toys_search_provider_desc"] = "列出所有已知玩具。"
--[[Translation missing --]]
--[[ L["ui_panels"] = "UI Panels"--]] 
--[[Translation missing --]]
--[[ L["ui_panels_search_provider_desc"] = "Provides various UI panels from the base UI."--]] 
--[[Translation missing --]]
--[[ L["uncategorized"] = "Uncategorized"--]] 
--[[Translation missing --]]
--[[ L["width"] = "Width"--]] 
L["x_is_disabled"] = "已禁用 %s。"
L["x_is_enabled"] = "已啟用 %s。"
--[[Translation missing --]]
--[[ L["x_items_removed"] = "%d items removed."--]] 
--[[Translation missing --]]
--[[ L["x_offset_from_center"] = "X Offset from Center"--]] 
--[[Translation missing --]]
--[[ L["y_offset_from_top"] = "Y Offset from Top"--]] 

