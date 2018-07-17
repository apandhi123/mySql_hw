Use sakila;

SELECT 
    staff.first_name,
    staff.last_name,
    SUM(payment.amount) Total,
    payment_date
FROM
    staff
        INNER JOIN
    payment ON payment.staff_id = staff.staff_id
WHERE
    payment.payment_date LIKE '%-08-%'
GROUP BY staff.first_name , staff.last_name;

SELECT 
    film.title, COUNT(film_actor.actor_id) AS 'Number of actors'
FROM
    film
        INNER JOIN
    film_actor ON film.film_id = film_actor.film_id
GROUP BY film.title;

SELECT 
    film.title AS 'Title',
    COUNT(inventory.inventory_id) AS 'Number of copies'
FROM
    film
        INNER JOIN
    inventory ON film.film_id = inventory.film_id
WHERE
    film.title = 'Hunchback Impossible';

SELECT 
    category.name AS GENERES,
    SUM(payment.amount) AS 'GROSS REVENUE'
FROM
    payment
        JOIN
    rental ON payment.rental_id = rental.rental_id
        JOIN
    inventory ON inventory.inventory_id = rental.inventory_id
        JOIN
    film_category ON film_category.film_id = inventory.film_id
        JOIN
    category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY SUM(payment.amount) DESC
LIMIT 5;


CREATE VIEW TOP_FIVE_GENRES_BY_GROSS_RVENUE AS
    SELECT 
        category.name AS GENERES,
        SUM(payment.amount) AS 'GROSS REVENUE'
    FROM
        payment
            JOIN
        rental ON payment.rental_id = rental.rental_id
            JOIN
        inventory ON inventory.inventory_id = rental.inventory_id
            JOIN
        film_category ON film_category.film_id = inventory.film_id
            JOIN
        category ON category.category_id = film_category.category_id
    GROUP BY category.name
    ORDER BY SUM(payment.amount) DESC
    LIMIT 5;

SELECT 
    *
FROM
    TOP_FIVE_GENRES_BY_GROSS_RVENUE;






