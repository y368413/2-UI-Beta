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
    ["BrokenShore"] = {
		[33496085] = { label="Next to the big ass tree.", },
		[39906037] = { label="Inside the cave. cave entrance at: 38.88, 59.88", },
		[40016736] = { label="Next to the big pillar close to the stairs", },
		[45996953] = { label="Shrine next to the big rock", },
		[56036540] = { label="On the hill near the big black tree", },
		[63345311] = { label="Next at the ship at the water side", },
		[61284062] = { label="Nothing really to add.. Hi Spaceman", },
		[67814460] = { label="Up the small hill", },
		[73953865] = { label="Top of the mountain to get ontop at: 71.48, 35.29", },
		[79642779] = { label="Next to the 2 Deepsurge Defenders", },
		[55962762] = { label="Next to the cave entrance of Malgrazoth", },
		[54611869] = { label="Just next to the broken stairs at the water", },
		[45971529] = { label="On top of the hill entrance at: 50.85, 29.26", },
    },
}
