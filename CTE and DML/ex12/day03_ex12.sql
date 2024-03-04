INSERT INTO person_order (
    id,
    person_id,
    menu_id,
    order_date
    )
SELECT gen_n.id,
       p_n.id,
       (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
       DATE '2022-02-25'
FROM
    (
        SELECT row_number () OVER (ORDER BY id) AS num,
        id
        FROM person
    ) p_n
    JOIN (
        SELECT row_number () OVER (ORDER BY id) AS num,
        id
        FROM generate_series(
            (SELECT MAX(id) FROM person_order)
                + 1,
            (SELECT MAX(id) FROM person_order)
                + (SELECT COUNT(*) FROM person)
        ) AS series(id)
    ) gen_n
    ON p_n.num = gen_n.num;