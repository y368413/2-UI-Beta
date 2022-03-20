# [3.7.13-11-g20ec397a](https://github.com/WeakAuras/WeakAuras2/tree/20ec397a3d740f8e2e5cdc6537d23c660555151a) (2022-03-14)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/3.7.13...20ec397a3d740f8e2e5cdc6537d23c660555151a)

Adam Wendelin (1):

- Add slam rank 5 to spells resetting swing

InfusOnWoW (1):

- Change order of Types and Prototypes.lua loading

asakawa (1):

- add a tooltip for unit selections in status triggers

mrbuds (8):

- BW/DBM Timer triggers: fix handling of remainingTime with paused timers, fixes #3537
- Threat Situation trigger: add boss & nameplate support add a migration for unitThreat to unit statesParameter is now "unit"
- Revert "Adjust {rt#} replacement to be compatible with DBM extended raid marks" raid target > 8 was removed in 9.2 https://wowpedia.fandom.com/wiki/Patch_9.2.0/API_changes
- Spell Known trigger: add inverse option, fixes #3533
- Combat Log trigger: add spellSchool filter, fixes #3529
- Character state bcc: revert hastepercent change, fixes #3516
- bufftrigger boss unit fix
- more fixes to support boss units up to 10

