SELECT p.name AS name,
    m.pizza_name,
    m.price,
    CASE
        WHEN pd.discount IS NOT NULL
        THEN ROUND(m.price * (1 - pd.discount * 0.01))
        ELSE m.price
    END discount_price,
    pz.name AS pizzeria_name
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
    LEFT JOIN person_discounts pd ON p.id = pd.person_id
                             AND pz.id = pd.pizzeria_id
ORDER BY p.name, m.pizza_name;