WITH
    pz1 AS (
        SELECT
            menu.pizza_name,
            pizzeria.name,
            menu.price
        FROM pizzeria
            JOIN menu ON pizzeria.id = menu.pizzeria_id
    ),
    pz2 AS (
        SELECT
            menu.pizza_name,
            pizzeria.name,
            menu.price
        FROM pizzeria
            JOIN menu ON pizzeria.id = menu.pizzeria_id
    )
SELECT
    pz1.pizza_name AS pizza_name,
    pz1.name AS pizzeria_name_1,
    pz2.name AS pizzeria_name_2,
    pz1.price AS price
FROM pz1
    JOIN pz2 ON pz1.pizza_name = pz2.pizza_name
WHERE
    pz1.name < pz2.name
    AND pz1.price = pz2.price
ORDER BY pizza_name;