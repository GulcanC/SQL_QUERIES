-- Active: 1712926247616@@127.0.0.1@3306@gcos_advance_sql_1
---- https://www.sqltutorial.org/sql-sample-database/
--- SQL QUERIES ---

-- We will create the tables in the picture file, data base diagram, We have 7 tables, they are related with each other --
-- Use database gcos_advance_sql_1 --
-- Here I am using MYSQL server not SQL server, Some things are different --

/* CREATE TABLE => jobs, region, countries, */

-- 1) The jobs table stores the job data including job title and salary range --
-- Here MYSQL server is using AUTO_INCREMENT, SQL server IDENTITY(1,1), PostgreSQL SERIAL
-- Those means are auto increment
-- Decimal(8,2) => Total 8 digits, 6 digits on left, 2 digits on right => 123456,78
-- MYSL and SQL server is the same Decimal(8,2), for postgresql is NUMERIC(8,2)

-- jobs, regions, countries, locations, departements, employees, dependents 
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

/* INSERT INTO TABLE */

-- jobs, regions, countries, locations, departements, employees, dependents 

--- jobs ---

INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (1,'Public Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (2,'Accounting Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (3,'Administration Assistant',3000.00,6000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (4,'President',20000.00,40000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (5,'Administration Vice President',15000.00,30000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (6,'Accountant',4200.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (7,'Finance Manager',8200.00,16000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (8,'Human Resources Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (9,'Programmer',4000.00,10000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (10,'Marketing Manager',9000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (11,'Marketing Representative',4000.00,9000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (12,'Public Relations Representative',4500.00,10500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (13,'Purchasing Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (14,'Purchasing Manager',8000.00,15000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (15,'Sales Manager',10000.00,20000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (16,'Sales Representative',6000.00,12000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (17,'Shipping Clerk',2500.00,5500.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (18,'Stock Clerk',2000.00,5000.00);
INSERT INTO jobs(job_id,job_title,min_salary,max_salary) VALUES (19,'Stock Manager',5500.00,8500.00);

--- regions ---

INSERT INTO regions(region_id,region_name) VALUES (1,'Europe');
INSERT INTO regions(region_id,region_name) VALUES (2,'Americas');
INSERT INTO regions(region_id,region_name) VALUES (3,'Asia');
INSERT INTO regions(region_id,region_name) VALUES (4,'Middle East and Africa');

--- countries ---

INSERT INTO countries(country_id,country_name,region_id) VALUES ('AR','Argentina',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('AU','Australia',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BE','Belgium',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('BR','Brazil',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CA','Canada',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CH','Switzerland',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('CN','China',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DE','Germany',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('DK','Denmark',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('EG','Egypt',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('FR','France',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('HK','HongKong',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IL','Israel',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IN','India',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('IT','Italy',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('JP','Japan',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('KW','Kuwait',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('MX','Mexico',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NG','Nigeria',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('NL','Netherlands',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('SG','Singapore',3);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('UK','United Kingdom',1);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('US','United States of America',2);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZM','Zambia',4);
INSERT INTO countries(country_id,country_name,region_id) VALUES ('ZW','Zimbabwe',4);

--- locations ---

INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1400,'2014 Jabberwocky Rd','26192','Southlake','Texas','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1500,'2011 Interiors Blvd','99236','South San Francisco','California','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1700,'2004 Charade Rd','98199','Seattle','Washington','US');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (1800,'147 Spadina Ave','M5V 2L7','Toronto','Ontario','CA');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2400,'8204 Arthur St',NULL,'London',NULL,'UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2500,'Magdalen Centre, The Oxford Science Park','OX9 9ZB','Oxford','Oxford','UK');
INSERT INTO locations(location_id,street_address,postal_code,city,state_province,country_id) VALUES (2700,'Schwanthalerstr. 7031','80925','Munich','Bavaria','DE');

--- departements ---

INSERT INTO departements(department_id,department_name,location_id) VALUES (1,'Administration',1700);
INSERT INTO departements(department_id,department_name,location_id) VALUES (2,'Marketing',1800);
INSERT INTO departements(department_id,department_name,location_id) VALUES (3,'Purchasing',1700);
INSERT INTO departements(department_id,department_name,location_id) VALUES (4,'Human Resources',2400);
INSERT INTO departements(department_id,department_name,location_id) VALUES (5,'Shipping',1500);
INSERT INTO departements(department_id,department_name,location_id) VALUES (6,'IT',1400);
INSERT INTO departements(department_id,department_name,location_id) VALUES (7,'Public Relations',2700);
INSERT INTO departements(department_id,department_name,location_id) VALUES (8,'Sales',2500);
INSERT INTO departements(department_id,department_name,location_id) VALUES (9,'Executive',1700);
INSERT INTO departements(department_id,department_name,location_id) VALUES (10,'Finance',1700);
INSERT INTO departements(department_id,department_name,location_id) VALUES (11,'Accounting',1700);

--- employees ---

INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (100,'Steven','King','steven.king@sqltutorial.org','515.123.4567','1987-06-17',4,24000.00,NULL,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (101,'Neena','Kochhar','neena.kochhar@sqltutorial.org','515.123.4568','1989-09-21',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (102,'Lex','De Haan','lex.de haan@sqltutorial.org','515.123.4569','1993-01-13',5,17000.00,100,9);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (103,'Alexander','Hunold','alexander.hunold@sqltutorial.org','590.423.4567','1990-01-03',9,9000.00,102,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (104,'Bruce','Ernst','bruce.ernst@sqltutorial.org','590.423.4568','1991-05-21',9,6000.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (105,'David','Austin','david.austin@sqltutorial.org','590.423.4569','1997-06-25',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (106,'Valli','Pataballa','valli.pataballa@sqltutorial.org','590.423.4560','1998-02-05',9,4800.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (107,'Diana','Lorentz','diana.lorentz@sqltutorial.org','590.423.5567','1999-02-07',9,4200.00,103,6);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (108,'Nancy','Greenberg','nancy.greenberg@sqltutorial.org','515.124.4569','1994-08-17',7,12000.00,101,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (109,'Daniel','Faviet','daniel.faviet@sqltutorial.org','515.124.4169','1994-08-16',6,9000.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (110,'John','Chen','john.chen@sqltutorial.org','515.124.4269','1997-09-28',6,8200.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (111,'Ismael','Sciarra','ismael.sciarra@sqltutorial.org','515.124.4369','1997-09-30',6,7700.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (112,'Jose Manuel','Urman','jose manuel.urman@sqltutorial.org','515.124.4469','1998-03-07',6,7800.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (113,'Luis','Popp','luis.popp@sqltutorial.org','515.124.4567','1999-12-07',6,6900.00,108,10);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (114,'Den','Raphaely','den.raphaely@sqltutorial.org','515.127.4561','1994-12-07',14,11000.00,100,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (115,'Alexander','Khoo','alexander.khoo@sqltutorial.org','515.127.4562','1995-05-18',13,3100.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (116,'Shelli','Baida','shelli.baida@sqltutorial.org','515.127.4563','1997-12-24',13,2900.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (117,'Sigal','Tobias','sigal.tobias@sqltutorial.org','515.127.4564','1997-07-24',13,2800.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (118,'Guy','Himuro','guy.himuro@sqltutorial.org','515.127.4565','1998-11-15',13,2600.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (119,'Karen','Colmenares','karen.colmenares@sqltutorial.org','515.127.4566','1999-08-10',13,2500.00,114,3);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (120,'Matthew','Weiss','matthew.weiss@sqltutorial.org','650.123.1234','1996-07-18',19,8000.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (121,'Adam','Fripp','adam.fripp@sqltutorial.org','650.123.2234','1997-04-10',19,8200.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (122,'Payam','Kaufling','payam.kaufling@sqltutorial.org','650.123.3234','1995-05-01',19,7900.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (123,'Shanta','Vollman','shanta.vollman@sqltutorial.org','650.123.4234','1997-10-10',19,6500.00,100,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (126,'Irene','Mikkilineni','irene.mikkilineni@sqltutorial.org','650.124.1224','1998-09-28',18,2700.00,120,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (145,'John','Russell','john.russell@sqltutorial.org',NULL,'1996-10-01',15,14000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (146,'Karen','Partners','karen.partners@sqltutorial.org',NULL,'1997-01-05',15,13500.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (176,'Jonathon','Taylor','jonathon.taylor@sqltutorial.org',NULL,'1998-03-24',16,8600.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (177,'Jack','Livingston','jack.livingston@sqltutorial.org',NULL,'1998-04-23',16,8400.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (178,'Kimberely','Grant','kimberely.grant@sqltutorial.org',NULL,'1999-05-24',16,7000.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (179,'Charles','Johnson','charles.johnson@sqltutorial.org',NULL,'2000-01-04',16,6200.00,100,8);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (192,'Sarah','Bell','sarah.bell@sqltutorial.org','650.501.1876','1996-02-04',17,4000.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (193,'Britney','Everett','britney.everett@sqltutorial.org','650.501.2876','1997-03-03',17,3900.00,123,5);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (200,'Jennifer','Whalen','jennifer.whalen@sqltutorial.org','515.123.4444','1987-09-17',3,4400.00,101,1);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (201,'Michael','Hartstein','michael.hartstein@sqltutorial.org','515.123.5555','1996-02-17',10,13000.00,100,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (202,'Pat','Fay','pat.fay@sqltutorial.org','603.123.6666','1997-08-17',11,6000.00,201,2);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (203,'Susan','Mavris','susan.mavris@sqltutorial.org','515.123.7777','1994-06-07',8,6500.00,101,4);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (204,'Hermann','Baer','hermann.baer@sqltutorial.org','515.123.8888','1994-06-07',12,10000.00,101,7);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (205,'Shelley','Higgins','shelley.higgins@sqltutorial.org','515.123.8080','1994-06-07',2,12000.00,101,11);
INSERT INTO employees(employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,manager_id,department_id) VALUES (206,'William','Gietz','william.gietz@sqltutorial.org','515.123.8181','1994-06-07',1,8300.00,205,11);

--- dependents ---

INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (1,'Penelope','Gietz','Child',206);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (2,'Nick','Higgins','Child',205);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (3,'Ed','Whalen','Child',200);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (4,'Jennifer','King','Child',100);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (5,'Johnny','Kochhar','Child',101);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (6,'Bette','De Haan','Child',102);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (7,'Grace','Faviet','Child',109);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (8,'Matthew','Chen','Child',110);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (9,'Joe','Sciarra','Child',111);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (10,'Christian','Urman','Child',112);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (11,'Zero','Popp','Child',113);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (12,'Karl','Greenberg','Child',108);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (13,'Uma','Mavris','Child',203);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (14,'Vivien','Hunold','Child',103);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (15,'Cuba','Ernst','Child',104);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (16,'Fred','Austin','Child',105);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (17,'Helen','Pataballa','Child',106);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (18,'Dan','Lorentz','Child',107);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (19,'Bob','Hartstein','Child',201);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (20,'Lucille','Fay','Child',202);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (21,'Kirsten','Baer','Child',204);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (22,'Elvis','Khoo','Child',115);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (23,'Sandra','Baida','Child',116);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (24,'Cameron','Tobias','Child',117);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (25,'Kevin','Himuro','Child',118);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (26,'Rip','Colmenares','Child',119);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (27,'Julia','Raphaely','Child',114);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (28,'Woody','Russell','Child',145);
INSERT INTO dependents(dependent_id,first_name,last_name,relationship,employee_id) VALUES (29,'Alec','Partners','Child',146);

--- SELECT STATEMENT ---

SELECT * FROM employees

--- AS STATEMENT ---

SELECT first_name AS 'NAME', last_name AS 'LAST NAME', email AS 'EMAIL', salary*2 AS 'NEW SALARY' FROM employees

--- ORDER BY ---

SELECT first_name AS 'NAME', salary AS 'SALARY' 
FROM employees 
ORDER BY salary DESC,
         first_name ASC

--- SELECT DISTINCT | NULL VALUES ---

SELECT salary FROM employees
ORDER BY salary DESC -- Total 40 rows

SELECT DISTINCT salary FROM employees
ORDER BY salary ASC -- Total 33 rows

SELECT phone_number FROM employees -- Total 40 rows and there are many NULL values

SELECT DISTINCT phone_number FROM employees  -- total 35 and we have one NULL value

--- SQL LIMIT OFFSET ---

SELECT employee_id, first_name, last_name FROM employees ORDER BY first_name

-- Without using OFFSET, the limit starts from the beginning like Adam
SELECT employee_id, first_name, last_name FROM employees ORDER BY first_name LIMIT 6

-- But with OFFSET the limit skips the first 3 rows, then it select next 6 rows. 
SELECT employee_id, first_name, last_name FROM employees ORDER BY first_name LIMIT 6 OFFSET 3

-- The short version of the LIMIT OFFSET, here 3 is OFFSET 
SELECT employee_id, first_name, last_name FROM employees ORDER BY first_name LIMIT 3, 6

-- Use SQL LIMIT to get the top N rows with the highest or lowest value, the highest salary is 24000

SELECT employee_id, salary, first_name, last_name FROM employees
ORDER BY salary DESC

-- to get the first highest salary => 24000
SELECT employee_id, salary, first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 1

-- to get the second highest salary => 17000
SELECT employee_id, salary, first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 1

-- to get the third highest salary => 17000, here is the same but we can use subquery
SELECT employee_id, salary, first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2

SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary = (SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 1,1)

-- OR to get the minimum salary => 2500
SELECT employee_id, salary, first_name, last_name FROM employees
ORDER BY salary ASC
LIMIT 1

-- WHERE CLAUSE
SELECT DISTINCT employee_id, salary, first_name, last_name FROM employees
WHERE salary >= 13000
ORDER BY salary ASC

SELECT DISTINCT employee_id, salary, first_name, last_name FROM employees
WHERE last_name ='King'

SELECT * FROM employees
WHERE manager_id IS NULL

SELECT * FROM employees
WHERE hire_date >= '1998-05-05'
ORDER BY hire_date ASC

-- YEAR FUNCTION ---
--- Select hire_date if the year is 1998 or 2000 --

SELECT employee_id, first_name, last_name, hire_date FROM employees
WHERE YEAR(hire_date) = 1998 OR YEAR(hire_date) = 2000
ORDER BY hire_date ASC

--- BETWEEN CLAUSE ---
 SELECT employee_id, first_name, last_name, hire_date FROM employees
 WHERE hire_date BETWEEN  '1998-01-01' AND '2000-01-01' 
 ORDER BY hire_date DESC


--- COMPERASION OPERATORS, equal, not equal to, greater than, greater than or equal to, less than, less than or equal to ---

SELECT * FROM employees


SELECT first_name, salary, job_id FROM employees
WHERE job_id = 13
ORDER BY salary ASC

SELECT first_name, salary, job_id FROM employees
WHERE job_id <> 16 AND job_id <> 19
ORDER BY job_id DESC

SELECT  first_name, salary, job_id FROM employees
WHERE job_id > 17
ORDER BY job_id DESC

SELECT  first_name, salary, job_id FROM employees
WHERE job_id >= 17
ORDER BY job_id DESC

SELECT  first_name, salary, job_id FROM employees
WHERE job_id < 10
ORDER BY job_id DESC

SELECT  first_name, salary, job_id FROM employees
WHERE job_id <= 10
ORDER BY job_id DESC

---  SQL LOGICAL OPERATOR => ALL ANY AND BETWEEN EXISTS IN LIKE NOT OR SOME  ---

--- ALL operator compares a value to all values in another value set
--- Find all employees whose salaries are greater than all salaries of employees in the departement 8
--- There is a difference between ALL and ANY operator. For ALL operator, 
--  ALL operator takes max salary from subquery but in ANY operator it takes any salary which is greater than min or max salary of the subquery

-- First subquery => here the min salary is 6200, max salary is 14000
SELECT salary FROM employees
WHERE department_id = 8
ORDER BY salary

-- Then main query
SELECT first_name, last_name, salary, employee_id, department_id FROM employees
WHERE salary >= 
ALL (SELECT salary FROM employees
WHERE department_id = 8
ORDER BY salary)

--- ANY operator compares a value to any value in a set according to the condition
--- ANY operator, first subquery takes all salaries in the department 8, the main query returns all salaries which are greter than any salary.
--  The range for the subquery changes between 6200 and 14000 and main query will return the salaries greater than 6200 and 14000

--  subquery
SELECT salary FROM employees
WHERE department_id = 8
ORDER BY salary

--  main query
SELECT first_name, last_name, salary, employee_id, department_id FROM employees
WHERE salary >= 
ANY (SELECT salary FROM employees
WHERE department_id = 8
ORDER BY salary)


-- ANY query another example => find all employees whose salaries are greater than the average salary of every department.

-- subquery finds all average salary according to the each departement , min 4150, max 19333
SELECT department_id, AVG(salary) AS AVGsalaryDep FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC

-- main query, ANY operator will return any salary greter than 4150 and 19333
SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees 
WHERE salary >= ANY(SELECT AVG(salary) AS AVGsalaryDep FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
)

-- main query ALL operator, will return ALL values greter than just max value 19333

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees 
WHERE salary >= ALL(SELECT AVG(salary) AS AVGsalaryDep FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
)

--- Find all employees whose salaries are greater than 5000 and less than 7000
SELECT employee_id, first_name, last_name, salary FROM employees
WHERE salary >= 5000 AND salary <= 7000 
ORDER BY salary

-- BETWEEN operators

-- Find all employees whose salary is between 8500 and 10000

SELECT DISTINCT employee_id, salary, first_name, last_name FROM employees
WHERE salary BETWEEN 8500 AND 10000
ORDER BY first_name ASC

-- SQL EXISTS/NOT EXISTS / EXISTS and NULL Operator => allows you to specify a subquery to test for the existence of rows. EXISTS (subquery)
-- EXISTS operator terminates the query processing immediately once it finds a row. 
-- EXISTS operator returns true if the subquery contains any rows. Otherwise, it returns false. 

-- We will use the employees and dependents tables. Find all employees who have at least one dependent.

-- subquery
SELECT dependent_id, employee_id FROM dependents
ORDER BY dependent_id ASC

-- main query 
SELECT employee_id, first_name, last_name, email FROM employees
WHERE EXISTS (SELECT 1 FROM dependents
WHERE employees.employee_id = dependents.employee_id)
ORDER BY first_name

-- SQL NOT EXISTS => the following query finds employees who do not have any dependents

SELECT employee_id, first_name, last_name FROM employees
WHERE NOT EXISTS( SELECT 1 FROM dependents
WHERE employees.employee_id = dependents.employee_id)

-- SQL EXISTS AND NULL => If the subquery returns NULL, the EXISTS operator still returns the result set. 
-- This is because the EXISTS operator only checks for the existence of row returned by the subquery. It does not matter if the row is NULL or not. 

SELECT employee_id, first_name, last_name FROM employees
WHERE EXISTS (SELECT NULL)
ORDER BY first_name, last_name

-- SQL IN Operator => It returns true if a value is in a set of values or false otherwise

SELECT employee_id, first_name, last_name, job_id FROM employees
WHERE job_id IN(5, 6, 7)
ORDER BY job_id

SELECT employee_id, first_name, last_name FROM employees
WHERE employee_id NOT IN (201, 202, 203)
ORDER BY employee_id DESC

-- SQL IN Operator with subquery

-- subquery returns the departement id of the Marketing and Sales

-- 1) subquery
SELECT department_id FROM departements
WHERE department_name = 'Marketing' OR department_name = 'Sales'

-- 2) Then we can pass the id list to the IN operator to find employees who work in the Marketing and Sales departments

SELECT employee_id, first_name, last_name FROM employees
WHERE department_id IN(2, 8)

-- We did it separaetaly but we can use subquery to combine the two queries

SELECT employee_id, first_name, last_name FROM employees
WHERE department_id IN (SELECT department_id FROM departements
WHERE department_name = 'Marketing' OR department_name = 'Sales')

-- SQL LIKE OPERATOR => tests whether an expression matches the pattern, two wildcard characters to make a pattern.
-- % wildcard matches zero, one or more characters, _ wildcard matches a single character

SELECT * FROM employees

-- Select first_name starts with "sh"

SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'Sh%'

-- Select first name ends with "an"

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '%an'

-- select first name contains "ch"
SELECT first_name, last_name FROM employees
WHERE first_name LIKE '%ch%'

-- SELECT first name with 3 letters  and in the middle there is 'e' letter

SELECT first_name, last_name FROM employees
WHERE first_name LIKE '_e_'

--- NOT LIKE 

SELECT first_name, last_name FROM employees
WHERE first_name NOT LIKE '%an' AND first_name NOT LIKE '%am' AND first_name NOT LIKE '%en' 

-- SQL IS NULL operator 

SELECT first_name, last_name, phone_number, manager_id FROM employees
WHERE manager_id IS NULL

SELECT first_name, last_name, phone_number, manager_id FROM employees
WHERE manager_id IS NOT NULL

---- SQL ALIAS, for field name and for table 
---- For example AS, but you do not to use AS, you can write it directl, if you have a space, you must use double or single qoute


--- Field name alias
SELECT first_name AS NAME,  /* using AS without quote */
       last_name AS 'LAST NAME', /* using AS /with quote */
       salary*1.1 'NEW SALARY' /* without AS */
FROM employees
WHERE salary >= 10000  -- Here if I use WHERE 'NEW SALARY' >= 10000, the sql server does not know alias
ORDER BY 'NEW SALARY'  ASC -- But here for ORDER BY, I can use my ALIAS

--- Table alias

SELECT e.first_name, e.last_name 
FROM employees AS e
ORDER BY first_name

--- If you have two common fields which come from the different tables, you can use alias for both of them
--  If I use ON operator, all the results are the same for two filds
SELECT e.department_id, d.department_id 
FROM employees AS e 
INNER JOIN  departements AS d ON e.department_id = d.department_id
ORDER BY e.department_id  DESC 

SELECT e.department_id, d.department_id 
FROM employees AS e 
INNER JOIN  departements AS d 
ORDER BY e.department_id  DESC 

--- SQL INNER JOIN

--- join two tables employees and departments

select * from employees

select * from departements

-- department_id is common field

SELECT e.first_name, e.last_name, e.employee_id, e.department_id, d.department_id
FROM employees AS e
INNER JOIN departements AS d
ON e.department_id = d.department_id
WHERE e.department_id IN(6,7,9)
ORDER BY e.department_id

--- INNER JOIN with three tables => jobs, employees, departments

select * from employees -- department_id, job_id

select * from departements -- department_id

select * from jobs -- job_id

SELECT j.job_id, e.job_id, d.department_id, e.department_id, e.employee_id, e.first_name
FROM employees AS e
INNER JOIN departements AS d
ON e.department_id = d.department_id
INNER JOIN jobs AS j
ON j.job_id = e.job_id

--- LEFT JOIN

-- left join two table, for example countries and locations tables, each location belongs to one country while each country can have many locations
-- The relationship is one to many, we selected all countries, if they have a city, we will see it, if they have not a city, we will see NULL value

select * from countries  -- one country

select * from locations  -- many locations

SELECT c.country_name, c.country_id, l.country_id, l.city 
FROM countries AS c
LEFT JOIN locations AS l
ON c.country_id = l.country_id
ORDER BY country_name

-- Left join three tables => regions, countries, locations

select * from countries  -- one country, bir ulkede bir cok locations var

select * from locations  -- many locations

select * from regions  -- one regions, region is kita, bir kitada bir suru ulke var

-- First regions(kita) => countries => locations

SELECT c.country_name, c.country_id, c.region_id, r.region_id, r.region_name, l.country_id, l.location_id
FROM regions AS r
LEFT JOIN countries  AS c ON c.region_id = r.region_id
LEFT JOIN locations AS l ON c.country_id = l.country_id
ORDER BY region_name ASC

--- SQL SELF JOIN, we join a table to itself, we can use inner join or left join
--- Par example employee table

-- concatination sql SERVER
-- SELECT e.first_name || ' ' || e.last_name AS employees, m.first_name || ' ' || m.last_name AS managers
-- FROM employees AS e
-- INNER JOIN employees AS m
-- ON m.employee_id = e.manager_id
-- ORDER BY managers


SELECT CONCAT(e.first_name, ' ', e.last_name) AS employees, CONCAT(m.first_name, ' ',  m.last_name) AS managers
FROM employees AS e
INNER JOIN employees AS m
ON m.employee_id = e.manager_id
ORDER BY managers

-- Here Steven King has not a manager_id because he is president. To include it use left join
SELECT CONCAT(e.first_name, ' ', e.last_name) AS employees, CONCAT(m.first_name, ' ',  m.last_name) AS managers
FROM employees AS e
LEFT JOIN employees AS m
ON m.employee_id = e.manager_id
ORDER BY managers

-- FULL OUTER JOIN

-- IN MYSQL server, FULL OUTER JOIN is not provided, but you can use UNION which means the combination of the LEFT and RIGHT join

-- For example create two new tables
CREATE TABLE fruits(
    fruit_id INTEGER PRIMARY KEY,
    fruit_name VARCHAR(25) NOT NULL,
    basket_id INT
)

CREATE TABLE baskets(
    basket_id INT PRIMARY KEY,
    basket_name VARCHAR(255) NOT NULL
)

INSERT INTO fruits (fruit_id, fruit_name, basket_id) 
VALUES (1, 'Apple', 1), (2, 'Orange', 1), (3, 'Banana', 2), (4, 'Strawberry', NULL)


INSERT INTO baskets (basket_id, basket_name) 
VALUES (1, 'A'), (2, 'B'), (3, 'C'), (4, 'D')

-- In left outer join, we have all fruits but we don't have all baskets
SELECT * FROM fruits
LEFT OUTER JOIN baskets
ON fruits.basket_id = baskets.basket_id

-- In right outer join, we have all baskets but we don't have all fruits
SELECT * FROM fruits
RIGHT OUTER JOIN baskets
ON fruits.basket_id = baskets.basket_id

--- UNION = LEFT JOIN + RIGHT JOIN

SELECT * FROM fruits
LEFT OUTER JOIN baskets
ON fruits.basket_id = baskets.basket_id
UNION
SELECT * FROM fruits
RIGHT OUTER JOIN baskets
ON fruits.basket_id = baskets.basket_id


---  CROSS JOIN => we do not to use the common field and ON operator. CROSS JOIN, returns all possibilities
SELECT * FROM fruits
CROSS JOIN baskets


-- GROUP BY

-- employees and departments tables, we have same department_id, GROUP BY returns together like group

SELECT * FROM departements

SELECT * FROM employees

SELECT CONCAT(first_name, ' ', last_name) AS NAME, employee_id, department_id FROM employees
GROUP BY CONCAT(first_name, ' ', last_name), employee_id, department_id
ORDER BY department_id

-- Use COUNT() function to count the number of employees by department
SELECT department_id, COUNT(employee_id) 'NUMBER OF EMPLOYEES' FROM employees
GROUP BY department_id
ORDER BY department_id DESC

--- GROUP BY WITH INNER JOIN
SELECT department_name, COUNT(employee_id) AS 'EMPLOYEE NUMBER' FROM employees AS e 
INNER JOIN departements d ON e.department_id = d.department_id
GROUP BY department_name
ORDER BY department_name


--- GROUP BY with HAVING claus which works like WHERE clause
SELECT department_name, COUNT(employee_id) AS 'EMPLOYEE NUMBER' FROM employees AS e 
INNER JOIN departements d ON e.department_id = d.department_id
GROUP BY department_name
HAVING  COUNT(employee_id) > 5
ORDER BY department_name

--- GROUP BY with MIN, MAX, AVG 

-- Find minimum salary of employees in each department

SELECT salary, department_id FROM employees

SELECT MIN(salary) AS 'MIN SALARY', employee_id, department_id FROM employees
GROUP BY employee_id, department_id 

-- Find maximum salary of employees in each department

SELECT MAX(salary) AS 'MAX SALARY', employee_id, department_id FROM employees 
GROUP BY employee_id, department_id

-- Find average salary of employees in each department, use ROUND function also

SELECT AVG(salary) AS 'AVERAGE SALARY', department_id FROM employees
GROUP BY department_id

--- Use INNER JOIN with functions AVG, MIN, MAX
SELECT * FROM departements

SELECT * FROM employees

SELECT d.department_name, MIN(salary) AS 'MIN SALARY', Max(salary) AS 'MAX SALARY', ROUND(AVG(salary), 2) AS 'AVERAGE SALARY'
FROM employees AS e
INNER JOIN departements AS d
ON e.department_id = d.department_id
GROUP BY department_name

--- SQL GROUP BY with SUM function

SELECT d.department_name, SUM(salary) AS 'TOTAL SALARY' FROM employees AS e 
INNER JOIN departements AS d
ON e.department_id = d.department_id
GROUP BY department_name

--- SQL GROUP BY multiple columns
--- group employees by values department_name, job_id

SELECT department_name, job_id, COUNT(employee_id)
FROM employees AS e
INNER JOIN departEments d 
ON e.department_id = d.department_id
GROUP BY department_name, job_id

--- SQL GROUPING SETS

--- First create a table 'inventory'

drop table inventroy

CREATE TABLE inventory (
    warehouse VARCHAR(255),
    product VARCHAR(255) NOT NULL,
    model VARCHAR(50) NOT NULL,
    quantity INT,
    PRIMARY KEY (warehouse, product, model)
)

INSERT INTO inventory(warehouse, product, model, quantity)
VALUES('San Jose', 'iPhone','6s',100),
('San Fransisco', 'iPhone','6s',50),
('San Jose','iPhone','7',50),
('San Fransisco', 'iPhone','7',10),
('San Jose','iPhone','X',150),
('San Fransisco', 'iPhone','X',200),
('San Jose','Samsung','Galaxy S',200),
('San Fransisco','Samsung','Galaxy S',200),
('San Fransisco','Samsung','Note 8',100),
('San Jose','Samsung','Note 8',150);

--- GROUPING SETS, it is a set of columns by which you group using the GROUP BY clause
--- It defines a grouping set (warehouse, product), it returns the number of stock 
SELECT * FROM inventory

SELECT warehouse, product, SUM(quantity) 'SUM QUANTITY'
FROM inventory
GROUP BY warehouse, product

--- The following query finds the number of quantity by the warehouse, it defines the grouping set (warehouse)

SELECT warehouse, SUM(quantity) 'TOTAL QUANTITY' FROM inventory
GROUP BY warehouse

--- The following query returns the number of quantity by the product, it defines the grouping set (product)

SELECT product, SUM(quantity) 'TOTAL QUANTITY' FROM inventory
GROUP BY product

-- The following query finds the number of quantity for all warehouses and products. It defines an empty grouping set()

SELECT SUM(quantity) 'TOTAL QUANTITY' FROM inventory

--- GROUP BY ROLL , we use ROLLUP to generate multiple grouping sets, the ROLLUP is an extension of the GROUP BY clause
--- ROLLUP option allows you to include extra rows that represent the subtotals. 

SELECT warehouse, product, SUM(quantity) 'SUM QUANTITY'
FROM inventory
GROUP BY ROLLUP(warehouse, product)

SELECT warehouse, SUM(quantity) 'TOTAL QUANTITY' FROM inventory
GROUP BY ROLLUP (warehouse)

--- The following query returns the number of quantity by the product, it defines the grouping set (product)

SELECT product, SUM(quantity) 'TOTAL QUANTITY' FROM inventory
GROUP BY ROLLUP(product)

--- MYSQL SUBQUERY 

--- Find all employees who locate in the location with the id 1700.

--- employee_id, department_id
SELECT * FROM employees

--- department_id, location_id
SELECT * FROM departements 

--- location_id
SELECT * FROM locations

--- Normally, I can do it like that
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.location_id, l.location_id
FROM employees AS e
INNER JOIN departements AS d ON e.department_id = d.department_id 
INNER JOIN locations AS l ON d.location_id = l.location_id
WHERE l.location_id = 1700
ORDER BY first_name

--- WITH SUBQUERY

--- sub query, we find department_ids where location_id is 1700
SELECT department_id from departements
WHERE location_id = 1700

--- main query, then we are using these department_ids in employees table to get the name of the employees
SELECT first_name, employee_id, department_id FROM employees
WHERE department_id IN(1, 3, 9, 10, 11)
order by first_name

--- TOTAL QUERY
SELECT first_name, department_id, employee_id
FROM employees
WHERE department_id IN
(SELECT department_id from departements
WHERE location_id = 1700)

--- COMPARASION OPERATORS WITH SUBQUERY

--- finds the employees who have the highest salary

SELECT first_name, salary, employee_id FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees)

-- Find min salary from employees

SELECT CONCAT(first_name, ' ', last_name), salary FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees)

--- SUBQUERY WITH EXISTS CLAUSE, exists operator checks for the existence of rows returned from the subquery

--- syntax => EXISTS(subquery)

--- Find all departments which have at least one employee with the salary is greater than 10000

select department_name FROM departements AS d
WHERE EXISTS (SELECT  1 FROM employees AS e WHERE  salary > 10000 AND d.department_id = e.department_id)
ORDER BY department_name ASC

--- Second way to find all departments which has the employees that their salary is greater than 10000
--- salary, employee_id, department_id
select * from employees 

--- department_name, department_id
select * from departements 

SELECT department_id FROM employees WHERE salary >10000

SELECT department_name, department_id FROM departements
WHERE department_id IN (SELECT department_id FROM employees WHERE salary >10000)
ORDER BY department_name ASC

-- SQL Subquery with ALL operator, find all employees whose salaries are greater than the lowest salary of every departments

--- First see the min, and max salaries in each department
--- max salary in the department 9 and it is 17000, now we are looking the salary is equal or greater than 17000
-- ALL operator takes max minimum salary in each department


select  min(salary) 'MIN SALARY', max(salary) 'MAX SALARY', department_id from employees
group by  department_id

select first_name, salary FROM employees
where salary >= ALL (select  min(salary) from employees GROUP BY department_id
) GROUP BY first_name, salary

--- Do the same example by using ANY operator, it is the same but ANY operator takes minimum value and select greater than this value in each department. 

select  min(salary) 'MIN SALARY', max(salary) 'MAX SALARY', department_id from employees
group by  department_id


select first_name, salary FROM employees
where salary >= ANY (select  min(salary) from employees GROUP BY department_id
) GROUP BY first_name, salary

--- Find the average of average salary of every department using subquery

--- subquery => First find the average salary of each department

SELECT AVG(salary), department_id AS 'AVERAGE SALARY' FROM employees
GROUP BY department_id

--- main query => now find the average of average salary of each department
--- Here it does not accept the qoutes '' like 'AVERAGE SALARY', so chenge it like avg_salary
--- Here 2 means after comma there are two numbers, 3 there three numbers
--- At the end we have to find a table name like alias AS dep_salary

SELECT ROUND(AVG(avg_salary), 3)
FROM (SELECT AVG(salary) AS avg_salary FROM employees
GROUP BY department_id) AS dep_salary

--- Find the salaries of all employees, their average salary and the difference between the salary of each employee and the average salary using sub query

--- the salaries of all employees
select salary, employee_id, first_name from employees

--- their average salary
select round(avg(salary), 2) as avg_salary_employee from employees

--- the difference between the salary of each employee and the average salary

select employee_id AS ID, CONCAT(first_name, ' ', last_name) as NAME, salary AS SALARY_REEL,
(select  round(avg(salary), 2) from employees) as AVG_SALARY, (salary - (select round(avg(salary)) from employees)) AS 'DIFFERENCE' from employees
ORDER BY DIFFERENCE DESC

--- SQL CORRELATED SUBQUERY => which is subquery that uses values from the outer query

--- Find employees whose salary is greater than the average salary of the employees in their departments

--- find average salary for each department => par example 1 4400 (1 tek salary var)? 2 9500, 3 4150, 4 6500, 5 5886

select round(avg(salary)), department_id from employees
group by department_id order by department_id

--- see all salary and departments => the max salary => 1 4400, 2 13000, 3 11000, 4 6500 (tek), 5 8000 6500 7900 8200

select department_id, salary from employees order by department_id

--- main query 
select first_name, salary, department_id from employees AS e
where salary > (select round(avg(salary), 2) as average_employee from employees
where department_id = e.department_id)
ORDER BY department_id

--- return the employees and the average salary of all employees in their departments

--- sub query 

select round(avg(salary)), department_id from employees
group by department_id order by department_id

--- main query

select employee_id, concat(first_name, ' ', last_name) as 'NAME', department_name, salary,
(select round(avg(salary)) from employees where department_id = e.department_id ) as avg_salary_department
from employees e 
inner join departements d ON d.department_id = e.department_id
order by avg_salary_department

--- SQL correlated subquery with EXISTS operator

-- return all employees who have no dependents

select concat(first_name, ' ', last_name), salary, employee_id from employees

select * from dependents

select concat(first_name, ' ', last_name) NAME, salary, employee_id from employees e 
WHERE NOT EXISTS (select employee_id from dependents d WHERE e.employee_id = d.employee_id )
ORDER BY NAME

--- SQL UNION OPERATOR

--- the UNION operator combines result sets of two or more SELECT statements into a single result set
--- The UNION is different from join that join combines columns of multiple tables while the union combines rows of tables
--- SQL UNION ALL return the duplicate row

--- combine the first and last name of employees and dependents

select * from dependents

select * from employees

select first_name, last_name from employees AS e
UNION
select first_name, last_name from dependents AS d
ORDER BY first_name ASC

--- INTERSECT OPERATOR
--- it is a set operator that returns distinct rows of two or more result sets from SELECT statements
--- Like the UNION operator, the INTERSECT operator removes the duplicate rows from the final set
--- These are records that exists in both table employees and dependents

select employee_id from employees
INTERSECT
select employee_id from dependents

select first_name  from employees
INTERSECT
select first_name from dependents

select first_name, employee_id  from employees order by first_name

select first_name, employee_id from dependents order by first_name


--- SQL CASE => SQL expressions have two formats, simple case, searched case

--- SIMPLE CASE => Find work anniversaries of employees

SELECT first_name, last_name, hire_date,
CASE (2001 - YEAR(hire_date))
WHEN 1 THEN '1 year'
WHEN 3 THEN '3 year'
WHEN 5 THEN '5 year'
WHEN 7 THEN '7 year'
WHEN 9 THEN '9 year'
WHEN 10 THEN '10 year'
WHEN 14 THEN '14 year'
WHEN 20 THEN '20 year'
ELSE 'X year'
END AS employee_anniversary
FROM employees
ORDER BY first_name

--- Searched case => 

SELECT first_name, last_name, 
CASE  
WHEN first_name LIKE 'a_a_' THEN 'The first name is ADAM'
WHEN first_name LIKE 'St%' Then 'The first name is STEVEN'
WHEN first_name LIKE 'Da%' THEN 'The first name is DANIEL or DAVID'
WHEN first_name LIKE '%en%' THEN 'The first name is KAREN or IRENE'
ELSE 'The first name is EMPTY'
END AS 'FIRST NAMES'
FROM employees