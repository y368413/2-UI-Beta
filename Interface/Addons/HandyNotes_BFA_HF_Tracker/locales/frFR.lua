local myname, ns = ...
local L = LibStub("AceLocale-3.0"):NewLocale(myname, "frFR")
if not L then return end

-- Settings
L["Create waypoint"] = "Créer un waypoint"
L["ADD to NPCScan"] = "Ajouter à NPCScan (si dispo)"
L["Information for NPCScan and not available."] = "L'information pour NPCScan n'est pas disponible."
L["Hide node"] = "Masquer l'icône"
L["Close"] = "Fermer"
L["Icon settings"] = "Icônes options"
L["These settings control the look and feel of the icon."] = "Ces paramètres contrôlent l'apparence des icônes."
L["Icon Scale"] = "Échelle des icônes"
L["The scale of the icons"] = "Définit l'échelle des icônes."
L["Icon Alpha"] = "Transparence des icônes"
L["The alpha transparency of the icons"] = "Définit la transparence globale des icônes."
L["World Map"] = "Carte du monde"
L["Show icons on world map"] = "Afficher les icônes sur la carte du monde"
L["Minimap"] = "Mini-carte"
L["Show icons on the minimap"] = "Afficher les icônes sur la mini-carte"
L["What to display"] = "Affichage"
L["Use item icons"] = "Utiliser les items"
L["Show the icons for items, if known; otherwise, the achievement icon will be used"] = "Afficher les icônes pour les items, si elles sont connues; sinon, l'icône de réalisation sera utilisée"
L["Use item tooltips"] = "Utiliser les info-bulles"
L["Show the full tooltips for items"] = "Afficher les info-bulles complètes pour les items"
L["Show found"] = "Afficher tous"
L["Show waypoints for items you've already found?"] = "Montrer les icônes des objets que vous avez déjà trouvés"
L["Show NPCs"] = "Afficher les NPCs"
L["Show rare NPCs to be killed, generally for items or achievements"] = "Affiche les rares PNJ à tuer, généralement pour les objets ou les réalisations"
L["Show treasure"] = "Afficher les trésors"
L["Show treasure that can be looted"] = "Montrer des trésors qui peuvent être pillés"
L["Junk"] = "Trésors divers"
L["Show items which don't count for any achievement"] = "Afficher les trésors qui ne comptent pour aucun accomplissement"
-------
L["Debug"] = "Debug"
L["Show quest ids"] = "Afficher ID quêtes"
L["Show the internal id of the quest associated with this node. Handy if you want to report a problem with it."] = "Affiche ID interne de la quête associée à cet item. Pratique si vous souhaitez signaler un problème."
L["Show NPCs ids"] = "Afficher ID Npcs"
L["Show the internal id of the NPC associated with this node. Handy if you want to report a problem with it."] = "Affiche ID interne du NPC associée à cet item. Pratique si vous souhaitez signaler un problème."
L["Reset hidden nodes"] = "Restaurer les cachés"
L["Show all nodes that you manually hid by right-clicking on them and choosing \"hide\"."] = "Affichez tous les icônes que vous avez masqués manuellement en cliquant dessus avec le bouton droit de la souris et en choisissant \"Masquer l'icône\"."
-------
L["What to display achievement"] = "Affichage des Hauts Faits"
L["Show Achievement"] = "Afficher Hauts Faits"
L["Show Achievement that can be looted"] = "Montrer les icônes qui peuvent acomplir des Hauts Faits"
L["Use item icons achievement"] = "Utiliser les items HF"
L["Show Achievements completed"] = "Afficher les Hauts Faits accomplies"
L["Select achievement"] = "Selectionner les Hauts Faits"
L["Show the icons Achievement"] = "Afficher les icônes de ce Haut Fait."

-- Others
L["Entrance "] = "Entrée "
L["Start "] = "Départ "
L["Require item : "] = "Éxige l'objet : "
L["You can buy them from : "] = "Vous pouvez les acheter auprès de : "
L["in cave"] = "dans la grotte."

