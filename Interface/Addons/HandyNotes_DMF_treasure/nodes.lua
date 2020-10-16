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
			[51773048] = {label="Treasure Clue #4",note="next to the banner, on the ground.",},
			[52916059] = {label="Treasure Clue #2",note="In the sandbox.",},
			[21922863] = {label="Treasure Clue #5 (Final)",note="In the shipwreck, look for a purple glowing box.",},
			[52368487] = {label="Treasure Clue #3",note="In the frozen carnie's hand.",},
			[41949146] = {label="Treasure Clue #1",note="In the tent, click the sack.",},
    },
}
