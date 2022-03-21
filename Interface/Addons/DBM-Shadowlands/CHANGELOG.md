# <DBM> World Bosses (Shadowlands)

## [9.2.7-24-gbb49c48](https://github.com/DeadlyBossMods/DBM-Retail/tree/bb49c4897f691802900a66653939c8213561883a) (2022-03-20)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Retail/compare/9.2.7...bb49c4897f691802900a66653939c8213561883a) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Retail/releases)

- couple more mythic ygelon timer tweaks from vods, i'm not gonna go too much into vod timings when there isn't much urgency to support fight yet  
- Update localization.cn.lua (#89)  
- don't show dark zeal taunt warning if still phased in kingsmourn  
- further improvements to tank swap warnings based on feedback.  
- also change spell description in optinos ot use the new spellids tooltip, not old one  
- another tank debuff tweak, hal taunt swap will now ignroe if you have debuff and always authorize taunt warning to swap beam back and forth.  
- Fixed a bug that caused tank warning not to fire on Vigilant guardian for boss swapping.  
    Fixed a bug that caused interrupt warning to show before you're supposed to interrupt on lords of dread. it should now correctly wait until incomplete form drops before telling you to interrupt casts.  
    Fixed a bug where icon setting for manifeste shadows on lords of dread was a bit slow. it should be faster now.  
- cleanup anduin mod, outside of tweaks to one intermission, mythic is same as heroic so the entire table can be reduced  
- Improve dausegne barrage so count is always visible, in all warning types  
- add a you pos count object.  
- just eyeballing, might not be right, but it looks like bang is 5 seconds slower on mythic  
- update lords of dread mythic berserk  
- tweak one more default  
- change icon defaults and usages on jailer to be compatible with the now (finally) released BW jailer mod  
- adjust carrion throttle some, because it was overly strict and filtering first targets too  
- timer weaks to guardian to reset two timers on expose core, per todays hotfixes  
- Fix Lua error  
- Update commonlocal.cn.lua (#88)  
- Update localization.tw.lua (#87)  
- Update commonlocal.tw.lua (#86)  
- Only warn initial carrion targets for non targets. (personal always). This is a good middle ground of knowing initial targets but avoiding spam from it bouncing all about from handling it poorly  
- Tweak last, that kind of aggregation won't work, ultimately no way to avoid spam without gimping warning too much. it only spams if things going wrong, so just don't go wrong! ('ll i'll come up with cleaner solution later)  
- Fix a few observed bugs with lords of dread  
- Update alpha revision  
