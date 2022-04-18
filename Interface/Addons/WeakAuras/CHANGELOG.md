# [3.7.16-31-gc818034b](https://github.com/WeakAuras/WeakAuras2/tree/c818034b7d1cd0fa255179ce953a8479af29b7ee) (2022-04-11)

[Full Changelog](https://github.com/WeakAuras/WeakAuras2/compare/3.7.16...c818034b7d1cd0fa255179ce953a8479af29b7ee)

InfusOnWoW (23):

- BT2: Fix indentaion mistake
- BT2: Fix automatic removal of multi auras after 60s
- Options: Fix moving auras showing wrong text replacements
- Check Item Equipped via name instead of item id
- Localize a few error messages
- Preserve order of auras on drag and drop
- Add a scrollbar to the import window
- Move showing of NewAura tab to FillOptions instead of Pick
- Fix inconsistency of text replacements
- Block access to WeakAurasOptions + WeakAurasOptionsSaved
- Add a few entries to the block list
- Options: Refactor visbility flag tracking
- Options: Also cache nameAll
- Make ClearPicks a lot faster
- Remove WeakAuras.UpdateDisplayButton
- Allow dragging/grouping of group auras
- Enable importing for nested groups
- Fix Duplicate not creating nested auras in the right order
- Clear AuraEnvironment recursively
- Rework load tracking for group auras for nested
- Fix scamCheck
- Rewrite Importing of auras
- Make Options window background less transparent

Vardex (2):

- Enable creation of nested group
- Adjust corruption detection for nested

dependabot[bot] (1):

- Bump actions/upload-artifact from 2 to 3

mrbuds (5):

- Unit Characteristics trigger: add Afk & DND checks
- anchor options tuning for "group by frame", fixes #3570 hide "Anchored To", and show correct anchorPoint option
- library check before loading files
- handle CDR with modRate (#3548)
- dummy commit to fix error in dependency

