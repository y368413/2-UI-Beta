local M, R, U, I = unpack(select(2, ...))
local module = MaoRUI:GetModule("Misc")

--[[
	SoloInfo是一个告知你当前副本难度的小工具，防止我有时候单刷时进错难度了。
	instList左侧是副本ID，你可以使用"/getid"命令来获取当前副本的ID；右侧的是副本难度，常用的一般是：2为5H，4为25普通，6为25H。
]]
function module:SoloInfo()
	if not MaoRUISettingDB["Misc"]["SoloInfo"] then return end

	local instList = {
		[556] = 2,		-- 塞塔克大厅，乌鸦
		[575] = 2,		-- 乌特加德之巅，蓝龙
		[585] = 2,		-- 魔导师平台，白鸡
		--[603] = 4,		-- 奥杜尔，飞机头
		[631] = 6,		-- 冰冠堡垒，无敌
	}

	local f = MaoRUI:EventFrame({"ZONE_CHANGED_NEW_AREA", "PLAYER_DIFFICULTY_CHANGED", "PLAYER_ENTERING_WORLD"})
	f:SetPoint("CENTER", UIParent, "CENTER", 0, 120)
	f:SetSize(150, 70)
	f:Hide()
	M.CreateBD(f)
	M.CreateTex(f)
	f.Text = M.CreateFS(f, 12, "")
	f.Text:SetWordWrap(true)

	f:SetScript("OnEvent", function()
		local name, _, instType, diffname, _, _, _, id = GetInstanceInfo()
		if IsInInstance() and instType ~= 24 then
			if instList[id] and instList[id] ~= instType then
				f:Show()
				f.Text:SetText(I.InfoColor..name..I.MyColor.."\n( "..diffname.." )\n\n"..I.InfoColor.."^-^")
			else
				f:Hide()
			end
		else
			f:Hide()
		end
	end)
	f:SetScript("OnMouseUp", function() f:Hide() end)
end

--[[
	发现稀有/事件时的通报插件
]]
function module:RareAlert()
	if not MaoRUISettingDB["Misc"]["RareAlerter"] then return end

	local cache = {}
	MaoRUI:EventFrame("VIGNETTE_ADDED"):SetScript("OnEvent", function(_, _, id)
		if id and not cache[id] then
			local _, _, name, icon = C_Vignettes.GetVignetteInfoFromInstanceID(id)
			local left, right, top, bottom = GetObjectIconTextureCoords(icon)
			local tex = "|TInterface\\Minimap\\ObjectIconsAtlas:0:0:0:0:256:256:"..(left*256)..":"..(right*256)..":"..(top*256)..":"..(bottom*256).."|t"
			--UIErrorsFrame:AddMessage("----------   "..I.InfoColor..tex..(name or "").."   ----------")
			RaidNotice_AddMessage(RaidWarningFrame, "----------   "..(name or "").."   ----------", ChatTypeInfo["RAID_WARNING"])  --..tex
			if MaoRUISettingDB["Misc"]["AlertinChat"] then
				print("  -> "..I.InfoColor.." → "..(name or ""))  --..tex
			end
			PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\Dadongda.ogg", "Master")
			cache[id] = true
		end
	end)
end