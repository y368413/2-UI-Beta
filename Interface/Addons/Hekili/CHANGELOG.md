# Hekili

## [v9.2.0-1.0.13](https://github.com/Hekili/hekili/tree/v9.2.0-1.0.13) (2022-03-28)
[Full Changelog](https://github.com/Hekili/hekili/compare/v9.2.0-1.0.12...v9.2.0-1.0.13) [Previous Releases](https://github.com/Hekili/hekili/releases)

- For the simulated state, don't start CD/spend charges until a cast finishes (unless it's an instant or channeled spell).  
- Make cycle\_for_* respect minimum TTD and/or actual TTD.  
- Warlock priority updates.  
- Factor modRate into spell cooldowns for UI consistency; watch this closely because "exactTime" might be a bit odd.  
- Test cycle\_for\_execute and cycle\_for\_condemn fixes.  
- Remove Divine Resonance HoPo forecast; use HoPo gain on recast events.  
- Whenever a queued event has a function attached, run it when the event is handled.  
- Irrelevant whitespace cleanup.  
- Protection: Divine Resonance ticks case Avenger's Shield.  
- Make default spec template enabled, again, to maybe address auto-disabled specs.  Maybe.  
- Blood, Feral, Marksman, Enhancement priority updates.  
- Fix full\_recharge\_time behavior a bit more.  
- Change Mad Bombardier to generate charge when bomb hits the target instead of reducing the cooldown.  
- Adjustments for Survival bomb icons.  
