-- Provide employee info and title for employees born between 1952 and 1955
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
JOIN titles AS t
ON (e.emp_no=t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Retrieve number of employees by their most recent job title who are about to retire
SELECT COUNT(emp_no) AS "People retiring", title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "People retiring" DESC;

-- Create a mentorship-eligible table for employees born in 1965
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees AS e
JOIN dept_emp AS de
ON (e.emp_no=de.emp_no)
JOIN titles AS t
ON(t.emp_no=e.emp_no)
WHERE de.to_date='9999-01-01'AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

-- Total summary of people retiring
SELECT SUM("People retiring")
FROM retiring_titles;


SELECT * FROM mentorship_eligibility;

-- Total summary of people eligible for a mentorship program
SELECT COUNT(emp_no)
FROM mentorship_eligibility;

-- Total summary of people eligible for a mentorship program - group by title
SELECT COUNT(emp_no) AS "Total Count", title
FROM mentorship_eligibility
GROUP BY title
ORDER BY "Total Count" DESC;