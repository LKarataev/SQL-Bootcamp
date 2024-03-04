CREATE FUNCTION fnc_person_visits_and_eats_on_date (
    pperson VARCHAR = 'Dmitriy',
    pprice NUMERIC = 500,
    pdate DATE = DATE '2022-01-08'
)
RETURNS TABLE (name VARCHAR) AS
$body$
    SELECT DISTINCT pz.name
    FROM person_order po
        JOIN person_visits pv
            ON po.person_id = pv.person_id
            AND po.order_date = pv.visit_date
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pz ON pz.id = pv.pizzeria_id
        JOIN person p ON p.id = po.person_id
    WHERE p.name = pperson
        AND m.price < pprice
        AND pv.visit_date = pdate
$body$ LANGUAGE sql;

SELECT *
FROM fnc_person_visits_and_eats_on_date (
    pprice := 800
);

SELECT *
FROM fnc_person_visits_and_eats_on_date (
    pperson := 'Anna',
    pprice := 1300,
    pdate := '2022-01-01'
);
