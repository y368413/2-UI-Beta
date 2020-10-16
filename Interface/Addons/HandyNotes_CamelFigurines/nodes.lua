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
	["Uldum"] = {
		-- Locations are based on https://pastebin.com/9AtvwKwF from the WoW General Secret Discord
        -- Mysterious Camel Figurines
        [50473154]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [52232804]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [45241604]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [34321963]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [34382127]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33682538]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33232809]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [29902490]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [29852045]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [31964529]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [32734763]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [25405107]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [24445996]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [22096406]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [25596589]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [26276509]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [28516374]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [30426267]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [30616050]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33086013]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33206283]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [30996637]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [30986752]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [31506926]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33217204]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [33276778]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [37136408]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [38286070]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [38495493]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [40844975]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [39974500]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [40104340]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [40163841]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [46254458]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [48174640]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [51804934]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [51035080]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [50485065]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [51475116]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [52145121]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [51927081]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [50427222]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [50247367]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [49137591]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [47287669]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [51147979]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [73447361]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [69875813]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [72024388]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
        [64663027]={ item=63046, label="Mysterious Camel Figurine", scale=1.0, },
    },
}
