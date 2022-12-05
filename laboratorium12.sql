CREATE DATABASE sklep;
use sklep;

CREATE TABLE produkty(
id INTEGER PRIMARY KEY AUTO_INCREMENT,
nazwa VARCHAR(50),
cena INTEGER,
kod VARCHAR(100),
ilość INTEGER,
ostatnia_data_dostawy DATE
);

SET autocomit = 0;
BEGIN;

SELECT * FROM produkty;

INSERT INTO produkty VALUES
('towar', 100, 'kod-10', 30, '2022-01-01'),
('jedzenie', 5, 'kod-11', 1000, '2022-09-09'),
('napoje', 7, 'kod-12', 400, '2022-05-05'),
('pieczywo', 2, 'kod-13', 70, '2022-10-10'),
('prasa', 7, 'kod-14', 60, '2022-10-10');
COMMIT;

SELECT * FROM produkty;

-- ZADANIE 2
BEGIN;
SELECT * FROM produkty;
DELETE FROM produkty WHERE id = 1;
UPDATE produkty SET cena = 3 WHERE nazwa = 'pieczywo';
SAVEPOINT sp1;
INSERT INTO produkty VALUES 
	('owoce', 10, 'kod-15', 100, '2022-10-09'),
	('warzywa', 8, 'kod-16', 100, '2022-10-09');
    
SELECT * FROM produkty;
ROLLBACK TO savepoint sp1;
SELECT * FROM produkty;
UPDATE produkty SET nazwa = 'chleb i bułki' WHERE nazwa = 'pieczywo';

COMMIT;
SELECT * FROM produkty;
