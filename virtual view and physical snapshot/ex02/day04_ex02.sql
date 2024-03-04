CREATE VIEW v_generated_dates AS
    SELECT dates::DATE AS generated_date
    FROM generate_series(
            DATE '2022-01-01',
            DATE '2022-01-31',
            '1 day'
        ) AS dates;