CREATE VIEW v_symmetric_union AS (
    WITH
        R AS (
            SELECT person_id
            FROM person_visits
            WHERE visit_date = DATE '2022-01-02'
        ),
        S AS (
            SELECT person_id
            FROM person_visits
            WHERE visit_date = DATE '2022-01-06'
        ),
        R_S AS (
            SELECT *
            FROM R
            EXCEPT
            SELECT *
            FROM S
        ),
        S_R AS (
            SELECT *
            FROM S
            EXCEPT
            SELECT *
            FROM R
        )
    SELECT *
    FROM R_S
    UNION
    SELECT *
    FROM S_R
    ORDER BY person_id
);