-- Treasure ---------------------------------------------------------
L['Treasure Chest'] = "Coffre au trésor"										-- ADD
L['Small Treasure Chest'] = "Petit coffre au trésor"							-- ADD
-- HF 12851 - Trésors de Zuldazar
L["On second floor"] = "Au deuxième étage"										-- ADD
L["Bottom floor of ship"] = "Au fond du navire"									-- ADD
L["Top of ship"] = "Sur le haut du navire"										-- ADD
L["Event: kill Da White Shark first"] = "Tuer 'La Squale' pour avoir le trésor"	-- ADD
L["In cave behind waterfall"] = "Dans la grotte derrière la cascade"			-- ADD
L["Road behind waterfall"] = "Route derrière la cascade"						-- ADD
-- HF 12771 - Trésors de Nazmir
L["In dead hippo's mouth"] = "Dans la bouche de l'hippopotame mort"				-- ADD
L["Climb the tree"] = "Grimper sur l'arbre" 									-- ADD
-- HF 12849 - Trésors de Vol’dun
L["Use mine cart"] = "Utiliser le chariot de la mine"							-- ADD
L["Climb the rock arch"] = "Monter sur l'arche de pierre"						-- ADD
L["Climb fallen tree"] = "Monter sur l'arbre mort"								-- ADD
L["Under sand pile"] = "Sous le tas de sable"									-- ADD
L["Door on East side"] = "Entrée par la porte Est"
L["Path from South side"] = "Chemin du côté sud"								-- ADD
L["Enter at top of temple"] = "Entrer en haut du temple"						-- ADD
-- HF 12852 - Trésors de Rade de Tiragarde
L["Ride the Guardian"] = "Chevauché le gardien de la source jusque la !"		-- ADD
L["In Boralus, on Stomsong Monastary"] = "À Boralus, au Monastère Chantorage"	-- ADD
L["Teleport here from Stormsong, pick up the gem"] = "Téléportation du Monastère, ramasser la gemme"	-- ADD
L["Kill pirates in Freehold until the map drops"] = "Tuez les pirates à Port-Liberté jusqu'à ce que la carte tombe"	-- ADD
L["Entrance to the underwater cave"] = "Entrée de la grotte sous-l'eau"			-- ADD
L["Read Damp Scrolls; in the underwater cave, from the monastary"] = "Lire les rouleaux humides; dans la grotte sous l'eau, du monastère"	-- ADD
L["Read Damp Scrolls; underground"] = "Lire les rouleaux humides; souterrain"	-- ADD
L["Read Damp Scrolls; upstairs"] = "Lire les rouleaux humides; en haut"			-- ADD
L["Read Damp Scrolls"] = "Lire les rouleaux humides"							-- ADD
L["Ominous Altar; use it, get teleported, pick up the gem"] = "Autel de mauvais augure, l'utiliser, se téléporter, ramasser la gemme"	-- ADD
-- HF 12995 - Trésors de Drustvar
L["Left Down Up Right"] = "Gauche Bas Haut Droite" 								-- ADD
L["Right Up Left Down"] = "Droite Haut Gauche Bas" 								-- ADD
L["Click on Witch Torch"] = "Cliquez sur les torches de sorcière" 				-- ADD
L["Get keys from Gorging Raven"] = "Obtenez les clés" 							-- ADD
L["Left Right Down Up"] = "Gauche Droite Bas Haut" 								-- ADD
-- HF 12853 - Trésors de Vallée Chantorage
L["On roof"] = "Sur le toit"													-- ADD
L["Top shelf inside shed"] = "Étagère supérieure à l'intérieur de la remise"	-- ADD
L["Climb ladder onto ship"] = "Monter à l'échelle sur le navire"				-- ADD
L["Under ship"] = "Sous le navire"												-- ADD
L["Under platform"] = "Sous la plateforme"										-- ADD
L["Jump onto platform"] = "Sauter sur la plateforme"							-- ADD
L["Behind pillar"] = "Derrière le pilier"										-- ADD

