SELECT p.name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu ON po.menu_id = menu.id
WHERE p.gender = 'male'
    AND p.address IN ('Samara', 'Moscow')
    AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC;