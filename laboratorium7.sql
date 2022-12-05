USE sakila;

SELECT film.title, actor.first_name, actor.last_name FROM
film JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
ORDER BY film.title;

SELECT actor.first_name, actor.last_name, film.title FROM
actor JOIN film_actor ON actor.actor_id = film_actor.actor_id 
JOIN film ON film_actor.film_id = film.film_id;

SELECT A.actor_id, A.last_name, A.first_name, COUNT(FA.film_id) as LiczbaFilmow
	FROM actor A INNER JOIN film_actor FA ON A.actor_id = FA.actor_id
	GROUP BY A.actor_id, A.last_name, A.first_name;

SELECT city.city, country.country FROM
city JOIN country ON city.country_id = country.country_id
WHERE city.city LIKE 'P%';

-- zad5. inner join zwraca 0 rzędów a left join 1000 bo wszystkie filmy mają orig_lang = null więc z definicji
-- inner join odrzuca wszystkie z nich, a left join wyświetla wszystkie filmy mimo tego, że przy wszystkich stoi null
SELECT film.title, language.name FROM
film JOIN language ON film.original_language_id = language.language_id;
SELECT film.title, language.name FROM
film LEFT JOIN language ON film.original_language_id = language.language_id;

-- zad6.
SELECT payment.*, rental.rental_date FROM
payment RIGHT JOIN rental ON payment.rental_id = rental.rental_id;
SELECT payment.*, rental.rental_date FROM
payment LEFT JOIN rental ON payment.rental_id = rental.rental_id;

-- zad7.
SELECT film.* FROM film NATURAL JOIN film_text;

