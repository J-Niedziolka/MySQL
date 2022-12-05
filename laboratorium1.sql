CREATE DATABASE organizacja;

USE organizacja;

CREATE TABLE pracownicy
(id INTEGER,
imie VARCHAR(32),
nazwisko VARCHAR(32),
wiek INTEGER);

DROP table pracownicy;

CREATE TABLE pracownicy
(stanowisko VARCHAR(32),
pensja INTEGER,
data_zatrudnienia DATE,
czy_aktywny BOOLEAN);

ALTER TABLE pracownicy
	CHANGE COLUMN pensja pobory INTEGER,
    DROP COLUMN wiek;
    
DROP DATABASE organizacja;

CREATE DATABASE uczelnia;

CREATE TABLE kierunek
(id INTEGER,
nazwa VARCHAR(50));

CREATE TABLE student
(id INTEGER,
imie VARCHAR(32),
nazwisko VARCHAR(32));

ALTER TABLE student
	ADD COLUMN (nr_albumu INTEGER,
				kierunek VARCHAR(32),
                czy_ma_warunek_z_baz_danych BOOLEAN),
	CHANGE COLUMN czy_ma_warunek_z_baz_danych czy_zmienia_kierunek BOOLEAN,
	CHANGE COLUMN kierunek id_kierunku INTEGER;

/*
*/