-- Rares ------------------------------------------------------------
L["Shares spawn timer with Azuresail the Ancient and Kil'Tawan"] = true
L["Shares spawn timer with Thunderfoot and Kil'Tawan"] = true
L["South of Savagelands"] = true
L["Can be found near the road in the grass"] = "Peut être trouvé près de la route dans l'herbe."
L["South of the Nesingwary's Trek windrider"] = true
L["Fighting Ten'gor at crossroad"] = "Combattre Ten'gor au croisement."
L["On the road from Zeb'ahari to Tal'gurub"] = "Sur la route de Zeb'ahari à Tal'gurub"
L["Flying close to the road from Vol'dun to Zuldazar"] = "Vole près de la route de Vol'dun à Zuldazar"
L["Ride to Roan Berthold in Southwind Station, follow the road"] = "Chevauché vers Roan Berthold au Poste d'Ansesud, suivez la route (67.36 51.66)"
L["Inside skeleton under the sand"] = "A l'interieur du quelette sous le sable."
L["Hillside above the cave"] = "Colline au-dessus de la grotte"
L["Pick one to fight; Dagger from Longfang, mail gloves from Henry"] = true
-- HF 13027 - Récolte de champignons
L["On the beach, between trees"] = "Sur la plage, entre les arbres"
L["South of Heart of Darkness. Entrance is from the north side of Xal'vor ruins"] = "Au sud du coeur des ténèbres. L'entrée est du côté nord des ruines de Xal'vor"
L["In cave, entrance at 73.2 49.7"] = "Dans la grotte, entrée 73,2 49,7"
L["Shrouded Shore, on the hill"] = "Caché sous les arbres sur la petite coline"
---------------------------------------------------------------------

-- HF 13018 - Chevaucheur des dunes
L["Along the pyramid edge"] = "Le long du bord de la pyramide"
L["On top of the slither snake"] = "Au sommet de la couleuvre"

-- HF 13024 - Gravé dans la pierre en lettres de sang
L["Inside a building ruins near the mountain"] = "À l'intérieur d'un bâtiment des ruines près de la montagne"
L["Next to broken pillar as you enter the ruins"] = "À côté du pilier brisé lorsque vous entrez dans les ruines"
L["Island between Nazmir and Zuldazar zones"] = "Île entre les zones de Nazmir et Zuldazar"
L["Near Kel'vax Deathwalker rare"] = "Près du rare 'Kel'vax Deathwalker'"

-- HF 13028 - Triste sot
L["Lost Spawn of Krag'wa 1"] = "Rejeton de Krag'wa perdu 1"
L["Lost Spawn of Krag'wa 2"] = "Rejeton de Krag'wa perdu 2"
L["Lost Spawn of Krag'wa 3"] = "Rejeton de Krag'wa perdu 3"
L["Lost Spawn of Krag'wa 4"] = "Rejeton de Krag'wa perdu 4"
L["Lost Spawn of Krag'wa 5"] = "Rejeton de Krag'wa perdu 5"
L["Lost Spawn of Krag'wa 6"] = "Rejeton de Krag'wa perdu 6"
L["Lost Spawn of Krag'wa 7"] = "Rejeton de Krag'wa perdu 7"
L["Lost Spawn of Krag'wa 8"] = "Rejeton de Krag'wa perdu 8"
L["Lost Spawn of Krag'wa 9"] = "Rejeton de Krag'wa perdu 9"
L["Lost Spawn of Krag'wa 10"] = "Rejeton de Krag'wa perdu 10"
L["In an underwater cave"] = "Dans une grotte sous l'eau"
L["Between the huge roots"] = "Entre les énormes racines"
L["Sits in a ruin"] = "Assis dans une ruine"
L["In cave"] = "Dans la grotte"
L["Sits up between trees"] = "Assis entre les arbres"
L["Sits near the bridge behind the big tree"] = "Se trouve près du pont derrière le grand arbre"
L["Sits behind a curtain of scrub"] = "Assis en bas sous l'arbre"

