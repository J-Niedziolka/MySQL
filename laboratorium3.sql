CREATE DATABASE kadry;

CREATE TABLE locations
(location_id INT(11) PRIMARY KEY,
street_address VARCHAR(40),
postal_cole VARCHAR(12),
city VARCHAR(30) NOT NULL,
state_province VARCHAR(25),
country_id CHAR(2),
FOREIGN KEY (country_id) REFERENCES countries(country_id));

CREATE TABLE countries
(country_id CHAR(2) PRIMARY KEY,
contry_name VARCHAR(40),
region_id int(11), FOREIGN KEY(region_id) REFERENCES region(region_id));

CREATE TABLE regions
(region_id INT(11) PRIMARY KEY,
region_name VARCHAR(25));

CREATE TABLE departments
(department_id INT(11) PRIMARY KEY,
department_name VARCHAR(30) NOT NULL,
manager_id INT(11),
location_id INT(11),
FOREIGN KEY (location_id) REFERENCES locations(location_id));

CREATE TABLE job_history
(start_date DATE NOT NULL,
end_date DATE NOT NULL,
employee_id INT(11), 
job_id VARCHAR(10),
department_id INT(11),
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (employee_id) REFERENCES employees(employee_id), 
FOREIGN KEY (job_id) REFERENCES jobs(job_id));

CREATE TABLE jobs
(job_id VARCHAR(10) PRIMARY KEY,
job_title VARCHAR(35) NOT NULL,
min_salary DECIMAL(8, 0),
max_salary DECIMAL(8, 0));

CREATE TABLE employees
(employee_id INT(11) PRIMARY KEY,
first_name VARCHAR(20),
last_name VARCHAR(25) NOT NULL,
email VARCHAR(25) NOT NULL,
phone_number VARCHAR(20),
hire_date DATE NOT NULL,
job_id VARCHAR(10), 
FOREIGN KEY (job_id) REFERENCES jobs(job_id),
salary DECIMAL(8, 2) NOT NULL,
comission_pct DECIMAL(2, 2),
manager_id INT(11),
department_id INT(11));

INSERT INTO jobs VALUES (1, 'Prezes', 20000, 40000);
INSERT INTO regions VALUES (1, 'Ameryka Płn i Płd');
INSERT INTO countries VALUES (1, 'USA', 1);
INSERT INTO locations VALUES (1, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 1);
INSERT INTO departments VALUES (1, 'Kierownictwo', null, 1);
INSERT INTO employees VALUES (100, 'Steven', 'King', 'SKING', '5151234567', '1987-6-17', 1, 24000, null, null, 1);
UPDATE departments SET manager_id = 100 WHERE department_id <=> 1;

INSERT INTO jobs VALUES (2, 'Zastępca', 20000, 40000);
INSERT INTO regions VALUES (2, 'Europa');
INSERT INTO countries VALUES (2, 'Polska', 2);
INSERT INTO locations VALUES (2, 'Sobieskiego', '00-001', 'Warszawa', 'Mazowieckie', 2);
INSERT INTO departments VALUES (2, 'Finansów', 100, 2);
INSERT INTO employees VALUES (3, 'Jan', 'Kowalski', 'JKow', '1234567891', '2012-1-10', 2, 30000, 0.55, 100, 1);
INSERT INTO job_history VALUES (1, '2012-1-10', '2022-1-1', 2, 1);

ALTER TABLE countries CHANGE COLUMN region_id id_regionu integer(11);

CREATE TABLE adres
(id_adres INT(11) PRIMARY KEY,
ulica VARCHAR(30),
nr_domu VARCHAR(30),
miasto VARCHAR(30),
kod_pocztowy VARCHAR(10));