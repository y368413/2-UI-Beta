# MaxDps

## [v10.0.1](https://github.com/kaminaris/MaxDps/tree/v10.0.1) (2022-11-03)
[Full Changelog](https://github.com/kaminaris/MaxDps/compare/v10.0.0...v10.0.1) [Previous Releases](https://github.com/kaminaris/MaxDps/releases)

- v10.0.1 - fix  
- Merge pull request #12 from codengine/master  
    fix MaxDps:CreateOverlay  
- fix MaxDps:CreateOverlay  
    type is a reserved keyword and therefore whenever a custom color is used, it will try to use the string "type" as a method, which will fail  
