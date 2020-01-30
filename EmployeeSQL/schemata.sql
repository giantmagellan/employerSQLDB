--TABLE SCHEMATA
-- Creating table for Employee Titles 
create table titles(
	emp_no integer not null primary key,
	title varchar(255) not null,
	from_date date not null,
	to_date date not null);
select * from titles -- display title 

-- Table for Employee Names
create table employees(
	emp_no integer not null primary key,
	birth_date date not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	gender char(1) not null,
	hire_date date not null);
select * from employees -- display table 

-- Table for Department Managers
create table dept_manager(
	dept_no varchar(4) not null,
	emp_no integer not null primary key,
	from_date date not null,
	to_date date not null);
select * from dept_manager -- display table

-- Table for Department Employees
create table dept_employee(
	emp_no integer not null primary key,
	dept_no varchar(4) not null,
	from_date date not null,
	to_date date not null);
select * from dept_employee -- display table

-- Table for Salaries
create table salaries(
	emp_no integer not null primary key,
	salary integer not null,
	from_date date not null,
	to_date date not null);
select * from salaries -- display table

-- Table for Departments
create table departments(
	dept_no varchar(4) not null primary key,
	dept_name varchar(255));
select * from departments -- display table