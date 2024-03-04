INSERT INTO person_discounts
SELECT
    ROW_NUMBER() OVER () AS id,
    po.person_id,
    m.pizzeria_id,
    CASE COUNT(person_id)
        WHEN 1 THEN 10.5
        WHEN 2 THEN 22
        ELSE 30
    END discount
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY po.person_id, m.pizzeria_id;
