WITH cte AS
    (SELECT *
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu ON po.menu_id = menu.id
    WHERE p.gender = 'female')
SELECT c1.name AS "name"
FROM cte c1
    JOIN cte c2 ON c1.name = c2.name
        AND c1.pizza_name = 'pepperoni pizza'
        AND c2.pizza_name = 'cheese pizza'
ORDER BY name;