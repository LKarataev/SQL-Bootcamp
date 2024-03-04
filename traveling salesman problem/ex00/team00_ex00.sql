CREATE TABLE nodes (
  point1 VARCHAR,
  point2 VARCHAR,
  cost INTEGER
);

INSERT INTO nodes VALUES
    ('a', 'b', 10),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('b', 'd', 25),
    ('c', 'a', 15),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'a', 20),
    ('d', 'b', 25),
    ('d', 'c', 30);

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
WHERE total_cost = (SELECT MIN(total_cost) FROM total)
ORDER BY total_cost, tour;

