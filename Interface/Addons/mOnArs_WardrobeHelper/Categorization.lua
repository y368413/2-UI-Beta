local o = mOnWardrobe

o.categorization = {};
o.EXPS  = {};
o.PARTY = {'Dungeon', 'Raid'};

local numTiers = EJ_GetNumTiers();
for i=1,numTiers do
	local tierName = EJ_GetTierInfo(i);
	table.insert(o.EXPS,tierName);

	EJ_SelectTier(i);

	local index,showRaid=1,false;
	local instanceID, name = EJ_GetInstanceByIndex(index, showRaid);
	while instanceID do
		o.categorization[name] = {i, showRaid and 2 or 1, instanceID};
		index = index + 1;
		instanceID, name = EJ_GetInstanceByIndex(index, showRaid);
		if not instanceID and not showRaid then
			index,showRaid = 1,true;
			instanceID, name = EJ_GetInstanceByIndex(index, showRaid);
		end
	end
end