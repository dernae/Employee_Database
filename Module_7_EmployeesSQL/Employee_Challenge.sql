-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______

--INTO nameyourtable
--FROM _______
--ORDER BY _____, _____ DESC;


--DELIVERABLE 1(MODULE7)
--creating a Retirement Titles table that holds all the titles of employees
--born between January 1, 1952 and December 31, 1955.
SELECT e.emp_no,
e.first_name, 
e.last_name,
ti.title,
ti.from_date,
ti.to_date
-- create new table called retirement_titles
INTO retirement_titles
--Abbreviate source tables
FROM employees as e
INNER JOIN titles AS ti
ON(e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no DESC;
-- check table
SELECT*FROM retirement_titles;


-- Use Dictinct with Orderby to remove duplicate rows from retire_titles
SELECT DISTINCT ON (rt.emp_no) 
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title,
rt.from_date,
rt.to_date
-- name new table unique_table
INTO unique_titles
FROM retirement_titles AS rt
-- ordering by emp_no in descending order and to_date by ascending order
ORDER BY emp_no ASC,to_date DESC;
-- check table
SELECT * FROM unique_titles;


-- retrieve the number of employees by their most recent job title who are about to retire.
SELECT COUNT(uq.title),
uq.title
-- name new table
INTO final_retirement_titles
-- abbreviating source table
FROM unique_titles AS uq
-- to get number of employees per department title and ordering from greatest to least
GROUP BY uq.title
ORDER BY count DESC;
-- check table
SELECT * FROM final_retirement_titles;

--DELIVERABLE 2 (MODULE7) 
-- To get all employees eligibile for retirement
-- retrieve the first occurrence of the employee number for each set of rows
SELECT DISTINCT ON(e.emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
ti.title
-- create a new table
INTO mentorship_eligibity
-- Abbreviate source table
FROM employees AS e
--Join the Employees and the Department Employee tables on the primary key.
INNER JOIN dept_emp AS de
ON(e.emp_no = de.emp_no)
--Join the Employees and the Titles tables on the primary key.
INNER JOIN titles AS ti
ON(e.emp_no = ti.emp_no)
--Filter the data on the to_date column to get current employees whose birth dates are between
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
--Order the table by the employee number.
ORDER BY emp_no ASC;
--Check table 
SELECT * FROM mentorship_eligibity;