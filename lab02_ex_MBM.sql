-- Załącznik do lab02

DROP DATABASE IF EXISTS organization;

CREATE DATABASE organization;

USE organization;

CREATE TABLE employees (
  id BIGINT,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  age INT,
  id_position BIGINT,
  salary DECIMAL(7,2),
  employment_date DATE,
  is_active BOOLEAN
);

CREATE TABLE positions (
  id BIGINT,
  pos_name VARCHAR(255)
);

CREATE TABLE departments (
  id BIGINT,
  dep_name VARCHAR(255),
  id_boss BIGINT
);

INSERT INTO positions (id, pos_name) VALUES 
  (1, 'manager'),
  (2, 'senior developer'),
  (3, 'developer'),
  (4, 'junior developer');

INSERT INTO employees (id, first_name, last_name, age, id_position, salary, employment_date, is_active) VALUES 
  (1, 'Jan', 'Kowalski', 57, 1, 12500.00, '1999-06-01', FALSE),
  (2, 'Adam', 'Adamski', 51, 1, 12000.00, '2002-03-01', TRUE),
  (3, 'Bartosz', 'Bartkowiak', 53, 1, 11500.00, '2000-10-01', TRUE),
  (4, 'Cezary', 'Czapla', 40, 2, 9200.00, '2005-02-01', TRUE),
  (5, 'Daniel', 'Drzymała', 48, 1, 13000.00, '2001-07-01', TRUE),
  (6, 'Emil', 'Emilewicz', 41, 2, 9000.00, '2006-06-15', TRUE),
  (7, 'Franciszek', 'Frankowski', 32, 3, 6500.00, '2010-10-01', FALSE),
  (8, 'Grzegorz', 'Gregorowski', 27, 4, 3000.00, '2015-06-01', TRUE),
  (9, 'Henryk', 'Heńkowski', 30, 3, 5700.00, '2012-08-01', TRUE),
  (10, 'Ignacy', 'Ignasiewicz', 22, 4, 3400.00, '2016-12-10', TRUE);

INSERT INTO departments (id, dep_name, id_boss) VALUES 
  (1, 'Reseach and Development', 3),
  (2, 'Human Resources', 5);
