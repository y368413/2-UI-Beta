# Hekili

## [v9.1.5-1.0.4-alpha5](https://github.com/Hekili/hekili/tree/v9.1.5-1.0.4-alpha5) (2021-11-23)
[Full Changelog](https://github.com/Hekili/hekili/compare/v9.1.5-1.0.3...v9.1.5-1.0.4-alpha5) [Previous Releases](https://github.com/Hekili/hekili/releases)

- Quickfix for #1292, I think.  
- Further attempts at improving performance.  
    - Don't update recommendations in the same frame as a reset.  
    - Don't cache-on-demand since it was just obscuring what was slow.(Force update of buffs/debuffs/cooldowns on reset.)  
    - Don't check TimeToReady if an action IsReady.  
    - Max delay/wait is reduced to 10.  
    - Max CPU time feature is a little more aggressive.  
    - Hekili:DumpProfileInfo will provide a lot more data (if profiling is enabled).  
    - Minor tweak to UnitIsUnit.  
    - See if we can get away ignoring rechecks for call/run\_action\_list.  
    Tweak Gladiator's Badge again.  
    - Reduce calls to GetSpellCooldown for the GCD.  
    - Move function checks up in IsUsable.  
    Simplify time\_to\_hpg for Retribution.  
- Minor tweak to throttle gear updates, maybe.  
- Arcane:  Fix just\_used\_spark class variable.  
- Marksmanship:  APL update.  
- Merge branch 'shadowlands' of https://github.com/Hekili/hekili into shadowlands  
- Subtlety:  Update priority for Kyrian.  
- Test:  Treat any RunHandler outside of a reset as modifying the game state (was otherwise not resetting when multiple instants filled a multi-icon queue).  
- Merge pull request #1279 from Nmxsz/shadowlands  
- Arcane:  Move priority variables into the class module to increase efficiency.  Use strict APL forking to reduce processing time of priority lists.  
- Test:  Reduce CPU usage by refreshing game state less often if it shouldn't have changed.  The same game state can be used for all single-icon displays.  
- Fix for offhand swing error, maybe.  
- Merge pull request #1 from Nmxsz/feature/discipline-priest-ramp-rotation  
    Discipline Ramp Rotation / Damage Rotation  
- Trial:  Remove some events that force the addon to update recommendations.  
- Add Touch of the Void heirloom on use because I'm lazy on my alt.  
- Discipline Ramp Rotation / Damage Rotation  
