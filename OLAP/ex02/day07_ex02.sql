WITH cte_1 AS
(
    SELECT
        pv.pizzeria_id AS id,
        COUNT(pv.pizzeria_id) AS amount
    FROM person_visits pv
    GROUP BY pv.pizzeria_id
),
cte_2 AS
(
    SELECT
        m.pizzeria_id AS id,
        COUNT(m.pizzeria_id) AS amount
    FROM person_order po
        LEFT JOIN menu m ON m.id = po.menu_id
    GROUP BY m.pizzeria_id
)
(
    SELECT
        (SELECT name FROM pizzeria WHERE id = cte_1.id),
        cte_1.amount AS count,
        'visit' AS action_type
    FROM cte_1
    ORDER BY count DESC
    LIMIT 3
) UNION (
    SELECT
        (SELECT name FROM pizzeria WHERE id = cte_2.id),
        cte_2.amount AS count,
        'order' AS action_type
    FROM cte_2
    ORDER BY count DESC
    LIMIT 3
)
ORDER BY action_type, count DESC;