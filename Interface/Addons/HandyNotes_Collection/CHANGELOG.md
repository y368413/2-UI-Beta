# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.7.0] 2021-11-26
### Added
- Added ability to link items and achievements in map point notes.
- Added variable name loading for npcs, quests and spells in tooltips
- Added status cache for achievement, toy, transmog and mounts for faster loading.
- Added global checkbox to options to disable collection tracking (so u can use only waypoints).
- Added option to disable transmog tracking.
- Completed rares and chest have blue color now.
- Added ability to colorize text in tooltips.
- Added ability to require achievement, reputation or have item in bag while checking tooltip.
- Added rares and chests to _Gorgrond_ (WoD).
- Added rares to _Talador_ (WoD).
- Added mount drops to Warlords of Draenor (Voidtalon, Gorok, Nok-Karosh, Pathrunner, Silthide, Luk'hok, Nakk the Thunderer).
- Added pet battles for _Taming Draenor_ achievement (WoD).
- Added pet battles for _Tiny Terrors in Tanaan_ achievement (WoD).
- Added treasures for _Jungle Treasure Master_ achievement (WoD).
- Added rares to _Tanaan Jungle_ (Jungle Stalker / Hellbane / Predator achievements and toys / transmog / pets / mounts collection) (WoD).
- Added configuration description to readme.
- Added automated code tests (#7).
- Added most of the rares to _Spires of Arak_ (WoD), missing _King of Monsters_ ones.

### Changed
- Updated TOC for Classic Season of Mastery (1.14.1).
- Reworked configuration. it should be easier to understand na more user-friendly.
- Changed waypoint creation to points from right-click to shift-click.
- Updated readme with new tracking features.

## [0.6.1] 2021-11-02
### Fixed
- Hotfix, because curseforge doesn't allow uploading addons with -Mainline suffix for retail version.

## [0.6.0] 2021-11-02
### Added
- Added support for _Classic_ and _Burning Crusade Classic_ versions of World of Warcraft
- Added waypoints to all Classic dungeons (_Blackfathom Deeps, Blackrock Depths, Dire Maul, Gnomeregan, Lower Blackrock Spire, Maraudon, Scarlet Halls, Scarlet Monastery, Scholomance, Shadowfang Keep, The Deadmines, Uldaman_).
- Added waypoints to all TBC dungeons (_Auchenai Crypts, Magisters' Terrace, Sethekk Halls, The Arcatraz, The Mechanar, The Steamvault_) (#15).
- Added waypoints to all Wrath of the Lich King dungeons (_Azjol-Nerub, Culling of Stratholme, Drak'Tharon Keep, Halls of Lightning, The Oculus, Utgarde Keep, Utgarde Pinnacle_) (#15).
- Added waypoints to all Cataclysm dungeons (_Blackrock Caverns, End Time, Halls of Origination, Hour of Twilight, Throne of Tides_) (#15).
- Added waypoints to all MoP dungeons (_Gate of the Setting Sun, Mogu'shan Palace, Siege of Niuzao Temple, Shado-Pan Monastery, Stormstout Brewery, Temple of the Jade Serpent_) (#15).
- Added waypoints to all WoD dungeons (_Grimrail Depot, Shadowmoon Burial Grounds, Skyreach, The Everbloom, Upper Blackrock Spire_) (#15).
- Added option to create waypoint to point on right click (info in tooltip).
- Added ability to track transmogs (unavailable, specific source, or just same appearance) (#5).
- Added ability to track quests associated with item.
- Added option to put requirement on point. This informs player, what needs to be done to complete point.
- Added simple custom map data provider for pois and paths. Nothing fancy, needs a lot of work, but is working as it is (#13).
- Added ability to hover and focus (activate) icon on map. Active points keep their pois and paths displayed (#11).
- Added icons for achievements and items in tooltips.

### Changed
- Updated retail version to 9.1.5
- Colors in tooltip. Headings should be yellow (except title) to be more close to text in World Quest tooltips.
- Changed opacity in config from points values (0-1) to percentage (0-100).
- Lots of internal updates (like caching, documentation etc.).

## [0.5.0] 2021-10-19
### Added
- Added waypoints to Wrath of the Lich King raids (_Naxxramas, Trial of Crusader, Icecrown Citadel_) (#8).
- Added missing waypoints to Ulduar (from Antechamber to Inner Sanctum and vice versa) (#8).
- Added waypoints to Cataclysm raids (_Bastion of Twilight, Firelands, Dragon Soul_) (#8).
- Added waypoints to Mists of Pandaria raids (_Heart of Fear, Mogu'shan Vaults, Throne of Thunder, Siege of Orgrimmar_) (#8).
- Added waypoints to Warlords of Draenor raids (_Blackrock Foundry, Highmaul, Hellfire Citadel_) (#8).
- Added option to configure (size, opacity, display) waypoints in instances.

## [0.4.0] 2021-10-11
### Added
- Added ability to track, if mount has been collected (#2).
- Added ability to track, if toy has been collected (#3).
- Added ability to track, if pet has been collected (#1).
- Added tooltip reward info for mount, pet, toy (#4).
- Added global cache storage (#10).
- Added waypoints to Classic raids (_Temple of Ahn'Qiraj, Blackwing Lair_) (#8).
- Added waypoints to Burning Crusade raids (_Karazhan, Sunwell Plateau_) (#8).
- Added waypoints to Blackwing Descent (#8).

### Changed
- Changed id to npcId in points to be more descriptive.
- Changed map icons to warfront icons to differentiate from other addons.

## [0.3.1] 2021-10-05
### Fixed
- Removed forgotten prints in code.

## [0.3.0] 2021-10-05
### Added
- Added ability to get map name by id (either map or subzone in dungeon).
- Added icons for door (up, right, left, down).
- Created portal type POI (click will open different map).
- Added TBC data structure for loading.
- Added portals to Black Temple (TBC) (#8).
- Added Text method to get rgb color.
- Added methods to API to load achievement / criteria names.
- Added rewards (achievements) to tooltip. It's still a bit wonky and bloated, but it's working (#4).
- Added option to rewrite user configured scale and opacity per point.

### Changed
- Modified map data loading.
- Changed structure for loot, so we can have multiple of each type.

## [0.2.0] 2021-10-01
### Added
- Added changelog.
- Added [In Plain Sight](https://www.wowhead.com/achievement=9656/in-plain-sight) achievement.
- Created function for point completion (quest, loot etc.).
- Added achievement loot to all _I Found Pepe_ places.
- Added ability to track, if achievement (whole, its criteria or its progress) has been completed.
- Refresh map when configuration is changed.

### Changed
- Changed icon on _I Found Pepe!_ from achievement to chest.
- Renamed _Alpha_ to _Opacity_ in plugin settings.
- Better quest completion check.

### Fixed
- Stepping in opacity settings is now by 0.05 (was 0.5).

## [0.1.0] - 2021-09-28
### Added
- Initial release.
- Basic module configuration and documentation.
- [I Found Pepe!](https://www.wowhead.com/achievement=10053/i-found-pepe) achievement.

[Unreleased]: https://gitlab.com/mulambo/HandyNotes_Collection/-/compare/v0.7.0...master
[0.7.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.7.0
[0.6.1]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.6.1
[0.6.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.6.0
[0.5.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.5.0
[0.4.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.4.0
[0.3.1]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.3.1
[0.3.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.3.0
[0.2.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.2.0
[0.1.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.1
