# Hekili

## [v9.2.5-1.0.0](https://github.com/Hekili/hekili/tree/v9.2.5-1.0.0) (2022-06-06)
[Full Changelog](https://github.com/Hekili/hekili/compare/v9.2.0-1.0.19...v9.2.5-1.0.0) [Previous Releases](https://github.com/Hekili/hekili/releases)

- Make SpellFlash respect size settings; fixes #1507.  
- Rogue changes inspired by PR #1515.  
- Outlaw, Survival updates.  
- More snapshot changes.  
- Adjustments to snapshot interface.  
- Windwalker priority update.  
- Destruction priority update.  
- Review snapshot interface; modernize import strings.  
- Minor cleanup.  
- Some targets die above 0% health.  
- Add 'stationary\_enemies' expression that may or may not be useful.  
- Code cleanups.  
- Refinements to new Protection Warrior settings.  
- Merge pull request #1484 from Krytos/patch-1  
- Revert "Survival, Windwalker, Arms, Fury priority updates/tweaks."  Removes MM changes included by mistake.  
- Fix Blessing of the Seasons bind detection.  
    + Actually commit WW priority update.  
- Survival, Windwalker, Arms, Fury priority updates/tweaks.  
- TOC Update for 9.2.5.  
- Added Shield Block toggle  
    Added a toggle to allow stacking of shield block. Defaults to "off"  
- Shield block reprisal fix  
    Dirty fix to make sure shield block is not sitting at 2 stacks, while shield block buff from reprisal is up. Allows stacking of shield block, since it stacks up to 18 sec anyway.  
- Ignore Pain overlap toggle  
    Added a toggle to allow overlapping of active ignore pain  