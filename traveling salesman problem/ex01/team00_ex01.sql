WITH RECURSIVE cte_rec AS (
    SELECT
        point1 AS tour,
        point1,
        point2,
        cost AS total_cost
    FROM nodes
    WHERE point1 = 'a'
    UNION ALL
    SELECT
        CONCAT(current.tour,',',current.point2),
        next.point1,
        next.point2,
        current.total_cost + next.cost
    FROM nodes next
        JOIN cte_rec current ON current.point2 = next.point1
    WHERE
        tour NOT LIKE CONCAT('%', next.point1, '%')
),
total AS (
    SELECT total_cost, CONCAT('{', tour, ',a}') AS tour
    FROM cte_rec
    WHERE point2 = 'a' AND length(tour) = 7
)
SELECT *
FROM total
WHERE total_cost IN (
    (SELECT MIN(total_cost) FROM total),
    (SELECT MAX(total_cost) FROM total))
ORDER BY total_cost, tour;