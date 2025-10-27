-- create employee database
CREATE DATABASE employee;
use employee;

-- create table departments
CREATE TABLE departments (
department_id int,
department_name varchar(100)
);

-- create table location
CREATE TABLE location (
location_id int,
location varchar(30)
);

-- create table employees
CREATE TABLE employees(
employee_id int,
employee_name varchar(50),
gender enum ( 'M' , 'F' ),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

-- alter table employees add to email addresses
ALTER TABLE employees
ADD column email varchar(100);

-- alter table employees - modify
ALTER TABLE employees
MODIFY COLUMN designation varchar(255);

-- drop age
alter table employees
drop column age;

-- rename the hire_date column to date_of_joining
ALTER TABLE employees
RENAME column hire_date TO date_of_joinin;

-- rename table
RENAME TABLE departments TO department_info;
RENAME TABLE location TO locations;

-- table TRUNCATE
TRUNCATE TABLE employees;

-- drop table
DROP TABLE employees;

-- drop database
DROP DATABASE employee;
