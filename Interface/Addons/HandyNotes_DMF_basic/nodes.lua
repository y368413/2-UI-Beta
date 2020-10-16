local myname, ns = ...

ns.points = {
    --[[ structure:
    [mapFile] = { -- "_terrain1" etc will be stripped from attempts to fetch this
        [coord] = {
            label=[string], -- label: text that'll be the label, optional
            item=[id], -- itemid
            quest=[id], -- will be checked, for whether character already has it
            achievement=[id], -- will be shown in the tooltip
            junk=[bool], -- doesn't count for achievement
            npc=[id], -- related npc id, used to display names in tooltip
            note=[string], -- some text which might be helpful
        },
    },
    --]]
    [407] = {
        -- totally stole all of this and just replaced with relevant info from LongForgottenHippogryph, thanks
			[53168745] = {label="Race (Big)",note="Win the race. Can't lose but worth going after the achievements.",},
			[77027925] = {label="Darkmoon Rabbit",note="Raid boss, drops a pet worth a lot on the AH.",},
			[50801794] = {label="Flag 3, Big Race",},
			[65116773] = {label="Mosh Pit Event",note="Occurs every hour on the half hour, drops a lot of gold and a chance at a purple helmet at your level.",},
			[47887870] = {label="Arena",},
			[47596666] = {label="Heirloom Vender",note="Sells armour for 50 tickets (1-60)\nUpgrading costs 100 tickets (1-90)\nWeapons are 75 tickets \nTrinkets are 70 tickets\nUpgrading weapons costs 120 tickets",},
			[36425771] = {label="Rona Greenteeth",note="Sells inky black potion, which is a fun item that can only be found here.",},
			[49245699] = {label="Carousel (+10% EXP/REP)",note="You should always get this buff. The max duration is 60 minutes.\n\nYou can refresh your duration without consuming a ticket, as long as you still have the buff.",},
			[47946471] = {label="Prizes",note="Various items sold here, notably a 16 slot bag for 1 ticket.\nMost items can be found in prizes rarely.",},
			[48256919] = {label="Mount Prizes",},
			[64461926] = {label="Flag 2, Big Race",},
			[53265406] = {label="Whack a Gnoll",note="Hit gnolls for 1 point, Hit hogger for 3, hit people to get dazed.",},
			[43695040] = {label="Flag 3, Little Race",},
			[51537782] = {label="Ring toss",note="Hit the turtle 3 times within 10 rings. ",},
			[29424577] = {label="Flag 2, Little Race",},
			[50786516] = {label="Tonk Game",note="Shoot the targets, avoid getting shot.",},
			[39444381] = {label="Moonfang",},
			[48387134] = {label="Firebird's Challenge",note="Fly through 15 rings",},
			[70187211] = {label="Flag 1, Big Race",note="You can jump up the side of the mountain with rocket boosts to save some tolls.",},
			[47878831] = {label="Finish Line",},
			[54668831] = {label="Finish line",},
			[49276063] = {label="Shooting Gallery",note="Hit the targets, you can only hit one target  3 times per cycle, and you score bonus points on the first if you're quick enough.",},
			[26206687] = {label="Flag 1, Little Race",},
			[52348904] = {label="Fishing Prizes",note="Notably the treasure map, and the aqua mount.",},
			[48918848] = {label="Race (Little)",note="Win the race. Can't lose but worth going after the achievements.",},
			[47056244] = {label="Battle Pets",note="Fights vs hard level 25 pet masters. Rewards approx 10 tickets.",},
			[47906723] = {label="Strongest Woman Alive",note="Monthly quest to kill 250 things your level.\n\nDoes not give the quest if you have COMPLETED the quest this faire.",},
			[52495600] = {label="Cannon",note="Shoot yourself out of the cannon to hit the target in the water, talk with the guy at the shore to teleport back.",},
			[51682454] = {label="Free Temporary Mounts",note="Right next to the entrance, just hop on a Darkmoon Strider.",},
    },
}
