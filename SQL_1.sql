-- Active: 1712926247616@@127.0.0.1@3306@gcos_advance_sql_1

--- SQL QUERIES ---

-- We will create the tables in the picture file, data base diagram --
-- Use database gcos_advance_sql_1 --
-- Here I am using MYSQL server not SQL server, Some thing is different --

-- 1) The jobs table stores the job data including job title and salary range --
-- Here MYSQL server is using AUTO_INCREMENT, SQL server IDENTITY(1,1), PostgreSQL SERIAL
-- Those means are auto increment
-- Decimal(8,2) => Total 8 digits, 6 digits on left, 2 digits on right => 123456,78
-- MYSL and SQL server is the same Decimal(8,2), for postgresql is NUMERIC(8,2)

-- jobs, regions, countries, 
CREATE TABLE jobs (
    job_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    job_title VARCHAR(35) NOT NULL,
    min_salary DECIMAL(8,2) DEFAULT NULL,
    max_salary DECIMAL(8,2) DEFAULT NULL
)

-- 2) regions table stores the data of regions such as Asia, Europe, America, Middle East, Africa. The countries are grouped in regions. 

CREATE TABLE regions(
    region_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    region_name VARCHAR(25) DEFAULT NULL
)

-- 3) countries table stores tha data of countries where the company is doing business. 
-- FOREIGN KEY is a field in one table, that refers to the PRIMARY KEY in another table
-- The table with the foreign key is called the child table, and the table with the primary key is called the referenced or parent table


CREATE TABLE countries(
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id INT(11) NOT NULL,
    FOREIGN KEY(region_id) REFERENCES regions (region_id) ON DELETE CASCADE ON UPDATE CASCADE
)

-- 4) locations table stores the locations of the departments of the company

CREATE TABLE locations(
    location_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    street_address VARCHAR(40) DEFAULT NULL,
    postal_code VARCHAR(12) DEFAULT NULL,
    city VARCHAR(30) NOT NULL,
    state_province VARCHAR(25) DEFAULT NULL,
    country_id CHAR(2) NOT NULL,
    FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE ON UPDATE CASCADE
)

-- 5) departments table stores department data

CREATE TABLE departements (
    department_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL,
    location_id INT(11) DEFAULT NULL,
    FOREIGN KEY(location_id) REFERENCES locations(location_id) ON DELETE CASCADE ON UPDATE CASCADE
)


-- 6) employees table stores the data of employees
-- Here job_id comes from the jobs table, so we referenced it. 
-- ON DELETE CASCADE means that if tghe parent record is deleted, any child records are also deleted.
-- ON UPDATE CASCADE means that if the parent primary key is changed, the child value will also change to reflect that.

CREATE TABLE employees (
    employee_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(25) DEFAULT NULL,
    last_name VARCHAR(25) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id INT NOT NULL,
    salary DECIMAL(8,2) NOT NULL,
    manager_id INT(11) DEFAULT NULL,
    department_id INT(11) DEFAULT NULL,
    FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (department_id) REFERENCES departements (department_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
)


-- 7) dependents table stores the employe's dependents

CREATE TABLE dependents(
    dependent_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    relationship VARCHAR(25) NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE ON UPDATE CASCADE
)