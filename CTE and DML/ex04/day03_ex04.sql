WITH
    cte_m AS (
        SELECT pz.name AS pizza_name
        FROM person_order po
            JOIN menu m ON m.id = po.menu_id
            JOIN pizzeria pz ON pz.id = m.pizzeria_id
            JOIN person p ON po.person_id = p.id
        WHERE p.gender = 'male'
    ),
    cte_f AS (
        SELECT pz.name AS pizza_name
        FROM person_order po
            JOIN menu m ON m.id = po.menu_id
            JOIN pizzeria pz ON pz.id = m.pizzeria_id
            JOIN person p ON po.person_id = p.id
        WHERE p.gender = 'female'
    ),
    cte_m_res AS (
        SELECT cte_m.pizza_name
        FROM cte_m
        EXCEPT
        SELECT cte_f.pizza_name
        FROM cte_f
    ),
    cte_f_res AS (
        SELECT cte_f.pizza_name
        FROM cte_f
        EXCEPT ALL
        SELECT cte_m.pizza_name
        FROM cte_m
    )
SELECT cte_m_res.pizza_name
FROM cte_m_res
UNION
SELECT cte_f_res.pizza_name
FROM cte_f_res
ORDER BY pizza_name;