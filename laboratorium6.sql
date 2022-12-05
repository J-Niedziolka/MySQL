USE sakila;

-- Podaj w jakiej ilości filmów grał każdy aktor.
SELECT actor.actor_id, actor.last_name, actor.first_name, COUNT(film_actor.film_id) AS 'Liczba filmów'
	FROM actor, film_actor WHERE actor.actor_id = film_actor.actor_id
    GROUP BY actor.actor_id, actor.last_name, actor.first_name;

-- Wypisz nazwy miast na literę ‘p’ i nazwy państw, w których się znajdują.
SELECT city.city, country.country
	FROM city, country WHERE city.city
    LIKE 'p%' AND city.country_id = country.country_id;

-- Wypisz ilość filmów z ratigiem PG, G, NC-17.
SELECT rating, COUNT(rating) FROM Film WHERE rating IN('PG', 'G', 'NC-17') GROUP BY rating;

-- Wypisz tytuł najdłużej trwającego filmu.
select title, length FROM film WHERE length = (SELECT MAX(length) FROM film);

-- Wypisz użytkowników z państwa "Brazil".
SELECT cus.last_name, cus.first_name, c.country
	FROM customer AS cus, address AS ad, city, country AS c
	WHERE c.country = 'Brazil'
	AND (cus.address_id = ad.address_id AND ad.city_id = city.city_id AND city.country_id = c.country_id);

-- Podaj państwo, które ma najmniejszą ilość użytkowników.
-- customer -> address -> city -> country
SELECT c.country, COUNT(cus.customer_id) FROM address AS ad, city, country AS c, customer AS cus
	WHERE cus.address_id = ad.address_id AND ad.city_id = city.city_id AND city.country_id = c.country_id LIMIT 1;
SELECT country.country, COUNT(customer.customer_id) AS users FROM country, city, address, customer WHERE
country.country_id = city.country_id AND city.city_id = address.city_id AND address.address_id = customer.address_id
GROUP BY country;

-- Wypisz średnie utargi wypożyczalni.
SELECT AVG(payment.amount), store.store_id
	FROM payment, rental, staff, store
	WHERE payment.rental_id = rental.rental_id AND rental.staff_id = staff.staff_id AND staff.store_id = store.store_id
	GROUP BY store.store_id;

-- Wypisz użytkownika z największą liczbą płatności i średnią kwotę płatności.
SELECT customer.last_name, customer.first_name, AVG(payment.amount), COUNT(payment.amount)
	FROM customer, payment
	WHERE payment.customer_id = customer.customer_id
	GROUP BY customer.customer_id
	ORDER BY COUNT(payment.amount) DESC LIMIT 1;

-- 9 Wypisz ile każdy z użytkowników łącznie zapłacił.
SELECT customer.customer_id, customer.last_name, customer.first_name, SUM(payment.amount) AS 'łącznie zapłacił'
FROM customer, payment WHERE payment.customer_id = customer.customer_id
GROUP BY customer.customer_id ORDER BY SUm(customer.customer_id);

-- 10 Wypisz ile trwa najdłuższy, najkrótszy i średni film.
SELECT max(fiLm.length) AS 'Najdłuższy film trwa:',
		MIN(film.length) AS 'Najkrótszy film trwa:',
        AVG(film.length) AS 'Średni czas filmu:'
FROM film;

-- 11 Wypisz imiona i nazwiska aktorów i tytuły filmów w jakich grali.
SELECT actor.first_name, actor.last_name, film.title
FROM actor, film, film_actor
WHERE film_actor.actor_id = actor.actor_id AND fiLm_actor.film_Id = film.film_Id;

-- Wypisz imię i nazwisko użytkownika z ulicą przy której mieszka.
SELECT customer.first_name, customer.last_Name, address.address
FROM customer, address
WHERE customer.address_id = address.address_id;

