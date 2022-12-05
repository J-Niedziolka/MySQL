SELECT HOUR(curtime()), DAYNAME(curtime());

-- select month(curtime()), year(curtime());
SELECT CONCAT( (SELECT MONTH(curtime())), '.',  (SELECT YEAR(curtime()))) AS 'miesac.rok';
SELECT DATE_FORMAT(curdate(), '%c.%Y') AS 'miesiac.rok';

SELECT STR_TO_DATE("2004-05-01","%Y-%m-%d") AS 'data';

SELECT 'Niedziółka' as Nazwisko, length('Niedziółka') as Dlugosc;

SELECT REVERSE('Jan Niedziółka');

SELECT SIN(90) AS 'sin(pi/2)', CEIL(SIN(180)) AS 'ceil', FLOOR(SIN(180)) AS 'floor';
SELECT CEIL((SELECT SIN(180))) AS 'ceil z podzapytaniem';
SELECT FLOOR((SELECT SIN(180))) AS 'floor z podzapytaniem';


SELECT ROUND(1.234567, 4);

SELECT DATEDIFF((SELECT curdate()), '1999-12-24') AS 'moj wiek w dniach'; 

SELECT FLOOR((SELECT DATEDIFF((SELECT curdate()), '1999-12-24'))/365) AS 'moj wiek';