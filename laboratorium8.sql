use sakila;

SELECT film.title FROM film WHERE film.language_id IN (SELECT language.language_id FROM language WHERE language.name LIKE ('E%'));

SELECT COUNT(payment.amount) FROM payment WHERE payment.amount > (SELECT AVG(payment.amount) FROM payment);


USE classicmodels;
-- SELECT DATABASE();
SELECT MIN(utarg), MAX(utarg) FROM (SELECT SUM(amount) AS utarg FROM payments GROUP BY paymentDate) AS dzienny_utarg;

SELECT MAX(produkt) AS produkty FROM (SELECT COUNT(productCode) AS produkt FROM products GROUP BY productVendor) AS liczba_produktow_vendora; 

SELECT employees.* FROM employees;

UPDATE employees SET employees.jobTitle = 'Tester'
WHERE employees.officeCode IN (SELECT offices.officeCode FROM offices WHERE offices.country = 'USA');
SELECT employees.* FROM employees;


USE chinook;
-- playlist -> playlisttrack -> track
-- playlist.name AS name, SUM(piosenki) AS dlugosc
-- ALTER TABLE playlist ADD dlugosc INT NOT NULL;
SELECT Nazwa AS 'Nazwa najdłuższej playlisty', MAX(dlugosc) AS 'długość' FROM (SELECT playlist.Name AS 'Nazwa', COUNT(track.Name) AS dlugosc 
FROM ((playlist INNER JOIN playlisttrack ON playlisttrack.PlaylistId = playlist.PlaylistId) 
	INNER JOIN track on playlisttrack.TrackId = track.TrackId) GROUP BY playlist.PlaylistId) AS info;