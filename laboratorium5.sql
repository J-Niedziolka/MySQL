SHOW databases;
use Chinook;

SELECT Name FROM MediaType;
SELECT LastName, FirstName FROM Employee WHERE EmployeeId < 10;
SELECT LastName, FirstName FROM Customer ORDER BY LastName DESC;
SELECT Name FROM Genre WHERE Name LIKE 'r%';
SELECT Name FROM Artist WHERE Name LIKE '%s' OR Name LIKE '%t';
SELECT Bytes FROM Track WHERE Bytes BETWEEN 1000000 AND 2000000;
SELECT Title FROM Album ORDER BY Title LIMIT 10;
SELECT FirstName, LastName, BirthDate, HireDate 
		FROM Employee WHERE BirthDate LIKE '1973%' OR BirthDate < '1960%';
SELECT FirstName FROM Employee WHERE BirthDate > '1960%' AND City = 'Lethbridge';
SELECT * FROM Track WHERE GenreID = 9;
SELECT Name FROM Track WHERE Composer = NULL;
SELECT Name FROM Track ORDER BY Milliseconds DESC LIMIT 1 OFFSET 4;