# UDEMY COURSE: SQL - MySQL for Data Analytics and Business Intelligence
# Practice/exercises

# No coding in SECTION 1-4. 

# SECTION 5
# Create database
CREATE DATABASE  IF NOT EXISTS  Sale;  

# Link to database
USE Sale;

# Create tables
CREATE TABLE Sales
(
	purchase_number INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL
);
CREATE TABLE Customers
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT
);

# Two methods to link data base
USE Sale;
SELECT * FROM Sales;

SELECT * FROM Sale.Sales;

# Delete table from SCHEMAS
DROP TABLE Sales;

CREATE TABLE Sales
(
	purchase_number INT NOT NULL AUTO_INCREMENT,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    PRIMARY KEY (purchase_number)
);

DROP TABLE Customers;

CREATE TABLE Customers 
(
	customer_id INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

# SECTION 6
# Primary key constraint
CREATE TABLE Items
(
	item_code VARCHAR(255) PRIMARY KEY,
    item VARCHAR(255),
    unit_price NUMERIC(10,2),
    company_id VARCHAR(255)
);

CREATE TABLE Companies
(
	company_id VARCHAR(255) PRIMARY KEY,
    company_name VARCHAR(255),
    headquarters_phone_number INT(12)
);

DROP TABLE Sales;
DROP TABLE Customers;
DROP TABLE Items;
DROP TABLE Companies; 

CREATE TABLE Customers
(
customer_id INT AUTO_INCREMENT,
	first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255),
    number_of_complaints INT,
    PRIMARY KEY (customer_id)
);

# Add a column
ALTER TABLE Customers
ADD COLUMN gender ENUM('M','F') AFTER last_name;

# Insert information
INSERT INTO Customers (first_name, last_name,gender,email_address,number_of_complaints)
VALUES('John','Mackinley','M','john.mckinley@365careers.com',0)
;

# Unique key constraint
CREATE TABLE Companies
(
	company_id VARCHAR(225) PRIMARY KEY,
    company_name VARCHAR(255) DEFAULT "X",
    headquarters_phone_number VARCHAR(255) UNIQUE KEY
);

# Default values
DROP TABLE Companies;

CREATE TABLE Companies
(
	company_id VARCHAR(225) PRIMARY KEY,
    company_name VARCHAR(255) DEFAULT "X",
    headquarters_phone_number VARCHAR(255) UNIQUE KEY
);

# Not NULL constraint
ALTER TABLE Companies
CHANGE COLUMN headquarters_phone_number headquarters_phone_number VARCHAR(255) NOT NULL;

# Change not NULL to NULL
ALTER TABLE Companies
MODIFY headquarters_phone_number VARCHAR(255) NULL;

# SECTION 7
CREATE TABLE IF NOT EXISTS test (
    numbers 	INT(10),
    words 		VARCHAR(10)
);

/*Comment long*/
# Comment 1
-- Comment 2

# SECTION 8
# Downloaded employees.sql and run it to create employees database.

#SECTION 9 : SQL SELECT statement
USE employees;
SELECT 
    dept_no
FROM
    departments;
SELECT 
    *
FROM
    departments;

SELECT * 
FROM employees
WHERE first_name = "Elvis";

SELECT *
FROM  employees
WHERE first_name = "Kellie" AND gender = "F";

SELECT *
FROM employees
WHERE first_name = "Kellie" OR first_name = "Aruna";

SELECT * 
FROM employees
WHERE gender = "F" AND (first_name = "Kellie" OR first_name = "Aruna");

SELECT *
FROM employees
WHERE first_name IN ("Denis","Elvis");

SELECT *
FROM employees
WHERE first_name NOT IN ('John','Mark','Jacob');

SELECT *
FROM employees
WHERE first_name LIKE('Mark%');

SELECT *
FROM employees
WHERE hire_date LIKE('2000%');

SELECT *
FROM employees
WHERE emp_no LIKE('1000_');

SELECT *
FROM employees
WHERE first_name LIKE('%jack%');

SELECT *
FROM employees
WHERE first_name NOT LIKE ('%jack%');

SELECT * 
FROM salaries
WHERE salary BETWEEN 66000 AND 70000;

SELECT * 
FROM employees
WHERE emp_no NOT BETWEEN 10004 AND 10012;

SELECT dept_name 
FROM departments
WHERE dept_no BETWEEN 'd003' AND 'd006';

SELECT  dept_name
FROM departments
WHERE dept_no IS NOT NULL;

SELECT *
FROM employees
WHERE hire_date >= '2000-01-01' AND gender = 'F';

SELECT *
FROM salaries 
WHERE salary > 150000;

SELECT DISTINCT hire_date
FROM employees;

SELECT COUNT(*)
FROM salaries
WHERE salary >= 100000;

SELECT COUNT(*)
FROM dept_manager;

SELECT * 
FROM employees
ORDER BY hire_date DESC;


SELECT salary, COUNT(emp_no) AS emp_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary;

SELECT emp_no, avg(salary)
FROM salaries
WHERE salary >120000
GROUP BY emp_no
ORDER BY emp_no;

SELECT emp_no, AVG(salary) as avg_salary
FROM salaries
GROUP BY emp_no
HAVING AVG(salary)>120000
ORDER BY emp_no;

SELECT emp_no
FROM dept_emp
WHERE from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(emp_no)>1
ORDER BY emp_no;

SELECT *
FROM dept_emp
LIMIT 100;

#SECTION 10 : SQL INSERT statement 
USE employees;

SELECT * 
FROM titles
LIMIT 10;

INSERT INTO employees
VALUES
(
999903,
'1986-04-21',
'John',
'Smith',
'M',
'1997-10-01'
);

INSERT INTO titles
(emp_no,title,from_date)
VALUES
(999903,'Senior Engineer','1997-10-01');

SELECT *
FROM titles
ORDER BY emp_no DESC;

SELECT *
FROM dept_emp
ORDER BY emp_no DESC
LIMIT 10;

INSERT INTO dept_emp
(emp_no,dept_no,from_date,to_date)
VALUES
(999903,'d005','1997-10-01','9999-01-01');

INSERT INTO departments 
VALUES('d010','Business Analysis');

#Section 11: the UPDATE statement
UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_no = 'd010';

SELECT *
FROM departments
WHERE dept_no = 'd010';