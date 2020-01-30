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

-- DATA ANALYSIS
-- 1. List of each employee's number, last name, first name, gender, and salary
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no;
	
-- 2. Employees hired in 1986
SELECT emp_no, first_name, last_name, to_char("hire_date", 'YYYY') as "year" FROM employees
WHERE emp_no IN (
	SELECT emp_no FROM employees
	WHERE to_char("hire_date", 'YYYY') = '1986');

-- 3. Manager of each department
SELECT d.dept_no, s.dept_name, e.emp_no, e.last_name, e.first_name, d.from_date, d.to_date
FROM employees e, dept_manager d, departments s
WHERE (e.emp_no = d.emp_no) AND (d.dept_no = s.dept_no);

-- 4. Department of each employee 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name 
FROM employees e, departments d, dept_employee l
WHERE (e.emp_no = l.emp_no) AND (d.dept_no=l.dept_no);

-- 5. Employees whose first name is "Hercules" and last names begin with "B"
SELECT last_name, first_name FROM employees 
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

-- 6. Employees in the Sales dept
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_employee l
WHERE (e.emp_no = l.emp_no) AND (l.dept_no = d.dept_no) AND d.dept_name = 'Sales'; 

-- 7. Employees in Sales and Development dept
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e, departments d, dept_employee l
WHERE (e.emp_no = l.emp_no) AND (l.dept_no = d.dept_no) 
	AND (d.dept_name = 'Sales' OR d.dept_name = 'Development'); 
	
-- 8. Frequency count of employees
SELECT last_name, COUNT(last_name) AS Frequency FROM employees
GROUP BY last_name ORDER BY COUNT(last_name) DESC;