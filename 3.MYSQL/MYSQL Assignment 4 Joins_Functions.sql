drop database employee;
CREATE DATABASE Employee;
use employee;

CREATE TABLE departments (
department_id int primary key,
department_name varchar(100) not null );

CREATE TABLE location (
location_id int primary key auto_increment,
location varchar(30) not null);

CREATE TABLE employees (
employee_id int,
employee_name varchar(50) not null,
gender enum('M','F') not null,
age int  CHECK (AGE >='18') NOT NULL,
hire_date date DEFAULT (current_date),
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2),
FOREIGN KEY (department_id) REFERENCES departments(department_id),
FOREIGN KEY (Location_id) REFERENCES location(location_id)
);

USE employee;
INSERT into location (location_id,location)
VALUES (1,'chennai'),
	   (2, 'bangalore'),
	   (3, 'hyderabad'),
       (4, 'Pune');
       
INSERT into departments (department_id,department_name)
VALUES (1,'Software Development'),
	   (2, 'Marketing'),
	   (3, 'Data Science'),
       (4, 'Human Resources'),
       (5, 'Product Management'),
       (6, 'Content Creation'),
       (7,'Finance'),
       (8,'Deign'),
       (9,'Research and Development'),
       (10,'Cutomer Support'),
       (11,'Business Development'),
       (12,'IT'),
       (13,'Operations');     
       
INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary) VALUES
    (5001, 'Vihaan Singh', 'M', 27, '2015-01-20', 'Data Analyst', 3, 4, 60000),
    (5002, 'Reyansh Singh', 'M', 31, '2015-03-10', 'Network Engineer', 12, 1, 80000),
    (5003, 'Aaradhya Iyer', 'F', 26, '2015-05-20', 'Customer Support Executive', 10, 2, 45000),
    (5004, 'Kiara Malhotra', 'F', 29, '2015-07-05', NULL, 8, 3, 70000),
    (5005, 'Anvi Chaudhary', 'F', 25, '2015-09-11', 'Business Development Executive', 11, 1, 55000),
    (5006, 'Dhruv Shetty', 'M', 28, '2015-11-20', 'UI Developer', 8, 2, 65000),
    (5007, 'Anushka Singh', 'F', 32, '2016-01-15', 'Marketing Manager', 2, 3, 90000),
    (5008, 'Diya Jha', 'F', 27, '2016-03-05', 'Graphic Designer', 8, 4, 70000),
    (5009, 'Kiaan Desai', 'M', 30, '2016-05-20', 'Sales Executive', 11, 3, 55000),
    (5010, 'Atharv Yadav', 'M', 29, '2016-07-10', 'Systems Administrator', 12, 4, 80000),
    (5011, 'Saanvi Patel', 'F', 28, '2016-09-20', 'Marketing Analyst', 2, 1, 60000),
    (5012, 'Myra Verma', 'F', 26, '2016-11-05', 'Operations Manager', 13, 2, 95000),
    (5013, 'Arnav Rao', 'M', 33, '2017-01-20', 'Customer Success Manager', 10, 3, 75000),
    (5014, 'Vihaan Mohan', 'M', 30, '2017-03-10', 'Supply Chain Analyst', 10, 2, 60000),
    (5015, 'Ishaan Kumar', 'M', 27, '2017-05-20', 'Financial Analyst', 7, 1, 85000),
    (5016, 'Zoya Khan', 'F', 31, '2017-07-05', 'Legal Counsel', 4, 4, 100000),
    (5017, 'Kabir Nair', 'M', 28, '2017-09-11', 'IT Support Specialist', 12, 2, 80000),
    (5018, 'Ishan Mishra', 'M', 25, '2017-11-20', 'Research Scientist', 9, 3, 75000),
    (5019, 'Ishika Patel', 'F', 29, '2018-01-15', 'Talent Acquisition Specialist', 4, 4, 55000),
    (5020, 'Aarav Nair', 'M', 32, '2018-03-05', 'Software Engineer', 1, 1, 90000),
    (5021, 'Advik Kapoor', 'M', 26, '2018-05-20', 'Finance Analyst', 7, 3, 85000),
    (5022, 'Aadhya Iyengar', 'F', 28, '2018-07-10', 'HR Specialist', 4, 4, 60000),
    (5023, 'Anika Paul', 'F', 30, '2018-09-20', 'Public Relations Specialist', 2, 2, 70000),
    (5024, 'Aryan Shetty', 'M', 27, '2018-11-05', 'Product Manager', 5, 1, 95000),
    (5025, 'Avni Iyengar', 'F', 31, '2019-01-20', 'Data Scientist', 3, 4, 100000),
    (5026, 'Vivaan Singh', 'M', 29, '2019-03-10', 'Business Analyst', 3, 2, 75000),
    (5027, 'Ananya Paul', 'F', 32, '2019-05-20', 'Content Writer', 6, 3, 60000),
    (5028, 'Anaya Kapoor', 'F', 26, '2019-07-05', 'Event Coordinator', 6, 1, 60000),
    (5029, 'Arjun Kumar', 'M', 33, '2019-09-11', 'Quality Assurance Analyst', 12, 2, 80000),
    (5030, 'Sara Iyer', 'F', 28, '2019-11-20', 'Project Manager', 5, 1, 90000);
    
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM location;

