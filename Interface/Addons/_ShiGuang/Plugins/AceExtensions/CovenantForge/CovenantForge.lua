--	///////////////////////////////////////////////////////////////////////////////////////////	 
--	Author: SLOKnightfall
--	Version: V1.5.1
--	SavedVariables: CovenantForgeDB, CovenantForgeSavedPaths, CovenantForgeWeights
--	///////////////////////////////////////////////////////////////////////////////////////////

if GetLocale() == "zhCN" then
  CovenantForgeLocal = "|cffe6cc80[心能]|r评分数值";
elseif GetLocale() == "zhTW" then
  CovenantForgeLocal = "|cffe6cc80[心能]|r评分数值";
else
  CovenantForgeLocal = "CovenantForge";
end

_G["BINDING_HEADER_COVENANTFORGE"] = CovenantForgeLocal
_G["BINDING_NAME_COVENANTFORGE_BINDING_TOGGLE_SOULBINDS"] = "    Toggle Soulbind Viewer"

local CovenantForge = LibStub("AceAddon-3.0"):NewAddon("CovenantForge", "AceEvent-3.0", "AceConsole-3.0", "AceHook-3.0")
local AceGUI = LibStub("AceGUI-3.0")
CovenantForge.Frame = LibStub("AceGUI-3.0")
CovenantForge.Init = {}

CovenantForge.Conduits ={
	[5]={ "Stalwart Guardian", 334993, 2, {72,71,73,},},
	[7]={ "Brutal Vitality", 335010, 2, {72,71,73,},},
	[8]={ "Inspiring Presence", 335034, 0, {72,71,73,},},
	[9]={ "Safeguard", 335196, 0, {72,71,73,},},
	[10]={ "Fueled by Violence", 347213, 2, {73,},},
	[11]={ "Ashen Juggernaut", 335232, 1, {72,71,73,},},
	[12]={ "Crash the Ramparts", 335242, 1, {71,},},
	[13]={ "Cacophonous Roar", 335250, 0, {72,71,73,},},
	[14]={ "Merciless Bonegrinder", 335260, 1, {71,},},
	[15]={ "Harm Denial", 336379, 2, {268,270,269,},},
	[16]={ "Inner Fury", 336452, 1, {269,},},
	[17]={ "Unrelenting Cold", 336460, 1, {64,},},
	[18]={ "Shivering Core", 336472, 1, {64,},},
	[19]={ "Calculated Strikes", 336526, 1, {269,},},
	[20]={ "Icy Propulsion", 336522, 1, {64,},},
	[21]={ "Ice Bite", 336569, 1, {64,},},
	[22]={ "Coordinated Offensive", 336598, 1, {269,},},
	[23]={ "Winter's Protection", 336613, 0, {62,63,64,},},
	[24]={ "Xuen's Bond", 336616, 1, {269,},},
	[25]={ "Grounding Breath", 336632, 2, {268,270,269,},},
	[26]={ "Flow of Time", 336636, 0, {62,63,64,},},
	[27]={ "Indelible Victory", 336191, 2, {72,71,73,},},
	[28]={ "Jade Bond", 336773, 1, {270,},},
	[29]={ "Grounding Surge", 336777, 0, {62,63,64,},},
	[30]={ "Infernal Cascade", 336821, 1, {63,},},
	[31]={ "Resplendent Mist", 336812, 1, {270,},},
	[32]={ "Master Flame", 336852, 1, {63,},},
	[33]={ "Fortifying Ingredients", 336853, 2, {268,270,269,},},
	[34]={ "Arcane Prodigy", 336873, 1, {62,},},
	[35]={ "Lingering Numbness", 336884, 0, {268,270,269,},},
	[36]={ "Nether Precision", 336886, 1, {62,},},
	[37]={ "Dizzying Tumble", 336890, 0, {268,270,269,},},
	[38]={ "Discipline of the Grove", 336992, 1, {62,63,64,},},
	[39]={ "Gift of the Lich", 336999, 1, {62,63,64,},},
	[40]={ "Ire of the Ascended", 337058, 1, {62,63,64,},},
	[41]={ "Swift Transference", 337078, 0, {268,270,269,},},
	[42]={ "Tumbling Technique", 337084, 0, {268,270,269,},},
	[43]={ "Siphoned Malice", 337087, 1, {62,63,64,},},
	[44]={ "Rising Sun Revival", 337099, 1, {270,},},
	[45]={ "Cryo-Freeze", 337123, 2, {62,63,64,},},
	[46]={ "Scalding Brew", 337119, 1, {268,},},
	[47]={ "Celestial Effervescence", 337134, 2, {268,},},
	[48]={ "Diverted Energy", 337136, 2, {62,63,64,},},
	[49]={ "Unnerving Focus", 337154, 2, {73,},},
	[50]={ "Depths of Insanity", 337162, 1, {72,},},
	[51]={ "Magi's Brand", 337192, 1, {62,},},
	[52]={ "Hack and Slash", 337214, 1, {72,},},
	[53]={ "Flame Accretion", 337224, 1, {63,},},
	[54]={ "Nourishing Chi", 337241, 1, {270,},},
	[55]={ "Artifice of the Archmage", 337240, 1, {62,},},
	[56]={ "Evasive Stride", 337250, 2, {268,},},
	[57]={ "Walk with the Ox", 337264, 1, {268,},},
	[58]={ "Incantation of Swiftness", 337275, 0, {62,63,64,},},
	[59]={ "Strike with Clarity", 337286, 1, {268,270,269,},},
	[60]={ "Bone Marrow Hops", 337295, 1, {268,270,269,},},
	[61]={ "Tempest Barrier", 337293, 2, {62,63,64,},},
	[62]={ "Imbued Reflections", 337301, 1, {268,270,269,},},
	[63]={ "Way of the Fae", 337303, 1, {268,270,269,},},
	[64]={ "Vicious Contempt", 337302, 1, {72,},},
	[65]={ "Eternal Hunger", 337381, 1, {252,},},
	[66]={ "Translucent Image", 337662, 2, {258,256,257,},},
	[67]={ "Move with Grace", 337678, 0, {258,256,257,},},
	[68]={ "Chilled Resilience", 337704, 0, {250,251,252,},},
	[69]={ "Clear Mind", 337707, 0, {258,256,257,},},
	[70]={ "Spirit Drain", 337705, 0, {250,251,252,},},
	[71]={ "Charitable Soul", 337715, 2, {258,256,257,},},
	[72]={ "Light's Inspiration", 337748, 2, {258,256,257,},},
	[73]={ "Power Unto Others", 337762, 0, {258,256,257,},},
	[74]={ "Reinforced Shell", 337764, 2, {250,251,252,},},
	[75]={ "Shining Radiance", 337778, 1, {256,},},
	[76]={ "Pain Transformation", 337786, 1, {256,},},
	[77]={ "Exaltation", 337790, 1, {256,},},
	[78]={ "Lasting Spirit", 337811, 1, {257,},},
	[79]={ "Accelerated Cold", 337822, 1, {251,},},
	[80]={ "Withering Plague", 337884, 1, {250,},},
	[81]={ "Swift Penitence", 337891, 1, {256,},},
	[82]={ "Focused Mending", 337914, 1, {257,},},
	[83]={ "Eradicating Blow", 337934, 1, {251,},},
	[84]={ "Resonant Words", 337947, 1, {257,},},
	[85]={ "Mental Recovery", 337954, 0, {258,256,257,},},
	[86]={ "Blood Bond", 337957, 2, {250,},},
	[87]={ "Courageous Ascension", 337966, 1, {258,256,257,},},
	[88]={ "Hardened Bones", 337972, 2, {250,251,252,},},
	[89]={ "Embrace Death", 337980, 1, {252,},},
	[90]={ "Festering Transfusion", 337979, 1, {258,256,257,},},
	[91]={ "Everfrost", 337988, 1, {251,},},
	[92]={ "Astral Protection", 337964, 2, {262,264,263,},},
	[93]={ "Refreshing Waters", 337974, 2, {262,264,263,},},
	[94]={ "Vital Accretion", 337981, 2, {262,264,263,},},
	[95]={ "Thunderous Paws", 338033, 0, {262,264,263,},},
	[96]={ "Totemic Surge", 338042, 0, {262,264,263,},},
	[97]={ "Crippling Hex", 338054, 0, {262,264,263,},},
	[98]={ "Spiritual Resonance", 338048, 0, {262,264,263,},},
	[99]={ "Fleeting Wind", 338089, 0, {250,251,252,},},
	[100]={ "Pyroclastic Shock", 345594, 1, {262,},},
	[101]={ "Fae Fermata", 338305, 1, {258,256,257,},},
	[102]={ "High Voltage", 338131, 1, {262,},},
	[103]={ "Shake the Foundations", 338252, 1, {262,},},
	[104]={ "Call of Flame", 338303, 1, {262,},},
	[105]={ "Shattered Perceptions", 338315, 1, {258,256,257,},},
	[106]={ "Unending Grip", 338311, 0, {250,251,252,},},
	[107]={ "Haunting Apparitions", 338319, 1, {258,},},
	[108]={ "Insatiable Appetite", 338330, 2, {250,251,252,},},
	[109]={ "Unruly Winds", 338318, 1, {263,},},
	[110]={ "Focused Lightning", 338322, 1, {263,},},
	[111]={ "Magma Fist", 338331, 1, {263,},},
	[112]={ "Chilled to the Core", 338325, 1, {263,},},
	[113]={ "Mind Devourer", 338332, 1, {258,},},
	[114]={ "Rabid Shadows", 338338, 1, {258,},},
	[115]={ "Dissonant Echoes", 338342, 1, {258,},},
	[116]={ "Holy Oration", 338345, 1, {257,},},
	[117]={ "Embrace of Earth", 338329, 1, {264,},},
	[118]={ "Swirling Currents", 338339, 1, {264,},},
	[119]={ "Heavy Rainfall", 338343, 1, {264,},},
	[120]={ "Nature's Focus", 338346, 1, {264,},},
	[121]={ "Meat Shield", 338435, 2, {250,},},
	[122]={ "Unleashed Frenzy", 338492, 1, {251,},},
	[123]={ "Debilitating Malady", 338516, 1, {250,},},
	[124]={ "Convocation of the Dead", 338553, 1, {252,},},
	[125]={ "Lingering Plague", 338566, 1, {252,},},
	[126]={ "Impenetrable Gloom", 338628, 1, {250,251,252,},},
	[127]={ "Brutal Grasp", 338651, 1, {250,251,252,},},
	[128]={ "Proliferation", 338664, 1, {250,251,252,},},
	[129]={ "Divine Call", 338741, 2, {65,66,70,},},
	[130]={ "Fel Defender", 338671, 2, {577,581,},},
	[131]={ "Viscous Ink", 338682, 2, {577,581,},},
	[132]={ "Shattered Restoration", 338793, 2, {577,581,},},
	[133]={ "Shielding Words", 338787, 2, {65,66,70,},},
	[134]={ "Felfire Haste", 338799, 0, {577,581,},},
	[135]={ "Ravenous Consumption", 338835, 0, {577,581,},},
	[137]={ "Enfeebled Mark", 339018, 1, {253,254,255,},},
	[138]={ "Demonic Parole", 339048, 0, {577,581,},},
	[139]={ "Empowered Release", 339059, 1, {253,254,255,},},
	[140]={ "Spirit Attunement", 339109, 1, {253,254,255,},},
	[141]={ "Golden Path", 339114, 2, {65,66,70,},},
	[142]={ "Pure Concentration", 339124, 0, {65,66,70,},},
	[143]={ "Necrotic Barrage", 339129, 1, {253,254,255,},},
	[144]={ "Fel Celerity", 339130, 0, {265,266,267,},},
	[145]={ "Lost in Darkness", 339149, 0, {577,581,},},
	[146]={ "Elysian Dirge", 339182, 1, {262,264,263,},},
	[147]={ "Tumbling Waves", 339186, 1, {262,264,263,},},
	[148]={ "Essential Extraction", 339183, 1, {262,264,263,},},
	[149]={ "Lavish Harvest", 339185, 1, {262,264,263,},},
	[150]={ "Relentless Onslaught", 339151, 1, {577,},},
	[151]={ "Dancing with Fate", 339228, 1, {577,},},
	[152]={ "Serrated Glaive", 339230, 1, {577,},},
	[153]={ "Growing Inferno", 339231, 1, {577,581,},},
	[154]={ "Piercing Verdict", 339259, 1, {72,71,73,},},
	[157]={ "Markman's Advantage", 339264, 2, {253,254,255,},},
	[158]={ "Veteran's Repute", 339265, 1, {72,71,73,},},
	[159]={ "Light's Barding", 339268, 0, {65,66,70,},},
	[160]={ "Resolute Barrier", 339272, 2, {265,266,267,},},
	[161]={ "Wrench Evil", 339292, 0, {65,66,70,},},
	[162]={ "Accrued Vitality", 339282, 2, {265,266,267,},},
	[163]={ "Echoing Blessings", 339316, 0, {65,66,70,},},
	[164]={ "Expurgation", 339371, 1, {70,},},
	[165]={ "Harrowing Punishment", 339370, 1, {72,71,73,},},
	[166]={ "Harmony of the Tortollan", 339377, 2, {253,254,255,},},
	[167]={ "Truth's Wake", 339374, 1, {70,},},
	[168]={ "Shade of Terror", 339379, 0, {265,266,267,},},
	[169]={ "Mortal Combo", 339386, 1, {71,},},
	[170]={ "Rejuvenating Wind", 339399, 2, {253,254,255,},},
	[171]={ "Demonic Momentum", 339411, 0, {265,266,267,},},
	[172]={ "Soul Furnace", 339423, 1, {581,},},
	[173]={ "Resilience of the Hunter", 339459, 2, {253,254,255,},},
	[174]={ "Corrupting Leer", 339455, 1, {265,},},
	[175]={ "Reversal of Fortune", 339495, 0, {253,254,255,},},
	[176]={ "Templar's Vindication", 339531, 1, {70,},},
	[177]={ "Enkindled Spirit", 339570, 1, {65,},},
	[178]={ "Cheetah's Vigor", 339558, 0, {253,254,255,},},
	[179]={ "Demon Muzzle", 339587, 2, {581,},},
	[180]={ "Roaring Fire", 339644, 2, {581,},},
	[181]={ "Tactical Retreat", 339651, 0, {253,254,255,},},
	[182]={ "Virtuous Command", 339518, 1, {70,},},
	[183]={ "Ferocious Appetite", 339704, 1, {253,},},
	[184]={ "Resplendent Light", 339712, 1, {65,},},
	[185]={ "One With the Beast", 339750, 1, {253,},},
	[186]={ "Show of Force", 339818, 1, {73,},},
	[187]={ "Repeat Decree", 339895, 1, {577,581,},},
	[188]={ "Sharpshooter's Focus", 339920, 1, {254,},},
	[189]={ "Brutal Projectiles", 339924, 1, {254,},},
	[190]={ "Destructive Reverberations", 339939, 1, {72,71,73,},},
	[191]={ "Disturb the Peace", 339948, 0, {72,71,73,},},
	[192]={ "Deadly Chain", 339973, 1, {254,},},
	[193]={ "Focused Light", 339984, 1, {65,},},
	[194]={ "Untempered Dedication", 339987, 1, {65,},},
	[195]={ "Vengeful Shock", 340006, 1, {66,},},
	[196]={ "Punish the Guilty", 340012, 1, {66,},},
	[197]={ "Resolute Defender", 340023, 2, {66,},},
	[198]={ "Increased Scrutiny", 340028, 1, {577,581,},},
	[199]={ "Powerful Precision", 340033, 1, {254,},},
	[200]={ "Brooding Pool", 340063, 1, {577,581,},},
	[201]={ "Rolling Agony", 339481, 1, {265,},},
	[202]={ "Focused Malignancy", 339500, 1, {265,},},
	[203]={ "Cold Embrace", 339576, 1, {265,},},
	[204]={ "Borne of Blood", 339578, 1, {266,},},
	[205]={ "Carnivorous Stalkers", 339656, 1, {266,},},
	[206]={ "Tyrant's Soul", 339766, 1, {266,},},
	[207]={ "Fel Commando", 339845, 1, {266,},},
	[208]={ "Duplicitous Havoc", 339890, 1, {267,},},
	[209]={ "Royal Decree", 340030, 2, {66,},},
	[210]={ "The Long Summer", 340185, 1, {65,66,70,},},
	[211]={ "Ashen Remains", 339892, 1, {267,},},
	[212]={ "Combusting Engine", 339896, 1, {267,},},
	[213]={ "Righteous Might", 340192, 1, {65,66,70,},},
	[214]={ "Infernal Brand", 340041, 1, {267,},},
	[215]={ "Hallowed Discernment", 340212, 1, {65,66,70,},},
	[216]={ "Ringing Clarity", 340218, 1, {65,66,70,},},
	[217]={ "Soul Tithe", 340229, 1, {265,266,267,},},
	[218]={ "Fatal Decimation", 340268, 1, {265,266,267,},},
	[219]={ "Catastrophic Origin", 340316, 1, {265,266,267,},},
	[220]={ "Soul Eater", 340348, 1, {265,266,267,},},
	[221]={ "Kilrogg's Cunning", 58081, 0, {265,266,267,},},
	[222]={ "Diabolic Bloodstone", 340562, 2, {265,266,267,},},
	[223]={ "Echoing Call", 340876, 1, {253,},},
	[224]={ "Strength of the Pack", 341222, 1, {255,},},
	[225]={ "Reverberation", 341264, 1, {259,260,261,},},
	[226]={ "Stinging Strike", 341246, 1, {255,},},
	[227]={ "Sudden Fractures", 341272, 1, {259,260,261,},},
	[228]={ "Septic Shock", 341309, 1, {259,260,261,},},
	[229]={ "Lashing Scars", 341310, 1, {259,260,261,},},
	[230]={ "Nimble Fingers", 341311, 2, {259,260,261,},},
	[231]={ "Recuperator", 341312, 2, {259,260,261,},},
	[232]={ "Cloaked in Shadows", 341529, 2, {259,260,261,},},
	[233]={ "Quick Decisions", 341531, 0, {259,260,261,},},
	[234]={ "Fade to Nothing", 341532, 0, {259,260,261,},},
	[235]={ "Rushed Setup", 341534, 0, {259,260,261,},},
	[236]={ "Prepared for All", 341535, 0, {259,260,261,},},
	[237]={ "Poisoned Katar", 341536, 1, {259,},},
	[238]={ "Well-Placed Steel", 341537, 1, {259,},},
	[239]={ "Maim, Mangle", 341538, 1, {259,},},
	[240]={ "Lethal Poisons", 341539, 1, {259,},},
	[241]={ "Triple Threat", 341540, 1, {260,},},
	[242]={ "Ambidexterity", 341542, 1, {260,},},
	[243]={ "Sleight of Hand", 341543, 1, {260,},},
	[244]={ "Count the Odds", 341546, 1, {260,},},
	[245]={ "Deeper Daggers", 341549, 1, {261,},},
	[246]={ "Planned Execution", 341556, 1, {261,},},
	[247]={ "Stiletto Staccato", 341559, 1, {261,},},
	[248]={ "Perforated Veins", 341567, 1, {261,},},
	[249]={ "Controlled Destruction", 341325, 1, {63,},},
	[250]={ "Withering Ground", 341344, 1, {250,251,252,},},
	[251]={ "Deadly Tandem", 341350, 1, {255,},},
	[252]={ "Flame Infusion", 341399, 1, {255,},},
	[253]={ "Bloodletting", 341440, 1, {253,},},
	[254]={ "Tough as Bark", 340529, 2, {102,103,104,105,},},
	[255]={ "Ursine Vigor", 340540, 2, {102,103,104,105,},},
	[256]={ "Innate Resolve", 340543, 2, {102,103,104,105,},},
	[257]={ "Tireless Pursuit", 340545, 0, {102,103,104,105,},},
	[258]={ "Born Anew", 341280, 0, {102,103,104,105,},},
	[259]={ "Front of the Pack", 341450, 0, {102,103,104,105,},},
	[260]={ "Born of the Wilds", 341451, 0, {102,103,104,105,},},
	[261]={ "Stellar Inspiration", 340720, 1, {102,},},
	[262]={ "Precise Alignment", 340706, 1, {102,},},
	[263]={ "Fury of the Skies", 340708, 1, {102,},},
	[264]={ "Umbral Intensity", 340719, 1, {102,},},
	[265]={ "Taste for Blood", 340682, 1, {103,},},
	[266]={ "Incessant Hunter", 340686, 1, {103,},},
	[267]={ "Sudden Ambush", 340694, 1, {103,},},
	[268]={ "Carnivorous Instinct", 340705, 1, {103,},},
	[269]={ "Unchecked Aggression", 340552, 1, {104,},},
	[270]={ "Savage Combatant", 340609, 1, {104,},},
	[271]={ "Well-Honed Instincts", 340553, 2, {104,},},
	[272]={ "Layered Mane", 340605, 2, {104,},},
	[273]={ "Unstoppable Growth", 340549, 1, {105,},},
	[274]={ "Flash of Clarity", 340616, 1, {105,},},
	[275]={ "Floral Recycling", 340621, 1, {105,},},
	[276]={ "Ready for Anything", 340550, 1, {105,},},
	[277]={ "Deep Allegiance", 341378, 1, {102,103,104,105,},},
	[278]={ "Evolved Swarm", 341447, 1, {102,103,104,105,},},
	[279]={ "Conflux of Elements", 341446, 1, {102,103,104,105,},},
	[280]={ "Endless Thirst", 341383, 1, {102,103,104,105,},},
	[281]={ "Unnatural Malice", 344358, 1, {577,581,},},
	[282]={ "Ambuscade", 346747, 0, {253,254,255,},},
}

