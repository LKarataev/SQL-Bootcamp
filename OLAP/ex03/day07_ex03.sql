WITH cte_1 AS
(
    SELECT
        pv.pizzeria_id AS id,
        COUNT(pv.pizzeria_id) AS cnt
    FROM person_visits pv
    GROUP BY pv.pizzeria_id
),
cte_2 AS
(
    SELECT
        m.pizzeria_id AS id,
        COUNT(m.pizzeria_id) AS cnt
    FROM person_order po
        LEFT JOIN menu m ON m.id = po.menu_id
    GROUP BY m.pizzeria_id
)
SELECT
    pz.name,
    COALESCE(cte_1.cnt, 0) + COALESCE(cte_2.cnt, 0) AS total_count
FROM pizzeria pz
    LEFT JOIN cte_1 ON cte_1.id = pz.id
    LEFT JOIN cte_2 ON cte_2.id = pz.id
ORDER BY total_count DESC, pz.name;
