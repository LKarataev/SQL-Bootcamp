SELECT a.*
FROM (SELECT name AS object_name
FROM person
ORDER BY object_name) a
UNION ALL
SELECT b.*
FROM (SELECT pizza_name AS object_name
FROM  menu
ORDER BY object_name) b
