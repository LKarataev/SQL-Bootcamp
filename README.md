# SQL-Bootcamp

## Учебный проект для изучения основ SQL.

В этом проекте рассмотрены различные аспекты работы с реляционными базами данных на примере СУБД **PostgreSQL**:
- Способы объединения данных из нескольких таблиц с помощью **операций над множествами** (UNION, INTERSECT, EXCEPT) и простых **объединений** (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN).
- Более сложные структуры объединения данных с помощью **подзапросов**, **условий** (ON, USING, WHERE), **агрегатных функций** (GROUP BY, HAVING).
- Изменение данных с помощью языка **DML** (Data Manipulation Language), который включает в себя команды **INSERT**, **UPDATE** и **DELETE**.
- Использование **виртуальных представлений** (VIEW) и **физических снимков** (MATERIALIZED VIEW) данных, которые позволяют создавать логические слои над таблицами и оптимизировать производительность запросов.
- Как и когда создавать **индексы** в базе данных, которые ускоряют поиск данных по определенным столбцам или выражениям.
- Добавление новых **бизнес-функций**.
- Использование специфических **OLAP** (online analytical processing) конструкций.
- Процесс работы БД с **транзакциями** и **уровнями изоляции**, которые обеспечивают целостность, согласованность и надежность данных при одновременном доступе к ним.
- Создание и использование **функциональных блоков** в БД, такие как **процедуры**, **функции**, **триггеры** и **пакеты**, которые позволяют инкапсулировать и повторно использовать логику обработки данных.
- Что такое **DWH** (Data Warehouse) и как создать **ETL** (Extract, Transform, Load) процесс, который извлекает, преобразует и загружает данные из разных источников в единое хранилище для аналитических целей.
- Реализация быстрого решения **задачи коммивояжера** на SQL (поиск кратчайшего пути).


## Схема базы данных
![Schema](schema.png)
