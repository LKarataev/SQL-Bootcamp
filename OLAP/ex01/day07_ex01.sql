SELECT
    (SELECT name FROM person WHERE person.id = pv.person_id),
    COUNT(pv.person_id) AS count_of_visits
FROM person_visits pv
GROUP BY pv.person_id
ORDER BY count_of_visits DESC, pv.person_id
LIMIT 4;