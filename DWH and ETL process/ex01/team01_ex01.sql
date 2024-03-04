insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH cte1 AS (
        SELECT *
        FROM currency c
        WHERE updated =
            (
                SELECT MAX(updated)
                FROM currency
                WHERE id = c.id
            )
    )
SELECT
    COALESCE(u.name, 'not defined')
        AS name,
    COALESCE(u.lastname, 'not defined')
        AS lastname,
    cte1.name
        AS currency_name,
    CASE
        WHEN
            (
                SELECT MAX(updated)
                FROM currency
                WHERE id = b.currency_id
                    AND updated < b.updated
            )
            IS NOT NULL
        THEN b.money *
            (
                SELECT rate_to_usd
                FROM currency
                WHERE id = b.currency_id
                    AND updated =
                        (
                            SELECT MAX(updated)
                            FROM currency
                            WHERE id = b.currency_id
                                AND updated < b.updated
                        )
            )
        ELSE b.money *
            (
                SELECT rate_to_usd
                FROM currency
                WHERE id = b.currency_id
                    AND updated =
                        (
                            SELECT MIN(updated)
                            FROM currency
                            WHERE id = b.currency_id
                                AND updated > b.updated
                        )
            )
    END currency_in_usd
FROM balance b
    LEFT JOIN "user" u on u.id = b.user_id
    LEFT JOIN cte1 ON cte1.id = b.currency_id
WHERE cte1.name IS NOT NULL
ORDER BY name DESC, lastname, currency_name;
