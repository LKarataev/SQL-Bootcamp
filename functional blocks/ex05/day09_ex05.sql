CREATE FUNCTION fnc_persons(pgender VARCHAR = 'female')
RETURNS TABLE (
    id BIGINT,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
) AS
$body$
    SELECT *
    FROM person
    WHERE gender = pgender
$body$ LANGUAGE sql;

SELECT *
FROM fnc_persons(pgender := 'male');

SELECT *
FROM fnc_persons();
