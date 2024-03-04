WITH
    cte1 AS (
        SELECT
            user_id,
            "type",
            currency_id,
            SUM(money) AS volume
        FROM balance
        GROUP BY
            user_id,
            "type",
            currency_id
    ),
    cte2 AS (
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
    cte1.type
        AS type,
    cte1.volume
        AS volume,
    COALESCE(cte2.name, 'not defined')
        AS currency_name,
    COALESCE(cte2.rate_to_usd, 1)
        AS last_rate_to_usd,
    COALESCE(cte2.rate_to_usd, 1) * cte1.volume
        AS total_volume_in_usd
FROM cte1
    LEFT JOIN "user" u ON u.id = cte1.user_id
    LEFT JOIN cte2 ON cte2.id = cte1.currency_id
ORDER BY
    name DESC,
    lastname,
    type;
