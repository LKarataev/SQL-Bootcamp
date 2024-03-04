CREATE FUNCTION fnc_persons_female()
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
    WHERE gender = 'female'
$body$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male()
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
    WHERE gender = 'male'
$body$ LANGUAGE sql;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();
