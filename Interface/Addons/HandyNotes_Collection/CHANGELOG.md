# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.3.1] 2021-10-05
### Fixed
- Removed forgotten prints in code.

## [0.3.0] 2021-10-05
### Added
- Added ability to get map name by id (either map or subzone in dungeon).
- Added icons for door (up, right, left, down).
- Created portal type POI (click will open different map).
- Added TBC data structure for loading.
- Added portals to Black Temple (TBC).
- Added Text method to get rgb color.
- Added methods to API to load achievement / criteria names.
- Added rewards (achievements) to tooltip. It's still a bit wonky and bloated, but it's working.
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

[Unreleased]: https://gitlab.com/mulambo/HandyNotes_Collection/-/compare/v0.3.1...master
[0.3.1]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.3.1
[0.3.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.3.0
[0.2.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.2.0
[0.1.0]: https://gitlab.com/mulambo/HandyNotes_Collection/-/releases/v0.1
