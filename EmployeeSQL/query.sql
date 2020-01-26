-- 1. List employee detail
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
LEFT JOIN salaries as s ON e.emp_no=s.emp_no;

-- 2. List employees who were hired in 1986
SELECT * FROM employees
WHERE hire_date BETWEEN '1986/1/1' AND '1986/12/31'
ORDER BY hire_date;

-- 3. List manager detail
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments as d
JOIN dept_manager as dm ON dm.dept_no=d.dept_no
JOIN employees as e ON e.emp_no=dm.emp_no
ORDER BY d.dept_no, dm.from_date;

-- 3b. List current manager detail
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM departments as d
JOIN dept_manager as dm ON dm.dept_no=d.dept_no
JOIN employees as e ON e.emp_no=dm.emp_no
WHERE dm.to_date = '9999-01-01'
ORDER BY d.dept_no;

-- 4. List department of each employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no;

-- 4b. List current department of current employee
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
WHERE de.to_date = '9999-01-01';

-- 5. List employees whose first name is "Hercules" and last names begin with B
SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- 6. List all employees in the Sales department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_no='d007';

-- 7. List all employees in the Sales and Development department
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
WHERE d.dept_no IN ('d005', 'd007');

-- 8. Count frequency of employee's last name
SELECT last_name, count(last_name) as frequency FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

-- Epilogue
SELECT e.*, d.dept_name, t.title, s.salary
FROM employees as e
JOIN dept_emp as de ON de.emp_no=e.emp_no
JOIN departments as d ON d.dept_no=de.dept_no
JOIN titles as t on t.emp_no=e.emp_no
JOIN salaries as s on s.emp_no=e.emp_no
WHERE e.emp_no=499942;