-- Joins:
-- 1. Inner Join:
SELECT e.employee_name, e.designation, d.department_name
from employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id;

-- 2.Left Join
SELECT  d.department_name, count(employee_id) AS total_employees 
from departments as d
left join employees AS e ON d.department_id = e.department_id
GROUP BY d.department_name;
use employee;
-- 3.Right join
SELECT  l.location,e.employee_name
from employees as e
RIGHT join location AS l ON e.location_id = l.location_id;

-- funcions:
-- 1.Buil-in Numeric Funcions:
SELECT employee_name, ROUND(AVG(age),0) AS avg_age from employees group by employee_name;

SELECT employee_name,salary, ceil(sqrt(salary)) AS square_root_salary from employees group by employee_name,salary;

-- 2.Built-in String Funcions:
SELECT LEFT(location,3) AS first_three_chars from location;

SELECT concat(employee_name,"-",designation ) AS employee_name_designation from employees;

-- 3.Buil-in Dae ime Functions:
SELECT employee_name,YEAR(hire_date) AS year from employees;

SELECT employee_name,hire_date, curdate() AS currentdate, datediff(curdate(),hire_date) as number_of_day from employees;

SELECT employee_name,hire_date, DATE_FORMAT(hire_date,'%d-%m-%Y') as farmat_date from employees;

SELECT employee_name,hire_date, DATE_ADD(hire_date, INTERVAL 3 MONTH) as Employment_confirmaion from employees;

-- 4.User-defined Functions:

use employee;

-- question 
/*Define a function to retrieve the employee count by location name. Find the
employee count for the cities Bangalore and Hyderabad..*/


SELECT COUNT(*) AS employee_count FROM employees,location where location = 'bangalore';
SELECT COUNT(*) AS employee_count FROM employees,location where location = 'hyderabad';

DELIMITER //
CREATE FUNCTION get_employee_count_by_locaion(location_name VARCHAR(100))
RETURNS int
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE employee_count int;
    SELECT COUNT(*) into employee_count
    FROM employees,location 
    where location = location_name;
    RETURN  employee_count;
END //
DELIMITER ;

SELECT get_employee_count_by_locaion('bangalore') AS employee_count;
SELECT get_employee_count_by_locaion('hyderabad') AS employee_count;

/*this is question:
Define a function to retrieve the employee count by location name. Find the
employee count for the cities Bangalore and Hyderabad..
sample output 
 Bangalore cities have employee count is 30
 Hyderabad  cities have employee count is 30
*/


