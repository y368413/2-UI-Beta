# Hekili

## [v9.1.5-1.0.10](https://github.com/Hekili/hekili/tree/v9.1.5-1.0.10) (2022-02-13)
[Full Changelog](https://github.com/Hekili/hekili/compare/v9.1.5-1.0.9...v9.1.5-1.0.10) [Previous Releases](https://github.com/Hekili/hekili/releases)

- Druid:  More Adaptive Swarm tweaks.  
- Copy Shadowform and Adrenaline Rush to the shared auras list.  
- Subtlety:  Remove Slaughter Poison.  
- Feral:  Try to fake Adaptive Swarm heal stacks when damage is up.  
- Outlaw:  Remove Slaughter Poison; add T28 mechanic.  Update priority.  
- Tweak invalid aura logging.  
- Keep feigned auras from unreleased content.  
- Fix DK Frost conditional.  
- Retribution:  Update priority.  
- Add missing Legion TW trinkets.  
- Frost DK:  Priority update.  
- Add tier28 set detection.  
    Put Windfury Totem on totem CD.  
- Support swing.X.remains syntax.  
    Track de/buffs that are checked in priorities but don't actually exist (Warnings).  
- Format keybinds.  
- Add keybinds to Issue Reporting information and Snapshots.  
- More work to catch Mana Gem keybind.  
- If ProcessHooks fails somehow, still count it as that display's refresh and put it on CD.  
- Simplify UnitIsUnit in state.  
- Remove silly inversion in ProcessHooks.  
- Aggressively change SpellFlashes instead of letting them fade.  
- Remove Balance Druid AP reset.  
- Correct Flame Shock tick time.  
- Profile the damage/TTD auditor.  
- Improve display mode descriptions.  
- Testing for CPU usage attribution: removed GetItemCooldown from state table; make it local in files that need it.  
- Tweak options screen for PvP trinkets.  
- Make "apply\_poison" transform into the real poison ability so keybinds will show.  
- Further changes to rely on Blizzard's Item mixin.  
    Fix(?) spec template to actually show ability/item options on first click.  
- Switch back to Blizzard's ContinueOnItemLoad (this may help with missing icon issue).  
    Don't load ability/item options until you actually open the options UI.  
- Fix Arcane mana gem.  Again.  
- Update other issue report templates.  
- Test bug report update.  
