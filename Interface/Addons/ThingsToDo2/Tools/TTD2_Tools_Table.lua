if(ThingsToDo2 == nil) then
	ThingsToDo2 = {}
end
local TTD2 = ThingsToDo2

--[[
]]

TTD2.Tools.Table = {}
local this = TTD2.Tools.Table

function this:Contains(t, x)
	for k,v in pairs(t) do
		if(v == x) then
			return true
		end
	end
	
	return false
end

function this:GetNumEntries(t)
	local Count = 0
	for _ in pairs(t) do
		Count = Count + 1
	end
	return Count
end

function this:IsEmpty(t)
	if(next(t) == nil) then
		return true
	end
	return false
end

function this:Clear(t)
	for k in pairs(t) do
		t[k] = nil
	end
	return
end

function this:Append(t, x)
	t[#t + 1] = x
	return
end

function this:Remove(t, x)
	for k,v in pairs(t) do
		if(v == x) then
			t[k] = nil
			return true
		end
	end
	return false
end
