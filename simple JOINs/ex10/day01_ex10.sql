SELECT pr.name AS person_name,
       m.pizza_name AS pizza_name,
       pz.name AS pizzeria_name
FROM person_order po
    JOIN person pr on pr.id = po.person_id
    JOIN menu m on m.id = po.menu_id
    JOIN pizzeria pz on m.pizzeria_id = pz.id
ORDER BY person_name, pizza_name, pizzeria_name