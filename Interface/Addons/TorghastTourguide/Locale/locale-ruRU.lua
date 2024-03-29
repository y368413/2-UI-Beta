local addonName, addon = ...
local L = _G.LibStub("AceLocale-3.0"):NewLocale(addonName, "ruRU")
if not L then return end

L["- Requires UI Reload"] = "Требуется перезагрузка пользовательского интерфейса"
L[ [=[%s - 
%s:
%s]=] ] = "%s - %s: %s"
L["%s - %s%s"] = "%s - %s%s"
L["%s Count"] = "%s Итог"
L["%sAnima Powers Collected: %s"] = "%sСобрано сил Анимы: %s"
L["%sAshen Phylactery Broken: %s"] = "%sУничтожено филактерий с прахом: %s"
L["%sChests Opened: %s"] = "%sСундуков открыто: %s"
L["%sDeaths: %s"] = "%sСмертей: %s"
L["%sFloors Climbed: %s"] = "%sЭтажей пройдено: %s"
L["%sMawrats Killed: %s"] = "%sУбито крыс Утробы: %s"
L["%sMobs Killed: %s"] = "%sПротивников убито: %s"
L["%sPhantasma Collected: %s"] = "%sСобрано фантазмы: %s"
L["%sQuests Completed: %s"] = "%sЗаданий завершено: %s"
L["%sSouls Collected: %s"] = "%sДуш собрано: %s"
L["%sSuccessful Runs: %s"] = "%sУспешных забегов: %s"
L["%sTime Spent: %s"] = "%sВремени потрачено: %s"
L["%sTimes Tarragrue Released: %s"] = "%sТаррагр был выпущен: %s"
--[[Translation missing --]]
--[[ L["%sTraps Sprung: %s"] = "%sTraps Sprung: %s"--]] 
L["|c%s[%s] auto-selected"] = "|c%s[%s] автоматически выбрано"
L["Always"] = "Обычно"
L["Anima Cell"] = "Клетка с анимой"
L["Anima Power Options"] = "Опции способностей анимы"
L["Anima Powers"] = "Способности анимы"
L["Auto Hide Bonus List"] = "Автоскрытие списка бонусов"
L["Auto Hide Bonus List In Combat"] = "Автоскрытие списка бонусов в бою"
L["Auto Select Flagged Powers"] = "Автоматический выбор отмеченных способностей"
L["Blessings"] = "Благословения"
L["Bonuses: %s"] = "Бонусы: %s"
L["Bosses"] = "Боссы"
L["Bosses Ability"] = "Способности боссов"
L["Bosses: %s - Rares: %s - Mawrats: %s"] = "Боссы: %s - Редкие: %s - Крысы Утробы: %s"
L["BOSSLINK"] = "Ссылка на босса: https://www.wowhead.com/npc=%s"
L["Bottom"] = "Снизу"
L["Box of Many Things"] = "Шкатулка многих тайн"
L["Clear Notes"] = "Очистить заметки"
L["Clear Weights"] = "Очистить значимость"
L["Click |c%s[%s]"] = "Нажмите |c%s[%s]"
L["Click to set weight & note"] = "Нажмите, чтобы установить значимость и заметку"
L["Click to use %s"] = "Нажмите для использования %s"
L["Completion: %s"] = "Завершение: %s"
L["CURRENT RUN:"] = "ТЕКУЩИЙ ЗАБЕГ:"
L["Description"] = "Описание"
L["Display Options"] = "Опции отображения"
L["Dropped Anima Cell"] = "Брошенная клетка с анимой"
L["Failed Bonus: %s"] = "Неудавшийся бонус: %s"
--[[Translation missing --]]
--[[ L["Failed Bouns: %s"] = ""--]] 
L["Favorite Priority"] = "Избранный приоритет"
L["Favorite Priority Order"] = "Порядок приоритета избранных"
L["Flash Flagged Powers"] = "Подсвечивать отмеченные способности"
L["Floor"] = "Этаж"
L["Font Color"] = "Цвет шрифта"
L["Font Size"] = "Размер шрифта"
L["Gained Bonus: %s"] = "Полученный бонус: %s"
--[[Translation missing --]]
--[[ L["Gained Bouns: %s"] = ""--]] 
L["General Options"] = "Общие настройки"
L["GUIDELINK"] = "Ссылка на гайд: https://www.wowhead.com/guides/torghast-floor-boss-strategies-abilities-tips-tricks"
L["Hide Power Selection Toggle in Combat"] = "Скрыть переключатель выбора способностей в бою"
L["Hide Power Selection Window in Combat"] = "Скрыть окно выбора способностей в бою"
L["Hide Power Window Immediately After Selection"] = "Скрыть окно способностей незамедлительно после выбора"
L["Highlander + 15pts"] = "Горец + 15очк"
L["Layer %s:"] = "Слой %s:"
L["Left"] = "Слева"
L["No Data Available"] = "Нет доступных данных"
L["No priority Powers Available"] = "Нет доступных приоритетных способностей"
L["Notes:"] = "Заметки:"
L["Number of Torments Per Layer"] = "Количество мучений на слой"
L["Obscuring Essence Potion"] = "Зелье скрытой сущности"
L["Options"] = "Опции"
L["Pauper  +10pts"] = "Бедняк +10очк"
L["Phantasmic Infuser"] = "Нагнетатель фантазмы"
L["Plundered Anima Cell"] = "Клетка с награбленной анимой"
L["Point Value"] = "Значение очков"
L["Position of Bonus List"] = "Позиция списка бонусов"
L["Position of Score Frame"] = "Позиция фрейма счета"
L["Power Notes"] = "Заметки способности"
L["Power Weight"] = "Значимость способности"
L["Quick Hide Floor Toasts"] = "Быстрое скрытие уведомления о этаже"
L["Rares"] = "Редкие противники"
L["Ravenous Anima Cell"] = "Клетка с голодной анимой"
L["Ravenous Anima Cell Powers"] = "Способности клетки с голодной анимой"
L["Requisitioned Anima Cell"] = "Реквизированная клетка с анимой"
L["Reset Score Location"] = "Сбросить расположение счета"
L["Reset Stats"] = "Сбросить статистику"
L["Right"] = "Справа"
L["Score Tracker Options"] = "Опции отслеживания результатов"
L["Score type"] = "Тип счета"
L["Score:"] = "Счет:"
L["Select Font"] = "Выберите шрифт"
L["Set Power Weight & Note"] = "Установить значимость и заметку способности"
L["Settings"] = "Настройки"
L["Show Bonus Status Messages"] = "Показать сообщения о состоянии бонуса"
L["Show Combat Timer"] = "Показать таймер боя"
L["Show Minimap Icon"] = "Показать кнопку у миникарты"
L["Show On Screen Selection Message"] = "Показать сообщение о выборе на экране"
L["Show Power Selection Window after Combat"] = "Показать окно выбора способностей после выхода из боя"
L["Show Rare Ability Drop Tooltips"] = "Показать всплывающие подсказки о выпадении редких способностей"
L["Show Ravenous Anima Cell Tooltips"] = "Показать всплывающие подсказки для клетки с голодной анимой"
L["Show Score Frame"] = "Показать фрейм счета"
L["Show Weight Windows"] = "Показать окна значимости"
L["STATS"] = "СТАТИСТИКА"
L["Stats"] = "Статистика"
L["Tips & Tricks"] = "Советы и хитрости"
L["Toggle Guide"] = "Переключение руководства"
L["Tooltip Options"] = "Опции всплывающей подсказки"
L["Torghast Mobs"] = "Противники Торгаста"
L["Torghast Scoring"] = "Подсчет очков Торгаста"
L["Torghast Upgrades"] = "Улучшения для Торгаста"
L["Torment_Count"] = "Уровни 1-5: 0 Уровни 6-7: 1 Уровни 8-9: 2 Уровни 10: 3 Уровень 11: 4 Уровень 12: 5"
L["Torments"] = "Мучения"
L["Total "] = "Суммарная"
L["TOTALS:"] = "СУММАРНАЯ:"
L["Upgrades"] = "Улучшения"
L["Weight:"] = "Значимость:"
L["WoWHead Links"] = "WoWHead Ссылки"

