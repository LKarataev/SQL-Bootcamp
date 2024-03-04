SELECT pz.name AS pizza_name
FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    JOIN person p ON pv.person_id = p.id
WHERE p.name = 'Andrey'
EXCEPT
SELECT pz.name AS pizza_name
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    JOIN person p ON po.person_id = p.id
WHERE p.name = 'Andrey'
ORDER BY pizza_name;