USE world;
SELECT DATABASE();
-- Napisz wyrażenie regularne, które sprawdzi zapis kodu pocztowego w postaci 08-110.
-- ^[0-9]{2}[-][0-9]{3}$
-- Napisz wyrażenie regularne, które sprawdzi poprawność zapisu emaila w postaci jan.kowalski@gmail.com.
-- ^[a-z]{1,10}\.[a-z]{1,10}\@[a-z]{1,5}\.[a-z]{2,3}$


-- Wykorzystując bazę danych ‘world’ wypisz nazwę i populację miast, których nazwy kończą się na literę ‘n’.
SELECT name, population FROM city WHERE name REGEXP 'n$';

-- Wykorzystując bazę danych ‘world’ wypisz języki, które zaczynają się na literę ‘H’.
SELECT language FROM countrylanguage WHERE countrylanguage.language REGEXP '^H';

-- Wykorzystując bazę danych ‘world’ wypisz nazwę miasta, którego ‘countrycode’ nie zaczyna się na ‘CH’.
SELECT countrycode, name FROM city WHERE countrycode NOT REGEXP '^CH';
