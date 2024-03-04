SELECT
    CASE
        WHEN p.name IS NOT NULL
        THEN p.name
        ELSE '-'
        END person_name,
    pv.visit_date,
    CASE
        WHEN pz.name IS NOT NULL
        THEN pz.name
        ELSE '-'
        END pizzeria_name
FROM person p
    LEFT JOIN person_visits pv ON p.id = pv.person_id
        AND pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    FULL OUTER JOIN pizzeria pz ON pz.id = pv.pizzeria_id
ORDER BY person_name, visit_date, pizzeria_name;