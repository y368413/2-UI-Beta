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
		[603] = 4,		-- 奥杜尔，飞机头
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
				f.Text:SetText(I.InfoColor..name..I.MyColor.."\n( "..diffname.." )\n\n"..I.InfoColor.."选错副本难度了？")
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
				print("  -> "..I.InfoColor.."发现稀有！"..(name or ""))  --..tex
			end
			PlaySoundFile("Interface\\Addons\\_ShiGuang\\Media\\Sounds\\Dadongda.ogg", "Master")
			cache[id] = true
		end
	end)
end

--[[
	A tool for Krosus, need reveiwed.
]]
function module:BeamTool()
	if GetGuildInfo("player") ~= "The Carnival" then return end

	local f
	local function KrosusGo()
		if f then f:Show() return end
		f = CreateFrame("Frame", "NDui_BeamTool", UIParent)
		f:SetSize(100, 100)
		f:SetPoint("BOTTOMRIGHT", -350, 50)
		M.CreateBD(f)
		M.CreateTex(f)
		M.CreateMF(f)
		M.CreateFS(f, 14, "First Beam:", false, "TOP", 0, -5)
		f.text = M.CreateFS(f, 20, "", false, "TOP", 0, -25)

		local close = CreateFrame("Button", nil, f)
		close:SetPoint("BOTTOM")
		close:SetSize(20, 20)
		M.CreateFS(close, 14, "X")
		M.CreateGT(close, "ANCHOR_TOP", "Close", "system")
		close:SetScript("OnClick", function()
			f:Hide()
			f.text:SetText("")
		end)

		local function CreateBu(anchor, text)
			local bu = CreateFrame("Button", nil, f)
			bu:SetSize(40, 40)
			bu:SetPoint(anchor)
			M.CreateFS(bu, 20, text)
			M.CreateBD(bu, .3)
			M.CreateBC(bu)
			bu:SetScript("OnClick", function()
				f.text:SetText(text)
				if text == "左" then
					if DBMUpdateKrosusBeam then DBMUpdateKrosusBeam(true) end
					if BigWigsKrosusFirstBeamWasLeft then BigWigsKrosusFirstBeamWasLeft(true) end
					print("First beam on LEFT")
				else
					if DBMUpdateKrosusBeam then DBMUpdateKrosusBeam(false) end
					if BigWigsKrosusFirstBeamWasLeft then BigWigsKrosusFirstBeamWasLeft(false) end
					print("First beam on RIGHT")
				end
			end)
		end
		CreateBu("BOTTOMLEFT", "左")
		CreateBu("BOTTOMRIGHT", "右")
	end

	SlashCmdList["NDUI_BEAMTOOL"] = function() KrosusGo() end
	SLASH_NDUI_BEAMTOOL1 = "/kro"
end