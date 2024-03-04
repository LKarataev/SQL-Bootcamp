CREATE VIEW v_price_with_discount AS (
    SELECT
        p.name,
        m.pizza_name,
        m.price,
        ROUND(m.price * 0.9) AS discount_price
    FROM person_order po
        JOIN person p ON p.id = po.person_id
        JOIN menu m on po.menu_id = m.id
    ORDER BY p.name, m.pizza_name
);