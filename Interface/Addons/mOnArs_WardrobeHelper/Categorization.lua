local o = mOnWardrobe

o.createCategories = function()
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

	o.tiers = {}
	for i = 1, #o.EXPS do
		o.tiers[o.EXPS[i]] = {}
		for j = 1, #o.PARTY do
			o.tiers[o.EXPS[i]][o.PARTY[j]] = {}
		end
	end

	for k, v in pairs(o.categorization) do
		table.insert(o.tiers[o.EXPS[v[1]]][o.PARTY[v[2]]], k)
	end

	o.tiers["Special"] = {}
	o.tiers["Special"]["Other"] = o.TYPES
	o.tiers["Custom Categories"] = {}
end
o.createCategories()