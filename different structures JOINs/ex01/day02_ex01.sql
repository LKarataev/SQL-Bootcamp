SELECT DISTINCT pv1.visit_date AS missing_date
FROM person_visits pv1
    LEFT JOIN (
        SELECT visit_date
        FROM person_visits
        WHERE person_id BETWEEN 1 AND 2
            AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
        ) pv2 ON pv1.visit_date = pv2.visit_date
WHERE pv2.visit_date IS NULL
ORDER BY pv1.visit_date;