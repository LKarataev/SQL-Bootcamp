SELECT
    (SELECT address FROM person WHERE id = po.person_id)
        AS address,
    (SELECT name FROM pizzeria WHERE id = m.pizzeria_id)
        AS name,
    count(*)
        AS count_of_orders
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
GROUP BY address, name
ORDER BY address, name;