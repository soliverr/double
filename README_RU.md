Double - Программа, которой нет!
================================

Программный проект **Дубль** (_Double_) - это программа, которая создаётся в процессе накопления знаний и опыта человека, которая является
средством аккумулирования накопленных знаний и предоставляет те или иные способы работы со знаниями. **Дубль** - это не 
[экспертная система](https://ru.wikipedia.org/wiki/%D0%AD%D0%BA%D1%81%D0%BF%D0%B5%D1%80%D1%82%D0%BD%D0%B0%D1%8F_%D1%81%D0%B8%D1%81%D1%82%D0%B5%D0%BC%D0%B0) и
не попытка создать 
[искусственный интеллект](https://ru.wikipedia.org/wiki/%D0%98%D1%81%D0%BA%D1%83%D1%81%D1%81%D1%82%D0%B2%D0%B5%D0%BD%D0%BD%D1%8B%D0%B9_%D0%B8%D0%BD%D1%82%D0%B5%D0%BB%D0%BB%D0%B5%D0%BA%D1%82).
В первом приближении **Дубль** можно рассматривать как 
[персональный информационный манаджер](https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D1%81%D0%BE%D0%BD%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9_%D0%B8%D0%BD%D1%84%D0%BE%D1%80%D0%BC%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D1%8B%D0%B9_%D0%BC%D0%B5%D0%BD%D0%B5%D0%B4%D0%B6%D0%B5%D1%80) в части организации работы с заметками и 
персональной [базой знаний](https://ru.wikipedia.org/wiki/%D0%91%D0%B0%D0%B7%D0%B0_%D0%B7%D0%BD%D0%B0%D0%BD%D0%B8%D0%B9), хотя в дальнейшем будет активно использоваться
терминология этих областей математики и вычислительной техники.
По крайней мере таким **Дубль** видится в начале пути. Что из него будет получаться в дальнейшем, зависит только от нас (_людей_).


Введение
--------

К настоящему моменту возникло множество информационных ресурсов, посвящённых различным аспектам работы с программным обеспечением в самом широком смысле (от операционных
систем и системных утилит до прикладных и развлекательных программ): установка, настройка, устранение проблем, использование какого-либо функционала. Это и статьи в
(_электронных_) журналах, и статьи в блогах, и сообщения в форумах, и множество _wiki_-организованных баз знаний, и специализированные системы получения помощи и обмена фрагментами
скриптов или программного кода, а также любые другие формы и способы организации взаимопомощи людей. Подобные информационные ресурсы характерны не только для 
сферы информационных технологий, но и для других сфер деятельности человека.

Основной характерной чертой данных ресурсов является получение быстрого ответа на поставленный вопрос, ответа, который даётся на основании уже накопленного опыта отвечающего. 
Говоря другими словами, подобного рода ресурсы выступают в роли интерфейса экспертной системы, предоставляя функции _ввода вопроса_ и _вывода ответа_, при этом этапы восприятия
и интерпретации вопроса, [логический вывод](https://ru.wikipedia.org/wiki/%D0%92%D1%8B%D0%B2%D0%BE%D0%B4_%28%D1%80%D0%B0%D1%81%D1%81%D1%83%D0%B6%D0%B4%D0%B5%D0%BD%D0%B8%D0%B5%29)
и формулирование ответа на _естественном языке_ остаются за людьми (_экспертным сообществом_). В этом смысле, на данный момент, наиболее функциональной и хорошо организованной
_общественной экспертной системой_ являются сайты на технологии [StackExchange](http://stackexchange.com).

Анализ структуры сообщений в сфере информационных технологий вообще, и в сфере "системного администрирования" в частности, показывает, что во всех информационных сообщениях
можно выделить два структурных элемента:

0. _Текст на естественном языке_, где даются пояснения и, собственно, формируется контекст использования второго структурного элемента;
0. _Текст на языке программных средств_: команды операционной системы (_утилиты_), изменение конфигурации программ, фрагменты кода для включения, - всё то, что интерпретируется
уже программными средствами (от операционной системы, компиляторов и систем исполнения языков программирования до прикладного программного
обеспечения).

То есть, структурные элементы первого уровня на _естественном языке_ формулируют контекст и оговаривают различные условия применимости структурных элементов второго уровня.
Эти два вида представляют _"замкнутый"_ элемент знания, одно без другого практически не может существовать. Баланс данных элементов внутри информационного ресурса в
значительной степени влияет на _"полезность"_ данного ресурса для человека: текст на естественном языке приводит к увеличению времени достижения результата, так как требует
навыков для формулирования знаний на _"языке программных средств"_; в тоже время наличие только выражений на языке программных средств снижает уровень уверенности в получении
желаемого результата, так как контекст применения обозначен не явно.


Идея данного проекта возникла в результате роста информационных ресурсов, как например, блогов, wiki, сообщений в форумах, - посвящённых
настройке того или иного программного обеспечения или выполнения каких-либо действий в больших программных проектах.

Основное содержание подобного рода информационных ресурсов сводится к общим комментариям, сравнению программ со сходной функциональностью
и выполнение процедур установки и настройки таких программ.

Такой подход в чём-то напоминает подход [CWEB](http://en.wikipedia.org/wiki/CWEB), когда команды языка C и документация размещены в одном месте,
только в случае wiki или блогов, языковые конструкции представляют собой команды на запуск утилит (программ) данной ОС.

Другим побуждающим мотивом к началу данного проекта явилась необходимость постоянной настройки рабочей среды под себя. После обновления операционной системы
(здесь автором подразумеваются дистрибутивы на базе Linux), после приобретения нового персонального компьютера и т.п., - постоянно возникает
потребность настроить "окружающую среду" под себя: установить необходимое программное обеспечение, зачастую из неофициальных репозитариев дистрибутива
или из исходного кода, при этом приложив свои патчи; настроить определённые, часто используемые программы; подключиться к облачным ресурсам и настроить
синхронизацию файлов; организовать какое-то собственное резервное копирование; и множество подобных мелких и частных задач "системного администрирования"
своих рабочих станций.

Эти два аспекта привели к идее программы, с помощью которой можно было бы автоматизировать рутинные процессы настройки собственных рабочих станций, а также
документировать данные процессы, представляя документацию в виде wiki-страниц.

Ограничения
-----------

Вместо перечисления имеющихся программных проектов, так или иначе, реализующих идеи, сформулированные во [введении|Введение], приведём список ограничивающих
условий для реализации данного проекта:

### Как можно проще (ASAP: As simple as possible)

Не должно быть никаких требований многоуровневой архитектуры (клиент - сервер), никаких специальных форматов представления данных и знаний. При реализации
кода программы необходимо минимизировать использование модулей расширения, библиотек и т.п. той платформы (языка) программирования, на котором будет
реализован данный проект.

### Открытость

Код проекта, равно как данные и знания должны быть полностью открыты общественности. Необходимо предусмотреть механизмы обмена знаниями: это может быть программный
код, данные для работы этого кода и что-либо ещё.

Необходимо обеспечить открытость знаний: данных (или накопленных фактов, значений и т.п.); связей между данными; типизации (или схемы данных); процедур (кода программ,
реализующих обработку данных и связей между данными); связей между процедурами.

Открытость подразумевает организацию специальных процедур для обмена подобного рода знаниями: опубликование (экспорт) знаний; использование знаний другим лицом (импорт).

### Декларативность

Необходимо реализовать базовый программный модуль проекта с использованием минимального количества концепций программирования (см. [Как можно проще]). Всё дальнейшее расширение функционала
проекта должно происходить на основе явного декларирования с использованием открытых знаний (см. [Открытость]).

На данный момент данное ограничение представляет наибольшую трудность, так как необходимо создать программный модуль, предусматривающий расширение своего функционала,
не пользуясь концепциями плагинов, контейнеров, перегрузок и пр. Необходимо написать код приложения декларативно, не пользуясь концепцией Domain-specific
Language https://en.wikipedia.org/wiki/Domain-specific_language.

Использование мета-языка представления алгоритмов.




"Инстинкты" поведения программы. Механизмы мутации в среде обитания.

Организация данных, фактов.

Аксиомы представления данных (формат данного текста Textile)

Цели, задачи, ситуации, шаги реализации.



Основная концепция данного проекта - создание помощника для выполнения конкретных задач, ведущих к достижению заданной цели.
Предметная область данных терминов на данный момент мыслится в области информационных технологий.

Основным побуждающим стимулом создания Double является потребность в автоматизации процесса организации нарастающего потока информации.
Double - это программа, которая ещё не написана, и что она должна делать - чётко не определено.

Дальнейшее описание прототипа не возможно без примеров из реальной жизни.

### Организация среды обитания в операционной системе

При работе в операционной системе часто возникает необходимость в установке дополнительного программного обеспечения, отвечающего текущим
потребностям человека-оператора. В сфере системного администрирования это выражено наиболее ярко. Системные администраторы постоянно устанавливают,
обновляют ПО на рабочих станциях в ответ на запросы пользователей. В домашних условиях мы делаем это сами или пользуемся чей-нибудь помощью.

В любом случае, у нас как у конечного пользователя, возникает потребность в решении некоторых задач с помощью компьютера. Мы начинаем поиск по
каким-либо ключевым словам для данной предметной области в Интернете, узнаём о наличии того или иного ПО, узнаём мнение других людей об этом ПО,
изучаем каким образом ПО может быть установлено на компьютер. В лучшем случае, наши усилия завершаются получением работающей версии программы,
которой мы начинаем пользоваться.

Итак, мы разобрались в предметной области, изучили и сопоставили программы по некоторым критериям, прочитали wiki-документацию (или другую) по процессу
установки, сумели выполнить все требования для предустановки и установки ПО и, наконец, получили запускаемую (а в лучшем случае, работающую) версию программы.

Но попробуйте повторить эти действия через некоторое время, на новом компьютере, для другой операционной системы.

Всё, что мне известно про это "воспроизведение" - я опять должен повторить всё с начала. Я не могу вспомнить "интуитивный" порядок установки программы,
мне приходится вновь входить в предметную область, обращать внимание на изменение версий ПО и операционной системы, снова искать и читать документацию и форумы,
и пр. И всё только ради того, чтобы вновь вернутся к использованию привычной программы.

А если таких программ у вас десяток? А дополнительняе настройки программ под себя? Даже если у вас есть резервная копия?

Вот и появляется сверхзадача - хорошо бы, что бы кто-то всё это помнил и мог воспроизвести. Хорошо бы это был мой "дубль" в мире ИТ - он учится у меня и
ничего не забывает.

### Организация источников и информации

Есть множество сервисов и программ, так называемых PIM (Personal Information Manager), призванием который, является помощь в организации информации. 
Зачастую эта помощь оказывается в сфере web-серфинга, организации и синхронизации личных заметок, закладок.

Хорошее ПО в этой сфере - Zotero (zotero.org).

Меня всегда удручало отсутствие автоматизации в организации сохранённой информации в таких системах. Подобные продукты реализуют простейшую иерархическую
модель коллекций типизированных записей. Ну да, они поддерживают теги. Но я должен делать иерархию самостоятельно, я должен назначать теги. Я не могу просто
указать URI ресурса для "сохранения на потом" и увидеть, как система классифицирует его, добавит нужные теги и припишет к нужным узлам иерархии моей коллекции.
То есть мои затраты на организации источников и информации нисколько не уменьшаются, а часто - увеличиваются, так как очень быстро я хочу начать как-то
пользоваться своей коллекцией: искать в ней нужную мне информацию по различным ассоциативным связям.

И конечно, же моя коллекция вообще ни с чем не интегрирована, максимум - это интеграция с сайтом разработчика подобной системы.

Вот и появляется сверхзадача - хорошо бы кто-то мог научиться от меня классифицировать источники информации и вести мою коллекцию по заданным мной
правилам. Хорошо бы этого "дубля" научить передавать метаданные моей коллекции в такие "любимые/удобные" для меня программы организации медиа-файлов, локальные
поискоые системы, хорошо бы этот "дубль" мог и обратно в себя информацию "прочитать" из подобных программных источников.

### Обобщение

Таким образом возникает поребность в программе, которая реализовала бы заранее не определённый набор функций. Позволяла бы эволюционировать программным сущностям
и сущностям, представляющим данные. Но не в виде типичного цикла разработки ПО: новые релизы с новыми функциями и процессом миграции данных.
Необходимо создать среду для "жизни" программных сущностей (кода) и сущностей данных, в которой и те и другие более-менее независимо могут эволюционировать.
Данная среда должна определять какие-то общие "законы" эволюции и взаимодействия сущностей.

В общем случае, любая программа - это в каком-то смысле и есть такая среда "жизни". Зачастую "законы" взаимодействия жёстко прописаны в виде процедур, интерфейса.
Сущности представлены записями, классами, экземплярами классов. Законы эволюции определены программной парадигмой: процедурный подход, объектно-ориентированный
подход; и законами языка программирования.

Таким образом, моя программа - это эволюционирующие сущности данных и действий над ними по эволюционирующим законам взаимодействия. Это своего рода MVC модель
(Model-View-Cotrol). Определив какие-то сущности данных, их представление и обработку в программной среде, я должен определить законы взаимодействия этих
сущностей и другие "законы" моего мира.

Можно интерпретировать эти "законы мира" как какой-то набор библиотечных функций, базовых классов и т.п. Но законы должны быть достаточно универсальны и действовать
на широкий класс программно-данных сущностей мира. Не должно получиться так, что при добавлении сущности в мир, не находится ни одного закона к ней применимого.

Что должно быть в начале: закон или сущность, к которой он применим? Где реализуется закон: как часть сущности программы или данных?


