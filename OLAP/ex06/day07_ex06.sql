SELECT
    (SELECT name FROM pizzeria WHERE id = m.pizzeria_id)
        AS name,
    COUNT(m.pizzeria_id)
        AS count_of_orders,
    ROUND(AVG(m.price), 2)
        AS average_price,
    MAX(m.price)
        AS max_price,
    MIN(m.price)
        AS min_price
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
GROUP BY m.pizzeria_id
ORDER BY name;