CovenantForge.Weights ={
	["PreRaid"]={
		[255] ={{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,3,3,1,-7,0,1,0,},{"Enfeebled Mark",0,68,65,72,82,93,92,100,},{"Strength of the Pack",0,45,48,50,63,70,76,84,},{"Stinging Strike",0,33,43,40,49,48,56,61,},{"Combat Meditation (50% Extend) (Pelagos)",58,0,0,0,0,0,0,0,},{"Deadly Tandem",0,18,28,31,27,30,32,34,},{"Hammer of Genesis (Mikanikos)",2,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",76,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",48,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",62,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",22,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",82,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",133,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,5,0,2,-7,-5,2,-5,},{"Strength of the Pack",0,40,48,52,58,66,70,81,},{"Stinging Strike",0,34,41,36,47,41,53,58,},{"Deadly Tandem",0,23,22,28,29,35,37,31,},{"Empowered Release",0,44,40,42,45,44,46,45,},{"Built for War (Draven)",112,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",107,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",72,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",60,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",47,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",105,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",13,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",39,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,8,6,-1,6,2,6,6,},{"Spirit Attunement",0,70,73,73,77,85,78,80,},{"Deadly Tandem",0,23,27,26,39,36,41,47,},{"Stinging Strike",0,42,46,46,58,58,65,62,},{"Strength of the Pack",0,53,59,62,66,79,83,93,},{"Wild Hunt Tactics (Korayn)",90,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",156,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",123,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",183,0,0,0,0,0,0,0,},{"First Strike (Korayn)",24,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",4,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",46,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",88,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,-4,-6,0,-5,-4,-3,-2,},{"Strength of the Pack",0,38,40,51,60,65,74,76,},{"Necrotic Barrage",0,10,14,17,11,17,17,19,},{"Lead by Example (2 Allies) (Emeni)",53,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",25,0,0,0,0,0,0,0,},{"Stinging Strike",0,36,39,51,44,45,54,53,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",67,0,0,0,0,0,0,0,},{"Deadly Tandem",0,17,29,30,35,38,39,44,},{"Forgeborne Reveries (Heirmir)",85,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",17,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",83,0,0,0,0,0,0,0,},},},
		[262] ={{{"Power",1,145,158,171,184,200,213,226,},{"Elysian Dirge",0,24,27,22,26,31,35,36,},{"Pyroclastic Shock",0,28,19,26,36,38,42,43,},{"Shake the Foundations",0,-5,2,4,-1,-8,-5,-7,},{"Hammer of Genesis (Mikanikos)",0,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",72,0,0,0,0,0,0,0,},{"Call of Flame",0,58,59,65,62,63,69,63,},{"Combat Meditation (50% Extend) (Pelagos)",50,0,0,0,0,0,0,0,},{"High Voltage",0,-3,6,-1,4,5,10,2,},{"Combat Meditation (Never Extend) (Pelagos)",30,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",37,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",25,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",81,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",146,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lavish Harvest",0,2,2,3,7,10,7,1,},{"High Voltage",0,5,13,9,9,15,11,11,},{"Shake the Foundations",0,1,2,6,-4,2,8,2,},{"Pyroclastic Shock",0,30,31,28,39,49,39,42,},{"Call of Flame",0,72,64,63,73,72,78,74,},{"Built for War (Draven)",149,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",121,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",62,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",66,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",29,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",93,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",19,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",78,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Essential Extraction",0,28,41,29,30,35,33,38,},{"Pyroclastic Shock",0,32,39,31,38,51,53,56,},{"High Voltage",0,7,4,6,11,6,10,9,},{"Social Butterfly (Dreamweaver)",52,0,0,0,0,0,0,0,},{"Shake the Foundations",0,-5,2,-3,-2,-4,1,-3,},{"Field of Blossoms (Dreamweaver)",79,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",174,0,0,0,0,0,0,0,},{"First Strike (Korayn)",17,0,0,0,0,0,0,0,},{"Call of Flame",0,65,72,72,67,66,71,78,},{"Grove Invigoration (Niya)",110,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-4,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",126,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",116,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Tumbling Waves",0,25,30,30,24,26,31,35,},{"High Voltage",0,15,16,13,17,22,13,22,},{"Shake the Foundations",0,7,0,-2,10,0,0,2,},{"Pyroclastic Shock",0,29,33,42,42,45,40,34,},{"Lead by Example (4 Allies) (Emeni)",106,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",70,0,0,0,0,0,0,0,},{"Call of Flame",0,75,80,74,87,82,76,85,},{"Gnashing Chompers (Emeni)",2,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",26,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",82,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",39,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",121,0,0,0,0,0,0,0,},},},
		[62] ={{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,13,6,8,6,8,15,14,},{"Magi's Brand",0,68,79,80,92,95,102,110,},{"Pointed Courage (3 Allies) (Kleia)",102,0,0,0,0,0,0,0,},{"Ire of the Ascended",0,62,82,76,89,97,100,103,},{"Arcane Prodigy",0,31,36,34,37,70,68,75,},{"Combat Meditation (Always Extend) (Pelagos)",101,0,0,0,0,0,0,0,},{"Nether Precision",0,27,25,26,29,39,32,33,},{"Combat Meditation (50% Extend) (Pelagos)",95,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",53,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",174,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",25,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",36,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",39,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,5,3,1,0,7,2,6,},{"Magi's Brand",0,62,68,76,85,91,106,103,},{"Nether Precision",0,23,24,20,34,37,25,37,},{"Superior Tactics (Draven)",48,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",21,0,0,0,0,0,0,0,},{"Arcane Prodigy",0,45,56,40,49,85,90,83,},{"Siphoned Malice",0,51,58,65,76,74,89,78,},{"Thrill Seeker (Nadjia)",39,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",44,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",68,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",92,0,0,0,0,0,0,0,},{"Built for War (Draven)",148,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",114,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,-1,5,0,6,4,-1,8,},{"Magi's Brand",0,76,76,89,98,102,103,113,},{"Nether Precision",0,20,20,22,26,35,33,39,},{"Discipline of the Grove",0,14,48,65,72,89,97,93,},{"Niya's Tools: Herbs (Niya)",-8,0,0,0,0,0,0,0,},{"Arcane Prodigy",0,29,29,33,37,31,25,31,},{"Niya's Tools: Poison (Niya)",80,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",158,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",148,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",72,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",22,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",58,0,0,0,0,0,0,0,},{"First Strike (Korayn)",5,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,-2,-1,0,1,-4,2,-5,},{"Gift of the Lich",0,33,40,47,40,50,59,60,},{"Nether Precision",0,25,19,27,25,22,32,36,},{"Arcane Prodigy",0,42,27,39,31,69,77,79,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",10,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",98,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",111,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",188,0,0,0,0,0,0,0,},{"Magi's Brand",0,65,75,77,88,87,94,101,},{"Lead by Example (2 Allies) (Emeni)",124,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",70,0,0,0,0,0,0,0,},},},
		[263] ={{{"Power",1,145,158,171,184,200,213,226,},{"Elysian Dirge",0,22,28,29,37,37,37,38,},{"Chilled to the Core",0,15,18,18,18,33,21,25,},{"Combat Meditation (50% Extend) (Pelagos)",97,0,0,0,0,0,0,0,},{"Focused Lightning",0,14,21,31,33,39,52,54,},{"Combat Meditation (Always Extend) (Pelagos)",119,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",66,0,0,0,0,0,0,0,},{"Magma Fist",0,14,19,17,22,20,20,15,},{"Bron's Call to Action (Mikanikos)",94,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",27,0,0,0,0,0,0,0,},{"Unruly Winds",0,27,38,33,40,42,40,40,},{"Pointed Courage (3 Allies) (Kleia)",90,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",163,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",0,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lavish Harvest",0,12,19,19,15,25,12,20,},{"Chilled to the Core",0,27,30,34,35,37,27,30,},{"Magma Fist",0,25,21,26,25,26,31,30,},{"Refined Palate (Theotar)",96,0,0,0,0,0,0,0,},{"Unruly Winds",0,37,42,40,42,42,47,51,},{"Focused Lightning",0,28,30,41,48,49,57,62,},{"Wasteland Propriety (Theotar)",51,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",93,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",113,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",90,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",80,0,0,0,0,0,0,0,},{"Built for War (Draven)",136,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",37,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Essential Extraction",0,14,7,18,19,16,14,20,},{"Chilled to the Core",0,15,16,20,18,19,27,17,},{"Niya's Tools: Burrs (Niya)",165,0,0,0,0,0,0,0,},{"First Strike (Korayn)",36,0,0,0,0,0,0,0,},{"Magma Fist",0,13,10,25,10,15,20,11,},{"Grove Invigoration (Niya)",172,0,0,0,0,0,0,0,},{"Unruly Winds",0,33,26,36,38,37,40,39,},{"Wild Hunt Tactics (Korayn)",106,0,0,0,0,0,0,0,},{"Focused Lightning",0,20,27,28,38,33,44,48,},{"Niya's Tools: Poison (Niya)",131,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-2,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",110,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",54,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Tumbling Waves",0,16,15,23,24,26,35,36,},{"Chilled to the Core",0,32,32,33,26,30,34,34,},{"Unruly Winds",0,39,42,41,48,45,44,50,},{"Forgeborne Reveries (Heirmir)",117,0,0,0,0,0,0,0,},{"Magma Fist",0,28,25,31,25,26,40,47,},{"Plaguey's Preemptive Strike (Marileth)",33,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",8,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",90,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",68,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",111,0,0,0,0,0,0,0,},{"Focused Lightning",0,27,38,36,50,49,63,65,},{"Lead by Example (0 Allies) (Emeni)",45,0,0,0,0,0,0,0,},},},
		[64] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ire of the Ascended",0,48,59,59,65,71,87,91,},{"Unrelenting Cold",0,29,33,35,33,30,39,38,},{"Shivering Core",0,0,0,1,3,1,-5,3,},{"Ice Bite",0,72,70,80,89,97,96,109,},{"Combat Meditation (Always Extend) (Pelagos)",71,0,0,0,0,0,0,0,},{"Icy Propulsion",0,168,191,214,224,247,269,290,},{"Combat Meditation (Never Extend) (Pelagos)",40,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",28,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",72,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",126,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",46,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",54,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",3,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Siphoned Malice",0,47,61,60,73,80,85,84,},{"Unrelenting Cold",0,20,30,30,35,33,41,44,},{"Shivering Core",0,-3,-6,-7,2,-9,3,-1,},{"Ice Bite",0,72,74,79,89,103,105,119,},{"Built for War (Draven)",131,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",107,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",57,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",68,0,0,0,0,0,0,0,},{"Icy Propulsion",0,189,208,239,256,291,316,341,},{"Soothing Shade (Theotar)",67,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",65,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",19,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",55,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Discipline of the Grove",0,-6,-12,-6,-5,-7,-8,-11,},{"Unrelenting Cold",0,25,24,23,32,26,27,35,},{"Shivering Core",0,-11,-2,-6,-3,-3,-7,-8,},{"Ice Bite",0,61,66,66,76,88,87,93,},{"Wild Hunt Tactics (Korayn)",105,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",97,0,0,0,0,0,0,0,},{"Icy Propulsion",0,170,191,214,239,255,278,314,},{"Field of Blossoms (Dreamweaver)",-9,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-5,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",27,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",185,0,0,0,0,0,0,0,},{"First Strike (Korayn)",8,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",39,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Gift of the Lich",0,22,24,24,30,32,31,33,},{"Shivering Core",0,1,2,2,3,-1,-3,0,},{"Unrelenting Cold",0,24,25,34,34,39,36,42,},{"Forgeborne Reveries (Heirmir)",102,0,0,0,0,0,0,0,},{"Ice Bite",0,73,72,76,87,93,98,102,},{"Icy Propulsion",0,168,191,211,234,254,281,304,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",44,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-4,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",146,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",103,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",60,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",15,0,0,0,0,0,0,0,},},},
		[66] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ringing Clarity",0,57,58,67,66,73,81,81,},{"Punish the Guilty",0,55,52,59,66,68,71,82,},{"Pointed Courage (5 Allies) (Kleia)",118,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",68,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",113,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",54,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",74,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",24,0,0,0,0,0,0,0,},{"Vengeful Shock",0,35,42,47,49,52,55,54,},{"Combat Meditation (Always Extend) (Pelagos)",94,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",27,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Hallowed Discernment",0,81,82,98,100,105,119,124,},{"Punish the Guilty",0,42,44,51,58,60,63,72,},{"Wasteland Propriety (Theotar)",66,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",8,0,0,0,0,0,0,0,},{"Vengeful Shock",0,30,29,36,41,48,40,50,},{"Refined Palate (Theotar)",86,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",46,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",95,0,0,0,0,0,0,0,},{"Built for War (Draven)",91,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",60,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",1,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"The Long Summer",0,11,9,15,10,16,22,14,},{"Punish the Guilty",0,48,53,58,58,69,71,75,},{"Grove Invigoration (Niya)",97,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",49,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",8,0,0,0,0,0,0,0,},{"First Strike (Korayn)",41,0,0,0,0,0,0,0,},{"Vengeful Shock",0,31,34,39,45,44,53,51,},{"Niya's Tools: Burrs (Niya)",178,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",80,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-1,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",105,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Righteous Might",0,24,22,31,29,35,36,38,},{"Punish the Guilty",0,49,49,54,57,60,66,72,},{"Lead by Example (0 Allies) (Emeni)",15,0,0,0,0,0,0,0,},{"Vengeful Shock",0,26,29,33,33,40,39,43,},{"Lead by Example (2 Allies) (Emeni)",30,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",46,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",19,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-1,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",59,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",62,0,0,0,0,0,0,0,},},},
		[70] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ringing Clarity",0,105,119,122,131,141,150,164,},{"Expurgation",0,87,99,104,103,119,132,130,},{"Truth's Wake",0,16,13,18,23,19,19,24,},{"Virtuous Command",0,118,134,142,162,167,178,194,},{"Pointed Courage (5 Allies) (Kleia)",140,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",10,0,0,0,0,0,0,0,},{"Templar's Vindication",0,109,116,137,140,149,169,171,},{"Combat Meditation (Always Extend) (Pelagos)",125,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",103,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",76,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",29,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",89,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",63,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Hallowed Discernment",0,73,78,81,95,113,111,108,},{"Truth's Wake",0,17,17,14,16,21,26,22,},{"Expurgation",0,82,88,97,113,112,124,135,},{"Dauntless Duelist (Nadjia)",104,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",52,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",65,0,0,0,0,0,0,0,},{"Templar's Vindication",0,114,114,125,134,149,159,172,},{"Virtuous Command",0,105,115,132,142,158,158,169,},{"Soothing Shade (Theotar)",72,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-1,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",16,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",88,0,0,0,0,0,0,0,},{"Built for War (Draven)",106,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"The Long Summer",0,29,24,28,29,30,32,32,},{"Truth's Wake",0,15,14,25,23,25,29,29,},{"Expurgation",0,90,100,109,111,131,132,150,},{"Virtuous Command",0,117,126,143,154,161,176,188,},{"Social Butterfly (Dreamweaver)",45,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",109,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",6,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",78,0,0,0,0,0,0,0,},{"Templar's Vindication",0,115,125,143,155,163,173,193,},{"Niya's Tools: Burrs (Niya)",177,0,0,0,0,0,0,0,},{"First Strike (Korayn)",14,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",8,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",121,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Righteous Might",0,15,16,21,14,24,26,23,},{"Expurgation",0,89,91,108,109,115,133,132,},{"Plaguey's Preemptive Strike (Marileth)",13,0,0,0,0,0,0,0,},{"Virtuous Command",0,109,114,132,140,144,159,176,},{"Truth's Wake",0,21,22,23,23,30,26,37,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",72,0,0,0,0,0,0,0,},{"Templar's Vindication",0,113,120,133,138,148,159,179,},{"Forgeborne Reveries (Heirmir)",79,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",68,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",45,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",28,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-1,0,0,0,0,0,0,0,},},},
		[72] ={{{"Power",1,145,158,171,184,200,213,226,},{"Piercing Verdict",0,21,22,31,28,33,24,32,},{"Depths of Insanity",0,35,33,31,36,43,44,50,},{"Ashen Juggernaut",0,60,73,86,88,89,104,110,},{"Hammer of Genesis (Mikanikos)",4,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",104,0,0,0,0,0,0,0,},{"Hack and Slash",0,15,17,23,28,34,34,41,},{"Bron's Call to Action (Mikanikos)",66,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",24,0,0,0,0,0,0,0,},{"Vicious Contempt",0,25,22,22,32,34,43,37,},{"Pointed Courage (3 Allies) (Kleia)",91,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",150,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",60,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",77,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Harrowing Punishment",0,10,16,13,9,15,17,24,},{"Depths of Insanity",0,33,30,40,46,44,51,51,},{"Refined Palate (Theotar)",111,0,0,0,0,0,0,0,},{"Ashen Juggernaut",0,70,74,84,-364,99,101,113,},{"Dauntless Duelist (Nadjia)",110,0,0,0,0,0,0,0,},{"Vicious Contempt",0,28,28,39,36,42,42,46,},{"Thrill Seeker (Nadjia)",88,0,0,0,0,0,0,0,},{"Hack and Slash",0,19,16,22,17,23,25,28,},{"Soothing Shade (Theotar)",74,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",1,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",29,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",-2,0,0,0,0,0,0,0,},{"Built for War (Draven)",104,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,14,22,24,23,26,31,34,},{"Ashen Juggernaut",0,68,81,84,90,96,107,114,},{"Grove Invigoration (Niya)",130,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",91,0,0,0,0,0,0,0,},{"Depths of Insanity",0,39,44,42,49,50,50,55,},{"Niya's Tools: Poison (Niya)",-4,0,0,0,0,0,0,0,},{"Vicious Contempt",0,25,31,34,34,37,41,45,},{"Field of Blossoms (Dreamweaver)",88,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",165,0,0,0,0,0,0,0,},{"First Strike (Korayn)",19,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-2,0,0,0,0,0,0,0,},{"Hack and Slash",0,26,22,23,27,39,31,34,},{"Social Butterfly (Dreamweaver)",48,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Veteran's Repute",0,47,55,58,54,62,71,75,},{"Depths of Insanity",0,41,49,42,58,56,62,63,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",87,0,0,0,0,0,0,0,},{"Ashen Juggernaut",0,79,86,92,101,102,115,123,},{"Forgeborne Reveries (Heirmir)",76,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",17,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",1,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",1,0,0,0,0,0,0,0,},{"Vicious Contempt",0,37,36,38,44,37,42,46,},{"Hack and Slash",0,29,29,28,33,41,39,42,},{"Lead by Example (0 Allies) (Emeni)",1,0,0,0,0,0,0,0,},},},
		[578] ={{{"Power",1,145,158,171,184,200,213,226,},{"Repeat Decree",0,39,44,46,52,54,64,64,},{"Soul Furnace",0,15,19,22,26,24,28,31,},{"Pointed Courage (5 Allies) (Kleia)",96,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",56,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",21,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",49,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",47,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",61,0,0,0,0,0,0,0,},{"Growing Inferno",0,26,24,32,29,35,33,37,},{"Combat Meditation (Always Extend) (Pelagos)",79,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Increased Scrutiny",0,23,28,29,35,33,33,35,},{"Soul Furnace",0,18,25,28,21,29,29,30,},{"Exacting Preparation (Nadjia)",21,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",32,0,0,0,0,0,0,0,},{"Growing Inferno",0,28,27,33,34,39,37,43,},{"Soothing Shade (Theotar)",43,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",43,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",63,0,0,0,0,0,0,0,},{"Built for War (Draven)",64,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",44,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",104,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Unnatural Malice",0,31,34,38,40,43,45,49,},{"Soul Furnace",0,17,19,20,25,25,32,27,},{"Grove Invigoration (Niya)",68,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",28,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",81,0,0,0,0,0,0,0,},{"First Strike (Korayn)",38,0,0,0,0,0,0,0,},{"Growing Inferno",0,27,34,30,34,32,43,41,},{"Niya's Tools: Burrs (Niya)",150,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",43,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",52,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",70,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brooding Pool",0,9,16,11,17,18,21,30,},{"Soul Furnace",0,22,23,24,25,27,33,30,},{"Lead by Example (0 Allies) (Emeni)",18,0,0,0,0,0,0,0,},{"Growing Inferno",0,24,28,37,35,35,40,43,},{"Lead by Example (2 Allies) (Emeni)",34,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",46,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",14,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",2,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",56,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",51,0,0,0,0,0,0,0,},},},
		[265] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,-1,-1,-1,-1,0,-2,-1,},{"Cold Embrace",0,91,95,106,113,127,133,138,},{"Corrupting Leer",0,16,16,24,27,17,19,24,},{"Focused Malignancy",0,150,166,178,200,208,222,241,},{"Hammer of Genesis (Mikanikos)",2,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",140,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",112,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",79,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",29,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",33,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",157,0,0,0,0,0,0,0,},{"Rolling Agony",0,23,25,26,21,36,22,23,},{"Pointed Courage (3 Allies) (Kleia)",93,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,39,51,54,49,53,59,62,},{"Corrupting Leer",0,-44,-39,-39,-37,-38,-28,-20,},{"Focused Malignancy",0,127,133,152,167,184,191,202,},{"Cold Embrace",0,94,87,99,106,113,125,137,},{"Rolling Agony",0,22,23,11,19,14,19,22,},{"Thrill Seeker (Nadjia)",89,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",56,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",110,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",93,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",4,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",18,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",46,0,0,0,0,0,0,0,},{"Built for War (Draven)",138,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,50,59,59,63,63,71,78,},{"Corrupting Leer",0,-6,-7,0,-9,1,-5,0,},{"Cold Embrace",0,82,90,109,114,127,129,142,},{"Niya's Tools: Poison (Niya)",4,0,0,0,0,0,0,0,},{"Focused Malignancy",0,140,147,163,172,187,211,223,},{"Field of Blossoms (Dreamweaver)",112,0,0,0,0,0,0,0,},{"Rolling Agony",0,13,10,10,12,19,11,9,},{"Niya's Tools: Burrs (Niya)",177,0,0,0,0,0,0,0,},{"First Strike (Korayn)",3,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",0,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",55,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",155,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",118,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,56,56,70,63,72,20,78,},{"Corrupting Leer",0,14,15,15,19,19,24,30,},{"Cold Embrace",0,83,96,103,115,121,124,139,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",86,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",115,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",4,0,0,0,0,0,0,0,},{"Rolling Agony",0,13,12,2,12,11,12,13,},{"Lead by Example (4 Allies) (Emeni)",80,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",18,0,0,0,0,0,0,0,},{"Focused Malignancy",0,134,142,152,168,176,193,198,},{"Lead by Example (2 Allies) (Emeni)",58,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",29,0,0,0,0,0,0,0,},},},
		[577] ={{{"Power",1,145,158,171,184,200,213,226,},{"Repeat Decree",0,22,19,27,30,35,29,41,},{"Growing Inferno",0,60,62,72,78,87,92,95,},{"Relentless Onslaught",0,54,60,67,79,81,83,92,},{"Dancing with Fate",0,-1,6,3,7,3,-1,12,},{"Serrated Glaive",0,-3,-2,-8,-8,-2,-2,0,},{"Combat Meditation (Always Extend) (Pelagos)",79,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",59,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",32,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",24,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",79,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",123,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",3,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",67,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Increased Scrutiny",0,-4,0,-7,0,-3,0,-2,},{"Growing Inferno",0,72,72,82,88,94,98,102,},{"Relentless Onslaught",0,59,74,75,77,88,92,104,},{"Serrated Glaive",0,3,10,3,0,3,6,2,},{"Dancing with Fate",0,8,11,9,11,17,15,14,},{"Refined Palate (Theotar)",135,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",41,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",23,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",83,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",104,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",63,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",57,0,0,0,0,0,0,0,},{"Built for War (Draven)",112,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Unnatural Malice",0,28,38,32,39,35,47,48,},{"Growing Inferno",0,64,65,72,82,87,99,102,},{"Niya's Tools: Herbs (Niya)",7,0,0,0,0,0,0,0,},{"Relentless Onslaught",0,54,61,65,75,80,81,91,},{"Niya's Tools: Poison (Niya)",163,0,0,0,0,0,0,0,},{"Dancing with Fate",0,8,8,0,7,10,8,13,},{"Serrated Glaive",0,9,-6,6,0,-1,2,5,},{"Niya's Tools: Burrs (Niya)",183,0,0,0,0,0,0,0,},{"First Strike (Korayn)",20,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",45,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",88,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",90,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",112,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brooding Pool",0,13,22,23,32,41,49,61,},{"Relentless Onslaught",0,64,59,72,78,78,93,99,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",109,0,0,0,0,0,0,0,},{"Serrated Glaive",0,8,8,0,11,6,8,10,},{"Gnashing Chompers (Emeni)",1,0,0,0,0,0,0,0,},{"Dancing with Fate",0,3,6,5,4,8,9,9,},{"Growing Inferno",0,71,79,81,93,96,106,108,},{"Lead by Example (2 Allies) (Emeni)",68,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",36,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",20,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",91,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",97,0,0,0,0,0,0,0,},},},
		[253] ={{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,12,21,21,31,30,23,36,},{"Ferocious Appetite",0,-9,-6,-3,1,5,5,9,},{"One With the Beast",0,15,24,28,37,45,54,63,},{"Enfeebled Mark",0,77,86,83,105,107,116,121,},{"Hammer of Genesis (Mikanikos)",7,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",114,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",75,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",101,0,0,0,0,0,0,0,},{"Echoing Call",0,0,-1,-3,3,-3,-4,-4,},{"Pointed Courage (1 Ally) (Kleia)",29,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",79,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",126,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",48,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,22,26,25,26,33,30,36,},{"Empowered Release",0,30,27,27,30,26,28,25,},{"Ferocious Appetite",0,1,5,1,1,8,12,13,},{"Echoing Call",0,7,4,6,7,3,3,6,},{"One With the Beast",0,19,27,38,45,52,62,66,},{"Built for War (Draven)",116,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",118,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",67,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",76,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",7,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",10,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",43,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",67,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,35,29,28,36,37,29,42,},{"Ferocious Appetite",0,-28,-26,-18,-19,-18,-15,-7,},{"One With the Beast",0,18,14,27,34,55,61,63,},{"Echoing Call",0,-1,3,1,5,11,4,4,},{"Spirit Attunement",0,63,67,68,72,78,84,84,},{"Wild Hunt Tactics (Korayn)",55,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",109,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",178,0,0,0,0,0,0,0,},{"First Strike (Korayn)",7,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",123,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",127,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",48,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-5,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,11,21,18,22,27,20,20,},{"Necrotic Barrage",0,10,6,10,12,17,13,20,},{"Echoing Call",0,-8,-5,-3,-4,1,-8,-3,},{"Lead by Example (2 Allies) (Emeni)",50,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",28,0,0,0,0,0,0,0,},{"One With the Beast",0,7,13,30,32,37,45,49,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",75,0,0,0,0,0,0,0,},{"Ferocious Appetite",0,-7,-10,-1,-2,-2,-4,7,},{"Gnashing Chompers (Emeni)",-4,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",17,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",76,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",83,0,0,0,0,0,0,0,},},},
		[258] ={{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,136,142,147,154,164,157,167,},{"Courageous Ascension",0,71,80,84,92,101,106,104,},{"Rabid Shadows",0,27,26,31,39,37,42,40,},{"Mind Devourer",0,55,60,66,75,71,66,73,},{"Haunting Apparitions",0,66,67,71,83,84,87,104,},{"Hammer of Genesis (Mikanikos)",8,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",245,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",181,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",38,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",42,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",122,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",195,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",210,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,144,149,150,166,167,175,175,},{"Haunting Apparitions",0,69,76,85,87,95,101,107,},{"Rabid Shadows",0,27,35,39,39,39,43,41,},{"Shattered Perceptions",0,33,41,35,37,45,35,48,},{"Exacting Preparation (Nadjia)",25,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",1,0,0,0,0,0,0,0,},{"Mind Devourer",0,65,68,62,68,77,80,76,},{"Built for War (Draven)",149,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",120,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",82,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",87,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",99,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",45,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,154,153,156,163,175,169,179,},{"Fae Fermata",0,-5,-9,-3,-11,-19,-3,-5,},{"Rabid Shadows",0,5,25,31,32,29,28,33,},{"Haunting Apparitions",0,64,79,80,86,87,98,109,},{"Wild Hunt Tactics (Korayn)",121,0,0,0,0,0,0,0,},{"Mind Devourer",0,57,58,68,71,65,76,77,},{"Niya's Tools: Poison (Niya)",-10,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",129,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",165,0,0,0,0,0,0,0,},{"First Strike (Korayn)",8,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",4,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",62,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",155,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,165,158,165,172,169,178,189,},{"Festering Transfusion",0,54,55,56,58,61,72,65,},{"Mind Devourer",0,73,69,81,79,83,85,81,},{"Haunting Apparitions",0,82,84,93,89,102,104,116,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",126,0,0,0,0,0,0,0,},{"Rabid Shadows",0,19,38,44,46,46,50,54,},{"Forgeborne Reveries (Heirmir)",122,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",8,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",32,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",118,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",89,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",49,0,0,0,0,0,0,0,},},},
		[266] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,-6,2,-6,-5,-5,-5,-3,},{"Fel Commando",0,57,62,70,77,78,82,87,},{"Tyrant's Soul",0,56,67,67,73,72,75,88,},{"Borne of Blood",0,74,75,86,87,102,103,111,},{"Carnivorous Stalkers",0,37,40,47,51,51,59,59,},{"Bron's Call to Action (Mikanikos)",32,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",28,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",103,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",138,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",83,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",66,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",77,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,22,30,26,30,30,29,31,},{"Fel Commando",0,55,66,69,77,84,93,93,},{"Borne of Blood",0,78,80,90,98,99,108,121,},{"Tyrant's Soul",0,60,64,70,77,78,78,86,},{"Exacting Preparation (Nadjia)",16,0,0,0,0,0,0,0,},{"Carnivorous Stalkers",0,42,46,47,51,54,63,63,},{"Dauntless Duelist (Nadjia)",94,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",51,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",41,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",76,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",50,0,0,0,0,0,0,0,},{"Built for War (Draven)",118,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-1,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,25,27,33,34,35,40,45,},{"Fel Commando",0,55,65,68,72,79,87,91,},{"Borne of Blood",0,72,75,84,95,104,106,115,},{"Tyrant's Soul",0,63,68,70,71,77,84,81,},{"Niya's Tools: Burrs (Niya)",170,0,0,0,0,0,0,0,},{"First Strike (Korayn)",6,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-3,0,0,0,0,0,0,0,},{"Carnivorous Stalkers",0,40,44,43,53,62,60,59,},{"Niya's Tools: Poison (Niya)",2,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",103,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",113,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",45,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",31,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,46,45,54,62,58,14,66,},{"Fel Commando",0,56,64,66,73,84,88,96,},{"Tyrant's Soul",0,62,67,73,72,73,82,86,},{"Borne of Blood",0,69,79,80,93,102,109,109,},{"Plaguey's Preemptive Strike (Marileth)",5,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",69,0,0,0,0,0,0,0,},{"Carnivorous Stalkers",0,46,45,52,48,59,62,73,},{"Forgeborne Reveries (Heirmir)",100,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",91,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",1,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",33,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",47,0,0,0,0,0,0,0,},},},
		[104] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,13,11,4,14,12,13,16,},{"Savage Combatant",0,67,69,78,85,95,96,103,},{"Pointed Courage (5 Allies) (Kleia)",94,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,45,49,56,60,65,64,72,},{"Pointed Courage (3 Allies) (Kleia)",50,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",16,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",131,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",51,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",70,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",0,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",42,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,27,32,32,33,32,38,41,},{"Savage Combatant",0,77,88,93,104,107,112,121,},{"Wasteland Propriety (Theotar)",40,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,67,79,79,85,92,100,99,},{"Soothing Shade (Theotar)",46,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",38,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",42,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",73,0,0,0,0,0,0,0,},{"Built for War (Draven)",68,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",5,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",17,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,55,58,63,66,71,77,87,},{"Savage Combatant",0,61,65,73,83,87,89,98,},{"Grove Invigoration (Niya)",104,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",33,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",42,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-3,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",75,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,40,37,48,52,58,63,66,},{"Niya's Tools: Burrs (Niya)",182,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",92,0,0,0,0,0,0,0,},{"First Strike (Korayn)",38,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,33,41,41,53,52,55,57,},{"Savage Combatant",0,71,74,79,83,91,98,104,},{"Lead by Example (4 Allies) (Emeni)",35,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",16,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,56,63,64,69,76,79,77,},{"Plaguey's Preemptive Strike (Marileth)",15,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",29,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",60,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",57,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},},},
		[103] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,-11,-14,-11,-15,-4,-9,-1,},{"Taste for Blood",0,68,78,82,90,101,104,111,},{"Bron's Call to Action (Mikanikos)",61,0,0,0,0,0,0,0,},{"Incessant Hunter",0,28,34,33,34,35,44,42,},{"Sudden Ambush",0,72,72,81,87,101,102,107,},{"Pointed Courage (5 Allies) (Kleia)",171,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",25,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",133,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",107,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",47,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",112,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",150,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,55,64,68,68,77,81,84,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,29,30,39,44,41,46,44,},{"Taste for Blood",0,58,66,69,76,87,90,92,},{"Incessant Hunter",0,17,20,25,20,27,25,34,},{"Dauntless Duelist (Nadjia)",101,0,0,0,0,0,0,0,},{"Built for War (Draven)",104,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",68,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",63,0,0,0,0,0,0,0,},{"Sudden Ambush",0,50,61,64,75,81,90,88,},{"Refined Palate (Theotar)",58,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",83,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,48,36,47,53,66,55,64,},{"Superior Tactics (Draven)",-6,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",11,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,62,61,73,78,82,86,101,},{"Taste for Blood",0,77,79,95,100,107,117,125,},{"Incessant Hunter",0,20,16,24,24,28,24,37,},{"Sudden Ambush",0,63,63,76,80,78,86,94,},{"Carnivorous Instinct",0,51,53,58,71,74,75,87,},{"Niya's Tools: Poison (Niya)",0,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",157,0,0,0,0,0,0,0,},{"First Strike (Korayn)",11,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-3,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",169,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",121,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",64,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",52,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,40,38,45,50,54,58,65,},{"Incessant Hunter",0,30,25,23,27,31,32,32,},{"Taste for Blood",0,60,66,80,83,83,90,87,},{"Sudden Ambush",0,69,80,78,85,98,99,107,},{"Lead by Example (4 Allies) (Emeni)",60,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",93,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",110,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",1,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",23,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,50,41,56,61,62,70,73,},{"Lead by Example (0 Allies) (Emeni)",22,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",49,0,0,0,0,0,0,0,},},},
		[259] ={{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,50,57,67,58,73,75,74,},{"Maim, Mangle",0,48,48,44,51,53,56,57,},{"Bron's Call to Action (Mikanikos)",38,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",88,0,0,0,0,0,0,0,},{"Poisoned Katar",0,9,11,4,10,7,15,10,},{"Combat Meditation (Never Extend) (Pelagos)",68,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",13,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,55,70,74,76,78,83,94,},{"Combat Meditation (Always Extend) (Pelagos)",111,0,0,0,0,0,0,0,},{"Reverberation",0,47,51,57,64,67,65,73,},{"Pointed Courage (1 Ally) (Kleia)",38,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",100,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",161,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,46,47,50,60,65,67,77,},{"Maim, Mangle",0,33,33,34,50,54,52,52,},{"Lashing Scars",0,35,47,40,49,52,49,59,},{"Poisoned Katar",0,-5,-5,-4,-3,2,5,2,},{"Refined Palate (Theotar)",95,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,42,51,56,55,62,72,73,},{"Exacting Preparation (Nadjia)",29,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",109,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",108,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",81,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",31,0,0,0,0,0,0,0,},{"Built for War (Draven)",114,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",74,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,43,51,45,57,69,62,69,},{"Maim, Mangle",0,30,29,38,40,45,41,50,},{"Wild Hunt Tactics (Korayn)",102,0,0,0,0,0,0,0,},{"Poisoned Katar",0,3,-2,-5,0,-2,-3,2,},{"Niya's Tools: Poison (Niya)",161,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,57,60,62,70,66,73,86,},{"Niya's Tools: Burrs (Niya)",195,0,0,0,0,0,0,0,},{"First Strike (Korayn)",13,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",132,0,0,0,0,0,0,0,},{"Septic Shock",0,28,33,35,42,45,52,56,},{"Grove Invigoration (Niya)",116,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",102,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",51,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,48,51,61,61,64,73,73,},{"Well-Placed Steel",0,48,57,71,65,69,78,81,},{"Poisoned Katar",0,-3,1,-1,8,5,2,2,},{"Forgeborne Reveries (Heirmir)",82,0,0,0,0,0,0,0,},{"Maim, Mangle",0,35,32,39,49,50,47,52,},{"Sudden Fractures",0,35,40,45,58,48,54,61,},{"Lead by Example (4 Allies) (Emeni)",83,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",18,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",6,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",63,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",37,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",106,0,0,0,0,0,0,0,},},},
		[267] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,-3,1,3,-3,-7,0,0,},{"Duplicitous Havoc",0,-9,-3,-6,-8,-4,-6,-5,},{"Ashen Remains",0,34,41,52,45,52,55,63,},{"Combat Meditation (Always Extend) (Pelagos)",109,0,0,0,0,0,0,0,},{"Infernal Brand",0,25,30,38,41,36,46,41,},{"Hammer of Genesis (Mikanikos)",3,0,0,0,0,0,0,0,},{"Combusting Engine",0,33,39,48,51,48,56,56,},{"Combat Meditation (50% Extend) (Pelagos)",90,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",63,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",26,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",30,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",85,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",141,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,23,32,34,28,38,30,38,},{"Combusting Engine",0,38,42,49,52,58,59,56,},{"Refined Palate (Theotar)",57,0,0,0,0,0,0,0,},{"Duplicitous Havoc",0,0,-1,1,0,-2,2,2,},{"Ashen Remains",0,36,47,47,48,62,60,61,},{"Dauntless Duelist (Nadjia)",105,0,0,0,0,0,0,0,},{"Infernal Brand",0,36,34,36,39,41,49,48,},{"Exacting Preparation (Nadjia)",13,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-1,0,0,0,0,0,0,0,},{"Built for War (Draven)",129,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",78,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",80,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",46,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,25,26,27,33,36,38,39,},{"Combusting Engine",0,36,44,40,50,49,53,62,},{"Duplicitous Havoc",0,-5,1,-3,5,-10,-2,-2,},{"Niya's Tools: Poison (Niya)",4,0,0,0,0,0,0,0,},{"Ashen Remains",0,45,48,45,55,59,64,61,},{"Infernal Brand",0,25,39,34,38,41,44,50,},{"Wild Hunt Tactics (Korayn)",104,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",48,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",125,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",3,0,0,0,0,0,0,0,},{"First Strike (Korayn)",21,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",166,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",85,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,51,44,53,62,60,14,63,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",76,0,0,0,0,0,0,0,},{"Duplicitous Havoc",0,3,2,8,-1,2,8,2,},{"Ashen Remains",0,52,55,56,64,63,75,77,},{"Lead by Example (4 Allies) (Emeni)",103,0,0,0,0,0,0,0,},{"Infernal Brand",0,30,33,45,41,49,50,55,},{"Forgeborne Reveries (Heirmir)",101,0,0,0,0,0,0,0,},{"Combusting Engine",0,43,41,49,62,61,59,69,},{"Gnashing Chompers (Emeni)",3,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",18,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",71,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",32,0,0,0,0,0,0,0,},},},
		[250] ={{{"Power",1,145,158,171,184,200,213,226,},{"Proliferation",0,49,48,52,60,62,64,65,},{"Debilitating Malady",0,0,6,1,3,4,3,6,},{"Withering Plague",0,17,17,19,22,21,22,27,},{"Bron's Call to Action (Mikanikos)",44,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",37,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",53,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",60,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",5,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",58,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",97,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",20,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Impenetrable Gloom",0,11,12,10,13,14,12,14,},{"Debilitating Malady",0,1,5,1,-3,3,2,3,},{"Wasteland Propriety (Theotar)",21,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",-1,0,0,0,0,0,0,0,},{"Withering Plague",0,14,18,17,22,19,17,18,},{"Refined Palate (Theotar)",96,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",35,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",58,0,0,0,0,0,0,0,},{"Built for War (Draven)",63,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",1,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",43,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Withering Ground",0,43,45,48,51,56,61,62,},{"Debilitating Malady",0,2,-1,1,0,-4,2,1,},{"Grove Invigoration (Niya)",59,0,0,0,0,0,0,0,},{"Withering Plague",0,13,19,18,20,17,21,22,},{"Niya's Tools: Herbs (Niya)",20,0,0,0,0,0,0,0,},{"First Strike (Korayn)",17,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",180,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",0,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",53,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",64,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",27,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brutal Grasp",0,12,12,15,16,16,16,16,},{"Debilitating Malady",0,6,2,3,2,2,4,3,},{"Lead by Example (0 Allies) (Emeni)",23,0,0,0,0,0,0,0,},{"Withering Plague",0,16,19,23,22,26,25,32,},{"Plaguey's Preemptive Strike (Marileth)",9,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-2,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",47,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",48,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",38,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",55,0,0,0,0,0,0,0,},},},
		[254] ={{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,22,27,32,41,44,48,61,},{"Brutal Projectiles",0,-1,5,2,2,10,2,4,},{"Enfeebled Mark",0,91,96,110,124,127,128,151,},{"Sharpshooter's Focus",0,34,41,39,51,49,55,58,},{"Deadly Chain",0,-3,3,-5,-3,3,-9,1,},{"Combat Meditation (50% Extend) (Pelagos)",136,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",6,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",164,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",99,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",48,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",32,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",161,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",95,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,15,24,29,32,38,47,46,},{"Brutal Projectiles",0,3,-4,-3,0,4,7,-4,},{"Empowered Release",0,41,41,36,44,46,37,42,},{"Deadly Chain",0,-15,-4,-6,-1,-7,-2,-5,},{"Sharpshooter's Focus",0,25,30,41,45,42,45,57,},{"Built for War (Draven)",112,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",114,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",65,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",57,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",78,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-6,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",22,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",30,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,24,28,30,40,50,49,51,},{"Spirit Attunement",0,94,91,102,111,109,112,118,},{"Sharpshooter's Focus",0,33,40,42,49,52,52,55,},{"Wild Hunt Tactics (Korayn)",146,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",124,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",159,0,0,0,0,0,0,0,},{"Brutal Projectiles",0,1,-3,-3,0,5,9,-5,},{"Niya's Tools: Burrs (Niya)",154,0,0,0,0,0,0,0,},{"First Strike (Korayn)",10,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",1,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",52,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",207,0,0,0,0,0,0,0,},{"Deadly Chain",0,-8,-3,-11,-2,-6,-3,-1,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,26,35,44,39,54,60,61,},{"Necrotic Barrage",0,30,32,30,39,43,52,48,},{"Brutal Projectiles",0,9,12,6,6,1,6,19,},{"Deadly Chain",0,6,7,9,1,5,14,8,},{"Lead by Example (2 Allies) (Emeni)",66,0,0,0,0,0,0,0,},{"Sharpshooter's Focus",0,49,42,47,52,61,64,57,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",111,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",98,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",1,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",41,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",40,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",105,0,0,0,0,0,0,0,},},},
		[260] ={{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,135,150,145,166,179,192,216,},{"Hammer of Genesis (Mikanikos)",4,0,0,0,0,0,0,0,},{"Reverberation",0,40,50,60,55,62,63,70,},{"Triple Threat",0,43,50,54,57,61,64,72,},{"Sleight of Hand",0,53,54,59,62,65,70,73,},{"Combat Meditation (Always Extend) (Pelagos)",98,0,0,0,0,0,0,0,},{"Ambidexterity",0,0,6,7,5,9,0,5,},{"Combat Meditation (50% Extend) (Pelagos)",67,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",107,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",98,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",156,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",49,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",25,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,133,146,163,172,189,199,214,},{"Triple Threat",0,45,51,59,62,62,60,76,},{"Lashing Scars",0,48,53,64,56,71,64,66,},{"Thrill Seeker (Nadjia)",82,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",41,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",102,0,0,0,0,0,0,0,},{"Sleight of Hand",0,46,53,66,67,69,76,80,},{"Built for War (Draven)",128,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",124,0,0,0,0,0,0,0,},{"Ambidexterity",0,2,4,2,8,4,5,3,},{"Refined Palate (Theotar)",113,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",41,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",78,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,124,135,156,176,183,200,219,},{"Septic Shock",0,26,26,34,36,45,52,51,},{"Triple Threat",0,39,46,51,43,55,61,66,},{"Field of Blossoms (Dreamweaver)",81,0,0,0,0,0,0,0,},{"Sleight of Hand",0,44,48,65,58,68,66,70,},{"Niya's Tools: Burrs (Niya)",224,0,0,0,0,0,0,0,},{"First Strike (Korayn)",21,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",122,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",192,0,0,0,0,0,0,0,},{"Ambidexterity",0,-2,-3,3,2,-5,-2,0,},{"Social Butterfly (Dreamweaver)",58,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",111,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",112,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,124,135,142,157,171,191,204,},{"Triple Threat",0,38,40,50,53,49,51,65,},{"Sudden Fractures",0,22,28,40,35,31,33,40,},{"Lead by Example (4 Allies) (Emeni)",67,0,0,0,0,0,0,0,},{"Sleight of Hand",0,39,51,49,53,57,62,66,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",86,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",95,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",18,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",45,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",25,0,0,0,0,0,0,0,},{"Ambidexterity",0,6,1,0,-1,-8,-4,3,},},},
		[71] ={{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,54,53,58,67,70,69,81,},{"Ashen Juggernaut",0,96,104,110,116,130,144,151,},{"Piercing Verdict",0,17,25,23,32,28,29,34,},{"Crash the Ramparts",0,34,44,39,43,52,56,57,},{"Merciless Bonegrinder",0,2,0,-6,4,7,5,4,},{"Hammer of Genesis (Mikanikos)",12,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",99,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",78,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",130,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",59,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",27,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",63,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",79,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,31,43,39,34,43,53,56,},{"Crash the Ramparts",0,18,27,25,33,32,32,47,},{"Ashen Juggernaut",0,96,116,122,129,142,150,163,},{"Dauntless Duelist (Nadjia)",104,0,0,0,0,0,0,0,},{"Built for War (Draven)",106,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",55,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",83,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",67,0,0,0,0,0,0,0,},{"Harrowing Punishment",0,19,25,27,22,29,22,29,},{"Merciless Bonegrinder",0,-4,-5,-9,-3,-3,-1,-1,},{"Superior Tactics (Draven)",-3,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",5,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",-8,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,4,13,15,19,21,18,34,},{"Crash the Ramparts",0,33,43,43,37,42,48,55,},{"Ashen Juggernaut",0,88,101,113,117,133,132,147,},{"Merciless Bonegrinder",0,1,5,6,2,-4,0,-1,},{"Social Butterfly (Dreamweaver)",48,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",128,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",77,0,0,0,0,0,0,0,},{"Mortal Combo",0,52,49,56,66,64,77,73,},{"Niya's Tools: Burrs (Niya)",156,0,0,0,0,0,0,0,},{"First Strike (Korayn)",25,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",2,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",84,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,50,53,60,66,73,75,82,},{"Ashen Juggernaut",0,108,123,123,138,141,158,171,},{"Veteran's Repute",0,48,61,59,70,74,77,77,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",72,0,0,0,0,0,0,0,},{"Crash the Ramparts",0,36,42,41,48,47,55,57,},{"Gnashing Chompers (Emeni)",-2,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",15,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",3,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",2,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",0,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",78,0,0,0,0,0,0,0,},{"Merciless Bonegrinder",0,1,-1,2,0,-4,4,-4,},},},
		[73] ={{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,3,3,2,2,8,4,6,},{"Piercing Verdict",0,10,14,8,12,16,22,18,},{"Ashen Juggernaut",0,19,19,19,22,26,28,25,},{"Bron's Call to Action (Mikanikos)",61,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",10,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",103,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",111,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",61,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",141,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",80,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",17,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,1,1,2,4,5,4,10,},{"Harrowing Punishment",0,11,11,12,10,16,16,12,},{"Ashen Juggernaut",0,22,27,28,32,33,31,40,},{"Dauntless Duelist (Nadjia)",74,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",2,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",8,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",109,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",52,0,0,0,0,0,0,0,},{"Built for War (Draven)",70,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",103,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",-1,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,14,18,25,25,27,29,38,},{"Show of Force",0,-3,0,-4,1,-3,1,0,},{"Ashen Juggernaut",0,15,16,19,17,17,19,22,},{"Wild Hunt Tactics (Korayn)",65,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",32,0,0,0,0,0,0,0,},{"First Strike (Korayn)",23,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",137,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",1,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",51,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",2,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",151,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,0,3,-3,3,1,5,5,},{"Veteran's Repute",0,29,36,35,40,38,40,46,},{"Ashen Juggernaut",0,19,19,21,25,23,24,28,},{"Plaguey's Preemptive Strike (Marileth)",16,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",5,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",54,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",5,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",5,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",-2,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",50,0,0,0,0,0,0,0,},},},
		[102] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,-8,-7,-2,-7,-8,-5,-9,},{"Stellar Inspiration",0,25,24,30,29,36,36,42,},{"Hammer of Genesis (Mikanikos)",6,0,0,0,0,0,0,0,},{"Precise Alignment",0,27,34,31,40,39,39,47,},{"Umbral Intensity",0,38,32,44,44,51,49,65,},{"Combat Meditation (Always Extend) (Pelagos)",176,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",166,0,0,0,0,0,0,0,},{"Fury of the Skies",0,48,54,62,69,76,84,95,},{"Combat Meditation (Never Extend) (Pelagos)",152,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",54,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",80,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",149,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",26,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,60,72,77,83,92,93,106,},{"Stellar Inspiration",0,26,28,28,36,35,42,44,},{"Refined Palate (Theotar)",66,0,0,0,0,0,0,0,},{"Fury of the Skies",0,59,71,75,81,84,95,99,},{"Built for War (Draven)",152,0,0,0,0,0,0,0,},{"Precise Alignment",0,43,42,41,53,66,70,87,},{"Wasteland Propriety (Theotar)",90,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",83,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",88,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",2,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",30,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",120,0,0,0,0,0,0,0,},{"Umbral Intensity",0,48,52,57,60,65,83,62,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,105,111,123,136,147,150,168,},{"Stellar Inspiration",0,28,27,41,39,48,48,51,},{"Wild Hunt Tactics (Korayn)",131,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-1,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",100,0,0,0,0,0,0,0,},{"Fury of the Skies",0,62,67,68,83,92,99,92,},{"Niya's Tools: Herbs (Niya)",-3,0,0,0,0,0,0,0,},{"Umbral Intensity",0,41,44,48,49,53,59,71,},{"Grove Invigoration (Niya)",250,0,0,0,0,0,0,0,},{"Precise Alignment",0,-1,-5,6,12,17,18,21,},{"Social Butterfly (Dreamweaver)",44,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",168,0,0,0,0,0,0,0,},{"First Strike (Korayn)",9,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,50,57,60,65,69,78,76,},{"Precise Alignment",0,33,50,48,39,52,50,58,},{"Plaguey's Preemptive Strike (Marileth)",20,0,0,0,0,0,0,0,},{"Stellar Inspiration",0,30,28,31,35,39,45,48,},{"Gnashing Chompers (Emeni)",13,0,0,0,0,0,0,0,},{"Fury of the Skies",0,61,71,67,87,81,96,94,},{"Umbral Intensity",0,42,43,48,49,63,68,58,},{"Forgeborne Reveries (Heirmir)",126,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",52,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",32,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",96,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",25,0,0,0,0,0,0,0,},},},
		[261] ={{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,61,64,67,68,79,91,95,},{"Reverberation",0,56,70,80,84,81,92,99,},{"Hammer of Genesis (Mikanikos)",-2,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",103,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",77,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",52,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",70,0,0,0,0,0,0,0,},{"Stiletto Staccato",0,67,64,79,107,109,100,91,},{"Pointed Courage (1 Ally) (Kleia)",35,0,0,0,0,0,0,0,},{"Deeper Daggers",0,49,54,61,69,65,70,77,},{"Pointed Courage (3 Allies) (Kleia)",110,0,0,0,0,0,0,0,},{"Planned Execution",0,64,71,79,86,87,95,97,},{"Pointed Courage (5 Allies) (Kleia)",171,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,62,70,78,72,94,92,104,},{"Lashing Scars",0,60,62,84,73,79,90,101,},{"Thrill Seeker (Nadjia)",79,0,0,0,0,0,0,0,},{"Stiletto Staccato",0,51,57,91,111,110,96,89,},{"Built for War (Draven)",156,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",150,0,0,0,0,0,0,0,},{"Deeper Daggers",0,66,72,71,77,81,92,93,},{"Refined Palate (Theotar)",99,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",78,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",73,0,0,0,0,0,0,0,},{"Planned Execution",0,76,85,82,96,104,107,112,},{"Exacting Preparation (Nadjia)",54,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",174,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,40,54,69,56,65,80,77,},{"Septic Shock",0,29,37,42,44,59,72,77,},{"Stiletto Staccato",0,34,30,46,75,90,79,75,},{"Planned Execution",0,65,65,78,80,81,97,100,},{"Field of Blossoms (Dreamweaver)",70,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",137,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",155,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",174,0,0,0,0,0,0,0,},{"First Strike (Korayn)",8,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",118,0,0,0,0,0,0,0,},{"Deeper Daggers",0,39,48,53,48,57,69,71,},{"Social Butterfly (Dreamweaver)",56,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",101,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,47,47,59,65,64,68,86,},{"Sudden Fractures",0,36,30,33,30,41,50,47,},{"Deeper Daggers",0,42,48,43,56,57,67,61,},{"Stiletto Staccato",0,40,40,63,87,94,79,67,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",100,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-5,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",14,0,0,0,0,0,0,0,},{"Planned Execution",0,53,63,79,80,75,91,89,},{"Lead by Example (2 Allies) (Emeni)",57,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",26,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",82,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",95,0,0,0,0,0,0,0,},},},
		[269] ={{{"Power",1,145,158,171,184,200,213,226,},{"Strike with Clarity",0,76,64,73,73,74,79,73,},{"Inner Fury",0,17,20,23,28,31,37,31,},{"Calculated Strikes",0,-6,-6,-8,-12,-4,-3,-6,},{"Combat Meditation (Never Extend) (Pelagos)",79,0,0,0,0,0,0,0,},{"Coordinated Offensive",0,-2,-1,-8,-3,-8,-4,-9,},{"Xuen's Bond",0,41,37,36,40,47,52,53,},{"Hammer of Genesis (Mikanikos)",15,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",99,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",85,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",31,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",85,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",154,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",128,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Imbued Reflections",0,55,59,64,68,69,76,78,},{"Calculated Strikes",0,12,11,9,9,11,15,9,},{"Inner Fury",0,38,42,43,45,46,55,53,},{"Dauntless Duelist (Nadjia)",77,0,0,0,0,0,0,0,},{"Built for War (Draven)",118,0,0,0,0,0,0,0,},{"Coordinated Offensive",0,9,12,8,7,7,12,12,},{"Xuen's Bond",0,50,55,47,54,60,57,71,},{"Thrill Seeker (Nadjia)",63,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",82,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",71,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",71,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",30,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",127,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Way of the Fae",0,6,8,11,4,12,12,12,},{"Grove Invigoration (Niya)",176,0,0,0,0,0,0,0,},{"Calculated Strikes",0,-2,-8,-1,0,-5,3,1,},{"Inner Fury",0,26,27,27,29,37,42,37,},{"Coordinated Offensive",0,-5,-4,-2,1,-3,-6,-3,},{"Xuen's Bond",0,31,40,39,40,47,47,51,},{"Wild Hunt Tactics (Korayn)",69,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",144,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",87,0,0,0,0,0,0,0,},{"First Strike (Korayn)",19,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",177,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",51,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",30,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bone Marrow Hops",0,49,59,75,79,82,90,106,},{"Calculated Strikes",0,-8,1,0,2,-1,-8,-4,},{"Inner Fury",0,35,29,34,36,41,38,40,},{"Coordinated Offensive",0,1,-8,-1,3,2,-4,-1,},{"Gnashing Chompers (Emeni)",-1,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",38,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",85,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",88,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",3,0,0,0,0,0,0,0,},{"Xuen's Bond",0,23,24,38,35,35,36,47,},{"Lead by Example (4 Allies) (Emeni)",109,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",76,0,0,0,0,0,0,0,},},},
		[268] ={{{"Power",1,145,158,171,184,200,213,226,},{"Strike with Clarity",0,31,37,35,40,31,44,36,},{"Walk with the Ox",0,308,315,329,342,361,367,384,},{"Scalding Brew",0,14,15,25,20,23,24,27,},{"Bron's Call to Action (Mikanikos)",106,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",13,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",71,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",25,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",38,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",108,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",66,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",59,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Imbued Reflections",0,23,21,26,33,33,35,29,},{"Walk with the Ox",0,273,286,305,311,326,338,352,},{"Scalding Brew",0,13,16,8,19,16,17,15,},{"Built for War (Draven)",66,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",34,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",10,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",35,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",43,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",60,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",13,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",111,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Way of the Fae",0,5,5,8,7,5,15,12,},{"Walk with the Ox",0,271,291,298,310,325,334,345,},{"Scalding Brew",0,8,13,13,20,15,16,14,},{"Wild Hunt Tactics (Korayn)",62,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",64,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",35,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",40,0,0,0,0,0,0,0,},{"First Strike (Korayn)",16,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",156,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",107,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",68,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bone Marrow Hops",0,72,78,87,89,92,104,113,},{"Walk with the Ox",0,291,310,322,329,345,360,367,},{"Scalding Brew",0,11,10,14,16,18,21,17,},{"Lead by Example (0 Allies) (Emeni)",25,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",4,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",17,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",70,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",47,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",53,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",68,0,0,0,0,0,0,0,},},},
		[63] ={{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,74,80,88,90,102,107,111,},{"Flame Accretion",0,-9,4,4,5,16,20,27,},{"Pointed Courage (3 Allies) (Kleia)",59,0,0,0,0,0,0,0,},{"Ire of the Ascended",0,60,66,63,80,83,86,92,},{"Bron's Call to Action (Mikanikos)",57,0,0,0,0,0,0,0,},{"Infernal Cascade",0,231,256,277,303,342,356,372,},{"Master Flame",0,-1,-3,-7,-3,-3,8,0,},{"Pointed Courage (1 Ally) (Kleia)",14,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",149,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",125,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",100,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",88,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",-9,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,76,75,82,92,97,109,103,},{"Flame Accretion",0,11,9,17,18,23,28,35,},{"Refined Palate (Theotar)",36,0,0,0,0,0,0,0,},{"Infernal Cascade",0,250,278,312,334,360,381,408,},{"Master Flame",0,1,-4,-10,-6,-6,-3,-1,},{"Siphoned Malice",0,41,48,48,49,59,65,71,},{"Exacting Preparation (Nadjia)",17,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",44,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",105,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",93,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",66,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",61,0,0,0,0,0,0,0,},{"Built for War (Draven)",139,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,73,84,82,96,99,105,113,},{"Flame Accretion",0,6,5,16,20,25,32,31,},{"Infernal Cascade",0,261,284,311,341,364,390,415,},{"Discipline of the Grove",0,77,86,91,90,87,81,69,},{"Social Butterfly (Dreamweaver)",52,0,0,0,0,0,0,0,},{"Master Flame",0,4,-2,5,1,3,-3,1,},{"Niya's Tools: Burrs (Niya)",181,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",1,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",114,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",112,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",80,0,0,0,0,0,0,0,},{"First Strike (Korayn)",1,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",37,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,72,74,78,95,95,111,112,},{"Lead by Example (4 Allies) (Emeni)",164,0,0,0,0,0,0,0,},{"Infernal Cascade",0,244,272,295,328,350,378,403,},{"Master Flame",0,1,-2,0,-9,-8,-3,2,},{"Flame Accretion",0,0,7,11,16,21,29,40,},{"Gift of the Lich",0,9,6,10,6,8,6,13,},{"Lead by Example (0 Allies) (Emeni)",62,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",96,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-1,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",32,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",9,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",103,0,0,0,0,0,0,0,},},},
	},
	["T26"]={
		[255] ={{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,1,4,5,3,-3,9,4,},{"Enfeebled Mark",0,103,104,114,119,135,130,148,},{"Strength of the Pack",0,73,76,95,109,106,112,131,},{"Stinging Strike",0,71,70,70,77,84,89,100,},{"Combat Meditation (50% Extend) (Pelagos)",82,0,0,0,0,0,0,0,},{"Deadly Tandem",0,49,50,44,51,58,62,65,},{"Hammer of Genesis (Mikanikos)",9,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",123,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",66,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",95,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",47,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",125,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",205,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,-10,1,-8,-4,-3,7,-4,},{"Strength of the Pack",0,63,74,82,84,101,103,114,},{"Stinging Strike",0,49,59,64,62,70,69,78,},{"Deadly Tandem",0,27,41,39,42,46,55,61,},{"Empowered Release",0,63,60,65,66,66,80,65,},{"Built for War (Draven)",153,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",155,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",101,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",66,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",64,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",146,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",19,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",38,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,-3,0,-4,1,-1,-2,2,},{"Spirit Attunement",0,95,91,102,108,115,103,115,},{"Deadly Tandem",0,35,36,44,45,44,54,54,},{"Stinging Strike",0,64,59,62,68,94,90,90,},{"Strength of the Pack",0,58,72,86,106,102,114,126,},{"Wild Hunt Tactics (Korayn)",128,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",219,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",174,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",258,0,0,0,0,0,0,0,},{"First Strike (Korayn)",27,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-6,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",67,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",121,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Flame Infusion",0,7,-2,-7,0,-3,-7,7,},{"Strength of the Pack",0,59,59,79,81,99,107,121,},{"Necrotic Barrage",0,19,12,27,19,22,27,32,},{"Lead by Example (2 Allies) (Emeni)",76,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",48,0,0,0,0,0,0,0,},{"Stinging Strike",0,47,57,66,68,74,85,96,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",113,0,0,0,0,0,0,0,},{"Deadly Tandem",0,36,36,51,50,41,58,61,},{"Forgeborne Reveries (Heirmir)",127,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-6,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",21,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",112,0,0,0,0,0,0,0,},},},
		[262] ={{{"Power",1,145,158,171,184,200,213,226,},{"Elysian Dirge",0,29,45,42,49,58,52,58,},{"Pyroclastic Shock",0,37,46,61,53,58,69,67,},{"Shake the Foundations",0,2,-2,0,-11,-1,8,-4,},{"Hammer of Genesis (Mikanikos)",5,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",106,0,0,0,0,0,0,0,},{"Call of Flame",0,79,72,89,72,86,97,100,},{"Combat Meditation (50% Extend) (Pelagos)",90,0,0,0,0,0,0,0,},{"High Voltage",0,5,6,12,3,12,12,3,},{"Combat Meditation (Never Extend) (Pelagos)",60,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",60,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",34,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",132,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",227,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lavish Harvest",0,13,2,-8,8,1,6,2,},{"High Voltage",0,16,3,6,13,13,26,12,},{"Shake the Foundations",0,4,-2,7,2,10,9,3,},{"Pyroclastic Shock",0,42,49,43,46,54,59,60,},{"Call of Flame",0,88,89,87,72,91,86,104,},{"Built for War (Draven)",227,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",173,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",91,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",79,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",41,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",135,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",20,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",81,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Essential Extraction",0,56,38,48,38,46,46,39,},{"Pyroclastic Shock",0,52,63,63,56,56,65,65,},{"High Voltage",0,24,12,12,18,22,16,23,},{"Social Butterfly (Dreamweaver)",83,0,0,0,0,0,0,0,},{"Shake the Foundations",0,-5,-10,-6,4,4,-15,2,},{"Field of Blossoms (Dreamweaver)",138,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",249,0,0,0,0,0,0,0,},{"First Strike (Korayn)",32,0,0,0,0,0,0,0,},{"Call of Flame",0,84,94,88,90,98,102,105,},{"Grove Invigoration (Niya)",158,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",4,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",195,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",180,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Tumbling Waves",0,33,29,44,41,45,52,47,},{"High Voltage",0,39,22,18,32,28,24,32,},{"Shake the Foundations",0,13,20,10,9,19,1,13,},{"Pyroclastic Shock",0,55,53,50,59,69,70,68,},{"Lead by Example (4 Allies) (Emeni)",166,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",136,0,0,0,0,0,0,0,},{"Call of Flame",0,107,127,110,114,109,122,118,},{"Gnashing Chompers (Emeni)",9,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",48,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",115,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",72,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",178,0,0,0,0,0,0,0,},},},
		[62] ={{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,7,8,-6,3,5,12,3,},{"Combat Meditation (Never Extend) (Pelagos)",57,0,0,0,0,0,0,0,},{"Nether Precision",0,23,28,38,35,41,46,50,},{"Arcane Prodigy",0,99,99,100,104,141,148,144,},{"Pointed Courage (3 Allies) (Kleia)",150,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",6,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",105,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",57,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",52,0,0,0,0,0,0,0,},{"Magi's Brand",0,98,113,115,129,143,144,160,},{"Pointed Courage (5 Allies) (Kleia)",248,0,0,0,0,0,0,0,},{"Ire of the Ascended",0,89,90,104,99,114,136,136,},{"Combat Meditation (50% Extend) (Pelagos)",80,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,3,-3,-2,-2,7,2,9,},{"Nether Precision",0,38,38,31,40,41,42,40,},{"Arcane Prodigy",0,119,124,124,120,166,164,169,},{"Magi's Brand",0,101,117,112,133,141,156,170,},{"Built for War (Draven)",218,0,0,0,0,0,0,0,},{"Siphoned Malice",0,52,82,82,103,100,108,124,},{"Soothing Shade (Theotar)",80,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",52,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",64,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",29,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",181,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",123,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",53,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,-6,3,3,-6,8,8,4,},{"Arcane Prodigy",0,-13,-13,-13,-20,4,-5,-16,},{"Field of Blossoms (Dreamweaver)",40,0,0,0,0,0,0,0,},{"Discipline of the Grove",0,-29,7,52,80,105,126,141,},{"Wild Hunt Tactics (Korayn)",236,0,0,0,0,0,0,0,},{"Nether Precision",0,21,24,40,38,51,56,52,},{"Niya's Tools: Poison (Niya)",135,0,0,0,0,0,0,0,},{"Magi's Brand",0,134,124,130,147,160,167,178,},{"Niya's Tools: Burrs (Niya)",207,0,0,0,0,0,0,0,},{"First Strike (Korayn)",17,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-5,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",92,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",89,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Artifice of the Archmage",0,16,16,11,16,10,17,10,},{"Nether Precision",0,48,38,42,43,58,51,59,},{"Arcane Prodigy",0,115,118,114,127,160,155,150,},{"Gift of the Lich",0,60,70,69,74,76,85,93,},{"Magi's Brand",0,111,113,125,134,143,150,159,},{"Gnashing Chompers (Emeni)",-4,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",192,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",173,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",203,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",287,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",119,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",28,0,0,0,0,0,0,0,},},},
		[263] ={{{"Power",1,145,158,171,184,200,213,226,},{"Elysian Dirge",0,40,40,31,38,49,45,51,},{"Unruly Winds",0,45,45,46,47,48,43,66,},{"Combat Meditation (50% Extend) (Pelagos)",126,0,0,0,0,0,0,0,},{"Magma Fist",0,31,28,29,39,30,36,28,},{"Chilled to the Core",0,24,37,24,36,29,32,26,},{"Hammer of Genesis (Mikanikos)",6,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",162,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",93,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",149,0,0,0,0,0,0,0,},{"Focused Lightning",0,43,37,57,57,63,70,76,},{"Pointed Courage (1 Ally) (Kleia)",34,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",143,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",231,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lavish Harvest",0,35,27,27,23,27,28,35,},{"Unruly Winds",0,54,62,66,66,72,78,75,},{"Thrill Seeker (Nadjia)",154,0,0,0,0,0,0,0,},{"Chilled to the Core",0,46,54,46,48,46,55,53,},{"Magma Fist",0,41,48,44,48,48,46,41,},{"Refined Palate (Theotar)",110,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",122,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",161,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",165,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",51,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",74,0,0,0,0,0,0,0,},{"Focused Lightning",0,48,57,65,75,85,94,104,},{"Built for War (Draven)",189,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Essential Extraction",0,54,61,59,51,48,59,46,},{"Magma Fist",0,50,43,49,47,54,43,56,},{"Unruly Winds",0,57,66,66,72,68,74,74,},{"Chilled to the Core",0,56,46,50,52,50,54,50,},{"Wild Hunt Tactics (Korayn)",167,0,0,0,0,0,0,0,},{"Focused Lightning",0,44,55,70,76,77,99,108,},{"Niya's Tools: Poison (Niya)",209,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",167,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",264,0,0,0,0,0,0,0,},{"First Strike (Korayn)",62,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",8,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",89,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",264,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Tumbling Waves",0,23,25,24,39,32,36,38,},{"Focused Lightning",0,33,48,53,70,77,71,85,},{"Plaguey's Preemptive Strike (Marileth)",36,0,0,0,0,0,0,0,},{"Magma Fist",0,28,36,43,26,32,36,39,},{"Unruly Winds",0,55,53,45,64,53,67,54,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",145,0,0,0,0,0,0,0,},{"Chilled to the Core",0,39,43,44,35,47,43,56,},{"Forgeborne Reveries (Heirmir)",166,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",124,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",85,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",40,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",5,0,0,0,0,0,0,0,},},},
		[64] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ire of the Ascended",0,67,74,88,102,112,127,129,},{"Unrelenting Cold",0,39,44,43,42,44,50,51,},{"Shivering Core",0,1,-7,0,-3,-6,-13,-4,},{"Ice Bite",0,107,102,103,114,123,133,145,},{"Combat Meditation (Always Extend) (Pelagos)",106,0,0,0,0,0,0,0,},{"Icy Propulsion",0,290,329,392,467,522,613,701,},{"Combat Meditation (Never Extend) (Pelagos)",44,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",32,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",82,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",134,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",80,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",66,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",9,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Siphoned Malice",0,82,83,85,95,111,105,111,},{"Unrelenting Cold",0,33,37,31,41,45,48,53,},{"Shivering Core",0,-8,3,-4,-11,4,-3,0,},{"Ice Bite",0,97,101,118,124,140,138,159,},{"Built for War (Draven)",183,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",157,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",83,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",126,0,0,0,0,0,0,0,},{"Icy Propulsion",0,329,404,475,550,615,705,798,},{"Soothing Shade (Theotar)",95,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",58,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",27,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",87,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Discipline of the Grove",0,-4,9,1,-1,3,-4,-3,},{"Unrelenting Cold",0,34,31,40,46,48,44,47,},{"Shivering Core",0,-5,-6,2,3,-7,5,-2,},{"Ice Bite",0,95,101,104,123,119,128,143,},{"Wild Hunt Tactics (Korayn)",172,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",146,0,0,0,0,0,0,0,},{"Icy Propulsion",0,315,362,432,507,588,676,753,},{"Field of Blossoms (Dreamweaver)",12,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",6,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",80,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",263,0,0,0,0,0,0,0,},{"First Strike (Korayn)",19,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",77,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Gift of the Lich",0,23,28,22,22,28,32,45,},{"Shivering Core",0,-10,-14,-8,-16,-8,-7,-6,},{"Unrelenting Cold",0,17,30,21,43,39,37,47,},{"Forgeborne Reveries (Heirmir)",138,0,0,0,0,0,0,0,},{"Ice Bite",0,80,99,106,120,110,127,127,},{"Icy Propulsion",0,287,343,403,486,547,634,736,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",36,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-16,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",199,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",113,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",65,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",30,0,0,0,0,0,0,0,},},},
		[66] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ringing Clarity",0,70,76,91,92,92,100,103,},{"Punish the Guilty",0,66,83,91,95,101,107,124,},{"Pointed Courage (5 Allies) (Kleia)",172,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",103,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",171,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",65,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",95,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",39,0,0,0,0,0,0,0,},{"Vengeful Shock",0,60,53,76,64,77,82,91,},{"Combat Meditation (Always Extend) (Pelagos)",118,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",14,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Hallowed Discernment",0,113,130,143,144,154,177,173,},{"Punish the Guilty",0,62,70,78,84,88,94,101,},{"Wasteland Propriety (Theotar)",88,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",4,0,0,0,0,0,0,0,},{"Vengeful Shock",0,43,68,56,61,62,67,76,},{"Refined Palate (Theotar)",95,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",74,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",129,0,0,0,0,0,0,0,},{"Built for War (Draven)",128,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",87,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-8,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"The Long Summer",0,0,0,12,7,12,19,17,},{"Punish the Guilty",0,70,71,84,96,97,104,102,},{"Grove Invigoration (Niya)",122,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",50,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-8,0,0,0,0,0,0,0,},{"First Strike (Korayn)",35,0,0,0,0,0,0,0,},{"Vengeful Shock",0,45,45,53,50,63,68,66,},{"Niya's Tools: Burrs (Niya)",254,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",104,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-9,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",133,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Righteous Might",0,28,28,36,32,41,46,47,},{"Punish the Guilty",0,66,66,65,86,92,110,111,},{"Lead by Example (0 Allies) (Emeni)",11,0,0,0,0,0,0,0,},{"Vengeful Shock",0,37,37,42,54,51,62,68,},{"Lead by Example (2 Allies) (Emeni)",37,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",60,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",21,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-8,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",101,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",94,0,0,0,0,0,0,0,},},},
		[70] ={{{"Power",1,145,158,171,184,200,213,226,},{"Ringing Clarity",0,162,171,192,211,211,237,249,},{"Expurgation",0,152,168,172,193,199,209,238,},{"Truth's Wake",0,35,30,40,47,48,48,49,},{"Virtuous Command",0,203,220,244,266,282,292,317,},{"Pointed Courage (5 Allies) (Kleia)",225,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",10,0,0,0,0,0,0,0,},{"Templar's Vindication",0,172,197,208,216,234,250,280,},{"Combat Meditation (Always Extend) (Pelagos)",189,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",143,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",110,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",53,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",125,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",113,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Hallowed Discernment",0,103,115,125,130,145,153,157,},{"Truth's Wake",0,28,34,39,25,24,40,41,},{"Expurgation",0,136,151,172,179,185,203,213,},{"Dauntless Duelist (Nadjia)",158,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",79,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",86,0,0,0,0,0,0,0,},{"Templar's Vindication",0,160,173,198,208,232,238,261,},{"Virtuous Command",0,187,203,222,228,251,263,287,},{"Soothing Shade (Theotar)",110,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-5,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",20,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",124,0,0,0,0,0,0,0,},{"Built for War (Draven)",170,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"The Long Summer",0,33,22,38,49,43,45,52,},{"Truth's Wake",0,17,24,26,30,34,30,39,},{"Expurgation",0,136,151,159,182,186,210,224,},{"Virtuous Command",0,186,199,204,231,256,274,300,},{"Social Butterfly (Dreamweaver)",74,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",162,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-15,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",120,0,0,0,0,0,0,0,},{"Templar's Vindication",0,171,191,199,217,239,246,262,},{"Niya's Tools: Burrs (Niya)",249,0,0,0,0,0,0,0,},{"First Strike (Korayn)",29,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-8,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",173,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Righteous Might",0,22,22,30,42,35,33,46,},{"Expurgation",0,144,160,172,183,196,209,231,},{"Plaguey's Preemptive Strike (Marileth)",35,0,0,0,0,0,0,0,},{"Virtuous Command",0,164,193,212,245,232,260,275,},{"Truth's Wake",0,28,40,30,35,33,34,44,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",99,0,0,0,0,0,0,0,},{"Templar's Vindication",0,168,186,193,203,231,246,255,},{"Forgeborne Reveries (Heirmir)",124,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",102,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",69,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",41,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-8,0,0,0,0,0,0,0,},},},
		[72] ={{{"Power",1,145,158,171,184,200,213,226,},{"Piercing Verdict",0,31,33,24,38,41,43,55,},{"Depths of Insanity",0,40,52,58,54,60,70,64,},{"Ashen Juggernaut",0,105,117,134,142,146,156,166,},{"Hammer of Genesis (Mikanikos)",-8,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",153,0,0,0,0,0,0,0,},{"Hack and Slash",0,43,28,40,48,43,42,52,},{"Bron's Call to Action (Mikanikos)",82,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",31,0,0,0,0,0,0,0,},{"Vicious Contempt",0,33,27,40,60,58,58,68,},{"Pointed Courage (3 Allies) (Kleia)",136,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",236,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",100,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",125,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Harrowing Punishment",0,17,29,30,19,26,20,32,},{"Depths of Insanity",0,48,47,56,64,51,53,60,},{"Refined Palate (Theotar)",116,0,0,0,0,0,0,0,},{"Ashen Juggernaut",0,100,116,132,134,151,158,177,},{"Dauntless Duelist (Nadjia)",174,0,0,0,0,0,0,0,},{"Vicious Contempt",0,43,47,44,55,64,67,72,},{"Thrill Seeker (Nadjia)",127,0,0,0,0,0,0,0,},{"Hack and Slash",0,23,28,35,41,39,48,46,},{"Soothing Shade (Theotar)",112,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-6,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",51,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",-7,0,0,0,0,0,0,0,},{"Built for War (Draven)",155,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,14,21,31,27,28,30,40,},{"Ashen Juggernaut",0,100,124,123,147,157,162,185,},{"Grove Invigoration (Niya)",187,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",144,0,0,0,0,0,0,0,},{"Depths of Insanity",0,49,51,51,65,64,71,72,},{"Niya's Tools: Poison (Niya)",-10,0,0,0,0,0,0,0,},{"Vicious Contempt",0,49,38,34,50,47,65,69,},{"Field of Blossoms (Dreamweaver)",119,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",234,0,0,0,0,0,0,0,},{"First Strike (Korayn)",41,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-9,0,0,0,0,0,0,0,},{"Hack and Slash",0,44,38,38,36,59,53,51,},{"Social Butterfly (Dreamweaver)",84,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Veteran's Repute",0,68,76,75,82,104,103,105,},{"Depths of Insanity",0,49,55,61,73,69,72,84,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",130,0,0,0,0,0,0,0,},{"Ashen Juggernaut",0,119,124,140,155,176,188,194,},{"Forgeborne Reveries (Heirmir)",103,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-6,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",14,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",-5,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",-6,0,0,0,0,0,0,0,},{"Vicious Contempt",0,33,43,49,46,61,71,74,},{"Hack and Slash",0,32,51,43,63,59,56,69,},{"Lead by Example (0 Allies) (Emeni)",-4,0,0,0,0,0,0,0,},},},
		[578] ={{{"Power",1,145,158,171,184,200,213,226,},{"Repeat Decree",0,60,64,69,83,88,90,90,},{"Soul Furnace",0,26,38,41,27,40,41,43,},{"Pointed Courage (5 Allies) (Kleia)",138,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",86,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",28,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",71,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",68,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",94,0,0,0,0,0,0,0,},{"Growing Inferno",0,37,42,44,54,51,57,60,},{"Combat Meditation (Always Extend) (Pelagos)",113,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Increased Scrutiny",0,21,28,34,36,35,35,43,},{"Soul Furnace",0,25,30,35,29,36,36,40,},{"Exacting Preparation (Nadjia)",19,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",40,0,0,0,0,0,0,0,},{"Growing Inferno",0,44,39,50,45,53,56,57,},{"Soothing Shade (Theotar)",64,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",55,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",99,0,0,0,0,0,0,0,},{"Built for War (Draven)",82,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",54,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",116,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Unnatural Malice",0,43,39,49,49,64,60,68,},{"Soul Furnace",0,21,27,28,25,39,36,36,},{"Grove Invigoration (Niya)",93,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",41,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",109,0,0,0,0,0,0,0,},{"First Strike (Korayn)",55,0,0,0,0,0,0,0,},{"Growing Inferno",0,31,37,44,44,49,52,54,},{"Niya's Tools: Burrs (Niya)",221,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",67,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",58,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",94,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brooding Pool",0,14,12,21,24,34,30,44,},{"Soul Furnace",0,26,34,33,44,44,41,44,},{"Lead by Example (0 Allies) (Emeni)",27,0,0,0,0,0,0,0,},{"Growing Inferno",0,46,46,45,49,54,63,64,},{"Lead by Example (2 Allies) (Emeni)",55,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",67,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",20,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",74,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",72,0,0,0,0,0,0,0,},},},
		[265] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,3,-7,-3,1,12,9,-6,},{"Cold Embrace",0,131,150,153,165,186,193,216,},{"Corrupting Leer",0,23,27,21,35,33,37,46,},{"Focused Malignancy",0,212,227,245,272,300,314,344,},{"Hammer of Genesis (Mikanikos)",5,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",202,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",154,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",100,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",34,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",49,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",255,0,0,0,0,0,0,0,},{"Rolling Agony",0,19,16,22,11,19,7,15,},{"Pointed Courage (3 Allies) (Kleia)",155,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,55,73,75,69,83,81,93,},{"Corrupting Leer",0,-50,-45,-58,-41,-48,-34,-29,},{"Focused Malignancy",0,187,200,226,251,272,280,309,},{"Cold Embrace",0,139,149,151,180,185,191,212,},{"Rolling Agony",0,24,31,27,33,32,38,29,},{"Thrill Seeker (Nadjia)",135,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",64,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",163,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",127,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-4,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",24,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",76,0,0,0,0,0,0,0,},{"Built for War (Draven)",199,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,74,79,76,97,93,96,123,},{"Corrupting Leer",0,15,3,2,17,15,14,19,},{"Cold Embrace",0,155,156,168,179,202,204,215,},{"Niya's Tools: Poison (Niya)",12,0,0,0,0,0,0,0,},{"Focused Malignancy",0,201,210,247,261,274,301,319,},{"Field of Blossoms (Dreamweaver)",150,0,0,0,0,0,0,0,},{"Rolling Agony",0,18,15,25,16,28,18,18,},{"Niya's Tools: Burrs (Niya)",269,0,0,0,0,0,0,0,},{"First Strike (Korayn)",9,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",15,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",85,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",224,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",172,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,67,75,76,90,90,18,106,},{"Corrupting Leer",0,5,16,28,42,36,44,57,},{"Cold Embrace",0,115,136,153,167,175,186,188,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",134,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",148,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-10,0,0,0,0,0,0,0,},{"Rolling Agony",0,12,9,-9,3,-4,16,23,},{"Lead by Example (4 Allies) (Emeni)",113,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",19,0,0,0,0,0,0,0,},{"Focused Malignancy",0,169,189,214,229,252,256,278,},{"Lead by Example (2 Allies) (Emeni)",84,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",37,0,0,0,0,0,0,0,},},},
		[577] ={{{"Power",1,145,158,171,184,200,213,226,},{"Repeat Decree",0,36,48,41,47,61,57,57,},{"Relentless Onslaught",0,110,123,142,156,160,172,172,},{"Serrated Glaive",0,-3,-8,-8,-13,-12,-10,-11,},{"Growing Inferno",0,105,102,113,133,139,153,146,},{"Hammer of Genesis (Mikanikos)",0,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",119,0,0,0,0,0,0,0,},{"Dancing with Fate",0,9,9,14,14,17,17,17,},{"Combat Meditation (50% Extend) (Pelagos)",87,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",64,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",101,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",132,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",218,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",47,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Increased Scrutiny",0,-28,-31,-20,-19,-15,-22,-14,},{"Relentless Onslaught",0,111,133,139,147,163,192,186,},{"Serrated Glaive",0,0,3,4,1,2,7,13,},{"Growing Inferno",0,96,108,126,142,142,143,152,},{"Built for War (Draven)",158,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",173,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",140,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",93,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",145,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",31,0,0,0,0,0,0,0,},{"Dancing with Fate",0,20,12,23,20,13,21,25,},{"Wasteland Propriety (Theotar)",73,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",104,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Unnatural Malice",0,31,47,42,42,55,51,62,},{"Relentless Onslaught",0,113,126,137,149,162,178,183,},{"Growing Inferno",0,95,96,113,121,131,140,150,},{"Serrated Glaive",0,9,4,15,22,18,5,16,},{"Niya's Tools: Poison (Niya)",227,0,0,0,0,0,0,0,},{"Dancing with Fate",0,2,21,10,16,6,19,11,},{"Field of Blossoms (Dreamweaver)",143,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",172,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",271,0,0,0,0,0,0,0,},{"First Strike (Korayn)",41,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",6,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",75,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",143,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brooding Pool",0,19,39,46,63,75,88,94,},{"Dancing with Fate",0,17,5,19,23,13,19,21,},{"Relentless Onslaught",0,122,144,153,169,179,202,191,},{"Serrated Glaive",0,-5,3,7,2,0,-1,0,},{"Growing Inferno",0,113,119,139,142,140,155,164,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",188,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-7,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",138,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",131,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",108,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",41,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",53,0,0,0,0,0,0,0,},},},
		[253] ={{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,32,26,36,34,43,43,43,},{"Ferocious Appetite",0,-9,-2,3,14,7,11,15,},{"One With the Beast",0,22,30,45,66,73,87,92,},{"Enfeebled Mark",0,118,122,129,135,145,165,166,},{"Hammer of Genesis (Mikanikos)",8,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",160,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",111,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",128,0,0,0,0,0,0,0,},{"Echoing Call",0,9,3,3,3,12,7,5,},{"Pointed Courage (1 Ally) (Kleia)",28,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",133,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",192,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",77,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,15,29,20,16,36,32,32,},{"Empowered Release",0,28,21,20,31,26,28,31,},{"Ferocious Appetite",0,-6,-9,-2,11,3,0,6,},{"Echoing Call",0,-4,-5,-11,-17,-6,-11,-7,},{"One With the Beast",0,12,22,39,54,59,71,81,},{"Built for War (Draven)",166,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",148,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",77,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",82,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",3,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",-8,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",33,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",65,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,33,40,40,46,48,44,38,},{"Ferocious Appetite",0,-31,-33,-34,-31,-20,-13,-29,},{"One With the Beast",0,12,21,38,55,67,82,84,},{"Echoing Call",0,-5,1,2,4,-7,6,7,},{"Spirit Attunement",0,89,101,102,103,103,117,125,},{"Wild Hunt Tactics (Korayn)",85,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",150,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",250,0,0,0,0,0,0,0,},{"First Strike (Korayn)",13,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",196,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",183,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",73,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-10,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bloodletting",0,45,43,51,47,44,48,41,},{"Necrotic Barrage",0,23,37,28,35,39,47,52,},{"Echoing Call",0,10,14,9,19,13,8,12,},{"Lead by Example (2 Allies) (Emeni)",106,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",55,0,0,0,0,0,0,0,},{"One With the Beast",0,34,38,55,65,81,96,99,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",117,0,0,0,0,0,0,0,},{"Ferocious Appetite",0,10,13,15,16,33,34,39,},{"Gnashing Chompers (Emeni)",8,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",42,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",135,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",143,0,0,0,0,0,0,0,},},},
		[258] ={{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,209,225,221,249,241,252,257,},{"Rabid Shadows",0,17,30,29,44,61,58,71,},{"Combat Meditation (Never Extend) (Pelagos)",275,0,0,0,0,0,0,0,},{"Mind Devourer",0,86,86,94,91,87,111,101,},{"Courageous Ascension",0,108,117,130,133,142,164,172,},{"Haunting Apparitions",0,95,94,105,129,135,126,140,},{"Combat Meditation (Always Extend) (Pelagos)",339,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",304,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",47,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",159,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",263,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",13,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",81,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,218,227,244,254,255,251,271,},{"Rabid Shadows",0,16,45,57,56,60,64,67,},{"Shattered Perceptions",0,36,49,50,52,53,68,69,},{"Haunting Apparitions",0,108,99,113,132,130,143,162,},{"Wasteland Propriety (Theotar)",71,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",136,0,0,0,0,0,0,0,},{"Mind Devourer",0,93,87,106,108,106,100,114,},{"Dauntless Duelist (Nadjia)",171,0,0,0,0,0,0,0,},{"Built for War (Draven)",240,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",31,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",10,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",133,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",82,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,246,252,260,270,275,290,281,},{"Rabid Shadows",0,39,49,43,57,67,67,72,},{"Fae Fermata",0,7,4,7,11,2,9,9,},{"Social Butterfly (Dreamweaver)",107,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",7,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",201,0,0,0,0,0,0,0,},{"Haunting Apparitions",0,105,120,125,147,144,171,159,},{"Grove Invigoration (Niya)",231,0,0,0,0,0,0,0,},{"Mind Devourer",0,108,106,113,112,123,133,121,},{"Niya's Tools: Burrs (Niya)",257,0,0,0,0,0,0,0,},{"First Strike (Korayn)",28,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",0,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",204,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Dissonant Echoes",0,234,225,232,253,248,267,269,},{"Rabid Shadows",0,28,23,42,41,49,71,64,},{"Festering Transfusion",0,65,73,66,77,86,74,85,},{"Lead by Example (4 Allies) (Emeni)",173,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",70,0,0,0,0,0,0,0,},{"Mind Devourer",0,97,119,104,114,111,107,106,},{"Haunting Apparitions",0,92,101,123,130,133,152,166,},{"Forgeborne Reveries (Heirmir)",180,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",20,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-5,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",114,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",163,0,0,0,0,0,0,0,},},},
		[266] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,6,-9,0,12,1,7,2,},{"Fel Commando",0,89,92,105,112,118,127,134,},{"Combat Meditation (Never Extend) (Pelagos)",85,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",224,0,0,0,0,0,0,0,},{"Tyrant's Soul",0,90,88,97,110,114,120,110,},{"Carnivorous Stalkers",0,58,70,64,77,75,86,98,},{"Pointed Courage (1 Ally) (Kleia)",42,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",131,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",131,0,0,0,0,0,0,0,},{"Borne of Blood",0,96,116,121,141,140,158,172,},{"Bron's Call to Action (Mikanikos)",64,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",108,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",-4,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,39,37,26,46,38,48,48,},{"Fel Commando",0,90,97,116,118,117,127,142,},{"Carnivorous Stalkers",0,65,65,64,85,84,97,97,},{"Built for War (Draven)",167,0,0,0,0,0,0,0,},{"Tyrant's Soul",0,102,92,92,110,116,120,125,},{"Wasteland Propriety (Theotar)",70,0,0,0,0,0,0,0,},{"Borne of Blood",0,102,121,123,137,156,164,167,},{"Thrill Seeker (Nadjia)",42,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",5,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",129,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",46,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",104,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,42,32,41,44,50,59,60,},{"Fel Commando",0,99,93,116,113,119,126,149,},{"Social Butterfly (Dreamweaver)",73,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",3,0,0,0,0,0,0,0,},{"Carnivorous Stalkers",0,61,62,81,88,76,97,94,},{"Tyrant's Soul",0,85,96,107,115,117,128,118,},{"Grove Invigoration (Niya)",140,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",147,0,0,0,0,0,0,0,},{"Borne of Blood",0,98,116,132,143,143,158,176,},{"Niya's Tools: Burrs (Niya)",224,0,0,0,0,0,0,0,},{"First Strike (Korayn)",4,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",7,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",46,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,63,73,68,77,71,32,89,},{"Lead by Example (0 Allies) (Emeni)",65,0,0,0,0,0,0,0,},{"Tyrant's Soul",0,102,106,119,122,121,120,129,},{"Carnivorous Stalkers",0,68,67,75,77,90,89,104,},{"Gnashing Chompers (Emeni)",12,0,0,0,0,0,0,0,},{"Fel Commando",0,92,106,110,116,132,134,152,},{"Borne of Blood",0,111,115,130,133,144,162,175,},{"Lead by Example (4 Allies) (Emeni)",139,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",8,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",143,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",48,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",95,0,0,0,0,0,0,0,},},},
		[104] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,24,22,25,21,24,22,23,},{"Savage Combatant",0,106,116,130,132,140,155,161,},{"Pointed Courage (5 Allies) (Kleia)",153,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,66,70,82,83,90,99,112,},{"Pointed Courage (3 Allies) (Kleia)",87,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",38,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",202,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",89,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",114,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",4,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",71,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,29,30,36,34,44,45,46,},{"Savage Combatant",0,111,115,123,140,151,164,168,},{"Wasteland Propriety (Theotar)",48,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,88,95,104,112,115,121,128,},{"Soothing Shade (Theotar)",62,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",37,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",62,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",106,0,0,0,0,0,0,0,},{"Built for War (Draven)",89,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-6,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",6,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,59,72,80,96,98,92,106,},{"Savage Combatant",0,79,97,97,112,113,125,134,},{"Grove Invigoration (Niya)",143,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",50,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",46,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-13,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",100,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,46,60,56,73,74,82,84,},{"Niya's Tools: Burrs (Niya)",266,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",116,0,0,0,0,0,0,0,},{"First Strike (Korayn)",37,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,44,44,57,59,60,69,69,},{"Savage Combatant",0,86,97,107,119,125,137,150,},{"Lead by Example (4 Allies) (Emeni)",53,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",13,0,0,0,0,0,0,0,},{"Unchecked Aggression",0,71,71,85,92,105,108,112,},{"Plaguey's Preemptive Strike (Marileth)",17,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",33,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",76,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",88,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},},},
		[103] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,-20,-22,-17,-15,-12,-27,-10,},{"Taste for Blood",0,95,106,110,114,117,131,142,},{"Bron's Call to Action (Mikanikos)",88,0,0,0,0,0,0,0,},{"Incessant Hunter",0,30,36,36,35,33,49,50,},{"Sudden Ambush",0,104,126,136,148,145,159,171,},{"Pointed Courage (5 Allies) (Kleia)",264,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",8,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",162,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",140,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",45,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",174,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",213,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,84,83,107,105,110,118,139,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,41,56,58,67,70,75,80,},{"Taste for Blood",0,82,98,117,109,122,145,144,},{"Incessant Hunter",0,18,25,32,31,30,42,41,},{"Dauntless Duelist (Nadjia)",161,0,0,0,0,0,0,0,},{"Built for War (Draven)",154,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",108,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",99,0,0,0,0,0,0,0,},{"Sudden Ambush",0,103,99,112,120,147,146,160,},{"Refined Palate (Theotar)",73,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",104,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,78,82,92,89,102,117,118,},{"Superior Tactics (Draven)",-17,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",20,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,108,119,140,148,140,169,180,},{"Taste for Blood",0,114,137,138,156,161,168,175,},{"Incessant Hunter",0,14,23,16,31,32,33,33,},{"Sudden Ambush",0,89,123,131,136,135,153,169,},{"Carnivorous Instinct",0,91,93,109,117,124,125,135,},{"Niya's Tools: Poison (Niya)",-8,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",211,0,0,0,0,0,0,0,},{"First Strike (Korayn)",13,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",2,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",283,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",204,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",122,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",78,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,68,72,77,91,82,86,96,},{"Incessant Hunter",0,37,45,52,51,55,49,63,},{"Taste for Blood",0,96,105,105,120,126,135,135,},{"Sudden Ambush",0,116,135,144,147,164,178,199,},{"Lead by Example (4 Allies) (Emeni)",96,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",141,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",173,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",8,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",37,0,0,0,0,0,0,0,},{"Carnivorous Instinct",0,86,100,107,98,112,118,138,},{"Lead by Example (0 Allies) (Emeni)",44,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",64,0,0,0,0,0,0,0,},},},
		[259] ={{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,74,80,88,89,98,113,113,},{"Maim, Mangle",0,53,45,54,65,71,78,83,},{"Bron's Call to Action (Mikanikos)",47,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",103,0,0,0,0,0,0,0,},{"Poisoned Katar",0,0,-2,5,4,8,-10,7,},{"Combat Meditation (Never Extend) (Pelagos)",78,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",17,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,73,79,96,104,121,121,124,},{"Combat Meditation (Always Extend) (Pelagos)",149,0,0,0,0,0,0,0,},{"Reverberation",0,61,63,69,69,70,91,104,},{"Pointed Courage (1 Ally) (Kleia)",48,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",144,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",246,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,74,77,83,88,103,117,117,},{"Maim, Mangle",0,60,65,68,70,78,89,88,},{"Lashing Scars",0,66,65,72,83,78,88,91,},{"Poisoned Katar",0,3,2,2,4,0,-2,5,},{"Refined Palate (Theotar)",106,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,80,92,91,102,113,114,124,},{"Exacting Preparation (Nadjia)",56,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",180,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",173,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",126,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",64,0,0,0,0,0,0,0,},{"Built for War (Draven)",159,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",114,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,64,70,74,81,97,108,114,},{"Maim, Mangle",0,47,58,46,56,63,66,83,},{"Wild Hunt Tactics (Korayn)",159,0,0,0,0,0,0,0,},{"Poisoned Katar",0,1,-13,-3,-13,-6,2,-4,},{"Niya's Tools: Poison (Niya)",236,0,0,0,0,0,0,0,},{"Well-Placed Steel",0,79,88,101,104,114,117,132,},{"Niya's Tools: Burrs (Niya)",282,0,0,0,0,0,0,0,},{"First Strike (Korayn)",27,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",187,0,0,0,0,0,0,0,},{"Septic Shock",0,27,40,41,54,66,75,87,},{"Grove Invigoration (Niya)",159,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",143,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",81,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Lethal Poisons",0,66,81,88,91,94,104,110,},{"Well-Placed Steel",0,73,81,84,95,103,108,118,},{"Poisoned Katar",0,-1,6,2,-11,3,8,3,},{"Forgeborne Reveries (Heirmir)",117,0,0,0,0,0,0,0,},{"Maim, Mangle",0,49,47,63,62,73,67,78,},{"Sudden Fractures",0,52,56,69,66,77,75,84,},{"Lead by Example (4 Allies) (Emeni)",117,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",33,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",11,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",85,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",44,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",158,0,0,0,0,0,0,0,},},},
		[267] ={{{"Power",1,145,158,171,184,200,213,226,},{"Soul Tithe",0,-1,6,2,-2,-2,5,5,},{"Duplicitous Havoc",0,4,-5,3,4,-2,-3,-1,},{"Ashen Remains",0,73,74,87,95,104,106,115,},{"Combat Meditation (Always Extend) (Pelagos)",168,0,0,0,0,0,0,0,},{"Infernal Brand",0,39,47,57,59,66,72,68,},{"Hammer of Genesis (Mikanikos)",-4,0,0,0,0,0,0,0,},{"Combusting Engine",0,44,53,59,68,60,69,81,},{"Combat Meditation (50% Extend) (Pelagos)",145,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",96,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",35,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",54,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",145,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",245,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Catastrophic Origin",0,47,38,39,42,62,60,62,},{"Combusting Engine",0,52,57,66,61,65,71,90,},{"Refined Palate (Theotar)",73,0,0,0,0,0,0,0,},{"Duplicitous Havoc",0,0,7,-3,8,16,8,7,},{"Ashen Remains",0,77,86,90,102,106,120,117,},{"Dauntless Duelist (Nadjia)",173,0,0,0,0,0,0,0,},{"Infernal Brand",0,51,40,58,55,70,71,73,},{"Exacting Preparation (Nadjia)",28,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",0,0,0,0,0,0,0,0,},{"Built for War (Draven)",198,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",113,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",114,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",70,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Soul Eater",0,45,57,49,51,60,59,65,},{"Combusting Engine",0,62,56,69,65,79,88,90,},{"Duplicitous Havoc",0,4,8,1,8,3,7,-1,},{"Niya's Tools: Poison (Niya)",-1,0,0,0,0,0,0,0,},{"Ashen Remains",0,80,93,86,97,111,124,129,},{"Infernal Brand",0,48,56,69,58,60,78,66,},{"Wild Hunt Tactics (Korayn)",177,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",86,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",195,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-1,0,0,0,0,0,0,0,},{"First Strike (Korayn)",31,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",233,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",129,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Fatal Decimation",0,60,67,72,77,84,19,85,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",129,0,0,0,0,0,0,0,},{"Duplicitous Havoc",0,-2,-3,9,-7,5,-2,3,},{"Ashen Remains",0,80,90,102,106,109,130,134,},{"Lead by Example (4 Allies) (Emeni)",147,0,0,0,0,0,0,0,},{"Infernal Brand",0,48,44,43,48,68,70,68,},{"Forgeborne Reveries (Heirmir)",164,0,0,0,0,0,0,0,},{"Combusting Engine",0,45,64,58,63,60,65,81,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",34,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",105,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",49,0,0,0,0,0,0,0,},},},
		[250] ={{{"Power",1,145,158,171,184,200,213,226,},{"Proliferation",0,68,66,72,85,82,91,91,},{"Debilitating Malady",0,3,1,-3,-2,-3,-5,-4,},{"Withering Plague",0,27,23,32,33,39,40,45,},{"Bron's Call to Action (Mikanikos)",74,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",43,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",68,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",89,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",8,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",89,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",142,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",31,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Impenetrable Gloom",0,13,22,15,15,18,20,23,},{"Debilitating Malady",0,6,7,5,4,8,5,9,},{"Wasteland Propriety (Theotar)",41,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",4,0,0,0,0,0,0,0,},{"Withering Plague",0,32,29,32,41,39,42,44,},{"Refined Palate (Theotar)",103,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",58,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",93,0,0,0,0,0,0,0,},{"Built for War (Draven)",90,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",2,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",64,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Withering Ground",0,53,62,68,75,80,80,98,},{"Debilitating Malady",0,4,10,12,3,4,4,16,},{"Grove Invigoration (Niya)",87,0,0,0,0,0,0,0,},{"Withering Plague",0,31,27,35,36,44,42,47,},{"Niya's Tools: Herbs (Niya)",23,0,0,0,0,0,0,0,},{"First Strike (Korayn)",32,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",262,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",6,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",96,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",91,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",54,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Brutal Grasp",0,15,13,20,17,20,24,25,},{"Debilitating Malady",0,7,3,3,0,0,1,5,},{"Lead by Example (0 Allies) (Emeni)",28,0,0,0,0,0,0,0,},{"Withering Plague",0,35,32,39,44,51,54,55,},{"Plaguey's Preemptive Strike (Marileth)",16,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",6,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",79,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",87,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",56,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",82,0,0,0,0,0,0,0,},},},
		[254] ={{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,40,45,60,74,75,85,91,},{"Brutal Projectiles",0,10,20,14,9,13,13,22,},{"Enfeebled Mark",0,126,145,156,171,172,179,201,},{"Sharpshooter's Focus",0,61,73,79,81,88,88,96,},{"Deadly Chain",0,6,11,10,10,17,2,-1,},{"Combat Meditation (50% Extend) (Pelagos)",211,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",30,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",265,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",161,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",91,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",61,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",237,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",150,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,23,50,39,41,63,79,70,},{"Brutal Projectiles",0,0,3,2,11,-2,2,3,},{"Empowered Release",0,69,62,63,77,70,72,72,},{"Deadly Chain",0,-6,-7,-7,-5,-11,1,-8,},{"Sharpshooter's Focus",0,40,49,46,64,64,71,78,},{"Built for War (Draven)",156,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",163,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",93,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",64,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",127,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-2,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",32,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",45,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,19,35,34,40,52,65,66,},{"Spirit Attunement",0,137,123,136,142,149,144,154,},{"Sharpshooter's Focus",0,40,56,59,63,70,66,78,},{"Wild Hunt Tactics (Korayn)",196,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",173,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",178,0,0,0,0,0,0,0,},{"Brutal Projectiles",0,-6,-6,-9,-12,-12,-5,5,},{"Niya's Tools: Burrs (Niya)",244,0,0,0,0,0,0,0,},{"First Strike (Korayn)",22,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-12,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",61,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",291,0,0,0,0,0,0,0,},{"Deadly Chain",0,-15,-5,-16,-10,1,-14,-7,},},{{"Power",1,145,158,171,184,200,213,226,},{"Powerful Precision",0,32,39,43,55,74,79,87,},{"Necrotic Barrage",0,36,31,32,53,54,49,53,},{"Brutal Projectiles",0,7,9,1,3,15,8,0,},{"Deadly Chain",0,4,5,5,-6,4,-2,-1,},{"Lead by Example (2 Allies) (Emeni)",78,0,0,0,0,0,0,0,},{"Sharpshooter's Focus",0,40,51,58,76,63,79,85,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",152,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",127,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",5,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",36,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",55,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",127,0,0,0,0,0,0,0,},},},
		[260] ={{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,178,186,209,229,259,275,298,},{"Sleight of Hand",0,60,72,71,81,78,84,101,},{"Reverberation",0,63,74,78,85,97,96,93,},{"Ambidexterity",0,4,10,18,6,5,15,10,},{"Combat Meditation (Never Extend) (Pelagos)",78,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",93,0,0,0,0,0,0,0,},{"Triple Threat",0,61,63,81,82,85,92,97,},{"Combat Meditation (Always Extend) (Pelagos)",125,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",49,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",143,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",239,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",6,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",141,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,175,210,221,235,254,280,286,},{"Sleight of Hand",0,68,76,77,80,86,87,92,},{"Lashing Scars",0,61,60,76,71,82,82,94,},{"Triple Threat",0,53,64,71,79,85,82,89,},{"Ambidexterity",0,-21,7,5,-7,3,15,-1,},{"Wasteland Propriety (Theotar)",65,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",93,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",58,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",165,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",186,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",136,0,0,0,0,0,0,0,},{"Built for War (Draven)",177,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",104,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,162,189,206,226,246,270,291,},{"Sleight of Hand",0,53,49,70,72,83,86,90,},{"Septic Shock",0,13,30,26,59,59,58,66,},{"Triple Threat",0,50,53,49,55,70,76,82,},{"Ambidexterity",0,-10,-17,-13,-2,-11,-7,-8,},{"Wild Hunt Tactics (Korayn)",161,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",96,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",301,0,0,0,0,0,0,0,},{"First Strike (Korayn)",20,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",256,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",152,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",72,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",138,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Count the Odds",0,180,193,220,229,262,276,299,},{"Lead by Example (0 Allies) (Emeni)",45,0,0,0,0,0,0,0,},{"Sleight of Hand",0,74,64,83,84,97,93,103,},{"Plaguey's Preemptive Strike (Marileth)",48,0,0,0,0,0,0,0,},{"Sudden Fractures",0,45,52,57,60,50,66,78,},{"Forgeborne Reveries (Heirmir)",139,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",102,0,0,0,0,0,0,0,},{"Ambidexterity",0,1,10,0,7,8,16,6,},{"Triple Threat",0,50,62,66,89,85,86,100,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",141,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",13,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",81,0,0,0,0,0,0,0,},},},
		[71] ={{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,94,108,117,126,138,144,155,},{"Ashen Juggernaut",0,167,184,191,225,240,243,268,},{"Piercing Verdict",0,40,40,44,40,58,46,45,},{"Crash the Ramparts",0,60,68,66,70,86,69,94,},{"Merciless Bonegrinder",0,13,6,5,5,4,8,11,},{"Hammer of Genesis (Mikanikos)",16,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",161,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",132,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",231,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",87,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",54,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",96,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",139,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,45,65,83,76,82,85,100,},{"Crash the Ramparts",0,44,45,49,57,58,63,68,},{"Ashen Juggernaut",0,180,190,221,235,250,281,288,},{"Dauntless Duelist (Nadjia)",180,0,0,0,0,0,0,0,},{"Built for War (Draven)",164,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",102,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",77,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",105,0,0,0,0,0,0,0,},{"Harrowing Punishment",0,31,37,36,34,53,46,41,},{"Merciless Bonegrinder",0,2,-2,-4,-3,1,-11,-4,},{"Superior Tactics (Draven)",-5,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",17,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",2,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,-1,17,5,17,25,39,36,},{"Crash the Ramparts",0,54,61,62,69,77,74,70,},{"Ashen Juggernaut",0,169,169,200,213,228,237,252,},{"Merciless Bonegrinder",0,-5,-3,-12,6,1,-2,-6,},{"Social Butterfly (Dreamweaver)",70,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",191,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",130,0,0,0,0,0,0,0,},{"Mortal Combo",0,93,94,115,118,129,134,142,},{"Niya's Tools: Burrs (Niya)",218,0,0,0,0,0,0,0,},{"First Strike (Korayn)",35,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-4,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",140,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",3,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Mortal Combo",0,104,104,115,134,142,146,157,},{"Ashen Juggernaut",0,193,203,227,252,264,272,300,},{"Veteran's Repute",0,101,108,117,123,136,136,146,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",144,0,0,0,0,0,0,0,},{"Crash the Ramparts",0,57,78,81,73,89,91,94,},{"Gnashing Chompers (Emeni)",7,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",37,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",8,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",-3,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",5,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",111,0,0,0,0,0,0,0,},{"Merciless Bonegrinder",0,6,7,-5,10,8,12,0,},},},
		[73] ={{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,-10,-8,-6,-11,-9,3,-11,},{"Piercing Verdict",0,18,23,20,23,22,37,32,},{"Ashen Juggernaut",0,23,30,23,36,34,36,40,},{"Bron's Call to Action (Mikanikos)",78,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",9,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",162,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",163,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",93,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",208,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",124,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",23,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,0,-4,-12,0,-15,-3,-2,},{"Harrowing Punishment",0,5,12,8,7,5,12,5,},{"Ashen Juggernaut",0,38,32,36,49,53,53,53,},{"Dauntless Duelist (Nadjia)",106,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",-4,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",6,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",97,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",62,0,0,0,0,0,0,0,},{"Built for War (Draven)",106,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",150,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",-9,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Destructive Reverberations",0,26,26,36,35,40,43,53,},{"Show of Force",0,-9,-6,-6,-11,-2,-7,-12,},{"Ashen Juggernaut",0,29,27,32,34,28,37,42,},{"Wild Hunt Tactics (Korayn)",120,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",56,0,0,0,0,0,0,0,},{"First Strike (Korayn)",36,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",186,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-1,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",84,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-13,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",232,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Show of Force",0,-2,-2,-4,-4,-4,3,-2,},{"Veteran's Repute",0,44,55,49,57,69,64,68,},{"Ashen Juggernaut",0,21,28,35,33,36,38,43,},{"Plaguey's Preemptive Strike (Marileth)",14,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",-5,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",65,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",4,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",-2,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",-6,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",81,0,0,0,0,0,0,0,},},},
		[102] ={{{"Power",1,145,158,171,184,200,213,226,},{"Deep Allegiance",0,34,43,37,41,67,51,64,},{"Stellar Inspiration",0,36,49,40,48,55,45,63,},{"Hammer of Genesis (Mikanikos)",1,0,0,0,0,0,0,0,},{"Precise Alignment",0,-23,-8,5,10,8,26,25,},{"Umbral Intensity",0,56,60,65,74,83,86,96,},{"Combat Meditation (Always Extend) (Pelagos)",250,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",223,0,0,0,0,0,0,0,},{"Fury of the Skies",0,75,103,93,109,118,112,126,},{"Combat Meditation (Never Extend) (Pelagos)",214,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",94,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",122,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",235,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",38,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Endless Thirst",0,82,81,90,113,118,122,133,},{"Stellar Inspiration",0,40,37,45,44,45,56,66,},{"Refined Palate (Theotar)",60,0,0,0,0,0,0,0,},{"Fury of the Skies",0,78,81,96,103,120,111,138,},{"Built for War (Draven)",223,0,0,0,0,0,0,0,},{"Precise Alignment",0,13,33,45,33,41,65,59,},{"Wasteland Propriety (Theotar)",109,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",97,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",119,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",0,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",30,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",163,0,0,0,0,0,0,0,},{"Umbral Intensity",0,55,70,75,86,96,81,98,},},{{"Power",1,145,158,171,184,200,213,226,},{"Conflux of Elements",0,128,145,149,160,179,187,204,},{"Stellar Inspiration",0,52,40,43,68,63,66,74,},{"Wild Hunt Tactics (Korayn)",178,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",-6,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",125,0,0,0,0,0,0,0,},{"Fury of the Skies",0,83,92,98,97,121,130,137,},{"Niya's Tools: Herbs (Niya)",-3,0,0,0,0,0,0,0,},{"Umbral Intensity",0,48,60,49,81,86,89,96,},{"Grove Invigoration (Niya)",345,0,0,0,0,0,0,0,},{"Precise Alignment",0,41,32,47,30,37,53,68,},{"Social Butterfly (Dreamweaver)",69,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",249,0,0,0,0,0,0,0,},{"First Strike (Korayn)",3,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Evolved Swarm",0,70,76,78,91,102,108,116,},{"Precise Alignment",0,7,15,12,37,42,19,26,},{"Plaguey's Preemptive Strike (Marileth)",20,0,0,0,0,0,0,0,},{"Stellar Inspiration",0,33,31,48,51,53,44,58,},{"Gnashing Chompers (Emeni)",8,0,0,0,0,0,0,0,},{"Fury of the Skies",0,86,91,111,102,115,121,128,},{"Umbral Intensity",0,49,66,74,76,71,81,94,},{"Forgeborne Reveries (Heirmir)",167,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",72,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",41,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",136,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",25,0,0,0,0,0,0,0,},},},
		[261] ={{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,86,76,95,96,112,125,116,},{"Reverberation",0,89,103,95,108,119,126,135,},{"Hammer of Genesis (Mikanikos)",4,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",155,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",110,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",80,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",101,0,0,0,0,0,0,0,},{"Stiletto Staccato",0,88,96,134,134,145,139,126,},{"Pointed Courage (1 Ally) (Kleia)",47,0,0,0,0,0,0,0,},{"Deeper Daggers",0,59,79,76,90,92,99,121,},{"Pointed Courage (3 Allies) (Kleia)",155,0,0,0,0,0,0,0,},{"Planned Execution",0,86,106,103,112,118,131,139,},{"Pointed Courage (5 Allies) (Kleia)",246,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,70,86,84,85,100,119,120,},{"Lashing Scars",0,63,72,78,75,103,95,99,},{"Thrill Seeker (Nadjia)",104,0,0,0,0,0,0,0,},{"Stiletto Staccato",0,82,92,123,132,122,116,125,},{"Built for War (Draven)",181,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",195,0,0,0,0,0,0,0,},{"Deeper Daggers",0,72,73,95,93,101,102,114,},{"Refined Palate (Theotar)",102,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",99,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",84,0,0,0,0,0,0,0,},{"Planned Execution",0,87,88,104,121,122,135,147,},{"Exacting Preparation (Nadjia)",53,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",222,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,72,87,85,98,102,112,105,},{"Septic Shock",0,47,57,69,80,90,99,108,},{"Stiletto Staccato",0,76,67,99,117,122,107,113,},{"Planned Execution",0,88,97,105,124,146,143,151,},{"Field of Blossoms (Dreamweaver)",106,0,0,0,0,0,0,0,},{"Wild Hunt Tactics (Korayn)",198,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",210,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",256,0,0,0,0,0,0,0,},{"First Strike (Korayn)",30,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",172,0,0,0,0,0,0,0,},{"Deeper Daggers",0,73,79,87,92,93,100,105,},{"Social Butterfly (Dreamweaver)",85,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",151,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Perforated Veins",0,75,74,78,98,106,103,104,},{"Sudden Fractures",0,41,44,55,63,66,76,76,},{"Deeper Daggers",0,66,72,71,85,91,97,103,},{"Stiletto Staccato",0,68,67,107,142,135,117,95,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",130,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-2,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",29,0,0,0,0,0,0,0,},{"Planned Execution",0,72,85,92,110,119,134,133,},{"Lead by Example (2 Allies) (Emeni)",91,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",52,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",119,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",125,0,0,0,0,0,0,0,},},},
		[269] ={{{"Power",1,145,158,171,184,200,213,226,},{"Strike with Clarity",0,101,98,93,95,102,108,107,},{"Inner Fury",0,31,42,35,43,41,53,45,},{"Calculated Strikes",0,-2,-4,-3,3,-1,-15,-4,},{"Combat Meditation (Never Extend) (Pelagos)",116,0,0,0,0,0,0,0,},{"Coordinated Offensive",0,0,3,-2,-1,-8,-5,2,},{"Xuen's Bond",0,41,57,48,60,62,55,71,},{"Hammer of Genesis (Mikanikos)",4,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",176,0,0,0,0,0,0,0,},{"Bron's Call to Action (Mikanikos)",132,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",41,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",112,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",207,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",213,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Imbued Reflections",0,59,65,68,81,80,90,97,},{"Calculated Strikes",0,-2,-10,2,-15,5,2,-5,},{"Inner Fury",0,30,41,42,52,52,55,69,},{"Dauntless Duelist (Nadjia)",110,0,0,0,0,0,0,0,},{"Built for War (Draven)",137,0,0,0,0,0,0,0,},{"Coordinated Offensive",0,-17,-2,-1,-1,-10,-2,-13,},{"Xuen's Bond",0,37,50,49,64,71,56,73,},{"Thrill Seeker (Nadjia)",66,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",66,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",90,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",71,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",27,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",134,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Way of the Fae",0,-3,9,3,11,7,18,4,},{"Grove Invigoration (Niya)",247,0,0,0,0,0,0,0,},{"Calculated Strikes",0,-18,-3,-18,-9,-13,-7,-5,},{"Inner Fury",0,26,36,41,40,52,46,47,},{"Coordinated Offensive",0,-6,-6,-10,-11,-7,-6,0,},{"Xuen's Bond",0,42,44,55,56,62,58,71,},{"Wild Hunt Tactics (Korayn)",101,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",198,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",118,0,0,0,0,0,0,0,},{"First Strike (Korayn)",27,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",256,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",59,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",44,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bone Marrow Hops",0,75,84,98,100,94,117,134,},{"Calculated Strikes",0,7,-5,-8,0,-13,0,1,},{"Inner Fury",0,43,43,53,57,52,59,68,},{"Coordinated Offensive",0,3,1,-1,9,5,1,-2,},{"Gnashing Chompers (Emeni)",0,0,0,0,0,0,0,0,},{"Lead by Example (0 Allies) (Emeni)",50,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",98,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",122,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",13,0,0,0,0,0,0,0,},{"Xuen's Bond",0,55,43,38,44,50,63,68,},{"Lead by Example (4 Allies) (Emeni)",151,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",101,0,0,0,0,0,0,0,},},},
		[268] ={{{"Power",1,145,158,171,184,200,213,226,},{"Strike with Clarity",0,39,44,48,44,42,47,55,},{"Walk with the Ox",0,264,279,298,308,306,322,337,},{"Scalding Brew",0,13,22,29,29,31,28,39,},{"Bron's Call to Action (Mikanikos)",154,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",12,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",100,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",33,0,0,0,0,0,0,0,},{"Combat Meditation (Never Extend) (Pelagos)",60,0,0,0,0,0,0,0,},{"Pointed Courage (5 Allies) (Kleia)",152,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",89,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",79,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Imbued Reflections",0,38,37,42,48,60,62,60,},{"Walk with the Ox",0,262,274,294,298,311,331,339,},{"Scalding Brew",0,21,22,31,22,21,21,28,},{"Built for War (Draven)",100,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",39,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",29,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",60,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",18,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",100,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",41,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",130,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Way of the Fae",0,23,23,30,31,22,23,25,},{"Walk with the Ox",0,231,238,249,261,267,274,290,},{"Scalding Brew",0,28,40,24,33,35,40,39,},{"Wild Hunt Tactics (Korayn)",105,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",93,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",52,0,0,0,0,0,0,0,},{"Niya's Tools: Poison (Niya)",68,0,0,0,0,0,0,0,},{"First Strike (Korayn)",37,0,0,0,0,0,0,0,},{"Niya's Tools: Burrs (Niya)",244,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",174,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",90,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Bone Marrow Hops",0,97,106,110,112,131,135,145,},{"Walk with the Ox",0,257,265,266,285,300,310,325,},{"Scalding Brew",0,24,25,32,31,28,34,42,},{"Lead by Example (0 Allies) (Emeni)",42,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-1,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",19,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",101,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",73,0,0,0,0,0,0,0,},{"Forgeborne Reveries (Heirmir)",74,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",108,0,0,0,0,0,0,0,},},},
		[63] ={{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,85,96,100,120,132,128,147,},{"Master Flame",0,-8,-5,-7,-6,-4,-15,-16,},{"Combat Meditation (Never Extend) (Pelagos)",150,0,0,0,0,0,0,0,},{"Ire of the Ascended",0,67,85,86,83,101,113,114,},{"Infernal Cascade",0,416,454,510,547,570,622,667,},{"Bron's Call to Action (Mikanikos)",80,0,0,0,0,0,0,0,},{"Combat Meditation (50% Extend) (Pelagos)",195,0,0,0,0,0,0,0,},{"Pointed Courage (1 Ally) (Kleia)",21,0,0,0,0,0,0,0,},{"Pointed Courage (3 Allies) (Kleia)",69,0,0,0,0,0,0,0,},{"Flame Accretion",0,-42,-29,-30,-25,-25,-9,-11,},{"Pointed Courage (5 Allies) (Kleia)",124,0,0,0,0,0,0,0,},{"Hammer of Genesis (Mikanikos)",15,0,0,0,0,0,0,0,},{"Combat Meditation (Always Extend) (Pelagos)",217,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,89,102,109,132,129,144,149,},{"Infernal Cascade",0,426,461,517,572,606,642,677,},{"Siphoned Malice",0,66,73,80,85,98,99,98,},{"Master Flame",0,8,4,6,-10,0,-11,17,},{"Flame Accretion",0,-36,-34,-28,-24,-29,-10,-12,},{"Built for War (Draven)",187,0,0,0,0,0,0,0,},{"Dauntless Duelist (Nadjia)",169,0,0,0,0,0,0,0,},{"Refined Palate (Theotar)",50,0,0,0,0,0,0,0,},{"Soothing Shade (Theotar)",105,0,0,0,0,0,0,0,},{"Superior Tactics (Draven)",44,0,0,0,0,0,0,0,},{"Exacting Preparation (Nadjia)",23,0,0,0,0,0,0,0,},{"Wasteland Propriety (Theotar)",89,0,0,0,0,0,0,0,},{"Thrill Seeker (Nadjia)",97,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,96,102,124,133,132,155,163,},{"Master Flame",0,-2,2,14,0,7,3,-5,},{"Infernal Cascade",0,442,506,555,590,648,689,729,},{"Niya's Tools: Poison (Niya)",160,0,0,0,0,0,0,0,},{"Discipline of the Grove",0,153,156,165,185,176,158,173,},{"Wild Hunt Tactics (Korayn)",171,0,0,0,0,0,0,0,},{"Field of Blossoms (Dreamweaver)",64,0,0,0,0,0,0,0,},{"Flame Accretion",0,-49,-47,-46,-42,-34,-19,-23,},{"Niya's Tools: Burrs (Niya)",269,0,0,0,0,0,0,0,},{"First Strike (Korayn)",7,0,0,0,0,0,0,0,},{"Grove Invigoration (Niya)",79,0,0,0,0,0,0,0,},{"Social Butterfly (Dreamweaver)",79,0,0,0,0,0,0,0,},{"Niya's Tools: Herbs (Niya)",-1,0,0,0,0,0,0,0,},},{{"Power",1,145,158,171,184,200,213,226,},{"Controlled Destruction",0,84,97,107,111,136,136,159,},{"Master Flame",0,-10,-6,-1,-5,-7,-2,-6,},{"Lead by Example (0 Allies) (Emeni)",90,0,0,0,0,0,0,0,},{"Gift of the Lich",0,7,12,11,6,16,21,24,},{"Infernal Cascade",0,445,478,526,565,619,657,704,},{"Forgeborne Reveries (Heirmir)",138,0,0,0,0,0,0,0,},{"Heirmir's Arsenal: Marrowed Gemstone (Heirmir)",11,0,0,0,0,0,0,0,},{"Gnashing Chompers (Emeni)",-6,0,0,0,0,0,0,0,},{"Lead by Example (4 Allies) (Emeni)",213,0,0,0,0,0,0,0,},{"Lead by Example (2 Allies) (Emeni)",156,0,0,0,0,0,0,0,},{"Plaguey's Preemptive Strike (Marileth)",64,0,0,0,0,0,0,0,},{"Flame Accretion",0,-40,-36,-23,-27,-21,-25,-22,},},},
	},
}

CovenantForge.BaseValues ={
	["PreRaid"]={
		[255] ={3500,3468,3538,3483,},
		[262] ={4048,4053,4123,4166,},
		[62] ={4054,4035,4067,3976,},
		[263] ={4098,4130,4206,4147,},
		[64] ={3450,3622,3385,3430,},
		[66] ={2761,3110,2927,2852,},
		[70] ={3487,3756,3553,3502,},
		[72] ={3322,3535,3338,3270,},
		[578] ={2169,2184,2241,2117,},
		[265] ={3838,3491,3814,3695,},
		[577] ={3402,3527,3497,3488,},
		[253] ={3685,3623,3785,3685,},
		[258] ={4135,4118,4025,4142,},
		[266] ={3468,3443,3490,3548,},
		[104] ={2233,2230,2397,2418,},
		[103] ={3551,3485,3729,3493,},
		[259] ={3534,3538,3518,3481,},
		[267] ={3511,3481,3541,3621,},
		[250] ={2128,2104,2017,2111,},
		[254] ={3833,3713,3926,3841,},
		[260] ={4073,4032,3990,3975,},
		[71] ={3307,3758,3350,3292,},
		[73] ={2308,2385,2333,2242,},
		[102] ={4090,4019,4194,4016,},
		[261] ={4322,4236,4241,4213,},
		[269] ={3929,3659,3718,3714,},
		[268] ={2860,2738,2709,2740,},
		[63] ={3631,3670,3626,3575,},
	},
	["T26"]={
		[255] ={5183,5154,5247,5168,},
		[262] ={5983,5993,6092,6145,},
		[62] ={5988,5933,6085,5882,},
		[263] ={5773,5808,5905,5855,},
		[64] ={5165,5384,5072,5161,},
		[66] ={4232,4754,4476,4358,},
		[70] ={5232,5626,5351,5256,},
		[72] ={5388,5767,5413,5330,},
		[578] ={3289,3319,3406,3210,},
		[265] ={5769,5379,5692,5553,},
		[577] ={5362,5592,5491,5530,},
		[253] ={5453,5388,5589,5437,},
		[258] ={6235,6197,6052,6252,},
		[266] ={5158,5122,5193,5266,},
		[104] ={3452,3456,3670,3740,},
		[103] ={5787,5723,6116,5693,},
		[259] ={5569,5572,5538,5481,},
		[267] ={5437,5405,5529,5628,},
		[250] ={3503,3443,3390,3463,},
		[254] ={5574,5454,5722,5578,},
		[260] ={6050,6008,5960,5907,},
		[71] ={5302,5968,5365,5306,},
		[73] ={3577,3731,3604,3468,},
		[102] ={6032,5913,6098,5997,},
		[261] ={6358,6236,6221,6190,},
		[269] ={5827,5442,5512,5476,},
		[268] ={4091,3983,3920,3958,},
		[63] ={5504,5508,5563,5391,},
	},
}

CovenantForge.Soulbinds ={
	[336472] = "Shivering Core",
	[326514] = "Forgeborne Reveries",
	[336852] = "Master Flame",
	[336460] = "Unrelenting Cold",
	[326512] = "Runeforged Spurs",
	[322721] = "Grove Invigoration",
	[337162] = "Depths of Insanity",
	[331612] = "Sparkling Driftglobe Core",
	[328258] = "Ever Forward",
	[339377] = "Harmony of the Tortollan",
	[338330] = "Insatiable Appetite",
	[338516] = "Debilitating Malady",
	[339558] = "Cheetah's Vigor",
	[339129] = "Necrotic Barrage",
	[339374] = "Truth's Wake",
	[341532] = "Fade to Nothing",
	[341450] = "Front of the Pack",
	[336821] = "Infernal Cascade",
	[338329] = "Embrace of Earth",
	[336239] = "Soothing Shade",
	[331610] = "Charged Additive",
	[338787] = "Shielding Words",
	[347213] = "Fueled by Violence",
	[338342] = "Dissonant Echoes",
	[340041] = "Infernal Brand",
	[338332] = "Mind Devourer",
	[336773] = "Jade Bond",
	[339228] = "Dancing with Fate",
	[340268] = "Fatal Decimation",
	[339182] = "Elysian Dirge",
	[337891] = "Swift Penitence",
	[336569] = "Ice Bite",
	[339576] = "Cold Embrace",
	[339973] = "Deadly Chain",
	[331611] = "Soulsteel Clamps",
	[320662] = "Niya's Tools: Herbs",
	[339411] = "Demonic Momentum",
	[340033] = "Powerful Precision",
	[340348] = "Soul Eater",
	[337134] = "Celestial Effervescence",
	[337240] = "Artifice of the Archmage",
	[329779] = "Bearer's Pursuit",
	[337058] = "Ire of the Ascended",
	[339268] = "Light's Barding",
	[339500] = "Focused Malignancy",
	[340543] = "Innate Resolve",
	[337286] = "Strike with Clarity",
	[337301] = "Imbued Reflections",
	[339924] = "Brutal Projectiles",
	[341650] = "Emeni's Ambulatory Flesh",
	[339231] = "Growing Inferno",
	[338671] = "Fel Defender",
	[337264] = "Walk with the Ox",
	[336999] = "Gift of the Lich",
	[331576] = "Agent of Chaos",
	[341446] = "Conflux of Elements",
	[331586] = "Thrill Seeker",
	[329791] = "Valiant Strikes",
	[319211] = "Soothing Voice",
	[341531] = "Quick Decisions",
	[339186] = "Tumbling Waves",
	[341440] = "Bloodletting",
	[332756] = "Expedition Leader",
	[325068] = "Face Your Foes",
	[338345] = "Holy Oration",
	[341447] = "Evolved Swarm",
	[319210] = "Social Butterfly",
	[323095] = "Ultimate Form",
	[341280] = "Born Anew",
	[339712] = "Resplendent Light",
	[336379] = "Harm Denial",
	[336140] = "Watch the Shoes!",
	[340218] = "Ringing Clarity",
	[341383] = "Endless Thirst",
	[339578] = "Borne of Blood",
	[337790] = "Exaltation",
	[341537] = "Well-Placed Steel",
	[329781] = "Resonant Accolades",
	[340616] = "Flash of Clarity",
	[336812] = "Resplendent Mist",
	[337123] = "Cryo-Freeze",
	[337954] = "Mental Recovery",
	[339114] = "Golden Path",
	[326509] = "Heirmir's Arsenal: Ravenous Pendant",
	[338346] = "Nature's Focus",
	[324441] = "Hearth Kidneystone",
	[339183] = "Essential Extraction",
	[340549] = "Unstoppable Growth",
	[338131] = "High Voltage",
	[340719] = "Umbral Intensity",
	[340562] = "Diabolic Bloodstone",
	[340686] = "Incessant Hunter",
	[333935] = "Hammer of Genesis",
	[340720] = "Stellar Inspiration",
	[337972] = "Hardened Bones",
	[337957] = "Blood Bond",
	[342156] = "Lead by Example",
	[331726] = "Regenerating Materials",
	[341272] = "Sudden Fractures",
	[338664] = "Proliferation",
	[337884] = "Withering Plague",
	[337293] = "Tempest Barrier",
	[338435] = "Meat Shield",
	[337302] = "Vicious Contempt",
	[344358] = "Unnatural Malice",
	[335010] = "Brutal Vitality",
	[339264] = "Markman's Advantage",
	[337678] = "Move with Grace",
	[336452] = "Inner Fury",
	[338033] = "Thunderous Paws",
	[341399] = "Flame Infusion",
	[320659] = "Niya's Tools: Burrs",
	[339890] = "Duplicitous Havoc",
	[340063] = "Brooding Pool",
	[338799] = "Felfire Haste",
	[338651] = "Brutal Grasp",
	[338303] = "Call of Flame",
	[320668] = "Nature's Splendor",
	[338338] = "Rabid Shadows",
	[341543] = "Sleight of Hand",
	[336147] = "Leisurely Gait",
	[339939] = "Destructive Reverberations",
	[340159] = "Service In Stone",
	[337295] = "Bone Marrow Hops",
	[340012] = "Punish the Guilty",
	[332753] = "Superior Tactics",
	[336890] = "Dizzying Tumble",
	[341546] = "Count the Odds",
	[336636] = "Flow of Time",
	[339149] = "Lost in Darkness",
	[338319] = "Haunting Apparitions",
	[323079] = "Kevin's Keyring",
	[325073] = "Get In Formation",
	[337811] = "Lasting Spirit",
	[341451] = "Born of the Wilds",
	[319973] = "Built for War",
	[323921] = "Emeni's Magnificent Skin",
	[325601] = "Hold the Line",
	[341310] = "Lashing Scars",
	[339370] = "Harrowing Punishment",
	[337778] = "Shining Radiance",
	[341311] = "Nimble Fingers",
	[346747] = "Ambuscade",
	[336616] = "Xuen's Bond",
	[339292] = "Wrench Evil",
	[341344] = "Withering Ground",
	[336613] = "Winter's Protection",
	[340553] = "Well-Honed Instincts",
	[338054] = "Crippling Hex",
	[338331] = "Magma Fist",
	[337981] = "Vital Accretion",
	[338682] = "Viscous Ink",
	[339518] = "Virtuous Command",
	[339265] = "Veteran's Repute",
	[334066] = "Mentorship",
	[339920] = "Sharpshooter's Focus",
	[336522] = "Icy Propulsion",
	[323916] = "Sulfuric Emission",
	[340006] = "Vengeful Shock",
	[339948] = "Disturb the Peace",
	[340540] = "Ursine Vigor",
	[331579] = "Friends in Low Places",
	[339987] = "Untempered Dedication",
	[338318] = "Unruly Winds",
	[340605] = "Layered Mane",
	[337154] = "Unnerving Focus",
	[338492] = "Unleashed Frenzy",
	[323918] = "Gristled Toes",
	[340552] = "Unchecked Aggression",
	[328266] = "Combat Meditation",
	[337084] = "Tumbling Technique",
	[341540] = "Triple Threat",
	[337250] = "Evasive Stride",
	[337662] = "Translucent Image",
	[337119] = "Scalding Brew",
	[340682] = "Taste for Blood",
	[340028] = "Increased Scrutiny",
	[340545] = "Tireless Pursuit",
	[340185] = "The Long Summer",
	[339531] = "Templar's Vindication",
	[338042] = "Totemic Surge",
	[337947] = "Resonant Words",
	[340694] = "Sudden Ambush",
	[337099] = "Rising Sun Revival",
	[338339] = "Swirling Currents",
	[339984] = "Focused Light",
	[336247] = "Life of the Party",
	[58081] = "Kilrogg's Cunning",
	[338089] = "Fleeting Wind",
	[339386] = "Mortal Combo",
	[339818] = "Show of Force",
	[337078] = "Swift Transference",
	[341222] = "Strength of the Pack",
	[339124] = "Pure Concentration",
	[339018] = "Enfeebled Mark",
	[339495] = "Reversal of Fortune",
	[338252] = "Shake the Foundations",
	[329786] = "Road of Trials",
	[323090] = "Plaguey's Preemptive Strike",
	[339587] = "Demon Muzzle",
	[341559] = "Stiletto Staccato",
	[334993] = "Stalwart Guardian",
	[338048] = "Spiritual Resonance",
	[337822] = "Accelerated Cold",
	[336853] = "Fortifying Ingredients",
	[319213] = "Empowered Chrysalis",
	[336632] = "Grounding Breath",
	[337705] = "Spirit Drain",
	[338628] = "Impenetrable Gloom",
	[338741] = "Divine Call",
	[337275] = "Incantation of Swiftness",
	[341312] = "Recuperator",
	[335260] = "Merciless Bonegrinder",
	[340229] = "Soul Tithe",
	[337241] = "Nourishing Chi",
	[339423] = "Soul Furnace",
	[337087] = "Siphoned Malice",
	[341549] = "Deeper Daggers",
	[339845] = "Fel Commando",
	[340529] = "Tough as Bark",
	[336245] = "Token of Appreciation",
	[336526] = "Calculated Strikes",
	[333950] = "Bron's Call to Action",
	[336777] = "Grounding Surge",
	[339230] = "Serrated Glaive",
	[331577] = "Fancy Footwork",
	[331609] = "Forgelite Filter",
	[337224] = "Flame Accretion",
	[341309] = "Septic Shock",
	[341529] = "Cloaked in Shadows",
	[339379] = "Shade of Terror",
	[339259] = "Piercing Verdict",
	[339644] = "Roaring Fire",
	[335196] = "Safeguard",
	[338566] = "Lingering Plague",
	[341534] = "Rushed Setup",
	[340212] = "Hallowed Discernment",
	[328263] = "Cleansed Vestments",
	[340030] = "Royal Decree",
	[338343] = "Heavy Rainfall",
	[320687] = "Swift Patrol",
	[341350] = "Deadly Tandem",
	[337966] = "Courageous Ascension",
	[339481] = "Rolling Agony",
	[320658] = "Stay on the Move",
	[338315] = "Shattered Perceptions",
	[339651] = "Tactical Retreat",
	[332754] = "Hold Your Ground",
	[337764] = "Reinforced Shell",
	[342270] = "Run Without Tiring",
	[339272] = "Resolute Barrier",
	[339459] = "Resilience of the Hunter",
	[339895] = "Repeat Decree",
	[339151] = "Relentless Onslaught",
	[339371] = "Expurgation",
	[339185] = "Lavish Harvest",
	[339048] = "Demonic Parole",
	[341538] = "Maim, Mangle",
	[339399] = "Rejuvenating Wind",
	[337748] = "Light's Inspiration",
	[340023] = "Resolute Defender",
	[323081] = "Plagueborn Cleansing Slime",
	[319978] = "Enduring Gloom",
	[337974] = "Refreshing Waters",
	[340550] = "Ready for Anything",
	[338835] = "Ravenous Consumption",
	[336191] = "Indelible Victory",
	[345594] = "Pyroclastic Shock",
	[335250] = "Cacophonous Roar",
	[340706] = "Precise Alignment",
	[337762] = "Power Unto Others",
	[341536] = "Poisoned Katar",
	[341556] = "Planned Execution",
	[339896] = "Combusting Engine",
	[340609] = "Savage Combatant",
	[340876] = "Echoing Call",
	[341567] = "Perforated Veins",
	[337786] = "Pain Transformation",
	[319214] = "Faerie Dust",
	[337715] = "Charitable Soul",
	[339455] = "Corrupting Leer",
	[336886] = "Nether Precision",
	[341378] = "Deep Allegiance",
	[341325] = "Controlled Destruction",
	[337934] = "Eradicating Blow",
	[338325] = "Chilled to the Core",
	[338793] = "Shattered Restoration",
	[339766] = "Tyrant's Soul",
	[326507] = "Resourceful Fleshcrafting",
	[336184] = "Exquisite Ingredients",
	[319216] = "Somnambulist",
	[340621] = "Floral Recycling",
	[319191] = "Field of Blossoms",
	[340316] = "Catastrophic Origin",
	[341246] = "Stinging Strike",
	[337303] = "Way of the Fae",
	[335242] = "Crash the Ramparts",
	[338305] = "Fae Fermata",
	[331580] = "Exacting Preparation",
	[329777] = "Phial of Patience",
	[337192] = "Magi's Brand",
	[341535] = "Prepared for All",
	[341542] = "Ambidexterity",
	[337214] = "Hack and Slash",
	[339130] = "Fel Celerity",
	[332755] = "Unbreakable Body",
	[336884] = "Lingering Numbness",
	[337979] = "Festering Transfusion",
	[341539] = "Lethal Poisons",
	[325066] = "Wild Hunt Tactics",
	[338322] = "Focused Lightning",
	[329778] = "Pointed Courage",
	[326513] = "Bonesmith's Satchel",
	[341264] = "Reverberation",
	[326504] = "Serrated Spaulders",
	[337136] = "Diverted Energy",
	[331584] = "Dauntless Duelist",
	[328265] = "Bond of Friendship",
	[337964] = "Astral Protection",
	[340705] = "Carnivorous Instinct",
	[337707] = "Clear Mind",
	[339109] = "Spirit Attunement",
	[339750] = "One With the Beast",
	[326572] = "Heirmir's Arsenal: Marrowed Gemstone",
	[325069] = "First Strike",
	[335034] = "Inspiring Presence",
	[319983] = "Wasteland Propriety",
	[329784] = "Cleansing Rites",
	[325067] = "Horn of the Wild Hunt",
	[323089] = "Travel with Bloop",
	[329776] = "Ascendant Phial",
	[336243] = "Refined Palate",
	[338311] = "Unending Grip",
	[319217] = "Podtender",
	[339316] = "Echoing Blessings",
	[339892] = "Ashen Remains",
	[324440] = "Cartilaginous Legs",
	[338553] = "Convocation of the Dead",
	[323091] = "Ooz's Frictionless Coating",
	[339570] = "Enkindled Spirit",
	[336873] = "Arcane Prodigy",
	[337914] = "Focused Mending",
	[323919] = "Gnashing Chompers",
	[325072] = "Vorkai Sharpening Techniques",
	[339656] = "Carnivorous Stalkers",
	[320660] = "Niya's Tools: Poison",
	[339704] = "Ferocious Appetite",
	[337988] = "Everfrost",
	[337381] = "Eternal Hunger",
	[323074] = "Volatile Solvent",
	[336992] = "Discipline of the Grove",
	[325065] = "Wild Hunt's Charge",
	[339059] = "Empowered Release",
	[337980] = "Embrace Death",
	[340708] = "Fury of the Skies",
	[326511] = "Heirmir's Arsenal: Gorestompers",
	[328261] = "Focusing Mantra",
	[339282] = "Accrued Vitality",
	[340192] = "Righteous Might",
	[331725] = "Resilient Plumage",
	[328257] = "Let Go of the Past",
	[336598] = "Coordinated Offensive",
	[335232] = "Ashen Juggernaut",
	[319982] = "Move As One",
	[337704] = "Chilled Resilience",
	[331582] = "Familiar Predicaments",
}


local playerInv_DB
local Profile
local playerNme
local realmName
local playerClass, classID,_
local viewed_spec
CovenantForge.conduitList = {}
local CONDUIT_RANKS = {
	[1] = C_Soulbinds.GetConduitItemLevel(0, 1),
	[2] = C_Soulbinds.GetConduitItemLevel(0, 2),
	[3] = C_Soulbinds.GetConduitItemLevel(0, 3),
	[4] = C_Soulbinds.GetConduitItemLevel(0, 4),
	[5] = C_Soulbinds.GetConduitItemLevel(0, 5),
	[6] = C_Soulbinds.GetConduitItemLevel(0, 6),
	[7] = C_Soulbinds.GetConduitItemLevel(0, 7),
	[8] = C_Soulbinds.GetConduitItemLevel(0, 8),
}

local DB_Defaults = {
	char_defaults = {
		profile = {
			item = {},
			set = {},
			extraset = {},
			outfits = {},
			lastTransmogOutfitIDSpec = {},
			listUpdate = false,
		}
	},
}
local WEIGHT_BASE = 37.75

--ACE3 Option Handlers
local optionHandler = {}
function optionHandler:Setter(info, value)
	CovenantForge.Profile[info[#info]] = value
	if SoulbindViewer:IsShown() then
		CovenantForge:Update()
	end
end


function optionHandler:Getter(info)
	return CovenantForge.Profile[info[#info]]
end

local options = {
	name = CovenantForgeLocal,
	handler = optionHandler,
	get = "Getter",
	set = "Setter",
	type = 'group',
	childGroups = "tab",
	inline = true,
	args = {
		settings={
			name = "Options",
			type = "group",
			inline = false,
			order = 0,
			args = {
				Options_Header = {
					order = 1,
					name = "General Options",
					type = "header",
					width = "full",
				},
				
				ShowSoulbindNames = {
					order = 3,
					name = "Show Soulbind Name",
					type = "toggle",
					width = "full",
					arg = "ShowSoulbindNames",
				},

				ShowNodeNames = {
					order = 3.1,
					name = "Show Node Ability Names",
					type = "toggle",
					width = "full",
					arg = "ShowNodeNames",
				},
				ShowWeights = {
					order = 4,
					name = "Show Weights",
					type = "toggle",
					width = "full",
					arg = "ShowWeights",
				},
				HideZeroValues = {
					order = 5,
					name = "Hide Weight Values That Are 0",
					type = "toggle",
					width = "full",
					arg = "ShowWeights",
				},

				ShowAsPercent = {
					order = 4,
					name = "Show Weight as Percent",
					type = "toggle",
					width = "full",
					arg = "ShowAsPercent",
				},

				disableFX = {
					order = 5.1,
					name = "Disable FX",
					width = "full",
					type = "toggle",
				},

				ShowTooltipRank = {
					order = 6,
					name = "Show Conduit Rank on Tooltip",
					type = "toggle",
					width = "full",
				},
			},
		},
	},
}

local defaults = {
	profile = {
				['*'] = true,
				disableFX = false,
			},
}

local pathDefaults = {
	char ={
		paths = {},
		selectedProfile = 1,
	},
}

local weightDefaults = {
	class ={
		weights = {},
		base = {},
	},
}

---Ace based CovenantForge initilization
function CovenantForge:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("CovenantForgeDB", defaults, true)
	self.savedPathdb = LibStub("AceDB-3.0"):New("CovenantForgeSavedPaths", pathDefaults, true)
	self.weightdb = LibStub("AceDB-3.0"):New("CovenantForgeWeights", weightDefaults, true)

	CovenantForge.Profile = self.db.profile
	options.args.profiles  = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
	options.args.weights  = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.weightdb)
	options.args.weights.name = "Weights"
	LibStub("AceConfigRegistry-3.0"):ValidateOptionsTable(options, "CovenantForge")
	LibStub("AceConfig-3.0"):RegisterOptionsTable("CovenantForge", options)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("CovenantForge", CovenantForgeLocal)
	--self.db.RegisterCallback(OmegaMap, "OnProfileChanged", "RefreshConfig")
	--self.db.RegisterCallback(OmegaMap, "OnProfileCopied", "RefreshConfig")
	--self.db.RegisterCallback(OmegaMap, "OnProfileReset", "RefreshConfig")



	CovenantForge:RegisterEvent("ADDON_LOADED", "EventHandler" )

end

function CovenantForge:EventHandler(event, arg1 )
	if event == "ADDON_LOADED" and arg1 == "Blizzard_Soulbinds" and C_Covenants.GetActiveCovenantID() ~= 0 then 
		C_Timer.After(0, function() CovenantForge.Init:CreateSoulbindFrames() end)

		self:SecureHook(SoulbindViewer, "Open", function()  C_Timer.After(.05, function() CovenantForge:Update() end) end , true)
			--CovenantForge:Hook(ConduitListConduitButtonMixin, "Init", "ConduitRank", true)
		self:SecureHook(SoulbindViewer, "SetSheenAnimationsPlaying", "StopAnimationFX")
		self:SecureHook(SoulbindTreeNodeLinkMixin, "SetState", "StopNodeFX")
		self:UnregisterEvent("ADDON_LOADED")
	elseif event == "COVENANT_CHOSEN" then 
		CovenantForge:EventHandler("ADDON_LOADED", "Blizzard_Soulbinds")
		CovenantForge:OnEnable()
		self:UnregisterEvent("ADDON_LOADED")
	end

end

local SoulbindConduitNodeEvents =
{
	"SOULBIND_CONDUIT_INSTALLED",
	"SOULBIND_CONDUIT_UNINSTALLED",
	"SOULBIND_PENDING_CONDUIT_CHANGED",
	"SOULBIND_CONDUIT_COLLECTION_UPDATED",
	"SOULBIND_CONDUIT_COLLECTION_REMOVED",
	"SOULBIND_CONDUIT_COLLECTION_CLEARED",
	"PLAYER_SPECIALIZATION_CHANGED",
	"SOULBIND_NODE_LEARNED",
	"SOULBIND_PATH_CHANGED",
	"SOULBIND_ACTIVATED",
}

function CovenantForge:OnEnable()
	--If not part of a covenant wait until one is chosen
	if C_Covenants.GetActiveCovenantID() == 0 then
		CovenantForge:RegisterEvent("COVENANT_CHOSEN", "EventHandler" )
		return 
	end
	CovenantForge:BuildWeightData()
	CovenantForge:GetClassConduits()
	local spec = GetSpecialization()
	CovenantForge.viewed_spec = GetSpecializationInfo(spec)

	self:SecureHookScript(GameTooltip, "OnTooltipSetItem", "GenerateToolip")
	self:SecureHookScript(ItemRefTooltip, "OnTooltipSetItem", "GenerateToolip")
	self:SecureHookScript(EmbeddedItemTooltip,"OnTooltipSetItem", "GenerateToolip")

		hooksecurefunc(GameTooltip, "SetQuestItem", function(tooltip)
		CovenantForge:GenerateToolip(tooltip)
	end)


	hooksecurefunc(GameTooltip, "SetQuestLogItem", function(tooltip)
		CovenantForge:GenerateToolip(tooltip)
	end)
end

local CLASS_SPECS ={{71,72,73},{65,66,70},{253,254,255},{259,260,261},{256,257,258},{250,251,252},{262,263,264},{62,63,64},{265,266,267},{268,270,69},{102,103,104,105},{577,578}}
local currentTab = 1
local scroll
local scrollcontainer
function CovenantForge.Init:CreateSoulbindFrames()
	local frame = CreateFrame("Frame", "CovForge_events", SoulbindViewer)
	
	frame:SetScript("OnShow", function() FrameUtil.RegisterFrameForEvents(frame, SoulbindConduitNodeEvents) end)
	frame:SetScript("OnHide", function() FrameUtil.UnregisterFrameForEvents(frame, SoulbindConduitNodeEvents ); currentTab = 1 end)
	frame:SetScript("OnEvent", CovenantForge.Update)
	--frame:Show()
	FrameUtil.RegisterFrameForEvents(frame, SoulbindConduitNodeEvents);
	local covenantID = C_Covenants.GetActiveCovenantID();
	--local soulbindID = C_Soulbinds.GetActiveSoulbindID();

	local spec = GetSpecialization()
	local specID, specName = GetSpecializationInfo(spec)
	--local soulbindData = C_Soulbinds.GetSoulbindData(1).name;

	--SoulbindViewer.SelectGroup
	for buttonIndex, button in ipairs(SoulbindViewer.SelectGroup.buttonGroup:GetButtons()) do
		CovenantForge:Hook(button, "OnSelected", function() CovenantForge:Update() end , true)

		local f = CreateFrame("Frame", "CovForge_Souldbind"..buttonIndex, button, "CovenantForge_SoulbindInfoTemplate")
		button.ForgeInfo = f
	end

	for buttonIndex, nodeFrame in pairs(SoulbindViewer.Tree:GetNodes()) do
		local f = CreateFrame("Frame", "CovForge_Conduit"..buttonIndex, nodeFrame, "CovenantForge_ConduitInfoTemplate")
		nodeFrame.ForgeInfo = f
	end

	local _, _, classID = UnitClass("player")
	local classSpecs = CLASS_SPECS[classID]
	local dropdownList = {}
	for index,ID in ipairs(classSpecs) do
		local specID, specName = GetSpecializationInfo(index)
		dropdownList[ID] = specName
	end

	--Spec Selection Dropdown
	local frame = AceGUI:Create("SimpleGroup")
	frame.frame:SetParent(SoulbindViewer)
	frame:SetHeight(20)
	frame:SetWidth(125)
	frame:SetPoint("TOP",SoulbindViewer,"TOP", 105, -33)
	frame:SetLayout("Fill")
	local dropdown = AceGUI:Create("Dropdown")
	frame:AddChild(dropdown)
	dropdown:SetList(dropdownList)
	local spec = GetSpecialization()
	local specID = GetSpecializationInfo(spec)
	dropdown:SetValue(specID)
	dropdown:SetCallback("OnValueChanged", function(self,event, key) CovenantForge.viewed_spec = key; CovenantForge:Update() end)

	local f = CreateFrame("Frame", "CovForge_WeightTotal", SoulbindViewer, "CovenantForge_WeightTotalTemplate")
	CovenantForge.CovForge_WeightTotalFrame = f
	f:Show()
	f:ClearAllPoints()
	f:SetPoint("BOTTOM",SoulbindViewer.ActivateSoulbindButton,"BOTTOM", 0, 25)

	CovenantForge:Hook(SoulbindViewer, "UpdateCommitConduitsButton", function()CovenantForge.CovForge_WeightTotalFrame:SetShown(not SoulbindViewer.CommitConduitsButton:IsShown()) end, true)
	--CovenantForge.CovForge_WeightTotalFrame:SetShown(not SoulbindViewer.CommitConduitsButton:IsShown())
	CovenantForge:Update()

	f = CreateFrame("Frame", "CovForge_PathStorage", SoulbindViewer, "CovenantForge_PathStorageTemplate")
	f:ClearAllPoints()
	f:SetPoint("TOPLEFT", SoulbindViewer.ConduitList, "TOPLEFT", 10, 0)
	f:SetPoint("BOTTOMRIGHT", SoulbindViewer.ConduitList, "BOTTOMRIGHT" , 10, -40)
	CovenantForge.PathStorageFrame = f
	f.Background:SetDesaturated(true)
	f.Background:SetAlpha(0.3)
	local covenantData = C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID());
	f.Background:SetAtlas(("ui-frame-%schoice-cardparchment"):format(covenantData.textureKit))
	f:Hide()

	CovenantForge.PathStorageFrame.TabList = {}
	local DefaultsTab = CreateFrame("CheckButton", "$parentTab1", SoulbindViewer, "CovenantForge_TabTemplate", 1)
   -- PathTab:SetSize(50,50)
	DefaultsTab:SetPoint("TOPRIGHT", SoulbindViewer, "TOPRIGHT", 30, -20)
	DefaultsTab.tooltip = "Learned Conduits"
	DefaultsTab:Show()
	DefaultsTab.TabardEmblem:SetTexture("Interface/ICONS/Ability_Monk_EssenceFont")
	DefaultsTab.tabIndex = 1
	DefaultsTab:SetChecked(true)
	table.insert(CovenantForge.PathStorageFrame.TabList ,DefaultsTab )


	local PathTab = CreateFrame("CheckButton", "$parentTab2", SoulbindViewer, "CovenantForge_TabTemplate", 1)
   -- PathTab:SetSize(50,50)
	PathTab:SetPoint("TOPRIGHT", DefaultsTab, "BOTTOMRIGHT", 0, -20)
	PathTab.tooltip = "Saved Paths"
	PathTab:Show()
	PathTab.TabardEmblem:SetTexture("Interface/ICONS/Ability_Druid_FocusedGrowth")
	PathTab.tabIndex = 2
	table.insert(CovenantForge.PathStorageFrame.TabList,PathTab )

	local ConduitTab = CreateFrame("CheckButton", "$parentTab3", SoulbindViewer, "CovenantForge_TabTemplate", 1)
   -- PathTab:SetSize(50,50)
	ConduitTab:SetPoint("TOPRIGHT", PathTab, "BOTTOMRIGHT", 0, -20)
	ConduitTab.tooltip = "Avaiable Conduits"
	ConduitTab:Show()
	ConduitTab.TabardEmblem:SetTexture("Interface/ICONS/70_inscription_steamy_romance_novel_kit")
	ConduitTab.tabIndex = 3
	table.insert(CovenantForge.PathStorageFrame.TabList,ConduitTab )

	local WeightsTab = CreateFrame("CheckButton", "$parentTab4", SoulbindViewer, "CovenantForge_TabTemplate", 1)
   -- PathTab:SetSize(50,50)
	WeightsTab:SetPoint("TOPRIGHT", ConduitTab, "BOTTOMRIGHT", 0, -20)
	WeightsTab.tooltip = "Weights"
	WeightsTab:Show()
	WeightsTab.TabardEmblem:SetTexture("Interface/ICONS/INV_Stone_WeightStone_06.blp")
	WeightsTab.tabIndex = 4
	table.insert(CovenantForge.PathStorageFrame.TabList,WeightsTab )

	scrollcontainer = AceGUI:Create("SimpleGroup") -- "InlineGroup" is also good
	scrollcontainer.frame:SetParent(CovenantForge.PathStorageFrame)
	scrollcontainer:ClearAllPoints()
	scrollcontainer:SetPoint("TOPLEFT", CovenantForge.PathStorageFrame,"TOPLEFT", 0, -55)
	scrollcontainer:SetPoint("BOTTOMRIGHT", CovenantForge.PathStorageFrame,"BOTTOMRIGHT", -15,15)
	scrollcontainer:SetFullWidth(true)
	scrollcontainer:SetFullHeight(true) -- probably?
	scrollcontainer:SetLayout("Fill")
	CovenantForge.scrollcontainer = scrollcontainer

	f:SetScript("OnHide", function() scrollcontainer:ReleaseChildren() end)
	f:SetScript("OnShow", function() CovenantForge:UpdateSavedPathsList() end)

	CovenantForge:UpdateSavedPathsList()
	if CovenantForge.ElvUIDelay then 
		CovenantForge.ElvUIDelay()
		ElvUIDelay = nil
	end

	frame = AceGUI:Create("SimpleGroup")
	frame.frame:SetParent(SoulbindViewer)
	frame:SetHeight(25)
	frame:SetWidth(25)
	frame:SetPoint("BOTTOMRIGHT",SoulbindViewer.ConduitList,"BOTTOMLEFT", -10, -40)
	local icon = AceGUI:Create("Icon") 
	icon:SetImage("Interface/Buttons/UI-OptionsButton")
	icon:SetHeight(20)
	icon:SetWidth(25)
	icon:SetImageSize(20,20)
	icon:SetCallback("OnClick", function() LibStub("AceConfigDialog-3.0"):Open("CovenantForge") end)
	frame:AddChild(icon)
end


function CovenantForgeSavedTab_OnClick(self)
	local currentTab = self.tabIndex
	for i, tab in ipairs(CovenantForge.PathStorageFrame.TabList) do
		tab:SetChecked(currentTab == i)
	end

	if currentTab == 1 then
		CovenantForge.PathStorageFrame:Hide()
		SoulbindViewer.ConduitList:Show()
	elseif currentTab == 2 then
		CovenantForge.PathStorageFrame:Show()
		SoulbindViewer.ConduitList:Hide()
		CovenantForge.PathStorageFrame.EditBox:Show()
		CovenantForge.PathStorageFrame.CreateButton:Show()
		CovenantForge.PathStorageFrame.Title:SetText("Saved Paths")
		CovenantForge:UpdateSavedPathsList()
	elseif currentTab == 3 then
		CovenantForge.PathStorageFrame:Show()
		SoulbindViewer.ConduitList:Hide()
		CovenantForge.PathStorageFrame.EditBox:Hide()
		CovenantForge.PathStorageFrame.CreateButton:Hide()
		CovenantForge.PathStorageFrame.Title:SetText("Conduits")
		CovenantForge:UpdateConduitList()
	elseif currentTab == 4 then
		CovenantForge.PathStorageFrame:Show()
		SoulbindViewer.ConduitList:Hide()
		CovenantForge.PathStorageFrame.EditBox:Hide()
		CovenantForge.PathStorageFrame.CreateButton:Hide()
		CovenantForge.PathStorageFrame.Title:SetText("Weights")
		CovenantForge:UpdateWeightList()
	end
end

local filterValue = 1
local filteredList = CovenantForge.conduitList
function CovenantForge:UpdateConduitList()
	if not SoulbindViewer or (SoulbindViewer and not SoulbindViewer:IsShown()) or
 		not CovenantForge.scrollcontainer then return end

 	local filter = {"All", 	Soulbinds.GetConduitName(0),Soulbinds.GetConduitName(1),Soulbinds.GetConduitName(2), "Soulbinds"}

	scrollcontainer:ReleaseChildren()
	scrollcontainer:SetPoint("TOPLEFT", CovenantForge.PathStorageFrame,"TOPLEFT", 0, -25)

	scroll = AceGUI:Create("ScrollFrame")
	scroll:SetLayout("Flow") -- probably?
	scrollcontainer:AddChild(scroll)

	dropdown = AceGUI:Create("Dropdown")
	dropdown:SetFullWidth(false)
	dropdown:SetWidth(200)
	scroll:AddChild(dropdown)
	dropdown:SetList(filter)
	dropdown:SetValue(filterValue)
	dropdown:SetCallback("OnValueChanged", 
		function(self,event, key) 
			--print("SDF")
			filterValue = key; 
			if key == 1 then 
				filteredList = CovenantForge.conduitList
			else 
				filteredList = {CovenantForge.conduitList[key-2]}
			end
			CovenantForge:UpdateConduitList()
		end)

	for i, typedata in pairs(filteredList) do
		local index = i
		if #filteredList == 1 then 
			index = filterValue - 2
		end
		local collectionData = C_Soulbinds.GetConduitCollection(index)

		local topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)
		local bottomHeading = AceGUI:Create("Heading") 
		bottomHeading:SetRelativeWidth(1)
		bottomHeading:SetHeight(5)

		local label = AceGUI:Create("Label") 
			label:SetText(Soulbinds.GetConduitName(index))
			local atlas = Soulbinds.GetConduitEmblemAtlas(index);
			--label:SetImage(icon)
			label:SetImage("Interface/Buttons/UI-OptionsButton")

			label.image:SetAtlas(atlas)
			label:SetFontObject(GameFontHighlightLarge)

			--label.image.imageshown = true
			label:SetImageSize(30,30)
			label:SetRelativeWidth(1)
			scroll:AddChild(topHeading)
			scroll:AddChild(label)
			scroll:AddChild(bottomHeading)

		for i, data in pairs(typedata) do
			for _,spec in ipairs(data[4]) do
				if CovenantForge.viewed_spec == spec then 
					local spellID = data[2]
					local name = GetSpellInfo(spellID) or data[1]
					local type = Soulbinds.GetConduitName(data[3])
					local desc = GetSpellDescription(spellID)
					local _,_, icon = GetSpellInfo(spellID)
					local titleColor = ORANGE_FONT_COLOR_CODE
					for _, data in ipairs(collectionData) do
						local c_spellID = C_Soulbinds.GetConduitSpellID(data.conduitID, data.conduitRank)
						if c_spellID == spellID then 
							titleColor = GREEN_FONT_COLOR_CODE
							break
						end
					end
					local weight = CovenantForge:GetConduitWeight(CovenantForge.viewed_spec, i)
					if weight then
						if weight > 0 then
							if CovenantForge.Profile.ShowAsPercent then 
								weight = CovenantForge:GetWeightPercent(weight).."%"
							end
							weight = GREEN_FONT_COLOR_CODE.."(+"..weight..")"
						elseif weight < 0 then
							if CovenantForge.Profile.ShowAsPercent then 
								weight = CovenantForge:GetWeightPercent(weight).."%"
							end
							weight = RED_FONT_COLOR_CODE.."("..weight..")"
						else
							weight = ""
						end
					end

					local text = ("%s-%s (%s)-\n%s%s %s\n "):format(titleColor, name, type, GRAY_FONT_COLOR_CODE,desc,weight)
					local label = AceGUI:Create("Label") 
					label:SetText(text)
					label:SetImage(icon)
					label:SetFont(GameFontNormal:GetFont(), 12)
					label:SetImageSize(30,30)
					label:SetRelativeWidth(1)
					scroll:AddChild(label)
				end
			end
		end


	end
		if filterValue == 1 or filterValue == 5 then 
		local topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)
		scroll:AddChild(topHeading)

		local label = AceGUI:Create("Label") 
		label:SetText("Soulbinds")

		local covenantData = C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID());
		label:SetImage("Interface/Buttons/UI-OptionsButton")
		label.image:SetAtlas(("CovenantChoice-Celebration-%sSigil"):format(covenantData.textureKit))
		label:SetFontObject(GameFontHighlightLarge)

		--label.image.imageshown = true
		label:SetImageSize(30,30)
		label:SetRelativeWidth(1)
		label:SetHeight(5)
		scroll:AddChild(label)

		topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)
		scroll:AddChild(topHeading)

		local powers = CovenantForge.powers
		for soulbindID, sb_powers in pairs(powers) do
			local soulbind_data = C_Soulbinds.GetSoulbindData(soulbindID)
			for i, spellID in pairs(sb_powers) do
				local name = soulbind_data.name..": "..GetSpellInfo(spellID) or ""
				local desc = GetSpellDescription(spellID)
				local _,_, icon = GetSpellInfo(spellID)
				local titleColor = ORANGE_FONT_COLOR_CODE

				local weight = CovenantForge:GetTalentWeight(CovenantForge.viewed_spec, spellID)
				if weight then
					if weight > 0 then
						if CovenantForge.Profile.ShowAsPercent then 
							weight = CovenantForge:GetWeightPercent(weight).."%"
						end
						weight = GREEN_FONT_COLOR_CODE.."(+"..weight..")"
					elseif weight < 0 then
						if CovenantForge.Profile.ShowAsPercent then 
							weight = CovenantForge:GetWeightPercent(weight).."%"
						end
						weight = RED_FONT_COLOR_CODE.."("..weight..")"
					else
						weight = ""
					end
				end

				local text = ("%s-%s-\n%s%s %s\n "):format(titleColor, name, GRAY_FONT_COLOR_CODE,desc,weight)
				local label = AceGUI:Create("Label") 
				label:SetText(text)
				label:SetImage(icon)
				label:SetFont(GameFontNormal:GetFont(), 12)
				label:SetImageSize(30,30)
				label:SetRelativeWidth(1)
				scroll:AddChild(label)
			end
		end
	end
end


--Updates Weight Values & Names
function CovenantForge:Update()
	local curentsoulbindID = Soulbinds.GetOpenSoulbindID() or C_Soulbinds.GetActiveSoulbindID();

	for buttonIndex, button in ipairs(SoulbindViewer.SelectGroup.buttonGroup:GetButtons()) do
		local f = button.ForgeInfo 
		if not f then 
			f = CreateFrame("Frame", "CovForge_Souldbind"..buttonIndex, button, "CovenantForge_SoulbindInfoTemplate")
			button.ForgeInfo = f
		end

		local soulbindID = button:GetSoulbindID()
		f.soulbindName:SetText(C_Soulbinds.GetSoulbindData(soulbindID).name)

		local selectedTotal, unlockedTotal, nodeMax, conduitMax
		if CovenantForge.Profile.ShowWeights then
			if buttonIndex == C_Soulbinds.GetActiveSoulbindID() then
				f.soulbindWeight:ClearAllPoints()
				f.soulbindWeight:SetPoint("BOTTOMLEFT", 0, 45)
				f.soulbindWeight:SetPoint("BOTTOMRIGHT")
			else 
				f.soulbindWeight:ClearAllPoints()
				f.soulbindWeight:SetPoint("BOTTOMLEFT", 0, 25)
				f.soulbindWeight:SetPoint("BOTTOMRIGHT")
			end 
			f.soulbindWeight:Show()
			selectedTotal, unlockedTotal, nodeMax, conduitMax = CovenantForge:GetSoulbindWeight(soulbindID)
			f.soulbindWeight:SetText(selectedTotal .. "("..nodeMax + conduitMax..")" )
		else
			f.soulbindWeight:Hide()

		end

		if curentsoulbindID == soulbindID and CovenantForge.Profile.ShowWeights then 
			CovenantForge.CovForge_WeightTotalFrame.Weight:Show()
			CovenantForge.CovForge_WeightTotalFrame.Weight:SetText(selectedTotal.."/"..unlockedTotal.."\nMax:"..(nodeMax + conduitMax))
		elseif curentsoulbindID == soulbindID and not CovenantForge.Profile.ShowWeights then 
			CovenantForge.CovForge_WeightTotalFrame.Weight:Hide()
		end
	end

	for buttonIndex, nodeFrame in pairs(SoulbindViewer.Tree:GetNodes()) do
		local f = nodeFrame.ForgeInfo
		if not f then       
			f = CreateFrame("Frame", "CovForge_Conduit"..buttonIndex, nodeFrame, "CovenantForge_ConduitInfoTemplate")
			nodeFrame.ForgeInfo = f
		end

		f.Name:SetText("")
		if nodeFrame.Emblem then 
			nodeFrame.Emblem:ClearAllPoints()
			nodeFrame.Emblem:SetPoint("TOP", 0,16)
			nodeFrame.EmblemBg:ClearAllPoints()
			nodeFrame.EmblemBg:SetPoint("TOP", 0,16)
			f.Name:ClearAllPoints()
			f.Name:SetPoint("TOP",0, 21)
		end

		local name, weight
		if nodeFrame:IsConduit() then
			local conduit = nodeFrame:GetConduit()
			local conduitID = conduit:GetConduitID()
			if conduit and conduitID > 0  then
				local spellID = CovenantForge.Conduits[conduitID][2]
				name = GetSpellInfo(spellID)
				--local rank = conduit:GetConduitRank()
				--local itemLevel = C_Soulbinds.GetConduitItemLevel(conduitID, rank)
				weight = CovenantForge:GetConduitWeight(CovenantForge.viewed_spec, conduitID)
			else
				name = ""
			end
		else
			local spellID =  nodeFrame.spell:GetSpellID()
			name = GetSpellInfo(spellID) or ""
			weight = CovenantForge:GetTalentWeight(CovenantForge.viewed_spec, spellID)
		end
		f.Name:SetText(name)

		if weight and weight ~= 0 then 
			local sign = "+"
			if weight > 0 then 
				f.Value:SetTextColor(0,1,0)
			elseif weight < 0 then 
				f.Value:SetTextColor(1,0,0)
				sign = ""
			end

			if CovenantForge.Profile.ShowAsPercent then 
				weight = sign..CovenantForge:GetWeightPercent(weight).."%"
			end
		elseif weight and weight == 0 and CovenantForge.Profile.HideZeroValues then 
			weight = ""
		end
		if CovenantForge.Profile.ShowWeights then
			f.Value:Show()
			f.Value:SetText(weight or "")
		else
			f.Value:Hide()
		end
	end

	for conduitType, conduitData in ipairs(SoulbindViewer.ConduitList:GetLists()) do
		for conduitButton in SoulbindViewer.ConduitList.ScrollBox.ScrollTarget.Lists[conduitType].pool:EnumerateActive() do
			local conduitID = conduitButton.conduitData.conduitID
			local conduitItemLevel = conduitButton.conduitData.conduitItemLevel
			local conduitRank = conduitButton.conduitData.conduitRank

			local ilevelText = conduitItemLevel.."(Rank"..conduitRank..")"
			local weight = CovenantForge:GetConduitWeight(CovenantForge.viewed_spec, conduitID)
			local percent = CovenantForge:GetWeightPercent(weight)

			if CovenantForge.Profile.ShowWeights and weight ~=0 then 
				if CovenantForge.Profile.ShowAsPercent then 
					if percent > 0 then 
						conduitButton.ItemLevel:SetText(ilevelText..GREEN_FONT_COLOR_CODE.." (+"..percent.."%)");
					elseif percent < 0 then 
						conduitButton.ItemLevel:SetText(ilevelText..RED_FONT_COLOR_CODE.." ("..percent.."%)");
					end
				else
					if weight > 0 then 
						conduitButton.ItemLevel:SetText(ilevelText..GREEN_FONT_COLOR_CODE.." (+"..weight..")");
					elseif weight < 0 then 
						conduitButton.ItemLevel:SetText(ilevelText..RED_FONT_COLOR_CODE.." ("..weight..")");
					end
				end
			else 
				conduitButton.ItemLevel:SetText(ilevelText);
			end
		end
	end

	CovenantForge.CovForge_WeightTotalFrame:SetShown(not SoulbindViewer.CommitConduitsButton:IsShown())

	if CovenantForge.PathStorageFrame and CovenantForge.PathStorageFrame:IsShown() then 
		CovenantForgeSavedTab_OnClick({["tabIndex"] = currentTab})
	end
	if CovenantForge.PathStorageFrame and CovenantForge.PathStorageFrame:IsShown() and currentTab == 2 then
		CovenantForge:UpdateConduitList()
	end

	if CovenantForge.PathStorageFrame and CovenantForge.PathStorageFrame:IsShown() and currentTab == 3 then
		CovenantForge:UpdateWeightList()
	end
end


function CovenantForge:GenerateToolip(tooltip)
	if not self.Profile.ShowTooltipRank then return end

	local name, itemLink = tooltip:GetItem()
	if not name then return end

	if C_Soulbinds.IsItemConduitByItemInfo(itemLink) then
		local itemLevel = select(4, GetItemInfo(itemLink))

		for rank, level in pairs(CONDUIT_RANKS) do
			if itemLevel == level then
				self:ConduitTooltip_Rank(tooltip, rank);
			end
		end
	end
end


local ItemLevelPattern = gsub(ITEM_LEVEL, "%%d", "(%%d+)")
function CovenantForge:ConduitTooltip_Rank(tooltip, rank, row)
	local text, level
	local textLeft = tooltip.textLeft
	if not textLeft then
		local tooltipName = tooltip:GetName()
		textLeft = setmetatable({}, { __index = function(t, i)
			local line = _G[tooltipName .. "TextLeft" .. i]
			t[i] = line
			return line
		end })
		tooltip.textLeft = textLeft
	end

	if row and _G[tooltip:GetName() .. "TextLeft" .. 1] then
		local colormarkup = DARKYELLOW_FONT_COLOR:GenerateHexColorMarkup() 
		local line = textLeft[1]
		text = _G[tooltip:GetName() .. "TextLeft" .. 1]:GetText() or ""
		line:SetFormattedText(colormarkup.."Row %d: |r%s", row, text)
	end

	for i = 3, 5 do
		if _G[tooltip:GetName() .. "TextLeft" .. i] then
			local line = textLeft[i]
			text = _G[tooltip:GetName() .. "TextLeft" .. i]:GetText() or ""
			level = string.match(text, ItemLevelPattern)
			if (level) then
				line:SetFormattedText("%s (Rank %d)", text, rank);
				return ;
			end
		end
	end
end


function CovenantForge:StopAnimationFX(viewer)
	if self.Profile.disableFX then
		viewer.ForgeSheen.Anim:SetPlaying(false);
		viewer.BackgroundSheen1.Anim:SetPlaying(false);
		viewer.BackgroundSheen2.Anim:SetPlaying(false);
		viewer.GridSheen.Anim:SetPlaying(false);
		viewer.BackgroundRuneLeft.Anim:SetPlaying(false);
		viewer.BackgroundRuneRight.Anim:SetPlaying(false);
		viewer.ConduitList.Fx.ChargeSheen.Anim:SetPlaying(false);

		for buttonIndex, button in ipairs(SoulbindViewer.SelectGroup.buttonGroup:GetButtons()) do
			button.ModelScene.NewAlert:Hide();
			button.ModelScene.Highlight2.Pulse:Stop();
			button.ModelScene.Highlight3.Pulse:Stop();
			button.ModelScene.Dark.Pulse:Stop();
			button:GetFxModelScene():ClearEffects();
			button.ModelScene:SetPaused(true)
		end
	end
end


function CovenantForge:StopNodeFX(viewer)
	if self.Profile.disableFX then
		viewer.FlowAnim1:Stop();
		viewer.FlowAnim2:Stop();
		viewer.FlowAnim3:Stop();
		viewer.FlowAnim4:Stop();
		viewer.FlowAnim5:Stop();
		viewer.FlowAnim6:Stop();
	end
end


function CovenantForge:GetClassConduits()
	local className, classFile, classID = UnitClass("player")
	local classSpecs = CLASS_SPECS[classID]
	
	for i, data in pairs(CovenantForge.Conduits) do
		local valid = false
		for i, spec in ipairs(classSpecs) do
			if valid then break end

			for i, con_spec in ipairs(data[4]) do
				if spec == con_spec then 
					valid = true
					break
				end
			end
		end

		if valid then 
			local type = data[3]
			CovenantForge.conduitList[type] = CovenantForge.conduitList[type] or {}
			CovenantForge.conduitList[type][i] = data
		end
	end
end

--Sets Slash Command to load macro
CovenantForge:RegisterChatCommand("CFLoad", function(arg) CovenantForge:MacroLoad(arg) end)


--[[

	for i,spec in ipairs(classSpecs) do

	--CovenantForge.Weights["PreRaid"][specID][covenantID]
end

end 

function CovenantForge:GetConduitInfo(name)
	for i, data in pairs(CovenantForge.Conduits) do
	CovenantForge.Conduits ={
	[5]={ "Stalwart Guardian", 334993, 2, {72,71,73,},},

end

	self.conduitData = conduitData;
	self.conduit = SoulbindConduitMixin_Create(conduitData.conduitID, conduitData.conduitRank);

	local itemID = conduitData.conduitItemID;
	local item = Item:CreateFromItemID(itemID);
	local itemCallback = function()
		self.ConduitName:SetSize(150, 30);
		self.ConduitName:SetText(item:GetItemName());
		self.ConduitName:SetHeight(self.ConduitName:GetStringHeight());
		
		local yOffset = self.ConduitName:GetNumLines() > 1 and -6 or 0;
		self.ConduitName:ClearAllPoints();
		self.ConduitName:SetPoint("BOTTOMLEFT", self.Icon, "RIGHT", 10, yOffset);
		self.ConduitName:SetWidth(150);

		self.ItemLevel:SetPoint("TOPLEFT", self.ConduitName, "BOTTOMLEFT", 0, 0);
		self.ItemLevel:SetText(conduitData.conduitItemLevel);



]]


--  ///////////////////////////////////////////////////////////////////////////////////////////
--
--   
--  Author: SLOKnightfall

--  

--

--  ///////////////////////////////////////////////////////////////////////////////////////////


local function SortNodes(data)
	local sortedNodes = {}
	for _, nodes in pairs(data) do table.insert(sortedNodes, nodes) end
	table.sort(sortedNodes, function(a,b) return a.row < b.row end)
	return sortedNodes
end


local function GetPathData()
	local pathData = {}
	local icon, _
	for i, nodeFrame in pairs(SoulbindViewer.Tree:GetNodes()) do
		local node = nodeFrame.node
		if node.state == 3 then 
			pathData[node.ID] = {
				state = node.state,
				icon = node.icon,
				row = node.row,
				conduitID = node.conduitID,
				spellID = node.spellID,
			}

			if node.row == 1 then 
				icon = node.icon
				local spellID = C_Soulbinds.GetConduitSpellID(node.conduitID, node.conduitRank)
				_,_, icon = GetSpellInfo(spellID)
				--else
				--_, _, icon = GetSpellInfo(node.spellID)
				--end
			end
		end
	end
	return pathData, icon
end


function CovenantForge:PathTooltip(parent, index)
	if not CovenantForge.savedPathdb.char.paths[index] then return end

	local data = CovenantForge.savedPathdb.char.paths[index]
	local covenantData = C_Covenants.GetCovenantData(data.covenantID)
	local soulbindData = C_Soulbinds.GetSoulbindData(data.soulbindID)
	local r,g,b = COVENANT_COLORS[data.covenantID]:GetRGB()

	GameTooltip:SetOwner(parent.frame, "ANCHOR_RIGHT")

	GameTooltip:AddLine(("%s - %s"):format(covenantData.name, soulbindData.name),r,g,b)
	GameTooltip:AddLine(" ")

	 local pathList = SortNodes(data.data)

		for i, pathEntry in ipairs(pathList) do
			if pathEntry.conduitID > 0 then
				local collectionData = C_Soulbinds.GetConduitCollectionData(pathEntry.conduitID)
				local quality = C_Soulbinds.GetConduitQuality(collectionData.conduitID, collectionData.conduitRank)
				local spellID = C_Soulbinds.GetConduitSpellID(collectionData.conduitID, collectionData.conduitRank)
				local name = GetSpellInfo(spellID)
				--local desc = GetSpellDescription(spellID)
				local colormarkup = DARKYELLOW_FONT_COLOR:GenerateHexColorMarkup()
				GameTooltip:AddLine(string.format(colormarkup.."Row %d: |r%s - Rank:%s |cffffffff(%s)|r",i, name, collectionData.conduitRank,Soulbinds.GetConduitName(collectionData.conduitType)), unpack({ITEM_QUALITY_COLORS[quality].color:GetRGB()}))
				--GameTooltip:AddLine(string.format("Rank:%s", collectionData.conduitRank, unpack({ITEM_QUALITY_COLORS[quality].color:GetRGB()})))
				--GameTooltip:AddLine(desc, nil, nil, nil, true)
				--GameTooltip:AddLine(" ")
			else
				local spellID = pathEntry.spellID
				local name = GetSpellInfo(spellID)
				local desc = GetSpellDescription(spellID)

				GameTooltip:AddLine(string.format("Row %d: |cffffffff%s|r", i, name))
			  --  GameTooltip:AddLine(string.format("Rank:%s", name, unpack({ITEM_QUALITY_COLORS[quality].color:GetRGB()})))
				--GameTooltip:AddLine(desc, nil, nil, nil, true)
				--GameTooltip:AddLine(" ")
			end
		end
	GameTooltip:Show()
end


function CovenantForge:ShowNodeTooltip(parent, data)
	if not data then return end

	GameTooltip:SetOwner(parent.frame, "ANCHOR_RIGHT")

	if data.conduitID > 0 then
		local collectionData = C_Soulbinds.GetConduitCollectionData(data.conduitID)
		local quality = C_Soulbinds.GetConduitQuality(collectionData.conduitID, collectionData.conduitRank)
		local spellID = C_Soulbinds.GetConduitSpellID(collectionData.conduitID, collectionData.conduitRank)
		local name = GetSpellInfo(spellID)
		--local desc = GetSpellDescription(spellID)
		local colormarkup = DARKYELLOW_FONT_COLOR:GenerateHexColorMarkup()
		GameTooltip:SetConduit(data.conduitID, collectionData.conduitRank)
		CovenantForge:ConduitTooltip_Rank(GameTooltip, collectionData.conduitRank, data.row + 1)
	else
		local spellID = data.spellID
		local name = GetSpellInfo(spellID)
		local desc = GetSpellDescription(spellID)
		GameTooltip:AddLine(string.format("Row %d: |cffffffff%s|r", data.row + 1 , name))
		GameTooltip:AddLine(desc, nil, nil, nil, true)
	end
		
	GameTooltip:Show()
end


function CovenantForge:SavePath()
	local covenantID = C_Covenants.GetActiveCovenantID()
	local soulbindID = SoulbindViewer:GetOpenSoulbindID()
	local pathData, icon  = GetPathData()

	local Path = {
		icon = icon,
		covenantID = covenantID,
		soulbindID =  soulbindID,
		data = pathData,    
	}

	return Path
end


function CovenantForge:DeletePath(index)
	table.remove(CovenantForge.savedPathdb.char.paths, index)
	CovenantForge:UpdateSavedPathsList()
end


function CovenantForge:LoadPath(index, macro)
	local pathData = CovenantForge.savedPathdb.char.paths[index]

	if not pathData then return end
	if not C_Soulbinds.CanSwitchActiveSoulbindTreeBranch() then
		print(SOULBIND_NODE_UNSELECTED)
		return
	end

	local covenantData = C_Covenants.GetCovenantData(pathData.covenantID)
	local soulbindIDs = covenantData.soulbindIDs
	local soulbindID = pathData.soulbindID

	local currentSoulbindId = SoulbindViewer:GetOpenSoulbindID()
	local currentSoulbindData = C_Soulbinds.GetSoulbindData(currentSoulbindId)

	if not C_Soulbinds.CanModifySoulbind() then
		for nodeID, pathData in pairs(pathData.data) do
			local currentNode = C_Soulbinds.GetNode(nodeID)
			if currentNode.conduitID ~= pathData.conduitID then
				print("Requires the Forge of Bonds to modify.")
				return
			end
		end
	end

	if currentSoulbindId ~= soulbindID then
		SoulbindViewer.SelectGroup.buttonGroup:SelectAtIndex(tIndexOf(soulbindIDs, soulbindID))
	end
	
	if C_Soulbinds.GetActiveSoulbindID() ~= soulbindID and macro then
		C_Soulbinds.ActivateSoulbind(soulbindID)
	elseif C_Soulbinds.GetActiveSoulbindID() ~= soulbindID then
		SoulbindViewer:OnActivateSoulbindClicked()
	end

	for i, node in pairs(currentSoulbindData.tree.nodes) do
		if C_Soulbinds.IsNodePendingModify(node.ID) then
			C_Soulbinds.UnmodifyNode(node.ID)
			C_Soulbinds.UnmodifyNode(node.ID)
		end
	end

	for nodeID, pathData in pairs(pathData.data) do
		local currentNode = C_Soulbinds.GetNode(nodeID)

		if C_Soulbinds.IsNodePendingModify(nodeID) then
			C_Soulbinds.UnmodifyNode(nodeID)
			C_Soulbinds.UnmodifyNode(nodeID)
		end

		if currentNode.conduitID ~= pathData.conduitID then
			C_Soulbinds.ModifyNode(nodeID, pathData.conduitID, 0)
		end

		if pathData.state == 3 then
			C_Soulbinds.SelectNode(nodeID)
		end
	end

	if C_Soulbinds.HasAnyPendingConduits() then
		SoulbindViewer:OnCommitConduitsClicked()
	end

	print(("Saved Path %s has been loaded."):format(pathData.name))
end


function CovenantForge:MacroLoad(pathName)
	local isfound = false
	for i, data in ipairs(CovenantForge.savedPathdb.char.paths) do
		if data.name == pathName then
			isfound = i
			break
		end
	end

	if not isfound then return false end
	CovenantForge:LoadPath(isfound, true)
end


--Saved Path Popup Menu
function CovenantForge:ShowPopup(popup, index)
	if popup == "COVENANTFORGE_UPDATEPATHPOPUP" then 
		StaticPopupSpecial_Show(CovenantForge_SavedPathEditFrame)
		local data = CovenantForge.savedPathdb.char.paths[index]
		CovenantForge_SavedPathEditFrame.EditBox:SetText(data.name)
		CovenantForge_SavedPathEditFrame.pathIndex = index
	elseif popup == "COVENANTFORGE_UPDATEWEIGHTPOPUP" then 
		StaticPopupSpecial_Show(CovenantForge_WeightsEditFrame)
	end
end


function CovenantForge:ClosePopups()
	StaticPopupSpecial_Hide(CovenantForge_SavedPathEditFrame)
	StaticPopupSpecial_Hide(CovenantForge_WeightsEditFrame)
end


CovenantForge_SavedPathEditFrameMixin = {}
function CovenantForge_SavedPathEditFrameMixin:OnDelete()
	CovenantForge:DeletePath(self.pathIndex)
	CovenantForge:ClosePopups()
end


local function CheckNames(name)
	if string.len(name) <= 0 then return false end

	for i, data in ipairs(CovenantForge.savedPathdb.char.paths) do
		if name == data.name then 
			return false
		end
	end
	return true
end


function CovenantForge_SavedPathEditFrameMixin:OnAccept()
	local data = CovenantForge.savedPathdb.char.paths[self.pathIndex]
	local name = CovenantForge_SavedPathEditFrame.EditBox:GetText()
	if CheckNames(name) then 
		data.name = CovenantForge_SavedPathEditFrame.EditBox:GetText()
		CovenantForge:UpdateSavedPathsList()
		CovenantForge:ClosePopups()
	else
		print("Name Already Exists")
	end
end


function CovenantForge_SavedPathEditFrameMixin:OnUpdate()
	local name = CovenantForge.savedPathdb.char.paths[self.pathIndex].name
	CovenantForge.savedPathdb.char.paths[self.pathIndex] = CovenantForge:SavePath()
	CovenantForge.savedPathdb.char.paths[self.pathIndex].name = name
	CovenantForge:UpdateSavedPathsList()
	CovenantForge:ClosePopups()
end


CovenantForge_SavedPathMixin = {}
function CovenantForge_SavedPathMixin:OnClick()
   if not CheckNames(self:GetParent().EditBox:GetText()) then return end

	local Path = CovenantForge:SavePath()
	Path.name = self:GetParent().EditBox:GetText(),
	table.insert(CovenantForge.savedPathdb.char.paths, Path)
	CovenantForge:UpdateSavedPathsList()
end


function CovenantForge:UpdateSavedPathsList()
	if not SoulbindViewer or (SoulbindViewer and not SoulbindViewer:IsShown()) or
 		not CovenantForge.savedPathdb.char.paths or not CovenantForge.scrollcontainer then return end

	local scrollcontainer = CovenantForge.scrollcontainer
	scrollcontainer:ReleaseChildren()
	scrollcontainer:SetPoint("TOPLEFT", CovenantForge.PathStorageFrame,"TOPLEFT", 0, -55)
	scroll = AceGUI:Create("ScrollFrame")
	scroll:SetLayout("Flow") -- probably?
	scrollcontainer:AddChild(scroll)

	for i, data in ipairs(CovenantForge.savedPathdb.char.paths) do
		local soulbindData = C_Soulbinds.GetSoulbindData(data.soulbindID)
		local container = AceGUI:Create("SimpleGroup") 
		container:SetLayout("Fill")

		local topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)
		scroll:AddChild(topHeading)
		--container:AddChild(topHeading)
		local InteractiveLabel = AceGUI:Create("InteractiveLabel")
		InteractiveLabel:SetText(soulbindData.name..": "..data.name.."\n \n  \n  \n  \n ")
		InteractiveLabel:SetJustifyH("TOP")
		InteractiveLabel.label:SetPoint("TOP", container.frame, "TOP", 0 ,10)
		InteractiveLabel.label:SetHeight(InteractiveLabel.label:GetStringHeight())
		--InteractiveLabel:SetImage(data.icon)
		InteractiveLabel:SetImage(data.icon)
		InteractiveLabel:SetImageSize(1,35)
		InteractiveLabel:SetHeight(35)
		InteractiveLabel.image:ClearAllPoints()
		--InteractiveLabel.image:SetPoint("LEFT",-999)
		InteractiveLabel.image:SetAlpha(0)
		InteractiveLabel:SetRelativeWidth(1)
		--InteractiveLabel:SetPoint("CENTER")
		InteractiveLabel:SetCallback("OnClick", function() CovenantForge:LoadPath(i) end)
		InteractiveLabel:SetCallback("OnEnter", function() CovenantForge:PathTooltip(InteractiveLabel, i) end)
		InteractiveLabel:SetCallback("OnLeave", function() GameTooltip:Hide() end)

		local UpdateButton =  AceGUI:Create("Icon") 
		UpdateButton:SetImage("Interface/Buttons/UI-OptionsButton")
		UpdateButton:SetImageSize(15,15)
		UpdateButton:SetHeight(18)
		UpdateButton:SetWidth(18)

		UpdateButton:SetCallback("OnClick", function()
				if (not StaticPopup_Visible("COVENANTFORGE_UPDATEPATHPOPUP")) then
				CovenantForge:ShowPopup("COVENANTFORGE_UPDATEPATHPOPUP", i)
				end  end)
		UpdateButton:SetCallback("OnEnter", function() GameTooltip:SetOwner(UpdateButton.frame, "ANCHOR_RIGHT"); GameTooltip:AddLine("Options"); GameTooltip:Show() end)
		UpdateButton:SetCallback("OnLeave", function() GameTooltip:Hide() end)
		UpdateButton:SetRelativeWidth(.1)
		UpdateButton.index = i


		container:AddChild(InteractiveLabel)
		container:AddChild(UpdateButton)

		UpdateButton:ClearAllPoints()
		UpdateButton.frame:SetPoint("TOPRIGHT",container.frame,"TOPRIGHT", 0, 5)
		UpdateButton.frame:SetFrameLevel(200)

		container:SetHeight(35)
		container:SetFullWidth(true)
		--scroll:AddChild(container)
		container:SetAutoAdjustHeight(false)

		--container = AceGUI:Create("SimpleGroup") 
		--container:SetLayout("Flow")
		--container:SetFullWidth(true)
		--container:SetHeight(30)
		--container:SetAutoAdjustHeight(false)
		local sortedNodes = SortNodes(data.data)
		local index = 0
		for id, data in pairs(sortedNodes) do
			local nodeIcon = AceGUI:Create("Icon")
			if data.conduitID > 0 then 
				local spellID = C_Soulbinds.GetConduitSpellID(data.conduitID, 1)
				local _,_, icon = GetSpellInfo(spellID)
				nodeIcon:SetImage(icon)
			else
				local _,_, icon = GetSpellInfo(data.spellID)
				nodeIcon:SetImage(icon)
			end
			nodeIcon:SetImageSize(25,25)
			nodeIcon:SetWidth(26)
			nodeIcon:SetCallback("OnClick", function() CovenantForge:LoadPath(i) end)
			nodeIcon:SetCallback("OnEnter", function() CovenantForge:ShowNodeTooltip(nodeIcon, data) end)
			nodeIcon:SetCallback("OnLeave", function() GameTooltip:Hide() end)
			container:AddChild(nodeIcon)
			nodeIcon.frame:SetPoint("BOTTOMLEFT", container.frame, "BOTTOMLEFT", 26 * index, -7)
			nodeIcon.frame:SetFrameLevel(200)
			index = index + 1
		end
		scroll:AddChild(container)
	end
end




--  ///////////////////////////////////////////////////////////////////////////////////////////
--
--   
--  Author: SLOKnightfall

--  

--

--  ///////////////////////////////////////////////////////////////////////////////////////////

local playerInv_DB
local Profile
local playerNme
local realmName
local playerClass, classID,_
local conduitList = {}

local CONDUIT_RANKS = {
	[1] = C_Soulbinds.GetConduitItemLevel(0, 1),
	[2] = C_Soulbinds.GetConduitItemLevel(0, 2),
	[3] = C_Soulbinds.GetConduitItemLevel(0, 3),
	[4] = C_Soulbinds.GetConduitItemLevel(0, 4),
	[5] = C_Soulbinds.GetConduitItemLevel(0, 5),
	[6] = C_Soulbinds.GetConduitItemLevel(0, 6),
	[7] = C_Soulbinds.GetConduitItemLevel(0, 7),
	[8] = C_Soulbinds.GetConduitItemLevel(0, 8),
}


local WEIGHT_BASE = 37.75
local CLASS_SPECS ={{71,72,73},{65,66,70},{253,254,255},{259,260,261},{256,257,258},{250,251,252},{262,263,264},{62,63,64},{265,266,267},{268,270,269},{102,103,104,105},{577,578}}

local WeightProfiles = {}
local ProfileTable = {}
local Weights = {}
local BaseValue = {}
local ilevels = {}
local ilevelData = {}
local powers = {}


local function GetSoulbindPowers()
	local covenantData = C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID())
	local soulbinds = covenantData.soulbindIDs
	for _, soulbindID in pairs(soulbinds) do
		local soulbindData = C_Soulbinds.GetSoulbindData(soulbindID)
		local tree = soulbindData.tree.nodes
		local soulbindPowers = {}
		for index, data in ipairs(tree) do
			if data.conduitID == 0 and data.spellID ~= 0 then 
				--if data.spellID == 0 then print(index) end
				table.insert(soulbindPowers, data.spellID)
			end
		end
		powers[soulbindID] = soulbindPowers
	end

	CovenantForge.powers = powers
end


local function SelectProfile(index)
	if not WeightProfiles[index] then  SelectProfile(1) end
	Weights = WeightProfiles[index].weights
	BaseValue = WeightProfiles[index].base
	CovenantForge.savedPathdb.char.selectedProfile = index
	CovenantForge:UpdateWeightList()
end


local defaultindex = 0
function CovenantForge:BuildWeightData()
	wipe(WeightProfiles)
	wipe(ProfileTable)
	defaultindex = 0
	GetSoulbindPowers()
	local spec = GetSpecialization()
	local specID, specName = GetSpecializationInfo(spec)
	local _, _, classID = UnitClass("player")
	local covenantID = C_Covenants.GetActiveCovenantID();
	local classSpecs = CLASS_SPECS[classID]
	for profile, weightData in pairs(CovenantForge.Weights) do
		local Weights = {}
		local baseValue = {} 
		for i,spec in ipairs(classSpecs) do
			if CovenantForge.Weights[profile][spec] then 
				local data = CovenantForge.Weights[profile][spec][covenantID]
				Weights[spec] =  {}
				for i=2, #data do
					local conduitData = data[i]
					local name = string.gsub(conduitData[1],' %(.+%)',"")
					local ilevel ={}
					for index = 2, #conduitData do
						local ilevelData = data[1][index]
						ilevels[index - 1 ] = ilevelData
						ilevel[ilevelData] = conduitData[index]
					end
					Weights[spec][name] = ilevel
					baseValue[spec] = CovenantForge.BaseValues[profile][spec][covenantID]
				end
			end
		end
		table.insert(WeightProfiles, {["name"] = profile, ["weights"]= Weights, ["base"] = baseValue })
		table.insert(ProfileTable, profile)
		defaultindex = defaultindex + 1
	end

	local profileList = self.weightdb.class.weights or {}
	for profile, weightData in pairs(profileList) do
		local baseValue = self.weightdb.class.base[profile]
		table.insert(WeightProfiles, {["name"] = profile, ["weights"]= weightData, ["base"] = baseValue})
		table.insert(ProfileTable, profile)
	end

	local selectedProfile = CovenantForge.savedPathdb.char.selectedProfile
	SelectProfile(selectedProfile)
end


function CovenantForge:GetConduitWeight(specID, conduitID)
	local profile = CovenantForge.savedPathdb.char.selectedProfile
	if not CovenantForge.Conduits[conduitID] or not Weights[specID] then return 0 end
	local soulbindName = CovenantForge.Conduits[conduitID][1]
	--if soulbindName == "Rejuvenating Wind" then return 31 end
	local collectionData  = C_Soulbinds.GetConduitCollectionData(conduitID)
	local conduitItemLevel = collectionData and collectionData.conduitItemLevel or 145

	if Weights[specID][soulbindName] then 
		local weight = Weights[specID][soulbindName][conduitItemLevel]
		return weight or 0
	end

	return 0
end


function CovenantForge:GetTalentWeight(specID, spellID)
	--if spellID == 320658 then return 51 end
	if not CovenantForge.Soulbinds[spellID] or not Weights[specID] then return 0 end

	local name = CovenantForge.Soulbinds[spellID]
	if Weights[specID][name] then 
		local weight = Weights[specID][name][1]
		return weight or 0
	end

	return 0
end


local function BuildTreeData(tree)
	local parentNodeTable = {}
	local parentNodeData = {}
	for i, data in ipairs(tree) do
		parentNodeData[data.ID] = data
		local parentNodeIDs = data.parentNodeIDs
		if #parentNodeIDs == 1  and data.row ~= 0 then 
			parentNodeTable[data.ID] = data.parentNodeIDs[1]
		end
	end
	return parentNodeTable, parentNodeData
end


function CovenantForge:GetSoulbindWeight(soulbindID)
	local data = C_Soulbinds.GetSoulbindData(soulbindID)
	local tree = data.tree.nodes
	local parentNodeTable, parentNodeData = BuildTreeData(tree) 

	local selectedWeight = {}
	local unlockedWeights = {}
	local maxNodeWeights = {}
	local maxConduitWeights = {}
	local parentRow = {}

	for i, data in ipairs(tree) do
		local row = data.row  --RowID starts at 0
		local conduitID = data.conduitID
		local spellID = data.spellID
		local state = data.state
		local weight
		local maxTable

		local parentNode = parentNodeTable[data.ID]
		local parentData = parentNodeData[parentNode]
		local parentWeight = 0
		
		if conduitID == 0 then
			weight = CovenantForge:GetTalentWeight(CovenantForge.viewed_spec, spellID)

			maxTable = maxNodeWeights
		else
			weight = CovenantForge:GetConduitWeight(CovenantForge.viewed_spec, conduitID)

			maxTable = maxConduitWeights
		end

		if parentData and parentData.conduitID == 0 then
				parentWeight = CovenantForge:GetTalentWeight(CovenantForge.viewed_spec, parentData.spellID) or 0
				parentRow[parentData.row] = true
		elseif parentData then 
			parentWeight = CovenantForge:GetConduitWeight(CovenantForge.viewed_spec, parentData.conduitID) or 0
			parentRow[parentData.row] = true
		end

		if weight and state == 3 then
			selectedWeight[row] = weight
		end

		unlockedWeights[row] = unlockedWeights[row] or 0
		if weight and state ~= 0 and  weight + parentWeight >= unlockedWeights[row] then
			unlockedWeights[row] = weight + parentWeight 
		end

		maxTable[row] = maxTable[row] or 0
		if weight and weight + parentWeight  >= maxTable[row] then
			maxTable[row] = weight + parentWeight 
		end
	end

	for i, data in pairs(parentRow)do
		if i ~=0 then 
			maxNodeWeights[i] = 0
			unlockedWeights[i] = 0
			maxConduitWeights[i] = 0
		end
	end

	local selectedTotal = 0
	for i, value in pairs(selectedWeight) do
		selectedTotal = selectedTotal + value
	end

	local unlockedTotal = 0
	for i, value in pairs(unlockedWeights) do
		unlockedTotal = unlockedTotal + value
	end

	local nodeMax = 0
	for i, value in pairs(maxNodeWeights) do
		nodeMax = nodeMax + value
	end

	local conduitMax = 0
	for i, value in pairs(maxConduitWeights) do
		conduitMax = conduitMax + value
	end

	return selectedTotal, unlockedTotal, nodeMax, conduitMax
end


function CovenantForge:GetWeightPercent(weight)
	if not weight then return 0 end
	--local percent = weight/WEIGHT_BASE
	BaseValue[CovenantForge.viewed_spec] = BaseValue[CovenantForge.viewed_spec] or 100
	local templateDPS = BaseValue[CovenantForge.viewed_spec]
	local formula = 100 * ((templateDPS + weight) / templateDPS - 1)
	return  tonumber(string.format("%.2f", formula))
end


local function CreateNewWeightProfile(name)
	local profileList = CovenantForge.weightdb.class.weights
	local baseValue = CovenantForge.weightdb.class.base
	local _, _, classID = UnitClass("player")
	local covenantID = C_Covenants.GetActiveCovenantID();
	local classSpecs = CLASS_SPECS[classID]
	if not profileList[name] then 
		profileList[name] = {}
		baseValue[name] = {}
		for _, specID in ipairs(classSpecs) do
			profileList[name][specID] = {{},{},{}}
			baseValue[name][specID] = 100
		end
	end
	CovenantForge:BuildWeightData()
	CovenantForge:UpdateWeightList()
end


local function CopyWeightProfile(name)
	local profileList = CovenantForge.weightdb.class.weights
	local baseValue = CovenantForge.weightdb.class.base
	local selectedProfile = CovenantForge.savedPathdb.char.selectedProfile
	local selectedName = WeightProfiles[selectedProfile].name
	local weights = CopyTable(Weights)
	local base = CopyTable(BaseValue)
	profileList[name] = weights

	table.insert(WeightProfiles, {["name"] = name, ["weights"]= weights, ["base"] = base })
	table.insert(ProfileTable, name)
	CovenantForge:UpdateWeightList()
end


local function DeleteWeightProfile(name)
	local profileList = CovenantForge.weightdb.class.weights
	local baseValue = CovenantForge.weightdb.class.base
	profileList[name] = nil
	baseValue[name] = nil
	SelectProfile(1)
	CovenantForge:BuildWeightData()
	CovenantForge:UpdateWeightList()
	CovenantForge.Update()
end

local function UpdateWeightData(name, ilevel, value)
--Weights[specID][name]
	Weights[tonumber(CovenantForge.viewed_spec)] = Weights[tonumber(CovenantForge.viewed_spec)] or {}
	Weights[tonumber(CovenantForge.viewed_spec)][name] = Weights[tonumber(CovenantForge.viewed_spec)][name] or {}
	Weights[tonumber(CovenantForge.viewed_spec)][name][tonumber(ilevel)] = tonumber(value)
	CovenantForge:UpdateWeightList()
	CovenantForge.Update()
end

local function UpdatePercentData(value)
	BaseValue[tonumber(CovenantForge.viewed_spec)] = tonumber(value)
	CovenantForge:UpdateWeightList()
	CovenantForge.Update()
end


local filterValue = 1
local filteredList = CovenantForge.conduitList
function CovenantForge:UpdateWeightList()
	if not SoulbindViewer or (SoulbindViewer and not SoulbindViewer:IsShown()) or
 		not CovenantForge.scrollcontainer then return end	

 	local filter = {"All", 	Soulbinds.GetConduitName(0),Soulbinds.GetConduitName(1),Soulbinds.GetConduitName(2), "Soulbinds"}
	local scrollcontainer = CovenantForge.scrollcontainer
	scrollcontainer:ReleaseChildren()
	scrollcontainer:SetPoint("TOPLEFT", CovenantForge.PathStorageFrame,"TOPLEFT", 0, -25)

	local selectedProfile = CovenantForge.savedPathdb.char.selectedProfile
	local weights = WeightProfiles[selectedProfile].weights
	local baseValue = WeightProfiles[selectedProfile].base

	scroll = AceGUI:Create("ScrollFrame")
	scroll:SetLayout("Flow") -- probably?
	scrollcontainer:AddChild(scroll)

	local dropdown = AceGUI:Create("Dropdown")
	dropdown:SetFullWidth(false)
	dropdown:SetWidth(200)
	scroll:AddChild(dropdown)
	dropdown:SetList(ProfileTable)
	dropdown:SetValue(selectedProfile)
	dropdown:SetCallback("OnValueChanged", 
		function(self,event, key) 
			SelectProfile(key)
			CovenantForge:Update()
		end)


	local icon = AceGUI:Create("Icon") 
	icon:SetImage("Interface/Buttons/UI-OptionsButton")
	icon:SetHeight(20)
	icon:SetWidth(25)
	icon:SetImageSize(20,20)
	icon:SetCallback("OnClick", function() CovenantForge:OpenBarDropDown(icon.frame) end)

	scroll:AddChild(icon)

	dropdown = AceGUI:Create("Dropdown")
	dropdown:SetFullWidth(false)
	dropdown:SetWidth(125)
	dropdown:SetList(filter)
	dropdown:SetValue(filterValue)
	dropdown:SetCallback("OnValueChanged", 
		function(self,event, key) 
			filterValue = key; 
			if key == 1 then 
				filteredList = CovenantForge.conduitList
			else 
				filteredList = {CovenantForge.conduitList[key-2]}
			end
			CovenantForge:UpdateWeightList()
		end)
	scroll:AddChild(dropdown)

	local editbox = AceGUI:Create("EditBox")
	editbox:SetLabel("Percent Value")
	editbox:SetWidth(80)
	editbox:SetHeight(40)
	editbox.editbox:SetTextInsets(0,-5, 0, 0)
	editbox.button:ClearAllPoints()
	editbox.button:SetPoint("LEFT", editbox.frame, "RIGHT", 0 , -8)
	editbox:SetDisabled(CovenantForge.savedPathdb.char.selectedProfile <= defaultindex)
	editbox:SetCallback("OnEnterPressed", function(self,event, key) 
		UpdatePercentData(key)
	end)

	local basedata = (baseValue[CovenantForge.viewed_spec])
	if basedata then 
		editbox:SetText(basedata)
	end
	scroll:AddChild(editbox)

	for i, typedata in pairs(filteredList) do
		local index = i
		if #filteredList == 1 then 
			index = filterValue - 2
		end
		local collectionData = C_Soulbinds.GetConduitCollection(index)

		local topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)
		local bottomHeading = AceGUI:Create("Heading") 
		bottomHeading:SetRelativeWidth(1)
		bottomHeading:SetHeight(5)

		local label = AceGUI:Create("Label") 
			label:SetText(Soulbinds.GetConduitName(index))
			--Bit of a hack as Ace doesn't have a set atlas function. 
			local atlas = Soulbinds.GetConduitEmblemAtlas(index);
			--Sets a base image to trigger ACE stuff
			label:SetImage("Interface/Buttons/UI-OptionsButton")
			--Manually sets the image frame to atlas value
			label.image:SetAtlas(atlas)
			label:SetFontObject(GameFontHighlightLarge)
			label:SetImageSize(30,30)
			label:SetRelativeWidth(1)
			scroll:AddChild(topHeading)
			scroll:AddChild(label)

		for i, data in pairs(typedata) do
			local spellID = data[2]
			local name = GetSpellInfo(spellID) or data[1]
			local type = Soulbinds.GetConduitName(data[3])
			local desc = GetSpellDescription(spellID)
			local _,_, icon = GetSpellInfo(spellID)
			local titleColor = ORANGE_FONT_COLOR_CODE
			for i, data in ipairs(collectionData) do
				local c_spellID = C_Soulbinds.GetConduitSpellID(data.conduitID, data.conduitRank)
				if c_spellID == spellID then 
					titleColor = GREEN_FONT_COLOR_CODE
					break
				end
			end
			
			local container = AceGUI:Create("SimpleGroup") 
			container:SetLayout("Flow")
			container:SetFullWidth(true)
			container:SetHeight(20)

			local text = ("%s-%s (%s)-"):format(titleColor, name, type, GRAY_FONT_COLOR_CODE,desc,weight)
			local Icon = AceGUI:Create("Label") 
			Icon:SetText(text)
			Icon:SetImage(icon)
			--icon:SetFont("Fonts\\FRIZQT__.TTF", 12)
			Icon:SetImageSize(20,20)
			Icon:SetFullWidth(true)
			Icon:SetHeight(20)
			--icon:SetRelativeWidth(1)
			container:AddChild(Icon)


			local ileveldata = (weights[CovenantForge.viewed_spec] and weights[CovenantForge.viewed_spec][name])
			for i, data in pairs(ilevels) do
				if i ~= 1 then 
					local editbox = AceGUI:Create("EditBox")
					editbox:SetLabel(data)
					editbox:SetWidth(50)
					editbox:SetHeight(40)
					editbox.editbox:SetTextInsets(0,-5, 0, 0)
					editbox.button:ClearAllPoints()
					editbox.button:SetPoint("LEFT", editbox.frame, "RIGHT", 0 , -8)
					editbox:SetDisabled(CovenantForge.savedPathdb.char.selectedProfile <= defaultindex)
					editbox:SetCallback("OnEnterPressed", function(self,event, key) 
						UpdateWeightData(name, data, key)
					end)

					if ileveldata then 
						editbox:SetText(ileveldata[data] or 0)
					end
					container:AddChild(editbox)
				end
			end
			local topHeading = AceGUI:Create("Heading") 
			topHeading:SetRelativeWidth(1)
			topHeading:SetHeight(5)
			scroll:AddChild(topHeading)
			scroll:AddChild(container)
		end
	end
	if filterValue == 1 or filterValue == 5 then 
		local topHeading = AceGUI:Create("Heading") 
		topHeading:SetRelativeWidth(1)
		topHeading:SetHeight(5)

		local label = AceGUI:Create("Label") 
		label:SetText("Soulbinds")

		local covenantData = C_Covenants.GetCovenantData(C_Covenants.GetActiveCovenantID())
		label:SetImage("Interface/Buttons/UI-OptionsButton")
		label.image:SetAtlas(("CovenantChoice-Celebration-%sSigil"):format(covenantData.textureKit))

		label:SetFontObject(GameFontHighlightLarge)

		--label.image.imageshown = true
		label:SetImageSize(30,30)
		label:SetRelativeWidth(1)
		label:SetHeight(5)
		scroll:AddChild(topHeading)
		scroll:AddChild(label)
		for soulbindID, sb_powers in pairs(powers) do
			local soulbind_data = C_Soulbinds.GetSoulbindData(soulbindID)
			for i, spellID in pairs(sb_powers) do
				local spellname = GetSpellInfo(spellID)
				local name = soulbind_data.name..": "..spellname or ""
				local desc = GetSpellDescription(spellID)
				local _,_, icon = GetSpellInfo(spellID)
				local titleColor = ORANGE_FONT_COLOR_CODE
				local container = AceGUI:Create("SimpleGroup") 
				container:SetLayout("Flow")
				container:SetFullWidth(true)
				container:SetHeight(20)

				local text = ("%s-%s-"):format(titleColor, name)
				local Icon = AceGUI:Create("Label") 
				Icon:SetText(text)
				Icon:SetImage(icon)
				--icon:SetFont("Fonts\\FRIZQT__.TTF", 12)
				Icon:SetImageSize(20,20)
				Icon:SetFullWidth(true)
				Icon:SetHeight(20)
				--icon:SetRelativeWidth(1)
				container:AddChild(Icon)
					--scroll:AddChild(container)

				local ileveldata = (weights[CovenantForge.viewed_spec] and  weights[CovenantForge.viewed_spec][spellname])

				local editbox = AceGUI:Create("EditBox")
				--editbox:SetLabel(data)
				editbox:SetWidth(50)
				editbox:SetHeight(40)
				editbox.button:ClearAllPoints()
				editbox.button:SetPoint("LEFT", editbox.frame, "RIGHT", 0 , -8)
				editbox:SetDisabled(CovenantForge.savedPathdb.char.selectedProfile <= defaultindex)
					editbox:SetCallback("OnEnterPressed", function(self,event, key) 
						UpdateWeightData(spellname, 1, key)
					end)

				if ileveldata then 
					editbox:SetText(ileveldata[1] or 0)
				end
				container:AddChild(editbox)
		
				local topHeading = AceGUI:Create("Heading") 
				topHeading:SetRelativeWidth(1)
				topHeading:SetHeight(5)
				scroll:AddChild(topHeading)
				scroll:AddChild(container)
			end
		end
	end
end


local function Faded(self)
	self:Release()
end

local function FadeMenu(self)
	local fadeInfo = {}
	fadeInfo.mode = "OUT"
	fadeInfo.timeToFade = 0.1
	fadeInfo.finishedFunc = Faded
	fadeInfo.finishedArg1 = self
	UIFrameFade(self, fadeInfo)
end

--local LD = LibStub("LibDropdown-1.0")
local action
function CovenantForge:OpenBarDropDown(myframe, index)
	-- adopted from BulkMail
	-- release if if already shown
	local barmenuframe
	barmenuframe = barmenuframe and barmenuframe:Release()
	local baropts = {
		type = 'group',
		args = {
			details = {
				order = 10,
				name = "Create New Blank Profile",
				type = "execute",
				func = function(name)
						action = CreateNewWeightProfile
						if (not StaticPopup_Visible("COVENANTFORGE_UPDATEWEIGHTPOPUP")) then
							CovenantForge:ShowPopup("COVENANTFORGE_UPDATEWEIGHTPOPUP", i)
						end
						FadeMenu(barmenuframe)

				end,
			},
			graph = {
				order = 20,
				name = "Copy Current Profile",
				type = "execute",
				func = function(name)
					action = CopyWeightProfile
					if (not StaticPopup_Visible("COVENANTFORGE_UPDATEWEIGHTPOPUP")) then
						CovenantForge:ShowPopup("COVENANTFORGE_UPDATEWEIGHTPOPUP", i)
					end
						FadeMenu(barmenuframe)
				end,
			},
			addgraph = {
				order = 30,
				name = "Delete Current Profile",
				type = "execute",
				func = function(name)
					DeleteWeightProfile(ProfileTable[CovenantForge.savedPathdb.char.selectedProfile])
					FadeMenu(barmenuframe)

				end,
				disabled = function() return CovenantForge.savedPathdb.char.selectedProfile <= defaultindex end
				--me.AddCombatantToGraphWrapper,
			},
		}
	}

	barmenuframe = barmenuframe --or LD:OpenAce3Menu(baropts)
	barmenuframe:SetClampedToScreen(true)
	barmenuframe:SetAlpha(1.0)
	barmenuframe:Show()

	local leftPos = myframe:GetLeft() -- Elsia: Side code adapted from Mirror
	local rightPos = myframe:GetRight()
	local side
	local oside
	if not rightPos then
		rightPos = 0
	end
	if not leftPos then
		leftPos = 0
	end

	local rightDist = GetScreenWidth() - rightPos

	if leftPos and rightDist < leftPos then
		side = "TOPLEFT"
		oside = "TOPRIGHT"
	else
		side = "TOPRIGHT"
		oside = "TOPLEFT"
	end

	barmenuframe:ClearAllPoints()
	barmenuframe:SetPoint(oside, myframe, side, 0, 0)
	--barmenuframe:SetFrameLevel(myframe:GetFrameLevel() + 9)
end


CovenantForge_WeightsEditFrameMixin = {}

function CovenantForge_WeightsEditFrameMixin:OnAccept()
local text = self.EditBox:GetText()
--print(text)
action(text)
action = nil
CovenantForge:ClosePopups()
end