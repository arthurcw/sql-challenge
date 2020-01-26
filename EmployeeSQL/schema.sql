-- Drop tables if exist
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS employees;

-- 1) create departments table and import data
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);

COPY departments
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/departments.csv'
DELIMITER ',' CSV HEADER;

-- 2) create employee table and import data
CREATE TABLE employees (
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	gender VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL
);

COPY employees
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/employees.csv'
DELIMITER ',' CSV HEADER;

-- 3) create department employee table and import data
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

COPY dept_emp
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/dept_emp.csv'
DELIMITER ',' CSV HEADER;

-- 4) create department manager table and import data
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY dept_manager
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/dept_manager.csv'
DELIMITER ',' CSV HEADER;

-- 5) create salaries table and import data
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY salaries
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/salaries.csv'
DELIMITER ',' CSV HEADER;

-- 6) create titles table and import data
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

COPY titles
FROM 'C:/Users/chanwc/Documents/NU_DS_HW/HW7_SQL/data/titles.csv'
DELIMITER ',' CSV HEADER;

