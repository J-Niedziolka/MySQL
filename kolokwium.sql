use chinook;

-- ZAD 1
SELECT track.name AS nazwa, track.Milliseconds AS 'czas trwania' FROM track ORDER BY milliseconds DESC LIMIT 1 OFFSET 2; 

-- ZAD 2
-- JAN NIEDZIÓŁKA
CREATE INDEX index_kolumn ON invoice(Total, Invoice);


-- ZAD 4
CREATE VIEW widok_gatunek AS 
SELECT track.* FROM track WHERE (track.genre = 'Rock' OR track.genre = 'Pop');

-- ZAD 5 
SELECT playlist.playlistId, playlist.name, COUNT(playlisttrack.trackid) FROM playlist JOIN playlisttrack ON
	playlist.playlistid = playlisttrack.playlistid GROUP BY playlisttrack.playlistid ORDER BY playlist.name;

-- ZAD 6
SELECT date('1999-12-24') AS URODZINY, date('2022-11-09') AS DZISIAJ, datediff(('2022-11-09'),('1999-12-24'));

-- ZAD 7
SELECT 'wielkości',
(CASE
	when track.bytes < 100000 
END) FROM track;


-- ZAD 8
SELECT track.name FROM track WHERE track.composer IS NULL;

-- ZAD 9
SELECT track.name FROM track WHERE track.name IN (SELECT track.name FROM track WHERE name LIKE 'P%');

-- ZAD 10
SELECT invoice.customerId FROM invoice WHERE SUM(invoice.total) < 40 GROUP BY invoice.customerId;


-- ZAD 11, OPERATOR UNION
-- ŁĄCZY DWIE TABLICE, MUSZĄ MIEĆ TYLE SAMO KOLUMN KTÓRYCH ODPOWIADAJĄCE SOBĄ RZĘDY MUSZĄ BYĆ TEGO SAMEGO TYPU, NP INTEGER-INTEGER, VARCHAR-VARCHAR ITD

