USE classicmodels;

SELECT CURRENT_USER() AS 'użytkownik', DATABASE() AS 'baza danych';

SELECT customerNumber, checkNumber, paymentDate, amount,
( CASE
	WHEN amount < 5000 then 'mała ktowa'
    WHEN amount >= 5000 AND amount < 20000 THEN 'średnia kwota'
    WHEN amount >= 20000 AND amount < 50000 THEN 'duża kwota'
    ELSE 'kwota poza zakresem'
END) AS info FROM payments;

SELECT CONCAT(firstName, ' ', lastName) AS 'pracownik', COALESCE(reportsTo, 'brak') AS 'przełożony' FROM employees;
SELECT CONCAT(firstName, ' ', lastName) AS 'pracownik', IFNULL(reportsTo, 'brak') AS 'przełożony' FROM employees;

-- from orderdetails
SELECT orderNumber, productCode, quantityOrdered,
	IF(quantityOrdered < 30, 'OK', 'Zapytaj w hurtowni') AS 'status' FROM orderdetails;
SELECT orderNumber, productCode, quantityOrdered,
( CASE
	WHEN quantityOrdered < 30 then 'OK'
    ELSE 'Zapytaj w hurtowni'
END ) AS 'status' FROM orderdetails;