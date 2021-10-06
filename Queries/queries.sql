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
