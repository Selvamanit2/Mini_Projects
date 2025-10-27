USE employee;
select * from employees;
-- 1.Before insert trigger:

/*Create a before insert trigger 
that automatically sets the salary of an employee 
to the average of all salaries if it's not provided during insertion.
 Test the trigger by attempting to insert a new employee without providing a salary.*/

/*DELIMITER //
CREATE trigger before insert_employee
BEFORE INSERT ON employees
FOR each ROW
BEGIN
END IF;
END //
DELIMITER ;*/

DELIMITER //
CREATE trigger before_insert_employees
BEFORE INSERT ON employees
FOR each ROW
BEGIN
declare avg_salary decimal(10,2);
 if new.salary is null then
 SELECT AVG(salary) INTO avg_salary FROM employees;
 SET NEW.salary = avg_salary;  
END IF;
END //
DELIMITER ;

INSERT INTO employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
VALUES (5031,'Selva Mani','M',24,'2019-03-17','Data Analyst',3,3, null);

-- 2.After Delete Trigger:
/* Create an after delete trigger to prevent the deletion of employees
 who joined in the most recent year. 
 Test the trigger by attempting to delete an employee who joined in the latest year.
*/
DELIMITER //
CREATE trigger After_delect_employees
AFTER DELETE ON employees
FOR each ROW
BEGIN
  DECLARE latest_year INT;
  SELECT MAX(YEAR(hire_date)) INTO latest_year FROM employees;
  IF YEAR(old.hire_date) = latest_year then
  signal sqlstate '45000'
  set message_text = 'cannot delect employee who joined in the most recen year';
END IF;
END //
DELIMITER ;

set SQL_SAFE_UPDATES=0;
delete from employees where employee_id = 5031;