-- HF 13036 - Nul n’est censé les ignorer
L["In the pond"] = "Dans l'étang"
L["Next to the withered tree"] = "À côté de l'arbre desséché"
L["Scroll next to the altar, behind the mobs"] = "Faites défiler à côté de l'autel, derrière les foules"
L["Behind the NPC in the Corner"] = "Derrière le PNJ dans le coin"
L["Next to the river"] = "À côté du fleuve"
L["Between the roots"] = "Entre les racines"
L["At the destroyed pillar"] = "Au pilier détruit"
L["Above, at the pond on the big stone"] = "Au dessus, à l'étang sur la grande pierre"
L["In the eye of the skeleton, outside"] = "Dans l'oeil du squelette, à l'extérieur"
L["On the wall, behind the torch"] = "Au mur, derrière la torche"
L["Above, to the right of the small staircase"] = "Au-dessus, à droite du petit escalier"
L["At the destroyed pillar on the left"] = "Au pilier détruit à gauche"
L["Scroll on the altar"] = "Faites défiler l'autel"
L["At the destroyed wall"] = "Au mur détruit"
L["Under water, at the bottom, at the destroyed pillar"] = "Sous l'eau, au fond, au pilier détruit"

-- HF 13046 - Les collines de l'appétit
L["Buy %s from %s "] = "Acheter %s auprès de : %s "
L["to Brennadam"] = "à Brennadam"
L["Use Cooking for %s"] = "Utilisé la cuisine pour %s"
L["The recipe %s and loot on %s to Waycrest Manor"] = "La recette %s et looté sur %s au Manoir Malvoie"

-- HF 13051 - Légendes des Eaugures
L["Near the waterfall"] = "Près de la cascade"
L["On top of the hill"] = "Au sommet de la colline"
L["Near the lake"] = "Près du lac"
L["On top of the island"] = "Au sommet de l'île"
L["Up the mountain right of Warfang Hold"] = "En haut de la montagne à droite de Warfang Hold"
L["Up the mountain left of Warfang Hold"] = "En haut de la montagne à gauche de Warfang Hold"
L["Near the Shrine of the Storm entrance"] = "Près de l'entrée du sanctuaire de la tempête"

-- HF 13057 - Les chants de la mer
L["On the fireplace mantel"] = "Sur le rebord de la cheminée 'Chansonnier de Russel'"
L["Behind the Jay the Tavern Bard"] = "Derrière Jay le barde de l'auberge 'Chansonnier de Jay'"


-- HF 13064 - Drust sera la chute
L["At the bottom of the upper waterfall"] = "Eu bas de la chute d'eau supérieure"
L["Under the leaning tree"] = "Sous l'arbre penchée"
L["Under water"] = "Sous l'eau"
L["At the destroyed wall"] = "Au mur détruit"
L["Under water at the foot of the small waterfall"] = "Sous l'eau au pied de la petite cascade"
L["Behind the scrub"] = "Derrière les branches"
L["On the mountain, a bit difficult to find the way up (see path)"] = "Sur la montagne, un peu difficile à trouver (voir le chemin)"
L["Path to The Flayed Man: Start"] = "Chemin vers l'homme écorché: Départ"
L["Path to The Flayed Man: Step 1"] = "Chemin vers l'homme écorché: étape 1"
L["Path to The Flayed Man: Step 2"] = "Chemin vers l'homme écorché: étape 2"
L["Path to The Flayed Man: Step 3"] = "Chemin vers l'homme écorché: étape 3"
L["Path to The Flayed Man: Step 4"] = "Chemin vers l'homme écorché: étape 4"
L["Path to The Flayed Man: End, jump down carefully"] = "Chemin vers l'homme écorché: fin, sauté soigneusement"
L["In a cave, at the very back of the wall"] = "Dans la grotte, tout au fond du mur"
L["Path to Protectors of the Forest: cave entrance"] = "Chemin des protecteurs de la forêt: entrée de la grotte"

-- HF 13082 - Du neuf avec du vieux
L["Near the cliff under the trees west of Arom's Stand flight master."] = "Près de la falaise sous les arbres à l'ouest du poste de vol maître d'Arom."
L["Between the rocks mid level of the waterfall"] = "Entre les rochers à mi-hauteur de la cascade"
L["On the mountain north of Fallhaven in the pile of bones."] = "Sur la montagne au nord de Havrebrune dans le tas d'os."
L["In the tree trunk from the south side"] = "Dans le tronc d'arbre du côté sud"

