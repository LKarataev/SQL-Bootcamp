SELECT order_date,
       CONCAT(person2.name, ' (age:', person2.age, ')')
           AS person_information
FROM person_order NATURAL JOIN
    (SELECT name, age, id AS person_id FROM person) person2
ORDER BY order_date, person_information