-- Boss_Tips
L["Baritas_Tip1"] = "Существа, порожденные Связью душ, имеют много здоровья, но любой вид контроля, который работает на нежить, мгновенно уничтожит их."
L["Baritas_Tip2"] = "От Эха души достаточно легко увернуться, поэтому уклоняйтесь и сохраняйте свои прерывания для заклинания Стрела Тьмы, которая будет наносить всё больше урона по мере продвижения боя."
L["Corrus_Tip1"] = "Если купить у продавца Капсулы ослепляющего дыма, то можно избежать заклинания Разрыв Тьмы. Вы можете прервать Темный размах, если возникли проблемы с ним, но это не должно быть приоритетно. Периодический урон от Разрыва Тьмы несущественен."
L["Corrus_Tip2"] = "Прерывайте Стигийский щит всякий раз, когда это возможно, потому что снижение урона по боссу на 30% слишком существенно. Если у вас есть рассеивание, то развейте Стигийский щит после его применения и сохраните прерывания для заклинания Разрыв Тьмы."
L["Cromwell_Tip1"] = "Босс применяет много прерываемых заклинаний. Важно прервать заклинание Калечащий порыв, потому что оно снижает скорость атаки и основные характеристики на некоторое время."
L["Cromwell_Tip2"] = "Способность Ужасная чума применяется на босса. Отбегите от него, чтобы не получить урон, а прерывание придержите для заклинания Залп стрел мрака."
L["Cromwell_Tip3"] = "Способность Распространяющиеся грехи оставляет зоны вокруг босса. Просто избегайте их."
L["Decayspeaker_Tip1"] = "Укрепленный панцирь - главное, на что надо обратить внимание. Бой начинается с 9 эффектами (получаемый урон боссом снижен на 90%). Используйте быстрые атаки и мгновенные способности, чтобы уменьшить или полностью удалить все эффекты Укрепленного панциря, а уже после этого воспользуйтесь своими мощными способностями!"
L["Decayspeaker_Tip2"] = "Способность Кислотная бомба обстреливает ядовитыми бомбами цели вокруг Гнилоуста. Старайтесь не получить урона. Если в вас попадёт Кислотная бомба, вы можете смягчить часть урона, если у вас есть заклинания на снятие яда."
L["Gherus_Tip1"] = "Оглушающий вой - наиболее опасное заклинание, и его нужно прервать любой ценой, так как находясь под эффектом контроля вы будете уязвимы для других его заклинаний."
L["Gherus_Tip2"] = "Заклинание Поглощение Души возможно прервать, используя контроль. Босс не использует его часто, так что придержите оглушение для этой способности."
L["Gherus_Tip3"] = "Бесплотность может быть прервано, если у вас есть прерывания - в противном случае используйте это время, чтобы обновить способности или исцелить себя."
L["Goxul_Tip1"] = "Самым большим приоритетом является прерывание заклинания Массовое пожирание всеми имеющимися у вас способностями контроля."
L["Goxul_Tip2"] = "Сфера имеет низкий запас здоровья."
L["Kosarus_Tip1"] = "Делайте минимум движений, чтобы на боссе не накапливались эффекты Исступления. Двигайтесь только для уклонения от Коллапса."
L["Kosarus_Tip2"] = "Способности, которые позволяют вам перемещаться из одной точки в другую не вызывают эффекта ярости."
L["Laguas_Tip1"] = "Важно прерывать заклинание Проклятие бренности, так как оно увеличит урон, получаемый от всех остальных его способностей. Проклятия могут снимать некоторые классы."
L["Laguas_Tip2"] = "Заклинание Магическое заземление прерываемое, которое даёт магический щит. Боец ближнего боя может пропустить это заклинание, а для дальнего боя лучше прервать его. Также можно развеять заклинание."
L["Laguas_Tip3"] = "Прерывайте как можно чаще Стрелу души, но и не забывайте про Проклятие бренности и Магическое заземление. Всех заклинаний Стрела души прервать не получится."
L["Laguas_Tip4"] = "Заклинание Подавление нельзя прервать, но легко увернуться. Будьте внимательны, так как Подавление накладывает немоту."
L["Longbranch_Tip1"] = "Для начала обычными ударами снизьте 9 зарядов Укреплённого панциря и только потом используйте мощные заклинания и способности."
L["Longbranch_Tip2"] = "Необходимо прерывать каждое заклинание Благословение леса, чтобы не дать возможности боссу восстановить здоровье. Является рассеиваемым."
L["Longbranch_Tip3"] = "Уклоняйтесь от заклинания Сокрушение, которым босс бьет в секторе перед собой."
L["Malleare_Tip1"] = "Заклинание Губительный рёв необходимо прервать любой ценой, так как оно понижает запас здоровья на 10%."
L["Malleare_Tip2"] = "Заклинания Удар по земле и Преисподняя! можно прервать оглушением, но от обоих заклинаний легко увернуться."
L["Maw_Tip1"] = "Избежать последствий от заклинания Пожирание облеронового снаряжения достаточно просто: либо набрать немного сил анимы на облероновое снаряжение, либо прервать оглушением."
L["Maw_Tip2"] = "Заклинание Жижа прерывайте как можно чаще, но не забывайте оставить оглушающие способности для прерывания заклинания Пожирание облеронового снаряжения."
L["Sentinel_Tip1"] = "Бойцы ближнего боя должны немедленно прекратить атаковать и перемещать босса во время заклинания Обваливающиеся стены (от него окалываются сторожевые осколки) и Неуклюжей мощи. Для бойцов дальнего боя нет никаких ограничений."
L["Sentinel_Tip2"] = "Отбегайте на 15 метров от босса во время заклинания Удар по земле и уйти за босса, чтобы не попасть в сектор Ударной волны."
L["Skoldus_Tip1"] = "Прерывайте каждый раз заклинание Крысы!, так как оно наносит много урона и снижает скорость передвижения."
L["Skoldus_Tip2"] = "От заклинаний Массивный рывок и Ловушки легко уклониться. Важно: не стойте на пути в ту сторону, в которую он произносит заклинание."
L["Soulmass_Tip1"] = "Поставьте метку на босса перед началом боя, потому что засчитывается только тот урон, который вы наносите главному боссу. Меньшие части взрываются при смерти и не уменьшают здоровье босса."
L["Soulmass_Tip2"] = "Вы можете использовать замедление и контроль, чтобы предотвратить взрывы мелких частей босса. Капсулы ослепляющего дыма также позволяют избегать урона от взрывов."
L["Split_Desc"] = "Ползучая духоплазма распадается на мелкие части."
L["Synod_Tip1"] = "Вам нужно убить босса как можно быстрее, чтобы избежать последствий от заклинаний Устрашающее присутствие и Отвердение."
L["Synod_Tip2"] = "Прерывайте заклинание Устрашающее присутствие всем, чем только обладаете, так как оно понижает ваши скорость и получаемое исцеление. Эффекты заклинания складываются."
L["Synod_Tip3"] = "Заклинание Прерывающий мощный удар имеет меньший приоритет для прерывания."
L["Synod_Tip4"] = "Заклинание Отвердевание увеличивает получаемый урон от тёмной магии, потому не допускайте большого количества эффекта. Является развеиваемым."
L["Thonar_Tip1"] = "Капсулы ослепляющего дыма являются сильными против босса, так как его урон в ближнему бою высок."
L["Thonar_Tip2"] = "Держитесь около стен при битве с боссом, чтобы уменьшить распространение Пагубного облака."
L["Thonar_Tip3"] = "Заклинание Мясницкий крюк является прерываемым. Используйте также оглушение, чтобы вас не притянуло в Пагубное облако."
L["Thonar_Tip4"] = "Не атакуйте во время действия способности Шипастый панцирь, так как урон по боссу снижен на 75%. Лучше исцелите себя в этот время, если требуется."
L["Warden_Tip1"] = "Способность Колодец душ увеличивает урон босса, так что держите его подальше от места действия способности."
L["Warden_Tip2"] = "Убивайте созданные боссом фрагменты души, чтобы их не появилось достаточно много для победы над вами."
L["Warden_Tip3"] = "Прерывайте заклинание Ужасающий вой, чтобы не поддаться страху."
L["Watchers_Tip1"] = "Старайтесь прерывать каждое заклинание Ужасающий вой."
L["Watchers_Tip2"] = "Уклоняйтесь от водоворотов на полу, которые возникают от способности Пророчество смерти."
L["Zelgar_Tip1"] = "Уклоняйтесь от способности Удары с воздуха, так как они наносят серьёзный урон. Иной раз даже фатальный."
L["Zelgar_Tip2"] = "Прерывайте как можно чаще заклинание Точечный взрыв. Прервать все не получится поскольку это потоковое заклинание."
L["Zelgar_Tip3"] = "Оглушите босса, чтобы остановить заклинание Луч из глаз, потому что оно наносит урон и отталкивает, из-за чего можно упасть с платформы."

-- Bosses
L["151329"] = "Тюремщик Скольд"
L["151331"] = "Тюремный часовой"
L["152995"] = "Страж душ"
L["153011"] = "Подчинитель Баритас"
L["153165"] = "Комендант Тонар"
L["153174"] = "Дозорные Смерти"
L["153382"] = "Чрево Утробы"
L["153451"] = "Козарус Падший"
L["155250"] = "Гнилоуст"
L["155251"] = "Старейшина Большая Ветвь"
L["155945"] = "Герус Заточенный"
L["156015"] = "Ползучая духоплазма"
L["156239"] = "Темная перерожденная Коррия"
L["157122"] = "Патриций Кромвель"
L["159190"] = "Синод"
L["159755"] = "Великий Маллеар"
L["169859"] = "Наблюдательница Зельгар"
L["170418"] = "Гозул Пожиратель"
L["171422"] = "Верховный подавитель Лагвас"

