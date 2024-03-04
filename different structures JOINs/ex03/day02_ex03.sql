WITH cte1 AS (SELECT gs::DATE AS visit_date
FROM generate_series('2022-01-01', '2022-01-10', interval '1 day')
AS gs)
, cte2 AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id BETWEEN 1 AND 2
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
    )
SELECT DISTINCT cte1.visit_date AS missing_date
FROM cte1
LEFT JOIN cte2 ON cte1.visit_date = cte2.visit_date
WHERE cte2.visit_date IS NULL
ORDER BY cte1.visit_date;
