local _,ffh = ...

-- To add a new family familiar achievements in future patches:
-- 1. Add a new subtable to ffh.achievementInfo below
-- 2. In this subtable, define the following:
--     achievementID: the main achievementID for the new familiar familiar achievement
--     criteriaIDs: the achivementIDs of the criteria in the petType order (1=humanoid, 2=dragonkin, etc; there should be 10)
--     criteriaNeeded: number of completed criteria that are needed to complete the main achievementID (eg 9 battles won per type)
--     isNumericalCriteria: (optional) true if this is a progress-bar criteria and not X sub-criteria criteria
--     npcIDs: (optional) npcIDs (in any order) of the targets that relate to this achievement so auto-show on target works

ffh.achievementInfo = {
    -- Family Familiar
    {
        achievementID = 9696,
        criteriaIDs = { 9692, 9689, 9691, 9695, 9688, 9693, 9690, 9687, 9686, 9694 },
        npcIDs = { 98270, 99210, 105674, 97804, 99182, 104970, 107489, 104553, 97709, 99150, 105250, 99035, 99077, 106552, 105455},
        criteriaNeeded = 12
    },
    -- Family Fighter
    {
        achievementID = 12100,
        criteriaIDs = { 12096, 12093, 12095, 12099, 12092, 12097, 12094, 12091, 12089, 12098 },
        npcIDs = { 128007, 128009, 128011, 128013, 128014, 128017, 128019, 128021, 128023, 128008, 128010, 128012, 128015, 128016, 128018, 128020, 128022, 128024},
        criteriaNeeded = 18
    },
    -- Family Brawler
    {
        achievementID = 12290,
        criteriaNeeded = 10,
        criteriaIDs = { 12289, 12287, 12286, 12285, 12284, 12283, 12282, 12281, 12280, 12279 },
        isNumericalCriteria = true, -- criteria is number of battles won, a number
        -- no npcIDs for Family Brawler, it's Battle #1 through Battle #10
    },
    -- Family Battler
    {
        achievementID = 13279,
        criteriaIDs = { 13281, 13272, 13274, 13278, 13271, 13275, 13273, 13270, 13280, 13277 },
        npcIDs = { 139489, 140461, 140880, 141046, 141292, 141529, 141814, 141945, 142096, 142234, 140315, 140813, 141002, 141077, 141479, 141799, 141879, 142054, 142114 },
        criteriaNeeded = 15
    },
    -- Family Exorcist
    {
        achievementID = 14879,
        criteriaIDs = { 14874, 14871, 14873, 14877, 14870, 14875, 14872, 14869, 14868, 14876 },
        npcIDs = { 173129, 173130, 173131, 173257, 173263, 173267, 173315, 173324, 173331, 173372, 173377 },
        criteriaNeeded = 9
    },
    -- Family Familiar of Dragon Isles
    {
        achievementID = 16512,
        criteriaIDs = { 16508, 16505, 16507, 16511, 16504, 16509, 16506, 16503, 16501, 16510 },
        npcIDs = { 197417, 197102, 197336, 196264, 196069, 197350, 197447, 189376 },
        criteriaNeeded = 8
    },
    -- Family Battler of Zaralek Cavern
    {
        achievementID = 17934,
        criteriaIDs = { 17915, 17890, 17905, 17918, 17883, 17916, 17904, 17882, 17881, 17917 },
        npcIDs = { 201004, 204792, 204926, 204934 },
        criteriaNeeded = 4
    }
}

if select(4,GetBuildInfo())<100100 then -- until Patch 10.1, Family Battler of Zaralek Cavern should be removed
    tremove(ffh.achievementInfo,7)
end

-- this makes ffh.achivementInfo[achievementID] return the info for the achievement, without needing an index
ffh.achievementInfo = setmetatable(ffh.achievementInfo,{
    __index=function(self,key)
        for index,info in ipairs(self) do
            if info.achievementID==key then
                return info
            end
        end
    end
})

-- for auto-show option, build a lookup table of all npcIDs, where [npcID]=achievementID
ffh.notableNPCs = {}
for _,info in ipairs(ffh.achievementInfo) do
    if type(info.npcIDs)=="table" then -- some achievements may not have npcIDs (like family brawler)
        for _,npcID in ipairs(info.npcIDs) do
            ffh.notableNPCs[npcID] = info.achievementID
        end
    end
end