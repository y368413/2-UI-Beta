local addonName, addon = ...

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)

function addon:GetOptions()
    return {
        type = 'group',
        args = {
            minimap = {
                name = L.opt_minimap_icon,
                -- desc = L.opt_minimap_icon_desc,
                type = 'toggle',
                set = function(info, value)
                    self.db.profile.minimap.hide = not value
					if value then
                        self.icon:Show(addonName)
                    else
                        self.icon:Hide(addonName)
                    end
                end,
                get = function(info)
                    return not self.db.profile.minimap.hide
                end,
            },
			rarity = {
                name = L.opt_rarity,
                desc = L.opt_rarity_desc,
                type = 'toggle',
                set = function(info, value)
                    self.db.profile.rarity.hide = not value
                end,
                get = function(info)
                    return not self.db.profile.rarity.hide
                end,
            },
			tomtom = {
                name = L.opt_tomtom,
                desc = L.opt_tomtom_desc,
                type = 'toggle',
                set = function(info, value)
                    self.db.profile.tomtom.hide = not value
                end,
                get = function(info)
                    return not self.db.profile.tomtom.hide
                end,
            },
			mountname = {
				name = L.opt_mountname,
				desc = L.opt_mountname_desc,
				type = 'toggle',
				set = function(info, value)
					self.db.profile.mountname = not value
				end,
				get = function(info)
					return not self.db.profile.mountname
				end,
				}, 
			alreadyrun = {
				name = L.opt_alreadyrun,
				desc = L.opt_alreadyrun_desc,
				type = 'toggle',
				set = function(info, value)
					self.db.profile.alreadyrun = not value
				end,
				get = function(info)
					return not self.db.profile.alreadyrun
				end,
				},  
			verbosemode = {
				name = L.opt_verbosemode,
				desc = L.opt_verbosemode_desc,
				type = 'toggle',
				set = function(info, value)
					self.db.profile.verbosemode = value
				end,
				get = function(info)
					return self.db.profile.verbosemode
				end,
				}, 
			hide = {
				name = "Show/Hide Sources",
				type = "group",
				args = {
					dungeon = {
						name = L.opt_hidedungeon,
						desc = L.opt_hidedungeon_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_dungeon = not value
						end,
						get = function(info)
							return not self.db.profile.hide_dungeon
						end,
					}, 
					raid = {
						name = L.opt_hideraid,
						desc = L.opt_hideraid_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_raid = not value
						end,
						get = function(info)
							return not self.db.profile.hide_raid
						end,
					}, 
					world = {
						name = L.opt_hideworld,
						desc = L.opt_hideworld_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_world = not value
						end,
						get = function(info)
							return not self.db.profile.hide_world
						end,
					},  
					rare = {
						name = L.opt_hiderare,
						desc = L.opt_hiderare_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_rare = not value
						end,
						get = function(info)
							return not self.db.profile.hide_rare
						end,
					}, 
					garrisoninvasion = {
						name = L.opt_hidegarrisoninvasion,
						desc = L.opt_hidegarrisoninvasion_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_garrisoninvasion = not value
						end,
						get = function(info)
							return not self.db.profile.hide_garrisoninvasion
						end,
					}, 
					summoned = {
						name = L.opt_hidesummoned,
						desc = L.opt_hidesummoned_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_summoned = not value
						end,
						get = function(info)
							return not self.db.profile.hide_summoned
						end,
					}, 
					warfront = {
						name = L.opt_hidewarfront,
						desc = L.opt_hidewarfront_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_warfront = not value
						end,
						get = function(info)
							return not self.db.profile.hide_warfront
						end,
					}, 
					bfaassault = {
						name = L.opt_hidebfaassault,
						desc = L.opt_hidebfaassault_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_bfaassault = not value
						end,
						get = function(info)
							return not self.db.profile.hide_bfaassault
						end,
					}, 
					horrificvision = {
						name = L.opt_hidehorrificvision,
						desc = L.opt_hidehorrificvision_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_horrificvision = not value
						end,
						get = function(info)
							return not self.db.profile.hide_horrificvision
						end,
					}, 
					expeditions = {
						name = L.opt_hideexpeditions,
						desc = L.opt_hideexpeditions_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_expeditions = not value
						end,
						get = function(info)
							return not self.db.profile.hide_expeditions
						end,
					}, 
					vendor = {
						name = L.opt_hidevendor,
						desc = L.opt_hidevendor_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_vendor = not value
						end,
						get = function(info)
							return not self.db.profile.hide_vendor
						end,
					}, 
					paragon = {
						name = L.opt_hideparagon,
						desc = L.opt_hideparagon_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_paragon = not value
						end,
						get = function(info)
							return not self.db.profile.hide_paragon
						end,
					}, 
					zone = {
						name = L.opt_hidezone,
						desc = L.opt_hidezone_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_zone = not value
						end,
						get = function(info)
							return not self.db.profile.hide_zone
						end,
					}, 
					holiday = {
						name = L.opt_hideholiday,
						desc = L.opt_hideholiday_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_holiday = not value
						end,
						get = function(info)
							return not self.db.profile.hide_holiday
						end,
					}, 
					slcovenantcache = {
						name = L.opt_hideslcovenant,
						desc = L.opt_hideslcovenant_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_slcovenant = not value
						end,
						get = function(info)
							return not self.db.profile.hide_slcovenant
						end,
					}, 
					treasure = {
						name = L.opt_hidetreasure,
						desc = L.opt_hidetreasure_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_treasure = not value
						end,
						get = function(info)
							return not self.db.profile.hide_treasure
						end,
					}, 
					quest = {
						name = L.opt_hidequest,
						desc = L.opt_hidequest_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_quest = not value
						end,
						get = function(info)
							return not self.db.profile.hide_quest
						end,
					},
					event = {
						name = L.opt_hideevent,
						desc = L.opt_hideevent_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_event = not value
						end,
						get = function(info)
							return not self.db.profile.hide_event
						end,
					},
				},
			},
			exp = {
				name = "Show/Hide Expansions",
				type = "group",
				args = {
					classic = {
						name = L.opt_hideclassic,
						desc = L.opt_hideclassic_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_classic = not value
						end,
						get = function(info)
							return not self.db.profile.hide_classic
						end,
					},
					bc = {
						name = L.opt_hidebc,
						desc = L.opt_hidebc_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_bc = not value
						end,
						get = function(info)
							return not self.db.profile.hide_bc
						end,
					},
					wotlk = {
						name = L.opt_hidewotlk,
						desc = L.opt_hidewotlk_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_wotlk = not value
						end,
						get = function(info)
							return not self.db.profile.hide_wotlk
						end,
					},
					cata = {
						name = L.opt_hidecata,
						desc = L.opt_hidecata_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_cata = not value
						end,
						get = function(info)
							return not self.db.profile.hide_cata
						end,
					},
					mop = {
						name = L.opt_hidemop,
						desc = L.opt_hidemop_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_mop = not value
						end,
						get = function(info)
							return not self.db.profile.hide_mop
						end,
					},
					wod = {
						name = L.opt_hidewod,
						desc = L.opt_hidewod_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_wod = not value
						end,
						get = function(info)
							return not self.db.profile.hide_wod
						end,
					},
					legion = {
						name = L.opt_hidelegion,
						desc = L.opt_hidelegion_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_legion = not value
						end,
						get = function(info)
							return not self.db.profile.hide_legion
						end,
					},
					bfa = {
						name = L.opt_hidebfa,
						desc = L.opt_hidebfa_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_bfa = not value
						end,
						get = function(info)
							return not self.db.profile.hide_bfa
						end,
					},
					sl = {
						name = L.opt_hidesl,
						desc = L.opt_hidesl_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_sl = not value
						end,
						get = function(info)
							return not self.db.profile.hide_sl
						end,
					},
					df = {
						name = L.opt_hidedf,
						desc = L.opt_hidedf_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_df = not value
						end,
						get = function(info)
							return not self.db.profile.hide_df
						end,
					},
					tww = {
						name = L.opt_hidetww,
						desc = L.opt_hidetww_desc,
						type = 'toggle',
						set = function(info, value)
							self.db.profile.hide_tww = not value
						end,
						get = function(info)
							return not self.db.profile.hide_tww
						end,
					},
				},
			},
        },
    }
end
