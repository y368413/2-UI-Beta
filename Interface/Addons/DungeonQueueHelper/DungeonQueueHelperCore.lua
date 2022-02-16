local addon_name, addon = ...
--导出
local DungeonQueueHelperCore = {}
addon.DungeonQueueHelperCore = DungeonQueueHelperCore



--排本
--https://bbs.nga.cn/read.php?&tid=20359841
function DungeonQueueHelperCore:StartQueue (typeName)
	LFDMicroButton:Click() --打开排随机的ui
	PVEFrameTab1:Click() --选择第一个tab
	GroupFinderFrameGroupButton1:Click() --选择地下城查找器
	LFDQueueFrameTypeDropDownButton:Click()

	if typeName == DropDownList1Button2:GetText() then
		DropDownList1Button2:Click()
		LFDQueueFrameFindGroupButton:Click()
		PVEFrameCloseButton:Click()
		return true
	else
		return false
	end
end


--点击进本按钮
function DungeonQueueHelperCore:ClickLFDEnter ()
	if LFGDungeonReadyDialog:IsVisible() then
		LFGDungeonReadyDialogEnterDungeonButton:Click()
	end
end

--查询某副本是否击杀

 

--获取当前角色id，基于天
function DungeonQueueHelperCore:RoleDayUUID()
	local uuid = UnitGUID("player") .. "_" .. UnitName("player") .. "_" .. date("%y%m%d")
	return uuid
end