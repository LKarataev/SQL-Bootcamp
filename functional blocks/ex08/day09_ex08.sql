CREATE FUNCTION fnc_fibonacci(pstop INTEGER = 10)
RETURNS TABLE (num INTEGER) AS
$body$
    WITH RECURSIVE FIBONACCI(a, b) AS (
        SELECT 0,
               1
        UNION ALL
        SELECT b,
               a + b
        FROM FIBONACCI
        WHERE b < pstop
    )
    SELECT a
    FROM FIBONACCI;
$body$ LANGUAGE sql;

SELECT *
FROM fnc_fibonacci();

SELECT *
FROM fnc_fibonacci(100);
