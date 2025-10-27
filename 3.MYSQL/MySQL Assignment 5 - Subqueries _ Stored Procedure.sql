-- Subqueries:
-- 1.Single-Row Subqueries:
USE employee;
SELECT employee_name,salary from employees; 
SELECT round(avg(salary),0) from employees; 
SELECT employee_name,salary from employees
WHERE salary  > (SELECT round(avg(salary),0) from employees);

SELECT max(salary) as highest_salary from employees; 
SELECT * from employees
WHERE salary = (SELECT max(salary) as highest_salary from employees);
  
SELECT department_id from employees
WHERE employee_name = 'Arjun Kumar';
SELECT * from employees 
WHERE department_id = (SELECT department_id from employees WHERE employee_name = 'Arjun Kumar');

-- Multi-row subqueries:
SELECT * from departments
WHERE department_name like '%Development%';

select employee_id,employee_name,department_id 
from employees where department_id in (SELECT department_id from departments
WHERE department_name like '%Development%');

-- Stored Procedure:
-- 1.Stored procedure with in parameter:
/*DELIMITER //
CREATE PROCEDURE procedure_name (in parameter datatype)
BEGIN

END//  

DELIMITER ;
*/

DELIMITER //
CREATE PROCEDURE Get_employees_by_department_name (in department_name varchar(100))
BEGIN
    SELECT e.employee_id, e.employee_name, e.department_id 
    FROM employees AS e
    INNER JOIN departments AS d ON e.department_id = d.department_id
    where department_name = ('%IT%' AND '%Human Resources%');
END//  

DELIMITER ;

CALL Get_employees_by_department_name('IT');
CALL Get_employees_by_department_name('Human Resources');

-- 2.Stored Procedure with out parameter:
DELIMITER //

CREATE PROCEDURE Find_employee_birthyear_by_id ( in emp_id int, out brith_year int)
BEGIN
    SELECT YEAR(CURDATE()) - age INTO brith_year
    FROM employees WHERE employee_id = emp_id
    limit 1;
END//  

DELIMITER ;

CALL Find_employee_birthyear_by_id(5004,@brith_year1);
SELECT @brith_year1;

CALL Find_employee_birthyear_by_id(5018,@brith_year2);
SELECT @brith_year2;

CALL Find_employee_birthyear_by_id(5029,@brith_year3);
SELECT @brith_year3;


 SELECT YEAR(CURDATE()) - age 
    FROM employees WHERE employee_id =5004;
    
     SELECT YEAR(CURDATE()) - age 
    FROM employees WHERE employee_id =5018;
     SELECT YEAR(CURDATE()) - age 
    FROM employees WHERE employee_id =5029;