-- Find employees born from 1952 to 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-10' AND '1955-12-31';

-- Find employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-10' AND '1952-12-31';

-- Find employees born in 1953
SELECT first_name, last_name
FROM employees
WH4RE birth_date BETWEEN '1953-01-10' AND '1953-12-31';

-- Find employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-10' AND '1954-12-31';

-- Find employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-10' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count number of retirement eligible employees
SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility - create table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Look to see what new retirement eligibility table looks like
SELECT * FROM retirement_info;

SELECT * FROM dept_emp;

DROP TABLE retirement_info;

-- Create a new retirement table which includes employee number
SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check content of table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables (with aliases)
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Get retirement info for current employees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date=('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no=de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- New table created for retirement with additional information
SELECT * FROM salaries
ORDER BY to_date DESC;


-- Create new temporary employees table
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no=s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- Find employees born from 1952 to 1955
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-10' AND '1955-12-31';

-- Find employees born in 1952
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-10' AND '1952-12-31';

-- Find employees born in 1953
SELECT first_name, last_name
FROM employees
WH4RE birth_date BETWEEN '1953-01-10' AND '1953-12-31';

-- Find employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-10' AND '1954-12-31';

-- Find employees born in 1954
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-10' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Count number of retirement eligible employees
SELECT COUNT (first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Retirement eligibility - create table
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Look to see what new retirement eligibility table looks like
SELECT * FROM retirement_info;

SELECT * FROM dept_emp;

DROP TABLE retirement_info;

-- Create a new retirement table which includes employee number
SELECT first_name, last_name, emp_no
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check content of table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
	retirement_info.first_name,
	retirement_info.last_name,
	dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables (with aliases)
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Get retirement info for current employees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date=('9999-01-01');

SELECT * FROM current_emp;

-- Employee count by department
SELECT COUNT(ce.emp_no), de.dept_no
INTO count_by_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no=de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- New table created for retirement with additional information
SELECT * FROM salaries
ORDER BY to_date DESC;


-- Create new temporary employees table
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary, de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no=s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-10' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT dm.dept_no,d.dept_name,dm.emp_no,ce.last_name,ce.first_name,dm.from_date,dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- List of retirees with dept_name added
SELECT ce.emp_no,ce.first_name,ce.last_name,d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no=de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no=d.dept_no);

-- Create list of sales departments retirees
SELECT di.emp_no,di.first_name,di.last_name,di.dept_name
FROM dept_info AS di
WHERE (di.dept_name='Sales');

-- Create list of sales and development departments retirees
SELECT emp_no,first_name,last_name,dept_name
FROM dept_infO
WHERE dept_name IN ('Sales','Development');